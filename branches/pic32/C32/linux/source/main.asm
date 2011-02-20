;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Aug  9 2009) (UNIX)
; This file was generated Sun Feb 20 17:09:35 2011
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f2550

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _preloadL
	global _preloadH
	global _intCountLimit
	global _intCount
	global _intUsed
	global __millis
	global _rx
	global _wpointer
	global _rpointer
	global _Delayms
	global _Delayus
	global _detachInterrupt
	global _int_init
	global _int_start
	global _int_stop
	global _userhighinterrupt
	global _userinterrupt
	global _millis_init
	global _Millis
	global _printf
	global _sprintf
	global _serial_begin
	global _serial_available
	global _serial_putchar
	global _serial_interrupt
	global _serial_read
	global _serial_flush
	global _serial_getkey
	global _serial_printf
	global _serial_write
	global _epap_in
	global _epap_out
	global _epapin_init
	global _epapout_init
	global _setup
	global _loop
	global _micros
	global _pinguino_main
	global _high_priority_isr
	global _low_priority_isr

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget3
	extern __gptrput1
	extern __gptrput3
	extern __gptrget1
	extern __gptrget2
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
	extern __moduint
	extern __divuint
	extern __mulint
	extern __mullong
	extern __divulong
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
INTCON	equ	0xff2
WREG	equ	0xfe8
BSR	equ	0xfe0
TOSL	equ	0xffd
TOSH	equ	0xffe
TOSU	equ	0xfff
TBLPTRL	equ	0xff6
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
INDF0	equ	0xfef
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW1	equ	0xfe3
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


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
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1
r0x16	res	1
r0x17	res	1
r0x18	res	1
r0x19	res	1
r0x1a	res	1

udata_main_0	udata
_intFunction	res	60

udata_main_1	udata
_intCount	res	8

udata_main_2	udata
_intCountLimit	res	8

udata_main_3	udata
_preloadH	res	4

udata_main_4	udata
_preloadL	res	4

udata_main_5	udata
_putchar	res	3

udata_main_6	udata
_intUsed	res	20

udata_main_7	udata
__millis	res	4

udata_main_8	udata
_printi_print_buf_1_1	res	12

udata_main_9	udata
_print_scr_1_1	res	2

udata_main_10	udata
_sprintf_out_1_1	res	3

udata_main_11	udata
_wpointer	res	1

udata_main_12	udata
_rpointer	res	1

udata_main_13	udata
_rx	res	128

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__high_priority_isr	code	0X002020
_high_priority_isr:
;	.line	121; /home/mandon/c32 linux/source/main.c	void high_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
;	.line	157; /home/mandon/c32 linux/source/main.c	if (PIR1bits.RCIF) 
	MOVFF	PCLATU, POSTDEC1
; #	MOVFF	FSR1L, FSR2L
; #	BTFSS	_PIR1bits, 5
; #	GOTO	_00582_DS_
; #	CALL	_serial_interrupt
; #	BTFSS	_INTCONbits, 2
;	.line	158; /home/mandon/c32 linux/source/main.c	serial_interrupt();
	BTFSC	_PIR1bits, 5
;	.line	162; /home/mandon/c32 linux/source/main.c	if (INTCONbits.TMR0IF)
	CALL	_serial_interrupt
	BTFSS	_INTCONbits, 2
	BRA	_00585_DS_
;	.line	164; /home/mandon/c32 linux/source/main.c	INTCONbits.TMR0IF=0;
	BCF	_INTCONbits, 2
;	.line	165; /home/mandon/c32 linux/source/main.c	TMR0H=0xE8;
	MOVLW	0xe8
	MOVWF	_TMR0H
;	.line	166; /home/mandon/c32 linux/source/main.c	TMR0L=0x50;
	MOVLW	0x50
	MOVWF	_TMR0L
	BANKSEL	__millis
;	.line	167; /home/mandon/c32 linux/source/main.c	_millis++;
	INCF	__millis, F, B
	BNC	_10590_DS_
; removed redundant BANKSEL
	INCF	(__millis + 1), F, B
_10590_DS_:
	BNC	_20591_DS_
	BANKSEL	(__millis + 2)
	INCF	(__millis + 2), F, B
_20591_DS_:
	BNC	_30592_DS_
	BANKSEL	(__millis + 3)
	INCF	(__millis + 3), F, B
_30592_DS_:
_00585_DS_:
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
;	.line	181; /home/mandon/c32 linux/source/main.c	void low_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	184; /home/mandon/c32 linux/source/main.c	userinterrupt();
	CALL	_userinterrupt
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
;	.line	54; /home/mandon/c32 linux/source/main.c	PIE1 = 0;
	CLRF	_PIE1
;	.line	55; /home/mandon/c32 linux/source/main.c	PIE2 = 0;
	CLRF	_PIE2
;	.line	56; /home/mandon/c32 linux/source/main.c	ADCON1 = 0b00001111;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	59; /home/mandon/c32 linux/source/main.c	int_init();							// Disable all interrupts
	CALL	_int_init
;	.line	60; /home/mandon/c32 linux/source/main.c	RCONbits.IPEN = 1;					// Enable HP/LP interrupts
	BSF	_RCONbits, 7
;	.line	61; /home/mandon/c32 linux/source/main.c	INTCONbits.GIEH = 1;				// Enable HP interrupts
	BSF	_INTCONbits, 7
;	.line	62; /home/mandon/c32 linux/source/main.c	INTCONbits.GIEL = 1;				// Enable LP interrupts
	BSF	_INTCONbits, 6
;	.line	71; /home/mandon/c32 linux/source/main.c	setup();
	CALL	_setup
;	.line	78; /home/mandon/c32 linux/source/main.c	millis_init();
	CALL	_millis_init
;	.line	100; /home/mandon/c32 linux/source/main.c	INTCONbits.PEIE = 1;
	BSF	_INTCONbits, 6
;	.line	101; /home/mandon/c32 linux/source/main.c	INTCONbits.GIE  = 1;
	BSF	_INTCONbits, 7
;	.line	105; /home/mandon/c32 linux/source/main.c	INTCONbits.TMR0IE= 1;
	BSF	_INTCONbits, 5
;	.line	106; /home/mandon/c32 linux/source/main.c	INTCONbits.GIE  = 1;
	BSF	_INTCONbits, 7
