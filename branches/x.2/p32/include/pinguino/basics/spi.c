/*	----------------------------------------------------------------------------
	FILE:			spi.c
	PROJECT:		pinguino
	PURPOSE:		Serial Peripheral Interface functions
	PROGRAMER:		Régis Blanchot <rblanchot@gmail.com>
						Marcus Fazzi <anunakin@gmail.com>
						Jean-Pierre Mandon <jp.mandon@gmail.com>
	FIRST RELEASE:	16 mar. 2011
	LAST RELEASE:	17 jun. 2011
	----------------------------------------------------------------------------
	CHANGELOG : 
		24 may. 2011 - jp.mandon - fixed a bug in SPI_write, RX int flag must be called even for write
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
/**
 *	Microchip making changes do SPI SFR numbers and changing 2A to 3, and 3A to 4
 * but it need a new processor.o and updated compiler libraries, not released at this time.
 *  
 *  MX440 and MX460 have only 2 SPI ports
 */
#ifndef __SPI_C
#define __SPI_C

#include <system.c>
#include <interrupt.c>

#define SPI1 1
#define SPI2 2
#define SPI3 3
#define SPI4 4

#ifndef SPIx  		// Use SPI port 1, see PIC32 Datasheet
#define SPIx 2		// default SPI port is 2 ( 32MX440F256H has only one SPI port )
#endif

#if defined(UBW32_460) || defined(EMPEROR460)

#if (SPIx == 1)
#define BUFFER		SPI1BUF
#define STATUS		SPI1STATCLR
#define STATRX  	SPI1STATbits.SPIRBF	// receive buffer full
#define STATTX		SPI1STATbits.SPITBE	// transmit buffer full
#define SPICONF	SPI1CON
#define CLKSPD		SPI1BRG
#endif

#endif

#if (SPIx == 2)
#define BUFFER		SPI2BUF
#define STATUS		SPI2STATCLR
#define STATRX  	SPI2STATbits.SPIRBF	// receive buffer full
#define STATTX		SPI2STATbits.SPITBE	// transmit buffer full
#define SPICONF	SPI2CON
#define CLKSPD		SPI2BRG
#define PULLUPS	0xF00 //Use CNPUE = PULLUPS for enable internal pullups 8,9,10,11
#endif

//Only 795 boards have SPI3 and SPI4
#if defined(UBW32_795) || defined(EMPEROR795)

#if (SPIx == 3)
#define BUFFER		SPI3ABUF
#define STATUS		SPI3STATCLR
#define STATRX  	SPI3ASTATbits.SPIRBF	// receive buffer full
#define STATTX		SPI3ASTATbits.SPITBE	// transmit buffer full
#define SPICONF	SPI3ACON
#define CLKSPD		SPI3ABRG
#endif

#if (SPIx == 4)
#define BUFFER		SPI4ABUF
#define STATUS		SPI4STATCLR
#define STATRX  	SPI4ASTATbits.SPIRBF	// receive buffer full
#define STATTX		SPI4ASTATbits.SPITBE	// transmit buffer full
#define SPICONF	SPI4ACON
#define CLKSPD		SPI4ABRG
#endif

#endif

// The SPI module offers the following operating modes:
// • 8-Bit, 16-Bit, and 32-bit data transmission modes
// • 8-Bit, 16-Bit, and 32-bit data reception modes
// • Master and Slave modes
// • Framed SPI modes

// SPIxCON.MSTEN
#define SPI_MASTER			1
#define SPI_SLAVE				0
#define SPI_PBCLOCK_DIV2	2
#define SPI_PBCLOCK_DIV4	4
#define SPI_PBCLOCK_DIV8	8
#define SPI_PBCLOCK_DIV16	16
#define SPI_PBCLOCK_DIV32	32
#define SPI_PBCLOCK_DIV64	64

void SPI_mode(u8 mode)
{
	STATUS=0x40;				// clear the Overflow
	if (mode == SPI_MASTER)
		SPICONF=0x8220;		// SPI ON, 8 bits transfer, SMP=1, Master mode
	if (mode == SPI_SLAVE)
		SPICONF=0x8000;		// SPI ON, 8 bits transfer, Slave mode
}

// Fsck = Fpb / (2 * (SPIxBRG + 1)
// SPIxBRG = Fpb / (2 * Fsck) - 1 
void SPI_clock(u32 speed)	// (int speed, int clk)
{
	u32 Fpb;
	u32 Fsck;
	u16 clk;

	Fpb = GetPeripheralClock();
	if (speed>(Fpb/2)) clk=0;
	else clk=Fpb/(2*speed)-1;
	if (clk > 511) clk = 511; // use the minimum baud rate possible
	CLKSPD  = clk;
}

