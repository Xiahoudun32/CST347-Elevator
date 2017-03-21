#include "ButtonPollingTask.h"
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
    /*THESE WILL BE GLOBAL IN THE FUTURE. LOCAL FOR NOW
     *
     * The target floor will be modified by the butting polling routine.
     * It will make sure not to update the target floor if the elevator is moving.
     * 
     * Target floor will only be modified by button polling.
     * 
     * Current floor will only be modified by motor controller.
     * 
     * It will be the job of the motor controller routine 
     * to determine the direction the elevator is moving and the 
     * current state the elevator is in(ie. P1, P2, GND, moving).
     * 
     * The butting polling routine will be in charge 
     * 
     * 
     * Future notes. I have not implemented open door logic. IE if 
     */
    int currentFloor = GND;
    int targetFloor = GND;
    
    //GLOBAL PARAM INDICATING EMERGENCY
    int emergencyMode = 0;
    
    
    while(1){
        
        if(!emergencyMode)
        //SW1- p2 button inside car
        {
            if(PORTDbits.RD6==0){
                if(bp_debounce(_PORTD_RD6_MASK, BP_PORTD)){
                    if(currentFloor == P1 || currentFloor == GND){
                        targetFloor = P2;
                    }
                }
            }
            //SW2- p1 button inside car
            else if(PORTDbits.RD7==0){
                if(bp_debounce(_PORTD_RD7_MASK, BP_PORTD)){
                    if(currentFloor==P2 || currentFloor == GND)
                    {
                        targetFloor = P1;
                    }
                }
            }
            //SW3- GD button inside car
            else if(PORTDbits.RD13==0){
                if(bp_debounce(_PORTD_RD13_MASK, BP_PORTD)){
                    if(currentFloor == P2 || currentFloor == P1){
                        targetFloor = GND;
                    }
                }
            }
        }
      
        //set off emergency
        else if(PORTCbits.RC1==0){
            if(bp_debounce(_PORTC_RC1_MASK, BP_PORTC)){
                if(!emergencyMode){
                    targetFloor= GND;
                    emergencyMode  = 1;
                }
            }   
        }
        //clear emergency
        else if(PORTCbits.RC2==0){
            if(bp_debounce(_PORTC_RC2_MASK, BP_PORTC)){
                if(currentFloor == GND) //elevator must be at gnd for emergency clear
                    emergencyMode = 0; 
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
