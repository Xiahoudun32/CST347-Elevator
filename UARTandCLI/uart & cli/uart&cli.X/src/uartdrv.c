#include "uartdrv.h"

uint8_t d_initializeUARTDriver(UART_MODULE umPortNum, uint32_t ui32WantedBaud)
{
    // Set baud rate
    UARTSetDataRate(umPortNum
            , (uint32_t) configPERIPHERAL_CLOCK_HZ
            , ui32WantedBaud);
    
    // Enable transmission
    UARTEnable(umPortNum
            , UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_TX));
    
    return 0;
}

uint8_t d_UARTPutC(UART_MODULE umPortNum, char cByte)
{
    // Wait until ready to transmit
    while(!UARTTransmitterIsReady(umPortNum))
    {
        // Wait 2 ms
        vTaskDelay(2 / portTICK_PERIOD_MS);
    }
    
    // Send byte
    UARTSendDataByte(umPortNum, cByte);
    
    return 0;
}

uint8_t d_UARTPutStr(UART_MODULE umPortNum, char * pString, int iStrLen)
{
    int i;
    for (i = 0; i < iStrLen; ++i)
    {
        d_UARTPutC(umPortNum, pString[i]);
    }
    
    return 0;
}