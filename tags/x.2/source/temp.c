//
//

void setup()
{
_ADBInit();							
serial1init(9600);
}

unsigned char ADBrx[100];			
unsigned char ADBopened=0;			
unsigned int length;
unsigned int i;
unsigned char framereceived=0;		

void loop()
{
unsigned char connected=ADBTasks();		

if (connected)								
	{
	if (!ADBopened) ADBopened=_ADBOpen();	
		if (ADBopened)
			{
			if (ADBAvailable())			
				{
				length=ADBRead(ADBrx);		
				if (length>0) 
					{
					serial1printf("length=%d\n\r",length);
					for (i=0;i<length;i++) serial1printf("%c",ADBrx[i]);
					serial1printf("\n\r");
					framereceived++;
					}
				}
			if (framereceived==10) 
				{
				ADBSend("TOTO\n\r",6);		
				framereceived=0;
				}
			}
	}
}
