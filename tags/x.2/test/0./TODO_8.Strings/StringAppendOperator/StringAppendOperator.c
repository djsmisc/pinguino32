/*
  Appending to Strings using the += operator and concat()
 
 Examples of how to append different data types to strings
 
 created 27 July 2010
 modified 4 Sep 2010
 by Tom Igoe
 
 http://arduino.cc/en/Tutorial/StringAppendOperator
 
 This example code is in the public domain.
 */
String stringOne, stringTwo;

void setup() {
  serial_begin(9600);
  stringOne = String("Sensor ");
  stringTwo = String("value");
  serial_println("\n\nAppending to a string:");
}

void loop() {
  serial_println(stringOne);  // prints  "Sensor "

//
  stringOne += stringTwo;
  serial_println(stringOne);  // prints "Sensor value"

//
  stringOne += " for input ";
  serial_println(stringOne);  // prints "Sensor value for input"

//
  stringOne += 'A';
  serial_println(stringOne);   // prints "Sensor value for input A"

//
  stringOne += 0;
  serial_println(stringOne);   // prints "Sensor value for input A0"

//
  stringOne += ": ";
  serial_println(stringOne);  // prints "Sensor value for input"

//
  stringOne += analogread(A0);
  serial_println(stringOne);   // prints "Sensor value for input A0: 456" or whatever analogread(A0) is

  serial_println("\n\nchanging the Strings' values");
  stringOne = "A long integer: ";
  stringTwo = "The Millis(): ";

//
  stringOne += 123456789;
  serial_println(stringOne);   // prints "A long integer: 123456789"

//
  stringTwo.concat(Millis());
  serial_println(stringTwo); // prints "The Millis(): 43534" or whatever the value of the Millis() is

//
  while(true);
}
