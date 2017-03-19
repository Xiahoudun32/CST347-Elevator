/* 
 * File:   ButtonPollingTask.h
 * Author: kelly.honsinger
 *
 * Created on March 13, 2017, 2:15 PM
 */

#ifndef BUTTONPOLLINGTASK_H
#define	BUTTONPOLLINGTASK_H
#include <xc.h>
#include <FreeRTOS.h>
#include <task.h>
#include <timers.h>

#define POST_SAMPLE_DELAY 10

typedef enum PORTS{
    BP_PORTD,
    BP_PORTC
};

extern TaskHandle_t bp_TaskHandle;

void bp_config();
void bp_main_task(void * parameters);
int bp_debounce(int sw_num, int chosen_port);
#endif	/* BUTTONPOLLINGTASK_H */

