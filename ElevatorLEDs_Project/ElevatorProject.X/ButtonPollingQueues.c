#include "ButtonPollingQueues.h"



QueueHandle_t bp_message_Queue = NULL;

/* bp_queue_config
 * 
 *  This function sets up queues with a depth of 5. Each item
 *  in the queue can be under 20 bytes.
 * 
 *  passed: nothing
 * 
 *  returns: nothing
 */
QueueHandle_t bp_queue_config(){
    bp_message_Queue = xQueueCreate(QUEUE_DEPTH, QUEUE_ITEM_SIZE);
}