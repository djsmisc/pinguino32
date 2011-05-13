;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Aug  9 2009) (UNIX)
; This file was generated Sun Dec 26 18:23:18 2010
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f2550

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _rx
	global _wpointer
	global _rpointer
	global _caractere
	global _chaine
	global _printf
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


	idata
_chaine	db	0x54, 0x45, 0x53, 0x54, 0x00


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
_putchar	res	3

udata_main_1	udata
_printi_print_buf_1_1	res	12

udata_main_2	udata
_print_scr_1_1	res	2

udata_main_3	udata
_wpointer	res	1

udata_main_4	udata
_rpointer	res	1

udata_main_5	udata
_rx	res	128

udata_main_6	udata
_caractere	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__high_priority_isr	code	0X002020
_high_priority_isr:
;	.line	96; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	void high_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
;	.line	119; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	if (PIR1bits.RCIF) 
	MOVFF	PCLATU, POSTDEC1
; #	MOVFF	FSR1L, FSR2L
; #	BTFSS	_PIR1bits, 5
; #	GOTO	_00479_DS_
; #	CALL	_serial_interrupt
; #	MOVFF	PREINC1, FSR2L
;	.line	120; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	serial_interrupt();
	BTFSC	_PIR1bits, 5
	CALL	_serial_interrupt
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
;	.line	140; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	void low_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	142; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	}
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
;	.line	52; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	PIE1=0;
	CLRF	_PIE1
;	.line	53; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	PIE2=0;
	CLRF	_PIE2
;	.line	54; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	ADCON1=0x0F;
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	59; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	setup();
	CALL	_setup
;	.line	75; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	INTCONbits.PEIE=1;
	BSF	_INTCONbits, 6
;	.line	76; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	INTCONbits.GIE=1;
	BSF	_INTCONbits, 7
_00470_DS_:
;	.line	89; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	loop();
	CALL	_loop
	BRA	_00470_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	12; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/user.c	void loop()
	MOVFF	r0x00, POSTDEC1
;	.line	14; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/user.c	serial_write("TEST\n\r");
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_serial_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	15; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/user.c	if (serial_available()) {
	CALL	_serial_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00464_DS_
;	.line	16; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/user.c	serial_write("caractere");
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	CALL	_serial_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	17; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/user.c	caractere=serial_read();
	CALL	_serial_read
	BANKSEL	_caractere
	MOVWF	_caractere, B
;	.line	18; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/user.c	serial_write(chaine);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_chaine)
	MOVWF	POSTDEC1
	MOVLW	LOW(_chaine)
	MOVWF	POSTDEC1
	CALL	_serial_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	19; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/user.c	serial_write(&caractere);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_caractere)
	MOVWF	POSTDEC1
	MOVLW	LOW(_caractere)
	MOVWF	POSTDEC1
	CALL	_serial_write
	MOVLW	0x03
	ADDWF	FSR1L, F
_00464_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	9; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/user.c	serial_begin(9600);
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
;	.line	40; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	39; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	void epapin_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	38; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	void epap_out() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	37; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/source/main.c	void epap_in() { return; }
	RETURN	

; ; Starting pCode block
S_main__serial_write	code
_serial_write:
;	.line	173; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_write(char *fmt,...)
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
;	.line	179; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	va_start(ap,fmt);
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
;	.line	180; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	s=va_start(ap,fmt);
	MOVLW	0x80
