/* 
 * File:   ElevatorControl.h
 * Author: zackery.rogers
 *
 * Created on March 20, 2017, 9:07 PM
 */

#ifndef ELEVATORCONTROL_H
#define	ELEVATORCONTROL_H

#define ec_MAX_FLOORS 3
#define ec_TOGGLE_RATE 10


#include "ButtonPollingTask.h"
#include "math.h"
#include "leddrv.h"
extern QueueHandle_t actionQ;
extern uint8_t altitude[];
extern int velocity_max;
extern int velocity_current;
extern int acceleration;

typedef enum {
    Travel_GND,
    Travel_P1,
    Travel_P2,
    Emergency,

} ec_Action;

void ec_InitializeElevatorMainControl();
void ec_ElevatorMainControl();

int ec_CalculateVelocity(int, int);
int ec_CalcTimetoFinalVelocity(int, int);
int ec_CalcDistancetoFinalVelocity(int, int);


#endif	/* ELEVATORCONTROL_H */

