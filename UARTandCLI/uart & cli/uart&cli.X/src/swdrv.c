#include "swdrv.h"

uint8_t d_initializeSwitchDriver(void)
{
    // Change notification configuration
    uint32_t cn_switches = CN15_PULLUP_ENABLE \
            | CN16_PULLUP_ENABLE \
            | CN19_PULLUP_ENABLE;
    ConfigCNPullups(cn_switches);
    
    // Switch configuration
    uint32_t dgin_switches = BIT_6 | BIT_7 | BIT_13;
    mPORTDSetPinsDigitalIn(dgin_switches);
    
    return 0;
}

uint8_t d_readSw(uint32_t switchNum)
{
    // Return switch value at specified position
    return mPORTDReadBits(1 << switchNum) >> switchNum;
}

uint8_t d_debounce(uint32_t switchNum)
{
    // Set debounce delay to 10 ms
    const TickType_t xDelay = 10 / portTICK_PERIOD_MS;
    
    // Initialize value to 0xFF
    uint8_t value = -1;
    
    while(value == (uint8_t) -1)
    {
        // Read initial switch value
        value = d_readSw(switchNum);
    
        // Delay
        vTaskDelay(xDelay);
    
        // Read next switch value
        value = (value == d_readSw(switchNum) ? value : -1);
    }    
    
    return value;
}