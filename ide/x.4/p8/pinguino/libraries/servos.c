/*-------------------------------------------------------------------------------------
   servo.c  LIBRARY FOR CONTROLLING UP OT ALL PINGUINO PINS AS SERVOS FOR 18F2550/4550/PICUNO
   ====================================================================================

             Version      : 4.0
			 Autor        : Jesús Carmona Esteban
			 Last change  : 20/10/2013

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
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
--------------------------------------------------------------------------------------*/

// Changes:
// -------------------------------------------------------------------------------------
// 20/10/2013 - Fixed interrupt handling for working TMR1 with new x.4 enviroment.
// 01/10/2013 - Tested and calibrated with oscilloscope for 18F4550, 18F2550 and EQUO_UNO for X.3 IDE.
// 28/09/2013 - Corrections on maths at servowrite funtion. 
// 02/09/2012 - Changes on ServoMinPulse and ServoMaxPulse functions to assemble Arduino ones in order to expand from 500us to 2500us pulses.
// 05/04/2012 - Expansion to versions 4550/PICUNO_EQUO using #defines in user program.
// -------------------------------------------------------------------------------------

// This library is optimized for Pinguino 18F2550/4550/PICUNO_EQUO
// it allows to drive up to 14 servos simultaneously with PICUNO EQUO,
//  18 servos simultaneously with 2550, and 29 with 4550.
// So, that all Pinguino pins on 18F2550/4550 can be configured as servo drivers.
//
// NOTES:
// - Xtal must be 20 Mhz. Thus the resulting clock after PLL will be
//   of 48Mhz => 12 MIPS (Fosc/4).
// - This library allows 250 positions for a servo, corresponding
//   1 to 500 usecs, and 250 to 2500 usec aprox. Those 1-250 values are mapped from 0-180 degrees
//   which is the value that user will put in servo.write function.
// - Input by user would be in degrees.
// - There is now a correspondence table where is stored maximum and minimum
//   values that a servo could reach in miliseconds. But the value stored is from 1 to 250.
// - All servos are automatically refreshed by PIC in a parallel way.
//
//
//	New timeslots  for version 2:
//
// TIMESLOT(byte value):
// 1                  62                  125                  192                  250
// |-------------------|-------------------|--------------------|--------------------|
// 500               1000                 1500                2000                 2500
// Time (microseconds)
//
// Defaul values now for SERVOMAX and SERVOMIN should be 64 and 192, 1000usec and 2000usec respectively.
// User can change 0 degrees up to 500 us pulse, and 180 degrees up to 2500 usec pulse using the recoded functions:
// 
// - ServoMinimumPulse(unsigned char servo,int min_microseconds)
// - ServoMaximumPulse(unsigned char servo,int max_microseconds)
//
// -------------------------------------------------------------------------------------------------------


#define SERVOSLIBRARY 1

//Includes for functions used internally in this lib.
#include <stdlib.h>
#include <digitalw.c>  //includes ports and mask definitions.

// Max and Min values that correspond to 2000 usec and 1000 usec:
#define DefaultSERVOMAX 192
#define DefaultSERVOMIN  64


//library internal variables:
volatile unsigned char phase=1;
volatile unsigned char needreordering=0;

//-----------------------------------------------------------------------------------------------------------------------------
// Definitions for PICUNO_EQUO
//-----------------------------------------------------------------------------------------------------------------------------
#if defined(PICUNO_EQUO)
#define PICUNO_EQUO_pins 14  // It only uses digital pins: D00-D13.
volatile unsigned char timingindex;
volatile unsigned char timedivision=0;
unsigned char loopvar;
volatile unsigned char timings[4][PICUNO_EQUO_pins];
volatile unsigned char activatedservos[3]={0x00,0x00,0x00};
// For referencing masks in the previous array.
#define MaskPort_B  0
#define MaskPort_C  1
#define MaskPort_D  2
#define timevalue   3

unsigned char servovalues[PICUNO_EQUO_pins]; // Entry table for values sets for every pin-servo.

unsigned char maxminpos[2][PICUNO_EQUO_pins]={ {DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN } , { DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX} }; // This table keeps minimum(0 degrees) and maximum(180 degrees) values(in ticks) that the servo can reach.


//Masks table, borrowed from digitalw.c lib: 
//RC7, RC6, RB2, RB3, RD0, RC2, RC1, RD1 ,RD2 ,RD3 ,RD4 ,RD5 ,RD6 ,RD7
// 0 ,  1 ,  2 ,  3 ,  4 ,  5 ,  6 ,  7  , 8  , 9  , 10 , 11,  12 , 13

