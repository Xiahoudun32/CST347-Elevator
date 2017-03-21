#include "LED_Control.h"
#include "FreeRTOS.h"
#include "queue.h"

#define COMMAND_QUEUE_SIZE 5
#define STATE_OPEN 1
#define STATE_CLOSED 2

void LED_TaskInit(void)
{
	LED_DriverInit();
	LED_EventQueue = xQueueCreate(COMMAND_QUEUE_SIZE, sizeof(LED_DoorCommand_t));
}

void LED_TaskControl(void * taskParams)
{
	// Declaring taskParams unused
	(void)taskParams;
	
	LED_DoorCommand_t command;
	static uint8_t DoorState = STATE_CLOSED;

	while(true)
	{
		xQueueReceive(LED_EventQueue, &command, portMAX_DELAY);
		
		if(command == OPEN && DoorState == STATE_CLOSED)
		{
			vTaskDelay(250);
			LED_DriverSetLED(0, 0);
			vTaskDelay(250);
			LED_DriverSetLED(1, 0);
			vTaskDelay(250);
			LED_DriverSetLED(2, 0);
			vTaskDelay(250);
			
			DoorState = STATE_OPEN;
		}
		else if(command == CLOSE && DoorState == STATE_OPEN)
		{
			vTaskDelay(250);
			LED_DriverSetLED(2, 1);
			vTaskDelay(250);
			LED_DriverSetLED(1, 1);
			vTaskDelay(250);
			LED_DriverSetLED(0, 1);
			vTaskDelay(250);
			
			DoorState = STATE_CLOSED;
		}
	}
}
