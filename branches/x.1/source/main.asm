;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Aug  9 2009) (UNIX)
; This file was generated Thu Apr  7 14:46:22 2011
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f2550

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _I2C_master
	global _I2C_slave
	global _I2C_init
	global _I2C_send
	global _I2C_get
	global _I2C_writechar
	global _I2C_readchar
	global _I2C_interrupt
	global _lcdi2c_backlight
	global _lcdi2c_noBacklight
	global _lcdi2c_clear
	global _lcdi2c_home
	global _lcdi2c_noAutoscroll
	global _lcdi2c_autoscroll
	global _lcdi2c_rightToLeft
	global _lcdi2c_leftToRight
	global _lcdi2c_scrollDisplayRight
	global _lcdi2c_scrollDisplayLeft
	global _lcdi2c_blink
	global _lcdi2c_noBlink
	global _lcdi2c_cursor
	global _lcdi2c_noCursor
	global _lcdi2c_display
	global _lcdi2c_noDisplay
	global _lcdi2c_setCursor
	global _lcdi2c_clearLine
	global _lcdi2c_write
	global _lcdi2c_printf
	global _lcdi2c_newchar
	global _lcdi2c_newpattern
	global _lcdi2c_init
	global _intUsed
	global _intCount
	global _intCountLimit
	global _preloadH
	global _preloadL
	global _numcolmax
	global _numlinemax
	global _Backlight
	global _PCF8574_address
	global _PCF8574_data
	global _s
	global _m
	global _h
	global _Delayms
	global _Delayus
	global _detachInterrupt
	global _int_init
	global _int_start
	global _int_stop
	global _OnTimer0
	global _userhighinterrupt
	global _userinterrupt
	global _I2C_OnRequest
	global _IC2_OnReceive
	global _pprintf
	global _psprintf
	global _epap_in
	global _epap_out
	global _epapin_init
	global _epapout_init
	global _tick
	global _setup
	global _loop
	global _pinguino_main
	global _high_priority_isr
	global _low_priority_isr
	global _car0
	global _car1
	global _car2
	global _car3
	global _car4
	global _car5
	global _car6
	global _car7
	global _car8
	global _car9
	global _car10
	global _car11
	global _car12

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
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_Backlight	db	0x00
_s	db	0x00
_m	db	0x00
_h	db	0x00


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
__i2c_onRequest_function	res	3

udata_main_1	udata
__i2c_onReceive_function	res	3

udata_main_2	udata
_pputchar	res	3

udata_main_3	udata
_intUsed	res	20

udata_main_4	udata
_intCount	res	8

udata_main_5	udata
_intCountLimit	res	8

udata_main_6	udata
_preloadH	res	4

udata_main_7	udata
_preloadL	res	4

udata_main_8	udata
_intFunction	res	60

udata_main_9	udata
_pprinti_print_buf_1_1	res	12

udata_main_10	udata
_pprint_scr_1_1	res	2

udata_main_11	udata
_psprintf_out_1_1	res	3

udata_main_12	udata
_PCF8574_data	res	1

udata_main_13	udata
_PCF8574_address	res	1

udata_main_14	udata
_lcdi2c_setCursor_row_offsets_1_1	res	8

udata_main_15	udata
_numlinemax	res	1

udata_main_16	udata
_numcolmax	res	1

udata_main_17	udata
_setup_newcar_1_1	res	8

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__high_priority_isr	code	0X002020
_high_priority_isr:
;	.line	121; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	void high_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	172; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	I2C_interrupt();
	CALL	_I2C_interrupt
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
;	.line	185; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	void low_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	188; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	userinterrupt();
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
;	.line	53; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	PIE1 = 0;
	CLRF	_PIE1
;	.line	54; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	PIE2 = 0;
	CLRF	_PIE2
;	.line	55; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	ADCON1 = 0b00001111;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	58; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	int_init();							// Disable all interrupts
	CALL	_int_init
;	.line	67; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	setup();
	CALL	_setup
;	.line	70; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	int_start();							// Enable all timers interrupts
	CALL	_int_start
_00817_DS_:
;	.line	115; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	loop();
	CALL	_loop
	BRA	_00817_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	138; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	}
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	108; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	const u8 newcar[8]={
	MOVLW	0x04
	BANKSEL	_setup_newcar_1_1
	MOVWF	_setup_newcar_1_1, B
	MOVLW	0x08
; removed redundant BANKSEL
	MOVWF	(_setup_newcar_1_1 + 1), B
	MOVLW	0x0e
; removed redundant BANKSEL
	MOVWF	(_setup_newcar_1_1 + 2), B
	MOVLW	0x11
; removed redundant BANKSEL
	MOVWF	(_setup_newcar_1_1 + 3), B
	MOVLW	0x1f
; removed redundant BANKSEL
	MOVWF	(_setup_newcar_1_1 + 4), B
	MOVLW	0x10
; removed redundant BANKSEL
	MOVWF	(_setup_newcar_1_1 + 5), B
	MOVLW	0x0e
; removed redundant BANKSEL
	MOVWF	(_setup_newcar_1_1 + 6), B
; removed redundant BANKSEL
	CLRF	(_setup_newcar_1_1 + 7), B
;	.line	118; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_newchar(newcar, 0);		// newcar is assigned to ascii 0
	CLRF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_setup_newcar_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_setup_newcar_1_1)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_newchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	120; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_init(16, 2, 0b01001110);// display is 2x16, ic2 address is 01001110 (see above)
	MOVLW	0x4e
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_lcdi2c_init
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	121; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_backlight();				// turns backlight on
	CALL	_lcdi2c_backlight
;	.line	122; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_clear();					// clear screen
	CALL	_lcdi2c_clear
;	.line	123; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_home();						// set cursor at (0,0)
	CALL	_lcdi2c_home
;	.line	124; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_printf("   lcdi2c demo  ");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	125; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_setCursor(0, 1);			// set cursor at line 1, col 0
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_lcdi2c_setCursor
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	126; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_printf(" Regis Blanchot ");
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	128; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_setCursor(2, 1);			// set cursor at line 1, col 2
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_lcdi2c_setCursor
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	129; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_write(0);					// replace 'e' by 'é'
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_lcdi2c_write
	INCF	FSR1L, F
;	.line	130; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	Delayms(5000);						// wait for 2 sec.
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x13
	MOVWF	POSTDEC1
	MOVLW	0x88
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	131; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_clearLine(0);				// clear first line
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_lcdi2c_clearLine
	INCF	FSR1L, F
;	.line	133; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	OnTimer0(tick, INT_MILLISEC, 1000);
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	UPPER(_tick)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_tick)
	MOVWF	POSTDEC1
	MOVLW	LOW(_tick)
	MOVWF	POSTDEC1
	CALL	_OnTimer0
	MOVLW	0x06
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__tick	code
_tick:
;	.line	80; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	void tick()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	BANKSEL	_s
;	.line	82; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	s++;
	INCF	_s, F, B
;	.line	84; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	if (s > 59)
	MOVLW	0x3c
; removed redundant BANKSEL
	SUBWF	_s, W, B
	BNC	_00789_DS_
; removed redundant BANKSEL
;	.line	86; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	s = 0;
	CLRF	_s, B
	BANKSEL	_m
;	.line	87; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	m++;
	INCF	_m, F, B
_00789_DS_:
;	.line	90; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	if (m > 59)
	MOVLW	0x3c
	BANKSEL	_m
	SUBWF	_m, W, B
	BNC	_00791_DS_
; removed redundant BANKSEL
;	.line	92; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	m = 0;
	CLRF	_m, B
	BANKSEL	_h
;	.line	93; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	h++;
	INCF	_h, F, B
_00791_DS_:
;	.line	96; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	if (h > 23)
	MOVLW	0x18
; #	SUBWF	_h, W, B
; #	BTFSS	STATUS, 0
; #	GOTO	_00793_DS_
; #	CLRF	_h, B
; #	MOVLW	0x00
	BANKSEL	_h
;	.line	98; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	h = 0;
	SUBWF	_h, W, B
;	.line	101; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_setCursor(4, 0); // col, line
	BNC	_10829_DS_
; removed redundant BANKSEL
	CLRF	_h, B
_10829_DS_:
	CLRF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_lcdi2c_setCursor
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	102; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/user.c	lcdi2c_printf("%02u:%02u:%02u", h, m, s);
	MOVFF	_s, r0x00
	MOVFF	_m, r0x02
	MOVFF	_h, r0x04
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_printf
	MOVLW	0x09
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	41; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	40; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	void epapin_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	39; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	void epap_out() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	38; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/source/main.c	void epap_in() { return; }
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_init	code
_lcdi2c_init:
;	.line	546; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	void lcdi2c_init(u8 numcol, u8 numline, u8 i2c_address)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	548; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	numcolmax  = numcol - 1;
	DECF	r0x00, W
	BANKSEL	_numcolmax
	MOVWF	_numcolmax, B