;	.line	181; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	switch (*s)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	CALL	__gptrget1
	MOVWF	r0x00
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00424_DS_
	MOVLW	0x06
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00424_DS_
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
	MOVLW	UPPER(_00432_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00432_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00432_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00432_DS_:
	GOTO	_00419_DS_
	GOTO	_00421_DS_
	GOTO	_00420_DS_
	GOTO	_00422_DS_
	GOTO	_00423_DS_
_00419_DS_:
;	.line	183; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case DEC:       serial_printf("%d",(int)fmt);
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
;	.line	184; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;
	BRA	_00426_DS_
_00420_DS_:
;	.line	185; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case HEX: 		serial_printf("%x",(int)fmt);
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
;	.line	186; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;
	BRA	_00426_DS_
_00421_DS_:
;	.line	187; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case BYTE: 		serial_printf("%d",(unsigned char)fmt);
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
;	.line	188; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;
	BRA	_00426_DS_
_00422_DS_:
;	.line	189; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case OCTAL:     uitoa((int)fmt,chaine,8);
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
;	.line	190; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	serial_printf(chaine);
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
;	.line	191; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;
	BRA	_00426_DS_
_00423_DS_:
;	.line	192; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	case BIN:       uitoa((int)fmt,chaine,2);
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
;	.line	193; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	serial_printf(chaine);
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
;	.line	194; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	break;           
	BRA	_00426_DS_
_00424_DS_:
;	.line	195; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	default:	serial_printf(fmt);
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
_00426_DS_:
;	.line	198; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	va_end(ap);
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
S_main__uitoa	code
_uitoa:
;	.line	149; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	static void uitoa(unsigned int num, char * bf, unsigned int base)
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
;	.line	152; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	unsigned int d=1;
	MOVLW	0x01
	MOVWF	r0x07
	CLRF	r0x08
_00390_DS_:
;	.line	154; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	while (num/d >= base)
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
	BNZ	_00412_DS_
	MOVF	r0x05, W
	SUBWF	r0x09, W
_00412_DS_:
	BNC	_00409_DS_
;	.line	155; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	d*=base;		
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
	BRA	_00390_DS_
_00409_DS_:
;	.line	157; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	while (d!=0)
	CLRF	r0x09
	CLRF	r0x0a
_00397_DS_:
	MOVF	r0x07, W
	IORWF	r0x08, W
	BTFSC	STATUS, 2
	BRA	_00399_DS_
;	.line	159; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	int dgt = num / d;
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
;	.line	160; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	num%= d;
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
;	.line	161; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	d/=base;
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
;	.line	162; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (n || dgt>0 || d==0)
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BNZ	_00393_DS_
	MOVF	r0x0c, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00413_DS_
	MOVLW	0x01
	SUBWF	r0x0b, W
_00413_DS_:
	BC	_00393_DS_
	MOVF	r0x07, W
	IORWF	r0x08, W
	BTFSS	STATUS, 2
	BRA	_00397_DS_
_00393_DS_:
;	.line	164; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	*bf++ = dgt+(dgt<10 ? '0' : 'A'-10);
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
	BNZ	_00414_DS_
	MOVLW	0x0a
	SUBWF	r0x0b, W
_00414_DS_:
	BC	_00402_DS_
	MOVLW	0x30
	MOVWF	r0x0b
	BRA	_00403_DS_
_00402_DS_:
	MOVLW	0x37
	MOVWF	r0x0b
_00403_DS_:
	MOVF	r0x0b, W
	ADDWF	r0x10, F
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x0d, FSR0L
	MOVFF	r0x0e, PRODL
	MOVF	r0x0f, W
	CALL	__gptrput1
;	.line	165; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	++n;
	INCF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
	BRA	_00397_DS_
_00399_DS_:
;	.line	168; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	*bf=0;
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
S_main__serial_printf	code
_serial_printf:
;	.line	136; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_printf(char *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	140; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	va_start(args, fmt);
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
;	.line	141; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	printf(serial_putchar, fmt, args);
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
;	.line	142; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	va_end(args);
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__serial_getkey	code
_serial_getkey:
;	.line	126; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	unsigned char serial_getkey()
	MOVFF	r0x00, POSTDEC1
_00377_DS_:
;	.line	129; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	while (!(serial_available()));
	CALL	_serial_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00377_DS_
;	.line	130; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	c = serial_read();
	CALL	_serial_read
	MOVWF	r0x00
;	.line	131; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	serial_flush();
	CALL	_serial_flush
;	.line	132; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	return (c);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_flush	code
_serial_flush:
; #	MOVLW	0x01
; #	MOVWF	_wpointer, B
; #	MOVLW	0x01
;	.line	120; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	wpointer=1;
	MOVLW	0x01
	BANKSEL	_wpointer
;	.line	121; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	rpointer=1;
	MOVWF	_wpointer, B
	BANKSEL	_rpointer
	MOVWF	_rpointer, B
	RETURN	

; ; Starting pCode block
S_main__serial_read	code
_serial_read:
;	.line	104; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	unsigned char serial_read()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	106; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	unsigned char caractere=0;
	CLRF	r0x00
;	.line	108; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (serial_available())
	CALL	_serial_available
	MOVWF	r0x01
	MOVF	r0x01, W
	BZ	_00361_DS_
;	.line	110; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	caractere=rx[rpointer++];
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
;	.line	111; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (rpointer==RXBUFFERLENGTH)
	MOVF	_rpointer, W, B
	XORLW	0x80
	BNZ	_00361_DS_
;	.line	112; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	rpointer=1;
	MOVLW	0x01
	BANKSEL	_rpointer
	MOVWF	_rpointer, B
_00361_DS_:
;	.line	114; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	return(caractere);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_interrupt	code
_serial_interrupt:
;	.line	84; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_interrupt(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	89; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	PIR1bits.RCIF=0;				// clear RX interrupt flag
	BCF	_PIR1bits, 5
;	.line	90; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	caractere=RCREG;				// take received char
	MOVFF	_RCREG, r0x00
	BANKSEL	_wpointer
;	.line	91; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (wpointer!=RXBUFFERLENGTH-1)	// if not last place in buffer
	MOVF	_wpointer, W, B
	XORLW	0x7f
	BZ	_00337_DS_
_00349_DS_:
	BANKSEL	_wpointer
;	.line	92; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	newwp=wpointer+1;			// place=place+1
	INCF	_wpointer, W, B
	MOVWF	r0x01
	BRA	_00338_DS_
_00337_DS_:
;	.line	94; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	newwp=1;					// else place=1
	MOVLW	0x01
	MOVWF	r0x01
_00338_DS_:
	BANKSEL	_rpointer
;	.line	96; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (rpointer!=newwp)			// if read pointer!=write pointer
	MOVF	_rpointer, W, B
	XORWF	r0x01, W
	BZ	_00340_DS_
;	.line	97; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	rx[wpointer++]=caractere;	// store received char
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
_00340_DS_:
	BANKSEL	_wpointer
;	.line	99; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	if (wpointer==RXBUFFERLENGTH)	// if write pointer=length buffer
	MOVF	_wpointer, W, B
	XORLW	0x80
	BNZ	_00343_DS_
;	.line	100; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	wpointer=1;					// write pointer = 1
	MOVLW	0x01
	BANKSEL	_wpointer
	MOVWF	_wpointer, B
_00343_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_putchar	code
_serial_putchar:
;	.line	77; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_putchar(unsigned char caractere)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
_00328_DS_:
;	.line	79; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	while (!TXSTAbits.TRMT);
	BTFSS	_TXSTAbits, 1
	BRA	_00328_DS_
;	.line	80; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	TXREG=caractere;		        // yes, send char
	MOVFF	r0x00, _TXREG
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__serial_available	code
_serial_available:
;	.line	71; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	unsigned char serial_available()
	MOVFF	r0x00, POSTDEC1
;	.line	73; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	return(wpointer!=rpointer);
	CLRF	r0x00
	BANKSEL	_wpointer
	MOVF	_wpointer, W, B
	BANKSEL	_rpointer
	XORWF	_rpointer, W, B
	BNZ	_00323_DS_
	INCF	r0x00, F
_00323_DS_:
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
;	.line	47; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	void serial_begin(unsigned long baudrate)
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
;	.line	52; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	spbrg=(48000000/(4*baudrate))-1;
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
;	.line	53; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	highbyte=spbrg/256;
	MOVF	r0x01, W
;	.line	54; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	lowbyte=spbrg%256;
	MOVWF	r0x04
;	.line	55; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	TXSTAbits.BRGH=1;               	  	// set BRGH bit
	BSF	_TXSTAbits, 2
;	.line	56; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	BAUDCONbits.BRG16=1;					// set 16 bits SPBRG
	BSF	_BAUDCONbits, 3
;	.line	57; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	SPBRGH=highbyte;                        // set UART speed SPBRGH
	MOVFF	r0x04, _SPBRGH
;	.line	58; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	SPBRG=lowbyte;   						// set UART speed SPBRGL
	MOVFF	r0x00, _SPBRG
;	.line	59; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	RCSTA=0x90;                             // set RCEN and SPEN
	MOVLW	0x90
	MOVWF	_RCSTA
;	.line	60; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	BAUDCONbits.RCIDL=1;			// set receive active
	BSF	_BAUDCONbits, 6
;	.line	61; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	PIE1bits.RCIE=1;                        // enable interrupt on RX
	BSF	_PIE1bits, 5
;	.line	62; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	INTCONbits.PEIE=1;                      // enable peripheral interrupts
	BSF	_INTCONbits, 6
;	.line	63; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	IPR1bits.RCIP=1;                        // define high priority for RX interrupt
	BSF	_IPR1bits, 5
; #	MOVLW	0x01
; #	MOVWF	_wpointer, B
; #	MOVLW	0x01
;	.line	64; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	wpointer=1;                             // initialize write pointer
	MOVLW	0x01
	BANKSEL	_wpointer
;	.line	65; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	rpointer=1;                             // initialize read pointer
	MOVWF	_wpointer, B
	BANKSEL	_rpointer
	MOVWF	_rpointer, B
;	.line	66; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	TXSTAbits.TXEN=1;                       // enable TX
	BSF	_TXSTAbits, 5
;	.line	67; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/uart18f2550.c	INTCONbits.GIE=1;
	BSF	_INTCONbits, 7
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
;	.line	245; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int printf(stdout func, const char *format, va_list args)
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
;	.line	251; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return print(0, format, args );
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
;	.line	141; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	static int print(char **out, const char *format, va_list args )
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
;	.line	144; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int pc = 0;
	CLRF	r0x09
	CLRF	r0x0a
_00238_DS_:
;	.line	148; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for (; *format != 0; ++format)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVF	r0x0b, W
	BTFSC	STATUS, 2
	GOTO	_00241_DS_
;	.line	150; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (*format == '%')
	MOVF	r0x0b, W
	XORLW	0x25
	BZ	_00278_DS_
	GOTO	_00234_DS_
_00278_DS_:
;	.line	152; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++format;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
;	.line	153; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	width = pad = 0;
	CLRF	r0x0b
	CLRF	r0x0c
	CLRF	r0x0d
	CLRF	r0x0e
;	.line	154; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (*format == '\0') break;
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0f
	MOVF	r0x0f, W
	BTFSC	STATUS, 2
	GOTO	_00241_DS_
;	.line	155; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (*format == '%') goto out;
	MOVF	r0x0f, W
	XORLW	0x25
	BNZ	_00280_DS_
	GOTO	_00234_DS_
_00280_DS_:
;	.line	156; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (*format == '-')
	MOVF	r0x0f, W
	XORLW	0x2d
	BNZ	_00259_DS_
;	.line	158; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++format;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
;	.line	159; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pad = PAD_RIGHT;
	MOVLW	0x01
	MOVWF	r0x0b
	CLRF	r0x0c
_00259_DS_:
;	.line	161; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	while (*format == '0')
	MOVFF	r0x03, r0x0f
	MOVFF	r0x04, r0x10
	MOVFF	r0x05, r0x11
_00213_DS_:
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	XORLW	0x30
	BNZ	_00245_DS_
;	.line	163; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++format;
	INCF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
;	.line	164; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pad |= PAD_ZERO;
	BSF	r0x0b, 1
	BRA	_00213_DS_
_00245_DS_:
;	.line	166; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	MOVWF	r0x12
	ADDLW	0x80
	ADDLW	0x50
	BNC	_00276_DS_
	MOVF	r0x12, W
	ADDLW	0x80
	ADDLW	0x46
	BC	_00276_DS_
;	.line	168; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	width *= 10;
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
;	.line	169; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	width += *format - '0';
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
;	.line	166; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	INCF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BRA	_00245_DS_
_00276_DS_:
	MOVFF	r0x0f, r0x03
	MOVFF	r0x10, r0x04
	MOVFF	r0x11, r0x05
;	.line	171; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 's' )
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x0f
; #	MOVF	r0x0f, W
	MOVWF	r0x0f
	XORLW	0x73
	BZ	_00289_DS_
	BRA	_00217_DS_
_00289_DS_:
;	.line	174; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	char *s = va_arg(args, char*);
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
;	.line	176; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += prints (out, s?s:"(null)", width, pad);
	IORWF	r0x11, W
; #	IORWF	r0x12, W
; #	BTFSC	STATUS, 2
; #	GOTO	_00251_DS_
; #	GOTO	_00252_DS_
; #	MOVLW	LOW(__str_0)
	IORWF	r0x12, W
	BNZ	_00252_DS_
	MOVLW	LOW(__str_0)
	MOVWF	r0x10
	MOVLW	HIGH(__str_0)
	MOVWF	r0x11
	MOVLW	UPPER(__str_0)
	MOVWF	r0x12
_00252_DS_:
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
;	.line	177; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	GOTO	_00240_DS_
_00217_DS_:
;	.line	179; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'd' )
	MOVF	r0x0f, W
	XORLW	0x64
	BZ	_00291_DS_
	BRA	_00219_DS_
_00291_DS_:
;	.line	181; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 10, 1, width, pad, 'a');
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
;	.line	182; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00240_DS_
_00219_DS_:
;	.line	184; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'x' )
	MOVF	r0x0f, W
	XORLW	0x78
	BZ	_00293_DS_
	BRA	_00221_DS_
