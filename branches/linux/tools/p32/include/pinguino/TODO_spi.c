/*	----------------------------------------------------------------------------
	FILE:			spi.c
	PROJECT:		pinguino
	PURPOSE:		Serial Peripheral Interface functions
	PROGRAMER:		regis blanchot <rblanchot@gmail.com>
	FIRST RELEASE:	04 jan. 2011
	LAST RELEASE:	04 jan. 2011
	----------------------------------------------------------------------------
	TODO : 
	----------------------------------------------------------------------------
	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
	--------------------------------------------------------------------------*/

#ifndef __SPI_C
	#define __SPI_C

#ifndef SPIx  //Use SPI port 1, see PIC32 Datasheet
#define SPIx 1
#endif

#if SPIx == 1
#define BUFFER		SPI1BUF
#define STATBIT		SPI1STATbits.SPIRBF
#define SPICONF		SPI1CON
#define CLKSPD		SPI1BRG
#endif

#if SPIx == 2
#define BUFFER		SPI2BUF
#define STATBIT		SPI2STATbits.SPIRBF
#define SPICONF		SPI2CON
#define CLKSPD		SPI2BRG
#define	PULLUPS		0xF00 //Use CNPUE = PULLUPS for enable internal pullups 8,9,10,11
#endif

//Only 795 boards have SPI3 and SPI4
#if defined(UBW32_795) || defined(EMPEROR795)

	#if SPIx == 3
	#define BUFFER		SPI2ABUF
	#define STATBIT		SPI2ASTATbits.SPIRBF
	#define SPICONF		SPI2ACON
	#define CLKSPD		SPI2ABRG
	#endif

	#if SPIx == 4
	#define BUFFER		SPI3ABUF
	#define STATBIT		SPI3ASTATbits.SPIRBF
	#define SPICONF		SPI3ACON
	#define CLKSPD		SPI3ABRG
	#endif

#endif

void SPI_init(int speed, int clk)
{
	SPICONF = speed;
	CLKSPD  = clk;
}

/** 
 * 0x8120,		   SPI->ON/CKE->1/CKP->0/8 bit Master
 * 159,            Fpb / (2 * (SPIxBRG + 1)  :.  80M / (2 * (149 +1)) = 250KHz
 */
void InitSPI0()
{
	SPICONF = 0x8120;
	CLKSPD  = 159;
}

unsigned char SPI_write(unsigned char data_out)
{
	SSPBUF = data_out;			// write byte to SSPBUF register
	if (SSPCON1 & 0x80)			// test if write collision occurred
		return (-1);				// if WCOL bit is set return negative #
	else
		while(!SSPSTATbits.BF);	// wait until bus cycle complete
	return (0);						// if WCOL bit is not set return non-negative#
}

unsigned char SPI_read(void)
{
	SSPBUF = 0x00;					// initiate bus cycle
	while (!SSPSTATbits.BF);	// wait until cycle complete
	return (SSPBUF);				// return with byte read
}

#endif