_00574_DS_:
;	.line	115; /home/mandon/c32 linux/source/main.c	loop();
	CALL	_loop
	BRA	_00574_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	11; /home/mandon/c32 linux/source/user.c	void loop()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	13; /home/mandon/c32 linux/source/user.c	serial_printf("micros= %d/n/r",micros());
	CALL	_micros
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	14; /home/mandon/c32 linux/source/user.c	serial_printf("Millis= %d\n\r",Millis());
	CALL	_Millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	15; /home/mandon/c32 linux/source/user.c	Delayms(5);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	8; /home/mandon/c32 linux/source/user.c	serial_begin(9600);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x25
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	CALL	_serial_begin
	MOVLW	0x04
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	42; /home/mandon/c32 linux/source/main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	41; /home/mandon/c32 linux/source/main.c	void epapin_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	40; /home/mandon/c32 linux/source/main.c	void epap_out() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	39; /home/mandon/c32 linux/source/main.c	void epap_in() { return; }
	RETURN	

; ; Starting pCode block
S_main__serial_write	code
_serial_write:
;	.line	150; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_write(char *fmt,...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x08
	SUBWF	FSR1L, F
	BTFSS	STATUS, 0
	DECF	FSR1H, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	156; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	va_start(ap,fmt);
	MOVLW	0x02
	ADDWF	FSR2L, W
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	FSR2H, W
	MOVWF	r0x01
	MOVLW	0x03
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
; #	MOVF	r0x01, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
; #	MOVF	r0x00, W
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
;	.line	157; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	s=va_start(ap,fmt);
	MOVLW	0x80
;	.line	158; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	switch (*s)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	CALL	__gptrget1
	MOVWF	r0x00
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00530_DS_
	MOVLW	0x06
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00530_DS_
	DECF	r0x00, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x00, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00538_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00538_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00538_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00538_DS_:
	GOTO	_00525_DS_
	GOTO	_00527_DS_
	GOTO	_00526_DS_
	GOTO	_00528_DS_
	GOTO	_00529_DS_
_00525_DS_:
;	.line	160; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case DEC:       serial_printf("%d",(int)fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVF	r0x07, W
	MOVWF	r0x00
	MOVF	r0x08, W
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	161; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;
	BRA	_00532_DS_
_00526_DS_:
;	.line	162; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case HEX: 		serial_printf("%x",(int)fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVF	r0x07, W
	MOVWF	r0x00
	MOVF	r0x08, W
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	163; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;
	BRA	_00532_DS_
_00527_DS_:
;	.line	164; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case BYTE: 		serial_printf("%d",(unsigned char)fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	165; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;
	BRA	_00532_DS_
_00528_DS_:
;	.line	166; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case OCTAL:     uitoa((int)fmt,chaine,8);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVF	r0x07, W
	MOVWF	r0x00
	MOVF	r0x08, W
	MOVWF	r0x01
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVLW	0xf9
	ADDWF	FSR2L, W
	MOVWF	r0x02
	MOVLW	0xff
	ADDWFC	FSR2H, W
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
	MOVWF	r0x03
	MOVWF	r0x05
	MOVF	r0x02, W
	MOVWF	r0x04
	CLRF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_uitoa
	MOVLW	0x07
	ADDWF	FSR1L, F
; #	MOVF	r0x03, W
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
; #	MOVF	r0x02, W
; #	MOVF	r0x02, W
; #	MOVWF	r0x02
;	.line	167; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	serial_printf(chaine);
	MOVLW	0x80
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	168; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;
	BRA	_00532_DS_
_00529_DS_:
;	.line	169; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case BIN:       uitoa((int)fmt,chaine,2);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVF	r0x07, W
	MOVWF	r0x00
	MOVF	r0x08, W
	MOVWF	r0x01
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVLW	0xf9
	ADDWF	FSR2L, W
	MOVWF	r0x02
	MOVLW	0xff
	ADDWFC	FSR2H, W
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
	MOVWF	r0x03
	MOVWF	r0x05
	MOVF	r0x02, W
	MOVWF	r0x04
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_uitoa
	MOVLW	0x07
	ADDWF	FSR1L, F
; #	MOVF	r0x03, W
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
; #	MOVF	r0x02, W
; #	MOVF	r0x02, W
; #	MOVWF	r0x02
;	.line	170; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	serial_printf(chaine);
	MOVLW	0x80
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	171; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;           
	BRA	_00532_DS_
_00530_DS_:
;	.line	172; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	default:	serial_printf(fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	CALL	_serial_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
_00532_DS_:
;	.line	175; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	va_end(ap);
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVWF	POSTINC1
	MOVLW	0x07
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	COMF	WREG, F
	MOVF	PLUSW1, W
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__serial_printf	code
_serial_printf:
;	.line	136; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_printf(char *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	140; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	va_start(args, fmt);
	MOVLW	0x02
	ADDWF	FSR2L, W
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	FSR2H, W
	MOVWF	r0x01
	MOVLW	0x03
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
; #	MOVF	r0x01, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
; #	MOVF	r0x00, W
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
;	.line	141; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	printf(serial_putchar, fmt, args);
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVFF	PLUSW2, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, POSTDEC1
	MOVLW	UPPER(_serial_putchar)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_serial_putchar)
	MOVWF	POSTDEC1
	MOVLW	LOW(_serial_putchar)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	142; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	va_end(args);
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__serial_getkey	code
_serial_getkey:
;	.line	126; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	unsigned char serial_getkey()
	MOVFF	r0x00, POSTDEC1
_00512_DS_:
;	.line	129; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	while (!(serial_available()));
	CALL	_serial_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00512_DS_
;	.line	130; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	c = serial_read();
	CALL	_serial_read
	MOVWF	r0x00
;	.line	131; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	serial_flush();
	CALL	_serial_flush
;	.line	132; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	return (c);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_flush	code
_serial_flush:
; #	MOVLW	0x01
; #	MOVWF	_wpointer, B
; #	MOVLW	0x01
;	.line	120; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	wpointer=1;
	MOVLW	0x01
	BANKSEL	_wpointer
;	.line	121; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	rpointer=1;
	MOVWF	_wpointer, B
	BANKSEL	_rpointer
	MOVWF	_rpointer, B
	RETURN	

; ; Starting pCode block
S_main__serial_read	code
_serial_read:
;	.line	104; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	unsigned char serial_read()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	106; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	unsigned char caractere=0;
	CLRF	r0x00
;	.line	108; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (serial_available())
	CALL	_serial_available
	MOVWF	r0x01
	MOVF	r0x01, W
	BZ	_00496_DS_
;	.line	110; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	caractere=rx[rpointer++];
	MOVFF	_rpointer, r0x01
	BANKSEL	_rpointer
	INCF	_rpointer, F, B
	CLRF	r0x02
	MOVLW	LOW(_rx)
	ADDWF	r0x01, F
	MOVLW	HIGH(_rx)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
; removed redundant BANKSEL
;	.line	111; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (rpointer==RXBUFFERLENGTH)
	MOVF	_rpointer, W, B
	XORLW	0x80
	BNZ	_00496_DS_
;	.line	112; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	rpointer=1;
	MOVLW	0x01
	BANKSEL	_rpointer
	MOVWF	_rpointer, B
_00496_DS_:
;	.line	114; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	return(caractere);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_interrupt	code
_serial_interrupt:
;	.line	84; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_interrupt(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	89; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	PIR1bits.RCIF=0;				// clear RX interrupt flag
	BCF	_PIR1bits, 5
;	.line	90; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	caractere=RCREG;				// take received char
	MOVFF	_RCREG, r0x00
	BANKSEL	_wpointer
;	.line	91; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (wpointer!=RXBUFFERLENGTH-1)	// if not last place in buffer
	MOVF	_wpointer, W, B
	XORLW	0x7f
	BZ	_00472_DS_
_00484_DS_:
	BANKSEL	_wpointer
;	.line	92; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	newwp=wpointer+1;			// place=place+1
	INCF	_wpointer, W, B
	MOVWF	r0x01
	BRA	_00473_DS_
_00472_DS_:
;	.line	94; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	newwp=1;					// else place=1
	MOVLW	0x01
	MOVWF	r0x01
_00473_DS_:
	BANKSEL	_rpointer
;	.line	96; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (rpointer!=newwp)			// if read pointer!=write pointer
	MOVF	_rpointer, W, B
	XORWF	r0x01, W
	BZ	_00475_DS_
;	.line	97; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	rx[wpointer++]=caractere;	// store received char
	MOVFF	_wpointer, r0x01
	BANKSEL	_wpointer
	INCF	_wpointer, F, B
	CLRF	r0x02
	MOVLW	LOW(_rx)
	ADDWF	r0x01, F
	MOVLW	HIGH(_rx)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x00, INDF0
_00475_DS_:
	BANKSEL	_wpointer
;	.line	99; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (wpointer==RXBUFFERLENGTH)	// if write pointer=length buffer
	MOVF	_wpointer, W, B
	XORLW	0x80
	BNZ	_00478_DS_
;	.line	100; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	wpointer=1;					// write pointer = 1
	MOVLW	0x01
	BANKSEL	_wpointer
	MOVWF	_wpointer, B
_00478_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_putchar	code
_serial_putchar:
;	.line	77; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_putchar(unsigned char caractere)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
_00463_DS_:
;	.line	79; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	while (!TXSTAbits.TRMT);
	BTFSS	_TXSTAbits, 1
	BRA	_00463_DS_
;	.line	80; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	TXREG=caractere;		        // yes, send char
	MOVFF	r0x00, _TXREG
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__serial_available	code
_serial_available:
;	.line	71; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	unsigned char serial_available()
	MOVFF	r0x00, POSTDEC1
;	.line	73; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	return(wpointer!=rpointer);
	CLRF	r0x00
	BANKSEL	_wpointer
	MOVF	_wpointer, W, B
	BANKSEL	_rpointer
	XORWF	_rpointer, W, B
	BNZ	_00458_DS_
	INCF	r0x00, F
_00458_DS_:
	MOVF	r0x00, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_begin	code
_serial_begin:
;	.line	47; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_begin(unsigned long baudrate)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	52; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	spbrg=(48000000/(4*baudrate))-1;
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0xdc
	MOVWF	POSTDEC1
	MOVLW	0x6c
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
;	.line	53; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	highbyte=spbrg/256;
	MOVF	r0x01, W
;	.line	54; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	lowbyte=spbrg%256;
	MOVWF	r0x04
;	.line	55; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	TXSTAbits.BRGH=1;               	  	// set BRGH bit
	BSF	_TXSTAbits, 2
;	.line	56; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	BAUDCONbits.BRG16=1;					// set 16 bits SPBRG
	BSF	_BAUDCONbits, 3
;	.line	57; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	SPBRGH=highbyte;                        // set UART speed SPBRGH
	MOVFF	r0x04, _SPBRGH
;	.line	58; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	SPBRG=lowbyte;   						// set UART speed SPBRGL
	MOVFF	r0x00, _SPBRG
;	.line	59; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	RCSTA=0x90;                             // set RCEN and SPEN
	MOVLW	0x90
	MOVWF	_RCSTA
;	.line	60; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	BAUDCONbits.RCIDL=1;			// set receive active
	BSF	_BAUDCONbits, 6
;	.line	61; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	PIE1bits.RCIE=1;                        // enable interrupt on RX
	BSF	_PIE1bits, 5
;	.line	62; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	INTCONbits.PEIE=1;                      // enable peripheral interrupts
	BSF	_INTCONbits, 6
;	.line	63; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	IPR1bits.RCIP=1;                        // define high priority for RX interrupt
	BSF	_IPR1bits, 5
; #	MOVLW	0x01
; #	MOVWF	_wpointer, B
; #	MOVLW	0x01
;	.line	64; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	wpointer=1;                             // initialize write pointer
	MOVLW	0x01
	BANKSEL	_wpointer
;	.line	65; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	rpointer=1;                             // initialize read pointer
	MOVWF	_wpointer, B
	BANKSEL	_rpointer
	MOVWF	_rpointer, B
;	.line	66; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	TXSTAbits.TXEN=1;                       // enable TX
	BSF	_TXSTAbits, 5
;	.line	67; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	INTCONbits.GIE=1;
	BSF	_INTCONbits, 7
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__uitoa	code
_uitoa:
;	.line	263; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	static void uitoa(unsigned int num, char * bf, unsigned int base)
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
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
;	.line	266; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	unsigned int d=1;
	MOVLW	0x01
	MOVWF	r0x07
	CLRF	r0x08
_00421_DS_:
;	.line	268; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	while (num/d >= base)
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x06, W
	SUBWF	r0x0a, W
	BNZ	_00443_DS_
	MOVF	r0x05, W
	SUBWF	r0x09, W
_00443_DS_:
	BNC	_00440_DS_
;	.line	269; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	d*=base;		
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00421_DS_
_00440_DS_:
;	.line	271; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	while (d!=0)
	CLRF	r0x09
	CLRF	r0x0a
_00428_DS_:
	MOVF	r0x07, W
	IORWF	r0x08, W
	BTFSC	STATUS, 2
	BRA	_00430_DS_
;	.line	273; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int dgt = num / d;
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	274; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	num%= d;
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__moduint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	275; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	d/=base;
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	276; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (n || dgt>0 || d==0)
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BNZ	_00424_DS_
	MOVF	r0x0c, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00444_DS_
	MOVLW	0x01
	SUBWF	r0x0b, W
_00444_DS_:
	BC	_00424_DS_
	MOVF	r0x07, W
	IORWF	r0x08, W
	BTFSS	STATUS, 2
	BRA	_00428_DS_
_00424_DS_:
;	.line	278; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	*bf++ = dgt+(dgt<10 ? '0' : 'A'-10);
	MOVFF	r0x02, r0x0d
	MOVFF	r0x03, r0x0e
	MOVFF	r0x04, r0x0f
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	MOVF	r0x0b, W
	MOVWF	r0x10
	MOVF	r0x0c, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00445_DS_
	MOVLW	0x0a
	SUBWF	r0x0b, W
_00445_DS_:
	BC	_00433_DS_
	MOVLW	0x30
	MOVWF	r0x0b
	BRA	_00434_DS_
_00433_DS_:
	MOVLW	0x37
	MOVWF	r0x0b
_00434_DS_:
	MOVF	r0x0b, W
	ADDWF	r0x10, F
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x0d, FSR0L
	MOVFF	r0x0e, PRODL
	MOVF	r0x0f, W
	CALL	__gptrput1
;	.line	279; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++n;
	INCF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
	BRA	_00428_DS_
_00430_DS_:
;	.line	282; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	*bf=0;
	CLRF	POSTDEC1
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrput1
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
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

; ; Starting pCode block
S_main__sprintf	code
_sprintf:
;	.line	255; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int sprintf(char *out, const char *format, va_list args)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, _sprintf_out_1_1
	MOVLW	0x03
	MOVFF	PLUSW2, (_sprintf_out_1_1 + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (_sprintf_out_1_1 + 2)
	MOVLW	0x05
	MOVFF	PLUSW2, r0x00
	MOVLW	0x06
	MOVFF	PLUSW2, r0x01
	MOVLW	0x07
	MOVFF	PLUSW2, r0x02
	MOVLW	0x08
	MOVFF	PLUSW2, r0x03
	MOVLW	0x09
	MOVFF	PLUSW2, r0x04
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x05
;	.line	260; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return print(&out, format, args);
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_sprintf_out_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_sprintf_out_1_1)
	MOVWF	POSTDEC1
	CALL	_print
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x09
	ADDWF	FSR1L, F
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__printf	code
_printf:
;	.line	245; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int printf(stdout func, const char *format, va_list args)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, _putchar
	MOVLW	0x03
	MOVFF	PLUSW2, (_putchar + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (_putchar + 2)
	MOVLW	0x05
	MOVFF	PLUSW2, r0x00
	MOVLW	0x06
	MOVFF	PLUSW2, r0x01
	MOVLW	0x07
	MOVFF	PLUSW2, r0x02
	MOVLW	0x08
	MOVFF	PLUSW2, r0x03
	MOVLW	0x09
	MOVFF	PLUSW2, r0x04
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x05
;	.line	251; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return print(0, format, args);
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_print
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x09
	ADDWF	FSR1L, F
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__print	code
_print:
;	.line	141; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	static int print(char **out, const char *format, va_list args )
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
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
;	.line	144; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int pc = 0;
	CLRF	r0x09
	CLRF	r0x0a
_00339_DS_:
;	.line	148; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for (; *format != 0; ++format)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVF	r0x0b, W
	BTFSC	STATUS, 2
	GOTO	_00342_DS_
;	.line	150; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (*format == '%')
	MOVF	r0x0b, W
	XORLW	0x25
	BZ	_00379_DS_
	GOTO	_00335_DS_
_00379_DS_:
;	.line	152; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++format;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
;	.line	153; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	width = pad = 0;
	CLRF	r0x0b
	CLRF	r0x0c
	CLRF	r0x0d
	CLRF	r0x0e
;	.line	154; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (*format == '\0') break;
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0f
	MOVF	r0x0f, W
	BTFSC	STATUS, 2
	GOTO	_00342_DS_
;	.line	155; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (*format == '%') goto out;
	MOVF	r0x0f, W
	XORLW	0x25
	BNZ	_00381_DS_
	GOTO	_00335_DS_
_00381_DS_:
;	.line	156; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (*format == '-')
	MOVF	r0x0f, W
	XORLW	0x2d
	BNZ	_00360_DS_
;	.line	158; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++format;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
;	.line	159; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pad = PAD_RIGHT;
	MOVLW	0x01
	MOVWF	r0x0b
	CLRF	r0x0c
_00360_DS_:
;	.line	161; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	while (*format == '0')
	MOVFF	r0x03, r0x0f
	MOVFF	r0x04, r0x10
	MOVFF	r0x05, r0x11
_00314_DS_:
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	XORLW	0x30
	BNZ	_00346_DS_
;	.line	163; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++format;
	INCF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
;	.line	164; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pad |= PAD_ZERO;
	BSF	r0x0b, 1
	BRA	_00314_DS_
_00346_DS_:
;	.line	166; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	MOVWF	r0x12
	ADDLW	0x80
	ADDLW	0x50
	BNC	_00377_DS_
	MOVF	r0x12, W
	ADDLW	0x80
	ADDLW	0x46
	BC	_00377_DS_
;	.line	168; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	width *= 10;
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x0d
	MOVFF	PRODL, r0x0e
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	169; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	width += *format - '0';
	CLRF	r0x13
	BTFSC	r0x12, 7
	SETF	r0x13
	MOVLW	0xd0
	ADDWF	r0x12, F
	BTFSS	STATUS, 0
	DECF	r0x13, F
	MOVF	r0x12, W
	ADDWF	r0x0d, F
	MOVF	r0x13, W
	ADDWFC	r0x0e, F
;	.line	166; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	INCF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BRA	_00346_DS_
_00377_DS_:
	MOVFF	r0x0f, r0x03
	MOVFF	r0x10, r0x04
	MOVFF	r0x11, r0x05
;	.line	171; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 's' )
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x0f
; #	MOVF	r0x0f, W
	MOVWF	r0x0f
	XORLW	0x73
	BZ	_00390_DS_
	BRA	_00318_DS_
_00390_DS_:
;	.line	174; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	char *s = va_arg(args, char*);
	MOVF	r0x06, W
	ADDLW	0x03
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x12
	MOVFF	r0x10, r0x06
	MOVFF	r0x11, r0x07
	MOVFF	r0x12, r0x08
	MOVLW	0xfd
	ADDWF	r0x10, F
	MOVLW	0xff
	ADDWFC	r0x11, F
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget3
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVFF	PRODH, r0x12
;	.line	176; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += prints (out, s?s:"(null)", width, pad);
	IORWF	r0x11, W
; #	IORWF	r0x12, W
; #	BTFSC	STATUS, 2
; #	GOTO	_00352_DS_
; #	GOTO	_00353_DS_
; #	MOVLW	LOW(__str_0)
	IORWF	r0x12, W
	BNZ	_00353_DS_
	MOVLW	LOW(__str_0)
	MOVWF	r0x10
	MOVLW	HIGH(__str_0)
	MOVWF	r0x11
	MOVLW	UPPER(__str_0)
	MOVWF	r0x12
_00353_DS_:
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_prints
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	177; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	GOTO	_00341_DS_
_00318_DS_:
;	.line	179; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'd' )
	MOVF	r0x0f, W
	XORLW	0x64
	BZ	_00392_DS_
	BRA	_00320_DS_
_00392_DS_:
;	.line	181; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 10, 1, width, pad, 'a');
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x12
	MOVFF	r0x10, r0x06
	MOVFF	r0x11, r0x07
	MOVFF	r0x12, r0x08
	MOVLW	0xfe
	ADDWF	r0x10, F
	MOVLW	0xff
	ADDWFC	r0x11, F
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget2
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	CLRF	POSTDEC1
	MOVLW	0x61
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printi
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	182; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00341_DS_
_00320_DS_:
;	.line	184; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'x' )
	MOVF	r0x0f, W
	XORLW	0x78
	BZ	_00394_DS_
	BRA	_00322_DS_
_00394_DS_:
;	.line	186; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 16, 0, width, pad, 'a');
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x12
	MOVFF	r0x10, r0x06
	MOVFF	r0x11, r0x07
	MOVFF	r0x12, r0x08
	MOVLW	0xfe
	ADDWF	r0x10, F
	MOVLW	0xff
	ADDWFC	r0x11, F
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget2
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	CLRF	POSTDEC1
	MOVLW	0x61
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printi
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	187; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00341_DS_
_00322_DS_:
;	.line	189; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'X' )
	MOVF	r0x0f, W
	XORLW	0x58
	BZ	_00396_DS_
	BRA	_00324_DS_
_00396_DS_:
;	.line	191; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 16, 0, width, pad, 'A');
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x12
	MOVFF	r0x10, r0x06
	MOVFF	r0x11, r0x07
	MOVFF	r0x12, r0x08
	MOVLW	0xfe
	ADDWF	r0x10, F
	MOVLW	0xff
	ADDWFC	r0x11, F
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget2
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	CLRF	POSTDEC1
	MOVLW	0x41
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printi
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	192; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00341_DS_
_00324_DS_:
;	.line	194; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'b' )
	MOVF	r0x0f, W
	XORLW	0x62
	BZ	_00398_DS_
	BRA	_00326_DS_
