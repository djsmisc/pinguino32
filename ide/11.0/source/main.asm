;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8447 (Jul 12 2013) (Linux)
; This file was generated Tue Oct  1 18:05:58 2013
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f4550
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_Delayms
	global	_Delayus
	global	_IO_init
	global	_IO_digital
	global	_setup
	global	_loop
	global	_epap_in
	global	_epap_out
	global	_epapin_init
	global	_epapout_init
	global	_pinguino_main

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	_SPPCFGbits
	extern	_SPPEPSbits
	extern	_SPPCONbits
	extern	_UFRMLbits
	extern	_UFRMHbits
	extern	_UIRbits
	extern	_UIEbits
	extern	_UEIRbits
	extern	_UEIEbits
	extern	_USTATbits
	extern	_UCONbits
	extern	_UADDRbits
	extern	_UCFGbits
	extern	_UEP0bits
	extern	_UEP1bits
	extern	_UEP2bits
	extern	_UEP3bits
	extern	_UEP4bits
	extern	_UEP5bits
	extern	_UEP6bits
	extern	_UEP7bits
	extern	_UEP8bits
	extern	_UEP9bits
	extern	_UEP10bits
	extern	_UEP11bits
	extern	_UEP12bits
	extern	_UEP13bits
	extern	_UEP14bits
	extern	_UEP15bits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_LATDbits
	extern	_LATEbits
	extern	_DDRAbits
	extern	_TRISAbits
	extern	_DDRBbits
	extern	_TRISBbits
	extern	_DDRCbits
	extern	_TRISCbits
	extern	_DDRDbits
	extern	_TRISDbits
	extern	_DDREbits
	extern	_TRISEbits
	extern	_OSCTUNEbits
	extern	_PIE1bits
	extern	_PIR1bits
	extern	_IPR1bits
	extern	_PIE2bits
	extern	_PIR2bits
	extern	_IPR2bits
	extern	_EECON1bits
	extern	_RCSTAbits
	extern	_TXSTAbits
	extern	_T3CONbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_CCP1ASbits
	extern	_ECCP1ASbits
	extern	_CCP1DELbits
	extern	_ECCP1DELbits
	extern	_BAUDCONbits
	extern	_BAUDCTLbits
	extern	_CCP2CONbits
	extern	_CCP1CONbits
	extern	_ECCP1CONbits
	extern	_ADCON2bits
	extern	_ADCON1bits
	extern	_ADCON0bits
	extern	_SSPCON2bits
	extern	_SSPCON1bits
	extern	_SSPSTATbits
	extern	_T2CONbits
	extern	_T1CONbits
	extern	_RCONbits
	extern	_WDTCONbits
	extern	_HLVDCONbits
	extern	_LVDCONbits
	extern	_OSCCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_STKPTRbits
	extern	_SPPDATA
	extern	_SPPCFG
	extern	_SPPEPS
	extern	_SPPCON
	extern	_UFRM
	extern	_UFRML
	extern	_UFRMH
	extern	_UIR
	extern	_UIE
	extern	_UEIR
	extern	_UEIE
	extern	_USTAT
	extern	_UCON
	extern	_UADDR
	extern	_UCFG
	extern	_UEP0
	extern	_UEP1
	extern	_UEP2
	extern	_UEP3
	extern	_UEP4
	extern	_UEP5
	extern	_UEP6
	extern	_UEP7
	extern	_UEP8
	extern	_UEP9
	extern	_UEP10
	extern	_UEP11
	extern	_UEP12
	extern	_UEP13
	extern	_UEP14
	extern	_UEP15
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_LATD
	extern	_LATE
	extern	_DDRA
	extern	_TRISA
	extern	_DDRB
	extern	_TRISB
	extern	_DDRC
	extern	_TRISC
	extern	_DDRD
	extern	_TRISD
	extern	_DDRE
	extern	_TRISE
	extern	_OSCTUNE
	extern	_PIE1
	extern	_PIR1
	extern	_IPR1
	extern	_PIE2
	extern	_PIR2
	extern	_IPR2
	extern	_EECON1
	extern	_EECON2
	extern	_EEDATA
	extern	_EEADR
	extern	_RCSTA
	extern	_TXSTA
	extern	_TXREG
	extern	_RCREG
	extern	_SPBRG
	extern	_SPBRGH
	extern	_T3CON
	extern	_TMR3
	extern	_TMR3L
	extern	_TMR3H
	extern	_CMCON
	extern	_CVRCON
	extern	_CCP1AS
	extern	_ECCP1AS
	extern	_CCP1DEL
	extern	_ECCP1DEL
	extern	_BAUDCON
	extern	_BAUDCTL
	extern	_CCP2CON
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP1CON
	extern	_ECCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ADCON2
	extern	_ADCON1
	extern	_ADCON0
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSPCON2
	extern	_SSPCON1
	extern	_SSPSTAT
	extern	_SSPADD
	extern	_SSPBUF
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_T1CON
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_WDTCON
	extern	_HLVDCON
	extern	_LVDCON
	extern	_OSCCON
	extern	_T0CON
	extern	_TMR0
	extern	_TMR0L
	extern	_TMR0H
	extern	_STATUS
	extern	_FSR2L
	extern	_FSR2H
	extern	_PLUSW2
	extern	_PREINC2
	extern	_POSTDEC2
	extern	_POSTINC2
	extern	_INDF2
	extern	_BSR
	extern	_FSR1L
	extern	_FSR1H
	extern	_PLUSW1
	extern	_PREINC1
	extern	_POSTDEC1
	extern	_POSTINC1
	extern	_INDF1
	extern	_WREG
	extern	_FSR0L
	extern	_FSR0H
	extern	_PLUSW0
	extern	_PREINC0
	extern	_POSTDEC0
	extern	_POSTINC0
	extern	_INDF0
	extern	_INTCON3
	extern	_INTCON2
	extern	_INTCON
	extern	_PROD
	extern	_PRODL
	extern	_PRODH
	extern	_TABLAT
	extern	_TBLPTR
	extern	_TBLPTRL
	extern	_TBLPTRH
	extern	_TBLPTRU
	extern	_PC
	extern	_PCL
	extern	_PCLATH
	extern	_PCLATU
	extern	_STKPTR
	extern	_TOS
	extern	_TOSL
	extern	_TOSH
	extern	_TOSU
	extern	_delay1ktcy

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_main__pinguino_main	code
_pinguino_main:
;	.line	109; /dvpt/pinguino/svn/ide/x.4/source/main.c	if (OSCCONbits.SCS > 0x02)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ADDLW	0x80
	ADDLW	0x7d
	BNC	_00185_DS_
