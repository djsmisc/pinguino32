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

// Repeat alarm every ...
#define RTCC_EVERY_HALF-SECOND	0b0000
#define RTCC_EVERY_SECOND 			0b0001
#define RTCC_EVERY_TEN_SECONDS	0b0010
#define RTCC_EVERY_MINUTE 			0b0011
#define RTCC_EVERY_TEN_MINUTES	0b0100
#define RTCC_EVERY_HOUR 			0b0101
#define RTCC_EVERY_DAY  			0b0110
#define RTCC_EVERY_WEEK 			0b0111
#define RTCC_EVERY_MONTH 			0b1000
#define RTCC_EVERY_YEAR 			0b1001 // except when configured for February 29th, once every 4 years

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

void RTCC_Init()
{
	RTCCON |= (1 << 15);   	// Set bit 15 RTCC module is enabled
}

void RTCC_Shutdown()
{
	RTCCON |= !(1 << 15);   // Clear bit 15 RTCC module is disabled
}

void RTCC_SetTime(unsigned long tm)
{
}

unsigned long RTCC_GetTime(void)
{
	unsigned int t0, t1;
	do
	{
		t0 = RTCTIME;
		t1 = RTCTIME;
	} while (t0 != t1);
	return t0;
}

void RTCC_Calibration(int cal)
{
	if (RTCCON & 0x8000)						// RTCC is ON
	{
		unsigned int t0 = RTCC_GetTime();

		if ((t0 & 0xFF) == 00)				// we're at second 00, wait auto-adjust to be performed
		{
			while(!(RTCCON & 0x2));			// wait until second half...
		}
	}
		RTCCONCLR = 0x03FF0000;				// clear the calibration
		RTCCONSET = cal;
}

void RTCC_SetDate(unsigned long dt)
{
}

unsigned long RTCC_GetDate(void)
{
	unsigned int d0, d1;
	do
	{
		d0 = RTCDATE;
		d1 = RTCDATE;
	} while (d0 != d1);

	return d0;
}

void RTCC_SetTimeDate(unsigned long tm, unsigned long dt)
{
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

void RTCC_SetAlarmTime(unsigned long tm)
{
}

unsigned long RTCC_GetAlarmTime(void)
{
	return ALRMTIME;
}

void RTCC_SetAlarmDate(unsigned long dt)
{
}

unsigned long RTCC_GetAlarmDate(void)
{
	 return ALRMDATE;
}

void RTCC_SetAlarmTimeDate(unsigned long tm, unsigned long dt)
{
}

void RTCC_GetAlarmTimeDate(rtccTime* pTm, rtccDate* pDt)
{
	pTm->l = ALRMTIME;
	pDt->l = ALRMDATE;
}

void RTCC_AlarmEnable(void)
{
}

void RTCC_AlarmDisable(void)
{
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
}

void RTCC_ChimeDisable(void)
{
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

void RTCC_SetAlarmRpt(rtccRepeat rpt)
{
}

rtccRepeat RTCC_GetAlarmRpt(void)
{
	rtccRepeat	r0, r1;

	do
	{
		r0 = RTCALRM&_RTCALRM_AMASK_MASK;
		r1 = RTCALRM&_RTCALRM_AMASK_MASK;
	}while (r0 != r1);

	return r0>>_RTCALRM_AMASK_POSITION;
}

void RTCC_SetAlarmRptCount(int rptCnt)
{
}

int RTCC_GetAlarmRptCount(void)
{
	int rpt0, rpt1;
	do
	{
		rpt0 = RTCALRMbits.ARPT;
		rpt1 = RTCALRMbits.ARPT;
	} while (rpt0 != rpt1);

	return rpt0;
}

int RTCC_WeekDay(int year, int month, int day)
{
}

rtccRes RTCC_Enable(void)
{
}

int RTCC_Disable(void)
{
}

int RTCC_GetEnable(void)
{
	return (RTCCON&(_RTCCON_ON_MASK|_RTCCON_RTCCLKON_MASK));
}

rtccRes RTCC_GetClkStat(void)
{

	if( (!(OSCCONbits.SOSCEN)) || (!(OSCCONbits.SOSCRDY)) )
		return RTCC_SOSC_NRDY;
	else if(!(RTCCONbits.RTCCLKON))
		return RTCC_CLK_NRDY;
	return RTCC_CLK_ON;
}

void RTCC_SetCalibration(int drift)
{
}

int RTCC_GetCalibration(void)
{
	 return RTCCONbits.CAL;
}

void RTCC_WrEnable(int enable)
{
	if(enable)
		mSysUnlockOpLock(RTCCONSET=_RTCCON_RTCWREN_MASK);	
	else
		RTCCONCLR=_RTCCON_RTCWREN_MASK;
}

int RTCC_GetWrEnable(void)
{
	 return RTCCONbits.RTCWREN!=0;
}

int RTCC_GetSync(void)
{
	 return RTCCONbits.RTCSYNC!=0;
}

int RTCC_GetHalfSecond(void)
{
	 return RTCCONbits.HALFSEC!=0;
}

int RTCC_GetAlrmSync(void)
{
	return RTCALRMbits.ALRMSYNC!=0;
}

void RTCC_SelectPulseOutput(int secPulse)
{
	if(secPulse)
		RTCCONSET=_RTCCON_RTSECSEL_MASK;
	else
		RTCCONCLR=_RTCCON_RTSECSEL_MASK;
}

void RTCC_AlarmPulseHigh(void)
{
}

void RTCC_AlarmPulseLow(void)
{
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
	{
 RTCCONSET=_RTCCON_RTCOE_MASK;
	}
	else
	{
 RTCCONCLR=_RTCCON_RTCOE_MASK;
	}
}

int RTCC_GetOutputEnable(void)
{
	 return RTCCONbits.RTCOE!=0;
}

void RTCC_FreezeEnable(int enable)
{
	if(enable)
 RTCCONSET=_RTCCON_FRZ_MASK;
	else
 RTCCONCLR=_RTCCON_FRZ_MASK;
}

int RTCC_GetFreeze(void)
{
	return RTCCONbits.FRZ!=0;
}


#endif