_00398_DS_:
;	.line	196; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 2, 0, width, pad, 'a');
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x12
	MOVFF	r0x10, r0x06
	MOVFF	r0x11, r0x07
	MOVFF	r0x12, r0x08
	MOVLW	0xfe
	ADDWF	r0x10, F
	MOVLW	0xff
	ADDWFC	r0x11, F
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget2
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	CLRF	POSTDEC1
	MOVLW	0x61
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printi
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	197; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00341_DS_
_00326_DS_:
;	.line	199; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'o' )
	MOVF	r0x0f, W
	XORLW	0x6f
	BZ	_00400_DS_
	BRA	_00328_DS_
_00400_DS_:
;	.line	201; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 8, 0, width, pad, 'a');
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x12
	MOVFF	r0x10, r0x06
	MOVFF	r0x11, r0x07
	MOVFF	r0x12, r0x08
	MOVLW	0xfe
	ADDWF	r0x10, F
	MOVLW	0xff
	ADDWFC	r0x11, F
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget2
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	CLRF	POSTDEC1
	MOVLW	0x61
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printi
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	202; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00341_DS_
_00328_DS_:
;	.line	204; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'u' )
	MOVF	r0x0f, W
	XORLW	0x75
	BZ	_00402_DS_
	BRA	_00330_DS_
