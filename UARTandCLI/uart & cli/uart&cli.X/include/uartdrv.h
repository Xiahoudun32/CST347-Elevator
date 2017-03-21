#ifdef ISRUARTDRV_H
#error <d> : UARTDRV cannot be used alongside ISRUARTDRV.
#else

#ifndef UARTDRV_H
#define UARTDRV_H

#define _SUPPRESS_PLIB_WARNING 1
#include <plib.h>
#include <stdint.h>

#include "FreeRTOS.h"

#define d_Led1 0
#define d_Led2 1
#define d_Led3 2

uint8_t d_initializeUARTDriver(UART_MODULE, uint32_t);
uint8_t d_UARTPutC(UART_MODULE, char);
uint8_t d_UARTPutStr(UART_MODULE, char *, int);

#endif

#endif
