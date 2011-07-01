/*
  String Case changes
 
 Examples of how to change the case of a string
 
 created 27 July 2010
 by Tom Igoe
 
 http://arduino.cc/en/Tutorial/StringCaseChanges
 
 This example code is in the public domain.
 */

void setup() {
  serial_begin(9600);
  serial_println("\n\nString  case changes:");
}

void loop() {
//
  String stringOne = "<html><head><body>";
  serial_println(stringOne);
  stringOne = (stringOne.toUpperCase());
  serial_println(stringOne);
  
//
  String stringTwo = "</BODY></HTML>";
  serial_println(stringTwo);
  stringTwo = stringTwo.toLowerCase();
  serial_println(stringTwo);
  
  
//
  while(true);
}

