/*
  Mega multple serial test
 
 Receives from the main serial port, sends to the others. 
 Receives from serial port 1, sends to the main serial (Serial 0).
 
 This example works only on the Arduino Mega
 
 The circuit: 
 * Any serial device attached to Serial port 1
 * Serial monitor open on Serial port 0:
 
 created 30 Dec. 2008
 by Tom Igoe
 
 This example code is in the public domain.
 
 */


void setup() {
//
  serial_begin(9600);
  Serial1.begin(9600);
}

void loop() {
//
  if (Serial1.available()) {
    int inByte = Serial1.read();
    serial_write(inByte, BYTE); 
  }
}

