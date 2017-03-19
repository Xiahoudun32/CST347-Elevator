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

#define QUEUE_ITEM_SIZE 20
#define QUEUE_DEPTH 5


extern QueueHandle_t bp_message_Queue;

QueueHandle_t bp_queue_config();

#endif	/* BUTTONPOLLINGQUEUES_H */