_00402_DS_:
;	.line	206; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 10, 0, width, pad, 'a');
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x12
	MOVFF	r0x10, r0x06
	MOVFF	r0x11, r0x07
	MOVFF	r0x12, r0x08
	MOVLW	0xfe
	ADDWF	r0x10, F
	MOVLW	0xff
	ADDWFC	r0x11, F
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget2
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	CLRF	POSTDEC1
	MOVLW	0x61
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printi
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	207; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00341_DS_
_00330_DS_:
;	.line	209; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'c' )
	MOVF	r0x0f, W
	XORLW	0x63
	BZ	_00404_DS_
	BRA	_00332_DS_
_00404_DS_:
;	.line	212; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	scr[0] = (char)va_arg( args, int);
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x12
	MOVFF	r0x10, r0x06
	MOVFF	r0x11, r0x07
	MOVFF	r0x12, r0x08
	MOVLW	0xfe
	ADDWF	r0x10, F
	MOVLW	0xff
	ADDWFC	r0x11, F
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget2
	BANKSEL	_print_scr_1_1
	MOVWF	_print_scr_1_1, B
; removed redundant BANKSEL
;	.line	214; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	scr[1] = '\0';
	CLRF	(_print_scr_1_1 + 1), B
;	.line	215; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += prints (out, scr, width, pad);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_print_scr_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_print_scr_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_prints
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	216; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00341_DS_
_00332_DS_:
;	.line	218; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'f' )
	MOVF	r0x0f, W
	XORLW	0x66
	BNZ	_00341_DS_
