/*	---------------------------------------------------------------------------
	List files on SD card
	2011 Regis Blanchot <rblanchot@gmail.com>
	2012 Alfred Broda <alfredbroda@gmail.com>
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

void setup()
{
}

void loop()
{
	// wait for RETURN key to start
	CDC.println("Press RETURN to start.");
	while (CDC.getKey() != '\r');
	CDC.println(" ");
	
	// card select is on pin 8	
	if (mount(8)) {
		CDC.println("SD card contents");

		char res, b;
		unsigned int files, dirs;
		SD.Dir dir; /* Directory object */
		SD.FileInfo Finfo; /* File info */

		// open directory
		res = SD.openDir(&dir, "/");
		files = dirs = 0;
		CDC.println("Attr  Time               Size      Name");
		for (;;) {
			if ((SD.readDir(&dir, &Finfo) != 0) || !Finfo.fname[0]) {
				// error or end of files
				break;
			}

			if (SD.isDir(Finfo)) {
				dirs++;
			} else {
				files++;
			}
			CDC.printf("%c%c%c%c%c ", SD.isDir(Finfo) ? 'D' : '-', SD.isRO(
					Finfo) ? 'R' : '-', SD.isHidden(Finfo) ? 'H' : '-',
					SD.isSys(Finfo) ? 'S' : '-', SD.isArch(Finfo) ? 'A' : '-');
			CDC.printf("%u/%02u/%02u %02u:%02u ", (Finfo.fdate >> 9) + 1980,
					(Finfo.fdate >> 5) & 15, Finfo.fdate & 31, (Finfo.ftime >> 11),
					(Finfo.ftime >> 5) & 63);
			CDC.printf(" %9u ", Finfo.fsize);
			CDC.println(" %-12s", Finfo.fname);
		}
		CDC.println("found %d file(s), %d directories", files, dirs);
		unmount();
	} else {
		CDC.println("Mount failed!");
	}
}
