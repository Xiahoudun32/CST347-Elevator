#include "ButtonPollingTask.h"
#include "queue.h"
#include "ButtonPollingQueues.h"
TaskHandle_t bp_TaskHandle = NULL;

/*
 * pb_main_task:
 *  Function Objective: Polls certain buttons across board.
 *  
 *  passed: void * parameters- I am not passing anything right now, tbd in the future
 *  
 *  returns: Nothing
 */
void bp_main_task(void * parameters){
    
    char sw1Msg[] = "Switch 1 pressed";
    char sw2Msg[] = "Switch 2 pressed";
    char sw3Msg[] = "Switch 3 pressed";
    char rc1Msg[] = "RC1 pressed";
    char rc2Msg[] = "RC2 pressed";
    
    while(1){
        //SW1- p2 button inside car
        if(PORTDbits.RD6==0){
            
            if(bp_debounce(_PORTD_RD6_MASK, BP_PORTD)){
                xQueueSendToBack(bp_message_Queue, sw1Msg, 0);
            }
        }
        //SW2- p1 button inside car
        else if(PORTDbits.RD7==0){
            if(bp_debounce(_PORTD_RD7_MASK, BP_PORTD)){
                xQueueSendToBack(bp_message_Queue, sw2Msg, 0);
            }
        }
        //SW3- GD button inside car
        else if(PORTDbits.RD13==0){
            if(bp_debounce(_PORTD_RD13_MASK, BP_PORTD)){
                xQueueSendToBack(bp_message_Queue, sw3Msg, 0);
            }
        }
        //open door inside car
        else if(PORTCbits.RC1==0){
            if(bp_debounce(_PORTC_RC1_MASK, BP_PORTC)){
                xQueueSendToBack(bp_message_Queue, rc1Msg, 0);
            }
        }
        //close door inside car
        else if(PORTCbits.RC2==0){
            if(bp_debounce(_PORTC_RC2_MASK, BP_PORTC)){
                xQueueSendToBack(bp_message_Queue, rc2Msg, 0);
            }
        }
        vTaskDelay(POST_SAMPLE_DELAY/portTICK_RATE_MS);
    }
   
} 

/* bp_config
 * 
 *  This function configures all of the buttons and switches 
 *  utilized by the elevator.
 * 
 *  passed: nothing
 * 
 * 
 *  returns: nothing
 */
void bp_config(){
    
    PORTDbits.RD6 = 0;
    PORTDbits.RD7 = 0;
    PORTDbits.RD13 = 0;
    
    TRISDbits.TRISD6 = 1;
    TRISDbits.TRISD7 = 1;
    TRISDbits.TRISD13 = 1;
    
    
    PORTCCLR = 0x6;
    TRISCSET = 0x6;     //set  eflight board buttons to input
    
}


/* bp_debounce
 * This function implements a 10 ms debounce into a
 * button polling scheme. 
 * 
 * passed: 
 *      int sw_num- field mask to apply debounce to
 * 
 *      int chosen_port- port switch belongs to. Possible params include 
 *      BP_PORTC or BP_PORTD
 * 
 *returns:
 *      1- button successfully debounced.
 * 
 *      0- debounce fail case.
 */
int bp_debounce(int sw_num, int chosen_port)
{
    portTickType xStartTime = xTaskGetTickCount();
   
    while ((xTaskGetTickCount() - xStartTime) < (10 / portTICK_RATE_MS));
    if(chosen_port==BP_PORTD){
        if(sw_num != (PORTD & sw_num))
        return 1;
    }
    
    else if(chosen_port==BP_PORTC){
        if(sw_num != (PORTC & sw_num))
        return 1;
    }

    return 0;       //otherwise fail case
}