;	.line	549; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	numlinemax = numline - 1;
	DECF	r0x01, W
	BANKSEL	_numlinemax
	MOVWF	_numlinemax, B
;	.line	550; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	PCF8574_address = 0b01001110 | i2c_address;
	MOVLW	0x4e
	IORWF	r0x02, W
	BANKSEL	_PCF8574_address
	MOVWF	_PCF8574_address, B
	BANKSEL	_PCF8574_data
;	.line	551; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	PCF8574_data.val = 0;
	CLRF	_PCF8574_data, B
;	.line	553; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	I2C_init(I2C_MASTER_MODE, I2C_SLEW_OFF);
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_I2C_init
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	556; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send4(0x30, LCD_CMD);			// 0x30 - Mode 8 bits
	CLRF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send4
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	558; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send4(0x30, LCD_CMD);			// 0x30 - Mode 8 bits
	CLRF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send4
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	560; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send4(0x30, LCD_CMD);			// 0x30 - Mode 8 bits
	CLRF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send4
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	562; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send4(0x20, LCD_CMD);			// 0x20 - Mode 4 bits
	CLRF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send4
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	563; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_SYSTEM_SET_4BITS, LCD_CMD); 	// 0x28 - Mode 4 bits - 2 Lignes - 5x8
	CLRF	POSTDEC1
	MOVLW	0x28
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	565; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_DISPLAY_ON, LCD_CMD);		// 0x0C - Display ON + Cursor OFF + Blinking OFF
	CLRF	POSTDEC1
	MOVLW	0x0c
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	567; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_DISPLAY_CLEAR, LCD_CMD);    	// 0x01 - Efface l'affichage + init. DDRAM
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	568; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	Delayms(2);					// le temps d'execution de Display Clear > 1.64ms
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	569; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_ENTRY_MODE_SET, LCD_CMD);   	// 0x06 - Increment + Display not shifted (Déplacement automatique du curseur)
	CLRF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	571; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_newpattern();				// Implante les nouveaux caracteres
	CALL	_lcdi2c_newpattern
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_newpattern	code
_lcdi2c_newpattern:
;	.line	516; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_newchar(car0,  ACIRC);			// â
	CLRF	POSTDEC1
	MOVLW	UPPER(_car0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_car0)
	MOVWF	POSTDEC1
	MOVLW	LOW(_car0)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_newchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	517; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_newchar(car1,  AGRAVE);		// à
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	UPPER(_car1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_car1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_car1)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_newchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	519; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_newchar(car2,  CCEDIL);		// ç
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	UPPER(_car2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_car2)
	MOVWF	POSTDEC1
	MOVLW	LOW(_car2)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_newchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	521; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_newchar(car3,  EACUTE);		// é
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	UPPER(_car3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_car3)
	MOVWF	POSTDEC1
	MOVLW	LOW(_car3)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_newchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	522; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_newchar(car4,  EGRAVE);		// è
	MOVWF	POSTDEC1
	MOVLW	UPPER(_car4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_car4)
	MOVWF	POSTDEC1
	MOVLW	LOW(_car4)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_newchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	523; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_newchar(car5,  ECIRC);			// ê
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVLW	UPPER(_car5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_car5)
	MOVWF	POSTDEC1
	MOVLW	LOW(_car5)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_newchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	524; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_newchar(car6,  ETREMA);		// ë
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVLW	UPPER(_car6)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_car6)
	MOVWF	POSTDEC1
	MOVLW	LOW(_car6)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_newchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	525; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_newchar(car7,  EURO);			// €
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	UPPER(_car7)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_car7)
	MOVWF	POSTDEC1
	MOVLW	LOW(_car7)
	MOVWF	POSTDEC1
	CALL	_lcdi2c_newchar
	MOVLW	0x04
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_newchar	code
_lcdi2c_newchar:
;	.line	496; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	void lcdi2c_newchar(const u8 *c, u8 char_code)
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
;	.line	501; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	a = (char_code << 3) | LCD_ADRESS_CGRAM;
	SWAPF	r0x03, W
	RRNCF	WREG, W
	ANDLW	0xf8
	MOVWF	r0x04
	MOVLW	0x40
	IORWF	r0x04, W
	MOVWF	r0x03
;	.line	502; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	for(i=0; i<8; i++)
	CLRF	r0x04
_00743_DS_:
	MOVLW	0x08
	SUBWF	r0x04, W
	BC	_00747_DS_
;	.line	504; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(a, LCD_CMD);
	CLRF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	505; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(c[i], LCD_DATA);
	MOVF	r0x04, W
	ADDWF	r0x00, W
	MOVWF	r0x05
	CLRF	WREG
	ADDWFC	r0x01, W
	MOVWF	r0x06
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	CALL	__gptrget1
	MOVWF	r0x05
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	506; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	a++;
	INCF	r0x03, F
;	.line	502; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	for(i=0; i<8; i++)
	INCF	r0x04, F
	BRA	_00743_DS_
_00747_DS_:
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
S_main__lcdi2c_printf	code
_lcdi2c_printf:
;	.line	478; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	void lcdi2c_printf(u8 *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	482; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	va_start(args, fmt);
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
;	.line	483; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	pprintf(lcdi2c_write, fmt, args);
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(_lcdi2c_write)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_lcdi2c_write)
	MOVWF	POSTDEC1
	MOVLW	LOW(_lcdi2c_write)
	MOVWF	POSTDEC1
	CALL	_pprintf
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	484; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	va_end(args);
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_write	code
_lcdi2c_write:
;	.line	468; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	void lcdi2c_write(u8 c)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	470; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(c, LCD_DATA);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_clearLine	code
_lcdi2c_clearLine:
;	.line	453; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	void lcdi2c_clearLine(u8 line)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	457; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_setCursor(0, line);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_lcdi2c_setCursor
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	458; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	for (i = 0; i < numcolmax; i++)
	CLRF	r0x00
_00719_DS_:
	BANKSEL	_numcolmax
	MOVF	_numcolmax, W, B
	SUBWF	r0x00, W
	BC	_00723_DS_
;	.line	459; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_write(ESPACE);  // affiche des espaces
	MOVLW	0x20
	MOVWF	POSTDEC1
	CALL	_lcdi2c_write
	INCF	FSR1L, F
;	.line	458; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	for (i = 0; i < numcolmax; i++)
	INCF	r0x00, F
	BRA	_00719_DS_
_00723_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_setCursor	code
_lcdi2c_setCursor:
;	.line	438; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	void lcdi2c_setCursor(u8 col, u8 line)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	BANKSEL	_lcdi2c_setCursor_row_offsets_1_1
;	.line	440; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	int row_offsets[] = { 0x00, 0x40, 0x14, 0x54 };
	CLRF	_lcdi2c_setCursor_row_offsets_1_1, B
; removed redundant BANKSEL
	CLRF	(_lcdi2c_setCursor_row_offsets_1_1 + 1), B
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_lcdi2c_setCursor_row_offsets_1_1 + 2), B
; removed redundant BANKSEL
	CLRF	(_lcdi2c_setCursor_row_offsets_1_1 + 3), B
	MOVLW	0x14
; removed redundant BANKSEL
	MOVWF	(_lcdi2c_setCursor_row_offsets_1_1 + 4), B
; removed redundant BANKSEL
	CLRF	(_lcdi2c_setCursor_row_offsets_1_1 + 5), B
	MOVLW	0x54
; removed redundant BANKSEL
	MOVWF	(_lcdi2c_setCursor_row_offsets_1_1 + 6), B
; removed redundant BANKSEL
	CLRF	(_lcdi2c_setCursor_row_offsets_1_1 + 7), B
;	.line	442; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	if ( line > numlinemax )
	MOVF	r0x01, W
	BANKSEL	_numlinemax
	SUBWF	_numlinemax, W, B
	BC	_00706_DS_
; removed redundant BANKSEL
;	.line	443; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	line = numlinemax - 1;    // we count rows starting w/0
	DECF	_numlinemax, W, B
	MOVWF	r0x01
_00706_DS_:
;	.line	444; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	if ( col > numcolmax )
	MOVF	r0x00, W
	BANKSEL	_numcolmax
	SUBWF	_numcolmax, W, B
	BC	_00708_DS_
; removed redundant BANKSEL
;	.line	445; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	col = numcolmax - 1;    // we count rows starting w/0
	DECF	_numcolmax, W, B
	MOVWF	r0x00
