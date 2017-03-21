#define _SUPPRESS_PLIB_WARNING 1
#define _DISABLE_OPENADC10_CONFIGPORT_WARNING 1

/* Standard includes. */
#include <stdint.h>
#include <plib.h>

/* FreeRTOS includes. */
//#include "FreeRTOS.h"
#include "FreeRTOS_CLI.c"
#include "task.h"
#include "timers.h"
#include "queue.h"

/* Hardware include. */
#include <xc.h>

// User includes
#include "myTasks.h"
#include "leddrv.h"
#include "swdrv.h"
#include "isruartdrv.h"
#include "ElevatorControl.h"


/* Hardware configuration. */
#pragma config FPLLMUL = MUL_20, FPLLIDIV = DIV_2, FPLLODIV = DIV_1, FWDTEN = OFF
#pragma config POSCMOD = HS, FNOSC = PRIPLL, FPBDIV = DIV_2, CP = OFF, BWP = OFF
#pragma config PWP = OFF /*, UPLLEN = OFF, FSRSSEL = PRIORITY_7 */

/* Time is measured in "ticks".  The tick rate is set by the configTICK_RATE_HZ
configuration parameter (defined in FreeRTOSConfig.h).  If configTICK_RATE_HZ
is equal to or less than 1000 (1KHz) then portTICK_RATE_MS can be used to 
convert a time in milliseconds into a time in ticks. */
#define mainTOGGLE_PERIOD ( 200UL / portTICK_RATE_MS )

/*-----------------------------------------------------------*/
/* Functions used by this demo.                              */
/*-----------------------------------------------------------*/
/* Performs the hardware initialization to ready the hardware to run this example */
static void prvSetupHardware(void);

#if (1 == DEBUG_TASK)
static void d_testTask(void);
#endif

#if (0 == DEBUG_TASK)
static void d_labTasks(void);
#endif

/*-----------------------------------------------------------*/
/* Structures used by this demo.                             */
/*-----------------------------------------------------------*/

/*-----------------------------------------------------------*/
/* Variables used by this demo.                              */
/*-----------------------------------------------------------*/
static QueueHandle_t lednQ[3], txQ;
int enable[3];

/*-----------------------------------------------------------*/
int main(void)
{
    /* Perform any hardware initialization that may be necessary. */
    prvSetupHardware();


#if (1 == DEBUG_TASK)
    // Perform testing within a task
    d_testTask();
#endif

#if (0 == DEBUG_TASK)
    // Perform lab requirements
    d_labTasks();
#endif

    /* Start the scheduler so the tasks start executing.  This function should not return. */
    vTaskStartScheduler();
}

#if (1 == DEBUG_TASK)

static void d_testTask(void)
{
    TaskHandle_t handle = NULL;

    xTaskCreate(
                d_testFunction,
                "TEST",
                configMINIMAL_STACK_SIZE,
                NULL,
                1,
                &handle
                );
}
#endif

#if (0 == DEBUG_TASK)
/* //// Define CLI functions here //// */
static const char taskListHdr[] = "Name\t\tStat\tPri\tS/Space\tTCB";

portBASE_TYPE prvTaskStatsCommand(int8_t *pcWriteBuffer,
                                  size_t xWriteBufferLen,
                                  const int8_t *pcCommandString)
{
    sprintf(pcWriteBuffer, taskListHdr);
    pcWriteBuffer += strlen(taskListHdr);
    vTaskList(pcWriteBuffer);

    return pdFALSE;
}

static const xCommandLineInput xTaskStatsCommand = {"task-stats",
    "task-stats: Displays a table of task state information\r\n",
    prvTaskStatsCommand,
    0};

portBASE_TYPE StartLEDn(int8_t *pcWriteBuffer,
                        size_t xWriteBufferLen,
                        const int8_t *pcCommandString)
{
    int length1, length2, id, delay;
    char * idp, * delayp;

    idp = FreeRTOS_CLIGetParameter(pcCommandString, 1, &length1);
    delayp = FreeRTOS_CLIGetParameter(pcCommandString, 2, &length2);

    idp[length1] = 0;
    delayp[length2] = 0;

    id = atoi(idp);
    delay = atoi(delayp);

    if (id < 0 || id > 2) return pdFALSE;

    if (enable[id] == 0)
    {
        enable[id] = 1;
        d_ledn_message message;
        message.delay = delay;
        xQueueSendToBack(lednQ[id], (void *) &message, portMAX_DELAY);
    }
    else
    {
        sprintf(pcWriteBuffer, "LED already started\r\n");
        pcWriteBuffer += strlen("LED already started\r\n");
    }

    return pdFALSE;
}

static const xCommandLineInput StartLEDnHeader = {"start_led",
    "start_led <n> <delay>: start led n blinking at <delay> ms\r\n",
    StartLEDn,
    2};

