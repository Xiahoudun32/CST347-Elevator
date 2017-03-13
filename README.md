# CST347-Elevator
Final Project for Winter 2017 RTOS class

Style Considerations:
<br>-Variable and functions names should be prepended by a 1-3 letter identifier which indicates what part of the project it belongs to</br>
<br>-Variables should be all lowercase, using underscores to separate words</br>
<br>-Functions should not have spaces, and should use Pascal casing (Examples Follow)</br>
<br>->A variable related to Motor Control might have the name 'mc_max_speed' or 'mc_current_floor' while an LED variable might be 'led_times_pressed'</br>
  <br>-> A Function in the UART controller might have the signature 'u_UartPutString(UART_MODULE device, char * u_some_string)' while a Motor Control function might look like 'mc_MoveToFloor(int mc_destination)'</br>
    <br>-Heavy commenting isn't necessary, but commenting complex loops and large sets of variable declarations would be nice.</br>
