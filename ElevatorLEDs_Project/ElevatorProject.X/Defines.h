/* 
 * File:   Defines.h
 * Author: Michael Cooley
 * 
 *	This is a singular location for all GLOBAL defines.
 *	Anything that you might want to put into main put here.
 *
 * Created on March 20, 2017, 6:56 PM
 */
#ifndef _DEFINES_H_
#define _DEFINES_H_

#define _SUPPRESS_PLIB_WARNING 1
#define _DISABLE_OPENADC10_CONFIGPORT_WARNING 1

/* Time is measured in "ticks".  The tick rate is set by the configTICK_RATE_HZ
configuration parameter (defined in FreeRTOSConfig.h).  If configTICK_RATE_HZ
is equal to or less than 1000 (1KHz) then portTICK_RATE_MS can be used to 
convert a time in milliseconds into a time in ticks. */
#define mainTOGGLE_PERIOD ( 200UL / portTICK_RATE_MS )

// -- Free RTOS Includes
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "queue.h"

// -- User Includes
#include <stdint.h>
#include <stdbool.h>

// -- Platform Includes
#include <plib.h>
#include <xc.h>

#endif
