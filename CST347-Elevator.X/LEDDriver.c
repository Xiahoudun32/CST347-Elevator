/*************************************************************
* Author:		Francis Bartholomew
* Filename:		leddrv.c
* Date Created:	3/20/2017
**************************************************************/

#define _SUPPRESS_PLIB_WARNING 1

/* various and sundry includes */

#include <stdint.h>
#include <plib.h>
#include "LEDDriver.h"

void initializeLEDDriver(void)
{
    /* Setup the CPU clocks, and configure the interrupt controller. */
    SYSTEMConfigPerformance(configCPU_CLOCK_HZ);
    mOSCSetPBDIV(OSC_PB_DIV_2);
    INTEnableSystemMultiVectoredInt();

    /* LEDs off. */
    mPORTDClearBits(BIT_0 | BIT_1 | BIT_2);

    /* LEDs are outputs. */
    mPORTDSetPinsDigitalOut(BIT_0 | BIT_1 | BIT_2);  
}

uint8_t readLED(uint8_t ledNum)
{
    /* 0 for off, 1 for on; only takes an LED number as a parameter
   0 = LED1 (RD0)
   1 = LED2 (RD1)
   2 = LED3 (Rd2)
     
   So, the point here is that if we go toggling LED values,
   we poke the current state so that it reflects the change.  
     */
   int foo = 0; //I'm an optimist; I'm assuming everything is going to turn out ok
   switch(ledNum) {
   case 0 :
        foo = LED1_STATE;
        break;
   
   case 1 :
        foo = LED2_STATE;
        break;
        
   case 2 :
        foo = LED3_STATE;
        break;

   default:
           //you should never see this
       foo = 5; //because 5 is bad
       break;
       
       return foo;
   }
}

uint8_t setLED(uint8_t ledNum, uint8_t value)
{
    int foo = 1; //this time, I have to assume everything is all wrong bad.
    switch(ledNum){
        case 0 :
            if (value == 0)
            {    
                mPORTDClearBits(BIT_0);
                LED1_STATE = 0;
            }
            else
            {    
                mPORTDSetBits(BIT_0);
                LED1_STATE = 1;
            }
            foo = 0;
            break;
        case 1 :
            if (value == 0)
            {    
                mPORTDClearBits(BIT_1);
                LED2_STATE = 0;
            }
            else
            {    
                mPORTDSetBits(BIT_1);
                LED2_STATE = 1;
            }
            foo = 0;
            break;
        case 2 :
            if (value == 0)
            {    
                mPORTDClearBits(BIT_2);
                LED3_STATE = 0;
            }
            else
            {    
                mPORTDSetBits(BIT_2);
                LED3_STATE = 1;
            }
            foo = 0;
            break;
        default:
           //you should never see this
            foo = 2; //because 2 remains bad
            break;
    }
   return foo;
}

void toggleLED(int8_t ledNum)
{
        mPORTDToggleBits(ledNum);         
}