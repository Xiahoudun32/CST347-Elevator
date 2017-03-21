#ifndef MYTASKS_H
#define MYTASKS_H

#include <stdio.h>
#include <string.h>

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include "leddrv.h"
#include "swdrv.h"
#include "isruartdrv.h"


#define QLEN 20 // Maximum queue depth

// Execute debug task only?
/*  DEBUG_TASK levels
 *  0 - Perform lab requirements
 *  1 - (debug) Perform lab testing
 */
#define DEBUG_TASK 0

/*  DEBUG_VERBOSE levels
 *  0  - Unused
 */
#define DEBUG_VERBOSE 0

typedef struct d_ledn_parameter {
    uint8_t id;
    QueueHandle_t lednQ;
    QueueHandle_t txQ;
} d_ledn_parameter;

typedef struct d_ledn_message {
    uint32_t delay;
} d_ledn_message;

// Test function declarations
#if (1 == DEBUG_TASK)
void d_testFunction(void *);
#endif

// Lab function declarations
#if (0 == DEBUG_TASK)
void d_ledn(void *);
#endif

#endif
