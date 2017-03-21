#include "leddrv.h"

<<<<<<< HEAD
QueueHandle_t ledQ;

uint8_t d_initializeLedDriver(void)
{
    uint8_t success = 1;
=======
uint8_t d_initializeLedDriver(void)
{
    uint8_t success = 1;
    
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
    // Turn off LEDs
    mPORTDClearBits(BIT_0 | BIT_1 | BIT_2);

    // LEDs -> output
    mPORTDSetPinsDigitalOut(BIT_0 | BIT_1 | BIT_2);
    
<<<<<<< HEAD
    ledQ = xQueueCreate(5, sizeof(uint8_t));
    
    
=======
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
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
<<<<<<< HEAD
    
    return 0;
=======
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
}

uint8_t d_toggleLed(uint8_t ledNum)
{
    // Toggle bit
<<<<<<< HEAD
    return mPORTDToggleBits(1 << ledNum);
=======
    mPORTDToggleBits(1 << ledNum);
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
}
