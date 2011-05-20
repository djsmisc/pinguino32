;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Aug  9 2009) (UNIX)
; This file was generated Fri May 20 22:18:15 2011
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f2550

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _this_mode
	global _this_clock
	global _this_role
	global _Delayms
	global _Delayus
	global _digitalwrite
	global _digitalread
	global _pinmode
	global _toggle
	global _SPI_init
	global _SPI_setBitOrder
	global _SPI_setDataMode
	global _SPI_setClockDivider
	global _SPI_write
	global _SPI_read
	global _epap_in
	global _epap_out
	global _epapin_init
	global _epapout_init
	global _digitalPotWrite
	global _setup
	global _loop
	global _pinguino_main
	global _high_priority_isr
	global _low_priority_isr
	global _mask
	global _port
	global _slaveSelectPin

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
BSR	equ	0xfe0
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_this_mode	db	0x00
_this_clock	db	0x00
_this_role	db	0x00


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
S_main__high_priority_isr	code	0X002020
_high_priority_isr:
;	.line	121; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	void high_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	182; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	}
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; ; Starting pCode block
S_main__low_priority_isr	code	0X004000
_low_priority_isr:
;	.line	185; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	void low_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	190; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	}
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; I code from now on!
; ; Starting pCode block
S_main__pinguino_main	code
_pinguino_main:
;	.line	53; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	PIE1 = 0;
	CLRF	_PIE1
;	.line	54; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	PIE2 = 0;
	CLRF	_PIE2
;	.line	55; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	ADCON1 = 0b00001111;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	67; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	setup();
	CALL	_setup
_00342_DS_:
;	.line	115; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	loop();
	CALL	_loop
	BRA	_00342_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	52; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	void loop()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
;	.line	58; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	for (channel = 0; channel < 6; channel++)
	CLRF	r0x00
	CLRF	r0x01
_00319_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00334_DS_
	MOVLW	0x06
	SUBWF	r0x00, W
_00334_DS_:
	BTFSC	STATUS, 0
	BRA	_00323_DS_
;	.line	61; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	for (level = 0; level < 255; level++)
	CLRF	r0x02
	CLRF	r0x03
_00311_DS_:
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00335_DS_
	MOVLW	0xff
	SUBWF	r0x02, W
_00335_DS_:
	BC	_00314_DS_
;	.line	63; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	digitalPotWrite(channel, level);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalPotWrite
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	64; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	Delayms(10);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	61; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	for (level = 0; level < 255; level++)
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00311_DS_
_00314_DS_:
;	.line	67; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	Delayms(100);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x64
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	69; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	for (level = 0; level < 255; level++)
	CLRF	r0x02
	CLRF	r0x03
_00315_DS_:
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00336_DS_
	MOVLW	0xff
	SUBWF	r0x02, W
_00336_DS_:
	BC	_00321_DS_