_00293_DS_:
;	.line	186; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 16, 0, width, pad, 'a');
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
;	.line	187; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00240_DS_
_00221_DS_:
;	.line	189; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'X' )
	MOVF	r0x0f, W
	XORLW	0x58
	BZ	_00295_DS_
	BRA	_00223_DS_
_00295_DS_:
;	.line	191; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 16, 0, width, pad, 'A');
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
;	.line	192; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00240_DS_
_00223_DS_:
;	.line	194; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'b' )
	MOVF	r0x0f, W
	XORLW	0x62
	BZ	_00297_DS_
	BRA	_00225_DS_
_00297_DS_:
;	.line	196; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 2, 0, width, pad, 'a');
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
;	.line	197; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00240_DS_
_00225_DS_:
;	.line	199; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'o' )
	MOVF	r0x0f, W
	XORLW	0x6f
	BZ	_00299_DS_
	BRA	_00227_DS_
_00299_DS_:
;	.line	201; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 8, 0, width, pad, 'a');
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
;	.line	202; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00240_DS_
_00227_DS_:
;	.line	204; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'u' )
	MOVF	r0x0f, W
	XORLW	0x75
	BZ	_00301_DS_
	BRA	_00229_DS_
_00301_DS_:
;	.line	206; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += printi (out, va_arg(args, int), 10, 0, width, pad, 'a');
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
;	.line	207; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00240_DS_
_00229_DS_:
;	.line	209; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'c' )
	MOVF	r0x0f, W
	XORLW	0x63
	BZ	_00303_DS_
	BRA	_00231_DS_
