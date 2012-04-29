;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Aug  9 2009) (UNIX)
; This file was generated Fri Apr 27 20:09:59 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f2550

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _Delayms
	global _Delayus
	global _digitalwrite
	global _digitalread
	global _pinmode
	global _toggle
	global _epap_in
	global _epap_out
	global _epapin_init
	global _epapout_init
	global _setup
	global _loop
	global _pinguino_main
	global _high_priority_isr
	global _low_priority_isr
	global _mask
	global _port

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern _SPPDATAbits
	extern _SPPCFGbits
	extern _SPPEPSbits
	extern _SPPCONbits
	extern _UFRMLbits
	extern _UFRMHbits
	extern _UIRbits
	extern _UIEbits
	extern _UEIRbits
	extern _UEIEbits
	extern _USTATbits
	extern _UCONbits
	extern _UADDRbits
	extern _UCFGbits
	extern _UEP0bits
	extern _UEP1bits
	extern _UEP2bits
	extern _UEP3bits
	extern _UEP4bits
	extern _UEP5bits
	extern _UEP6bits
	extern _UEP7bits
	extern _UEP8bits
	extern _UEP9bits
	extern _UEP10bits
	extern _UEP11bits
	extern _UEP12bits
	extern _UEP13bits
	extern _UEP14bits
	extern _UEP15bits
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _TRISAbits
	extern _TRISBbits
	extern _TRISCbits
	extern _TRISDbits
	extern _TRISEbits
	extern _OSCTUNEbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _TXSTAbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _ECCP1ASbits
	extern _ECCP1DELbits
	extern _BAUDCONbits
	extern _CCP2CONbits
	extern _CCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSPCON2bits
	extern _SSPCON1bits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _HLVDCONbits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _FSR2Hbits
	extern _BSRbits
	extern _FSR1Hbits
	extern _FSR0Hbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _TBLPTRUbits
	extern _PCLATHbits
	extern _PCLATUbits
	extern _STKPTRbits
	extern _TOSUbits
	extern _usb_device_state
	extern _usb_active_cfg
	extern _usb_active_alt_setting
	extern _SPPDATA
	extern _SPPCFG
	extern _SPPEPS
	extern _SPPCON
	extern _UFRML
	extern _UFRMH
	extern _UIR
	extern _UIE
	extern _UEIR
	extern _UEIE
	extern _USTAT
	extern _UCON
	extern _UADDR
	extern _UCFG
	extern _UEP0
	extern _UEP1
	extern _UEP2
	extern _UEP3
	extern _UEP4
	extern _UEP5
	extern _UEP6
	extern _UEP7
	extern _UEP8
	extern _UEP9
	extern _UEP10
	extern _UEP11
	extern _UEP12
	extern _UEP13
	extern _UEP14
	extern _UEP15
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _TRISA
	extern _TRISB
	extern _TRISC
	extern _TRISD
	extern _TRISE
	extern _OSCTUNE
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _EECON1
	extern _EECON2
	extern _EEDATA
	extern _EEADR
	extern _RCSTA
	extern _TXSTA
	extern _TXREG
	extern _RCREG
	extern _SPBRG
	extern _SPBRGH
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _ECCP1AS
	extern _ECCP1DEL
	extern _BAUDCON
	extern _CCP2CON
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRESL
	extern _ADRESH
	extern _SSPCON2
	extern _SSPCON1
	extern _SSPSTAT
	extern _SSPADD
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _HLVDCON
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _delay10ktcy
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
;	.line	146; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	void high_priority_isr(void) __naked __interrupt 1
S_main__high_priority_isr	code	0X002020
_high_priority_isr:
;	.line	214; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	}
; ; Starting pCode block
;	.line	222; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	void low_priority_isr(void) __naked __interrupt 2
S_main__low_priority_isr	code	0X004000
_low_priority_isr:
;	.line	230; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	}
; I code from now on!
; ; Starting pCode block
S_main__pinguino_main	code
_pinguino_main:
;	.line	63; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	PIE1 = 0;
	CLRF	_PIE1