void servos_init()
{
	unsigned char a;

    //Filling up the servovalues table to 255. 
	for(a=0;a<PICUNO_EQUO_pins;a++) servovalues[a]=0xFF;

// OLD STUFF previous to X.4 IDE : 
//	TMR1H=0xFF;
//	TMR1L=0x00;
	// timer 1 prescaler 1 source is internal oscillator
//	T1CON=0x01;
	// enable interrupt for timer1 in register PIE1
//	PIE1bits.TMR1IE=1;
	// enable peripheral interrupt
//	INTCONbits.PEIE=1;
	// global enable interrupt
//	INTCONbits.GIE=1;
	// now the first interrupt will be generated by timer2 after 9 ms.

    INTCONbits.GIEH  = 0; // Disable global HP interrupts
    INTCONbits.GIEL  = 0; // Disable global LP interrupts

	T1CON=0x00; //timer 1 prescaler 1 source is internal oscillator
	TMR1H=0x00; // First value on timer to start up...
	TMR1L=0x00; // ...now the first interrupt will be generated by timer2 after 9 ms.

	PIR1bits.TMR1IF  = 0; // Setting flag to 0
    IPR1bits.TMR1IP  = 1; // INT_HIGH_PRIORITY
    PIE1bits.TMR1IE  = 1; // INT_ENABLE

    INTCONbits.GIEH  = 1; // Enable global HP interrupts
    INTCONbits.GIEL  = 1; // Enable global LP interrupts

    T1CONbits.TMR1ON = 1; // Starting TMR1
}


static void ServosPulseDown()
{
	timingindex = 0;

	for(timedivision=0;timedivision < 251;timedivision++){
		if (timings[timevalue][timingindex] == timedivision){
			PORTB = PORTB ^ timings[MaskPort_B][timingindex];
			PORTC = PORTC ^ timings[MaskPort_C][timingindex];
			PORTD = PORTD ^ timings[MaskPort_D][timingindex];
			timingindex++;
		}
		// OLD: the following routine adds the requiered delay for every tick of timedivision, so every timedivision last 4 usec.
		// NEW: the following routine adds the requiered delay for every tick of timedivision, so every timedivision last 8 usec.
		__asm
			movlw 7
			movwf _loopvar
		bucle:
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			decfsz _loopvar,1
			goto bucle
		__endasm;
	}
}

static void ServosPulseUp()
{
// This function starts up pulses for all activated servos.
	PORTB = activatedservos[MaskPort_B] & 0xFF;
	PORTC = activatedservos[MaskPort_C] & 0xFF;
	PORTD = activatedservos[MaskPort_D] & 0xFF;
}


static void SortServoTimings()
{
// This funtion analyses servovalues table and creates and ordered table(timings)
// from smaller to bigger of all the values, asociating to each
// position of the table the servos that matches that timing.

	unsigned char s,t,totalservos,numservos;
	unsigned char mascaratotal[3]={0x00,0x00,0x00};

	// inicializamos la tabla:
	for(t=0;t<PICUNO_EQUO_pins;t++){
		timings[timevalue][t]=255;
		timings[MaskPort_B][t]=0x00;
		timings[MaskPort_C][t]=0x00;
		timings[MaskPort_D][t]=0x00;
	}

	totalservos=0;
	t=0;
	while(totalservos<PICUNO_EQUO_pins) {
		numservos=1;
		for(s=0;s<PICUNO_EQUO_pins;s++) {
			// Case that we are reviewing PORTB servos:
			if (s==2 || s==3){
				if (mask[s] & mascaratotal[MaskPort_B] & activatedservos[MaskPort_B]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=mask[s];
					timings[MaskPort_C][t]=0x00;
					timings[MaskPort_D][t]=0x00;
					numservos=1;
				}
				else if (servovalues[s] == timings[timevalue][t]){
					timings[MaskPort_B][t] |= mask[s];
					numservos++;
				}
			}
			// Case that we are reviewing PORTD servos:
			else if (s==4 || s>=7){
				if (mask[s] & mascaratotal[MaskPort_D] & activatedservos[MaskPort_D]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=0x00;
					timings[MaskPort_C][t]=0x00;
					timings[MaskPort_D][t]=mask[s];
					numservos=1;
				}
				else if (servovalues[s] == timings [timevalue][t]){
					timings[MaskPort_D][t] |= mask[s];
					numservos++;
				}
			}
			// Case that we are reviewing PORTC servos:
			else {
				if (mask[s] & mascaratotal[MaskPort_C] & activatedservos[MaskPort_C]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=0x00;
					timings[MaskPort_C][t]=mask[s];
					timings[MaskPort_D][t]=0x00;
					numservos=1;
				}
				else if (servovalues[s] == timings [timevalue][t]){
					timings[MaskPort_C][t] |= mask[s];
					numservos++;
				}
			}

		}
		mascaratotal[MaskPort_B] |= timings[MaskPort_B][t];
		mascaratotal[MaskPort_C] |= timings[MaskPort_C][t];
		mascaratotal[MaskPort_D] |= timings[MaskPort_D][t];
		totalservos += numservos;
		t++;

	}
	needreordering=0;  // This indicates that servo timings are sorted.
}



void ServoAttach(unsigned char pin)
{
	if(pin>=PICUNO_EQUO_pins) return;

	if(pin==2 || pin==3){
		activatedservos[MaskPort_B] |= mask[pin];  // list pin as servo driver.
		TRISB = TRISB & (255 - mask[pin]); // set as output pin
	} else if (pin==4 || pin>=7){
		activatedservos[MaskPort_D] |= mask[pin];  // list pin as servo driver.
		TRISD = TRISD & (255 - mask[pin]); // set as output pin
	} else {
		activatedservos[MaskPort_C] |= mask[pin];  // list pin as servo driver.
		TRISC = TRISC & (255 - mask[pin]); // set as output pin
	}

}

