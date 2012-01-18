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
	char filename[] = "lorem.txt";
	SD_File file;
	char data[B_SIZE];
	int i, b, l, br;
	SD_Error error;
	
	// wait for RETURN key to start
	CDC.println("Press RETURN to start.");
	while (CDC.getKey() != '\r');
	
	// mount FAT filesystem
	// Card Select output on pin 8
	if (SD.mount(8)) // or SD.init(8) or SD.begin(8)
	{
		// open file
		error = SD.open(&file, filename, FA_OPEN_EXISTING | FA_READ);
		if (!error){

			/*	Display data file on terminal including new data added above */
			CDC.println("\n\r*** File %s contents ***", filename);
			b = 0; 								// byte counter 
			l = 0; 								// line counter
			do {
				error = SD.read(&file, data, B_SIZE, &br);
													// Read a chunk of file
				b = b + br;						// update byte counter
				for(i = 0; i < br; i++){
					CDC.printf("%c", data[i]); 
					if (data[i] == '\n'){
						CDC.printf("\r"); 
						l++;						// increment line counter
					}
				}
			} while(br == B_SIZE);			// while buffer is full 
			CDC.println("\n%d lines, %d bytes read.", l, b);
			SD.close(&file);
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
