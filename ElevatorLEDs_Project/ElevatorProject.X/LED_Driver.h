/* 
 * File:   LED_Driver.h
 * Author: Michael Cooley
 *
 * Created on March 20, 2017, 6:25 PM
 */

#ifndef LED_DRIVER_H
#define	LED_DRIVER_H

#include "Defines.h"

// Sets the LED's as active and output
void LED_DriverInit(void);

// Sets a specific LED to the specified value
void LED_DriverSetLED(uint8_t targetLED, uint8_t value);

#endif	/* LED_DRIVER_H */

