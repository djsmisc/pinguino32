/*******************************************************************************
	Title:	USB Pinguino Bootloader
	File:	config.h
	Descr.: configuration bits
	Author:	Régis Blanchot <rblanchot@gmail.com>

	This file is part of Pinguino (http://www.pinguino.cc)
	Released under the LGPL license (http://www.gnu.org/licenses/lgpl.html)
*******************************************************************************/

#if defined(__18F2550) || defined(__18f4550)
    #if (SPEED == LOW_SPEED)
    #error "No low-speed mode on this device."
    #endif
/*
    if SDCC version < 3.1.5

    static __code char __at __CONFIG1L _c1l = _USBPLL_CLOCK_SRC_FROM_96MHZ_PLL_2_1L & _CPUDIV__OSC1_OSC2_SRC___1__96MHZ_PLL_SRC___2__1L & _PLLDIV_DIVIDE_BY_5__20MHZ_INPUT__1L;
    static __code char __at __CONFIG1H _c1h = _OSC_HS__HS_PLL__USB_HS_1H & _FCMEN_OFF_1H & _IESO_OFF_1H;
    static __code char __at __CONFIG2L _c2l = _PUT_OFF_2L & _VREGEN_ON_2L & _BODEN_OFF_2L & _BODENV_2_0V_2L;
    static __code char __at __CONFIG2H _c2h = _WDT_DISABLED_CONTROLLED_2H & _WDTPS_1_32768_2H;
    static __code char __at __CONFIG3H _c3h = _CCP2MUX_RC1_3H & _PBADEN_PORTB_4_0__CONFIGURED_AS_DIGITAL_I_O_ON_RESET_3H & _LPT1OSC_OFF_3H & _MCLRE_MCLR_ON_RE3_OFF_3H;
    static __code char __at __CONFIG4L _c4l = _STVR_OFF_4L & _LVP_OFF_4L & _ENHCPU_OFF_4L & _BACKBUG_OFF_4L & _ENICPORT_OFF_4L;
    static __code char __at __CONFIG5L _c5l = _CP_0_OFF_5L & _CP_1_OFF_5L & _CP_2_OFF_5L & _CP_3_OFF_5L;
    static __code char __at __CONFIG5H _c5h = _CPD_OFF_5H & _CPB_OFF_5H;
    static __code char __at __CONFIG6L _c6l = _WRT_0_OFF_6L & _WRT_1_OFF_6L & _WRT_2_OFF_6L & _WRT_3_OFF_6L;
    static __code char __at __CONFIG6H _c6h = _WRTD_OFF_6H & _WRTB_OFF_6H & _WRTC_OFF_6H;
    static __code char __at __CONFIG7L _c7l = _EBTR_0_OFF_7L & _EBTR_1_OFF_7L & _EBTR_2_OFF_7L & _EBTR_3_OFF_7L;
    static __code char __at __CONFIG7H _c7h = _EBTRB_OFF_7H;
*/

    #pragma config PLLDIV = 5			// OSC/5 for 20MHz = 4MHz
    #pragma config CPUDIV = OSC1_PLL2	// CPU_clk = PLL/2
    #pragma config USBDIV = 2			// USB_clk = PLL/2
    #pragma config FOSC = HSPLL_HS		// HS osc PLL
    #pragma config FCMEN = ON			// Fail Safe Clock Monitor
    #pragma config IESO = OFF			// Int/Ext switchover mode
    #pragma config PWRT = ON			// PowerUp Timer
    #pragma config BOR = OFF			// Brown Out
    #pragma config VREGEN = ON			// Int Voltage Regulator
    #pragma config WDT = OFF			// WatchDog Timer
    #pragma config MCLRE = ON			// MCLR
    #pragma config LPT1OSC = OFF		// Low Power OSC
    #pragma config PBADEN = ON			// PORTB<4:0> A/D
    #pragma config CCP2MX = ON			// CCP2 Mux RC1
    #pragma config STVREN = ON			// Stack Overflow Reset
    #pragma config LVP = OFF			// Low Voltage Programming
    #pragma config ICPRT = OFF			// ICP
    #pragma config XINST = OFF			// Ext CPU Instruction Set
    #pragma config DEBUG = OFF			// Background Debugging
    #pragma config CP0 = ON				// Code Protect
    #pragma config CP1 = ON
    #pragma config CP2 = ON
    #pragma config CPB = ON   			// Boot Sect Code Protect
    #pragma config CPD = OFF  			// EEPROM Data Protect
    #pragma config WRT0 = OFF 			// Table Write Protect
    #pragma config WRT1 = OFF
    #pragma config WRT2 = OFF 
    #pragma config WRTB = ON  			// Boot Table Write Protect
    #pragma config WRTC = ON  			// CONFIG Write Protect
    #pragma config WRTD = OFF 			// EEPROM Write Protect
    #pragma config EBTR0 = OFF			// Ext Table Read Protect
    #pragma config EBTR1 = OFF
    #pragma config EBTR2 = OFF
    #pragma config EBTRB = ON 			// Boot Table Read Protect

