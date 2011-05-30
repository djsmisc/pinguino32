//
//

#define PIC18F4550

void setup()
{
pinmode(10,OUTPUT);
}

void loop()
{
if (analogRead(20)>500) digitalwrite(10,HIGH);
else digitalwrite(10,LOW);
}

