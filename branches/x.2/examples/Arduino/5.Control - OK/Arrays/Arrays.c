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
int ledPins[] = { 
  2, 7, 4, 6, 5, 3 };       // an array of pin numbers to which LEDs are attached
int pinCount = 6;           // the number of pins (i.e. the length of the array)

void setup() {
  int thisPin;
//
//
  for (thisPin = 0; thisPin < pinCount; thisPin++)  {
    pinmode(ledPins[thisPin], OUTPUT);      
  }
}

void loop() {
  int thisPin;
//
  for (thisPin = 0; thisPin < pinCount; thisPin++) { 
//
    digitalwrite(ledPins[thisPin], HIGH);   
    Delayms(timer);                  
//
    digitalwrite(ledPins[thisPin], LOW);    

  }
//
  for (thisPin = pinCount - 1; thisPin >= 0; thisPin--) { 
//
    digitalwrite(ledPins[thisPin], HIGH);
    Delayms(timer);
//
    digitalwrite(ledPins[thisPin], LOW);
  }
}

