#ifndef LEDDRV_H
#define LEDDRV_H

#define _SUPPRESS_PLIB_WARNING 1
#include <plib.h>
#include <stdint.h>
<<<<<<< HEAD
#include "FreeRTOS.h"
#include "queue.h"
=======
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e

#define d_Led1 0
#define d_Led2 1
#define d_Led3 2

<<<<<<< HEAD

extern QueueHandle_t ledQ;
=======
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
uint8_t d_initializeLedDriver(void);
uint8_t d_readLed(uint8_t);
uint8_t d_setLed(uint8_t, uint8_t);
uint8_t d_toggleLed(uint8_t);

#endif
