#include "isruartdrv.h"
#include "myTasks.h"

void __attribute__((interrupt(ipl0), vector(_UART1_VECTOR))) vUART1_ISR_Wrapper(void);

// External global variables
SemaphoreHandle_t d_rxT_semaphore;

// Internal global variables
int (*rx_invokables[d_MAX_PRIORITY_RX][d_MAX_INVOKABLES_RX])(void *, char);
int rx_invokables_quantity[d_MAX_PRIORITY_RX] = { 0 };

// Configured internal global variables
#if (1 == d_NATIVE_BUILDER)
int (*builder_invokables[d_MAX_INVOKABLES_BUILDER])(void *, char *);
int builder_invokables_quantity = 0;

char builder_passivestring[d_UART_BUFFER_DEPTH] = { 0 };
int builder_passivelocation = 0;
#endif

// ---- ---- ---- ---- Task definitions ---- ---- ---- ----
void d_rx(void * arg)
{
    d_rx_parameter * q = (d_rx_parameter *) arg;
    char r[d_UART_BUFFER_DEPTH] = { [0 ... d_UART_BUFFER_DEPTH - 1] = 0 };
    
    while(1)
    {        
        // Wait for an interrupt
        xSemaphoreTake(d_rxT_semaphore, portMAX_DELAY);
        
        // Receive character
        r[0] = d_UARTGetChar(UART1);
        
        // Invoke registered functions
        int i, s;
        for(s = 0; s < d_MAX_PRIORITY_RX; ++s)
        {
            for(i = 0; i < rx_invokables_quantity[s]; ++i)
            {
                // Invoke function, return if function returns non-zero value
                if(rx_invokables[s][i](arg, r[0])) return;
            }
        }
        
#ifdef d_ECHO_RX
        // Echo character
        xQueueSendToBack(q->txQ, &r, portMAX_DELAY);
#endif
    }
}

void d_tx(void * arg)
{
    d_tx_parameter * q = (d_tx_parameter *) arg;
    char str[d_UART_BUFFER_DEPTH] = { [0 ... d_UART_BUFFER_DEPTH - 1] = 0 };
    
    while(1)
    {       
        // Get message from queue
        xQueueReceive(q->txQ, str, portMAX_DELAY);
        
        // Send message on UART module 1
        d_UARTPutStr(UART1, str, strlen(str));
    }
}

// ---- ---- ---- ---- ISR definitions ---- ---- ---- ----
void d_UART1_ISR()
{
    static portBASE_TYPE handle;
    
    // Clear interrupt flag
    INTClearFlag(INT_U1RX);
    
    // Resume task to handle ISR
    handle = xSemaphoreGiveFromISR(d_rxT_semaphore, NULL);
    
    // Force context switch to handler task
    portEND_SWITCHING_ISR(handle);
}

// ---- ---- ---- ---- Configured definitions ---- ---- ---- ----
#if (1 == d_NATIVE_BUILDER)
int d_passivebuilder(void * rx_arg, char r)
{
    int i;
    
    switch(r)
    {
        case d_BACKSPACE:   // Backspace?
            if(builder_passivelocation > 0)
            {
                builder_passivestring[--builder_passivelocation] = '\0';
            }
            break;
        case d_RETURN:      // Carriage return?
            // Invoke registered functions
            
            for(i = 0; i < builder_invokables_quantity; ++i)
            {
                // Invoke function, return if function returns non-zero value
                if(builder_invokables[i](rx_arg, builder_passivestring)) return 1;
            }
            // Reset string
            memset(builder_passivestring, 0, sizeof(builder_passivestring) / sizeof(char));
            builder_passivelocation = 0;
            
            break;
        default:
            // Insert character into string and increment position
            if(builder_passivelocation < d_UART_BUFFER_DEPTH - 1)
            {
                builder_passivestring[builder_passivelocation++] = r;
            }   
    }
    
    return 0;
}

void d_register_builder_invokable(int(*f)(void *, char *))
{
    if(builder_invokables_quantity < d_MAX_INVOKABLES_BUILDER)
    {
        builder_invokables[builder_invokables_quantity++] = f;
    }
}
#endif

// ---- ---- ---- ---- Other definitions ---- ---- ---- ----
uint8_t d_initializeUARTDriver(UART_MODULE uart_module, uint32_t baud_request)
{
//    memset(rx_invokables, 0, ((d_MAX_PRIORITY_RX + 1) * d_MAX_INVOKABLES_RX) 
//            / sizeof(int(*)(void *, char)));
    
    /* ---- Module configuration ----*/
#if (1 == d_NATIVE_BUILDER)
    d_register_rx_invokable(&d_passivebuilder, d_BUILDER_PRIORITY);
#endif
    
    // Create semaphore
    d_rxT_semaphore = xSemaphoreCreateMutex();
    xSemaphoreTake(d_rxT_semaphore, portMAX_DELAY);
    
    // Configure UART
    UARTConfigure(uart_module, UART_ENABLE_PINS_TX_RX_ONLY);
    
    // UART FIFO mode
    UARTSetFifoMode(uart_module, UART_INTERRUPT_ON_TX_NOT_FULL
            | UART_INTERRUPT_ON_RX_NOT_EMPTY);
    
    // UART line control
    UARTSetLineControl(uart_module, UART_DATA_SIZE_8_BITS
            | UART_PARITY_NONE
            | UART_STOP_BITS_1);
    
    // Set baud rate
    UARTSetDataRate(uart_module
            , (uint32_t) configPERIPHERAL_CLOCK_HZ
            , baud_request);
    
    // Enable receive and transmission
    UARTEnable(uart_module
            , UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_TX | UART_RX));
    
    // Set UART interrupt vector priority
    INTSetVectorPriority(INT_VECTOR_UART(uart_module), INT_PRIORITY_LEVEL_2);
    
    // Enable RX interrupt
    INTEnable(INT_SOURCE_UART_RX(uart_module), INT_PRIORITY_LEVEL_2);
    
    return 0;
}

int d_register_rx_invokable(int(*f)(void *, char), int priority)
{
    // Note that a lower value for 'priority' denotes a higher priority level
    int return_val = 0;
    
    //priority = priority - (priority == 0 ? 0 : 1);
    if(rx_invokables_quantity[priority] < d_MAX_INVOKABLES_RX
            && priority >= 0 && priority < d_MAX_PRIORITY_RX)
    {
        rx_invokables[priority][rx_invokables_quantity[priority]++] = f;
    }
    else
    {
        return_val = 1;
    }
    
    return return_val;
}

uint8_t d_UARTPutChar(UART_MODULE umPortNum, char cByte)
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

uint8_t d_UARTPutStr(UART_MODULE uart_module, char * str, int length)
{
    int i;
    
    for (i = 0; i < length; ++i)
    {
        d_UARTPutChar(uart_module, str[i]);
    }
    
    return 0;
}

char d_UARTGetChar(UART_MODULE uart_module)
{
    char r = 0;
    
    // Retrieve data
    r = UARTGetDataByte(uart_module);
    
    return r;
}