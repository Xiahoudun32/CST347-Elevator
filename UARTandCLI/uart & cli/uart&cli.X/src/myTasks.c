#include "myTasks.h"

// Test function implementations
#if (1 == DEBUG_TASK)
void d_testFunction(void * arg)
{
    char a = 'a';
    char * str = "bcdefg\n\r";
    
    while(1)
    {
        while(d_debounce(d_Switch1)) vTaskDelay(2 / portTICK_PERIOD_MS);
        
        //d_UARTPutC(UART1, a);
        d_UARTPutStr(UART1, str, strlen(str));
        
        while(!d_debounce(d_Switch1)) vTaskDelay(2 / portTICK_PERIOD_MS);
    }
}
#endif

// Lab function implementations
#if (0 == DEBUG_TASK)
void d_ledn(void * arg)
{
    d_ledn_parameter * q = (d_ledn_parameter *) arg;
    d_ledn_message message;
    uint32_t delay = 1000;
    int lock = 1;
    
    while(1)
    {
        // Wait for id of LED to toggle
        if(xQueueReceive(q->lednQ, &message, 0))
        {
            if(message.delay == 0)
            {
                d_setLed(q->id, 0);
                lock = 1;
            }
            else
            {
                delay = message.delay;
                lock = 0;
            }
        }
        if (!lock) d_toggleLed(q->id);
        vTaskDelay(delay / portTICK_PERIOD_MS);
    }
}
#endif