; ;multiply lit val:0x02 by variable r0x01 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00708_DS_:
;	.line	446; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_SETDDRAMADDR | (col + row_offsets[line]), LCD_CMD);
	BCF	STATUS, 0
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lcdi2c_setCursor_row_offsets_1_1)
	ADDWF	r0x01, F
	MOVLW	HIGH(_lcdi2c_setCursor_row_offsets_1_1)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	POSTINC0, r0x01
	MOVFF	INDF0, r0x02
	MOVF	r0x01, W
	ADDWF	r0x00, F
	BSF	r0x00, 7
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_noDisplay	code
_lcdi2c_noDisplay:
;	.line	429; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_DISPLAYOFF, LCD_CMD);
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_display	code
_lcdi2c_display:
;	.line	420; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_DISPLAYON, LCD_CMD);
	CLRF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_noCursor	code
_lcdi2c_noCursor:
;	.line	411; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_CURSOROFF, LCD_CMD);
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_cursor	code
_lcdi2c_cursor:
;	.line	402; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_CURSORON, LCD_CMD);
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_noBlink	code
_lcdi2c_noBlink:
;	.line	393; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_BLINKOFF, LCD_CMD);
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_blink	code
_lcdi2c_blink:
;	.line	384; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_BLINKON, LCD_CMD);
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_scrollDisplayLeft	code
_lcdi2c_scrollDisplayLeft:
;	.line	375; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_CURSORSHIFT | LCD_DISPLAYMOVE | LCD_MOVELEFT, LCD_CMD);
	CLRF	POSTDEC1
	MOVLW	0x18
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_scrollDisplayRight	code
_lcdi2c_scrollDisplayRight:
;	.line	366; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_CURSORSHIFT | LCD_DISPLAYMOVE | LCD_MOVERIGHT, LCD_CMD);
	CLRF	POSTDEC1
	MOVLW	0x1c
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_leftToRight	code
_lcdi2c_leftToRight:
;	.line	357; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_ENTRYLEFT, LCD_CMD);
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_rightToLeft	code
_lcdi2c_rightToLeft:
;	.line	348; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_ENTRYRIGHT, LCD_CMD);
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_autoscroll	code
_lcdi2c_autoscroll:
;	.line	339; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_ENTRYSHIFTINCREMENT, LCD_CMD);
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_noAutoscroll	code
_lcdi2c_noAutoscroll:
;	.line	330; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_ENTRYSHIFTDECREMENT, LCD_CMD);
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_home	code
_lcdi2c_home:
;	.line	320; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_CURSOR_HOME, LCD_CMD);
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	321; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	Delayms(2);	// Wait for more than 1.64ms
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_clear	code
_lcdi2c_clear:
;	.line	310; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send8(LCD_DISPLAY_CLEAR, LCD_CMD);
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send8
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	311; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	Delayms(2);	// Wait for more than 1.64ms
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_noBacklight	code
_lcdi2c_noBacklight:
	BANKSEL	_Backlight
;	.line	299; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	Backlight = OFF;	// 1 = OFF since PCF8574 is logical inverted
	CLRF	_Backlight, B
	BANKSEL	_PCF8574_data
;	.line	300; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	LCD_BL = Backlight;
	BCF	_PCF8574_data, 0, B
;	.line	301; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	I2C_send(PCF8574_address, PCF8574_data.val);
	MOVF	_PCF8574_data, W, B
	MOVWF	POSTDEC1
	BANKSEL	_PCF8574_address
	MOVF	_PCF8574_address, W, B
	MOVWF	POSTDEC1
	CALL	_I2C_send
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_backlight	code
_lcdi2c_backlight:
;	.line	288; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	Backlight = ON;	// 0 = ON since PCF8574 is logical inverted
	MOVLW	0x01
	BANKSEL	_Backlight
	MOVWF	_Backlight, B
	BANKSEL	_PCF8574_data
;	.line	289; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	LCD_BL = Backlight;
	BSF	_PCF8574_data, 0, B
;	.line	290; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	I2C_send(PCF8574_address, PCF8574_data.val);
	MOVF	_PCF8574_data, W, B
	MOVWF	POSTDEC1
	BANKSEL	_PCF8574_address
	MOVF	_PCF8574_address, W, B
	MOVWF	POSTDEC1
	CALL	_I2C_send
	MOVLW	0x02
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_send8	code
_lcdi2c_send8:
;	.line	275; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	static void lcdi2c_send8(u8 octet, u8 mode)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	277; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send4(octet & LCD_MASK, mode);			// envoie les "Upper 4 bits"
	MOVLW	0xf0
	ANDWF	r0x00, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send4
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	278; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	lcdi2c_send4((octet << 4) & LCD_MASK, mode);	// envoie les "Lower 4 bits"
	SWAPF	r0x00, W
	ANDLW	0xf0
	MOVWF	r0x02
	MOVLW	0xf0
	ANDWF	r0x02, W
	MOVWF	r0x00
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_lcdi2c_send4
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	279; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	Delayus(46);			 // Wait for instruction excution time (more than 46us)
	CLRF	POSTDEC1
	MOVLW	0x2e
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__lcdi2c_send4	code
_lcdi2c_send4:
;	.line	243; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	static void lcdi2c_send4(u8 quartet, u8 mode)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	246; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	PCF8574_data.val = quartet;	// x  x  x  x  0  0  0    0
	MOVF	r0x00, W
	BANKSEL	_PCF8574_data
	MOVWF	_PCF8574_data, B
;	.line	247; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	LCD_EN = LOW;						// x  x  x  x  0  0  0    0
	BCF	_PCF8574_data, 3, B
;	.line	248; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	LCD_RW = LCD_WRITE;				// x  x  x  x  0  0  0    0
	BCF	_PCF8574_data, 2, B
;	.line	249; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	LCD_RS = mode;						// x  x  x  x  0  0  0/1  0
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	_PCF8574_data, W, B
	ANDLW	0xfd
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_PCF8574_data, B
	BANKSEL	_Backlight
;	.line	250; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	LCD_BL = Backlight;				// x  x  x  x  0  0  0/1  0/1
	MOVF	_Backlight, W, B
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_PCF8574_data
	MOVF	_PCF8574_data, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_PCF8574_data, B
;	.line	254; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	LCD_EN = HIGH;
	BSF	_PCF8574_data, 3, B
;	.line	255; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	I2C_send(PCF8574_address, PCF8574_data.val);
	MOVF	_PCF8574_data, W, B
	MOVWF	POSTDEC1
	BANKSEL	_PCF8574_address
	MOVF	_PCF8574_address, W, B
	MOVWF	POSTDEC1
	CALL	_I2C_send
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	_PCF8574_data
;	.line	258; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	LCD_EN = LOW;
	BCF	_PCF8574_data, 3, B
;	.line	259; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/lcdi2c.c	I2C_send(PCF8574_address, PCF8574_data.val);
	MOVF	_PCF8574_data, W, B
	MOVWF	POSTDEC1
	BANKSEL	_PCF8574_address
	MOVF	_PCF8574_address, W, B
	MOVWF	POSTDEC1
	CALL	_I2C_send
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__psprintf	code
_psprintf:
;	.line	248; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	int psprintf(char *out, const char *format, va_list args)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, _psprintf_out_1_1
	MOVLW	0x03
	MOVFF	PLUSW2, (_psprintf_out_1_1 + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (_psprintf_out_1_1 + 2)
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
;	.line	253; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	return pprint(&out, format, args);
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
	MOVLW	HIGH(_psprintf_out_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_psprintf_out_1_1)
	MOVWF	POSTDEC1
	CALL	_pprint
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
S_main__pprintf	code
_pprintf:
;	.line	238; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	int pprintf(stdout func, const char *format, va_list args)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, _pputchar
	MOVLW	0x03
	MOVFF	PLUSW2, (_pputchar + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (_pputchar + 2)
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
;	.line	244; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	return pprint(0, format, args);
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
	CALL	_pprint
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
S_main__pprint	code
_pprint:
;	.line	141; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	static int pprint(char **out, const char *format, va_list args)
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
;	.line	144; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	register int pc = 0;
	CLRF	r0x09
	CLRF	r0x0a
_00533_DS_:
;	.line	147; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for (; *format != 0; ++format)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVF	r0x0b, W
	BTFSC	STATUS, 2
	GOTO	_00536_DS_
;	.line	149; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == '%')
	MOVF	r0x0b, W
	XORLW	0x25
	BZ	_00573_DS_
	GOTO	_00529_DS_
_00573_DS_:
;	.line	151; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++format;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
;	.line	152; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	width = pad = 0;
	CLRF	r0x0b
	CLRF	r0x0c
	CLRF	r0x0d
	CLRF	r0x0e
;	.line	153; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == '\0')
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0f
	MOVF	r0x0f, W
	BTFSC	STATUS, 2
	GOTO	_00536_DS_
;	.line	155; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == '%')
	MOVF	r0x0f, W
	XORLW	0x25
	BNZ	_00575_DS_
	GOTO	_00529_DS_
