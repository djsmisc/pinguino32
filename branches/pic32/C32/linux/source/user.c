u16 value=0;

void setup()
{
serial1init(9600);
analog_init();
serial1printf("DEVCFG0=%08X\n\r",DEVCFG0);
serial1printf("AD1PCFG=%08X\n\r",AD1PCFG);
}

void loop()
{
unsigned int i;
serial1printf("START\n\r");
serial1printf("AD1PCFG=%08X\n\r",AD1PCFG);
i=6;
	{
	value=analogRead(i);
	serial1printf("TEST %d %d\n\r",i,value);
	for (i=0;i<64;i+=4)
		serial1printf("offset %d = %d\n\r",i,*(&ADC1BUF0+i));
	}
while(1);
}

