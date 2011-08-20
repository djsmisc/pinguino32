//
//
//




static char data[] = "ls\n";				
//

typedef enum {
  MAIN_STATE_WAIT_CONNECT,
  MAIN_STATE_WAIT_OPEN,
  MAIN_STATE_WAIT_PROMPT,
  MAIN_STATE_GOT_PROMPT,
  MAIN_STATE_RECV
} MAIN_STATE;

static MAIN_STATE state = MAIN_STATE_WAIT_CONNECT;

//

void ChannelRecv(ADB_CHANNEL_HANDLE h, const void* data, unsigned int data_len) {
  unsigned int i;
  if (((const unsigned char *) data)[1]=='1') digitalwrite(1,1);
  if (((const unsigned char *) data)[1]=='2') digitalwrite(2,1);
  if (((const unsigned char *) data)[1]=='3') digitalwrite(3,1);
  if ((((const unsigned char *) data)[0]=='R')&&(((const unsigned char *) data)[1]=='A'))
	for (i=1;i<4;i++) digitalwrite(i,0);
  if ((((const unsigned char *) data)[0]=='S')&&(((const unsigned char *) data)[1]=='A'))
	for (i=1;i<4;i++) digitalwrite(i,1);
}

ADB_CHANNEL_HANDLE h;


void setup()
{
unsigned char i;

IntConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);
pinmode(1,OUTPUT);
pinmode(2,OUTPUT);
pinmode(3,OUTPUT);
for (i=1;i<4;i++) digitalwrite(i,0);
ADBInit();    							
}

void loop()
{
unsigned char angle;
float val;

val=cosf(PI);

unsigned char connected = ADBTasks();

if (!connected) state = MAIN_STATE_WAIT_CONNECT;
    
switch(state) 
	{
     case MAIN_STATE_WAIT_CONNECT:
      if (connected) 
		{
        h = ADBOpen("tcp:2000", &ChannelRecv);			
        state = MAIN_STATE_WAIT_OPEN;
		}
      break;

     case MAIN_STATE_WAIT_OPEN:							
      if (ADBChannelReady(h)) state = MAIN_STATE_RECV;
      break;

     case MAIN_STATE_WAIT_PROMPT:						
      break;

     case MAIN_STATE_GOT_PROMPT:						
        ADBWrite(h, data, sizeof data - 1);
        state = MAIN_STATE_RECV;
      break;

     case MAIN_STATE_RECV:
      break;
    }
}
