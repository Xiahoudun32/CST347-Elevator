#include "ButtonPollingQueues.h"



QueueHandle_t bp_message_Queue[QUEUE_SIZE]= {NULL};

QueueHandle_t queueConfig(){
    int i = 0;
    for(i = 0; i < QUEUE_SIZE; i++){
        bp_message_Queue[i] = xQueueCreate(20, QUEUE_DEPTH);
    }
}