void ServoDetach(unsigned char pin)
{
	if(pin>=PICUNO_EQUO_pins) return;

	if(pin==2 || pin==3){
		activatedservos[MaskPort_B] = activatedservos[MaskPort_B] ^ mask[pin];
	} else if (pin==4 || pin>=7){
		activatedservos[MaskPort_D] = activatedservos[MaskPort_D] ^ mask[pin];
	} else {
		activatedservos[MaskPort_C] = activatedservos[MaskPort_C] ^ mask[pin];
	}

}

void ServoWrite(unsigned char servo,unsigned char degrees)
{
	unsigned char difference;
	unsigned int degbydif;
	float ticksperdegree;
	unsigned char value;

    // test if numservo is valid
	if(servo>=PICUNO_EQUO_pins) {
		return;
	}
    // limitting degrees:
	if(degrees>180) {
		degrees=180;
	}

	// This is the formula to convert from degrees to timeslots for that specific servo:
	difference = (maxminpos[1][servo]-maxminpos[0][servo]);
	degbydif = degrees*difference;
	ticksperdegree = (degbydif/180);
	value = ((unsigned char)ticksperdegree) + maxminpos[0][servo];

	// Storage of that new position to servovalues positions table:
	// it should be added the min value for that servo
	servovalues[servo]= value;

	needreordering=1;  // This indicates servo timings must be reordered.
}



unsigned char ServoRead(unsigned char servo)
{
	if(servo>=PICUNO_EQUO_pins)        // test if numservo is valid
		return 0;
	return servovalues[servo];
}


void ServoMinimumPulse(unsigned char servo,int min_microseconds)
{
	unsigned char final_min;

    // test if numservo is valid:
	if(servo>=PICUNO_EQUO_pins)
		return;
    // test if microseconds are within range:
	if((min_microseconds<500) || (min_microseconds>1500))
		return;

	// The following formula converts from microseconds to timeslot:
	final_min=(min_microseconds-500+1)/8;

    // Store in 1st column the minimum value allowed from now on to that servo:
    maxminpos[0][servo]=final_min;
}

void ServoMaximumPulse(unsigned char servo,int max_microseconds)
{
	unsigned char final_max;

    // test if numservo is valid:
	if(servo>=PICUNO_EQUO_pins)
		return;
    // test if microseconds are within range:
	if((max_microseconds<1500) || (max_microseconds>2500))
		return;

	// The following formula converts from microseconds to timeslot:
	final_max=(max_microseconds-500+1)/8;

    // Store in 1st column the minimum value allowed from now on to that servo:
    maxminpos[1][servo]=final_max;
}

//interrupt handler that handles servos
void servos_interrupt(void)
{
    if (PIR1bits.TMR1IF)
    {
        //T1CONbits.TMR1ON = 0; // Stop Timer1

        //case before 500 microseconds:

        if (phase)
        {
            ServosPulseUp();
            //OLD: Load at TMR1 54159d(also 0xFFFF - 12000d (- 54usec for adjustments))= 0xd38f.
            //NEW: Load at TMR1 (65535d - 6000d (-54usec for adjusments ) = 59481d = 0xE859 (after some calibration 0xe959)
            TMR1H = 0xe9;
            TMR1L = 0x59;
            // timer 1 prescaler 1 source is internal oscillator Fosc/4 (CPU clock or Fosc=48Mhz).
            T1CON = 1;
            phase = 0;
        }

        //case before 2500 microseconds:
        
        else
        {
            //The following call takes 2 ms aprox.:
            ServosPulseDown();
            // OLD: Now it takes place a 18 ms delay, after that a interrupt will be generated.
            // OLD:Loading at TMR1 11535d (que es: 0xFFFF - (4,5 x 12000(duracion 1ms)) = 0x2D0F => a 4,5 ms)
            // OLD: This 4,5 x 4 (with preescaler x 4) we get 18 ms delay.
            // NEW: after 2,5 ms we need a delay of 17,5 ms to complete a 20 ms cycle.
            // NEW: Loading at TMR1 65535d - (4,375 x 12000(=1ms)=) 52500d = 13035d = 0x32EB => 4,375 ms
            // NEW: This is 4,375ms x 4 (preescaler) = 17,5 ms
            TMR1H = 0x32;
            TMR1L = 0xeb;
            // timer 1 prescaler 1 source is internal oscillator Fosc/4 (recordemos que Fosc=48Mhz).
            if (needreordering)
                SortServoTimings();  // This takes more than 1 ms, but it's call only if needed.
            T1CON = ( 1 | 2 << 4 ) ; // activate timer1 and prescaler = 1:4
            phase = 1;  //This indicates that after next interrupt it will start the servos cycle.
        }

        PIR1bits.TMR1IF  = 0;

    }
}


//-----------------------------------------------------------------------------------------------------------------------------
// Definitions for PIC 18F4550 or 45K50
//----------------------------------------------------------------------------------------------------------------------------------
#elif defined(PINGUINO4550) || defined(PINGUINO45K50)
#define PIC18F4550_pins 29
unsigned char timingindex;
unsigned char timedivision=0;
unsigned char loopvar;
unsigned char timings[6][PIC18F4550_pins];
unsigned char activatedservos[5]={0x00,0x00,0x00,0x00,0x00};
// For masks referencing in the previous array.
#define MaskPort_B  0
#define MaskPort_C  1
#define MaskPort_A  2
#define MaskPort_E  3
#define MaskPort_D  4
#define timevalue   5