_00575_DS_:
;	.line	157; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == '-')
	MOVF	r0x0f, W
	XORLW	0x2d
	BNZ	_00554_DS_
;	.line	159; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++format;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
;	.line	160; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pad = PAD_RIGHT;
	MOVLW	0x01
	MOVWF	r0x0b
	CLRF	r0x0c
_00554_DS_:
;	.line	162; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	while (*format == '0')
	MOVFF	r0x03, r0x0f
	MOVFF	r0x04, r0x10
	MOVFF	r0x05, r0x11
_00508_DS_:
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	XORLW	0x30
	BNZ	_00540_DS_
;	.line	164; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++format;
	INCF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
;	.line	165; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pad |= PAD_ZERO;
	BSF	r0x0b, 1
	BRA	_00508_DS_
_00540_DS_:
;	.line	167; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	MOVWF	r0x12
	ADDLW	0x80
	ADDLW	0x50
	BNC	_00571_DS_
	MOVF	r0x12, W
	ADDLW	0x80
	ADDLW	0x46
	BC	_00571_DS_
;	.line	169; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	width *= 10;
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
;	.line	170; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	width += *format - '0';
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
;	.line	167; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	INCF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BRA	_00540_DS_
_00571_DS_:
	MOVFF	r0x0f, r0x03
	MOVFF	r0x10, r0x04
	MOVFF	r0x11, r0x05
;	.line	172; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == 's')
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x0f
; #	MOVF	r0x0f, W
	MOVWF	r0x0f
	XORLW	0x73
	BZ	_00584_DS_
	BRA	_00512_DS_
_00584_DS_:
;	.line	175; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	char *s = va_arg(args, char*);
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
;	.line	177; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pc += pprints(out, s?s:"(null)", width, pad);
	IORWF	r0x11, W
; #	IORWF	r0x12, W
; #	BTFSC	STATUS, 2
; #	GOTO	_00546_DS_
; #	GOTO	_00547_DS_
; #	MOVLW	LOW(__str_0)
	IORWF	r0x12, W
	BNZ	_00547_DS_
	MOVLW	LOW(__str_0)
	MOVWF	r0x10
	MOVLW	HIGH(__str_0)
	MOVWF	r0x11
	MOVLW	UPPER(__str_0)
	MOVWF	r0x12
_00547_DS_:
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
	CALL	_pprints
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	178; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	continue;
	GOTO	_00535_DS_
_00512_DS_:
;	.line	180; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == 'd')
	MOVF	r0x0f, W
	XORLW	0x64
	BZ	_00586_DS_
	BRA	_00514_DS_
_00586_DS_:
;	.line	182; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 10, 1, width, pad, 'a');
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
	CALL	_pprinti
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	183; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00535_DS_
_00514_DS_:
;	.line	185; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == 'x')
	MOVF	r0x0f, W
	XORLW	0x78
	BZ	_00588_DS_
	BRA	_00516_DS_
_00588_DS_:
;	.line	187; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 16, 0, width, pad, 'a');
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
	CALL	_pprinti
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	188; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00535_DS_
_00516_DS_:
;	.line	190; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == 'X')
	MOVF	r0x0f, W
	XORLW	0x58
	BZ	_00590_DS_
	BRA	_00518_DS_
_00590_DS_:
;	.line	192; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 16, 0, width, pad, 'A');
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
	CALL	_pprinti
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	193; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00535_DS_
_00518_DS_:
;	.line	195; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == 'b')
	MOVF	r0x0f, W
	XORLW	0x62
	BZ	_00592_DS_
	BRA	_00520_DS_
_00592_DS_:
;	.line	197; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 2, 0, width, pad, 'a');
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
	CALL	_pprinti
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	198; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00535_DS_
_00520_DS_:
;	.line	200; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == 'o')
	MOVF	r0x0f, W
	XORLW	0x6f
	BZ	_00594_DS_
	BRA	_00522_DS_
_00594_DS_:
;	.line	202; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 8, 0, width, pad, 'a');
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
	CALL	_pprinti
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	203; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00535_DS_
_00522_DS_:
;	.line	205; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == 'u')
	MOVF	r0x0f, W
	XORLW	0x75
	BZ	_00596_DS_
	BRA	_00524_DS_
_00596_DS_:
;	.line	207; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 10, 0, width, pad, 'a');
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
	CALL	_pprinti
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0f
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	208; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00535_DS_
_00524_DS_:
;	.line	210; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == 'c')
	MOVF	r0x0f, W
	XORLW	0x63
	BZ	_00598_DS_
	BRA	_00526_DS_
_00598_DS_:
;	.line	213; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	scr[0] = (char)va_arg(args, int);
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
	BANKSEL	_pprint_scr_1_1
	MOVWF	_pprint_scr_1_1, B
; removed redundant BANKSEL
;	.line	215; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	scr[1] = '\0';
	CLRF	(_pprint_scr_1_1 + 1), B