;	.line	220; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += prints (out, "not yet implemented\0", width, pad);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_prints
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x0b, W
	ADDWF	r0x09, F
	MOVF	r0x0c, W
	ADDWFC	r0x0a, F
;	.line	221; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00341_DS_
_00335_DS_:
;	.line	227; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, *format);
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
; #	MOVWF	r0x0b
; #	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	228; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	INCF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
_00341_DS_:
;	.line	148; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for (; *format != 0; ++format)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	GOTO	_00339_DS_
_00342_DS_:
;	.line	231; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (out) **out = '\0';
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00344_DS_
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	CLRF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00344_DS_:
;	.line	233; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return pc;
	MOVFF	r0x0a, PRODL
	MOVF	r0x09, W
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
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

; ; Starting pCode block
S_main__printi	code
_printi:
;	.line	92; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
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
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x16, POSTDEC1
	MOVFF	r0x17, POSTDEC1
	MOVFF	r0x18, POSTDEC1
	MOVFF	r0x19, POSTDEC1
	MOVFF	r0x1a, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x0a
	MOVLW	0x0d
	MOVFF	PLUSW2, r0x0b
	MOVLW	0x0e
	MOVFF	PLUSW2, r0x0c
	MOVLW	0x0f
	MOVFF	PLUSW2, r0x0d
	MOVLW	0x10
	MOVFF	PLUSW2, r0x0e