unsigned char servovalues[PIC18F4550_pins]; // Entry table for values sets for every pin-servo.

unsigned char maxminpos[2][PIC18F4550_pins]={ {DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN}, { DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX , DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX  } }; // This table keeps minimum(0 degrees) and maximum(180 degrees) values(in ticks) that the servo can reach.

//Masks table:
// Register B (RB0,RB1,RB2,RB3,RB4,RB5,RB6,RB7)
// Register C (RC6,RC7,RC0,RC1,RC2)
// Register A (RA0,RA1,RA2,RA3,RA5)
// Register E (RE0,RE1,RE2)
// REgister D (RD0,RD1,RD2,RD3,RD4,RD5,RD6,RD7)

void servos_init()
{
	unsigned char a;

    //Filling up the servovalues table to 255. 
	for(a=0;a<PIC18F4550_pins;a++) servovalues[a]=255;

// OLD STUFF previous to X.4 IDE : 
//	TMR1H=0xFF;
//	TMR1L=0x00;
	// timer 1 prescaler 1 source is internal oscillator
//	T1CON=0x01;
	// enable interrupt for timer1 in register PIE1
//	PIE1bits.TMR1IE=1;
	// enable peripheral interrupt
//	INTCONbits.PEIE=1;
	// global enable interrupt
//	INTCONbits.GIE=1;
	// now the first interrupt will be generated by timer2 after 9 ms.

    INTCONbits.GIEH    = 0;   // Disable global HP interrupts
    INTCONbits.GIEL    = 0;   // Disable global LP interrupts
	T1CON=0x00; //timer 1 prescaler 1 source is internal oscillator
	TMR1H=0xFF; // First value on timer to start up...
	TMR1L=0x00; // ...now the first interrupt will be generated by timer2 after 9 ms.
    IPR1bits.TMR1IP = 1; // INT_HIGH_PRIORITY
	PIR1bits.TMR1IF = 0; // Setting flag to 0
    PIE1bits.TMR1IE = 1; // INT_ENABLE
	T1CONbits.TMR1ON   = 1; // Starting TMR1
    INTCONbits.GIEH    = 1;   // Enable global HP interrupts
    INTCONbits.GIEL    = 1;   // Enable global LP interrupts

}


static void ServosPulseDown()
{
	timingindex = 0;

	for(timedivision=0;timedivision < 251;timedivision++){
		if (timings[timevalue][timingindex] == timedivision){
			PORTB = PORTB ^ timings[MaskPort_B][timingindex];
			PORTC = PORTC ^ timings[MaskPort_C][timingindex];
			PORTA = PORTA ^ timings[MaskPort_A][timingindex];
			PORTE = PORTE ^ timings[MaskPort_E][timingindex];
			PORTD = PORTD ^ timings[MaskPort_D][timingindex];
			timingindex++;
		}
		// OLD: the following routine adds the requiered delay for every tick of timedivision, so every timedivision last 4 usec.
		// NEW: the following routine adds the requiered delay for every tick of timedivision, so every timedivision last 8 usec.
		__asm
			movlw 7
			movwf _loopvar
		bucle:
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			decfsz _loopvar,1
			goto bucle
		__endasm;
	}
}

static void ServosPulseUp()
{
// This function starts up pulses for all activated servos.
	PORTB = activatedservos[MaskPort_B] & 0xFF;
	PORTC = activatedservos[MaskPort_C] & 0xFF;
	PORTA = activatedservos[MaskPort_A] & 0xFF;
	PORTE = activatedservos[MaskPort_E] & 0xFF;
	PORTD = activatedservos[MaskPort_D] & 0xFF;
}


