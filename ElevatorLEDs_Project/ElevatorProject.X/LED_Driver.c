#include "LED_Driver.h"

void LED_DriverInit(void)
{
	mPORTDSetBits(BIT_0 | BIT_1 | BIT_2);
    mPORTDSetPinsDigitalOut(BIT_0 | BIT_1 | BIT_2);
}

void LED_DriverSetLED(uint8_t targetLED, uint8_t value)
{
	if(value)
		mPORTDSetBits(1 << targetLED);
	else
		mPORTDClearBits(1 << targetLED);
}