;	.line	216; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pc += pprints(out, scr, width, pad);
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
	MOVLW	HIGH(_pprint_scr_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprint_scr_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	ADDWF	r0x09, F
	MOVF	r0x11, W
	ADDWFC	r0x0a, F
;	.line	217; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00535_DS_
_00526_DS_:
;	.line	219; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (*format == 'f')
	MOVF	r0x0f, W
	XORLW	0x66
	BNZ	_00535_DS_
;	.line	221; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pc += pprints(out, "not yet implemented\0", width, pad);
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
	CALL	_pprints
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVF	r0x0b, W
	ADDWF	r0x09, F
	MOVF	r0x0c, W
	ADDWFC	r0x0a, F
;	.line	222; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00535_DS_
_00529_DS_:
;	.line	228; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pprintchar(out, *format);
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
	CALL	_pprintchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	229; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++pc;
	INCF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
_00535_DS_:
;	.line	147; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for (; *format != 0; ++format)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	GOTO	_00533_DS_
_00536_DS_:
;	.line	232; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (out) **out = '\0';
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00538_DS_
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
_00538_DS_:
;	.line	234; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	return pc;
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
S_main__pprinti	code
_pprinti:
;	.line	92; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	static int pprinti(char **out, int i, int b, int sg, int width, int pad, int letbase)
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
;	.line	96; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	int t, neg = 0, pc = 0;
	CLRF	r0x0f
	CLRF	r0x10
	CLRF	r0x11
	CLRF	r0x12
;	.line	97; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	unsigned int u = i;
	MOVFF	r0x03, r0x13
	MOVFF	r0x04, r0x14
;	.line	99; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (i == 0)
	MOVF	r0x03, W
	IORWF	r0x04, W
	BNZ	_00464_DS_
;	.line	101; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	print_buf[0] = '0';
	MOVLW	0x30
	BANKSEL	_pprinti_print_buf_1_1
	MOVWF	_pprinti_print_buf_1_1, B
; removed redundant BANKSEL
;	.line	102; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	print_buf[1] = '\0';
	CLRF	(_pprinti_print_buf_1_1 + 1), B
;	.line	103; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	return pprints(out, print_buf, width, pad);
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
	MOVLW	HIGH(_pprinti_print_buf_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprinti_print_buf_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x15
	MOVFF	PRODL, r0x16
	MOVLW	0x0a
	ADDWF	FSR1L, F
	MOVFF	r0x16, PRODL
	MOVF	r0x15, W
	BRA	_00480_DS_
_00464_DS_:
;	.line	106; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (sg && b == 10 && i < 0)
	MOVF	r0x07, W
	IORWF	r0x08, W
	BZ	_00466_DS_
	MOVF	r0x05, W
	XORLW	0x0a
	BNZ	_00493_DS_
	MOVF	r0x06, W
	BZ	_00494_DS_
_00493_DS_:
	BRA	_00466_DS_
_00494_DS_:
	BSF	STATUS, 0
	BTFSS	r0x04, 7
	BCF	STATUS, 0
	BNC	_00466_DS_
;	.line	108; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	neg = 1;
	MOVLW	0x01
	MOVWF	r0x0f
	CLRF	r0x10
;	.line	109; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	u = -i;
	COMF	r0x04, W
	MOVWF	r0x14
	COMF	r0x03, W
	MOVWF	r0x13
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00466_DS_:
;	.line	112; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	s = print_buf + PRINT_BUF_LEN-1;
	MOVLW	HIGH(_pprinti_print_buf_1_1 + 11)
	MOVWF	r0x04
	MOVLW	LOW(_pprinti_print_buf_1_1 + 11)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x07
;	.line	113; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	*s = '\0';
	CLRF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	CALL	__gptrput1
;	.line	115; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	while (u)
	MOVF	r0x0d, W
	ADDLW	0xc6
	MOVWF	r0x0d
	MOVFF	r0x05, r0x0e
	MOVFF	r0x06, r0x15
	MOVFF	r0x03, r0x16
	MOVFF	r0x04, r0x17
	MOVFF	r0x07, r0x18
_00471_DS_:
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00492_DS_
;	.line	117; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	t = u % b;
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
;	.line	118; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if( t >= 10 )
	MOVF	r0x1a, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00496_DS_
	MOVLW	0x0a
	SUBWF	r0x19, W
_00496_DS_:
	BNC	_00470_DS_
;	.line	119; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	t += letbase - '0' - 10;
	MOVF	r0x0d, W
	ADDWF	r0x19, F
_00470_DS_:
;	.line	120; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	*--s = t + '0';
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
;	.line	121; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	u /= b;
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
	BRA	_00471_DS_
_00492_DS_:
	MOVFF	r0x16, r0x03
	MOVFF	r0x17, r0x04
	MOVFF	r0x18, r0x07
;	.line	124; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (neg)
	MOVF	r0x0f, W
	IORWF	r0x10, W
	BZ	_00479_DS_
;	.line	126; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (width && (pad & PAD_ZERO))
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BZ	_00475_DS_
	BTFSS	r0x0b, 1
	BRA	_00475_DS_
;	.line	128; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pprintchar(out, '-');
	MOVLW	0x2d
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	129; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++pc;
	MOVLW	0x01
	MOVWF	r0x11
	CLRF	r0x12
;	.line	130; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	--width;
	MOVLW	0xff
	ADDWF	r0x09, F
	BTFSS	STATUS, 0
	DECF	r0x0a, F
	BRA	_00479_DS_
_00475_DS_:
;	.line	134; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	*--s = '-';
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
_00479_DS_:
;	.line	138; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	return pc + pprints(out, s, width, pad);
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
	CALL	_pprints
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
_00480_DS_:
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
S_main__pprints	code
_pprints:
;	.line	50; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	static int pprints(char **out, const char *string, int width, int pad)
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
;	.line	52; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	register int pc = 0;
	CLRF	r0x0a
	CLRF	r0x0b
;	.line	53; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	int padchar = ' ';
	MOVLW	0x20
	MOVWF	r0x0c
;	.line	57; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (width > 0)
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00453_DS_
	MOVLW	0x01
	SUBWF	r0x06, W
_00453_DS_:
	BNC	_00417_DS_
;	.line	59; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for (ptr = string; *ptr; ++ptr)
	CLRF	r0x0e
	CLRF	r0x0f
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
_00420_DS_:
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x13
	MOVF	r0x13, W
	BZ	_00423_DS_
;	.line	60; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++len;
	INCF	r0x0e, F
	BTFSC	STATUS, 0
	INCF	r0x0f, F
;	.line	59; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for (ptr = string; *ptr; ++ptr)
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	BRA	_00420_DS_
_00423_DS_:
;	.line	61; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (len >= width)
	MOVF	r0x0f, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x07, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00454_DS_
	MOVF	r0x06, W
	SUBWF	r0x0e, W
_00454_DS_:
	BNC	_00412_DS_
;	.line	62; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	width = 0;
	CLRF	r0x06
	CLRF	r0x07
	BRA	_00413_DS_
_00412_DS_:
;	.line	64; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	width -= len;
	MOVF	r0x0e, W
	SUBWF	r0x06, F
	MOVF	r0x0f, W
	SUBWFB	r0x07, F
_00413_DS_:
;	.line	65; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (pad & PAD_ZERO) padchar = '0';
	BTFSS	r0x08, 1
	BRA	_00417_DS_
	MOVLW	0x30
	MOVWF	r0x0c
_00417_DS_:
;	.line	67; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (!(pad & PAD_RIGHT))
	BTFSC	r0x08, 0
	BRA	_00446_DS_
	CLRF	r0x08
	CLRF	r0x09
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
_00424_DS_:
;	.line	69; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x0f, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00457_DS_
	MOVLW	0x01
	SUBWF	r0x0e, W
_00457_DS_:
	BNC	_00450_DS_
; #	MOVF	r0x0c, W
; #	MOVWF	r0x10
; #	MOVF	r0x10, W
;	.line	71; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pprintchar(out, padchar);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	72; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++pc;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	69; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for ( ; width > 0; --width)
	MOVLW	0xff
	ADDWF	r0x0e, F
	BTFSS	STATUS, 0
	DECF	r0x0f, F
	BRA	_00424_DS_
_00450_DS_:
	MOVFF	r0x08, r0x0a
	MOVFF	r0x09, r0x0b
	MOVFF	r0x0e, r0x06
	MOVFF	r0x0f, r0x07
_00446_DS_:
	MOVFF	r0x0a, r0x08
	MOVFF	r0x0b, r0x09
_00428_DS_:
;	.line	75; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for ( ; *string ; ++string)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0a
	MOVF	r0x0a, W
	BZ	_00448_DS_
;	.line	77; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pprintchar(out, *string);
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	78; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++pc;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	75; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for ( ; *string ; ++string)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BRA	_00428_DS_
_00448_DS_:
	MOVFF	r0x08, r0x03
	MOVFF	r0x09, r0x04
	MOVFF	r0x06, r0x05
	MOVFF	r0x07, r0x06
_00432_DS_:
;	.line	80; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x06, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00458_DS_
	MOVLW	0x01
	SUBWF	r0x05, W
_00458_DS_:
	BNC	_00435_DS_
; #	MOVF	r0x0c, W
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
;	.line	82; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pprintchar(out, padchar);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintchar
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	83; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++pc;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
;	.line	80; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	for ( ; width > 0; --width)
	MOVLW	0xff
	ADDWF	r0x05, F
	BTFSS	STATUS, 0
	DECF	r0x06, F
	BRA	_00432_DS_
_00435_DS_:
;	.line	86; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	return pc;
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
S_main__pprintchar	code
_pprintchar:
;	.line	34; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	static void pprintchar(char **str, char c)
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
;	.line	36; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	if (str)
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00401_DS_
;	.line	38; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	**str = c;
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
;	.line	39; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	++(*str);
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
	BRA	_00403_DS_
_00401_DS_:
;	.line	43; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/stdio.c	pputchar(c);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00406_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00406_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00406_DS_)
	MOVWF	TOSU
	MOVF	PREINC1, W
	MOVWF	INTCON
	MOVFF	(_pputchar + 2), PCLATU
	MOVFF	(_pputchar + 1), PCLATH
	BANKSEL	_pputchar
	MOVF	_pputchar, W, B
	MOVWF	PCL
_00406_DS_:
	MOVLW	0x01
	ADDWF	FSR1L, F
_00403_DS_:
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
S_main__I2C_sendAck	code
_I2C_sendAck:
;	.line	399; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON2bits.ACKDT = 0;
	BCF	_SSPCON2bits, 5
;	.line	400; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON2bits.ACKEN = 1;
	BSF	_SSPCON2bits, 4
;	.line	401; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_wait();
	CALL	_I2C_wait
	RETURN	

; ; Starting pCode block
S_main__I2C_sendNack	code
_I2C_sendNack:
;	.line	387; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON2bits.ACKDT = 1;
	BSF	_SSPCON2bits, 5
;	.line	388; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON2bits.ACKEN = 1;
	BSF	_SSPCON2bits, 4
;	.line	389; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_wait();
	CALL	_I2C_wait
	RETURN	

; ; Starting pCode block
S_main__I2C_readAbort	code
_I2C_readAbort:
;	.line	375; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON1bits.WCOL = 0;
	BCF	_SSPCON1bits, 7
;	.line	376; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_stop();
	CALL	_I2C_stop
;	.line	377; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_wait();  
	CALL	_I2C_wait
	RETURN	

; ; Starting pCode block
S_main__I2C_waitAck	code
_I2C_waitAck:
;	.line	357; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	static u8 I2C_waitAck()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	360; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	while(SSPCON2bits.ACKSTAT == 1) 
	CLRF	r0x00
_00371_DS_:
	CLRF	r0x01
	BTFSC	_SSPCON2bits, 6
	INCF	r0x01, F
	MOVF	r0x01, W
	XORLW	0x01
	BNZ	_00373_DS_
;	.line	362; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	i++;
	INCF	r0x00, F
;	.line	363; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	if(i==0) return -1;
	MOVF	r0x00, W
	BNZ	_00371_DS_
	SETF	WREG
	BRA	_00374_DS_
_00373_DS_:
;	.line	365; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	return 0;
	CLRF	WREG
_00374_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__I2C_restart	code
_I2C_restart:
;	.line	348; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON2bits.RSEN=1;
	BSF	_SSPCON2bits, 1
;	.line	349; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_wait();
	CALL	_I2C_wait
	RETURN	

; ; Starting pCode block
S_main__I2C_stop	code
_I2C_stop:
;	.line	337; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON2bits.PEN = 1;
	BSF	_SSPCON2bits, 2
;	.line	338; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_wait();
	CALL	_I2C_wait
	RETURN	

; ; Starting pCode block
S_main__I2C_start	code
_I2C_start:
;	.line	326; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON2bits.SEN = 1;
	BSF	_SSPCON2bits, 0
;	.line	327; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_wait();
	CALL	_I2C_wait
	RETURN	

; ; Starting pCode block
S_main__I2C_wait	code
_I2C_wait:
_00346_DS_:
;	.line	315; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	while (PIR1bits.SSPIF == 0);
	BTFSS	_PIR1bits, 3
	BRA	_00346_DS_
;	.line	316; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	PIR1bits.SSPIF = 0;
	BCF	_PIR1bits, 3
	RETURN	

; ; Starting pCode block
S_main__I2C_interrupt	code
_I2C_interrupt:
;	.line	298; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	if (PIR1bits.SSPIF)
	BTFSS	_PIR1bits, 3
	BRA	_00336_DS_
;	.line	300; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	PIR1bits.SSPIF = 0;
	BCF	_PIR1bits, 3
;	.line	301; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	if (SSPSTATbits.R_W)
	BTFSS	_SSPSTATbits, 2
	BRA	_00332_DS_
;	.line	302; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	_i2c_onRequest_function();
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00340_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00340_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00340_DS_)
	MOVWF	TOSU
	MOVF	PREINC1, W
	MOVWF	INTCON
	MOVFF	(__i2c_onRequest_function + 2), PCLATU
	MOVFF	(__i2c_onRequest_function + 1), PCLATH
	BANKSEL	__i2c_onRequest_function
	MOVF	__i2c_onRequest_function, W, B
	MOVWF	PCL