_00181_DS_:
;	.line	111; /dvpt/pinguino/svn/ide/x.4/source/main.c	while (!OSCCONbits.IOFS);
	BTFSS	_OSCCONbits, 2
	BRA	_00181_DS_
_00185_DS_:
;	.line	126; /dvpt/pinguino/svn/ide/x.4/source/main.c	RCONbits.IPEN       = 1;        // Enable priority levels on interrupts
	BSF	_RCONbits, 7
;	.line	127; /dvpt/pinguino/svn/ide/x.4/source/main.c	INTCONbits.GIEH     = 0;        // Disables all interrupts
	BCF	_INTCONbits, 7
;	.line	128; /dvpt/pinguino/svn/ide/x.4/source/main.c	INTCONbits.GIEL     = 0;        // Disables all interrupts
	BCF	_INTCONbits, 6
;	.line	173; /dvpt/pinguino/svn/ide/x.4/source/main.c	IO_init();
	CALL	_IO_init
;	.line	174; /dvpt/pinguino/svn/ide/x.4/source/main.c	IO_digital();
	CALL	_IO_digital
;	.line	221; /dvpt/pinguino/svn/ide/x.4/source/main.c	setup();
	CALL	_setup
_00187_DS_:
;	.line	233; /dvpt/pinguino/svn/ide/x.4/source/main.c	loop();
	CALL	_loop
	BRA	_00187_DS_
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	77; /dvpt/pinguino/svn/ide/x.4/source/main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	76; /dvpt/pinguino/svn/ide/x.4/source/main.c	void epapin_init()  { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	75; /dvpt/pinguino/svn/ide/x.4/source/main.c	void epap_out()     { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	74; /dvpt/pinguino/svn/ide/x.4/source/main.c	void epap_in()      { return; }
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	13; /dvpt/pinguino/svn/ide/x.4/source/user.c	LATAbits.LATA4 = 0;
	BCF	_LATAbits, 4
;	.line	14; /dvpt/pinguino/svn/ide/x.4/source/user.c	Delayms(50);
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	15; /dvpt/pinguino/svn/ide/x.4/source/user.c	LATAbits.LATA4 = 1;
	BSF	_LATAbits, 4
;	.line	16; /dvpt/pinguino/svn/ide/x.4/source/user.c	Delayms(50);
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	7; /dvpt/pinguino/svn/ide/x.4/source/user.c	TRISAbits.TRISA4 = OUTPUT;
	BCF	_TRISAbits, 4
	RETURN	

; ; Starting pCode block
S_main__IO_digital	code
_IO_digital:
;	.line	108; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	ADCON1 = 0x0F;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	109; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	CMCON = 0x07;               // Comparators as Digital I/O
	MOVLW	0x07
	MOVWF	_CMCON
	RETURN	

; ; Starting pCode block
S_main__IO_init	code
_IO_init:
;	.line	46; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATA  = 0x00;
	CLRF	_LATA
;	.line	47; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATB  = 0x00;
	CLRF	_LATB
;	.line	61; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATC  = 0x40;	
	MOVLW	0x40
	MOVWF	_LATC
;	.line	68; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATD  = 0x00; 
	CLRF	_LATD
;	.line	69; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATE  = 0x00; 
	CLRF	_LATE
;	.line	72; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISA = 0x00;
	CLRF	_TRISA
;	.line	74; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISB = 0x00;
	CLRF	_TRISB
;	.line	76; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC0 = 0x00;
	BCF	_TRISCbits, 0
;	.line	77; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC1 = 0x00;
	BCF	_TRISCbits, 1
;	.line	78; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC2 = 0x00;
	BCF	_TRISCbits, 2
;	.line	79; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC6 = 0x00;
	BCF	_TRISCbits, 6
;	.line	80; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC7 = 0x00;
	BCF	_TRISCbits, 7
;	.line	84; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISD = 0x00; 
	CLRF	_TRISD
;	.line	85; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISE = 0x00; 
	CLRF	_TRISE
	RETURN	

; ; Starting pCode block
S_main__Delayus	code
_Delayus:
;	.line	86; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/delay.c	void Delayus(unsigned int microseconds)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	90; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/delay.c	for (i=0; i<microseconds; i++)
	CLRF	r0x02
	CLRF	r0x03
_00125_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00136_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00136_DS_:
	BC	_00127_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00125_DS_
_00127_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayms	code
_Delayms:
;	.line	78; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/delay.c	void Delayms(unsigned int milliseconds)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	82; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/delay.c	for (i=0; i<milliseconds; i++)
	CLRF	r0x02
	CLRF	r0x03
_00107_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00118_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00118_DS_:
	BC	_00109_DS_
;	.line	83; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/delay.c	delay1ktcy(12);
	MOVLW	0x0c
	CALL	_delay1ktcy
;	.line	82; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/delay.c	for (i=0; i<milliseconds; i++)
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00107_DS_
_00109_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	  294 (0x0126) bytes ( 0.22%)
;           	  147 (0x0093) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    4 (0x0004) bytes


	end