;	.line	96; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int t, neg = 0, pc = 0;
	CLRF	r0x0f
	CLRF	r0x10
	CLRF	r0x11
	CLRF	r0x12
;	.line	97; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	unsigned int u = i;
	MOVFF	r0x03, r0x13
	MOVFF	r0x04, r0x14
;	.line	99; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (i == 0)
	MOVF	r0x03, W
	IORWF	r0x04, W
	BNZ	_00270_DS_
;	.line	101; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	print_buf[0] = '0';
	MOVLW	0x30
	BANKSEL	_printi_print_buf_1_1
	MOVWF	_printi_print_buf_1_1, B
; removed redundant BANKSEL
;	.line	102; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	print_buf[1] = '\0';
	CLRF	(_printi_print_buf_1_1 + 1), B
;	.line	103; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return prints (out, print_buf, width, pad);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_printi_print_buf_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_printi_print_buf_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_prints
	MOVWF	r0x15
	MOVFF	PRODL, r0x16
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVFF	r0x16, PRODL
	MOVF	r0x15, W
	BRA	_00286_DS_
_00270_DS_:
;	.line	106; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (sg && b == 10 && i < 0)
	MOVF	r0x07, W
	IORWF	r0x08, W
	BZ	_00272_DS_
	MOVF	r0x05, W
	XORLW	0x0a
	BNZ	_00299_DS_
	MOVF	r0x06, W
	BZ	_00300_DS_
_00299_DS_:
	BRA	_00272_DS_
_00300_DS_:
	BSF	STATUS, 0
	BTFSS	r0x04, 7
	BCF	STATUS, 0
	BNC	_00272_DS_
;	.line	108; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	neg = 1;
	MOVLW	0x01
	MOVWF	r0x0f
	CLRF	r0x10
;	.line	109; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	u = -i;
	COMF	r0x04, W
	MOVWF	r0x14
	COMF	r0x03, W
	MOVWF	r0x13
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00272_DS_:
;	.line	112; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	s = print_buf + PRINT_BUF_LEN-1;
	MOVLW	HIGH(_printi_print_buf_1_1 + 11)
	MOVWF	r0x04
	MOVLW	LOW(_printi_print_buf_1_1 + 11)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x07
;	.line	113; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	*s = '\0';
	CLRF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	CALL	__gptrput1
;	.line	115; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	while (u)
	MOVF	r0x0d, W
	ADDLW	0xc6
	MOVWF	r0x0d
	MOVFF	r0x05, r0x0e
	MOVFF	r0x06, r0x15
	MOVFF	r0x03, r0x16
	MOVFF	r0x04, r0x17
	MOVFF	r0x07, r0x18
_00277_DS_:
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00298_DS_
;	.line	117; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	t = u % b;
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	CALL	__moduint
	MOVWF	r0x19
	MOVFF	PRODL, r0x1a
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	118; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( t >= 10 )
	MOVF	r0x1a, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00302_DS_
	MOVLW	0x0a
	SUBWF	r0x19, W
_00302_DS_:
	BNC	_00276_DS_
;	.line	119; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	t += letbase - '0' - 10;
	MOVF	r0x0d, W
	ADDWF	r0x19, F
_00276_DS_:
;	.line	120; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	*--s = t + '0';
	MOVLW	0xff
	ADDWF	r0x16, F
	ADDWFC	r0x17, F
	ADDWFC	r0x18, F
	MOVLW	0x30
	ADDWF	r0x19, F
	MOVFF	r0x19, POSTDEC1
	MOVFF	r0x16, FSR0L
	MOVFF	r0x17, PRODL
	MOVF	r0x18, W
	CALL	__gptrput1
;	.line	121; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	u /= b;
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00277_DS_
_00298_DS_:
	MOVFF	r0x16, r0x03
	MOVFF	r0x17, r0x04
	MOVFF	r0x18, r0x07
;	.line	124; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (neg)
	MOVF	r0x0f, W
	IORWF	r0x10, W
	BZ	_00285_DS_
;	.line	126; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( width && (pad & PAD_ZERO) )
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BZ	_00281_DS_
	BTFSS	r0x0b, 1
	BRA	_00281_DS_
;	.line	128; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, '-');
	MOVLW	0x2d
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	129; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	MOVLW	0x01
	MOVWF	r0x11
	CLRF	r0x12
;	.line	130; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	--width;
	MOVLW	0xff
	ADDWF	r0x09, F
	BTFSS	STATUS, 0
	DECF	r0x0a, F
	BRA	_00285_DS_
_00281_DS_:
;	.line	134; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	*--s = '-';
	MOVLW	0xff
	ADDWF	r0x03, F
	ADDWFC	r0x04, F
	ADDWFC	r0x07, F
	MOVLW	0x2d
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
_00285_DS_:
;	.line	138; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return pc + prints (out, s, width, pad);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_prints
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	ADDWF	r0x11, F
	MOVF	r0x01, W
	ADDWFC	r0x12, F
	MOVFF	r0x12, PRODL
	MOVF	r0x11, W
_00286_DS_:
	MOVFF	PREINC1, r0x1a
	MOVFF	PREINC1, r0x19
	MOVFF	PREINC1, r0x18
	MOVFF	PREINC1, r0x17
	MOVFF	PREINC1, r0x16
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
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

; ; Starting pCode block
S_main__prints	code
_prints:
;	.line	53; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	static int prints(char **out, const char *string, int width, int pad)
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
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
;	.line	55; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int pc = 0;
	CLRF	r0x0a
	CLRF	r0x0b
;	.line	56; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int padchar = ' ';
	MOVLW	0x20
	MOVWF	r0x0c
;	.line	60; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (width > 0)
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00259_DS_
	MOVLW	0x01
	SUBWF	r0x06, W
