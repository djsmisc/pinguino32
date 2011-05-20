/*
  Digital Pot Control
  
  This example controls an Analog Devices AD5206 digital potentiometer.
  The AD5206 has 6 potentiometer channels. Each channel's pins are labeled
  A - connect this to voltage
  W - this is the pot's wiper, which changes when you set it
  B - connect this to ground.
 
 The AD5206 is SPI-compatible,and to command it, you send two bytes, 
 one with the channel number (0 - 5) and one with the resistance value for the
 channel (0 - 255).  
 
 The circuit:
  * All A pins  of AD5206 connected to +5V
  * All B pins of AD5206 connected to ground
  * An LED and a 220-ohm resisor in series connected from each W pin to ground
  * CS - to digital pin 10  (SS pin)
  * SDI - to digital pin 11 (MOSI pin)
  * CLK - to digital pin 13 (SCK pin)
 
 created 10 Aug 2010 
 by Tom Igoe
 
 Thanks to Heather Dewey-Hagborg for the original tutorial, 2005
 
*/


//
const int slaveSelectPin = SS;

int digitalPotWrite(int address, int value)
{
//
  digitalwrite(slaveSelectPin,LOW);
//
  SPI_write(address);
  SPI_write(value);
//
  digitalwrite(slaveSelectPin,HIGH); 
}

void setup()
{
//
  pinmode (slaveSelectPin, OUTPUT);
//
  SPI_init(); 
}

void loop()
{
  int channel;
  int level;
  
//
  for (channel = 0; channel < 6; channel++)
  { 
//
    for (level = 0; level < 255; level++)
    {
      digitalPotWrite(channel, level);
      Delayms(10);
    }
//
    Delayms(100);
//
    for (level = 0; level < 255; level++)
    {
      digitalPotWrite(channel, 255 - level);
      Delayms(10);
    }
  }
}

