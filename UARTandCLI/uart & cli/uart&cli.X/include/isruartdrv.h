#ifdef UARTDRV_H
#error <d> : ISRUARTDRV cannot be used alongside UARTDRV.
#else

#ifndef ISRUARTDRV_H
#define ISRUARTDRV_H

#define _SUPPRESS_PLIB_WARNING 1
#include <plib.h>
#include <stdint.h>

#include "FreeRTOS.h"
#include "semphr.h"
#include "task.h"
#include "queue.h"


/* ---- UART driver configuration ---- */
#define d_MAX_INVOKABLES_RX 5       // Max registered RX functions per priority
#define d_MAX_PRIORITY_RX   5       // Quantity of priorities for registered functions
#define d_UART_BUFFER_DEPTH 200     // Size of UART buffers
#define d_RETURN            0x0D    // Character for a return
#define d_BACKSPACE         0x7F    // Character for a backspace

// Echo received characters?
/*  d_ECHO_RX levels
 *  0 - Do not echo received characters
 *  1 - Echo received characters
 */ #define d_ECHO_RX 1

// Use native passive string builder?
/*  d_NATIVE_BUILDER levels
 *  0 - Do not use native passive string builder
 *  1 - Use native passive string builder
 */ #define d_NATIVE_BUILDER 1
// Note that native builder is registered as an RX invokable

// ---- Post-configure configurations ----
#if (1 == d_NATIVE_BUILDER)
#define d_MAX_INVOKABLES_BUILDER d_MAX_INVOKABLES_RX    // Max builder invokables
#define d_BUILDER_PRIORITY 0                            // Priority of builder
#endif
/* ---- end UART driver configuration ---- */

// Note that the RX parameter is also sent 
// to all registered invokable RX and native passive string builder functions
typedef struct d_rx_parameter {
    QueueHandle_t txQ;
    QueueHandle_t lednQ;
} d_rx_parameter;

typedef struct d_tx_parameter {
    QueueHandle_t txQ;
} d_tx_parameter;

// External global variables
extern SemaphoreHandle_t d_rxT_semaphore;

// Non-task functions
uint8_t d_initializeUARTDriver(UART_MODULE, uint32_t);
int d_register_rx_invokable(int(*)(void *, char), int);
uint8_t d_UARTPutChar(UART_MODULE, char);
uint8_t d_UARTPutStr(UART_MODULE, char *, int);
char d_UARTGetChar(UART_MODULE);

// ISR functions
void d_UART1_ISR();

// Task functions
void d_rx(void *);
void d_tx(void *);

// Configured functions
#if (1 == d_NATIVE_BUILDER)
int d_passivebuilder(void *, char);
void d_register_builder_invokable(int(*)(void *, char *));
#endif

#endif

#endif