;	.line	71; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	digitalPotWrite(channel, 255 - level);
	MOVF	r0x02, W
	SUBLW	0xff
	MOVWF	r0x04
	MOVLW	0x00
	SUBFWB	r0x03, W
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalPotWrite
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	72; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	Delayms(10);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	69; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	for (level = 0; level < 255; level++)
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00315_DS_
_00321_DS_:
;	.line	58; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	for (channel = 0; channel < 6; channel++)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00319_DS_
_00323_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	44; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	void setup()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	47; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	pinmode (slaveSelectPin, OUTPUT);
	MOVLW	LOW(_slaveSelectPin)
	MOVWF	TBLPTRL
	MOVLW	HIGH(_slaveSelectPin)
	MOVWF	TBLPTRH
	MOVLW	UPPER(_slaveSelectPin)
	MOVWF	TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	49; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	SPI_init(); 
	CALL	_SPI_init
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__digitalPotWrite	code
_digitalPotWrite:
;	.line	33; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	int digitalPotWrite(int address, int value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	36; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	digitalwrite(slaveSelectPin,LOW);
	MOVLW	LOW(_slaveSelectPin)
	MOVWF	TBLPTRL
	MOVLW	HIGH(_slaveSelectPin)
	MOVWF	TBLPTRH
	MOVLW	UPPER(_slaveSelectPin)
	MOVWF	TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	TBLRD*+	
	MOVFF	TABLAT, r0x05
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	38; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	SPI_write(address);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_SPI_write
	INCF	FSR1L, F
;	.line	39; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	SPI_write(value);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_SPI_write
	INCF	FSR1L, F
;	.line	41; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/user.c	digitalwrite(slaveSelectPin,HIGH); 
	MOVLW	LOW(_slaveSelectPin)
	MOVWF	TBLPTRL
	MOVLW	HIGH(_slaveSelectPin)
	MOVWF	TBLPTRH
	MOVLW	UPPER(_slaveSelectPin)
	MOVWF	TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	41; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	40; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	void epapin_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	39; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	void epap_out() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	38; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/source/main.c	void epap_in() { return; }
	RETURN	

; ; Starting pCode block
S_main__SPI_read	code
_SPI_read:
;	.line	139; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	char SPI_read(void)
	MOVFF	r0x00, POSTDEC1
;	.line	143; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	if(SSPSTATbits.BF)
	BTFSS	_SSPSTATbits, 0
	BRA	_00274_DS_
;	.line	144; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	c = SSPBUF;
	MOVFF	_SSPBUF, r0x00
	BRA	_00275_DS_
_00274_DS_:
;	.line	146; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	c = SPI_write(0x00);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_SPI_write
	MOVWF	r0x00
	INCF	FSR1L, F
_00275_DS_:
;	.line	148; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	return c;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__SPI_write	code
_SPI_write:
;	.line	119; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	char SPI_write(char c)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	122; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	PIR1bits.SSPIF = 0;
	BCF	_PIR1bits, 3
;	.line	123; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	if(SSPCON1bits.SSPOV)
	BTFSS	_SSPCON1bits, 6
	BRA	_00264_DS_
;	.line	124; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPCON1bits.SSPOV = 0;
	BCF	_SSPCON1bits, 6
_00264_DS_:
	;	VOLATILE READ - BEGIN
	MOVF	_SSPBUF, W
	;	VOLATILE READ - END
;	.line	126; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPBUF = c;
	MOVFF	r0x00, _SSPBUF
_00265_DS_:
;	.line	127; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	while(!SSPSTATbits.BF);
	BTFSS	_SSPSTATbits, 0
	BRA	_00265_DS_
;	.line	128; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	c = SSPBUF;
	MOVFF	_SSPBUF, r0x00
;	.line	129; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	return c;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__SPI_setClockDivider	code
_SPI_setClockDivider:
;	.line	106; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	void SPI_setClockDivider(u8 clock)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, _this_clock
;	.line	109; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	this_role = this_clock;
	MOVFF	_this_clock, _this_role
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__SPI_setDataMode	code
_SPI_setDataMode:
;	.line	94; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	void SPI_setDataMode(u8 mode)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, _this_mode
;	.line	96; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	this_mode = mode;
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__SPI_setBitOrder	code
_SPI_setBitOrder:
;	.line	86; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	bitOrder = 0;
	RETURN	

; ; Starting pCode block
S_main__SPI_init	code
_SPI_init:
;	.line	42; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPCON1bits.SSPEN = 0;
	BCF	_SSPCON1bits, 5
	BANKSEL	_this_mode
;	.line	44; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	switch(this_mode)
	MOVF	_this_mode, W, B
	BZ	_00213_DS_
_00232_DS_:
	BANKSEL	_this_mode
	MOVF	_this_mode, W, B
	XORLW	0x04
	BZ	_00214_DS_
_00234_DS_:
	BANKSEL	_this_mode
	MOVF	_this_mode, W, B
	XORLW	0x08
	BZ	_00215_DS_
_00236_DS_:
	BANKSEL	_this_mode
	MOVF	_this_mode, W, B
	XORLW	0x0c
	BZ	_00216_DS_
	BRA	_00217_DS_
_00213_DS_:
;	.line	47; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPCON1bits.CKP = 0;
	BCF	_SSPCON1bits, 4
;	.line	48; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPSTATbits.CKE = 1;
	BSF	_SSPSTATbits, 6
;	.line	49; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	break;
	BRA	_00217_DS_
_00214_DS_:
;	.line	51; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPCON1bits.CKP = 0;
	BCF	_SSPCON1bits, 4
;	.line	52; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPSTATbits.CKE = 0;
	BCF	_SSPSTATbits, 6
;	.line	53; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	break;
	BRA	_00217_DS_
_00215_DS_:
;	.line	55; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPCON1bits.CKP = 1;
	BSF	_SSPCON1bits, 4
;	.line	56; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPSTATbits.CKE = 1;
	BSF	_SSPSTATbits, 6
;	.line	57; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	break;
	BRA	_00217_DS_
_00216_DS_:
;	.line	59; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPCON1bits.CKP = 1;
	BSF	_SSPCON1bits, 4
;	.line	60; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPSTATbits.CKE = 0;
	BCF	_SSPSTATbits, 6
_00217_DS_:
;	.line	64; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPCON1 = (SSPCON1 & 0xF7) | this_mode;
	MOVLW	0xf7
	ANDWF	_SSPCON1, W
; #	MOVWF	r0x00
; #	MOVF	_this_mode, W, B
; #	IORWF	r0x00, W
	BANKSEL	_this_mode
	IORWF	_this_mode, W, B
	MOVWF	_SSPCON1
;	.line	66; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	if (this_clock <= SPI_CLOCK_TIMER2)
	MOVLW	0x04
	BANKSEL	_this_clock
	SUBWF	_this_clock, W, B
	BC	_00219_DS_
;	.line	67; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	pinmode(SCK, OUTPUT);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00220_DS_
_00219_DS_:
;	.line	69; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	pinmode(SCK, INPUT);
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVLW	0x04
	ADDWF	FSR1L, F
_00220_DS_:
;	.line	71; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	pinmode(SDI, INPUT);
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_pinmode
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	72; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	pinmode(SDO, OUTPUT);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x09
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	_this_role
;	.line	73; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	if (this_role == SPI_SLAVE_SS)
	MOVF	_this_role, W, B
	XORLW	0x04
	BNZ	_00222_DS_
;	.line	74; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	pinmode(SS, INPUT);
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x11
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVLW	0x04
	ADDWF	FSR1L, F
_00222_DS_:
;	.line	76; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/spi.c	SSPCON1bits.SSPEN = 1;
	BSF	_SSPCON1bits, 5
	RETURN	

; ; Starting pCode block
S_main__toggle	code
_toggle:
;	.line	93; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	void toggle(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	96; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	val = digitalread(pin);
	CLRF	r0x01
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalread
	MOVWF	r0x02
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	97; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	digitalwrite(pin, val^1);
	MOVLW	0x01
	XORWF	r0x02, F
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__pinmode	code
_pinmode:
;	.line	69; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	void pinmode(int input, int state)
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
;	.line	71; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	switch (port[input])
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
	BRA	_00196_DS_
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x04, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00203_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00203_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00203_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00203_DS_:
	GOTO	_00183_DS_
	GOTO	_00187_DS_
	GOTO	_00191_DS_
_00183_DS_:
;	.line	73; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	case 0: if (state) TRISB=TRISB | mask[input];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00185_DS_
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
	BRA	_00196_DS_
_00185_DS_:
;	.line	74; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	else TRISB=TRISB & (255-mask[input]);
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
;	.line	75; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	break;
	BRA	_00196_DS_
_00187_DS_:
;	.line	76; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	case 1: if (state) TRISC=TRISC | mask[input];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00189_DS_
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
	BRA	_00196_DS_
_00189_DS_:
;	.line	77; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	else TRISC=TRISC & (255-mask[input]);
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
;	.line	78; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	break;
	BRA	_00196_DS_
_00191_DS_:
;	.line	79; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	case 2: if (state) TRISA=TRISA | mask[input];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00193_DS_
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
	BRA	_00196_DS_
_00193_DS_:
;	.line	80; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	else TRISA=TRISA & (255-mask[input]);
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
_00196_DS_:
;	.line	90; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	}
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
;	.line	44; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	int digitalread(int input)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	46; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	switch (port[input])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_port)
	ADDWFC	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	BTFSC	r0x01, 7
	SETF	r0x04
	MOVLW	UPPER(_port)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVLW	0x03
	SUBWF	r0x02, W
	BTFSC	STATUS, 0
	BRA	_00170_DS_
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	CLRF	r0x06
	RLCF	r0x02, W
	RLCF	r0x06, F
	RLCF	WREG, W
	RLCF	r0x06, F
	ANDLW	0xfc
	MOVWF	r0x05
	MOVLW	UPPER(_00178_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00178_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00178_DS_)
	ADDWF	r0x05, F
	MOVF	r0x06, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x05, W
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVWF	PCL
_00178_DS_:
	GOTO	_00158_DS_
	GOTO	_00162_DS_
	GOTO	_00166_DS_
