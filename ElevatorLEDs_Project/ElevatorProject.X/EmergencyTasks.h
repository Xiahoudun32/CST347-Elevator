
#ifndef EMERGENCYTASKS_H    
#define EMERGENCYTASKS_H

#include <stdint.h>
#include "FreeRTOS.h"
#include "queue.h"
#include "task.h"

enum ec_floor {GD, P1, P2};
enum dc_door {CLOSE, OPEN};

typedef struct EMR_TASK_PARAMETERS{
    QueueHandle_t emr_uart_rx_queue;
    QueueHandle_t emr_ec_queue;     //Queue to Elevator Control task
} emr_task_parameters;

typedef struct EC_QUEUE_MESSAGE{
    enum ec_floor ec_floor_request;     //Floor to go to
    enum dc_door dc_door_command;       //Open or close door
    uint8_t ec_priority;                //Priority of command (higher number = higher priority)
} ec_queue_message;

typedef struct URX_QUEUE_MESSAGE{
    char command;
} urx_queue_message;

void emr_EmergencyTask(void *pvParameters);

#endif
