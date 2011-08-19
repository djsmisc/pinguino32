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
  for (i = 0; i < data_len; ++i) {
    serial1printf("%d ",((const unsigned char*) data)[i]);
  }
  serial1printf("\r\n");
  if (state == MAIN_STATE_WAIT_PROMPT) {
    state = MAIN_STATE_GOT_PROMPT;
  }
}

ADB_CHANNEL_HANDLE h;


void setup()
{
IntConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);
serial1init(9600);
serial1printf("bonjour\n\r");
ADBInit();    							
}

void loop()
{
unsigned char connected = ADBTasks();

if (!connected) state = MAIN_STATE_WAIT_CONNECT;
    
switch(state) 
	{
     case MAIN_STATE_WAIT_CONNECT:
      if (connected) 
		{
        serial1printf("ADB connected!");
        h = ADBOpen("tcp:4567", &ChannelRecv);			
        state = MAIN_STATE_WAIT_OPEN;
		}
      break;

     case MAIN_STATE_WAIT_OPEN:							
      if (ADBChannelReady(h)) state = MAIN_STATE_RECV;
      break;

     case MAIN_STATE_WAIT_PROMPT:						
      break;

     case MAIN_STATE_GOT_PROMPT:						
        serial1printf("Sending data");
        ADBWrite(h, data, sizeof data - 1);
        state = MAIN_STATE_RECV;
      break;

     case MAIN_STATE_RECV:
      break;
    }
}