#endif

#if defined(__18f26j50)
/*
    if SDCC version < 3.1.5

    #if (SPEED == LOW_SPEED) || (CRYSTAL == 8)
    static __code char __at __CONFIG1L _conf0 = 0xAC;		// 8 MHz (int. or ext.)
    #else
    static __code char __at __CONFIG1L _conf0 = 0x86;		// 20 MHz (ext.)
    #endif

    // DS39931D-page 40 - 2011 Microchip Technology Inc.
    // PIC18F46J50 family core must run at 24 MHz in order for the USB module
    // to get the 6 MHz clock needed for low-speed USB operation.

    #if SPEED == LOW_SPEED
    static __code char __at __CONFIG1H _conf1 = 0xF7;		// 24 MHz (CPU system clock divided by 2)
    static __code char __at __CONFIG2L _conf2 = 0x1A;		// INTOSCPLL
    #else
    static __code char __at __CONFIG1H _conf1 = 0xF7;		// 48 MHz (No CPU system clock divide)
    static __code char __at __CONFIG2L _conf2 = 0x1D;		// HSPLL
    #endif

    static __code char __at __CONFIG2H _conf3 = 0xFF;
    static __code char __at __CONFIG3L _conf4 = 0x61;       // DSWDT and RTCC uses INTRC
    static __code char __at __CONFIG3H _conf5 = 0xF8;
    static __code char __at __CONFIG4L _conf6 = 0x81;// 0xFF
    static __code char __at __CONFIG4H _conf7 = 0xF1;
*/

    #if (SPEED == LOW_SPEED) || (CRYSTAL == 8)
        #pragma config PLLDIV = 2       // Divide by 2 (8 MHz oscillator input)
    #else
        #pragma config PLLDIV = 5       // Divide by 5 (20 MHz oscillator input)
    #endif

    // DS39931D-page 40 - 2011 Microchip Technology Inc.
    // PIC18F46J50 family core must run at 24 MHz in order for the USB module
    // to get the 6 MHz clock needed for low-speed USB operation.

    #if SPEED == LOW_SPEED
        #pragma config CPUDIV = OSC2_PLL2// 24 MHz (CPU system clock divided by 2)
        #pragma config OSC = INTOSCPLL  // internal RC oscillator, PLL enabled, HSPLL used by USB
    #else
        #pragma config CPUDIV = OSC1    // 48 MHz (No CPU system clock divide)
        #pragma config OSC = HSPLL      // external oscillator, PLL enabled, HSPLL used by USB
    #endif

    #pragma config WDTEN = OFF          // WDT disabled (enabled by SWDTEN bit)
    #pragma config STVREN = ON          // stack overflow/underflow reset enabled
    #pragma config XINST = OFF          // Extended instruction set disabled
    #pragma config CP0 = OFF            // Program memory is not code-protected
    #pragma config IESO = OFF           // Two-Speed Start-up disabled
    #pragma config FCMEN = OFF          // Fail-Safe Clock Monitor disabled
    #pragma config LPT1OSC = OFF        // high power Timer1 mode
    #pragma config T1DIG = ON           // Sec Osc clock source may be selected
    #pragma config WDTPS = 32768        // 1:32768
    #pragma config DSWDTPS = 8192       // 1:8,192 (8.5 seconds)
    #pragma config DSWDTEN = OFF        // Disabled
    #pragma config DSBOREN = OFF        // Zero-Power BOR disabled in Deep Sleep
    #pragma config RTCOSC = T1OSCREF    // RTCC uses T1OSC/T1CKI as clock
    #pragma config DSWDTOSC = INTOSCREF // DSWDT uses INTOSC/INTRC as clock
    #pragma config MSSP7B_EN = MSK7     // 7 Bit address masking
    #pragma config IOL1WAY = OFF        // IOLOCK bit can be set and cleared
    #pragma config WPCFG = OFF          // Write/Erase last page protect Disabled
    #pragma config WPEND = PAGE_0       // Start protection at page 0
    #pragma config WPFP = PAGE_1        // Write Protect Program Flash Page 0
    #pragma config WPDIS = OFF          // WPFP[5:0], WPEND, and WPCFG bits ignored 

#endif
