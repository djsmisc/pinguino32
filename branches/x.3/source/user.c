

u32 i=0;
u8 *buffer;

void setup()
{
	
	CDCprintf("Press <RETURN> to start\r\n");
	while (CDCgetkey() != '\r');
	
	
	buffer = BT_init(2, 115200);

	
	CDCprintf("init response is [%s]\r\n", buffer);
}	

void loop()
{

	buffer = BT_search(2, 10);



	
	CDCprintf("search response is [%s]\r\n", buffer);

	
	Delayms(1000);
}


