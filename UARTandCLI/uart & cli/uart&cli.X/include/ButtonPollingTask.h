/* 
 * File:   ButtonPollingTask.h
 * Author: kelly.honsinger
 *
 * Created on March 13, 2017, 2:15 PM
 */

#ifndef BUTTONPOLLINGTASK_H
#define	BUTTONPOLLINGTASK_H
#define _SUPPRESS_PLIB_WARNING 
#include <plib.h>
#include <FreeRTOS.h>
#include <task.h>
#include <timers.h>



#include "queue.h"

#define POST_SAMPLE_DELAY 10

typedef enum PORTS{
    BP_PORTD,
    BP_PORTC
}PORTS; 

typedef enum FLOORS{
    GND,
    P1,
    P2,
    MOVING//case where elevator isn't processing requests
}FLOORS;

extern TaskHandle_t bp_TaskHandle;

extern int currentFloor;
extern int targetFloor;
extern int emergencyMode;

void bp_config();
void bp_main_task(void * parameters);
int bp_debounce(int sw_num, int chosen_port);
#endif	/* BUTTONPOLLINGTASK_H */