_00340_DS_:
	BRA	_00336_DS_
_00332_DS_:
;	.line	304; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	_i2c_onReceive_function();
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00341_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00341_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00341_DS_)
	MOVWF	TOSU
	MOVF	PREINC1, W
	MOVWF	INTCON
	MOVFF	(__i2c_onReceive_function + 2), PCLATU
	MOVFF	(__i2c_onReceive_function + 1), PCLATH
	BANKSEL	__i2c_onReceive_function
	MOVF	__i2c_onReceive_function, W, B
	MOVWF	PCL
_00341_DS_:
_00336_DS_:
	RETURN	

; ; Starting pCode block
S_main__IC2_OnReceive	code
_IC2_OnReceive:
;	.line	286; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	void IC2_OnReceive(i2c_stdout func)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, __i2c_onReceive_function
	MOVLW	0x03
	MOVFF	PLUSW2, (__i2c_onReceive_function + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (__i2c_onReceive_function + 2)
;	.line	288; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	_i2c_onReceive_function = func;
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__I2C_OnRequest	code
_I2C_OnRequest:
;	.line	276; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	void I2C_OnRequest(i2c_stdout func)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, __i2c_onRequest_function
	MOVLW	0x03
	MOVFF	PLUSW2, (__i2c_onRequest_function + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (__i2c_onRequest_function + 2)
;	.line	278; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	_i2c_onRequest_function = func;
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__I2C_readchar	code
_I2C_readchar:
;	.line	266; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON2bits.RCEN = 1;
	BSF	_SSPCON2bits, 3
;	.line	267; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_wait();
	CALL	_I2C_wait
;	.line	268; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	return (SSPBUF);
	MOVF	_SSPBUF, W
	RETURN	

; ; Starting pCode block
S_main__I2C_writechar	code
_I2C_writechar:
;	.line	252; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	u8 I2C_writechar(u8 byte)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, _SSPBUF
;	.line	255; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_wait();
	CALL	_I2C_wait
;	.line	256; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	return (!SSPCON2bits.ACKSTAT);
	CLRF	r0x00
	BTFSC	_SSPCON2bits, 6
	INCF	r0x00, F
	MOVF	r0x00, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__I2C_sendID	code
_I2C_sendID:
;	.line	208; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	static void I2C_sendID(u16 DeviceID, u8 r_w)
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
;	.line	213; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	if (DeviceID > 0x00FF)
	MOVLW	0x01
	SUBWF	r0x01, W
	BNZ	_00292_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00292_DS_:
	BNC	_00284_DS_
;	.line	215; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	temp = (DeviceID >> 7) & 0x06;	// set A9 and A8 to temp.bit2 and temp.bit1
	RLCF	r0x00, W
	RLCF	r0x01, W
	MOVWF	r0x03
	MOVLW	0x06
	ANDWF	r0x03, F
;	.line	216; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	temp = temp | 0xF0 | r_w;			// set DeviceID address Hi format = 11110(A9A8)(R/W)
	MOVLW	0xf0
	IORWF	r0x03, W
; #	MOVWF	r0x04
; #	MOVF	r0x02, W
; #	IORWF	r0x04, W
	IORWF	r0x02, W
	MOVWF	r0x03
;	.line	217; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_start();
	CALL	_I2C_start
;	.line	218; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	if (I2C_writechar(temp) != 1)
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_I2C_writechar
	INCF	FSR1L, F
	XORLW	0x01
	BZ	_00286_DS_
_00273_DS_:
;	.line	221; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_restart();
	CALL	_I2C_restart
;	.line	222; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	} while ( I2C_writechar(temp) != 1);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_I2C_writechar
	INCF	FSR1L, F
	XORLW	0x01
	BNZ	_00273_DS_
;	.line	223; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	temp = (DeviceID << 1 & 0xFE) | r_w;
	MOVF	r0x00, W
	MOVWF	r0x04
	RLNCF	r0x04, W
	ANDLW	0xfe
	MOVWF	r0x05
	MOVLW	0xfe
	ANDWF	r0x05, W
; #	MOVWF	r0x04
; #	MOVF	r0x02, W
; #	IORWF	r0x04, W
	IORWF	r0x02, W
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
;	.line	224; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_writechar(temp);
	MOVWF	POSTDEC1
	CALL	_I2C_writechar
	INCF	FSR1L, F
	BRA	_00286_DS_
_00284_DS_:
;	.line	230; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	temp = DeviceID;// << 1 & 0b11111110;
	MOVF	r0x00, W
	MOVWF	r0x03
;	.line	231; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	temp = temp | r_w;
	MOVF	r0x02, W
	IORWF	r0x03, F
;	.line	232; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_start();
	CALL	_I2C_start
;	.line	233; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	if (I2C_writechar(temp) != 1)
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_I2C_writechar
	INCF	FSR1L, F
	XORLW	0x01
	BZ	_00286_DS_
_00278_DS_:
;	.line	236; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_restart();
	CALL	_I2C_restart
;	.line	237; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	} while (I2C_writechar(temp) != 1);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_I2C_writechar
	INCF	FSR1L, F
	XORLW	0x01
	BNZ	_00278_DS_
_00286_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__I2C_get	code
_I2C_get:
;	.line	178; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	u8 I2C_get(u8 address)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	182; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_sendID(address, I2C_READ);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_I2C_sendID
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	183; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	byte = I2C_readchar();
	CALL	_I2C_readchar
	MOVWF	r0x00
;	.line	184; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_sendNack();
	CALL	_I2C_sendNack
;	.line	185; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_stop();
	CALL	_I2C_stop
;	.line	186; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	return (byte);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__I2C_send	code
_I2C_send:
;	.line	165; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	u8 I2C_send(u8 address, u8 byte)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	167; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_sendID(address, I2C_WRITE);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_I2C_sendID
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	168; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	if (I2C_writechar(byte) == 0) return (0);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_I2C_writechar
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	BNZ	_00262_DS_
	CLRF	WREG
	BRA	_00263_DS_
_00262_DS_:
;	.line	169; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_stop();
	CALL	_I2C_stop
;	.line	170; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	return (1);
	MOVLW	0x01
_00263_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__I2C_init	code
_I2C_init:
;	.line	118; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	void I2C_init(u8 mode, u16 sspadd)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	121; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	TRISBbits.TRISB0 = INPUT;			// SDA = INPUT
	BSF	_TRISBbits, 0
;	.line	122; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	TRISBbits.TRISB1 = INPUT;			// SCL = INPUT
	BSF	_TRISBbits, 1
;	.line	123; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	switch (mode)
	MOVF	r0x00, W
	BZ	_00237_DS_
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00237_DS_
;	.line	126; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	intUsed[INT_SSP] = INT_USED;
	MOVLW	0x01
	BANKSEL	(_intUsed + 19)
	MOVWF	(_intUsed + 19), B
;	.line	128; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	INTCONbits.PEIE=1;
	BSF	_INTCONbits, 6