;	.line	64; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	PIE2 = 0;
	CLRF	_PIE2
;	.line	67; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	ADCON1 = 0x0F;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	85; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	setup();
	CALL	_setup
_00236_DS_:
;	.line	137; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	loop();
	CALL	_loop
	BRA	_00236_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	11; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/user.c	toggle(13);			
	MOVLW	0x0d
	MOVWF	POSTDEC1
	CALL	_toggle
	INCF	FSR1L, F
;	.line	12; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/user.c	Delayms(1000);		
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	6; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/user.c	pinmode(13, OUTPUT);     
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0d
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVLW	0x04
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	50; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	49; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	void epapin_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	48; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	void epap_out() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	47; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/source/main.c	void epap_in() { return; }
	RETURN	

; ; Starting pCode block
S_main__toggle	code
_toggle:
;	.line	181; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	void toggle(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	184; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	val = digitalread(pin);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalread
	MOVWF	r0x01
	INCF	FSR1L, F
;	.line	185; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	digitalwrite(pin, val^1);
	MOVLW	0x01
	XORWF	r0x01, F
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__pinmode	code
_pinmode:
;	.line	157; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	void pinmode(int input, int state)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	159; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	switch (port[input])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_port)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_port)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVLW	0x03
	SUBWF	r0x04, W
	BTFSC	STATUS, 0
	BRA	_00188_DS_
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x04, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00195_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00195_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00195_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00195_DS_:
	GOTO	_00175_DS_
	GOTO	_00179_DS_
	GOTO	_00183_DS_
_00175_DS_:
;	.line	161; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	case pB: if (state) TRISB=TRISB | mask[input];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00177_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	IORWF	_TRISB, F
	BRA	_00188_DS_
_00177_DS_:
;	.line	162; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	else TRISB=TRISB & (255-mask[input]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	SUBLW	0xff
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	_TRISB, F
;	.line	163; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	break;
	BRA	_00188_DS_
_00179_DS_:
;	.line	164; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	case pC: if (state) TRISC=TRISC | mask[input];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00181_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	IORWF	_TRISC, F
	BRA	_00188_DS_
_00181_DS_:
;	.line	165; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	else TRISC=TRISC & (255-mask[input]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	SUBLW	0xff
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	_TRISC, F
;	.line	166; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	break;
	BRA	_00188_DS_
_00183_DS_:
;	.line	167; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	case pA: if (state) TRISA=TRISA | mask[input];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00185_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	BTFSC	r0x01, 7
	SETF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_TRISA, F
	BRA	_00188_DS_
_00185_DS_:
;	.line	168; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	else TRISA=TRISA & (255-mask[input]);
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
	MOVLW	LOW(_mask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_mask)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	MOVF	r0x00, W
	SUBLW	0xff
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ANDWF	_TRISA, F
_00188_DS_:
;	.line	178; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	}
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__digitalread	code
_digitalread:
;	.line	127; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	u8 digitalread(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	131; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	switch (port[pin])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_port)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_port)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVLW	0x03
	SUBWF	r0x01, W
	BC	_00161_DS_
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	CLRF	r0x06
	RLCF	r0x01, W
	RLCF	r0x06, F
	RLCF	WREG, W
	RLCF	r0x06, F
	ANDLW	0xfc
	MOVWF	r0x05
	MOVLW	UPPER(_00170_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00170_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00170_DS_)
	ADDWF	r0x05, F
	MOVF	r0x06, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x05, W
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVWF	PCL
_00170_DS_:
	GOTO	_00158_DS_
	GOTO	_00159_DS_
	GOTO	_00160_DS_
_00158_DS_:
;	.line	134; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	reg = TRISB;
	MOVFF	_TRISB, r0x01
	CLRF	r0x02
;	.line	135; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	break;
	BRA	_00161_DS_
_00159_DS_:
;	.line	137; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	reg = TRISC;
	MOVFF	_TRISC, r0x01
	CLRF	r0x02
;	.line	138; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	break;
	BRA	_00161_DS_
