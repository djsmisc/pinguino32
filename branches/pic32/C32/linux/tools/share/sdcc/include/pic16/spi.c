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

	#include <digitalw.c>
	#include <stdarg.h>
	#include <stdio.c>

	// pins
	#define SPI_DATA_IN 					0		// RB0 = SDI
	#define SPI_CLOCK						1		// RB1 = SCK
	#define SPI_DATA_OUT					9		// RC7 = SDO
	#define SPI_SLAVE_SELECT				17		// RA5 = SS
	// bus mode
	#define SPI_MODE_00						0
	#define SPI_MODE_01						1
	#define SPI_MODE_10						2
	#define SPI_MODE_11						3
	// sync mode
	#define SPI_SLAVE_MODE_WITHOUT_SS		0b0101
	#define SPI_SLAVE_MODE_WITH_SS			0b0100
	#define SPI_MASTER_MODE_CLOCK_TMR2		0b0011
	#define SPI_MASTER_MODE_CLOCK_FOSC64	0b0010
	#define SPI_MASTER_MODE_CLOCK_FOSC16	0b0001
	#define SPI_MASTER_MODE_CLOCK_FOSC4		0b0000
	// smp phase
	#define SPI_SLEW_RATE_ENABLE			0
	#define SPI_SLEW_RATE_DISABLE			128
	#define SPI_STANDARD_SPEED_MODE			0
	#define SPI_HIGH_SPEED_MODE				128

/*	----------------------------------------------------------------------------
	ex. SPI_init(SPI_MASTER_MODE_CLOCK_FOSC4, SPI_MODE_00, SPI_HIGH_SPEED_MODE)
	--------------------------------------------------------------------------*/

	void SPI_init(u8 sync_mode, u8 bus_mode, u8 smp_phase)
	{
		SSPSTAT &= 0x3F;				// power on state
		SSPCON1 = 0x00;					// power on state
		SSPCON1 |= sync_mode;			// select SPI mode
		SSPSTAT |= smp_phase;			// select data input sample phase

		switch (bus_mode)
		{
			case SPI_MODE_00:			// SPI bus mode 0,0
				SSPCON1bits.CKP = 0;	// clock idle state high
				SSPSTATbits.CKE = 1;	// data transmitted on rising edge
				break;
			case SPI_MODE_10:			// SPI bus mode 1,0
				SSPCON1bits.CKP = 1;	// clock idle state high
				SSPSTATbits.CKE = 1;	// data transmitted on falling edge
				break;
			case SPI_MODE_11:			// SPI bus mode 1,1
				SSPSTATbits.CKE = 1;	// data transmitted on falling edge
				SSPCON1bits.CKP = 0;	// clock idle state high
				break;
			default://SPI_MODE_01		// default SPI bus mode 0,1
				SSPCON1bits.CKP = 0;	// clock idle state high
				SSPSTATbits.CKE = 0;	// data transmitted on rising edge
				break;
		}

		switch (sync_mode)
		{
			case SPI_SLAVE_MODE_WITH_SS:// slave mode w /SS enable
				pinmode(SPI_SLAVE_SELECT, INPUT);// TRISAbits.TRISA5 = 1;	// define /SS pin as input
			case SPI_SLAVE_MODE_WITHOUT_SS:	// slave mode w/o /SS enable
				pinmode(SPI_CLOCK, INPUT);// TRISBbits.TRISB1 = 1;	// define clock pin as input
				SSPSTATbits.SMP = 0;	// must be cleared in slave SPI mode
				break;
			default:					// master mode, define clock pin as output
				pinmode(SPI_CLOCK, OUTPUT);// TRISBbits.TRISB1 = 0;	// define clock pin as output
				break;
		}

		pinmode(SPI_DATA_OUT, OUTPUT);	// TRISC &= 0x7F; // define SDO as output (master or slave)
		pinmode(SPI_DATA_IN, INPUT);	// TRISB |= 0x01; // define SDI as input (master or slave)
		SSPCON1bits.SSPEN = 1;			// enable synchronous serial port
	}

/*	----------------------------------------------------------------------------
	SPI_write
	--------------------------------------------------------------------------*/

	u8 SPI_write(u8 data_out)
	{
		SSPBUF = data_out;				// write byte to SSPBUF register
		if (SSPCON1 & 0x80)				// test if write collision occurred
			return (-1);				// if WCOL bit is set return negative #
		else
		{
			while(!SSPSTATbits.BF); 	// wait until bus cycle complete
		}
		return (0);						// if WCOL bit is not set return non-negative#
	}

/*	----------------------------------------------------------------------------
	SPI_read
	--------------------------------------------------------------------------*/

	u8 SPI_read(void)
	{
		SSPBUF = 0x00;					// initiate bus cycle
		while (!SSPSTATbits.BF);		// wait until cycle complete
			return (SSPBUF);			// return with byte read
	}

/*	----------------------------------------------------------------------------
	SPI_printf : write formated string on the SPI bus
	--------------------------------------------------------------------------*/

	void SPI_printf(char *fmt, ...)
	{
		va_list args;

		va_start(args, fmt);
		pprintf(SPI_write, fmt, args);
		va_end(args);
	}

#endif
