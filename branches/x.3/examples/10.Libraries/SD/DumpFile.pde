/*	---------------------------------------------------------------------------
	Read a file on SD card
	2011 Regis Blanchot
	<rblanchot@gmail.com>
	http://www.pinguino.cc

	circuit:
	* SD card attached to SPI bus as follows:
	** MOSI - pin 11
	** MISO - pin 12
	** CLK - pin 13
	** CS - pin 8

	output:
	(GNU/linux) sudo minicom -o -D /dev/ttyACM0
	press <return> to start
	---------------------------------------------------------------------------*/

#define B_SIZE 32	// blocks of arbitrary length,
					// try to change it to improve efficiency 

void setup()
{
}

void loop()
{
	File *fs;
	char data[B_SIZE];
	unsigned r;
	int i, b, l;
	char filename[] = "lorem.txt";
	
	// wait for RETURN key to start
	CDC.println("Press RETURN to start.");
	while (CDC.getKey() != '\r');
	
	// mount FAT16 system
	// Card Select output on pin 8
	if (SD.mount(8)) // or SD.init(8) or SD.begin(8)
	{
		// check to see if the file exists: 
		if (SD.exists(filename))
		{
			CDC.println("%s exists.", filename);
		}
		else
		{
			CDC.println("%s not found.", filename);  
		}

		// open file
		if (( fs = SD.open(filename, "r") ))
		{
			b = 0; // byte counter 
			l = 0; // line counter
			do {
				r = SD.read(fs, data, B_SIZE);
				b = b + r;
				for(i = 0; i < r; i++)
				{
					CDC.printf("%c", data[i]); 
					if (data[i] == '\n')
					{
						CDC.printf("\r"); 
						l++;
					}
				}
			} while(r == B_SIZE);
			CDC.println("\n%d lines, %d bytes read.", l, b);
			SD.close(fs);
			SD.unmount();
		}
		else
		{
			CDC.println("file not found!");
		}
	}
	else
	{
		CDC.println("mount failed!");
	}
}
