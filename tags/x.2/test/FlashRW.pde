// test fonction ReadFlash
// Jean-Pierre MANDON 2008
// Fixed for Beta 9 2010

// put static value to flash memory

__code __at(0x6000) uint boot1[]={0xF000,0xEF89,0xF009,0xEF43,0xF00C,0xEF75,0xF007,0xEFB8};
__code __at(0x6010) uint boot2[]={0xF00B,0xEF50,0xF004,0xEF68,0xF008,0xEF4F,0xF00C,0xEF7C};
__code __at(0x6020) uint boot3[]={0xF006,0xEF7B,0xF00C,0xEF74,0xF00A,0xEF72,0xF005,0xEFC7};
__code __at(0x6030) uint boot4[]={0xF00A,0xEF15,0xF00C,0xEFEE,0xF00B,0xEFD3,0xF00B,0xEF98};

void setup()
{
}

void loop()
{
	unsigned int i;
	unsigned char buffer[32];

	// erase 64 byte in flash memory at address 0x5000
	Flash.erase(0x5000);

	// copy 32 byte from flash memory address 0x6000 to buffer tab
	for (i=0;i<32;i++)
		buffer[i]=Flash.read(0x6000+i);

	// write 32 byte of buffer tab to flash memory at address 0x5000
	Flash.write(0x5000, buffer);

	// copy 32 byte from flash memory address 0x6020 to buffer tab
	for (i=0;i<32;i++)
		buffer[i]=Flash.read(0x6020+i);

	// write 32 byte of buffer tab to flash memory at address 0x5020
	Flash.write(0x5020, buffer);

	while(1);
}