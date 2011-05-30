

unsigned char answer;

void setup()
{
serial1init(9600);
}

void loop()
{
//
//
ee_write(0,0x41);
answer=ee_read(0);
Serial.print(answer,BYTE);
}