_00158_DS_:
;	.line	48; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	case 0: if ((PORTB & mask[input])!=0) return (1);
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
	MOVF	_PORTB, W
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00160_DS_
	CLRF	PRODL
	MOVLW	0x01
	BRA	_00171_DS_
_00160_DS_:
;	.line	49; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	else return (0);
	CLRF	PRODL
	CLRF	WREG
	BRA	_00171_DS_
_00162_DS_:
;	.line	51; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	case 1: if ((PORTC & mask[input])!=0) return (1);
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
	MOVF	_PORTC, W
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00164_DS_
	CLRF	PRODL
	MOVLW	0x01
	BRA	_00171_DS_
_00164_DS_:
;	.line	52; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	else return (0);
	CLRF	PRODL
	CLRF	WREG
	BRA	_00171_DS_
_00166_DS_:
;	.line	54; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	case 2: if ((PORTA & mask[input])!=0) return (1);
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
	MOVF	_PORTA, W
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00168_DS_
	CLRF	PRODL
	MOVLW	0x01
	BRA	_00171_DS_
_00168_DS_:
;	.line	55; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	else return (0);
	CLRF	PRODL
	CLRF	WREG
	BRA	_00171_DS_
_00170_DS_:
;	.line	66; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	return (0);
	CLRF	PRODL
	CLRF	WREG