static void SortServoTimings()
{
// This funtion analyses servovalues table and creates and ordered table(timings)
// from smaller to bigger of all the values, asociating to each
// position of the table the servos that matches that timing.

	unsigned char s,t,totalservos,numservos;
	unsigned char mascaratotal[5]={0x00,0x00,0x00,0x00,0x00};

	// inicializamos la tabla:
	for(t=0;t<PIC18F4550_pins;t++){
		timings[timevalue][t]=255;
		timings[MaskPort_B][t]=0x00;
		timings[MaskPort_C][t]=0x00;
		timings[MaskPort_A][t]=0x00;
		timings[MaskPort_E][t]=0x00;
		timings[MaskPort_D][t]=0x00;
	}

	totalservos=0;
	t=0;
	while(totalservos<PIC18F4550_pins) {
		numservos=1;
		for(s=0;s<PIC18F4550_pins;s++) {
			// Case that we are reviewing PORTB servos:
			if (s<8){
				if (mask[s] & mascaratotal[MaskPort_B] & activatedservos[MaskPort_B]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=mask[s];
					timings[MaskPort_C][t]=0x00;
					timings[MaskPort_A][t]=0x00;
					timings[MaskPort_E][t]=0x00;
					timings[MaskPort_D][t]=0x00;
					numservos=1;
				}
				else if (servovalues[s] == timings[timevalue][t]){
					timings[MaskPort_B][t] |= mask[s];
					numservos++;
				}
			}
			// Case that we are reviewing PORTC servos:
			else if (s<13){
				if (mask[s] & mascaratotal[MaskPort_C] & activatedservos[MaskPort_C]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=0x00;
					timings[MaskPort_C][t]=mask[s];
					timings[MaskPort_A][t]=0x00;
					timings[MaskPort_E][t]=0x00;
					timings[MaskPort_D][t]=0x00;
					numservos=1;
				}
				else if (servovalues[s] == timings [timevalue][t]){
					timings[MaskPort_C][t] |= mask[s];
					numservos++;
				}
			}
			// Case that we are reviewing PORTA servos:
			else if (s<18){
				if (mask[s] & mascaratotal[MaskPort_A] & activatedservos[MaskPort_A]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=0x00;
					timings[MaskPort_C][t]=0x00;
					timings[MaskPort_A][t]=mask[s];
					timings[MaskPort_E][t]=0x00;
					timings[MaskPort_D][t]=0x00;
					numservos=1;
				}
				else if (servovalues[s] == timings[timevalue][t]){
					timings[MaskPort_A][t] |= mask[s];
					numservos++;
				}
			}
			// Case that we are reviewing PORTE servos:
			else if (s<21){
				if (mask[s] & mascaratotal[MaskPort_E] & activatedservos[MaskPort_E]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=0x00;
					timings[MaskPort_C][t]=0x00;
					timings[MaskPort_A][t]=0x00;
					timings[MaskPort_E][t]=mask[s];
					timings[MaskPort_D][t]=0x00;
					numservos=1;
				}
				else if (servovalues[s] == timings [timevalue][t]){
					timings[MaskPort_E][t] |= mask[s];
					numservos++;
				}
			}
			// Case that we are reviewing PORTD servos:
			else {
				if (mask[s] & mascaratotal[MaskPort_D] & activatedservos[MaskPort_D]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=0x00;
					timings[MaskPort_C][t]=0x00;
					timings[MaskPort_A][t]=0x00;
					timings[MaskPort_E][t]=0x00;
					timings[MaskPort_D][t]=mask[s];
					numservos=1;
				}
				else if (servovalues[s] == timings [timevalue][t]){
					timings[MaskPort_D][t] |= mask[s];
					numservos++;
				}
			}

		}
		mascaratotal[MaskPort_B] |= timings[MaskPort_B][t];
		mascaratotal[MaskPort_C] |= timings[MaskPort_C][t];
		mascaratotal[MaskPort_A] |= timings[MaskPort_A][t];
		mascaratotal[MaskPort_E] |= timings[MaskPort_E][t];
		mascaratotal[MaskPort_D] |= timings[MaskPort_D][t];
		totalservos += numservos;
		t++;

	}
	needreordering=0;  // This indicates that servo timings are sorted.
}



void ServoAttach(unsigned char pin)
{
	if(pin>=PIC18F4550_pins) return;

	if(pin<8){
		activatedservos[MaskPort_B] = activatedservos[MaskPort_B] | mask[pin];  // list pin as servo driver.
		TRISB = TRISB & (255 - mask[pin]); // set as output pin
	} else if (pin<13){
		activatedservos[MaskPort_C] = activatedservos[MaskPort_C] | mask[pin];  // list pin as servo driver.
		TRISC = TRISC & (255 - mask[pin]); // set as output pin
	} else if (pin<18) {
		activatedservos[MaskPort_A] = activatedservos[MaskPort_A] | mask[pin];  // list pin as servo driver.
		TRISA = TRISA & (255 - mask[pin]); // set as output pin
	} else if (pin<21){
		activatedservos[MaskPort_E] = activatedservos[MaskPort_E] | mask[pin];  // list pin as servo driver.
		TRISE = TRISE & (255 - mask[pin]); // set as output pin
	} else {
		activatedservos[MaskPort_D] = activatedservos[MaskPort_D] | mask[pin];  // list pin as servo driver.
		TRISD = TRISD & (255 - mask[pin]); // set as output pin
	}

}

void ServoDetach(unsigned char pin)
{
	if(pin>=PIC18F4550_pins) return;

	if(pin<8){
		activatedservos[MaskPort_B] = activatedservos[MaskPort_B] ^ mask[pin];
	} else if (pin<13){
		activatedservos[MaskPort_C] = activatedservos[MaskPort_C] ^ mask[pin];
	} else if (pin<18) {
		activatedservos[MaskPort_A] = activatedservos[MaskPort_A] ^ mask[pin];
	} else if (pin<21){
		activatedservos[MaskPort_E] = activatedservos[MaskPort_E] ^ mask[pin];
	} else {
		activatedservos[MaskPort_D] = activatedservos[MaskPort_D] ^ mask[pin];
	}

}

void ServoWrite(unsigned char servo,unsigned char degrees)
{
	unsigned char difference;
	unsigned int degbydif;
	float ticksperdegree;
	unsigned char value;

    // test if numservo is valid
	if(servo>=PIC18F4550_pins) {
		return;
	}
    // limitting degrees:
	if(degrees>180) {
		degrees=180;
	}

	// This is the formula to convert from degrees to timeslots for that specific servo:
	difference = (maxminpos[1][servo]-maxminpos[0][servo]);
	degbydif = degrees*difference;
	ticksperdegree = (degbydif/180);
	value = ((unsigned char)ticksperdegree) + maxminpos[0][servo];

	// Storage of that new position to servovalues positions table:
	// it should be added the min value for that servo
	servovalues[servo]= value;

	needreordering=1;  // This indicates servo timings must be reordered.
}


