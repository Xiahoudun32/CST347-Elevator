/*************************************************************
* Author:		Francis Bartholomew
* Filename:		LEDDriver.h
* Date Created:	3/20/2017
**************************************************************/

#include <stdint.h>

#ifndef _LEDDRIVER_H
#define _LEDDRIVER_H

static int LED1_STATE = 0;
static int LED2_STATE = 0;
static int LED3_STATE = 0;

/*
 * Function: initializeLEDDriver
 * Purpose: driver file to initialize the system; sets the clocks, then
 * sets the LEDs as 'outputs'
 * Inputs: none
 * Outputs: none
 */

void initializeLEDDriver(void);

/*
 * Function: readLED
 * Purpose: this function checks the current state of an LED, taking as an input
 * an integer and returning what state that LED is in.
 * Inputs: ledNum (integer)
 * Outputs: foo (integer; 0 if false, 1 if true) 
 */ 

uint8_t readLED(uint8_t ledNum);

/*
 * Function: setLED
 * Purpose: allows the changing of an LED state, based upon the integer value
 * passed in as a parameter
 * Inputs: ledNum (integer)
 * Outputs: foo (integer; 0 for successful state change, 2 for failure)
 */

uint8_t setLED(uint8_t ledNum, uint8_t value);

/*
 * Function: toggleLED
 * Purpose: flip-flops the current state of an LED based upon the input parameter
 * for the corresponding LED
 * Inputs: ledNum (integer)
 * Outputs: none
 */

void toggleLED(int8_t ledNum);

#endif /* LEDDRIVER_H */