_00171_DS_:
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
;	.line	20; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	void digitalwrite(int output,int state)
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
;	.line	22; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	switch (port[output])
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
;	.line	24; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	case 0: if (state) PORTB=PORTB | mask[output]; 
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
;	.line	25; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	else PORTB=PORTB & (255-mask[output]);
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
;	.line	26; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	break;
	BRA	_00146_DS_
_00137_DS_:
;	.line	27; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	case 1: if (state) PORTC=PORTC | mask[output];
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
;	.line	28; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	else PORTC=PORTC & (255-mask[output]);
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
;	.line	29; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	break;
	BRA	_00146_DS_
_00141_DS_:
;	.line	30; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	case 2: if (state) PORTA=PORTA | mask[output];
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
;	.line	31; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	else PORTA=PORTA & (255-mask[output]);
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
;	.line	41; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/digitalw.c	}
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
;	.line	16; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/delay.c	void Delayus(int microsecondes)
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
;	.line	20; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/delay.c	for (i=0;i<microsecondes;i++);
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
;	.line	9; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/delay.c	void Delayms(unsigned long milliseconde)
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
;	.line	13; /home/regis/Hobbies/Electronique/Projets/Pinguino/local/branches/x.2/tools/p8/share/sdcc/include/pic16/delay.c	for (i=0;i<milliseconde;i++) delay10ktcy(1);
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
; ; Starting pCode block for Ival
_slaveSelectPin:
	DB	0x11, 0x00


; Statistics:
; code size:	 2690 (0x0a82) bytes ( 2.05%)
;           	 1345 (0x0541) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    9 (0x0009) bytes


	end
