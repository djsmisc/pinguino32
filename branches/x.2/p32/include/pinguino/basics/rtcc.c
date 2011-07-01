/*	----------------------------------------------------------------------------
	FILE:  rtcc.c
	PROJECT: 	pinguino32
	PURPOSE: 	Real Time Clock and Calendar functions
	PROGRAMER: regis blanchot <rblanchot@gmail.com>
	FIRST RELEASE:	11 apr. 2011
	LAST RELEASE:	11 apr. 2011
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

#ifndef __RTCC_C
#define __RTCC_C

#include <typedef.h>
#include <const.h>
#include <macro.h>
#include <system.c>
#include <bcd.c>

// RTCC definitions

// union/structure for read/write of time into the RTCC device
typedef union
{
	struct
	{
		unsigned char	rsvd;		// reserved for future use. should be 0
		unsigned char	sec;		// BCD codification for seconds, 00-59
		unsigned char	min;		// BCD codification for minutes, 00-59
		unsigned char	hour;		// BCD codification for hours, 00-24
	};								// field access
	unsigned char		b[4];		// byte access
	unsigned short		w[2];		// 16 bits access
	unsigned long		l;			// 32 bits access
}rtccTime;

// union/structure for read/write of date into the RTCC device
typedef union
{
	struct
	{
		unsigned char	wday;		// BCD codification for day of the week, 00-06
		unsigned char	mday;		// BCD codification for day of the month, 01-31
		unsigned char	mon;		// BCD codification for month, 01-12
		unsigned char	year;		// BCD codification for years, 00-99
	};								// field access
	unsigned char		b[4];		// byte access
	unsigned short		w[2];		// 16 bits access
	unsigned long		l;			// 32 bits access
}rtccDate;

// results returned by initialization functions
typedef enum
{
	RTCC_CLK_ON,			// success, clock is running
	RTCC_SOSC_NRDY,		// SOSC not running
	RTCC_CLK_NRDY,			// RTCC clock not running
	RTCC_WR_DSBL,			// WR is disabled
}rtccRes;

// Repeat alarm every ...
#define RTCC_ALARM_EVERY_HALF_SECOND	0b000000000000
#define RTCC_ALARM_EVERY_SECOND 			0b000100000000
#define RTCC_ALARM_EVERY_TEN_SECONDS	0b001000000000
#define RTCC_ALARM_EVERY_MINUTE 			0b001100000000
#define RTCC_ALARM_EVERY_TEN_MINUTES	0b010000000000
#define RTCC_ALARM_EVERY_HOUR 			0b010100000000
#define RTCC_ALARM_EVERY_DAY  			0b011000000000
#define RTCC_ALARM_EVERY_WEEK 			0b011100000000
#define RTCC_ALARM_EVERY_MONTH 			0b100000000000
#define RTCC_ALARM_EVERY_YEAR 			0b100100000000 // except when configured for February 29th, once every 4 years

/*	----------------------------------------------------------------------------
	RTCC REGISTERS
	----------------------------------------------------------------------------
	RTCCON
	RTCALRM
	RTCTIME
	RTCDATE
	ALRMTIME
	ALRMDATE 
	--------------------------------------------------------------------------*/

/*
void RTCC_WrEnable(int enable)
{
	if(enable)
		mSysUnlockOpLock(RTCCONSET=_RTCCON_RTCWREN_MASK);	
	else
		RTCCONCLR=_RTCCON_RTCWREN_MASK;
}
*/

// Allow a writing into the clock registers
// In order to perform a write to any of the RTCC timer registers, the RTCWREN bit (RTCCON<3>)
// must be set. Setting of the RTCWREN bit is only allowed once the device level unlocking
// sequence has been executed.

void RTCC_Unlock(void)
{
	// assume interrupts are disabled
	// assume the DMA controller is suspended
	// assume the device is locked

	SystemUnlock();
	RTCCONSET = 0x8; // set RTCWREN (bit 3) in RTCCONSET
	SystemLock();

	// re-enable interrupts
	// re-enable the DMA controller
}

// Allow a writing into the clock registers
int RTCC_SetWriteEnable(void)
{
	RTCC_Unlock();
}

// Check that RTCC is writable
int RTCC_GetWriteEnable(void)
{
	 return RTCCONbits.RTCWREN!=0;
}

// RTCC enabled
void RTCC_Enable(void)
{
	//RTCCON |= (1 << 15);
	RTCCONSET = 0x8000;			// turn on the RTCC
}

// RTCC disabled
void RTCC_Disable(void)
{
	//RTCCON |= !(1 << 15);
	RTCCONCLR = 0x8000;			// turn off the RTCC
	while (RTCCON & 0x40);		// wait for clock to be turned off
}

// TODO
int RTCC_GetEnable(void)
{
}

