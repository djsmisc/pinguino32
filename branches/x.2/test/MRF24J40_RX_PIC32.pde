// test zigbee receive
// Jean-Pierre Mandon 2011
// reception

#define channel 20					// channel must be selected between 11 and 26
#define PAN_ID 0xFEAA				// personal area network number ( between 0 and 65535 )
#define Short_Address 0x0002		// Address of the module ( between 0 and 65535 )

unsigned char rxdata[128];			// 128 is the max length

void setup()
{
	ZIG.init(channel, PAN_ID, Short_Address);
}

void loop()
{
	unsigned char length;
	unsigned int i;

	for (i=0;i<20;i++)
		CDC.printf("%02X ", mrf24j40_short_addr_read(i));
	CDC.printf("\n\r");
	length = ZIG.read(rxdata);
	CDC.printf("length=%d \n\r",length);
	if (length > 0)
	{
		CDC.printf("Source PAN ID:%04X\n\r",ZIGsrcpan);
		CDC.printf("Destination PAN ID:%04X\n\r",ZIGdestpan);
		CDC.printf("Source address:%04X\n\r",ZIGsrcadd);
		CDC.printf("Destination address:%04X\n\r",ZIGdestadd);
		CDC.printf(rxdata);
		CDC.printf("\n\r");
	}
}