portBASE_TYPE StopLEDn(int8_t *pcWriteBuffer,
                       size_t xWriteBufferLen,
                       const int8_t *pcCommandString)
{
    int length1, length2, id, delay;
    char * idp, * delayp;

    idp = FreeRTOS_CLIGetParameter(pcCommandString, 1, &length1);
    idp[length1] = 0;
    id = atoi(idp);

    delay = 0;

    if (id < 0 || id > 2) return pdFALSE;

    if (enable[id] == 1)
    {
        enable[id] = 0;
        d_ledn_message message;
        message.delay = delay;
        xQueueSendToBack(lednQ[id], (void *) &message, portMAX_DELAY);
    }
    else
    {
        sprintf(pcWriteBuffer, "LED already stopped\r\n");
        pcWriteBuffer += strlen("LED already stopped\r\n");
    }

    return pdFALSE;
}

static const xCommandLineInput StopLEDnHeader = {"stop_led",
    "stop_led <n>: stop led n blinking\r\n",
    StopLEDn,
    1};

portBASE_TYPE ChangeLEDn(int8_t *pcWriteBuffer,
                         size_t xWriteBufferLen,
                         const int8_t *pcCommandString)
{
    int length1, length2, id, delay;
    char * idp, * delayp;

    idp = FreeRTOS_CLIGetParameter(pcCommandString, 1, &length1);
    delayp = FreeRTOS_CLIGetParameter(pcCommandString, 2, &length2);

    idp[length1] = 0;
    delayp[length2] = 0;

    id = atoi(idp);
    delay = atoi(delayp);

    if (id < 0 || id > 2) return pdFALSE;

    if (enable[id] == 1)
    {
        d_ledn_message message;
        message.delay = delay;
        xQueueSendToBack(lednQ[id], (void *) &message, portMAX_DELAY);
    }
    else
    {
        sprintf(pcWriteBuffer, "LED is stopped\r\n");
        pcWriteBuffer += strlen("LED is stopped\r\n");
    }

    return pdFALSE;
}

static const xCommandLineInput ChangeLEDnHeader = {"change_led",
    "change_led <n> <delay>: change led n blinking to <delay> ms\r\n",
    ChangeLEDn,
    2};
/* //// End of CLI function definitions //// */

/* //// Define UART invokable functions here //// */
int lab5(void * rx_arg, char a)
{
    d_rx_parameter * q = (d_rx_parameter *) rx_arg;

    // 0x31 instead of 0x30 to add an offset; keys 1 - 3 instead of 0 - 2
    if (a - 0x31 >= 0 && a - 0x31 <= 2)
    {
        uint8_t c = (uint8_t) a - 0x31;
        xQueueSendToBack(q->lednQ, &c, portMAX_DELAY);
    }
    return 0;
}

int lab6(void * rx_arg, char * str)
{
    d_rx_parameter * q = (d_rx_parameter *) rx_arg;
    int r = 0;

    xQueueSendToBack(q->txQ, (void *) "\r\n", portMAX_DELAY);

    char wbuf[d_UART_BUFFER_DEPTH] = {[0 ... d_UART_BUFFER_DEPTH - 1] = 0};
    do
    {
        r = FreeRTOS_CLIProcessCommand(str, wbuf, sizeof (wbuf) - 1);
        xQueueSendToBack(q->txQ, (void *) wbuf, portMAX_DELAY);
        memset(wbuf, 0, sizeof (wbuf) / sizeof (char));
    } while (r == pdTRUE);

    xQueueSendToBack(q->txQ, (void *) "\r\n", portMAX_DELAY);
    //    xQueueSendToBack(q->txQ, (void *) str, portMAX_DELAY);
    //    xQueueSendToBack(q->txQ, (void *) "\r\n", portMAX_DELAY);

    return 0;
}

/* //// End of RX invokable function definitions //// */

