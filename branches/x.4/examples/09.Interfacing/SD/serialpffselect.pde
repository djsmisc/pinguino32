/*
 * Project name:
     FatFs
 * Copyright:
     (c) Jonas Andersson (jonas@haksberg.net) 2009
 * Revision History:
 1st July 2012
 	modified by Pinguino Team according to Pinguino Project
 SD Library requested 
   * Description:File

 * Test configuration:
     MCU:             PIC18F26J50
     Dev.Board:       pinguino 18f26j50 or clone
     Oscillator:      HSPLL 8 or 20 MHz  (raised with PLL to 48.000MHz)
 * NOTES:
 This application allows to read/dump files from SD cards to RS232 terminal or to write
 data or messages on existing files on your SD cards.
 It requests to run a serial terminal (9600 bauds).
*/
    /** I/O pin definitions ****************************************/
/*	circuit:
	* SD card attached to SPI bus as follows:
	** MOSI - pin 1 (RB1)
	** MISO - pin 3 (RB3)
	** CLK - pin 2  (RB2)
	** CS - pin 0   (RB0)
*/
#include <stdlib.h>
#define SERIAL_PRINT // to add if you use SD.printSector or SD.list and serial communication

// Following get_line function allows to enter commands from a serial terminal
// available commands to end with Enter key :
// fi<enter> to init the exchange with your SD card (FAT16 formatted)
// fl /<enter> to list the root directory (designated by /) and known the existing files
// fo <filename><enter> to open a file among the preceding list
// fd<enter> to dump the entire file previously opened on the terminal
// fe<enter> to position the file pointer before writing (0 address only in this 
//            application - to change later
// fw <len> <value><enter> to write the text contained in value. Be careful the number of characters must be equals to <len>
// fu<enter> to unmount the SD card

// see other applications to record data periodically and read these data 
//         (raw data mode without opening a file)

u8 Line[128];  /* Serial Console input buffer */
static void get_line (u8 *buff, u8 len)
{
	u8 c, i;

	i = 0;
	for (;;) {
		c = Serial.getKey();
		if (c == '\r') break;
		if ((c == '\b') && i) i--;
		if ((c >= ' ') && (i < len - 1))
				buff[i++] = c;
	}
	buff[i] = 0;
	Serial.printf("\n");
}

void setup()
{
  Serial.begin(9600);
}
void loop()
{
  u8 *ptr;
  FRESULT FResult;
  u8 sector_buffer[512];
  u8 data_buffer_32[33];
  u8 alen[4];
  u8 na;
  int len;
  Fatfs fs;
  DIR dir;
  u16 br, bw;

// entering commands
  Serial.printf("\r\n>");
  get_line(Line, sizeof(Line));
  ptr = Line;
  delay(100);
  switch (*ptr++)
  {
    case 'f' :
      switch (*ptr++)
      {
        case 'i' :	/* fi - Mount the volume */

          Serial.printf("\r\nPIC is online...\r\nInitializing SD-card.\r\n");
          Serial.printf("\r\nAttempting to mount file system.\r\n");
          FResult = SD.mount(&fs);
          if( FResult == FR_OK )
            Serial.printf("\r\nSuccesful mounting filesystem.\r\n");
          else if(FResult == FR_DISK_ERR)
          {
            Serial.printf("\r\nError while initiating SD-card; ");
            break;
          }
          else
          {
            Serial.printf("\r\nError trying to mount filesystem; %c.\r\n",(FResult + 0x30));
            break;
          }
          break;
  
        case 'l' :	/* fl [<path>] - Directory listing */
          while (*ptr == ' ') ptr++;
// do a directory listing and list all files on the SD-card
          Serial.printf("\r\nDirectory and File listing\r\n");

          FResult = SD.list(ptr);
          break;
        case 'o' : /* fo <filename> */
          while (*ptr == ' ') ptr++;

          Serial.printf("\r\nAttempting to open file %s.\r\n",ptr);
// open file
          FResult = SD.open(ptr);
          if( FResult == FR_OK )
            Serial.printf("\r\nSuccesful opening \r\n");
          else
            Serial.printf("\r\nError trying to open file; %c.\r\n",(FResult + 0x30));
          break;
        case 'd' :	/* fd - Read the file 128 bytes and dump it */

// read file and print it until it ends
          do
          {
          // Read repeatedly 32 bytes from the file
            if( (FResult = SD.read(data_buffer_32, 32, &br)) == FR_OK )
            {
          // printf() needs a C-string (NULL terminated)
              data_buffer_32[br] = 0;
              Serial.printf("%s",data_buffer_32);
              if( br < 32) Serial.printf("\r\n");
            }
          else
          {
            Serial.printf("\r\nError trying to read file; %c.\r\n",(FResult + 0x30));
            break;
          }
          } while( br == 32 );	// if the pf_Read reads less then 32 bytes the file has ended
          break;
        case 'e' : /* fe <value>- Move file pointer */
          SD.lseek(0);
          break;
        case 'w' :	/* fw <len> <value>- Write the file */
          while (*ptr == ' ') ptr++;
          na=0;
          while (*ptr != ' ') {alen[na++]= *ptr; ptr++;}
          alen[na]= 0; // length to write (ASCII value)
          len = atoi (alen); // conversion to int
          while (*ptr == ' ') ptr++;
          if( (FResult = SD.write(ptr, len, &bw)) == FR_OK )
          {
            Serial.printf("Written bytes = %d\r\n",bw);
            Serial.printf("%s\r\n",ptr);
            SD.write(0, 0, &bw);//to finalize neatly the file
      //the last cluster/sector is filled with NULL as much as necessary
          }
          else
            Serial.printf("\r\nError trying to write file; %c.\r\n",(FResult + 0x30));
          break;

        case 'u' :	/* fu - unmount drive */

        // unmount drive
          Serial.printf("\r\nAttempting to UNmount file system.");

          FResult = SD.mount(NULL); // = unmount
          if( FResult != FR_OK )
            Serial.printf("\r\nError trying to UNmount filesystem; %c.\r\n",(FResult + 0x30));
          else
            Serial.printf("\r\nFile system succesfully unmounted.\r\n");
          break;
    }
  }
}