_00303_DS_:
;	.line	212; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	scr[0] = (char)va_arg( args, int);
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
;	.line	214; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	scr[1] = '\0';
	CLRF	(_print_scr_1_1 + 1), B
;	.line	215; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += prints (out, scr, width, pad);
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
;	.line	216; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00240_DS_
_00231_DS_:
;	.line	218; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( *format == 'f' )
	MOVF	r0x0f, W
	XORLW	0x66
	BNZ	_00240_DS_
;	.line	220; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	pc += prints (out, "not yet implemented\0", width, pad);
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
;	.line	221; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	continue;
	BRA	_00240_DS_
_00234_DS_:
;	.line	227; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, *format);
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
;	.line	228; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	INCF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
_00240_DS_:
;	.line	148; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for (; *format != 0; ++format)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	GOTO	_00238_DS_
_00241_DS_:
;	.line	231; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (out) **out = '\0';
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00243_DS_
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
_00243_DS_:
;	.line	233; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return pc;
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
;	.line	92; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
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
;	.line	96; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int t, neg = 0, pc = 0;
	CLRF	r0x0f
	CLRF	r0x10
	CLRF	r0x11
	CLRF	r0x12
;	.line	97; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	unsigned int u = i;
	MOVFF	r0x03, r0x13
	MOVFF	r0x04, r0x14
