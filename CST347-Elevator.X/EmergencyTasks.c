#include "EmergencyTasks.h"

void emr_EmergencyTask(void *pvParameters)
{
    emr_task_parameters *emr_task_params = (emr_task_parameters *) pvParameters;
    ec_queue_message emr_message_to_ec = {GD, CLOSE, 5};
    urx_queue_message emr_message_from_urx;
    int first = 1;
    
    while(1)
    {
        if (first)      //Only send message once
        {
            xQueueSendToBack(emr_task_params->emr_ec_queue, &emr_message_to_ec, 0);
        }
        first = 0;
        if(uxQueueMessagesWaiting(emr_task_params->emr_ec_queue))       //If get message from elevator control,
        {                                                               //assume elevator is where it should be
            while(1)
            {
                if(uxQueueMessagesWaiting(emr_task_params->emr_uart_rx_queue))  //Wait for Emergency Clear
                {
                    xQueueReceive(emr_task_params->emr_uart_rx_queue, &emr_message_from_urx, 0);
                    if (emr_message_from_urx.command == 'n')
                    {
                        first = 1;
                        break;
                    }
                }
            }
            vTaskSuspend(NULL);     //Suspend self
        }
        
    }
}