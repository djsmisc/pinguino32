/*	------------------------------------------------------------------------
	FILE:			     system-clocks.c
	PROJECT:		     pinguino
	PURPOSE:		     PIC32 clock settings
	PROGRAMER:		     Roland "Zaemiemi" Haag <zaemiemi@ddsf.de>
	FIRST RELEASE:       06 feb 2012
	LAST RELEASE:        07 feb 2012
	----------------------------------------------------------------------------
	CHANGELOG:
	[07-02-12][Régis Blanchot][Added P32MX220F032D support]
	------------------------------------------------------------------------
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
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
	----------------------------------------------------------------------*/

/**
 * Implementation notes
 *
 * This implementation only handles the PLL setup with "PLL input
 * divider", "PLL output divider", "PLL multiplier", and "Peripheral
 * clock divider". Other clocking schemes are not supported.
 *
 * See @page 186, PIC32MX Family Reference Manual, PIC32MX Family
 * Clock Diagram
 */

/** The indices are valid values for PLLIDIV */
static const uint32_t pllInputDivs[]  = {  1,  2,  3,  4,  5,  6, 10,  12 };

/** The indices are valid values for PLLODIV */
static const uint32_t pllOutputDivs[] = {  1,  2,  4,  8, 16, 32, 64, 256 };

/** The indices are valid values for PLLMULT */
static const uint32_t pllMuls[]       = { 15, 16, 17, 18, 19, 20, 21,  24 };

/** The indices are valid values for PBDIV */
static const uint32_t pbDivs[]        = { 1, 2, 4, 8 };

static const uint8_t pllInputDivsCount = 
  sizeof(pllInputDivs) / sizeof(pllInputDivs[0]);

static const uint8_t pllOutputDivsCount = 
  sizeof(pllOutputDivs) / sizeof(pllOutputDivs[0]);

static const uint8_t pllMulsCount = 
  sizeof(pllMuls) / sizeof(pllMuls[0]);

static const uint8_t pbDivsCount = 
  sizeof(pbDivs) / sizeof(pbDivs[0]);

/**
 * Error state, only used by the test cases
 */
typedef enum SystemClocksErrorEnum {
  Error_None                      = 0,
  Error_RequestedFrequencyTooHigh = 1,
  Error_NoCombinationFound        = 2,
} SystemClocksError;

/**
 * This struct is used to store the results after reading in the
 * current settings, and to calculate new clock settings in memory.
 *
 * Each function gets a pointer to this struct as the first parameter.
 *
 * If we used C++, this struct would be the class; and all functions
 * in this file would be member functions.
 */
typedef struct SystemClocksSettingsStruct {
  uint8_t PLLIDIV;
  uint8_t PLLODIV;
  uint8_t PLLMULT;
  uint8_t PBDIV;

  #ifdef EXTENDED_TEST_CASE
    // Error state
    SystemClocksError error;
  #endif
} SystemClocksSettings;

/**
 * Read in all relevant clock settings
 *
 * @see system.c::GetSystemClock()
 *
 * @return Nothing (the result is put into the struct)
 */
void SystemClocksReadSettings(SystemClocksSettings *s) 
{
  s->PLLIDIV = DEVCFG2bits.FPLLIDIV;
  
  s->PLLODIV = OSCCONbits.PLLODIV;
  s->PLLMULT = OSCCONbits.PLLMULT;

  s->PBDIV   = OSCCONbits.PBDIV;
}

/**
 * Calculates the CPU frequency based on the values which are passed in.
 * This normally requires a call to SystemClocksReadSettings() before.
 *
 * @see system.c::GetSystemClock()
 *
 * @return The CPU frequency
 */
uint32_t SystemClocksGetCpuFrequency(const SystemClocksSettings *s) 
{
  return 
    CRYSTALFREQUENCY 
    / pllInputDivs [s->PLLIDIV]
    / pllOutputDivs[s->PLLODIV] 
    * pllMuls      [s->PLLMULT];
}

/**
 * Calculates the peripheral clock frequency based on the values which
 * are passed in. This normally requires a call to
 * SystemClocksReadSettings() before.
 *
 * @see system.c::GetPeripheralClock()
 *
 * @return The peripheral clock frequency
 */
uint32_t SystemClocksGetPeripheralFrequency(const SystemClocksSettings *s) 
{
  return SystemClocksGetCpuFrequency(s) / pbDivs[s->PBDIV];
}

/**
 * Calculate the necessary values in order to have the CPU running at
 * the desired frequency.
 *
 * @see system.c::SystemConfig()
 *
 * @return Nothing (the result is put into the struct)
 */