;	.line	99; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (i == 0)
	MOVF	r0x03, W
	IORWF	r0x04, W
	BNZ	_00169_DS_
;	.line	101; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	print_buf[0] = '0';
	MOVLW	0x30
	BANKSEL	_printi_print_buf_1_1
	MOVWF	_printi_print_buf_1_1, B
; removed redundant BANKSEL
;	.line	102; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	print_buf[1] = '\0';
	CLRF	(_printi_print_buf_1_1 + 1), B
;	.line	103; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return prints (out, print_buf, width, pad);
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
	BRA	_00185_DS_
_00169_DS_:
;	.line	106; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (sg && b == 10 && i < 0)
	MOVF	r0x07, W
	IORWF	r0x08, W
	BZ	_00171_DS_
	MOVF	r0x05, W
	XORLW	0x0a
	BNZ	_00198_DS_
	MOVF	r0x06, W
	BZ	_00199_DS_
_00198_DS_:
	BRA	_00171_DS_
_00199_DS_:
	BSF	STATUS, 0
	BTFSS	r0x04, 7
	BCF	STATUS, 0
	BNC	_00171_DS_
;	.line	108; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	neg = 1;
	MOVLW	0x01
	MOVWF	r0x0f
	CLRF	r0x10
;	.line	109; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	u = -i;
	COMF	r0x04, W
	MOVWF	r0x14
	COMF	r0x03, W
	MOVWF	r0x13
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00171_DS_:
;	.line	112; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	s = print_buf + PRINT_BUF_LEN-1;
	MOVLW	HIGH(_printi_print_buf_1_1 + 11)
	MOVWF	r0x04
	MOVLW	LOW(_printi_print_buf_1_1 + 11)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x07
