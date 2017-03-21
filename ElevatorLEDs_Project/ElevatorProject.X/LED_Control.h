/* 
 * File:   LED_Control.h
 * Author: Michael Cooley
 *
 * Created on March 20, 2017, 6:20 PM
 */

#ifndef LED_CONTROL_H
#define	LED_CONTROL_H

#include "LED_Driver.h"
#include "Defines.h"

typedef enum LED_DoorCommand
{
	OPEN,
	CLOSE
} LED_DoorCommand_t;

// This queue is for receiving LED_DoorCommand's
QueueHandle_t LED_EventQueue;

// You must call this before creating the control task
void LED_TaskInit(void);

// Control Task for LED's
// This task requires no parameters
void LED_TaskControl(void * taskParams);

#endif	/* LED_CONTROL_H */