void SystemClocksCalcCpuClockSettings(SystemClocksSettings *s, 
				      uint32_t cpuFrequency) 
{
  if (cpuFrequency <= CPUCOREMAXFREQUENCY) 
    {
      #ifdef EXTENDED_TEST_CASE
        s->error = Error_None;
      #endif
    } 
  else 
    {
      cpuFrequency = CPUCOREMAXFREQUENCY;

      #ifdef EXTENDED_TEST_CASE
        s->error = Error_RequestedFrequencyTooHigh;
      #endif
    }

  uint8_t pllOutputDivIndex;
  for (pllOutputDivIndex = 0; 
       pllOutputDivIndex < pllOutputDivsCount; 
       pllOutputDivIndex++)
    {
      uint8_t pllMulIndex;
      for (pllMulIndex = 0; pllMulIndex < pllMulsCount; pllMulIndex++)
	{
	  if ( (cpuFrequency 
		* pllInputDivs[s->PLLIDIV]
		* pllOutputDivs[pllOutputDivIndex])
	       == (CRYSTALFREQUENCY * pllMuls[pllMulIndex]) )
	    {
	      s->PLLODIV = pllOutputDivIndex;
	      s->PLLMULT = pllMulIndex;
	      // Match found
	      return;
	    }
	}
    }
  
  /* 
   * No combination found -> try to get max CPU frequency. This
   * depends from pllInputDiv.
   *
   * The selected values will result in the max CPU frequency, if
   * the pllInputDiv is 1 or 2.
   *
   * With pllInputDiv > 2 we cannot reach the max frequency.
   */
  if (pllInputDivs[s->PLLIDIV] >= 2) 
    {
      s->PLLODIV = 0; // /1

      #ifdef EXTENDED_TEST_CASE
        s->error = Error_NoCombinationFound;
      #endif
    }
  else 
    {
      s->PLLODIV = 1; // /2

      #ifdef EXTENDED_TEST_CASE
        s->error = Error_NoCombinationFound;
      #endif
    }

  s->PLLMULT = 5; // x20
}

/**
 * Calculate the necessary values in order to have the peripheral
 * clock running at the desired frequency. As this value is only a
 * divider, this normally requires a call to
 * SystemClocksCalcCpuClockSettings() before, because the CPU
 * frequency is needed to find the divider value.
 *
 * @see system.c::SystemConfig()
 *
 * @return Nothing (the result is put into the struct)
 */
void SystemClocksCalcPeripheralClockSettings(SystemClocksSettings *s, 
					     uint32_t peripheralFrequency) 
{
  #ifdef EXTENDED_TEST_CASE
    s->error = Error_None;
  #endif

  if (peripheralFrequency > CPUCOREMAXFREQUENCY) 
    {
      peripheralFrequency = CPUCOREMAXFREQUENCY;

      #ifdef EXTENDED_TEST_CASE
        s->error = Error_RequestedFrequencyTooHigh;
      #endif
    }

  const uint32_t cpuFrequency = SystemClocksGetCpuFrequency(s);

  uint8_t i;
  for (i = 0; i < pbDivsCount; i++) 
    {
      if (cpuFrequency == peripheralFrequency * pbDivs[i]) 
	{
	  s->PBDIV = i;
	  // Match found
	  return;
	}
    }

  // No match: Use default value
  s->PBDIV = 0; // /1
  #ifdef EXTENDED_TEST_CASE
    s->error = Error_NoCombinationFound;
  #endif
}

/**
 * Write the clock settings into the registers; this effectively applies the
 * new settings, and will change the CPU frequency, peripheral
 * frequency, and the number of flash wait states.
 *
 * This normally requires a call to
 * SystemClocksCalcCpuClockSettings(), and
 * SystemClocksCalcPeripheralClockSettings() before.
 *
 * @see system.c::SystemConfig()
 *
 * @return Nothing
 */
void SystemClocksWriteSettings(const SystemClocksSettings *s) 
{
  SystemUnlock();
  
  /**
   * @page 186 
   *
   * PIC32MX Family Clock Diagram
   *
   * @page 189
   *
   * OSCCON: Oscillator Control Register
   */

  /* 
   * bit 10-8 NOSC<2:0>: New Oscillator Selection bits
   *     011 = Primary Oscillator with PLL module (XTPLL, HSPLL or ECPLL)
   */
  OSCCONbits.NOSC = POSCPLL;

  /*
   * bit 29-27 PLLODIV<2:0>: Output Divider for PLL
   */
  OSCCONbits.PLLODIV = s->PLLODIV;
  
  /*
   * bit 18-16 PLLMULT<2:0>: PLL Multiplier bits
   */
  OSCCONbits.PLLMULT = s->PLLMULT;
  
  /*
   * bit 0 OSWEN: Oscillator Switch Enable bit
   *   1 = Initiate an osc switch to selection specified by NOSC2:NOSC0 bits
   *   0 = Oscillator switch is complete
   */
  OSCCONbits.OSWEN = 1;
  // Busy wait until osc switch has been completed
  while (OSCCONbits.OSWEN == 1) 
    {
      asm("nop");
    }
  
  /*
   * bit 20-19 PBDIV<1:0>: Peripheral Bus Clock Divisor
   */
  OSCCONbits.PBDIV = s->PBDIV;
  
  // Set wait states
#if defined(PIC32_PINGUINO_220)
	// TODO
	PMMODEbits.WAITB = 0b00;								// Data wait of 1 TPB
#else
	CHECON = (SystemClocksGetCpuFrequency(s) / 20) - 1;		// FlashWaitStates
#endif
  
  //
  
  SystemLock();
}
