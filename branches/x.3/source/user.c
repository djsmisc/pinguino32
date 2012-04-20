


	






u8 s  = 0;
u8 m  = 0;
u8 h = 0;



void tick()
{
	s++;
	
	if (s > 59)
	{
		s = 0;
		m++;
	}
	
	if (m > 59)
	{
		m = 0;
		h++;
	}
	
	if (h > 23)
	{
		h = 0;
	}
	
	lcdi2c_setCursor(4, 1); 
	lcdi2c_printf("%02u:%02u:%02u", h, m, s);
}

void setup()
{
	

	
	lcdi2c_init(16, 2, 0b01001110);			
	lcdi2c_backlight();						
	lcdi2c_clear();							
	lcdi2c_home();							
	lcdi2c_printf("   lcdi2c demo  ");
	lcdi2c_setCursor(0, 1);					
	lcdi2c_printf(" Regis Blanchot ");
	

	Delayms(5000);							
	lcdi2c_clearLine(1);
}

void loop()
{
	tick();
	Delayms(1000);
}




