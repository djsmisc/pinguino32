/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

void setup() {                
//
//
  pinmode(13, OUTPUT);     
}

void loop() {
  digitalwrite(13, HIGH);   
  Delayms(100);              
  digitalwrite(13, LOW);    
  Delayms(100);              
}