static void d_labTasks(void)
{
    // Prepare variables
    int i;
    for (i = 0; i < sizeof (enable); ++i)
    {
        enable[i] = 0;
    }

    // Register CLI functions
    FreeRTOS_CLIRegisterCommand(&xTaskStatsCommand);
    FreeRTOS_CLIRegisterCommand(&StartLEDnHeader);
    FreeRTOS_CLIRegisterCommand(&StopLEDnHeader);
    FreeRTOS_CLIRegisterCommand(&ChangeLEDnHeader);

    // Register UART invokable functions
    //int n = d_register_rx_invokable(&lab5, 1);
    d_register_builder_invokable(&lab6);

    // Task handles
    TaskHandle_t taskHandles[6] = {[0 ... 5] = NULL};

    // TX queue
    txQ = xQueueCreate(20, sizeof (uint8_t) * d_UART_BUFFER_DEPTH);

    // LED n queue
    for (i = 0; i < sizeof (lednQ); ++i)
    {
        lednQ[i] = xQueueCreate(5, sizeof (d_ledn_message));
    }

    // RX argument
    static d_rx_parameter rxA;
    rxA.txQ = txQ;
    rxA.lednQ = lednQ;

    // TX argument
    static d_tx_parameter txA;
    txA.txQ = txQ;

    // LED 0 argument
    static d_ledn_parameter led0A;
    led0A.id = 0;
    led0A.lednQ = lednQ[0];
    led0A.txQ = txQ;

    // LED 1 argument
    static d_ledn_parameter led1A;
    led1A.id = 1;
    led1A.lednQ = lednQ[1];
    led1A.txQ = txQ;

    // LED 2 argument
    static d_ledn_parameter led2A;
    led2A.id = 2;
    led2A.lednQ = lednQ[2];
    led2A.txQ = txQ;

    // LED 0 task
    xTaskCreate(
                d_ledn,
                "LED01",
                configMINIMAL_STACK_SIZE,
                (void *) &led0A,
                1,
                &taskHandles[0]
                );

    // LED 1 task
    xTaskCreate(
                d_ledn,
                "LED11",
                configMINIMAL_STACK_SIZE,
                (void *) &led1A,
                1,
                &taskHandles[1]
                );

    // LED 2 task
    xTaskCreate(
                d_ledn,
                "LED21",
                configMINIMAL_STACK_SIZE,
                (void *) &led2A,
                1,
                &taskHandles[2]
                );

    // RX task
    xTaskCreate(
                d_rx,
                "RX1",
                configMINIMAL_STACK_SIZE,
                (void *) &rxA,
                3,
                &taskHandles[3]
                );

    // TX task
    xTaskCreate(
                d_tx,
                "TX1",
                configMINIMAL_STACK_SIZE,
                (void *) &txA,
                2,
                &taskHandles[4]
                );

    //Elevator Main Control
    xTaskCreate(
                ec_ElevatorMainControl,
                "TX1",
                configMINIMAL_STACK_SIZE,
                NULL,
                2,
                NULL
                );
}
#endif

/*-----------------------------------------------------------*/
static void prvSetupHardware(void)
{
    /* Setup the CPU clocks, and configure the interrupt controller. */
    SYSTEMConfigPerformance(configCPU_CLOCK_HZ);
    mOSCSetPBDIV(OSC_PB_DIV_2);
    INTEnableSystemMultiVectoredInt();

    // Setup LEDs (PORTD 0 - 2)
    d_initializeLedDriver();

    // Setup switches (SW1 - SW3)
    d_initializeSwitchDriver();

    // Setup UART (UART1)
    d_initializeUARTDriver(UART1, 9600);
}

void vApplicationMallocFailedHook(void)
{
    /* vApplicationMallocFailedHook() will only be called if
    configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
    function that will get called if a call to pvPortMalloc() fails.
    pvPortMalloc() is called internally by the kernel whenever a task, queue,
    timer or semaphore is created.  It is also called by various parts of the
    demo application.  If heap_1.c or heap_2.c are used, then the size of the
    heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
    FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
    to query the size of free heap space that remains (although it does not
    provide information on how the remaining heap might be fragmented). */
    taskDISABLE_INTERRUPTS();
    for (;;);
}

/*-----------------------------------------------------------*/

void vApplicationIdleHook(void)
{
    /* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
    to 1 in FreeRTOSConfig.h.  It will be called on each iteration of the idle
    task.  It is essential that code added to this hook function never attempts
    to block in any way (for example, call xQueueReceive() with a block time
    specified, or call vTaskDelay()).  If the application makes use of the
    vTaskDelete() API function (as this demo application does) then it is also
    important that vApplicationIdleHook() is permitted to return to its calling
    function, because it is the responsibility of the idle task to clean up
    memory allocated by the kernel to any task that has since been deleted. */
}

/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook(TaskHandle_t pxTask, char *pcTaskName)
{
    (void) pcTaskName;
    (void) pxTask;

    /* Run time task stack overflow checking is performed if
    configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook	function is 
    called if a task stack overflow is detected.  Note the system/interrupt
    stack is not checked. */
    taskDISABLE_INTERRUPTS();
    for (;;);
}

/*-----------------------------------------------------------*/

void vApplicationTickHook(void)
{
    /* This function will be called by each tick interrupt if
    configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
    added here, but the tick hook is called from an interrupt context, so
    code must not attempt to block, and only the interrupt safe FreeRTOS API
    functions can be used (those that end in FromISR()). */
}

/*-----------------------------------------------------------*/

void _general_exception_handler(unsigned long ulCause, unsigned long ulStatus)
{
    /* This overrides the definition provided by the kernel.  Other exceptions 
    should be handled here. */
    for (;;);
}

/*-----------------------------------------------------------*/

void vAssertCalled(const char * pcFile, unsigned long ulLine)
{
    volatile unsigned long ul = 0;

    (void) pcFile;
    (void) ulLine;

    __asm volatile( "di");
    {
        /* Set ul to a non-zero value using the debugger to step out of this
        function. */
        while (ul == 0)
        {
            portNOP();
        }
    }
    __asm volatile( "ei");
}
