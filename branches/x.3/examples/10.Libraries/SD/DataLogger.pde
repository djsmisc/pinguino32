/*	----------------------------------------------------------------------------
	FILE:  			Datalogger.pde
	PROJECT: 		Pinguino
	PURPOSE: 		Log pseudo temperature measurements to a file on SD card
	PROGRAMER:		Mark Harper
	BOARD:			PIC32-PINGUINO-OTG	(OLIMEX)
						with 32.768 kHz clock crystal
	FIRST RELEASE:	17 Jan 2012
	LAST RELEASE:	17 Jan 2012
	IDE RELEASE:	>= trunk r245 
						+ sd.pdl32 (x.3 r246) 
						+ diskio.c, ff.c, fileio.c, fileio.h (x.3 r250)
	----------------------------------------------------------------------------
	Based on previous Pinguino IDE examples by Regis Blanchot
		Dump.pde				(trunk	r208) - for reading a file
		Datalogger.pde		(trunk	r208) - for data assembly into string
	modified to use new SD library based on FatFs R0.09 & 
		developed/modified for use on Pinguino by Alfred Broda
	----------------------------------------------------------------------------
	SD Card connections
	----------------------------------------------------------------------------
	SD card attached to SPI bus as follows:
		MOSI 	- pin 11
		MISO 	- pin 12
		CLK 	- pin 13
		CS 	- pin 8
	----------------------------------------------------------------------------
	Tested with 2G SD card and 8G SDHD card
	----------------------------------------------------------------------------
	The first time the user presses [RETURN] the program adds a new line of data
	to the datafile and then pauses.  The next time the user presses [RETURN]
	the program lists out all the data in the file so that the user can see the
	new data added to the end of the file.
	
	The process then repeats, adding further lines of data and then displaying 
	the updated data file.
	
	The program uses pseudo (dummy) temperature data - but is easily modifiable 
	for use with say a onewire temperature sensor.  The example includes a 
	remarked out line showing the assembly of onewire temperature data 
	(variable t, data type TEMPERATURE) into the string for output to the SD 
	card.
	
	output:
	(GNU/linux) sudo minicom -o -D /dev/ttyACM0
	press <return> to start/continue
	---------------------------------------------------------------------------*/

//#include <stdio.h>	// To deal with compiler warning re incompatible implicit 
							//	declaration of built-in function 'sprintf'
							
#define B_SIZE 32		// Size of read buffer - arbitrary length,
							// try changing it to improve efficiency 

	int 		i, b, l, btw, bw, br;
	char		filename[]	= "datalog1.csv";	// should include full path to file
//	char		filename[]	= "LEVEL_0/datalog.csv";

	FIL 		fil;							// File object
	FRESULT	res,	rc;
	DWORD		file_size;
	char		read_buff[B_SIZE];