unsigned char ServoRead(unsigned char servo)
{
	if(servo>=PIC18F4550_pins)        // test if numservo is valid
		return 0;
	return servovalues[servo];
}

void ServoMinimumPulse(unsigned char servo,int min_microseconds)
{
	unsigned char final_min;

    // test if numservo is valid:
	if(servo>=PIC18F4550_pins)
		return;
    // test if microseconds are within range:
	if((min_microseconds<500) || (min_microseconds>1500))
		return;

	// The following formula converts from microseconds to timeslot:
	final_min=(min_microseconds-500+1)/8;

    // Store in 1st column the minimum value allowed from now on to that servo:
    maxminpos[0][servo]=final_min;
}

void ServoMaximumPulse(unsigned char servo,int max_microseconds)
{
	int final_max;

    // test if numservo is valid:
	if(servo>=PIC18F4550_pins)
		return;
    // test if microseconds are within range:
	if((max_microseconds<1500) || (max_microseconds>2500))
		return;

	// The following formula converts from microseconds to timeslot:
	final_max=(max_microseconds-500+1)/8;

    // Store in 1st column the minimum value allowed from now on to that servo:
    maxminpos[1][servo]=(unsigned char)final_max;
}




//interrupt handler that handles servos
void servos_interrupt(void)
{
	if (PIR1bits.TMR1IF) {
		PIR1bits.TMR1IF=0;
		T1CON=0x00;
		if (phase) {
		//case before 500 microseconds:
			ServosPulseUp();
			//OLD: Load at TMR1 54159d(also 0xFFFF - 12000d (- 54usec for adjustments))= 0xd38f.
			//NEW: Load at TMR1 (65535d - 6000d (-54usec for adjusments ) = 59481d = 0xE859 (after some calibration 0xe959)
			TMR1H= 0xe9;
			TMR1L= 0x59;
			// timer 1 prescaler 1 source is internal oscillator Fosc/4 (CPU clock or Fosc=48Mhz).
			T1CON=1;
			phase = 0;
		}
		else {
		//case before 2500 microseconds:
			//The following call takes 2 ms aprox.:
			ServosPulseDown();
			// OLD: Now it takes place a 18 ms delay, after that a interrupt will be generated.
			// OLD:Loading at TMR1 11535d (que es: 0xFFFF - (4,5 x 12000(duracion 1ms)) = 0x2D0F => a 4,5 ms)
			// OLD: This 4,5 x 4 (with preescaler x 4) we get 18 ms delay.
			// NEW: after 2,5 ms we need a delay of 17,5 ms to complete a 20 ms cycle.
			// NEW: Loading at TMR1 65535d - (4,375 x 12000(=1ms)=) 52500d = 13035d = 0x32EB => 4,375 ms
			// NEW: This is 4,375ms x 4 (preescaler) = 17,5 ms
			TMR1H= 0x32;
			TMR1L= 0xeb;
			// timer 1 prescaler 1 source is internal oscillator Fosc/4 (recordemos que Fosc=48Mhz).
			if (needreordering)
				SortServoTimings();  // This takes more than 1 ms, but it's call only if needed.
			T1CON= ( 1 | 2 << 4 ) ; // activate timer1 and prescaler = 1:4
			phase = 1;  //This indicates that after next interrupt it will start the servos cycle.
		}
	}
	return;
}



//-----------------------------------------------------------------------------------------------------------------------------
// Definitions for PIC 18F2550 or 25K50 or CHRP3
//----------------------------------------------------------------------------------------------------------------------------------
#elif defined(PINGUINO2550) || defined(PINGUINO25K50) || defined(CHRP3)
#define PIC18F2550_pins 18
unsigned char timingindex;
unsigned char timedivision=0;
unsigned char loopvar;
unsigned char timings[4][PIC18F2550_pins];

unsigned char activatedservos[3]={0x00,0x00,0x00};
// For masks referencing in the previous array.
#define MaskPort_B  0
#define MaskPort_C  1
#define MaskPort_A  2
#define timevalue   3

unsigned char servovalues[PIC18F2550_pins]; // Entry table for values sets for every pin-servo.

unsigned char maxminpos[2][PIC18F2550_pins]={ {DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN, DefaultSERVOMIN}, { DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX, DefaultSERVOMAX } }; // This table keeps minimum(0 degrees) and maximum(180 degrees) values(in ticks) that the servo can reach.

//Masks table:
// Register B (RB0,RB1,RB2,RB3,RB4,RB5,RB6,RB7)
// Register C (RC6,RC7,RC0,RC1,RC2)
// Register A (RA0,RA1,RA2,RA3,RA5)