// Check that the Secondary Oscillator (SOSC) is running.
rtccRes RTCC_GetClockStatus(void)
{
	if( (!(OSCCONbits.SOSCEN)) || (!(OSCCONbits.SOSCRDY)) )
		return RTCC_SOSC_NRDY;
	else if(!(RTCCONbits.RTCCLKON))	// if RTCC Clock is not running
		return RTCC_CLK_NRDY;
	return RTCC_CLK_ON;
}

// Enable the oscillator for the RTCC
// To allow the RTCC to be clocked by an external 32.768 kHz crystal, the SOSCEN bit
// (OSCCON<1>) must be set (refer to Register 6-1 in Section 6. “Oscillators” (DS61112)) in the
// “PIC32 Family Reference Manual”. This is the only bit outside of the RTCC module with which
// the user must be concerned for enabling the RTCC. 

void RTCC_Init(void)
{
	// Enable the Secondary Oscillator for the RTCC
	// Allow the RTCC to be clocked by an external 32.768 kHz crystal,
	// An unlock sequence is required before a write to OSCCON can occur
	SystemUnlock();
	OSCCONbits.SOSCEN = 1;
	SystemLock();
	// Wait for the SOSC to run
	while (RTCC_GetClockStatus() != RTCC_CLK_ON);
	// Unlock sequence must take place for RTCEN to be written
	RTCC_Unlock();
	RTCC_Enable();
}

void RTCC_Shutdown(void)
{
	RTCC_Disable();
}

void RTCC_SetTime(unsigned long tm)
{
	RTCC_Disable();
	RTCTIME = tm;					// Set time
	RTCC_Enable();
}

rtccTime RTCC_GetTime(void)
{
	rtccTime t0, t1;
	do
	{
		t0.l = RTCTIME;
		t1.l = RTCTIME;
	} while (t0.l != t1.l);
	t0.hour = bcd2bin(t1.hour);
	t0.min  = bcd2bin(t1.min);
	t0.sec  = bcd2bin(t1.sec);
	return t0;
}

void RTCC_SetDate(unsigned long dt)
{
	RTCC_Disable();
	RTCDATE = dt;					// Set date
	RTCC_Enable();
}

rtccDate RTCC_GetDate(void)
{
	rtccDate d0, d1;
	do
	{
		d0.l = RTCDATE;
		d1.l = RTCDATE;
	} while (d0.l != d1.l);
	d0.wday = bcd2bin(d0.wday);
	d0.mday = bcd2bin(d0.mday);
	d0.mon  = bcd2bin(d0.mon);
	d0.year = bcd2bin(d0.year);
	return d0;
}

void RTCC_SetTimeDate(unsigned long tm, unsigned long dt)
{
	RTCC_Disable();
	RTCTIME = tm;					// Set time
	RTCDATE = dt;					// Set date
	RTCC_Enable();
}

void RTCC_GetTimeDate(rtccTime* pTm, rtccDate* pDt)
{
	rtccTime	t0;
	rtccDate	d0;
	do
	{
		d0.l = RTCDATE;
		t0.l = RTCTIME;
		pTm->l = RTCTIME;
		pDt->l = RTCDATE;
	} while ((d0.l != pDt->l) || (t0.l != pTm->l)); // update the user requested data
}

void RTCC_SetCalibration(int cal)
{
	rtccTime t0;
	if (RTCCON & 0x8000)						// if RTCC is ON
	{
		t0 = RTCC_GetTime();
		if ((t0.sec & 0xFF) == 00)			// we're at second 00, wait auto-adjust to be performed
			while(!(RTCCON & 0x2));			// wait until second half...
	}
	RTCCONCLR = 0x03FF0000;					// clear the calibration
	RTCCONSET = cal;
}

int RTCC_GetCalibration(void)
{
	 return RTCCONbits.CAL;
}

/*	-----------------------------------------------------------------------------
	unsigned long alTime=0x23352300;	// set time to 23hr, 35 min, 23 sec
	unsigned long alDate=0x06111301;	// set date to Monday 13 Nov 2006
	---------------------------------------------------------------------------*/

void RTCC_SetAlarmTime(unsigned long alTime)
{
	while (RTCALRM & 0x1000);	// wait ALRMSYNC to be off
	RTCALRMCLR = 0xCFFF;			// clear the ALRMEN, CHIME, AMASK and ARPT;
	ALRMTIME = alTime;
}

rtccTime RTCC_GetAlarmTime(void)
{
	rtccTime	t0;
	t0.l = ALRMTIME;
	return t0;
}

void RTCC_SetAlarmDate(unsigned long alDate)
{
	while (RTCALRM & 0x1000);	// wait ALRMSYNC to be off
	RTCALRMCLR = 0xCFFF;			// clear the ALRMEN, CHIME, AMASK and ARPT;
	ALRMDATE = alDate;
}

rtccDate RTCC_GetAlarmDate(void)
{
	rtccDate	d0;
	d0.l = ALRMDATE;
	return d0;
}

