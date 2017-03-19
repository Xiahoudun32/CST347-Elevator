/* 
 * File:   ButtonPollingQueues.h
 * Author: kelly.honsinger
 *
 * Created on March 13, 2017, 2:39 PM
 */

#ifndef BUTTONPOLLINGQUEUES_H
#define	BUTTONPOLLINGQUEUES_H

#include <xc.h>
#include <FreeRTOS.h>
#include <queue.h>

#define QUEUE_SIZE 1
#define QUEUE_DEPTH 5


extern QueueHandle_t bp_message_Queue[QUEUE_SIZE];



#endif	/* BUTTONPOLLINGQUEUES_H */