_00259_DS_:
	BNC	_00223_DS_
;	.line	62; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for (ptr = string; *ptr; ++ptr) ++len;
	CLRF	r0x0e
	CLRF	r0x0f
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
_00226_DS_:
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x13
	MOVF	r0x13, W
	BZ	_00229_DS_
	INCF	r0x0e, F
	BTFSC	STATUS, 0
	INCF	r0x0f, F
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	BRA	_00226_DS_
_00229_DS_:
;	.line	63; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (len >= width) width = 0;
	MOVF	r0x0f, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x07, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00260_DS_
	MOVF	r0x06, W
	SUBWF	r0x0e, W
_00260_DS_:
	BNC	_00218_DS_
	CLRF	r0x06
	CLRF	r0x07
	BRA	_00219_DS_
_00218_DS_:
;	.line	64; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	else width -= len;
	MOVF	r0x0e, W
	SUBWF	r0x06, F
	MOVF	r0x0f, W
	SUBWFB	r0x07, F
_00219_DS_:
;	.line	65; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (pad & PAD_ZERO) padchar = '0';
	BTFSS	r0x08, 1
	BRA	_00223_DS_
	MOVLW	0x30
	MOVWF	r0x0c
_00223_DS_:
;	.line	67; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (!(pad & PAD_RIGHT))
	BTFSC	r0x08, 0
	BRA	_00252_DS_
	CLRF	r0x08
	CLRF	r0x09
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
_00230_DS_:
;	.line	69; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; width > 0; --width)
	MOVF	r0x0f, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00263_DS_
	MOVLW	0x01
	SUBWF	r0x0e, W
_00263_DS_:
	BNC	_00256_DS_
; #	MOVF	r0x0c, W
; #	MOVWF	r0x10
; #	MOVF	r0x10, W
;	.line	71; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, padchar);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	72; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	69; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; width > 0; --width)
	MOVLW	0xff
	ADDWF	r0x0e, F
	BTFSS	STATUS, 0
	DECF	r0x0f, F
	BRA	_00230_DS_
_00256_DS_:
	MOVFF	r0x08, r0x0a
	MOVFF	r0x09, r0x0b
	MOVFF	r0x0e, r0x06
	MOVFF	r0x0f, r0x07
_00252_DS_:
	MOVFF	r0x0a, r0x08
	MOVFF	r0x0b, r0x09
_00234_DS_:
;	.line	75; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; *string ; ++string)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0a
	MOVF	r0x0a, W
	BZ	_00254_DS_
;	.line	77; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, *string);
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	78; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	75; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; *string ; ++string)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BRA	_00234_DS_
_00254_DS_:
	MOVFF	r0x08, r0x03
	MOVFF	r0x09, r0x04
	MOVFF	r0x06, r0x05
	MOVFF	r0x07, r0x06
_00238_DS_:
;	.line	80; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; width > 0; --width)
	MOVF	r0x06, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00264_DS_
	MOVLW	0x01
	SUBWF	r0x05, W
_00264_DS_:
	BNC	_00241_DS_
; #	MOVF	r0x0c, W
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
;	.line	82; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, padchar);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_printchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	83; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
;	.line	80; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; width > 0; --width)
	MOVLW	0xff
	ADDWF	r0x05, F
	BTFSS	STATUS, 0
	DECF	r0x06, F
	BRA	_00238_DS_
_00241_DS_:
;	.line	86; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return pc;
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
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

; ; Starting pCode block
S_main__printchar	code
_printchar:
;	.line	34; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	static void printchar(char **str, char c)
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
;	.line	38; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (str)
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00207_DS_
;	.line	40; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	**str = c;
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	41; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++(*str);
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
	BRA	_00209_DS_
_00207_DS_:
;	.line	46; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	putchar(c);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00212_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00212_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00212_DS_)
	MOVWF	TOSU
	MOVF	PREINC1, W
	MOVWF	INTCON
	MOVFF	(_putchar + 2), PCLATU
	MOVFF	(_putchar + 1), PCLATH
	BANKSEL	_putchar
	MOVF	_putchar, W, B
	MOVWF	PCL
_00212_DS_:
	MOVLW	0x01
	ADDWF	FSR1L, F
_00209_DS_:
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
S_main__Millis	code
_Millis:
;	.line	24; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/millis.c	return(_millis);
	MOVFF	(__millis + 3), FSR0L
	MOVFF	(__millis + 2), PRODH
	MOVFF	(__millis + 1), PRODL
	BANKSEL	__millis
	MOVF	__millis, W, B
	RETURN	

; ; Starting pCode block
S_main__millis_init	code
_millis_init:
;	.line	16; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/millis.c	intUsed[INT_TMR0] = INT_USED;
	MOVLW	0x01
	BANKSEL	_intUsed
	MOVWF	_intUsed, B
;	.line	17; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/millis.c	T0CON = 0x80;		// TMR0 on, 16 bits counter, prescaler=2
	MOVLW	0x80
	MOVWF	_T0CON
;	.line	18; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/millis.c	INTCON |= 0xA0;		// set GIE and TMR0IE
	MOVLW	0xa0
	IORWF	_INTCON, F
	BANKSEL	__millis
;	.line	19; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/millis.c	_millis = 0;
	CLRF	__millis, B
; removed redundant BANKSEL
	CLRF	(__millis + 1), B
; removed redundant BANKSEL
	CLRF	(__millis + 2), B
; removed redundant BANKSEL
	CLRF	(__millis + 3), B
	RETURN	

; ; Starting pCode block
S_main__userinterrupt	code
_userinterrupt:
;	.line	1130; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	int_start();
	CALL	_int_start
	RETURN	

; ; Starting pCode block
S_main__userhighinterrupt	code
_userhighinterrupt:
;	.line	956; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__int_stop	code
_int_stop:
;	.line	346; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__int_start	code
_int_start:
;	.line	320; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__int_init	code
_int_init:
;	.line	284; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	void int_init()
	MOVFF	r0x00, POSTDEC1
;	.line	288; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	RCONbits.IPEN = 1;					// Enable HP/LP interrupts
	BSF	_RCONbits, 7
;	.line	289; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.GIEH = 1;				// Enable HP interrupts
	BSF	_INTCONbits, 7
;	.line	290; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.GIEL = 1;				// Enable LP interrupts
	BSF	_INTCONbits, 6
;	.line	292; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	for (i = 0; i < INT_NUM; i++)		// Disable all interrupts
	CLRF	r0x00
