#define _SUPPRESS_PLIB_WARNING 1
#define _DISABLE_OPENADC10_CONFIGPORT_WARNING 1

/* Standard includes. */
#include <stdint.h>
#include <plib.h>

/* FreeRTOS includes.*/
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "queue.h"

/* Hardware include. */
#include <xc.h>
#include "LEDDriver.h"

/* Hardware configuration. */
#pragma config FPLLMUL = MUL_20, FPLLIDIV = DIV_2, FPLLODIV = DIV_1, FWDTEN = OFF
#pragma config POSCMOD = HS, FNOSC = PRIPLL, FPBDIV = DIV_2, CP = OFF, BWP = OFF
#pragma config PWP = OFF /*, UPLLEN = OFF, FSRSSEL = PRIORITY_7 */

#define mainTOGGLE_PERIOD ( 200UL / portTICK_RATE_MS )

static void prvSetupHardware(void);int main(void)
{
    prvSetupHardware();

  
    
    vTaskStartScheduler();
}

static void prvSetupHardware(void)
{
    initializeLEDDriver();
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