;	.line	113; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	*s = '\0';
	CLRF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	CALL	__gptrput1
;	.line	115; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	while (u)
	MOVF	r0x0d, W
	ADDLW	0xc6
	MOVWF	r0x0d
	MOVFF	r0x05, r0x0e
	MOVFF	r0x06, r0x15
	MOVFF	r0x03, r0x16
	MOVFF	r0x04, r0x17
	MOVFF	r0x07, r0x18
_00176_DS_:
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00197_DS_
;	.line	117; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	t = u % b;
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
;	.line	118; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( t >= 10 )
	MOVF	r0x1a, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00201_DS_
	MOVLW	0x0a
	SUBWF	r0x19, W
_00201_DS_:
	BNC	_00175_DS_
;	.line	119; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	t += letbase - '0' - 10;
	MOVF	r0x0d, W
	ADDWF	r0x19, F
_00175_DS_:
;	.line	120; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	*--s = t + '0';
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
;	.line	121; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	u /= b;
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
	BRA	_00176_DS_
_00197_DS_:
	MOVFF	r0x16, r0x03
	MOVFF	r0x17, r0x04
	MOVFF	r0x18, r0x07
;	.line	124; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (neg)
	MOVF	r0x0f, W
	IORWF	r0x10, W
	BZ	_00184_DS_
;	.line	126; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if( width && (pad & PAD_ZERO) )
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BZ	_00180_DS_
	BTFSS	r0x0b, 1
	BRA	_00180_DS_
;	.line	128; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, '-');
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
;	.line	129; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	MOVLW	0x01
	MOVWF	r0x11
	CLRF	r0x12
;	.line	130; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	--width;
	MOVLW	0xff
	ADDWF	r0x09, F
	BTFSS	STATUS, 0
	DECF	r0x0a, F
	BRA	_00184_DS_
_00180_DS_:
;	.line	134; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	*--s = '-';
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
_00184_DS_:
;	.line	138; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return pc + prints (out, s, width, pad);
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
_00185_DS_:
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
;	.line	53; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	static int prints(char **out, const char *string, int width, int pad)
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
;	.line	55; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int pc = 0;
	CLRF	r0x0a
	CLRF	r0x0b
;	.line	56; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	int padchar = ' ';
	MOVLW	0x20
	MOVWF	r0x0c
;	.line	60; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (width > 0)
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00158_DS_
	MOVLW	0x01
	SUBWF	r0x06, W
_00158_DS_:
	BNC	_00122_DS_
;	.line	62; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for (ptr = string; *ptr; ++ptr) ++len;
	CLRF	r0x0e
	CLRF	r0x0f
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
_00125_DS_:
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x13
	MOVF	r0x13, W
	BZ	_00128_DS_
	INCF	r0x0e, F
	BTFSC	STATUS, 0
	INCF	r0x0f, F
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	BRA	_00125_DS_
_00128_DS_:
;	.line	63; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (len >= width) width = 0;
	MOVF	r0x0f, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x07, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00159_DS_
	MOVF	r0x06, W
	SUBWF	r0x0e, W