void servos_init()
{
	unsigned char a;

    //Filling up the servovalues table to 255. 
	for(a=0;a<PIC18F2550_pins;a++) servovalues[a]=255;

// OLD STUFF previous to X.4 IDE : 
//	TMR1H=0xFF;
//	TMR1L=0x00;
	// timer 1 prescaler 1 source is internal oscillator
//	T1CON=0x01;
	// enable interrupt for timer1 in register PIE1
//	PIE1bits.TMR1IE=1;
	// enable peripheral interrupt
//	INTCONbits.PEIE=1;
	// global enable interrupt
//	INTCONbits.GIE=1;
	// now the first interrupt will be generated by timer1 after 9 ms.

    INTCONbits.GIEH    = 0;   // Disable global HP interrupts
    INTCONbits.GIEL    = 0;   // Disable global LP interrupts
    T1CON=0x00; //timer 1 prescaler 1 source is internal oscillator
	TMR1H=0xFF; // First value on timer to start up...
	TMR1L=0x00; // ...now the first interrupt will be generated by timer2 after 9 ms.
    IPR1bits.TMR1IP = 1; // INT_HIGH_PRIORITY
	PIR1bits.TMR1IF = 0; // Setting flag to 0
    PIE1bits.TMR1IE = 1; // INT_ENABLE
	T1CONbits.TMR1ON   = 1; // Starting TMR1
    INTCONbits.GIEH    = 1; // Enable global HP interrupts
    INTCONbits.GIEL    = 1; // Enable global LP interrupts

}



static void ServosPulseDown()
// this function should take 2000us to be completed. Which is from 500us to 2500us.
{
	timingindex = 0;

	for(timedivision=0;timedivision < 251;timedivision++){
		if (timings[timevalue][timingindex] == timedivision){
			PORTB = PORTB ^ timings[MaskPort_B][timingindex];
			PORTC = PORTC ^ timings[MaskPort_C][timingindex];
			PORTA = PORTA ^ timings[MaskPort_A][timingindex];
			timingindex++;
		}
		// OLD: the following routine adds the requiered delay for every tick of timedivision, so every timedivision last 4 usec.
		// NEW: the following routine adds the requiered delay for every tick of timedivision, so every timedivision last 8 usec.
		__asm
			movlw 7
			movwf _loopvar
		bucle:
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			NOP
			decfsz _loopvar,1
			goto bucle
		__endasm;
	}
}

static void ServosPulseUp()
{
// This function starts up pulses for all activated servos.
	PORTB = activatedservos[MaskPort_B] & 0xFF;
	PORTC = activatedservos[MaskPort_C] & 0xFF;
	PORTA = activatedservos[MaskPort_A] & 0xFF;
}


static void SortServoTimings()
{
// This funtion analyses servovalues table and creates and ordered table(timings)
// from smaller to bigger of all the values, asociating to each
// position of the table the servos that matches that timing.

	unsigned char s,t,totalservos,numservos;
	unsigned char mascaratotal[3]={0x00,0x00,0x00};

	// initializing table:
	for(t=0;t<PIC18F2550_pins;t++){
		timings[timevalue][t]=255;
		timings[MaskPort_B][t]=0x00;
		timings[MaskPort_C][t]=0x00;
		timings[MaskPort_A][t]=0x00;
	}

	totalservos=0;
	t=0;
	while(totalservos<PIC18F2550_pins) {
		numservos=1;
		for(s=0;s<PIC18F2550_pins;s++) {
			// Case that we are reviewing PORTB servos:
			if (s<8){
				if (mask[s] & mascaratotal[MaskPort_B] & activatedservos[MaskPort_B]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=mask[s];
					timings[MaskPort_C][t]=0x00;
					timings[MaskPort_A][t]=0x00;
					numservos=1;
				}
				else if (servovalues[s] == timings[timevalue][t]){
					timings[MaskPort_B][t] |= mask[s];
					numservos++;
				}
			}
			// Case that we are reviewing PORTA servos:
			else if (s>12){
				if (mask[s] & mascaratotal[MaskPort_A] & activatedservos[MaskPort_A]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=0x00;
					timings[MaskPort_C][t]=0x00;
					timings[MaskPort_A][t]=mask[s];
					numservos=1;
				}
				else if (servovalues[s] == timings[timevalue][t]){
					timings[MaskPort_A][t] |= mask[s];
					numservos++;
				}
			}
			// Case that we are reviewing PORTC servos:
			else {
				if (mask[s] & mascaratotal[MaskPort_C] & activatedservos[MaskPort_C]){
				}
				else if (servovalues[s] < timings[timevalue][t]){
					timings[timevalue][t]=servovalues[s];
					timings[MaskPort_B][t]=0x00;
					timings[MaskPort_C][t]=mask[s];
					timings[MaskPort_A][t]=0x00;
					numservos=1;
				}
				else if (servovalues[s] == timings [timevalue][t]){
					timings[MaskPort_C][t] |= mask[s];
					numservos++;
				}
			}

		}
		mascaratotal[MaskPort_B] |= timings[MaskPort_B][t];
		mascaratotal[MaskPort_C] |= timings[MaskPort_C][t];
		mascaratotal[MaskPort_A] |= timings[MaskPort_A][t];
		totalservos += numservos;
		t++;

	}
	needreordering=0;  // This indicates that servo timings are sorted.
}



