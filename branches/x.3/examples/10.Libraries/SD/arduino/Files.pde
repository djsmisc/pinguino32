/*
  SD card basic file example
 
 This example shows how to create and destroy an SD card file 	
 The circuit:
 * SD card attached to SPI bus as follows:
 ** MOSI - pin 11
 ** MISO - pin 12
 ** CLK - pin 13
 ** CS - pin 8
 
 created   Nov 2010
 by David A. Mellis
 updated 2 Dec 2010
 by Tom Igoe
 updated 27 Oct 2011 for Pinguino
 by Regis Blanchot
 
 This example code is in the public domain.
 	 
 */

File myFile;

void setup()
{
  CDC.print("Initializing SD card...");

  if (!SD.begin(8)) {
    Serial.println("initialization failed!");
    return;
  }
  Serial.println("initialization done.");

  if (SD.exists("example.txt")) {
    Serial.println("example.txt exists.");
  }
  else {
    Serial.println("example.txt doesn't exist.");
  }

  // open a new file and immediately close it:
  CDC.println("Creating example.txt...");
  myFile = SD.open("example.txt", FILE_WRITE);
  SD.close();

  // Check to see if the file exists: 
  if (SD.exists("example.txt")) {
    CDC.println("example.txt exists.");
  }
  else {
    CDC.println("example.txt doesn't exist.");  
  }

  // delete the file:
  CDC.println("Removing example.txt...");
  SD.remove("example.txt");

  if (SD.exists("example.txt")){ 
    CDC.println("example.txt exists.");
  }
  else {
    CDC.println("example.txt doesn't exist.");  
  }
}

void loop()
{
  // nothing happens after setup finishes.
}