_00159_DS_:
	BNC	_00117_DS_
	CLRF	r0x06
	CLRF	r0x07
	BRA	_00118_DS_
_00117_DS_:
;	.line	64; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	else width -= len;
	MOVF	r0x0e, W
	SUBWF	r0x06, F
	MOVF	r0x0f, W
	SUBWFB	r0x07, F
_00118_DS_:
;	.line	65; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (pad & PAD_ZERO) padchar = '0';
	BTFSS	r0x08, 1
	BRA	_00122_DS_
	MOVLW	0x30
	MOVWF	r0x0c
_00122_DS_:
;	.line	67; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (!(pad & PAD_RIGHT))
	BTFSC	r0x08, 0
	BRA	_00151_DS_
	CLRF	r0x08
	CLRF	r0x09
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
_00129_DS_:
;	.line	69; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; width > 0; --width)
	MOVF	r0x0f, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00162_DS_
	MOVLW	0x01
	SUBWF	r0x0e, W
_00162_DS_:
	BNC	_00155_DS_
; #	MOVF	r0x0c, W
; #	MOVWF	r0x10
; #	MOVF	r0x10, W
;	.line	71; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, padchar);
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
;	.line	72; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	69; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; width > 0; --width)
	MOVLW	0xff
	ADDWF	r0x0e, F
	BTFSS	STATUS, 0
	DECF	r0x0f, F
	BRA	_00129_DS_
_00155_DS_:
	MOVFF	r0x08, r0x0a
	MOVFF	r0x09, r0x0b
	MOVFF	r0x0e, r0x06
	MOVFF	r0x0f, r0x07
_00151_DS_:
	MOVFF	r0x0a, r0x08
	MOVFF	r0x0b, r0x09
_00133_DS_:
;	.line	75; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; *string ; ++string)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0a
	MOVF	r0x0a, W
	BZ	_00153_DS_
;	.line	77; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, *string);
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
;	.line	78; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	75; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; *string ; ++string)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BRA	_00133_DS_
_00153_DS_:
	MOVFF	r0x08, r0x03
	MOVFF	r0x09, r0x04
	MOVFF	r0x06, r0x05
	MOVFF	r0x07, r0x06
_00137_DS_:
;	.line	80; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; width > 0; --width)
	MOVF	r0x06, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00163_DS_
	MOVLW	0x01
	SUBWF	r0x05, W
_00163_DS_:
	BNC	_00140_DS_
; #	MOVF	r0x0c, W
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
;	.line	82; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	printchar (out, padchar);
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
;	.line	83; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++pc;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
;	.line	80; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	for ( ; width > 0; --width)
	MOVLW	0xff
	ADDWF	r0x05, F
	BTFSS	STATUS, 0
	DECF	r0x06, F
	BRA	_00137_DS_
_00140_DS_:
;	.line	86; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	return pc;
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
;	.line	34; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	static void printchar(char **str, char c)
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
;	.line	38; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	if (str)
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00106_DS_
;	.line	40; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	**str = c;
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
;	.line	41; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	++(*str);
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
	BRA	_00108_DS_
_00106_DS_:
;	.line	46; /home/mandon/programmation/pinguino developpement/pinguino_beta9-05_linux/tools/bin/../share/sdcc/include/pic16/stdlib.c	putchar(c);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00111_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00111_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00111_DS_)
	MOVWF	TOSU
	MOVF	PREINC1, W
	MOVWF	INTCON
	MOVFF	(_putchar + 2), PCLATU
	MOVFF	(_putchar + 1), PCLATH
	BANKSEL	_putchar
	MOVF	_putchar, W, B
	MOVWF	PCL
_00111_DS_:
	MOVLW	0x01
	ADDWF	FSR1L, F
_00108_DS_:
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
	DB	0x54, 0x45, 0x53, 0x54, 0x0a, 0x0d, 0x00
; ; Starting pCode block
__str_5:
	DB	0x63, 0x61, 0x72, 0x61, 0x63, 0x74, 0x65, 0x72, 0x65, 0x00


; Statistics:
; code size:	 5830 (0x16c6) bytes ( 4.45%)
;           	 2915 (0x0b63) words
; udata size:	  148 (0x0094) bytes ( 8.26%)
; access size:	   27 (0x001b) bytes


	end
