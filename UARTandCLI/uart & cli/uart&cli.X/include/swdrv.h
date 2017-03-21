#ifndef SWDRV_H
#define SWDRV_H

#define _SUPPRESS_PLIB_WARNING 1
#include <plib.h>
#include <stdint.h>

#include "FreeRTOS.h"
#include "task.h"

#define d_Switch1 6
#define d_Switch2 7
#define d_Switch3 13

uint8_t d_initializeSwitchDriver(void);
uint8_t d_readSw(uint32_t);
uint8_t d_debounce(uint32_t);

#endif