void ServoAttach(unsigned char pin)
{
	if(pin>=PIC18F2550_pins) return;

	if(pin<8){
		activatedservos[MaskPort_B] = activatedservos[MaskPort_B] | mask[pin];  // list pin as servo driver.
		TRISB = TRISB & (255 - mask[pin]); // set as output pin
	} else if (pin>12) {
		activatedservos[MaskPort_A] = activatedservos[MaskPort_A] | mask[pin];  // list pin as servo driver.
		TRISA = TRISA & (255 - mask[pin]); // set as output pin
	} else {
		activatedservos[MaskPort_C] = activatedservos[MaskPort_C] | mask[pin];  // list pin as servo driver.
		TRISC = TRISC & (255 - mask[pin]); // set as output pin
	}

}

void ServoDetach(unsigned char pin)
{
	if(pin>=PIC18F2550_pins) return;

	if(pin<8){
		activatedservos[MaskPort_B] = activatedservos[MaskPort_B] ^ mask[pin];
	} else if (pin>12) {
		activatedservos[MaskPort_A] = activatedservos[MaskPort_A] ^ mask[pin];
	} else {
		activatedservos[MaskPort_C] = activatedservos[MaskPort_C] ^ mask[pin];
	}

}


void ServoWrite(unsigned char servo,unsigned char degrees)
{
	unsigned char difference;
	unsigned int degbydif;
	float ticksperdegree;
	unsigned char value;

    // test if numservo is valid
	if(servo>=PIC18F2550_pins) {
		return;
	}
    // limitting degrees:
	if(degrees>180) {
		degrees=180;
	}

	// This is the formula to convert from degrees to timeslots for that specific servo:
	difference = (maxminpos[1][servo]-maxminpos[0][servo]);
	degbydif = degrees*difference;
	ticksperdegree = (degbydif/180);
	value = ((unsigned char)ticksperdegree) + maxminpos[0][servo];

	// Storage of that new position to servovalues positions table:
	// it should be added the min value for that servo
	servovalues[servo]= value;

	needreordering=1;  // This indicates servo timings must be reordered.
}


unsigned char ServoRead(unsigned char servo)
{
	if(servo>=PIC18F2550_pins)        // test if numservo is valid
		return 0;
	return servovalues[servo];
}


void ServoMinimumPulse(unsigned char servo,int min_microseconds)
{
	unsigned char final_min;

    // test if numservo is valid:
	if(servo>=PIC18F2550_pins)
		return;
    // test if microseconds are within range:
	if((min_microseconds<500) || (min_microseconds>1500))
		return;

	// The following formula converts from microseconds to timeslot:
	final_min=(min_microseconds-500+1)/8;

    // Store in 1st column the minimum value allowed from now on to that servo:
    maxminpos[0][servo]=final_min;
}


void ServoMaximumPulse(unsigned char servo,int max_microseconds)
{
	unsigned char final_max;

    // test if numservo is valid:
	if(servo>=PIC18F2550_pins)
		return;
    // test if microseconds are within range:
	if((max_microseconds<1500) || (max_microseconds>2500))
		return;

	// The following formula converts from microseconds to timeslot:
	final_max=(max_microseconds-500+1)/8;

    // Store in 1st column the minimum value allowed from now on to that servo:
    maxminpos[1][servo]=final_max;
}


//interrupt handler that handles servos
void servos_interrupt(void)
{
	if (PIR1bits.TMR1IF) {
		PIR1bits.TMR1IF=0;
		T1CONbits.TMR1ON   = 0; // Stops TMR1
		if (phase) {
		//case before 500 microseconds:
			ServosPulseUp();
			// timer 1 prescaler 1 source is internal oscillator Fosc/4 (CPU clock or Fosc=48Mhz).
			T1CON=1;
			//OLD: Load at TMR1 54159d(also 0xFFFF - 12000d (- 54usec for adjustments))= 0xd38f.
			//NEW: Load at TMR1 (65535d - 6000d (-54usec for adjusments ) = 59481d = 0xE859 (after some calibration 0xe959)
			
			TMR1H= 0xe9;
			TMR1L= 0x59;

			
			phase = 0;
		}
		else {
		//case after 2500 microseconds:
			//The following call takes 2 ms aprox.:
			ServosPulseDown();
			// OLD: Now it takes place a 18 ms delay, after that a interrupt will be generated.
			// OLD:Loading at TMR1 11535d (que es: 0xFFFF - (4,5 x 12000(duracion 1ms)) = 0x2D0F => a 4,5 ms)
			// OLD: This 4,5 x 4 (with preescaler x 4) we get 18 ms delay.
			// NEW: after 2,5 ms we need a delay of 17,5 ms to complete a 20 ms cycle.
			// NEW: Loading at TMR1 65535d - (4,375 x 12000(=1ms)=) 52500d = 13035d = 0x32EB => 4,375 ms
			// NEW: This is 4,375ms x 4 (preescaler) = 17,5 ms
            T1CON= ( 1 | 2 << 4 ) ; // activate timer1 and prescaler = 1:4			
			TMR1H= 0x32;
			TMR1L= 0xeb;
			
			
			if (needreordering)
				SortServoTimings();  // This takes more than 1 ms, but it's call only if needed.
			// timer 1 prescaler 1 source is internal oscillator Fosc/4 (recordemos que Fosc=48Mhz).
			
			
			phase = 1;  //This indicates that after next interrupt it will start the servos cycle.
		}
		T1CONbits.TMR1ON   = 1; // Starting TMR1
	}
	return;
}
#endif