;	.line	129; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	INTCONbits.GIE=1;
	BSF	_INTCONbits, 7
;	.line	130; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON1 = 0b00101110;		// Slave mode,  7-bit address with Start and Stop bit interrupts enabled
	MOVLW	0x2e
	MOVWF	_SSPCON1
;	.line	133; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPADD = sspadd;				// Slave 7-bit address
	MOVF	r0x01, W
	MOVWF	_SSPADD
;	.line	136; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	break;
	BRA	_00242_DS_
_00237_DS_:
;	.line	139; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON1 = 0b00101000;		// Master Mode, clock = FOSC/(4 * (SSPADD + 1))
	MOVLW	0x28
	MOVWF	_SSPCON1
;	.line	141; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	switch (sspadd)
	MOVF	r0x01, W
	BNZ	_00254_DS_
	MOVF	r0x02, W
	BZ	_00240_DS_
_00254_DS_:
	MOVF	r0x01, W
	XORLW	0x01
	BNZ	_00255_DS_
	MOVF	r0x02, W
	BZ	_00256_DS_
_00255_DS_:
	BRA	_00240_DS_
_00256_DS_:
;	.line	145; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPSTAT = 0b00000000;		// Slew Mode On
	CLRF	_SSPSTAT
;	.line	146; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPADD = 29;					// 400kHz = FOSC/(4 * (SSPADD + 1))
	MOVLW	0x1d
	MOVWF	_SSPADD
_00240_DS_:
;	.line	150; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPSTAT = 0b10000000;		// Slew Mode Off
	MOVLW	0x80
	MOVWF	_SSPSTAT
;	.line	151; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPADD = 119;					// 100kHz = FOSC/(4 * (SSPADD + 1))
	MOVLW	0x77
	MOVWF	_SSPADD
_00242_DS_:
;	.line	155; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	SSPCON2 = 0;
	CLRF	_SSPCON2
;	.line	156; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	PIR1bits.SSPIF = 0;
	BCF	_PIR1bits, 3
;	.line	157; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	PIR2bits.BCLIF = 0;
	BCF	_PIR2bits, 3
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__I2C_slave	code
_I2C_slave:
;	.line	102; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	void I2C_slave(u16 DeviceID)   
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	104; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_init(I2C_SLAVE_MODE, DeviceID);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_I2C_init
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__I2C_master	code
_I2C_master:
;	.line	99; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/pinguinoi2c.c	I2C_init(I2C_MASTER_MODE, I2C_SLEW_OFF);
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_I2C_init
	MOVLW	0x03
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__userinterrupt	code
_userinterrupt:
;	.line	967; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	void userinterrupt()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	991; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	if (INTCONbits.TMR0IE && INTCONbits.TMR0IF)
	BTFSS	_INTCONbits, 5
	BRA	_00212_DS_
	BTFSS	_INTCONbits, 2
	BRA	_00212_DS_
;	.line	993; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	T0CONbits.TMR0ON = OFF;
	BCF	_T0CONbits, 7
;	.line	994; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	TMR0H = preloadH[INT_TMR0];
	MOVFF	_preloadH, _TMR0H
;	.line	995; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	TMR0L = preloadL[INT_TMR0];
	MOVFF	_preloadL, _TMR0L
;	.line	996; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.TMR0IF = 0;
	BCF	_INTCONbits, 2
;	.line	997; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	if (intCount[INT_TMR0]++ >= intCountLimit[INT_TMR0])
	MOVFF	_intCount, r0x00
	MOVFF	(_intCount + 1), r0x01
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x02
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x03
	MOVF	r0x02, W
	BANKSEL	_intCount
	MOVWF	_intCount, B
	MOVF	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_intCount + 1), B
	BANKSEL	(_intCountLimit + 1)
	MOVF	(_intCountLimit + 1), W, B
	SUBWF	r0x01, W
	BNZ	_00219_DS_
; removed redundant BANKSEL
	MOVF	_intCountLimit, W, B
	SUBWF	r0x00, W
_00219_DS_:
	BNC	_00212_DS_
	BANKSEL	_intCount
;	.line	999; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	intCount[INT_TMR0] = 0;
	CLRF	_intCount, B
; removed redundant BANKSEL
	CLRF	(_intCount + 1), B
;	.line	1000; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	intFunction[INT_TMR0]();
	MOVFF	_intFunction, r0x00
	MOVFF	(_intFunction + 1), r0x01
	MOVFF	(_intFunction + 2), r0x02
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00220_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00220_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00220_DS_)
	MOVWF	TOSU
	MOVF	PREINC1, W
	MOVWF	INTCON
	MOVFF	r0x02, PCLATU
	MOVFF	r0x01, PCLATH
	MOVF	r0x00, W
	MOVWF	PCL
_00220_DS_:
_00212_DS_:
;	.line	1131; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	int_start();
	CALL	_int_start
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__userhighinterrupt	code
_userhighinterrupt:
;	.line	957; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__OnTimer0	code
_OnTimer0:
;	.line	360; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	void OnTimer0(callback func, u8 timediv, u16 delay)
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
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
;	.line	362; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	u8 _t0con = 0;
	CLRF	r0x06
	BANKSEL	_intUsed
;	.line	364; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	if (intUsed[INT_TMR0] == INT_NOT_USED)
	MOVF	_intUsed, W, B
	BTFSS	STATUS, 2
	BRA	_00192_DS_
;	.line	366; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	intUsed[INT_TMR0] = INT_USED;
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	_intUsed, B
	BANKSEL	_intCount
;	.line	367; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	intCount[INT_TMR0] = 0;
	CLRF	_intCount, B
; removed redundant BANKSEL
	CLRF	(_intCount + 1), B
;	.line	368; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	intCountLimit[INT_TMR0] = delay;
	MOVF	r0x04, W
	BANKSEL	_intCountLimit
	MOVWF	_intCountLimit, B
	MOVF	r0x05, W
; removed redundant BANKSEL
	MOVWF	(_intCountLimit + 1), B
;	.line	369; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	intFunction[INT_TMR0] = func;
	MOVF	r0x00, W
	BANKSEL	_intFunction
	MOVWF	_intFunction, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_intFunction + 1), B
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_intFunction + 2), B
;	.line	371; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	switch(timediv)
	MOVLW	0x01
	SUBWF	r0x03, W
	BTFSS	STATUS, 0
	BRA	_00189_DS_
	MOVLW	0x04
	SUBWF	r0x03, W
	BTFSC	STATUS, 0
	BRA	_00189_DS_
	DECF	r0x03, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x03, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00199_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00199_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00199_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00199_DS_:
	GOTO	_00186_DS_
	GOTO	_00187_DS_
	GOTO	_00188_DS_
_00186_DS_:
	BANKSEL	_preloadH
;	.line	375; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	preloadH[INT_TMR0] = high8(0xFFFF - 12);
	SETF	_preloadH, B
;	.line	376; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	preloadL[INT_TMR0] =  low8(0xFFFF - 12);
	MOVLW	0xf3
	BANKSEL	_preloadL
	MOVWF	_preloadL, B
;	.line	377; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	_t0con = T0_OFF & T0_16BIT & T0_CLK & T0_PS_OFF;
	MOVLW	0x1f
	MOVWF	r0x06
;	.line	378; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00189_DS_
_00187_DS_:
;	.line	382; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	preloadH[INT_TMR0] = high8(0xFFFF - 1500);
	MOVLW	0xfa
	BANKSEL	_preloadH
	MOVWF	_preloadH, B
;	.line	383; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	preloadL[INT_TMR0] =  low8(0xFFFF - 1500);
	MOVLW	0x23
	BANKSEL	_preloadL
	MOVWF	_preloadL, B
;	.line	384; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	_t0con = T0_OFF & T0_16BIT & T0_CLK & T0_PS_ON & T0_PS_1_8;
	MOVLW	0x12
	MOVWF	r0x06
;	.line	385; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00189_DS_
_00188_DS_:
;	.line	389; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	preloadH[INT_TMR0] = high8(0xFFFF - 46875);
	MOVLW	0x48
	BANKSEL	_preloadH
	MOVWF	_preloadH, B
;	.line	390; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	preloadL[INT_TMR0] =  low8(0xFFFF - 46875);
	MOVLW	0xe4
	BANKSEL	_preloadL
	MOVWF	_preloadL, B
;	.line	391; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	_t0con = T0_OFF & T0_16BIT & T0_CLK & T0_PS_ON & T0_PS_1_256;
	MOVLW	0x17
	MOVWF	r0x06
_00189_DS_:
;	.line	395; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCON2bits.TMR0IP = INT_LOW_PRIORITY;
	BCF	_INTCON2bits, 2
;	.line	396; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.TMR0IE = INT_ENABLE;
	BSF	_INTCONbits, 5