_00160_DS_:
;	.line	140; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	reg = TRISA;
	MOVFF	_TRISA, r0x01
	CLRF	r0x02
_00161_DS_:
;	.line	151; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	if ((reg & mask[pin])!=0)
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	LOW(_mask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x03
	MOVF	r0x00, W
	ANDWF	r0x01, F
	MOVF	r0x03, W
	ANDWF	r0x02, F
	MOVF	r0x01, W
	IORWF	r0x02, W
	BZ	_00163_DS_
;	.line	152; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	return 1;
	MOVLW	0x01
	BRA	_00165_DS_
_00163_DS_:
;	.line	154; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	return 0;
	CLRF	WREG
_00165_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__digitalwrite	code
_digitalwrite:
;	.line	76; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	void digitalwrite(int output,int state)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	78; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	switch (port[output])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_port)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_port)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVLW	0x03
	SUBWF	r0x04, W
	BTFSC	STATUS, 0
	BRA	_00146_DS_
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x04, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00153_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00153_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00153_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00153_DS_:
	GOTO	_00133_DS_
	GOTO	_00137_DS_
	GOTO	_00141_DS_
_00133_DS_:
;	.line	80; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	case pB: if (state) PORTB=PORTB | mask[output]; 
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00135_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	IORWF	_PORTB, F
	BRA	_00146_DS_
_00135_DS_:
;	.line	81; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	else PORTB=PORTB & (255-mask[output]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	SUBLW	0xff
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	_PORTB, F
;	.line	82; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	break;
	BRA	_00146_DS_
_00137_DS_:
;	.line	83; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	case pC: if (state) PORTC=PORTC | mask[output];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00139_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	IORWF	_PORTC, F
	BRA	_00146_DS_
_00139_DS_:
;	.line	84; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	else PORTC=PORTC & (255-mask[output]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	SUBLW	0xff
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	_PORTC, F
;	.line	85; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	break;
	BRA	_00146_DS_
_00141_DS_:
;	.line	86; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	case pA: if (state) PORTA=PORTA | mask[output];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00143_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	BTFSC	r0x01, 7
	SETF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_PORTA, F
	BRA	_00146_DS_
_00143_DS_:
;	.line	87; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	else PORTA=PORTA & (255-mask[output]);
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
	MOVLW	LOW(_mask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_mask)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	MOVF	r0x00, W
	SUBLW	0xff
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ANDWF	_PORTA, F
_00146_DS_:
;	.line	97; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/digitalw.c	}
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayus	code
_Delayus:
;	.line	16; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/delay.c	void Delayus(int microsecondes)
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
;	.line	20; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/delay.c	for (i=0;i<microsecondes;i++);
	CLRF	r0x02
	CLRF	r0x03
_00119_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00128_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00128_DS_:
	BC	_00123_DS_
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00119_DS_
_00123_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayms	code
_Delayms:
;	.line	9; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/delay.c	void Delayms(unsigned long milliseconde)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	13; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.3/p8/include/pinguino/core/delay.c	for (i=0;i<milliseconde;i++) delay10ktcy(1);
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
_00105_DS_:
	MOVF	r0x03, W
	SUBWF	r0x07, W
	BNZ	_00114_DS_
	MOVF	r0x02, W
	SUBWF	r0x06, W
	BNZ	_00114_DS_
	MOVF	r0x01, W
	SUBWF	r0x05, W
	BNZ	_00114_DS_
	MOVF	r0x00, W
	SUBWF	r0x04, W
_00114_DS_:
	BC	_00109_DS_
	MOVLW	0x01
	CALL	_delay10ktcy
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00105_DS_
_00109_DS_:
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block for Ival
	code
_mask:
	DB	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x40, 0x80, 0x01, 0x02
	DB	0x04, 0x01, 0x02, 0x04, 0x08, 0x20
; ; Starting pCode block for Ival
_port:
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x02, 0x02, 0x02, 0x02, 0x02


; Statistics:
; code size:	 1650 (0x0672) bytes ( 1.26%)
;           	  825 (0x0339) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    9 (0x0009) bytes


	end
