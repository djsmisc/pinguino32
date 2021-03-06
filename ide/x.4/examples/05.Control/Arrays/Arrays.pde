/*
  Arrays
 
 Demonstrates the use of  an array to hold pin numbers
 in order to iterate over the pins in a sequence. 
 Lights multiple LEDs in sequence, then in reverse.
 
 Unlike the For Loop tutorial, where the pins have to be
 contiguous, here the pins can be in any random order.
 
 The circuit:
 * LEDs from pins 2 through 7 to ground
 
 created 2006
 by David A. Mellis
 modified 5 Jul 2009
 by Tom Igoe 

This example code is in the public domain.
 
 http://www.arduino.cc/en/Tutorial/Array
 */

int timer = 100;           // The higher the number, the slower the timing.
int ledPins[6] = { 2, 7, 4, 6, 5, 3 };       // an array of pin numbers to which LEDs are attached
int pinCount = 6;           // the number of pins (i.e. the length of the array)
int thisPin;

void setup() {
  int thisPin;
  // the array elements are numbered from 0 to (pinCount - 1).
  // use a for loop to initialize each pin as an output:
  for (thisPin = 0; thisPin < pinCount; thisPin++)  {
    pinMode(ledPins[thisPin], OUTPUT);      
  }
}

void loop() {
  
  // loop from the lowest pin to the highest:
  for (thisPin = 0; thisPin < pinCount; thisPin++) { 
    // turn the pin on:
    digitalWrite(ledPins[thisPin], HIGH);   
    delay(timer);                  
    // turn the pin off:
    digitalWrite(ledPins[thisPin], LOW);    

  }

  // loop from the highest pin to the lowest:
  for (thisPin=pinCount-1;thisPin>=0;thisPin--)
	{
    // turn the pin on:
    digitalWrite(ledPins[thisPin], HIGH);
    delay(timer);
    // turn the pin off:
    digitalWrite(ledPins[thisPin], LOW);
    }
}
