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
  serial1init(9600);
  stringOne = String("stringThree = ");
  stringTwo = String("this string");
  stringThree = String ();
  serial1println("\n\nAdding strings together (concatenation):");
}

void loop() {
//
  stringThree =  stringOne + 123;
  serial1println(stringThree);    // prints "stringThree = 123"

//
  stringThree = stringOne + 123456789;
  serial1println(stringThree);    // prints " You added 123456789"

//
  stringThree =  stringOne + 'A';
  serial1println(stringThree);    // prints "You added A"

//
  stringThree =  stringOne +  "abc";
  serial1println(stringThree);    // prints "You added abc"

  stringThree = stringOne + stringTwo;
  serial1println(stringThree);    // prints "You added this string"

//
  int sensorValue = analogRead(A0);
  stringOne = "Sensor value: ";
  stringThree = stringOne  + sensorValue;
  serial1println(stringThree);    // prints "Sensor Value: 401" or whatever value analogRead(A0) has

//
  long currentTime = millis();
  stringOne="millis() value: ";
  stringThree = stringOne + millis();
  serial1println(stringThree);    // prints "The millis: 345345" or whatever value currentTime has

//
  while(true);
}