void RTCC_SetAlarmTimeDate(unsigned long alTime, unsigned long alDate)
{
	while (RTCALRM & 0x1000);	// wait ALRMSYNC to be off
	RTCALRMCLR = 0xCFFF;			// clear the ALRMEN, CHIME, AMASK and ARPT;
	ALRMTIME = alTime;
	ALRMDATE = alDate;
}

void RTCC_GetAlarmTimeDate(rtccTime* pTm, rtccDate* pDt)
{
	pTm->l = ALRMTIME;
	pDt->l = ALRMDATE;
}

void RTCC_AlarmEnable(void)
{
	RTCALRMbits.ALRMEN = 1;   	// Alarm is enabled
}

void RTCC_AlarmDisable(void)
{
	RTCALRMbits.ALRMEN = 0;   	// Alarm is disabled
}

int RTCC_GetAlarmEnable(void)
{
	int	isAlrm0, isAlrm1;
	do
	{
		isAlrm0=RTCALRMbits.ALRMEN;
		isAlrm1=RTCALRMbits.ALRMEN;
	} while (isAlrm0 != isAlrm1);

	return isAlrm0;
}

void RTCC_ChimeEnable(void)
{
	// CHIME should not be written when the RTCC ON bit = ‘1’ (RTCCON<15>) and ALRMSYNC = 1.
	RTCC_Disable();
	RTCALRMbits.ALRMSYNC = 0;
	RTCALRMbits.CHIME = 1;   	// chime is on
	RTCC_Enable();
}

void RTCC_ChimeDisable(void)
{
	// CHIME should not be written when the RTCC ON bit = ‘1’ (RTCCON<15>) and ALRMSYNC = 1.
	RTCC_Disable();
	RTCALRMbits.ALRMSYNC = 0;
	RTCALRMbits.CHIME = 0;   	// chime is off
	RTCC_Enable();
}

int RTCC_GetChimeEnable(void)
{
	int	ch0, ch1;
	do
	{
		ch0 = RTCALRMbits.CHIME;
		ch1 = RTCALRMbits.CHIME;
	}while (ch0 != ch1);

	return ch0;
}

/*	-----------------------------------------------------------------------------
	alarm repeat every year, month, week, day, hour minute ...
	---------------------------------------------------------------------------*/

void RTCC_SetAlarmRepeat(rpt)
{
	RTCALRMSET=0x8000|rpt;
}


int RTCC_GetAlarmRepeat(void)
{
	int r0, r1;

	do
	{
		r0 = RTCALRMbits.AMASK;
		r1 = RTCALRMbits.AMASK;
	}while (r0 != r1);

	return r0;
}

/*	-----------------------------------------------------------------------------
	Alarm will trigger rptCnt times
	---------------------------------------------------------------------------*/

void RTCC_SetAlarmRepeatCount(int rptCnt)
{
	RTCALRMbits.ARPT = rptCnt;
}

int RTCC_GetAlarmRepeatCount(void)
{
	int rpt0, rpt1;
	do
	{
		rpt0 = RTCALRMbits.ARPT;
		rpt1 = RTCALRMbits.ARPT;
	} while (rpt0 != rpt1);

	return rpt0;
}

int RTCC_GetSync(void)
{
	 return RTCCONbits.RTCSYNC!=0;
}

int RTCC_GetHalfSecond(void)
{
	 return RTCCONbits.HALFSEC!=0;
}

void RTCC_SelectPulseOutput(int secPulse)
{
	if (secPulse)
		RTCCONbits.RTSECSEL = 1;	// RTCC Seconds Clock is selected for the RTCC pin
	else
		RTCCONbits.RTSECSEL = 0;	// RTCC Alarm Pulse is selected for the RTCC pin
}

void RTCC_AlarmPulseHigh(void)
{
	RTCALRMbits.ALRMEN = 0;		// Alarm is disabled
	RTCALRMbits.PIV = 1;			// PIV is writable and determines the initial value of the Alarm Pulse.
	RTCALRMbits.ALRMEN = 1;		// Alarm is enabled
}

void RTCC_AlarmPulseLow(void)
{
	RTCALRMbits.ALRMEN = 0;		// Alarm is disabled
	RTCALRMbits.PIV = 0;			// PIV is writable and determines the initial value of the Alarm Pulse.
	RTCALRMbits.ALRMEN = 1;		// Alarm is enabled
}

void RTCC_AlarmPulseToggle(void)
{
}

int RTCC_GetAlarmPulse(void)
{
	return RTCALRMbits.PIV!=0;
}

void RTCC_OutputEnable(int enable)
{
	if(enable)
		RTCCONbits.RTCOE = 1;
	else
		RTCCONbits.RTCOE = 0;
}

int RTCC_GetOutputEnable(void)
{
	 return RTCCONbits.RTCOE!=0;
}

void RTCC_FreezeEnable(int enable)
{
	if (enable)
		RTCCONbits.FRZ = 1;
	else
		RTCCONbits.FRZ = 0;
}

int RTCC_GetFreeze(void)
{
	return RTCCONbits.FRZ!=0;
}

#endif	/* __RTCC_C */

