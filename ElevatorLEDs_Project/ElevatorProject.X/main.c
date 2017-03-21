/* User Library Includes*/
#include "Defines.h"
#include "LED_Control.h"

/* Hardware configuration. */
#pragma config FPLLMUL = MUL_20, FPLLIDIV = DIV_2, FPLLODIV = DIV_1, FWDTEN = OFF
#pragma config POSCMOD = HS, FNOSC = PRIPLL, FPBDIV = DIV_2, CP = OFF, BWP = OFF
#pragma config PWP = OFF /*, UPLLEN = OFF, FSRSSEL = PRIORITY_7 */

static void prvSetupHardware(void);

TaskHandle_t LED_Control;
TaskHandle_t TestTaskTask;

void TestTask(void * unused)
{		
	LED_DoorCommand_t command = OPEN;
	vTaskDelay(1000);
	
	while(1)
	{
		command = OPEN;
		xQueueSend(LED_EventQueue, &command, 2000);
		
		command = CLOSE;
		xQueueSend(LED_EventQueue, &command, 2000);
	}
}

int main(void)
{
    prvSetupHardware();
	
	xTaskCreate(LED_TaskControl, "LED Door Display", configMINIMAL_STACK_SIZE, (void*)NULL, 1, &LED_Control);
    xTaskCreate(TestTask, "Test Task for LED", configMINIMAL_STACK_SIZE, (void*)NULL, 1, &TestTaskTask);
	
    vTaskStartScheduler();
}

static void prvSetupHardware(void)
{
	SYSTEMConfigPerformance(configCPU_CLOCK_HZ);
    mOSCSetPBDIV(OSC_PB_DIV_2);
    INTEnableSystemMultiVectoredInt();
	
    LED_TaskInit();

    ConfigCNPullups(CN15_PULLUP_ENABLE | CN16_PULLUP_ENABLE | CN19_PULLUP_ENABLE);
}

void vApplicationMallocFailedHook( void )
{
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationIdleHook( void )
{

}

void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	taskDISABLE_INTERRUPTS();
	for( ;; );
}

void vApplicationTickHook( void )
{

}

void _general_exception_handler( unsigned long ulCause, unsigned long ulStatus )
{
	for( ;; );
}

void vAssertCalled( const char * pcFile, unsigned long ulLine )
{
volatile unsigned long ul = 0;

	( void ) pcFile;
	( void ) ulLine;

	__asm volatile( "di" );
	{
		while( ul == 0 )
		{
			portNOP();
		}
	}
	__asm volatile( "ei" );
}
