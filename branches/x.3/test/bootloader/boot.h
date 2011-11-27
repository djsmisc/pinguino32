/*                  - Dimax Israel Confidential and Proprietary -
 *
 *  Copyright (C) June 2000, Dimax Israel.  ALL RIGHTS RESERVED.
 *
 *  Except as specifically permitted herein, no portion of the information,
 *  including but not limited to object code and source code, may be reproduced,
 *  modified, distributed, republished or otherwise exploited in any form or by
 *  any means for any purpose without the prior written permission of Dimax 
 *  Israel. Use of software subject to the terms and conditions
 *  detailed in the file "LICENSE.txt".
 *
 */

/*-------------------------------------------------------------------
 * $Id: boot.h,v 1.1.1.1 2006/02/16 17:37:44 mtvs12 Exp $
 *-------------------------------------------------------------------
*/

#ifndef BOOT_H_INCLUDED
#define BOOT_H_INCLUDED

/*
*-----------------------------------------------------------------------------
* Configuration Bits 
*-----------------------------------------------------------------------------
*/
#pragma config	PLLDIV = 4			/* OSC/4 for 16MHz */
#pragma config  CPUDIV = OSC1_PLL2	/* CPU_clk = PLL/2 */			
#pragma config 	USBDIV = 2			/* USB_clk = PLL/2 */
#pragma config 	FOSC = HSPLL_HS		/* HS osc PLL      */ 
#pragma config  FCMEM = ON			/* Fail Safe Clock Monitor */ 
#pragma config  IESO = OFF			/* Int/Ext switchover mode */
#pragma config  PWRT = ON			/* PowerUp Timer   */
#pragma config  BOR = OFF			/* Brown Out       */
#pragma config  VREGEN = ON			/* Int Voltage Regulator   */
#pragma config  WDT = OFF			/* WatchDog Timer  */
#pragma config  MCLRE = ON			/* MCLR            */
#pragma config  LPT1OSC = OFF		/* Low Power OSC   */
#pragma config  PBADEN = ON			/* PORTB<4:0> A/D  */
#pragma config  CCP2MX = ON			/* CCP2 Mux RC1	   */
#pragma config  STVREN = ON			/* Stack Overflow Reset    */
#pragma config  LVP = OFF			/* Low Voltage Programming */
#pragma config  ICPRT = OFF			/* ICP             */
#pragma config  XINST = ON			/* Ext CPU Instruction Set */
#pragma config	DEBUG = OFF			/* Background Debugging    */
#pragma config  CP0 = ON			/* Code Protect */
#pragma config  CP1 = ON   
#pragma config  CP2 = ON   
#pragma config  CP3 = ON   
#pragma config  CPB = ON   			/* Boot Sect Code Protect  */
#pragma config  CPD = OFF  			/* EEPROM Data Protect     */
#pragma config  WRT0 = OFF 			/* Table Write Protect     */
#pragma config  WRT1 = OFF 
#pragma config  WRT2 = OFF 
#pragma config  WRT3 = OFF 
#pragma config  WRTB = ON  			/* Boot Table Write Protest*/
#pragma config  WRTC = ON  			/* Config Write Protect    */
#pragma config  WRTD = OFF 			/* EEPROM Write Protect    */
#pragma config  EBTR0 = OFF			/* Ext Table Read Protect  */
#pragma config  EBTR1 = OFF
#pragma config  EBTR2 = OFF
#pragma config  EBTR3 = OFF
#pragma config  EBTRB = ON 		    /* Boot Table Read Protect */


/*
*-----------------------------------------------------------------------------
* Constants
*-----------------------------------------------------------------------------
*/

/*
* Application FW RESET and INTERRUPT VECTORS
*/
#define	APP_RESET_VECTOR       		0x000800
#define	APP_HIGH_INTERRUPT_VECTOR   0x000808
#define	APP_LOW_INTERRUPT_VECTOR    0x000818


/*
* Bootloader FW Version
*/
#define FW_VER_MAJOR		0
#define FW_VER_MINOR		0
#define FW_VER_SUB_MINOR	6

/*
* EEPROM Mark to run bootloader
*/
#define USE_EEPROM_MARK	    1		/* Enable EEPROM MARK. To disable =0 */
#define EEPROM_MARK_ADDR    0x00
#define EEPROM_MARK         0x5A

/*
* Debug Options
*/
#define UART_DEBUG 0
#if UART_DEBUG
 #define UD_INIT		\
	TXSTAbits.SYNC=0;	\
	TXSTAbits.BRGH=1; 	\
	SPBRG=25;		  	\
	RCSTAbits.SPEN=1;	\
	TXSTAbits.TXEN=1;
 #define UD_TX(BYTE)	\
	TXREG=BYTE;
 #define UD_WTX(BYTE)	\
	while(!PIR1bits.TXIF); TXREG=BYTE;
 #define UD_TXW(BYTE)	\
	TXREG=BYTE; while(!PIR1bits.TXIF);
 #define UD_WTXW(BYTE)	\
	while(!PIR1bits.TXIF); TXREG=BYTE; while(!PIR1bits.TXIF);
#else
 #define UD_INIT
 #define UD_TX(BYTE)
 #define UD_WTX(BYTE)
 #define UD_TXW(BYTE)
 #define UD_WTXW(BYTE)
#endif


/*
*-----------------------------------------------------------------------------
* Global Variables
*-----------------------------------------------------------------------------
*/

/*
*-----------------------------------------------------------------------------
* Global Function Definition
*-----------------------------------------------------------------------------
*/
void set_eep_mark( void );

#endif /*_H_INCLUDED*/