void SPI_close() //(u8 num)
{
	int rData;
	#if defined(UBW32_460) || defined(EMPEROR460)
	#if (SPIx == 1)
	// Disable all SPIx interrupts
	IntDisable(INT_SPI1_FAULT); 
	IntDisable(INT_SPI1_TRANSFER_DONE); 
	IntDisable(INT_SPI1_RECEIVE_DONE);
	// Stops and resets the SPIx
	SPICONF=0;
	// clears the receive buffer
	rData=BUFFER;
	#endif
	#endif
	#if (SPIx == 2)
	// Disable all SPIx interrupts
	IntDisable(INT_SPI2_FAULT); 
	IntDisable(INT_SPI2_TRANSFER_DONE); 
	IntDisable(INT_SPI2_RECEIVE_DONE);
	// Stops and resets the SPIx
	SPICONF=0;
	// clears the receive buffer
	rData=BUFFER;
	#endif
	//Only 795 boards have SPI3 and SPI4
	#if defined(UBW32_795) || defined(EMPEROR795)
	#if (SPIx == 3)
	// Disable all SPIx interrupts
	IntDisable(INT_SPI3_FAULT); 
	IntDisable(INT_SPI3_TRANSFER_DONE); 
	IntDisable(INT_SPI3_RECEIVE_DONE);
	// Stops and resets the SPIx
	SPICONF=0;
	// clears the receive buffer
	rData=BUFFER;
	#endif
	#if (SPIx == 4)
	// Disable all SPIx interrupts
	IntDisable(INT_SPI4_FAULT); 
	IntDisable(INT_SPI4_TRANSFER_DONE); 
	IntDisable(INT_SPI4_RECEIVE_DONE);
	// Stops and resets the SPIx
	SPICONF=0;
	// clears the receive buffer
	rData=BUFFER;
	#endif
	#endif
}

/*	-----------------------------------------------------------------------------
	The following code assumes that none of the SPIx input pins are shared with
	an analog input. If so, the AD1PCFG and corresponding TRIS registers have to 
	be properly configured.
	---------------------------------------------------------------------------*/

void SPI_init()
{
	int rData;

	SPI_close();
	#if defined(UBW32_460) || defined(EMPEROR460)
	#if (SPIx == 1)
	// clear any existing SPIx event and Set IPL=3, Subpriority 1
	IntSetVectorPriority(INT_SPI1_VECTOR, 3, 1);
	// Enable RX, TX and Error interrupts
	IntEnable(INT_SPI1_FAULT); 
	IntEnable(INT_SPI1_TRANSFER_DONE); 
	IntEnable(INT_SPI1_RECEIVE_DONE);
	#endif
	#endif
	#if (SPIx == 2)
	// clear any existing SPIx event and Set IPL=3, Subpriority 1
	//IntSetVectorPriority(INT_SPI2_VECTOR, 3, 1);
	// Enable RX, TX and Error interrupts
	//IntEnable(INT_SPI2_FAULT); 
	//IntEnable(INT_SPI2_TRANSFER_DONE); 
	//IntEnable(INT_SPI2_RECEIVE_DONE);
	#endif
	//Only 795 boards have SPI3 and SPI4
	#if defined(UBW32_795) || defined(EMPEROR795)
	#if (SPIx == 3)
	// clear any existing SPIx event and Set IPL=3, Subpriority 1
	IntSetVectorPriority(INT_SPI3_VECTOR, 3, 1);
	// Enable RX, TX and Error interrupts
	IntEnable(INT_SPI3_FAULT); 
	IntEnable(INT_SPI3_TRANSFER_DONE); 
	IntEnable(INT_SPI3_RECEIVE_DONE);
	#endif
	#if (SPIx == 4)
	// clear any existing SPIx event and Set IPL=3, Subpriority 1
	IntSetVectorPriority(INT_SPI4_VECTOR, 3, 1);
	// Enable RX, TX and Error interrupts
	IntEnable(INT_SPI4_FAULT); 
	IntEnable(INT_SPI4_TRANSFER_DONE); 
	IntEnable(INT_SPI4_RECEIVE_DONE);
	#endif
	#endif	
	SPI_clock(250000);
	SPI_mode(SPI_MASTER);
}

/*
void SPI2_init()
{
	SPI_init(SPI2);
}
*/

unsigned int SPI_write(unsigned int data_out)
{
	BUFFER = data_out;	// write to buffer for TX
	while (!STATRX);		// wait for transfer complete
	return BUFFER;
}

unsigned int SPI_read(void)
{
	BUFFER = 0x00;
	while (!STATRX);		// wait until cycle complete
	return BUFFER;			// return with byte read
}

/*	----------------------------------------------------------------------------
	SPIInterrupt
	TODO: move this to interrupt library and add it to main32.c ?
	--------------------------------------------------------------------------*/

// vector 23
#if defined(UBW32_460) || defined(EMPEROR460)
void SPI1Interrupt(void)
{
	int rData;

	// Is this an RX interrupt ?
	if (IntGetFlag(INT_SPI1_RECEIVE_DONE))
	{
		rData = BUFFER;			// Read SPI data buffer
		IntClearFlag(INT_SPI1_RECEIVE_DONE);
	}
	// Is this an TX interrupt ?
	if (IntGetFlag(INT_SPI1_TRANSFER_DONE))
	{
		IntClearFlag(INT_SPI1_TRANSFER_DONE);
	}
}
#endif

// vector 31
void SPI2Interrupt(void)
{
	int rData;

	// Is this an RX interrupt ?
	if (IntGetFlag(INT_SPI2_RECEIVE_DONE))
	{
		rData = BUFFER;			// Read SPI data buffer
		IntClearFlag(INT_SPI2_RECEIVE_DONE);
	}
	// Is this an TX interrupt ?
	if (IntGetFlag(INT_SPI2_TRANSFER_DONE))
	{
		IntClearFlag(INT_SPI2_TRANSFER_DONE);
	}
}

#endif	/* __SPI_C */
