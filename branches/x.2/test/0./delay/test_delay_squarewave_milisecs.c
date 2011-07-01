//
//
//
//

unsigned int pulsewidth=2;

void setup(void)
{
pinmode(0,OUTPUT);
}

void loop(void)
{
PORTBbits.RB0 = 1;
Delayms(pulsewidth);
PORTBbits.RB0 = 0;
Delayms(pulsewidth);
PORTBbits.RB0 = 1;
Delayms(pulsewidth);
PORTBbits.RB0 = 0;
Delayms(pulsewidth);
}
