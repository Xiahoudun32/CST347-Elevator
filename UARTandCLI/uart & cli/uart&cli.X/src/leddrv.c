#include "leddrv.h"

QueueHandle_t ledQ;

uint8_t d_initializeLedDriver(void)
{
    uint8_t success = 1;
    // Turn off LEDs
    mPORTDClearBits(BIT_0 | BIT_1 | BIT_2);

    // LEDs -> output
    mPORTDSetPinsDigitalOut(BIT_0 | BIT_1 | BIT_2);
    
    ledQ = xQueueCreate(5, sizeof(uint8_t));
    
    
    return success;
}

uint8_t d_readLed(uint8_t ledNum)
{
    // Return bit value
    return mPORTDReadBits(1 << ledNum);
}

uint8_t d_setLed(uint8_t ledNum, uint8_t value)
{
    // If value == 0 clear bit
    if(!value)
        mPORTDClearBits(1 << ledNum);
    
    // Else set bit
    else
        mPORTDSetBits(1 << ledNum);
    
    return 0;
}

uint8_t d_toggleLed(uint8_t ledNum)
{
    // Toggle bit
    return mPORTDToggleBits(1 << ledNum);
}
