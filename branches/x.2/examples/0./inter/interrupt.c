//
//
//
//

void UserInterrupt()
{
//
if (PIR1bits.TMR1IF)
{
//
PIR1bits.TMR1IF=0;
//
digitalwrite(0,digitalread(0)^1);
}
}

void setup()
{
//
pinmode(0,OUTPUT);
//
//
//
T1CONbits.RD16=1;
//
T1CONbits.T1RUN=0;
//
T1CONbits.T1CKPS1=1;
T1CONbits.T1CKPS0=1;
//
T1CONbits.T1OSCEN=0;
//
//
T1CONbits.TMR1CS=0;
//
T1CONbits.TMR1ON=1;
//
//
//
//
//
//
//
//
PIE1bits.TMR1IE=1;
//
//
INTCONbits.PEIE=1;
//
INTCONbits.GIE=1;
//
}

void loop()
{
//
}
