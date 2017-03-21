#include "ElevatorControl.h"

QueueHandle_t actionQ;

uint8_t altitude[ec_MAX_FLOORS];

int velocity_max;
int velocity_current;
int acceleration;

int ec_CalcTimetoFinalVelocity(int vf, int vi)
{
    return abs((vf - vi) / acceleration);
}

int ec_CalcDistancetoFinalVelocity(int vf, int vi)
{
    // Vf^2 = Vi^2 + 2ad

    int a = pow(vf, 2) - pow(vi, 2);
    int b = 2 * acceleration;
    return abs(a / b);
}

void ec_InitializeElevatorMainControl()
{
    altitude[GND] = 0;
    altitude[P1] = 500;
    altitude[P2] = 510;

    velocity_max = 20;
    velocity_current = 0;
    acceleration = 2;

    actionQ = xQueueCreate(10, sizeof (ec_Action));

}

void ec_ElevatorMainControl()
{
    currentFloor = GND;
    ec_Action action;
    int vf, distance, blinkCount, time, intermediate_distance;

    while (1)
    {
        // Wait for an action
        if (!emergencyMode) xQueueReceive(actionQ, &action, portMAX_DELAY);

        switch (action)
        {
            case Travel_GND:
                if (currentFloor != MOVING && currentFloor != GND)
                {
                    velocity_current = 0;

                    targetFloor = GND;
                    distance = abs(altitude[currentFloor] - altitude[GND]);

                    while (distance > 0 && !emergencyMode)
                    {
                        vf = ec_CalculateVelocity(distance, velocity_current);
                        distance -= vf;
                        blinkCount = vf / ec_TOGGLE_RATE;
                        xQueueSendToBack(ledQ, (void*) blinkCount, 0);
                        velocity_current = vf;
                    }
                    currentFloor = targetFloor;
                }
                break;
            case Travel_P1:
                if (currentFloor != MOVING && currentFloor != P1)
                {
                    velocity_current = 0;
                    targetFloor = P1;
                    distance = abs(altitude[currentFloor] - altitude[P1]);

                    while (distance > 0 && !emergencyMode)
                    {
                        vf = ec_CalculateVelocity(distance, velocity_current);
                        distance -= vf;
                        blinkCount = vf / ec_TOGGLE_RATE;
                        xQueueSendToBack(ledQ, (void*) blinkCount, 0);
                        velocity_current = vf;
                    }
                    currentFloor = targetFloor;
                }

                break;
            case Travel_P2:
                if (currentFloor != MOVING && currentFloor != P2)
                {
                    velocity_current = 0;
                    targetFloor = P2;
                    distance = abs(altitude[currentFloor] - altitude[P2]);
                    while (distance > 0 && !emergencyMode)
                    {
                        vf = ec_CalculateVelocity(distance, velocity_current);
                        distance -= vf;
                        blinkCount = vf / ec_TOGGLE_RATE;
                        xQueueSendToBack(ledQ, (void*) blinkCount, 0);
                        velocity_current = vf;
                    }
                    currentFloor = targetFloor;
                }

                break;
            case Emergency:
                if (emergencyMode)
                {
                    if (currentFloor != GND)
                    {
                        if (targetFloor != GND)
                        {
                            intermediate_distance = ec_CalcDistancetoFinalVelocity(0, velocity_current);

                            while (velocity_current > 0)
                            {
                                vf = ec_CalculateVelocity(intermediate_distance, velocity_current);
                                intermediate_distance -= vf;
                                blinkCount = vf / ec_TOGGLE_RATE;
                                xQueueSendToBack(ledQ, (void*) blinkCount, 0);
                                velocity_current = vf;
                            }
                            distance = altitude[targetFloor] - distance + intermediate_distance;
                        }

                        velocity_current = 0;

                        targetFloor = GND;
                        distance = abs(altitude[currentFloor] - altitude[GND]);

                        while (distance > 0 && !emergencyMode)
                        {
                            vf = ec_CalculateVelocity(distance, velocity_current);
                            distance -= vf;
                            blinkCount = vf / ec_TOGGLE_RATE;
                            xQueueSendToBack(ledQ, (void*) blinkCount, 0);
                            velocity_current = vf;
                        }
                        currentFloor = targetFloor;

                    }
                }

                break;
            default:;
        }
    }
}

void ec_ToggleAtVelocity()
{
    int i = 0;

    int blinkCount, delayTime;

    while (1)
    {
        xQueueReceive(ledQ, &delayTime, portMAX_DELAY);
        blinkCount = 1000 / delayTime;
        for (i = 0; i < blinkCount; i++)
        {
            vTaskDelay(delayTime / portTICK_PERIOD_MS);
            d_toggleLed(d_Led1);
        }
    }
}

int ec_CalculateVelocity(int distance, int currentVelocity)
{
    // Vf^2 = Vi^2 + 2ad

    int vf;

    vf = pow(currentVelocity, 2); // Vi^2

    vf += (2 * acceleration * distance); // 2ad
    vf = sqrt(vf); // sqrt(Vi^2 + 2ad)
    vf = vf > velocity_max ? velocity_max : vf; // Cap at max velocity

    return vf;
}