;	.line	397; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.TMR0IF = 0;
	BCF	_INTCONbits, 2
;	.line	398; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	TMR0H = preloadH[INT_TMR0];
	MOVFF	_preloadH, _TMR0H
;	.line	399; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	TMR0L = preloadL[INT_TMR0];
	MOVFF	_preloadL, _TMR0L
;	.line	400; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	T0CON = _t0con;
	MOVFF	r0x06, _T0CON
_00192_DS_:
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
S_main__int_stop	code
_int_stop:
;	.line	333; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	T0CONbits.TMR0ON = OFF;
	BCF	_T0CONbits, 7
	RETURN	

; ; Starting pCode block
S_main__int_start	code
_int_start:
;	.line	307; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	T0CONbits.TMR0ON = ON;
	BSF	_T0CONbits, 7
	RETURN	

; ; Starting pCode block
S_main__int_init	code
_int_init:
;	.line	285; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	void int_init()
	MOVFF	r0x00, POSTDEC1
;	.line	289; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	RCONbits.IPEN = 1;					// Enable HP/LP interrupts
	BSF	_RCONbits, 7
;	.line	290; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.GIEH = 1;				// Enable HP interrupts
	BSF	_INTCONbits, 7
;	.line	291; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.GIEL = 1;				// Enable LP interrupts
	BSF	_INTCONbits, 6
;	.line	293; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	for (i = 0; i < INT_NUM; i++)		// Disable all interrupts
	CLRF	r0x00
_00162_DS_:
	MOVLW	0x14
	SUBWF	r0x00, W
	BC	_00166_DS_
;	.line	294; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	detachInterrupt(i);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_detachInterrupt
	INCF	FSR1L, F
;	.line	293; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	for (i = 0; i < INT_NUM; i++)		// Disable all interrupts
	INCF	r0x00, F
	BRA	_00162_DS_
_00166_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__detachInterrupt	code
_detachInterrupt:
;	.line	207; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	void detachInterrupt(u8 inter)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	209; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	intUsed[inter] = INT_NOT_USED;	// This interrupt is no longer used
	MOVLW	LOW(_intUsed)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_intUsed)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	CLRF	INDF0
;	.line	211; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	switch(inter)
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
;	.line	214; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.INT0IE = INT_DISABLE;
	BCF	_INTCONbits, 4
;	.line	215; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00134_DS_:
;	.line	217; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCON3bits.INT1IE = INT_DISABLE;
	BCF	_INTCON3bits, 3
;	.line	218; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00135_DS_:
;	.line	220; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCON3bits.INT2IE = INT_DISABLE;
	BCF	_INTCON3bits, 4
;	.line	221; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00136_DS_:
;	.line	223; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.TMR0IE = INT_DISABLE;
	BCF	_INTCONbits, 5
;	.line	224; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00137_DS_:
;	.line	226; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.TMR1IE = INT_DISABLE;
	BCF	_PIE1bits, 0
;	.line	227; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00138_DS_:
;	.line	229; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.TMR2IE = INT_DISABLE;
	BCF	_PIE1bits, 1
;	.line	230; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00139_DS_:
;	.line	232; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.TMR3IE = INT_DISABLE;
	BCF	_PIE2bits, 1
;	.line	233; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00140_DS_:
;	.line	235; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	INTCONbits.RBIE = INT_DISABLE;
	BCF	_INTCONbits, 3
;	.line	236; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00141_DS_:
;	.line	238; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.USBIE = INT_DISABLE;
	BCF	_PIE2bits, 5
;	.line	239; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00142_DS_:
;	.line	241; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.ADIE = INT_DISABLE;
	BCF	_PIE1bits, 6
;	.line	242; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00143_DS_:
;	.line	244; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.RCIE = INT_DISABLE;
	BCF	_PIE1bits, 5
;	.line	245; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00144_DS_:
;	.line	247; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.TXIE = INT_DISABLE;
	BCF	_PIE1bits, 4
;	.line	248; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00145_DS_:
;	.line	250; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE1bits.CCP1IE = INT_DISABLE;
	BCF	_PIE1bits, 2
;	.line	251; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00146_DS_:
;	.line	253; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.CCP2IE = INT_DISABLE;
	BCF	_PIE2bits, 0
;	.line	254; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00147_DS_:
;	.line	256; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.OSCFIE = INT_DISABLE;
	BCF	_PIE2bits, 7
;	.line	257; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00148_DS_:
;	.line	259; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.CMIE = INT_DISABLE;
	BCF	_PIE2bits, 6
;	.line	260; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00149_DS_:
;	.line	262; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.EEIE = INT_DISABLE;
	BCF	_PIE2bits, 4
;	.line	263; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00150_DS_:
;	.line	265; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.BCLIE = INT_DISABLE;
	BCF	_PIE2bits, 3
;	.line	266; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	break;
	BRA	_00153_DS_
_00151_DS_:
;	.line	268; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	PIE2bits.HLVDIE = INT_DISABLE;
	BCF	_PIE2bits, 2
_00153_DS_:
;	.line	275; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/interrupt.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayus	code
_Delayus:
;	.line	16; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/arduinodelay.c	void Delayus(int microsecondes)
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
;	.line	20; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/arduinodelay.c	for (i=0;i<microsecondes;i++);
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
;	.line	9; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/arduinodelay.c	void Delayms(unsigned long milliseconde)
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
;	.line	13; /home/regis/Hobbies/Electronique/Projets/PinguinoIDE/X/branches/linux/tools/p8/bin/../share/sdcc/include/pic16/arduinodelay.c	for (i=0;i<milliseconde;i++) delay10ktcy(1);
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
; ; Starting pCode block for Ival
	code
_car0:
	DB	0x04, 0x0a, 0x0e, 0x01, 0x0f, 0x11, 0x0f, 0x00
; ; Starting pCode block for Ival
_car1:
	DB	0x04, 0x02, 0x0e, 0x01, 0x0f, 0x11, 0x0f, 0x00
; ; Starting pCode block for Ival
_car2:
	DB	0x0e, 0x10, 0x10, 0x11, 0x0e, 0x04, 0x0c, 0x00
; ; Starting pCode block for Ival
_car3:
	DB	0x04, 0x08, 0x0e, 0x11, 0x1f, 0x10, 0x0e, 0x00
; ; Starting pCode block for Ival
_car4:
	DB	0x04, 0x02, 0x0e, 0x11, 0x1f, 0x10, 0x0e, 0x00
; ; Starting pCode block for Ival
_car5:
	DB	0x04, 0x0a, 0x0e, 0x11, 0x1f, 0x10, 0x0e, 0x00
; ; Starting pCode block for Ival
_car6:
	DB	0x0a, 0x00, 0x0e, 0x11, 0x1f, 0x10, 0x0e, 0x00
; ; Starting pCode block for Ival
_car7:
	DB	0x07, 0x08, 0x1e, 0x08, 0x1e, 0x08, 0x07, 0x00
; ; Starting pCode block for Ival
_car8:
	DB	0x04, 0x0a, 0x0c, 0x04, 0x04, 0x04, 0x0e, 0x00
; ; Starting pCode block for Ival
_car9:
	DB	0x0a, 0x00, 0x0c, 0x04, 0x04, 0x04, 0x0e, 0x00
; ; Starting pCode block for Ival
_car10:
	DB	0x04, 0x0a, 0x0e, 0x11, 0x11, 0x11, 0x0e, 0x00
; ; Starting pCode block for Ival
_car11:
	DB	0x04, 0x02, 0x11, 0x11, 0x11, 0x13, 0x0d, 0x00
; ; Starting pCode block for Ival
_car12:
	DB	0x04, 0x0a, 0x11, 0x11, 0x11, 0x13, 0x0d, 0x00
; ; Starting pCode block
__str_2:
	DB	0x25, 0x30, 0x32, 0x75, 0x3a, 0x25, 0x30, 0x32, 0x75, 0x3a, 0x25, 0x30
	DB	0x32, 0x75, 0x00
; ; Starting pCode block
__str_3:
	DB	0x20, 0x20, 0x20, 0x6c, 0x63, 0x64, 0x69, 0x32, 0x63, 0x20, 0x64, 0x65
	DB	0x6d, 0x6f, 0x20, 0x20, 0x00
; ; Starting pCode block
__str_4:
	DB	0x20, 0x52, 0x65, 0x67, 0x69, 0x73, 0x20, 0x42, 0x6c, 0x61, 0x6e, 0x63
	DB	0x68, 0x6f, 0x74, 0x20, 0x00


; Statistics:
; code size:	 7842 (0x1ea2) bytes ( 5.98%)
;           	 3921 (0x0f51) words
; udata size:	  150 (0x0096) bytes ( 8.37%)
; access size:	   27 (0x001b) bytes


	end
