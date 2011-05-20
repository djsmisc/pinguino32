/*
  Adding Strings together
 
 Examples of how to add strings together
 You can also add several different data types to string, as shown here:
 
 created 27 July 2010
 modified 4 Sep 2010
 by Tom Igoe
 
 http://arduino.cc/en/Tutorial/StringAdditionOperator
 
 This example code is in the public domain. 
 */

//
String stringOne, stringTwo, stringThree;

void setup() {
  serial_begin(9600);
  stringOne = String("stringThree = ");
  stringTwo = String("this string");
  stringThree = String ();
  serial_println("\n\nAdding strings together (concatenation):");
}

void loop() {
//
  stringThree =  stringOne + 123;
  serial_println(stringThree);    // prints "stringThree = 123"

//
  stringThree = stringOne + 123456789;
  serial_println(stringThree);    // prints " You added 123456789"

//
  stringThree =  stringOne + 'A';
  serial_println(stringThree);    // prints "You added A"

//
  stringThree =  stringOne +  "abc";
  serial_println(stringThree);    // prints "You added abc"

  stringThree = stringOne + stringTwo;
  serial_println(stringThree);    // prints "You added this string"

//
  int sensorValue = analogread(A0);
  stringOne = "Sensor value: ";
  stringThree = stringOne  + sensorValue;
  serial_println(stringThree);    // prints "Sensor Value: 401" or whatever value analogread(A0) has

//
  long currentTime = Millis();
  stringOne="millis() value: ";
  stringThree = stringOne + Millis();
  serial_println(stringThree);    // prints "The millis: 345345" or whatever value currentTime has

//
  while(true);
}
