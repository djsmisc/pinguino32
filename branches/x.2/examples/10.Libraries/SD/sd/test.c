/*	-----------------------------------------------------------------------------
	FatFs Demo
	Author: (c) Jonas Andersson (jonas@haksberg.net) 2009
	http://jonas.haksberg.net/post/2010/03/07/Petit-FatFs-on-a-PIC18.aspx
	Adapted and modified by Régis Blanchot (23-05-2011)
	---------------------------------------------------------------------------*/

	FATFS fs;
	byte data_buffer_32[32];
	word br; // number of bytes read

//
	byte fileName[32]={"/test/test.txt"}; 

void setup()
{   
//
	serial_begin(9600);

	disk_initialize();
	pf_mount(&fs);
	pf_open(fileName);
//
	do
	{
//
		pf_read(data_buffer_32, 31, &br);
//
		data_buffer_32[br] = '\0';
		serial_printf("%s", data_buffer_32);
	} while (br == 31);	// if less than 31 bytes are read then the file has ended
	pf_unmount();
}

void loop()
{
}

