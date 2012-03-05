

u32 i=0;
BT_RESPONSE myPhone;
BT_RESPONSE myPinguino;

void setup()
{
	
	CDCprintf("Press <RETURN> to start\r\n");
	while (CDCgetkey() != '\r');
}	

void loop()
{
	
	myPinguino =  BT_init(UART2, 115200);

	
	CDCprintf("command was      [%s]\r\n", myPinguino.command);
	CDCprintf("data return is   [%s]\r\n", myPinguino.data);
	CDCprintf("status return is [%s]\r\n", myPinguino.status);
	CDCprintf("status code is   [%d]\r\n", myPinguino.code);



	
	Delayms(1000);
}




