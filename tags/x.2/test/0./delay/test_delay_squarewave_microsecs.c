//
//
//
//

unsigned int pulsewidth=10;

void setup(void)
{
pinmode(0,OUTPUT);
}

void loop(void)
{
PORTBbits.RB0 = 1;
Delayus(pulsewidth);
PORTBbits.RB0 = 0;
Delayus(pulsewidth);
PORTBbits.RB0 = 1;
Delayus(pulsewidth);
PORTBbits.RB0 = 0;
Delayus(pulsewidth);
}