char	Day[7][4]		= {"Sat","Sun","Mon","Tue","Wed","Thu","Fri"};
char	Month[13][4]	= {"","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

const	u32 	Tm  	 	= 0x10170000; 	// Time for clock setting 				format = 0xHHMMSS00
const	u32 	Dt  	 	= 0x12011703;	// Date and day for clock setting	format = 0xYYMMDD0W
												//	W = day of week, Saturday = 0 Friday = 6
												// see array Day[][] above
const	u16 	drift		= 180;			// add 180 pulses every minute to adjust time

rtccTime 	cT, curTime;
rtccDate		cD, curDate;

// Prototypes / Advance declarations


void setup()
{

/*	Set Real Time Clock and Calendar */
	RTCC.open(Tm, Dt, drift);							// Sets date, time and calibration & starts RTC

}

void loop()
{
	CDC.println("\n\r*** Press RETURN to add data to data file.");	
	while (CDC.getKey() != '\r');						// wait for RETURN key to start

/*	----------------------------------------------------------------------------
	Insert temperature measurement code here if required 
	If the 18b20.c library functions are used then a variable t of data type 
	TEMPERATURE will need to be declared. 

	see //examples/6.Sensors/DS18B20/temp18b20.pde 
		for code for a single onewire temperature measurement.
	---------------------------------------------------------------------------*/

/*	Get time and date */
	RTCC.getTimeDate(&cT, &cD);						// get time and date
	curTime = RTCC.convertTime(&cT);					// convert time from bcd to decimal format
	curDate = RTCC.convertDate(&cD);					// convert date from bcd to decimal format

/*	Assemble data in buffer with data items separated by comma, i.e. CSV data. 
	The data format is "T#,ddd,dd-mmm-yyyy,hh:mm:ss,##.##" 
		Reference:	e.g. T0
	   Day:			e.g. Mon
		Date:			e.g. 16-Jan-2012
		Time:			e.g. 13:15:12
		Temperature	e.g. 12.34	
	If the datafile is opened with a spreadsheet which is set to recognise CSV data, and 
	possibly also to detect special numbers, each data item should appear in a separate 
	column, although some data items may be automatically converted e.g. the date may be 
	displayed as, say, 16/01/12 if the spreadsheets default date formate is dd/mm/yy. */
	
	char	buffer[40]	= "";								// arbitary value of 40 for length of character array
																// needs to be large enough for maximum line length
	char 	temp[13]		= "";								// temporary variable used for int to char conversions
																// needs to be large enough for maximum string length
																// generated by sprintf() statements below
	sprintf(temp, "T%d,", 0);							// converts y to a string T#,
	strcat (buffer, temp);								// adds T#, to buffer
	sprintf(temp, "%3s,", Day[curDate.wday]);		// converts wday to a string ddd,
	strcat (buffer, temp);								// adds ddd, to buffer
	sprintf(temp, "%02d-%3s-%04d,", curDate.mday, Month[curDate.mon], curDate.year+2000);		
																// converts date to a string dd-mmm-yyyy,
	strcat (buffer, temp);								// adds dd-mmm-yyyy, to buffer
	sprintf(temp, "%02d:%02d:%02d,", curTime.hour, curTime.min, curTime.sec);		
																// converts hours, mins & secs to a string HH:MM:SS,
	strcat (buffer, temp);								// adds HH:MM:SS, to buffer

/*	Code for including a dummy temperature */
	sprintf(temp, "%d.%02d\n", 12, 45);

/*	----------------------------------------------------------------------------
	Alternative code for converting TEMPERATURE t measured using 18b20.c library 
	to string. As noted above a variable t of data type TEMPERATURE needs to be 
	declared to use this alternative code.
	---------------------------------------------------------------------------*
	if (t.sign) {
		strcat (buffer, "-");							// add -ve sign if negative
	}
	sprintf(temp, "%d.%02d\n", t.integer, t.fraction);			
																// converts temperature t to a 
																// string integer.fraction 
/*	---------------------------------------------------------------------------*/
	strcat (buffer, temp);								// adds temperature to buffer

	btw = strlen(buffer);								//	number of Bytes To be Written

	SD.mount(8); 											//	Allocate file structure
	
	/*	Open existing file or new file if file does not already exist */
	res = SD.open(&fil, filename, FA_OPEN_ALWAYS | FA_READ | FA_WRITE);
	if (!res){
		file_size = fil.fsize;							// Get existing file size
		SD.seek(&fil,file_size);						// Set R/W pointer to end of file

		/*	Write data to file */
		rc = SD.write(&fil, buffer, btw, &bw);		// write new data to file
		SD.flush(&fil);									// flush any data in cache to file
																// to avoid data loss from loss of power etc
																
		/*	If all bytes written display data written on terminal */
		if (btw == bw){									// check that all bytes written to file
			CDC.printf("*** New data added ***\r\n%s", buffer);	// prints out buffer
		}
		else {
			CDC.println("\n\r*** Not all data written ***", filename);
		}

		SD.close(&fil);		//	Included for safety to ensure file properly closed
		SD.unmount();			//	in case user removes card instead of proceeding.

		/*	Wait for user input to allow examination of data written */
		CDC.println("\n\r*** Press RETURN to show amended data file.");	
		while (CDC.getKey() != '\r');						// wait for RETURN key to continue

		/*	Re-open existing data file - effectively resets R/W pointer to start of file */
		SD.mount(8); 							//	Allocate file structure
		res = SD.open(&fil, filename, FA_OPEN_EXISTING | FA_READ | FA_WRITE);

		if (!res){

			/*	Display data file on terminal including new data added above */
			CDC.println("\n\r*** File %s contents ***", filename);
			b = 0; 								// byte counter 
			l = 0; 								// line counter
			do {
				rc = SD.read(&fil, read_buff, B_SIZE, &br);	
													// Read a chunk of file
				b = b + br;						// update byte counter
				for(i = 0; i < br; i++){
					CDC.printf("%c", read_buff[i]); 
					if (read_buff[i] == '\n'){
						CDC.printf("\r"); 
						l++;						// increment line counter
					}
				}
			} while(br == B_SIZE);			// while buffer is full 
			CDC.println("*** End of file ***  ");
			CDC.println("*** %d lines, %d bytes read.", l, b);
		}
		else {
			CDC.println("\n\r*** File %s not found or card not in reader (on read) ***", filename);
		}
	}
	else {
		CDC.println("\n\r*** File %s not found or card not in reader (on write) ***", filename);
	}

	SD.close(&fil);
	SD.unmount();

}
