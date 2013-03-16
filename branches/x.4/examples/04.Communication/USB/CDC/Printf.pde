// Output on Linux : sudo cat /dev/ttyACM0
// Outout on Windows : 

float f=0; 

void setup()
{
    pinMode(USERLED, OUTPUT);
}

void loop()
{
    CDC.print(45);  // 1 digit after decimal comma
    
    //f = f + 0.1;
    f++;
    toggle(USERLED);
    delay(500);
}
