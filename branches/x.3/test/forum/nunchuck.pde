// test program for I2C communication with nunchuck
// Jean-Pierre MANDON 2011
 
byte I2C_address=0x52;						// i2c address for nunchuck
unsigned char I2C_OK;						// acknowledge when calling I2C function
byte I2C_setParameters[2]={0x40,0x00};      // nunchuck initialisation
byte I2C_readRegister[1]={0x00};		   // read instruction for nunchuck
 
void setup()
{
	// Serial is used to monitor data
	Serial.begin(9600);
	// I2C_MASTER_MODE, I2C_SLEW_OFF
	I2C.master();
}
 
void nunchuck_init()
{
	unsigned char r1, r2;
	// set memory address for future read
	r1 = I2C.send(I2C_address, I2C_setParameters[0]);
	r2 = I2C.send(I2C_address, I2C_setParameters[1]);
	I2C_OK = r1 & r2;
}
 
void send_zero()
{	
	// set request to read
	I2C_OK = I2C.send(I2C_address, I2C_readRegister[0]);
}
 
// prepare a new request to memory
void new_request()
{
	unsigned char cpt;

	cpt=0;
	I2C_OK=0;
	while ((cpt++<10)&&(!I2C_OK))
		nunchuck_init();		
	delay(10);
	
	cpt=0;
	I2C_OK=0;
	while ((cpt++<10)&&(!I2C_OK))
		send_zero();
	delay(10);	
}
 
void loop()
{
	unsigned char i;
	 
	nunchuck_init();						// initialise nunchuck
	if (!I2C_OK)
	{
		Serial.printf("Init Error\n\r");
		while(1);
	}
	else
	{
		Serial.printf("Init OK\n\r");
	}
	
	delay(20);
	i=0;
	I2C_OK=0;
	
	while ((i++<10)&&(!I2C_OK))
		send_zero();			// prepare new request

	if (!I2C_OK) 
	{
		Serial.printf("Nunchuck Error\n\r");
		while(1);
	}
	else
	{
		Serial.printf("Request OK\n\r");
	}

	while(1)	
	{	
		// read nunchuck value
		for (i=0;i<6;i++)
			Serial.printf("%d ", I2C.get(I2C_address));
		Serial.printf("\n");
		delay(10);
		// prepare a new request
		new_request();
	}		
}