_00162_DS_:
	MOVLW	0x14
	SUBWF	r0x00, W
	BC	_00166_DS_
;	.line	293; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	detachInterrupt(i);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_detachInterrupt
	INCF	FSR1L, F
;	.line	292; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	for (i = 0; i < INT_NUM; i++)		// Disable all interrupts
	INCF	r0x00, F
	BRA	_00162_DS_
_00166_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__detachInterrupt	code
_detachInterrupt:
;	.line	206; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	void detachInterrupt(u8 inter)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	208; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	intUsed[inter] = INT_NOT_USED;	// This interrupt is no longer used
	MOVLW	LOW(_intUsed)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_intUsed)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	CLRF	INDF0
;	.line	210; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	switch(inter)
	MOVLW	0x13
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00153_DS_
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	CLRF	r0x04
	RLCF	r0x00, W
	RLCF	r0x04, F
	RLCF	WREG, W
	RLCF	r0x04, F
	ANDLW	0xfc
	MOVWF	r0x03
	MOVLW	UPPER(_00157_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00157_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00157_DS_)
	ADDWF	r0x03, F
	MOVF	r0x04, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVWF	PCL
_00157_DS_:
	GOTO	_00136_DS_
	GOTO	_00137_DS_
	GOTO	_00138_DS_
	GOTO	_00139_DS_
	GOTO	_00133_DS_
	GOTO	_00134_DS_
	GOTO	_00135_DS_
	GOTO	_00140_DS_
	GOTO	_00145_DS_
	GOTO	_00146_DS_
	GOTO	_00148_DS_
	GOTO	_00143_DS_
	GOTO	_00144_DS_
	GOTO	_00142_DS_
	GOTO	_00147_DS_
	GOTO	_00149_DS_
	GOTO	_00151_DS_
	GOTO	_00150_DS_
	GOTO	_00141_DS_
_00133_DS_:
;	.line	213; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.INT0IE = INT_DISABLE;
	BCF	_INTCONbits, 4
;	.line	214; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00134_DS_:
;	.line	216; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	INTCON3bits.INT1IE = INT_DISABLE;
	BCF	_INTCON3bits, 3
;	.line	217; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00135_DS_:
;	.line	219; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	INTCON3bits.INT2IE = INT_DISABLE;
	BCF	_INTCON3bits, 4
;	.line	220; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00136_DS_:
;	.line	222; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.TMR0IE = INT_DISABLE;
	BCF	_INTCONbits, 5
;	.line	223; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00137_DS_:
;	.line	225; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.TMR1IE = INT_DISABLE;
	BCF	_PIE1bits, 0
;	.line	226; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00138_DS_:
;	.line	228; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.TMR2IE = INT_DISABLE;
	BCF	_PIE1bits, 1
;	.line	229; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00139_DS_:
;	.line	231; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.TMR3IE = INT_DISABLE;
	BCF	_PIE2bits, 1
;	.line	232; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00140_DS_:
;	.line	234; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.RBIE = INT_DISABLE;
	BCF	_INTCONbits, 3
;	.line	235; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00141_DS_:
;	.line	237; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.USBIE = INT_DISABLE;
	BCF	_PIE2bits, 5
;	.line	238; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00142_DS_:
;	.line	240; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.ADIE = INT_DISABLE;
	BCF	_PIE1bits, 6
;	.line	241; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00143_DS_:
;	.line	243; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.RCIE = INT_DISABLE;
	BCF	_PIE1bits, 5
;	.line	244; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00144_DS_:
;	.line	246; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.TXIE = INT_DISABLE;
	BCF	_PIE1bits, 4
;	.line	247; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00145_DS_:
;	.line	249; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.CCP1IE = INT_DISABLE;
	BCF	_PIE1bits, 2
;	.line	250; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00146_DS_:
;	.line	252; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.CCP2IE = INT_DISABLE;
	BCF	_PIE2bits, 0
;	.line	253; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00147_DS_:
;	.line	255; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.OSCFIE = INT_DISABLE;
	BCF	_PIE2bits, 7
;	.line	256; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00148_DS_:
;	.line	258; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.CMIE = INT_DISABLE;
	BCF	_PIE2bits, 6
;	.line	259; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00149_DS_:
;	.line	261; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.EEIE = INT_DISABLE;
	BCF	_PIE2bits, 4
;	.line	262; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00150_DS_:
;	.line	264; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.BCLIE = INT_DISABLE;
	BCF	_PIE2bits, 3
;	.line	265; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00151_DS_:
;	.line	267; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.HLVDIE = INT_DISABLE;
	BCF	_PIE2bits, 2
_00153_DS_:
;	.line	274; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/interrupt.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayus	code
_Delayus:
;	.line	16; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/arduinodelay.c	void Delayus(int microsecondes)
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
;	.line	20; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/arduinodelay.c	for (i=0;i<microsecondes;i++);
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
;	.line	9; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/arduinodelay.c	void Delayms(unsigned long milliseconde)
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
;	.line	13; /home/mandon/c32 linux/tools/bin/../share/sdcc/include/pic16/arduinodelay.c	for (i=0;i<milliseconde;i++) delay10ktcy(1);
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

; ; Starting pCode block
__str_0:
	DB	0x28, 0x6e, 0x75, 0x6c, 0x6c, 0x29, 0x00
; ; Starting pCode block
__str_1:
	DB	0x6e, 0x6f, 0x74, 0x20, 0x79, 0x65, 0x74, 0x20, 0x69, 0x6d, 0x70, 0x6c
	DB	0x65, 0x6d, 0x65, 0x6e, 0x74, 0x65, 0x64, 0x00, 0x00
; ; Starting pCode block
__str_2:
	DB	0x25, 0x64, 0x00
; ; Starting pCode block
__str_3:
	DB	0x25, 0x78, 0x00
; ; Starting pCode block
__str_4:
	DB	0x6d, 0x69, 0x63, 0x72, 0x6f, 0x73, 0x3d, 0x20, 0x25, 0x64, 0x2f, 0x6e
	DB	0x2f, 0x72, 0x00
; ; Starting pCode block
__str_5:
	DB	0x4d, 0x69, 0x6c, 0x6c, 0x69, 0x73, 0x3d, 0x20, 0x25, 0x64, 0x0a, 0x0d
	DB	0x00


; Statistics:
; code size:	 6708 (0x1a34) bytes ( 5.12%)
;           	 3354 (0x0d1a) words
; udata size:	  258 (0x0102) bytes (14.40%)
; access size:	   27 (0x001b) bytes


	end
