;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8178 (Oct 30 2012) (Linux)
; This file was generated Wed Nov  7 18:45:39 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f4550
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_preloadL
	global	_preloadH
	global	_intCountLimit
	global	_intCount
	global	__currline
	global	__initialized
	global	__rw_pin
	global	__lcd_pulseEnable
	global	__lcd_write4bits
	global	__lcd_write8bits
	global	__lcd_send
	global	__lcd_write
	global	__lcd_command
	global	__lcd_setCursor
	global	__lcd_print
	global	__lcd_printf
	global	__lcd_printNumber
	global	__lcd_printFloat
	global	__lcd_home
	global	__lcd_clear
	global	__lcd_noDisplay
	global	__lcd_display
	global	__lcd_noCursor
	global	__lcd_cursor
	global	__lcd_noBlink
	global	__lcd_blink
	global	__lcd_scrollDisplayLeft
	global	__lcd_scrollDisplayRight
	global	__lcd_leftToRight
	global	__lcd_rightToLeft
	global	__lcd_autoscroll
	global	__lcd_noAutoscroll
	global	__lcd_begin
	global	__lcd_init
	global	__lcd_pins
	global	__gie_status_
	global	__rs_pin
	global	__enable_pin
	global	__data_pins
	global	__displayfunction
	global	__displaycontrol
	global	__displaymode
	global	__numlines
	global	_intUsed
	global	__millis
	global	_SystemUnlock
	global	_SystemLock
	global	_SystemReset
	global	_epap_in
	global	_epap_out
	global	_epapin_init
	global	_epapout_init
	global	_Delayms
	global	_Delayus
	global	_digitalwrite
	global	_digitalread
	global	_pinmode
	global	_toggle
	global	_pprintf
	global	_psprintf2
	global	_psprintf
	global	_detachInterrupt
	global	_int_init
	global	_int_start
	global	_int_stop
	global	_userhighinterrupt
	global	_userlowinterrupt
	global	_millis_init
	global	_millis
	global	_IOsetSpecial
	global	_IOsetDigital
	global	_IOsetRemap
	global	_setup
	global	_loop
	global	_pinguino_main
	global	_high_priority_isr
	global	_low_priority_isr
	global	_mask
	global	_port

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrget1
	extern	__gptrput1
	extern	__gptrget3
	extern	__gptrput3
	extern	__gptrget4
	extern	__gptrget2
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
	extern	_usb_device_state
	extern	_usb_active_cfg
	extern	_usb_active_alt_setting
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
	extern	_delay10ktcy
	extern	__modulong
	extern	__divulong
	extern	__moduint
	extern	__divuint
	extern	___fslt
	extern	___fsdiv
	extern	___fsadd
	extern	___fs2uint
	extern	___uint2fs
	extern	___fssub
	extern	___fsmul
	extern	___sint2fs

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
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
INDF0	equ	0xfef
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
__gie_status_	db	0x00
__rs_pin	db	0x08
__rw_pin	db	0xff
__enable_pin	db	0x09


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
r0x1b	res	1
r0x1c	res	1
r0x1d	res	1
r0x1e	res	1
r0x1f	res	1
r0x20	res	1

udata_main_0	udata
__initialized	res	1

udata_main_1	udata
__currline	res	1

udata_main_2	udata
_pputchar	res	3

udata_main_3	udata
_intFunction	res	63

udata_main_4	udata
_intCount	res	8

udata_main_5	udata
_intCountLimit	res	8

udata_main_6	udata
_preloadH	res	4

udata_main_7	udata
_preloadL	res	4

udata_main_8	udata
_pprinti_buffer_1_74	res	12

udata_main_9	udata
_pprintfl_buffer_1_82	res	12

udata_main_10	udata
_pprintfl_tmp_1_82	res	12

udata_main_11	udata
_pprintfl_helper_1_82	res	4

udata_main_12	udata
_pprint_scr_1_96	res	2

udata_main_13	udata
_psprintf2_out_1_117	res	3

udata_main_14	udata
__data_pins	res	8

udata_main_15	udata
__displayfunction	res	1

udata_main_16	udata
__lcd_setCursor_row_offsets_1_136	res	4

udata_main_17	udata
__numlines	res	1

udata_main_18	udata
__lcd_printNumber_buf_1_143	res	32

udata_main_19	udata
__displaycontrol	res	1

udata_main_20	udata
__displaymode	res	1

udata_main_21	udata
_intUsed	res	21

udata_main_22	udata
__millis	res	4

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__high_priority_isr	code	0X002020
_high_priority_isr:
;	.line	160; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	void high_priority_isr(void) __interrupt 1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	214; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	if (INTCONbits.TMR0IF)
	BTFSS	_INTCONbits, 2
	BRA	_01143_DS_
;	.line	216; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	INTCONbits.TMR0IF=0;
	BCF	_INTCONbits, 2
;	.line	217; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	TMR0H=0xE8;
	MOVLW	0xe8
	MOVWF	_TMR0H
;	.line	218; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	TMR0L=0x50;
	MOVLW	0x50
	MOVWF	_TMR0L
	BANKSEL	__millis
;	.line	219; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	_millis++;
	INCF	__millis, F, B
	BNC	_01143_DS_
; removed redundant BANKSEL
	INCF	(__millis + 1), F, B
	BNC	_01143_DS_
; removed redundant BANKSEL
	INCFSZ	(__millis + 2), F, B
	BRA	_21154_DS_
; removed redundant BANKSEL
	INCF	(__millis + 3), F, B
_21154_DS_:
_01148_DS_:
_01143_DS_:
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVF	PREINC1, W
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	RETFIE	

; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_main_ivec_0x1_high_priority_isr	code	0X000008
ivec_0x1_high_priority_isr:
	GOTO	_high_priority_isr

; ; Starting pCode block
S_main__low_priority_isr	code	0X004000
_low_priority_isr:
;	.line	251; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	void low_priority_isr(void) __interrupt 2
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	266; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	userlowinterrupt();
	CALL	_userlowinterrupt
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVF	PREINC1, W
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	RETFIE	

; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_main_ivec_0x2_low_priority_isr	code	0X000018
ivec_0x2_low_priority_isr:
	GOTO	_low_priority_isr

; I code from now on!
; ; Starting pCode block
S_main__pinguino_main	code
_pinguino_main:
;	.line	79; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	PIE1 = 0;
	CLRF	_PIE1
;	.line	80; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	PIE2 = 0;
	CLRF	_PIE2
;	.line	82; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	IOsetSpecial();
	CALL	_IOsetSpecial
;	.line	83; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	IOsetDigital();
	CALL	_IOsetDigital
;	.line	84; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	IOsetRemap();
	CALL	_IOsetRemap
;	.line	87; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	int_init();					// Disable all individual interrupts
	CALL	_int_init
;	.line	107; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	millis_init();
	CALL	_millis_init
;	.line	144; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	setup();
	CALL	_setup
;	.line	146; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	int_start();				// Enable all defined timers interrupts
	CALL	_int_start
_01134_DS_:
;	.line	150; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	loop();
	CALL	_loop
	BRA	_01134_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	52; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	void loop() {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	55; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	_lcd_setCursor(0, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	__lcd_setCursor
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	57; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	_lcd_printf("Uptime: %ds", millis()/1000);
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divulong
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
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	__lcd_printf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	59; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	Delayms(100);
	CLRF	POSTDEC1
	MOVLW	0x64
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	44; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	_lcd_pins(0, 1, 2, 3, 4, 5, 0, 0, 0, 0); 
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	__lcd_pins
	MOVLW	0x0a
	ADDWF	FSR1L, F
;	.line	47; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	_lcd_begin(16, 2);
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	__lcd_begin
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	49; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	_lcd_print("Hello, World!");
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	CALL	__lcd_print
	MOVLW	0x03
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__IOsetRemap	code
_IOsetRemap:
;	.line	110; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	}
	RETURN	

; ; Starting pCode block
S_main__IOsetDigital	code
_IOsetDigital:
;	.line	44; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	ADCON1 = 0x0F;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
	RETURN	

; ; Starting pCode block
S_main__IOsetSpecial	code
_IOsetSpecial:
;	.line	38; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	}
	RETURN	

; ; Starting pCode block
S_main__millis	code
_millis:
;	.line	25; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/millis.c	return(_millis);
	MOVFF	(__millis + 3), FSR0L
	MOVFF	(__millis + 2), PRODH
	MOVFF	(__millis + 1), PRODL
	BANKSEL	__millis
	MOVF	__millis, W, B
	RETURN	

; ; Starting pCode block
S_main__millis_init	code
_millis_init:
;	.line	17; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/millis.c	intUsed[INT_TMR0] = INT_USED;
	MOVLW	0x01
	BANKSEL	_intUsed
	MOVWF	_intUsed, B
;	.line	18; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/millis.c	T0CON = 0x80;		// TMR0 on, 16 bits counter, prescaler=2
	MOVLW	0x80
	MOVWF	_T0CON
;	.line	19; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/millis.c	INTCON |= 0xA0;		// set GIE and TMR0IE
	MOVLW	0xa0
	IORWF	_INTCON, F
	BANKSEL	__millis
;	.line	20; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/millis.c	_millis = 0;
	CLRF	__millis, B
; removed redundant BANKSEL
	CLRF	(__millis + 1), B
; removed redundant BANKSEL
	CLRF	(__millis + 2), B
; removed redundant BANKSEL
	CLRF	(__millis + 3), B
	RETURN	

; ; Starting pCode block
S_main__userlowinterrupt	code
_userlowinterrupt:
;	.line	1179; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	int_start();
	CALL	_int_start
	RETURN	

; ; Starting pCode block
S_main__userhighinterrupt	code
_userhighinterrupt:
;	.line	993; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__int_stop	code
_int_stop:
;	.line	238; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__int_start	code
_int_start:
;	.line	206; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__int_init	code
_int_init:
;	.line	164; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	void int_init()
	MOVFF	r0x00, POSTDEC1
;	.line	168; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	RCONbits.IPEN = 1;					// Enable HP/LP interrupts
	BSF	_RCONbits, 7
;	.line	169; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	INTCONbits.GIEH = 1;				// Enable HP interrupts
	BSF	_INTCONbits, 7
;	.line	170; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	INTCONbits.GIEL = 1;				// Enable LP interrupts
	BSF	_INTCONbits, 6
;	.line	172; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	for (i = 0; i < INT_NUM; i++)		// Disable all interrupts
	CLRF	r0x00
_01060_DS_:
	MOVLW	0x15
	SUBWF	r0x00, W
	BC	_01064_DS_
;	.line	173; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	detachInterrupt(i);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_detachInterrupt
	MOVF	POSTINC1, F
;	.line	172; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	for (i = 0; i < INT_NUM; i++)		// Disable all interrupts
	INCF	r0x00, F
	BRA	_01060_DS_
_01064_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__detachInterrupt	code
_detachInterrupt:
;	.line	64; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	void detachInterrupt(u8 inter)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	66; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	intUsed[inter] = INT_NOT_USED;	// This interrupt is no longer used
	MOVLW	LOW(_intUsed)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_intUsed)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	CLRF	INDF0
;	.line	68; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	switch(inter)
	MOVLW	0x15
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_01049_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x00, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_01055_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_01055_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_01055_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_01055_DS_:
	GOTO	_01031_DS_
	GOTO	_01032_DS_
	GOTO	_01033_DS_
	GOTO	_01034_DS_
	GOTO	_01049_DS_
	GOTO	_01028_DS_
	GOTO	_01029_DS_
	GOTO	_01030_DS_
	GOTO	_01035_DS_
	GOTO	_01040_DS_
	GOTO	_01041_DS_
	GOTO	_01043_DS_
	GOTO	_01038_DS_
	GOTO	_01039_DS_
	GOTO	_01037_DS_
	GOTO	_01042_DS_
	GOTO	_01044_DS_
	GOTO	_01046_DS_
	GOTO	_01045_DS_
	GOTO	_01036_DS_
	GOTO	_01047_DS_
_01028_DS_:
;	.line	71; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	INTCONbits.INT0IE = INT_DISABLE;
	BCF	_INTCONbits, 4
;	.line	72; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01029_DS_:
;	.line	74; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	INTCON3bits.INT1IE = INT_DISABLE;
	BCF	_INTCON3bits, 3
;	.line	75; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01030_DS_:
;	.line	77; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	INTCON3bits.INT2IE = INT_DISABLE;
	BCF	_INTCON3bits, 4
;	.line	78; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01031_DS_:
;	.line	80; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	INTCONbits.TMR0IE = INT_DISABLE;
	BCF	_INTCONbits, 5
;	.line	81; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01032_DS_:
;	.line	83; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE1bits.TMR1IE = INT_DISABLE;
	BCF	_PIE1bits, 0
;	.line	84; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01033_DS_:
;	.line	86; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE1bits.TMR2IE = INT_DISABLE;
	BCF	_PIE1bits, 1
;	.line	87; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01034_DS_:
;	.line	89; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE2bits.TMR3IE = INT_DISABLE;
	BCF	_PIE2bits, 1
;	.line	90; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01035_DS_:
;	.line	97; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	INTCONbits.RBIE = INT_DISABLE;
	BCF	_INTCONbits, 3
;	.line	98; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01036_DS_:
;	.line	100; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE2bits.USBIE = INT_DISABLE;
	BCF	_PIE2bits, 5
;	.line	101; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01037_DS_:
;	.line	103; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE1bits.ADIE = INT_DISABLE;
	BCF	_PIE1bits, 6
;	.line	104; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01038_DS_:
;	.line	106; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE1bits.RCIE = INT_DISABLE;
	BCF	_PIE1bits, 5
;	.line	107; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01039_DS_:
;	.line	109; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE1bits.TXIE = INT_DISABLE;
	BCF	_PIE1bits, 4
;	.line	110; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01040_DS_:
;	.line	112; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE1bits.CCP1IE = INT_DISABLE;
	BCF	_PIE1bits, 2
;	.line	113; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01041_DS_:
;	.line	115; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE2bits.CCP2IE = INT_DISABLE;
	BCF	_PIE2bits, 0
;	.line	116; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01042_DS_:
;	.line	118; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE2bits.OSCFIE = INT_DISABLE;
	BCF	_PIE2bits, 7
;	.line	119; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01043_DS_:
;	.line	122; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE2bits.CMIE = INT_DISABLE;
	BCF	_PIE2bits, 6
;	.line	127; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01044_DS_:
;	.line	130; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE2bits.EEIE = INT_DISABLE;
	BCF	_PIE2bits, 4
;	.line	131; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01045_DS_:
;	.line	135; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE2bits.BCLIE = INT_DISABLE;
	BCF	_PIE2bits, 3
;	.line	140; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01046_DS_:
;	.line	143; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE2bits.HLVDIE = INT_DISABLE;
	BCF	_PIE2bits, 2
;	.line	148; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	break;
	BRA	_01049_DS_
_01047_DS_:
;	.line	151; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	PIE1bits.SSPIE = INT_DISABLE;
	BCF	_PIE1bits, 3
_01049_DS_:
;	.line	154; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/interrupt.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_pins	code
__lcd_pins:
;	.line	396; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_pins(u8 rs, u8 enable, u8 d0, u8 d1, u8 d2, u8 d3, u8 d4, u8 d5, u8 d6, u8 d7)
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
;	.line	398; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_init(((d4 + d5 + d6 + d7)==0), rs, -1, enable, d0, d1, d2, d3, d4, d5, d6, d7);		
	MOVFF	r0x06, r0x0a
	CLRF	r0x0b
	MOVFF	r0x07, r0x0c
	CLRF	r0x0d
	MOVF	r0x0c, W
	ADDWF	r0x0a, F
	MOVF	r0x0d, W
	ADDWFC	r0x0b, F
	MOVFF	r0x08, r0x0c
	MOVF	r0x0c, W
	ADDWF	r0x0a, F
	MOVF	r0x0d, W
	ADDWFC	r0x0b, F
	MOVFF	r0x09, r0x0c
	MOVF	r0x0c, W
	ADDWF	r0x0a, F
	MOVF	r0x0d, W
	ADDWFC	r0x0b, F
	MOVF	r0x0a, W
	BNZ	_01022_DS_
	MOVF	r0x0b, W
	BNZ	_01022_DS_
	CLRF	r0x0a
	INCF	r0x0a, F
	BRA	_01023_DS_
_01022_DS_:
	CLRF	r0x0a
_01023_DS_:
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
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
	SETF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	__lcd_init
	MOVLW	0x0c
	ADDWF	FSR1L, F
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
S_main___lcd_init	code
__lcd_init:
;	.line	358; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_init(u8 fourbitmode, u8 rs, u8 rw, u8 enable, 
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, __rs_pin
	MOVLW	0x04
	MOVFF	PLUSW2, __rw_pin
	MOVLW	0x05
	MOVFF	PLUSW2, __enable_pin
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
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x06
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0d
	MOVFF	PLUSW2, r0x08
;	.line	368; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_data_pins[0] = d0;
	MOVF	r0x01, W
	BANKSEL	__data_pins
	MOVWF	__data_pins, B
;	.line	369; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_data_pins[1] = d1;
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 1), B
;	.line	370; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_data_pins[2] = d2;
	MOVF	r0x03, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 2), B
;	.line	371; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_data_pins[3] = d3; 
	MOVF	r0x04, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 3), B
;	.line	372; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_data_pins[4] = d4;
	MOVF	r0x05, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 4), B
;	.line	373; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_data_pins[5] = d5;
	MOVF	r0x06, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 5), B
;	.line	374; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_data_pins[6] = d6;
	MOVF	r0x07, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 6), B
;	.line	375; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_data_pins[7] = d7; 
	MOVF	r0x08, W
; removed redundant BANKSEL
	MOVWF	(__data_pins + 7), B
;	.line	377; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	pinmode(_rs_pin, OUTPUT);
	CLRF	POSTDEC1
	BANKSEL	__rs_pin
	MOVF	__rs_pin, W, B
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	379; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	pinmode(_enable_pin, OUTPUT);
	CLRF	POSTDEC1
	BANKSEL	__enable_pin
	MOVF	__enable_pin, W, B
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	381; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	if (fourbitmode)
	MOVF	r0x00, W
	BZ	_00985_DS_
	BANKSEL	__displayfunction
;	.line	383; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displayfunction = LCD_4BITMODE | LCD_1LINE | LCD_5x8DOTS;
	CLRF	__displayfunction, B
;	.line	384; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i = 0; i < 4; i++)
	CLRF	r0x00
_00987_DS_:
	MOVLW	0x04
	SUBWF	r0x00, W
	BC	_00995_DS_
;	.line	385; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	pinmode(_data_pins[i], OUTPUT);
	MOVLW	LOW(__data_pins)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(__data_pins)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	384; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i = 0; i < 4; i++)
	INCF	r0x00, F
	BRA	_00987_DS_
_00985_DS_:
;	.line	389; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displayfunction = LCD_8BITMODE | LCD_1LINE | LCD_5x8DOTS;
	MOVLW	0x10
	BANKSEL	__displayfunction
	MOVWF	__displayfunction, B
;	.line	390; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i = 0; i < 8; i++)
	CLRF	r0x00
_00991_DS_:
	MOVLW	0x08
	SUBWF	r0x00, W
	BC	_00995_DS_
;	.line	391; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	pinmode(_data_pins[i], OUTPUT);
	MOVLW	LOW(__data_pins)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(__data_pins)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	390; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i = 0; i < 8; i++)
	INCF	r0x00, F
	BRA	_00991_DS_
_00995_DS_:
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
S_main___lcd_begin	code
__lcd_begin:
;	.line	285; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_begin(u8 lines, u8 dotsize)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	287; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	if (lines > 1)
	MOVLW	0x02
; #	SUBWF	r0x00, W
; #	BTFSS	STATUS, 0
; #	GOTO	_00953_DS_
; #	BSF	__displayfunction, 3, B
; #	MOVFF	r0x00, __numlines
;	.line	288; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displayfunction |= LCD_2LINE;
	SUBWF	r0x00, W
;	.line	290; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_numlines = lines;
	BNC	_11153_DS_
	BANKSEL	__displayfunction
	BSF	__displayfunction, 3, B
_11153_DS_:
	MOVFF	r0x00, __numlines
	BANKSEL	__currline
;	.line	291; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_currline = 0;
	CLRF	__currline, B
;	.line	294; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	if ((dotsize != 0) && (lines == 1))
	MOVF	r0x01, W
	BZ	_00955_DS_
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00955_DS_
_00977_DS_:
	BANKSEL	__displayfunction
;	.line	295; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displayfunction |= LCD_5x10DOTS;
	BSF	__displayfunction, 2, B
_00955_DS_:
;	.line	297; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	Delayms(15); //Pinguino needs it? long delay on startup time!
	CLRF	POSTDEC1
	MOVLW	0x0f
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	300; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	digitalwrite(_rs_pin, LOW);
	CLRF	POSTDEC1
	BANKSEL	__rs_pin
	MOVF	__rs_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	301; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	digitalwrite(_enable_pin, LOW);
	CLRF	POSTDEC1
	BANKSEL	__enable_pin
	MOVF	__enable_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	__displayfunction
;	.line	304; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	if (! (_displayfunction & LCD_8BITMODE) )
	BTFSC	__displayfunction, 4, B
	BRA	_00958_DS_
;	.line	309; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write4bits(0x03);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	__lcd_write4bits
	MOVF	POSTINC1, F
;	.line	310; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	Delayms(5); // wait min 4.1ms
	CLRF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	312; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write4bits(0x03);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	__lcd_write4bits
	MOVF	POSTINC1, F
;	.line	313; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	Delayus(150); // wait min 4.1ms
	CLRF	POSTDEC1
	MOVLW	0x96
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	315; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write4bits(0x03); 
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	__lcd_write4bits
	MOVF	POSTINC1, F
;	.line	316; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	Delayus(150);
	CLRF	POSTDEC1
	MOVLW	0x96
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	318; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write4bits(0x02); 
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__lcd_write4bits
	MOVF	POSTINC1, F
	BRA	_00959_DS_
_00958_DS_:
;	.line	326; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_FUNCTIONSET | _displayfunction);
	MOVLW	0x20
	BANKSEL	__displayfunction
	IORWF	__displayfunction, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
;	.line	327; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	Delayus(4500);  // wait more than 4.1ms
	MOVLW	0x11
	MOVWF	POSTDEC1
	MOVLW	0x94
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	330; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_FUNCTIONSET | _displayfunction);
	MOVLW	0x20
	BANKSEL	__displayfunction
	IORWF	__displayfunction, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
;	.line	331; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	Delayus(150);
	CLRF	POSTDEC1
	MOVLW	0x96
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	334; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_FUNCTIONSET | _displayfunction);
	MOVLW	0x20
	BANKSEL	__displayfunction
	IORWF	__displayfunction, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
_00959_DS_:
;	.line	338; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_FUNCTIONSET | _displayfunction);  
	MOVLW	0x20
	BANKSEL	__displayfunction
	IORWF	__displayfunction, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
;	.line	341; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaycontrol = LCD_DISPLAYON | LCD_CURSOROFF | LCD_BLINKOFF;  
	MOVLW	0x04
	BANKSEL	__displaycontrol
	MOVWF	__displaycontrol, B
;	.line	342; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_display();
	CALL	__lcd_display
;	.line	345; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_clear();
	CALL	__lcd_clear
;	.line	348; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaymode = LCD_ENTRYLEFT | LCD_ENTRYSHIFTDECREMENT;
	MOVLW	0x02
	BANKSEL	__displaymode
	MOVWF	__displaymode, B
;	.line	350; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_ENTRYMODESET | _displaymode);
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_noAutoscroll	code
__lcd_noAutoscroll:
;	.line	279; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_noAutoscroll(void) {
	MOVFF	r0x00, POSTDEC1
	BANKSEL	__displaymode
;	.line	280; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaymode &= ~LCD_ENTRYSHIFTINCREMENT;
	MOVF	__displaymode, W, B
	MOVWF	r0x00
	MOVLW	0xfe
	ANDWF	r0x00, W
; removed redundant BANKSEL
	MOVWF	__displaymode, B
;	.line	281; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_ENTRYMODESET | _displaymode);
	MOVLW	0x04
; removed redundant BANKSEL
	IORWF	__displaymode, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main___lcd_autoscroll	code
__lcd_autoscroll:
	BANKSEL	__displaymode
;	.line	274; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaymode |= LCD_ENTRYSHIFTINCREMENT;
	BSF	__displaymode, 0, B
;	.line	275; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_ENTRYMODESET | _displaymode);
	MOVLW	0x04
; removed redundant BANKSEL
	IORWF	__displaymode, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main___lcd_rightToLeft	code
__lcd_rightToLeft:
;	.line	266; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_rightToLeft(void)
	MOVFF	r0x00, POSTDEC1
	BANKSEL	__displaymode
;	.line	268; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaymode &= ~LCD_ENTRYLEFT;
	MOVF	__displaymode, W, B
	MOVWF	r0x00
	MOVLW	0xfd
	ANDWF	r0x00, W
; removed redundant BANKSEL
	MOVWF	__displaymode, B
;	.line	269; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_ENTRYMODESET | _displaymode);
	MOVLW	0x04
; removed redundant BANKSEL
	IORWF	__displaymode, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main___lcd_leftToRight	code
__lcd_leftToRight:
	BANKSEL	__displaymode
;	.line	261; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaymode |= LCD_ENTRYLEFT;
	BSF	__displaymode, 1, B
;	.line	262; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_ENTRYMODESET | _displaymode);
	MOVLW	0x04
; removed redundant BANKSEL
	IORWF	__displaymode, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main___lcd_scrollDisplayRight	code
__lcd_scrollDisplayRight:
;	.line	255; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_CURSORSHIFT | LCD_DISPLAYMOVE | LCD_MOVERIGHT);
	MOVLW	0x1c
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main___lcd_scrollDisplayLeft	code
__lcd_scrollDisplayLeft:
;	.line	250; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_CURSORSHIFT | LCD_DISPLAYMOVE | LCD_MOVELEFT);
	MOVLW	0x18
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main___lcd_blink	code
__lcd_blink:
	BANKSEL	__displaycontrol
;	.line	243; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaycontrol |= LCD_BLINKON;
	BSF	__displaycontrol, 0, B
;	.line	244; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x08
; removed redundant BANKSEL
	IORWF	__displaycontrol, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main___lcd_noBlink	code
__lcd_noBlink:
;	.line	235; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_noBlink()
	MOVFF	r0x00, POSTDEC1
	BANKSEL	__displaycontrol
;	.line	237; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaycontrol &= ~LCD_BLINKON;
	MOVF	__displaycontrol, W, B
	MOVWF	r0x00
	MOVLW	0xfe
	ANDWF	r0x00, W
; removed redundant BANKSEL
	MOVWF	__displaycontrol, B
;	.line	238; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x08
; removed redundant BANKSEL
	IORWF	__displaycontrol, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main___lcd_cursor	code
__lcd_cursor:
	BANKSEL	__displaycontrol
;	.line	230; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaycontrol |= LCD_CURSORON;
	BSF	__displaycontrol, 1, B
;	.line	231; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x08
; removed redundant BANKSEL
	IORWF	__displaycontrol, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main___lcd_noCursor	code
__lcd_noCursor:
;	.line	222; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_noCursor()
	MOVFF	r0x00, POSTDEC1
	BANKSEL	__displaycontrol
;	.line	224; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaycontrol &= ~LCD_CURSORON;
	MOVF	__displaycontrol, W, B
	MOVWF	r0x00
	MOVLW	0xfd
	ANDWF	r0x00, W
; removed redundant BANKSEL
	MOVWF	__displaycontrol, B
;	.line	225; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x08
; removed redundant BANKSEL
	IORWF	__displaycontrol, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main___lcd_display	code
__lcd_display:
	BANKSEL	__displaycontrol
;	.line	217; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaycontrol |= LCD_DISPLAYON;
	BSF	__displaycontrol, 2, B
;	.line	218; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x08
; removed redundant BANKSEL
	IORWF	__displaycontrol, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main___lcd_noDisplay	code
__lcd_noDisplay:
;	.line	209; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_noDisplay()
	MOVFF	r0x00, POSTDEC1
	BANKSEL	__displaycontrol
;	.line	211; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_displaycontrol &= ~LCD_DISPLAYON;
	MOVF	__displaycontrol, W, B
	MOVWF	r0x00
	MOVLW	0xfb
	ANDWF	r0x00, W
; removed redundant BANKSEL
	MOVWF	__displaycontrol, B
;	.line	212; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_DISPLAYCONTROL | _displaycontrol);
	MOVLW	0x08
; removed redundant BANKSEL
	IORWF	__displaycontrol, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main___lcd_clear	code
__lcd_clear:
;	.line	204; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_CLEARDISPLAY);  // clear display, set cursor position to zero
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
;	.line	205; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	Delayus(2000);  // this command takes a long time!
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0xd0
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main___lcd_home	code
__lcd_home:
;	.line	197; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_RETURNHOME);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
;	.line	198; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	Delayus(2000);
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0xd0
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main___lcd_printFloat	code
__lcd_printFloat:
;	.line	155; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_printFloat(float number, u8 digits)
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
;	.line	162; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	if (number < 0.0)
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	___fslt
	MOVWF	r0x05
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x05, W
	BZ	_00845_DS_
;	.line	164; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write('-');
	MOVLW	0x2d
	MOVWF	POSTDEC1
	CALL	__lcd_write
	MOVF	POSTINC1, F
;	.line	165; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	number = -number;
	BTG	r0x03, 7
_00845_DS_:
;	.line	169; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	rounding = 0.5;
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
	MOVLW	0x3f
	MOVWF	r0x08
;	.line	170; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i=0; i<digits; ++i)
	CLRF	r0x09
_00851_DS_:
	MOVF	r0x04, W
	SUBWF	r0x09, W
	BC	_00854_DS_
;	.line	171; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	rounding /= 10.0;
	MOVLW	0x41
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	___fsdiv
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVFF	FSR0L, r0x08
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	170; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i=0; i<digits; ++i)
	INCF	r0x09, F
	BRA	_00851_DS_
_00854_DS_:
;	.line	173; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	number += rounding;
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	___fsadd
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	176; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	int_part = (u16)number;
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	___fs2uint
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	177; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	remainder = number - (float)int_part;
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	___uint2fs
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVFF	PRODH, r0x09
	MOVFF	FSR0L, r0x0a
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	___fssub
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	178; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_printNumber(int_part, 10);
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	__lcd_printNumber
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	181; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	if (digits > 0)
	MOVF	r0x04, W
	BZ	_00848_DS_
;	.line	182; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write('.'); 
	MOVLW	0x2e
	MOVWF	POSTDEC1
	CALL	__lcd_write
	MOVF	POSTINC1, F
_00848_DS_:
;	.line	185; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	while (digits-- > 0)
	MOVFF	r0x04, r0x05
	DECF	r0x04, F
	MOVF	r0x05, W
	BTFSC	STATUS, 2
	BRA	_00855_DS_
;	.line	187; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	remainder *= 10.0;
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x41
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	___fsmul
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	188; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	toPrint = (unsigned int)remainder; //Integer part without use of math.h lib, I think better! (Fazzi)
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	___fs2uint
	MOVWF	r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	189; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_printNumber(toPrint, 10);
	MOVFF	r0x05, r0x06
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	__lcd_printNumber
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	190; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	remainder -= toPrint; 
	CLRF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	___sint2fs
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVFF	FSR0L, r0x08
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	___fssub
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	BRA	_00848_DS_
_00855_DS_:
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
S_main___lcd_printNumber	code
__lcd_printNumber:
;	.line	133; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_printNumber(u16 n, u8 base)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	138; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	if (n == 0)
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00821_DS_
;	.line	140; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write('0');
	MOVLW	0x30
	MOVWF	POSTDEC1
	CALL	__lcd_write
	MOVF	POSTINC1, F
;	.line	141; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	return;
	BRA	_00813_DS_
_00821_DS_:
;	.line	144; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	while (n > 0)
	CLRF	r0x03
	CLRF	r0x04
_00806_DS_:
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00824_DS_
;	.line	146; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	buf[i++] = n % base;
	MOVFF	r0x03, r0x05
	MOVFF	r0x04, r0x06
	INFSNZ	r0x03, F
	INCF	r0x04, F
	MOVLW	LOW(__lcd_printNumber_buf_1_143)
	ADDWF	r0x05, F
	MOVLW	HIGH(__lcd_printNumber_buf_1_143)
	ADDWFC	r0x06, F
	MOVFF	r0x02, r0x07
	CLRF	r0x08
	CLRF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__moduint
	MOVWF	r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	r0x09, INDF0
;	.line	147; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	n /= base;
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00806_DS_
_00824_DS_:
	MOVFF	r0x03, r0x00
	MOVFF	r0x04, r0x01
_00809_DS_:
;	.line	150; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (; i > 0; i--)
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00813_DS_
; #	MOVF	r0x00, W
; #	MOVWF	r0x02
; #	DECF	r0x02, F
;	.line	151; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write((char) (buf[i - 1] < 10 ? '0' + buf[i - 1] : 'A' + buf[i - 1] - 10));
	DECF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	LOW(__lcd_printNumber_buf_1_143)
	ADDWF	r0x02, F
	MOVLW	HIGH(__lcd_printNumber_buf_1_143)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	MOVLW	0x0a
	SUBWF	r0x02, W
	BC	_00817_DS_
	MOVF	r0x02, W
	MOVWF	r0x03
	MOVLW	0x30
	ADDWF	r0x03, F
	BRA	_00818_DS_
_00817_DS_:
	MOVLW	0x37
	ADDWF	r0x02, W
	MOVWF	r0x03
_00818_DS_:
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	__lcd_write
	MOVF	POSTINC1, F
;	.line	150; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (; i > 0; i--)
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	BRA	_00809_DS_
_00813_DS_:
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
S_main___lcd_printf	code
__lcd_printf:
;	.line	123; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_printf(char *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	127; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	va_start(args, fmt);
	MOVLW	0x02
	ADDWF	FSR2L, W
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	FSR2H, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
; #	MOVWF	r0x01
; #	MOVWF	r0x01
	MOVWF	r0x01
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
;	.line	128; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	pprintf(_lcd_write, fmt, args);
	MOVF	r0x02, W
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
	MOVLW	UPPER(__lcd_write)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__lcd_write)
	MOVWF	POSTDEC1
	MOVLW	LOW(__lcd_write)
	MOVWF	POSTDEC1
	CALL	_pprintf
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	129; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	va_end(args);
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_print	code
__lcd_print:
;	.line	113; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_print(char *string)
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
;	.line	116; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for( i=0; string[i]; i++)
	CLRF	r0x03
_00790_DS_:
	MOVF	r0x03, W
	ADDWF	r0x00, W
	MOVWF	r0x04
	CLRF	WREG
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	CALL	__gptrget1
	MOVWF	r0x04
	MOVF	r0x04, W
	BZ	_00794_DS_
;	.line	117; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write(string[i]);
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__lcd_write
	MOVF	POSTINC1, F
;	.line	116; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for( i=0; string[i]; i++)
	INCF	r0x03, F
	BRA	_00790_DS_
_00794_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_setCursor	code
__lcd_setCursor:
;	.line	90; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_setCursor(u8 col, u8 row)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	BANKSEL	__lcd_setCursor_row_offsets_1_136
;	.line	92; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	u8 row_offsets[] = { 0x00, 0x40, 0x14, 0x54 };
	CLRF	__lcd_setCursor_row_offsets_1_136, B
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(__lcd_setCursor_row_offsets_1_136 + 1), B
	MOVLW	0x14
; removed redundant BANKSEL
	MOVWF	(__lcd_setCursor_row_offsets_1_136 + 2), B
	MOVLW	0x54
; removed redundant BANKSEL
	MOVWF	(__lcd_setCursor_row_offsets_1_136 + 3), B
	BANKSEL	__numlines
;	.line	99; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	if (_numlines==1) {
	MOVF	__numlines, W, B
	XORLW	0x01
	BNZ	_00778_DS_
;	.line	100; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	row_offsets[1] = 0x14;
	MOVLW	0x14
	BANKSEL	(__lcd_setCursor_row_offsets_1_136 + 1)
	MOVWF	(__lcd_setCursor_row_offsets_1_136 + 1), B
;	.line	101; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	row_offsets[2] = 0x28;
	MOVLW	0x28
; removed redundant BANKSEL
	MOVWF	(__lcd_setCursor_row_offsets_1_136 + 2), B
;	.line	102; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	row_offsets[3] = 0x3C;
	MOVLW	0x3c
; removed redundant BANKSEL
	MOVWF	(__lcd_setCursor_row_offsets_1_136 + 3), B
_00778_DS_:
;	.line	109; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_command(LCD_SETDDRAMADDR | (col + row_offsets[row]));
	CLRF	r0x02
	MOVLW	LOW(__lcd_setCursor_row_offsets_1_136)
	ADDWF	r0x01, F
	MOVLW	HIGH(__lcd_setCursor_row_offsets_1_136)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x01, W
	ADDWF	r0x00, F
	BSF	r0x00, 7
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_command
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_command	code
__lcd_command:
;	.line	84; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_command(u8 value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	86; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_send(value, LOW);
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_send
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_write	code
__lcd_write:
;	.line	78; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_write(u8 value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	80; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_send(value, HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_send
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_send	code
__lcd_send:
;	.line	62; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_send(u8 value, u8 mode)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	64; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	digitalwrite(_rs_pin, mode);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	BANKSEL	__rs_pin
	MOVF	__rs_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	__displayfunction
;	.line	66; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	if (_displayfunction & LCD_8BITMODE)
	BTFSS	__displayfunction, 4, B
	BRA	_00755_DS_
;	.line	68; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write8bits(value); 
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_write8bits
	MOVF	POSTINC1, F
	BRA	_00757_DS_
_00755_DS_:
;	.line	72; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write4bits(value >> 4);	// Upper 4 bits first
	SWAPF	r0x00, W
	ANDLW	0x0f
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	__lcd_write4bits
	MOVF	POSTINC1, F
;	.line	73; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_write4bits(value);		    // Lower 4 bits second
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__lcd_write4bits
	MOVF	POSTINC1, F
_00757_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_write8bits	code
__lcd_write8bits:
;	.line	53; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_write8bits(u8 value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	56; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i = 0; i < 8; i++)
	CLRF	r0x01
_00734_DS_:
	MOVLW	0x08
	SUBWF	r0x01, W
	BC	_00737_DS_
;	.line	57; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	digitalwrite(_data_pins[i], (value >> i) & 0x01);
	MOVLW	LOW(__data_pins)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(__data_pins)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	MOVFF	r0x00, r0x03
	MOVF	r0x01, W
	BZ	_00748_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00749_DS_:
	RRCF	r0x03, F
	ADDLW	0x01
	BNC	_00749_DS_
_00748_DS_:
	MOVLW	0x01
	ANDWF	r0x03, F
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	56; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i = 0; i < 8; i++)
	INCF	r0x01, F
	BRA	_00734_DS_
_00737_DS_:
;	.line	58; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_pulseEnable();
	CALL	__lcd_pulseEnable
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_write4bits	code
__lcd_write4bits:
;	.line	44; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	void _lcd_write4bits(u8 value)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	47; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i = 0; i < 4; i++)
	CLRF	r0x01
_00714_DS_:
	MOVLW	0x04
	SUBWF	r0x01, W
	BC	_00717_DS_
;	.line	48; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	digitalwrite(_data_pins[i], (value >> i) & 0x01);
	MOVLW	LOW(__data_pins)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(__data_pins)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	MOVFF	r0x00, r0x03
	MOVF	r0x01, W
	BZ	_00728_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00729_DS_:
	RRCF	r0x03, F
	ADDLW	0x01
	BNC	_00729_DS_
_00728_DS_:
	MOVLW	0x01
	ANDWF	r0x03, F
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	47; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	for (i = 0; i < 4; i++)
	INCF	r0x01, F
	BRA	_00714_DS_
_00717_DS_:
;	.line	49; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	_lcd_pulseEnable();
	CALL	__lcd_pulseEnable
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___lcd_pulseEnable	code
__lcd_pulseEnable:
;	.line	37; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	digitalwrite(_enable_pin, HIGH);
	MOVLW	0x01
	MOVWF	POSTDEC1
	BANKSEL	__enable_pin
	MOVF	__enable_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	39; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/libraries/lcdlib.c	digitalwrite(_enable_pin, LOW);
	CLRF	POSTDEC1
	BANKSEL	__enable_pin
	MOVF	__enable_pin, W, B
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__psprintf	code
_psprintf:
;	.line	463; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 psprintf(u8 *out, const u8 *format, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
;	.line	467; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	va_start(args, format);
	MOVLW	0x05
	ADDWF	FSR2L, W
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	FSR2H, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
; #	MOVWF	r0x01
; #	MOVWF	r0x01
	MOVWF	r0x01
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
;	.line	468; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pprint(&out, format, args);
	MOVLW	0x02
	ADDWF	FSR2L, W
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	FSR2H, W
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
; #	MOVWF	r0x04
; #	MOVWF	r0x04
	MOVWF	r0x04
; #	MOVF	r0x03, W
; #	MOVWF	r0x03
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVFF	PLUSW2, POSTDEC1
	MOVLW	0x06
	MOVFF	PLUSW2, POSTDEC1
	MOVLW	0x05
	MOVFF	PLUSW2, POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_pprint
	MOVWF	r0x00
	MOVLW	0x09
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__psprintf2	code
_psprintf2:
;	.line	457; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 psprintf2(u8 *out, const u8 *format, va_list args)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, _psprintf2_out_1_117
	MOVLW	0x03
	MOVFF	PLUSW2, (_psprintf2_out_1_117 + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (_psprintf2_out_1_117 + 2)
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
;	.line	459; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pprint(&out, format, args);
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
	MOVLW	HIGH(_psprintf2_out_1_117)
	MOVWF	POSTDEC1
	MOVLW	LOW(_psprintf2_out_1_117)
	MOVWF	POSTDEC1
	CALL	_pprint
	MOVWF	r0x00
	MOVLW	0x09
	ADDWF	FSR1L, F
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
;	.line	443; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 pprintf(funcout func, const u8 *format, va_list args)
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
;	.line	449; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pprint(0, format, args);
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
	MOVLW	0x09
	ADDWF	FSR1L, F
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
;	.line	298; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	static u8 pprint(u8 **out, const u8 *format, va_list args)
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
;	.line	302; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	register u8 pc = 0;
	CLRF	r0x09
;	.line	303; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 precision = 2; // default value is 2 digits fractional part
	MOVLW	0x02
	MOVWF	r0x0a
;	.line	306; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 islong = 0;
	CLRF	r0x0b
_00536_DS_:
;	.line	308; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (; *format != 0; ++format)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0c
	MOVF	r0x0c, W
	BTFSC	STATUS, 2
	GOTO	_00539_DS_
;	.line	310; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == '%')
	MOVF	r0x0c, W
	XORLW	0x25
	BZ	_00644_DS_
	GOTO	_00532_DS_
_00644_DS_:
;	.line	312; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	width = pad = 0;		// default is left justify, no zero padded
	CLRF	r0x0c
	CLRF	r0x0d
;	.line	313; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++format;				// get the next format identifier
	INCF	r0x03, F
	BNC	_00645_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00645_DS_:
;	.line	315; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == '\0')	// end of line
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0e
	MOVF	r0x0e, W
	BTFSC	STATUS, 2
	GOTO	_00539_DS_
;	.line	318; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == '%')		// error
	MOVF	r0x0e, W
	XORLW	0x25
	BNZ	_00647_DS_
	GOTO	_00532_DS_
_00647_DS_:
;	.line	321; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == '-')		// right justify
	MOVF	r0x0e, W
	XORLW	0x2d
	BNZ	_00562_DS_
;	.line	323; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++format;
	INCF	r0x03, F
	BNC	_00650_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00650_DS_:
;	.line	324; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pad = PAD_RIGHT;
	MOVLW	0x01
	MOVWF	r0x0c
_00562_DS_:
;	.line	327; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	while (*format == '0')	// field is padded with 0's instead of blanks
	MOVFF	r0x03, r0x0e
	MOVFF	r0x04, r0x0f
	MOVFF	r0x05, r0x10
_00501_DS_:
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
	XORLW	0x30
	BNZ	_00543_DS_
;	.line	329; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++format;
	INCF	r0x0e, F
	BNC	_00653_DS_
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_00653_DS_:
;	.line	330; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pad |= PAD_ZERO;
	BSF	r0x0c, 1
	BRA	_00501_DS_
_00543_DS_:
;	.line	333; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x11
	MOVLW	0x30
	SUBWF	r0x11, W
	BNC	_00585_DS_
	MOVLW	0x3a
	SUBWF	r0x11, W
	BC	_00585_DS_
; ;multiply lit val:0x0a by variable r0x0d and store in r0x0d
;	.line	335; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	width *= 10;
	MOVF	r0x0d, W
	MULLW	0x0a
	MOVFF	PRODL, r0x0d
;	.line	336; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	width += *format - '0';
	MOVLW	0xd0
	ADDWF	r0x11, F
	MOVF	r0x0d, W
	MOVWF	r0x12
	MOVF	r0x11, W
	ADDWF	r0x12, W
	MOVWF	r0x0d
;	.line	333; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	INCF	r0x0e, F
	BNC	_00657_DS_
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_00657_DS_:
	BRA	_00543_DS_
_00585_DS_:
	MOVFF	r0x0e, r0x03
	MOVFF	r0x0f, r0x04
	MOVFF	r0x10, r0x05
;	.line	346; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == '.')		// float precision
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
	XORLW	0x2e
	BNZ	_00569_DS_
;	.line	348; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++format;
	MOVF	r0x0e, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x05
;	.line	349; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	precision = 0;
	CLRF	r0x0a
_00569_DS_:
	MOVFF	r0x03, r0x0e
	MOVFF	r0x04, r0x0f
	MOVFF	r0x05, r0x10
_00548_DS_:
;	.line	352; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x11
	MOVLW	0x30
	SUBWF	r0x11, W
	BNC	_00586_DS_
	MOVLW	0x3a
	SUBWF	r0x11, W
	BC	_00586_DS_
; ;multiply lit val:0x0a by variable r0x0a and store in r0x0a
;	.line	354; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	precision *= 10;
	MOVF	r0x0a, W
	MULLW	0x0a
	MOVFF	PRODL, r0x0a
;	.line	355; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	precision += *format - '0';
	MOVLW	0xd0
	ADDWF	r0x11, F
	MOVF	r0x0a, W
	MOVWF	r0x12
	MOVF	r0x11, W
	ADDWF	r0x12, W
	MOVWF	r0x0a
;	.line	352; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	INCF	r0x0e, F
	BNC	_00662_DS_
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_00662_DS_:
	BRA	_00548_DS_
_00586_DS_:
	MOVFF	r0x0e, r0x03
	MOVFF	r0x0f, r0x04
	MOVFF	r0x10, r0x05
;	.line	358; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'f') 	// float
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
	MOVWF	r0x11
	XORLW	0x66
	BZ	_00664_DS_
	BRA	_00507_DS_
_00664_DS_:
;	.line	360; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprintfl(out, va_arg(args, float), width, pad, separator, precision);
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x12
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x14
	MOVFF	r0x12, r0x06
	MOVFF	r0x13, r0x07
	MOVFF	r0x14, r0x08
	MOVLW	0xfc
	ADDWF	r0x12, F
	MOVLW	0xff
	ADDWFC	r0x13, F
	ADDWFC	r0x14, F
; #	MOVF	r0x14, W
; #	MOVWF	r0x14
; #	MOVF	r0x14, W
; #	MOVF	r0x13, W
; #	MOVF	r0x13, W
; #	MOVWF	r0x13
; #	MOVF	r0x13, W
; #	MOVF	r0x12, W
; #	MOVF	r0x12, W
; #	MOVWF	r0x12
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrget4
	MOVWF	r0x12
	MOVFF	PRODL, r0x13
	MOVFF	PRODH, r0x14
	MOVFF	FSR0L, r0x15
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintfl
	MOVWF	r0x12
	MOVLW	0x0b
	ADDWF	FSR1L, F
	MOVF	r0x12, W
	ADDWF	r0x09, F
;	.line	361; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	continue;
	BRA	_00538_DS_
_00507_DS_:
;	.line	364; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 's')		// string
	MOVF	r0x11, W
	XORLW	0x73
	BZ	_00666_DS_
	BRA	_00509_DS_
_00666_DS_:
;	.line	366; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 *s = va_arg(args, u8*);
	MOVF	r0x06, W
	ADDLW	0x03
	MOVWF	r0x12
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x14
	MOVFF	r0x12, r0x06
	MOVFF	r0x13, r0x07
	MOVFF	r0x14, r0x08
	MOVLW	0xfd
	ADDWF	r0x12, F
	MOVLW	0xff
	ADDWFC	r0x13, F
	ADDWFC	r0x14, F
; #	MOVF	r0x14, W
; #	MOVWF	r0x14
; #	MOVF	r0x14, W
; #	MOVF	r0x13, W
; #	MOVF	r0x13, W
; #	MOVWF	r0x13
; #	MOVF	r0x13, W
; #	MOVF	r0x12, W
; #	MOVF	r0x12, W
; #	MOVWF	r0x12
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrget3
	MOVWF	r0x12
	MOVFF	PRODL, r0x13
	MOVFF	PRODH, r0x14
;	.line	367; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprints(out, s?s:"(null)", width, pad);
	IORWF	r0x13, W
; #	IORWF	r0x14, W
; #	BTFSC	STATUS, 2
; #	GOTO	_00554_DS_
; #	GOTO	_00555_DS_
; #	MOVLW	UPPER(__str_0)
	IORWF	r0x14, W
	BNZ	_00555_DS_
	MOVLW	UPPER(__str_0)
	MOVWF	r0x14
	MOVLW	HIGH(__str_0)
	MOVWF	r0x13
	MOVLW	LOW(__str_0)
	MOVWF	r0x12
_00555_DS_:
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x12
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	MOVWF	r0x13
	MOVF	r0x12, W
	ADDWF	r0x13, W
	MOVWF	r0x09
;	.line	368; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	continue;
	BRA	_00538_DS_
_00509_DS_:
;	.line	371; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'l')		// long support
	MOVF	r0x11, W
	XORLW	0x6c
	BNZ	_00511_DS_
;	.line	373; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++format;
	MOVF	r0x0e, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x05
;	.line	374; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	islong = 1;
	MOVLW	0x01
	MOVWF	r0x0b
_00511_DS_:
;	.line	377; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (islong)
	MOVF	r0x0b, W
	BZ	_00513_DS_
;	.line	378; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	val = va_arg(args, u32);
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x0e
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0f
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x10
	MOVFF	r0x0e, r0x06
	MOVFF	r0x0f, r0x07
	MOVFF	r0x10, r0x08
	MOVLW	0xfc
	ADDWF	r0x0e, F
	MOVLW	0xff
	ADDWFC	r0x0f, F
	ADDWFC	r0x10, F
; #	MOVF	r0x10, W
; #	MOVWF	r0x10
; #	MOVF	r0x10, W
; #	MOVF	r0x0f, W
; #	MOVF	r0x0f, W
; #	MOVWF	r0x0f
; #	MOVF	r0x0f, W
; #	MOVF	r0x0e, W
; #	MOVF	r0x0e, W
; #	MOVWF	r0x0e
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget4
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVFF	PRODH, r0x10
	MOVFF	FSR0L, r0x11
	BRA	_00514_DS_
_00513_DS_:
;	.line	380; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	val = (u32)va_arg(args, u16);
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x12
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x14
	MOVFF	r0x12, r0x06
	MOVFF	r0x13, r0x07
	MOVFF	r0x14, r0x08
	MOVLW	0xfe
	ADDWF	r0x12, F
	MOVLW	0xff
	ADDWFC	r0x13, F
	ADDWFC	r0x14, F
; #	MOVF	r0x14, W
; #	MOVWF	r0x14
; #	MOVF	r0x14, W
; #	MOVF	r0x13, W
; #	MOVF	r0x13, W
; #	MOVWF	r0x13
; #	MOVF	r0x13, W
; #	MOVF	r0x12, W
; #	MOVF	r0x12, W
; #	MOVWF	r0x12
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrget2
	MOVWF	r0x12
	MOVFF	PRODL, r0x13
	MOVFF	r0x12, r0x0e
	MOVFF	r0x13, r0x0f
	CLRF	r0x10
	CLRF	r0x11
_00514_DS_:
;	.line	382; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'u')		// unsigned integer
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	MOVWF	r0x12
	XORLW	0x75
	BNZ	_00516_DS_
;	.line	384; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprinti(out, val, 10, 0, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0d
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	385; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	continue;
	BRA	_00538_DS_
_00516_DS_:
;	.line	388; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'd' || *format == 'i')		// decimal signed integer
	MOVF	r0x12, W
	XORLW	0x64
	BZ	_00517_DS_
	MOVF	r0x12, W
	XORLW	0x69
	BNZ	_00518_DS_
_00517_DS_:
;	.line	390; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprinti(out, val, 10, 1, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0d
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	391; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	continue;
	BRA	_00538_DS_
_00518_DS_:
;	.line	394; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'x' || *format == 'p')	// lower hexa or pointer
	MOVF	r0x12, W
	XORLW	0x78
	BZ	_00520_DS_
	MOVF	r0x12, W
	XORLW	0x70
	BNZ	_00521_DS_
_00520_DS_:
;	.line	396; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprinti(out, val, 16, 0, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0d
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	397; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	continue;
	BRA	_00538_DS_
_00521_DS_:
;	.line	400; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'X' || *format == 'P')	// upper hexa or pointer
	MOVF	r0x12, W
	XORLW	0x58
	BZ	_00523_DS_
	MOVF	r0x12, W
	XORLW	0x50
	BNZ	_00524_DS_
_00523_DS_:
;	.line	402; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprinti(out, val, 16, 0, width, pad, separator, 'A');
	MOVLW	0x41
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0d
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	403; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	continue;
	BRA	_00538_DS_
_00524_DS_:
;	.line	406; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'b')		// binary
	MOVF	r0x12, W
	XORLW	0x62
	BNZ	_00527_DS_
;	.line	408; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprinti(out, val, 2, 0, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0d
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	409; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	continue;
	BRA	_00538_DS_
_00527_DS_:
;	.line	412; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'o')		// octal
	MOVF	r0x12, W
	XORLW	0x6f
	BNZ	_00529_DS_
;	.line	414; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprinti(out, val, 8, 0, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0d
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	415; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	continue;
	BRA	_00538_DS_
_00529_DS_:
;	.line	418; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'c') 	// ascii
	MOVF	r0x12, W
	XORLW	0x63
	BNZ	_00538_DS_
;	.line	420; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	scr[0] = val;
	MOVF	r0x0e, W
	BANKSEL	_pprint_scr_1_96
	MOVWF	_pprint_scr_1_96, B
; removed redundant BANKSEL
;	.line	421; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	scr[1] = '\0';
	CLRF	(_pprint_scr_1_96 + 1), B
;	.line	422; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprints(out, scr, width, pad);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprint_scr_1_96)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprint_scr_1_96)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x0c
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	MOVWF	r0x0d
	MOVF	r0x0c, W
	ADDWF	r0x0d, W
	MOVWF	r0x09
;	.line	423; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	continue;
	BRA	_00538_DS_
_00532_DS_:
;	.line	430; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pprintc(out, *format);
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
; #	MOVWF	r0x0c
; #	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintc
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	431; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++pc;
	INCF	r0x09, F
_00538_DS_:
;	.line	308; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (; *format != 0; ++format)
	INCF	r0x03, F
	BNC	_00689_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00689_DS_:
	GOTO	_00536_DS_
_00539_DS_:
;	.line	434; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (out) **out = '\0';
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00541_DS_
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
_00541_DS_:
;	.line	435; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pc;
	MOVF	r0x09, W
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
S_main__pprintfl	code
_pprintfl:
;	.line	167; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	static u8 pprintfl(u8 **out, float value, u8 width, u8 pad, u8 separator, u8 precision)
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
	MOVFF	r0x1b, POSTDEC1
	MOVFF	r0x1c, POSTDEC1
	MOVFF	r0x1d, POSTDEC1
	MOVFF	r0x1e, POSTDEC1
	MOVFF	r0x1f, POSTDEC1
	MOVFF	r0x20, POSTDEC1
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
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x09
;	.line	176; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u32 int_part  = 0;
	CLRF	r0x0a
	CLRF	r0x0b
	CLRF	r0x0c
	CLRF	r0x0d
;	.line	177; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u32 frac_part = 0;
	CLRF	r0x0e
	CLRF	r0x0f
	CLRF	r0x10
	CLRF	r0x11
;	.line	179; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 buffer[PRINT_BUF_LEN], *string = buffer;
	MOVLW	HIGH(_pprintfl_buffer_1_82)
	MOVWF	r0x13
	MOVLW	LOW(_pprintfl_buffer_1_82)
	MOVWF	r0x12
	MOVLW	0x80
	MOVWF	r0x14
;	.line	180; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 tmp[PRINT_BUF_LEN], *s = tmp;
	MOVLW	HIGH(_pprintfl_tmp_1_82)
	MOVWF	r0x16
	MOVLW	LOW(_pprintfl_tmp_1_82)
	MOVWF	r0x15
	MOVLW	0x80
	MOVWF	r0x17
;	.line	181; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 count = 0, m, t;
	CLRF	r0x18
;	.line	182; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 length = PRINT_BUF_LEN - 1;
	MOVLW	0x0b
	MOVWF	r0x19
;	.line	184; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	helper.f = value;
	MOVF	r0x03, W
	BANKSEL	_pprintfl_helper_1_82
	MOVWF	_pprintfl_helper_1_82, B
	MOVF	r0x04, W
; removed redundant BANKSEL
	MOVWF	(_pprintfl_helper_1_82 + 1), B
	MOVF	r0x05, W
; removed redundant BANKSEL
	MOVWF	(_pprintfl_helper_1_82 + 2), B
	MOVF	r0x06, W
; removed redundant BANKSEL
	MOVWF	(_pprintfl_helper_1_82 + 3), B
;	.line	187; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (helper.l < 0)
	BSF	STATUS, 0
; removed redundant BANKSEL
	BTFSS	(_pprintfl_helper_1_82 + 3), 7, B
	BCF	STATUS, 0
	BNC	_00372_DS_
;	.line	189; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (width && (pad & PAD_ZERO))
	MOVF	r0x07, W
	BZ	_00368_DS_
	BTFSS	r0x08, 1
	BRA	_00368_DS_
;	.line	191; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pprintc(out, '-');
	MOVLW	0x2d
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintc
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	192; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++count;
	MOVLW	0x01
	MOVWF	r0x18
;	.line	193; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	--width;
	DECF	r0x07, F
	BRA	_00372_DS_
_00368_DS_:
;	.line	197; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string++ = '-';
	MOVLW	0x2d
	MOVWF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
	INCF	r0x12, F
	BNC	_00456_DS_
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00456_DS_:
;	.line	198; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	length--;
	MOVLW	0x0a
	MOVWF	r0x19
_00372_DS_:
	BANKSEL	(_pprintfl_helper_1_82 + 2)
;	.line	204; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	exponent = ((helper.l >> 23) & 0xFF) - 127;	
	RLCF	(_pprintfl_helper_1_82 + 2), W, B
; removed redundant BANKSEL
	RLCF	(_pprintfl_helper_1_82 + 3), W, B
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	0x81
	ADDWF	r0x03, F
; removed redundant BANKSEL
;	.line	207; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	mantissa = (helper.l & 0x7FFFFF) | 0x800000;
	MOVF	_pprintfl_helper_1_82, W, B
	MOVWF	r0x04
; removed redundant BANKSEL
	MOVF	(_pprintfl_helper_1_82 + 1), W, B
	MOVWF	r0x05
	MOVLW	0x7f
; removed redundant BANKSEL
	ANDWF	(_pprintfl_helper_1_82 + 2), W, B
	MOVWF	r0x06
	CLRF	r0x1a
	BSF	r0x06, 7
;	.line	209; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if ( (exponent >= 31) || (exponent < -23) )
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x61
	BC	_00379_DS_
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x97
	BC	_00380_DS_
_00379_DS_:
;	.line	211; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[0] = 'i';
	MOVLW	0x69
	BANKSEL	_pprintfl_buffer_1_82
	MOVWF	_pprintfl_buffer_1_82, B
;	.line	212; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[1] = 'n';
	MOVLW	0x6e
; removed redundant BANKSEL
	MOVWF	(_pprintfl_buffer_1_82 + 1), B
;	.line	213; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[2] = 'f';
	MOVLW	0x66
; removed redundant BANKSEL
	MOVWF	(_pprintfl_buffer_1_82 + 2), B
; removed redundant BANKSEL
;	.line	214; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[3] = '\0';
	CLRF	(_pprintfl_buffer_1_82 + 3), B
;	.line	215; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pprints(out, buffer, width, pad);
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprintfl_buffer_1_82)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprintfl_buffer_1_82)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x1b
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x1b, W
	BRA	_00402_DS_
_00380_DS_:
;	.line	217; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	else if (exponent >= 23)
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x69
	BNC	_00377_DS_
;	.line	219; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	int_part = mantissa << (exponent - 23);
	MOVFF	r0x03, r0x1b
	CLRF	r0x1c
	BTFSC	r0x03, 7
	SETF	r0x1c
	MOVLW	0xe9
	ADDWF	r0x1b, F
	BTFSS	STATUS, 0
	DECF	r0x1c, F
	MOVFF	r0x04, r0x0a
	MOVFF	r0x05, r0x0b
	MOVFF	r0x06, r0x0c
	MOVFF	r0x1a, r0x0d
	MOVF	r0x1b, W
	BZ	_00463_DS_
	BN	_00466_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00464_DS_:
	RLCF	r0x0a, F
	RLCF	r0x0b, F
	RLCF	r0x0c, F
	RLCF	r0x0d, F
	ADDLW	0x01
	BNC	_00464_DS_
	BRA	_00381_DS_
_00466_DS_:
	BCF	STATUS, 0
_00465_DS_:
	RRCF	r0x0d, F
	RRCF	r0x0c, F
	RRCF	r0x0b, F
	RRCF	r0x0a, F
	ADDLW	0x01
	BNC	_00465_DS_
_00463_DS_:
	BRA	_00381_DS_
_00377_DS_:
;	.line	221; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	else if (exponent >= 0) 
	BSF	STATUS, 0
	BTFSS	r0x03, 7
	BCF	STATUS, 0
	BTFSC	STATUS, 0
	BRA	_00374_DS_
;	.line	223; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	int_part = mantissa >> (23 - exponent);
	MOVFF	r0x03, r0x1b
	CLRF	r0x1c
	BTFSC	r0x03, 7
	SETF	r0x1c
	MOVF	r0x1b, W
	SUBLW	0x17
	MOVWF	r0x1d
	MOVLW	0x00
	SUBFWB	r0x1c, W
	MOVFF	r0x04, r0x0a
	MOVFF	r0x05, r0x0b
	MOVFF	r0x06, r0x0c
	MOVFF	r0x1a, r0x0d
	MOVF	r0x1d, W
	BZ	_00467_DS_
	BN	_00470_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00468_DS_:
	RRCF	r0x0d, F
	RRCF	r0x0c, F
	RRCF	r0x0b, F
	RRCF	r0x0a, F
	ADDLW	0x01
	BNC	_00468_DS_
	BRA	_00467_DS_
_00470_DS_:
	BCF	STATUS, 0
_00469_DS_:
	RLCF	r0x0a, F
	RLCF	r0x0b, F
	RLCF	r0x0c, F
	RLCF	r0x0d, F
	ADDLW	0x01
	BNC	_00469_DS_
_00467_DS_:
;	.line	224; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	frac_part = (mantissa << (exponent + 1)) & 0xFFFFFF; // mfh
	INFSNZ	r0x1b, F
	INCF	r0x1c, F
	MOVFF	r0x04, r0x1d
	MOVFF	r0x05, r0x1e
	MOVFF	r0x06, r0x1f
	MOVFF	r0x1a, r0x20
	MOVF	r0x1b, W
	BZ	_00471_DS_
	BN	_00474_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00472_DS_:
	RLCF	r0x1d, F
	RLCF	r0x1e, F
	RLCF	r0x1f, F
	RLCF	r0x20, F
	ADDLW	0x01
	BNC	_00472_DS_
	BRA	_00471_DS_
_00474_DS_:
	BCF	STATUS, 0
_00473_DS_:
	RRCF	r0x20, F
	RRCF	r0x1f, F
	RRCF	r0x1e, F
	RRCF	r0x1d, F
	ADDLW	0x01
	BNC	_00473_DS_
_00471_DS_:
	MOVF	r0x1d, W
	MOVWF	r0x0e
	MOVF	r0x1e, W
	MOVWF	r0x0f
	MOVF	r0x1f, W
	MOVWF	r0x10
	CLRF	r0x11
	BRA	_00381_DS_
_00374_DS_:
;	.line	227; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	frac_part = (mantissa & 0xFFFFFF) >> -(exponent + 1);
	CLRF	r0x1a
	CLRF	r0x1b
	BTFSC	r0x03, 7
	SETF	r0x1b
	INFSNZ	r0x03, F
	INCF	r0x1b, F
	COMF	r0x1b, F
	NEGF	r0x03
	BTFSC	STATUS, 2
	INCF	r0x1b, F
	MOVFF	r0x04, r0x0e
	MOVFF	r0x05, r0x0f
	MOVFF	r0x06, r0x10
	MOVFF	r0x1a, r0x11
	MOVF	r0x03, W
	BZ	_00381_DS_
	BN	_00481_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00479_DS_:
	RRCF	r0x11, F
	RRCF	r0x10, F
	RRCF	r0x0f, F
	RRCF	r0x0e, F
	ADDLW	0x01
	BNC	_00479_DS_
	BRA	_00381_DS_
_00481_DS_:
	BCF	STATUS, 0
_00480_DS_:
	RLCF	r0x0e, F
	RLCF	r0x0f, F
	RLCF	r0x10, F
	RLCF	r0x11, F
	ADDLW	0x01
	BNC	_00480_DS_
_00381_DS_:
;	.line	230; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (int_part == 0)
	MOVF	r0x0a, W
	IORWF	r0x0b, W
	IORWF	r0x0c, W
	IORWF	r0x0d, W
	BNZ	_00412_DS_
;	.line	232; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string++ = '0';
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
	INCF	r0x12, F
	BNC	_00482_DS_
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00482_DS_:
;	.line	233; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	length--;
	DECF	r0x19, F
	BRA	_00391_DS_
_00412_DS_:
;	.line	239; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	while (int_part)
	MOVFF	r0x15, r0x03
	MOVFF	r0x16, r0x04
	MOVFF	r0x17, r0x05
	CLRF	r0x06
	MOVFF	r0x19, r0x15
_00383_DS_:
	MOVF	r0x0a, W
	IORWF	r0x0b, W
	IORWF	r0x0c, W
	IORWF	r0x0d, W
	BTFSC	STATUS, 2
	BRA	_00420_DS_
;	.line	241; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	t = int_part % 10;		// decimal base
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	__modulong
	MOVWF	r0x16
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	242; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*s++ = t + '0';
	MOVLW	0x30
	ADDWF	r0x16, F
	MOVFF	r0x16, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	INCF	r0x03, F
	BNC	_00483_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00483_DS_:
;	.line	243; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	int_part /= 10;
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	244; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	m++;					// string's length counter
	INCF	r0x06, F
;	.line	245; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	length--;
	DECF	r0x15, F
	BRA	_00383_DS_
_00420_DS_:
;	.line	248; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	while (m--)
	MOVFF	r0x15, r0x19
	MOVFF	r0x12, r0x0a
	MOVFF	r0x13, r0x0b
	MOVFF	r0x14, r0x0c
_00386_DS_:
	MOVFF	r0x06, r0x0d
	DECF	r0x06, F
	MOVF	r0x0d, W
	BZ	_00421_DS_
;	.line	250; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string++ = *--s;
	MOVLW	0xff
	ADDWF	r0x03, F
	ADDWFC	r0x04, F
	ADDWFC	r0x05, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0d
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrput1
	INCF	r0x0a, F
	BNC	_00386_DS_
	INFSNZ	r0x0b, F
	INCF	r0x0c, F
_00484_DS_:
	BRA	_00386_DS_
_00421_DS_:
	MOVFF	r0x0a, r0x12
	MOVFF	r0x0b, r0x13
	MOVFF	r0x0c, r0x14
_00391_DS_:
;	.line	263; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (precision > 6)
	MOVLW	0x07
	SUBWF	r0x09, W
	BNC	_00393_DS_
;	.line	264; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	precision = 6;
	MOVLW	0x06
	MOVWF	r0x09
_00393_DS_:
;	.line	267; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (precision > length)
	MOVF	r0x09, W
; #	SUBWF	r0x19, W
; #	BTFSC	STATUS, 0
; #	GOTO	_00395_DS_
; #	MOVFF	r0x19, r0x09
; #	MOVLW	0x01
;	.line	268; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	precision = length;
	SUBWF	r0x19, W
;	.line	271; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (precision >= 1)
	BTFSS	STATUS, 0
	MOVFF	r0x19, r0x09
	MOVLW	0x01
	SUBWF	r0x09, W
	BTFSS	STATUS, 0
	BRA	_00397_DS_
;	.line	274; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string++ = '.';
	MOVLW	0x2e
	MOVWF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
	INCF	r0x12, F
	BNC	_00488_DS_
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00488_DS_:
;	.line	277; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (m = 0; m < precision; m++)
	MOVFF	r0x12, r0x03
	MOVFF	r0x13, r0x04
	MOVFF	r0x14, r0x05
	CLRF	r0x06
_00398_DS_:
	MOVF	r0x09, W
	SUBWF	r0x06, W
	BC	_00422_DS_
;	.line	280; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	frac_part = (frac_part << 3) + (frac_part << 1); 
	MOVF	r0x0e, W
	ADDWF	r0x0e, W
	MOVWF	r0x0a
	RLCF	r0x0f, W
	MOVWF	r0x0b
	RLCF	r0x10, W
	MOVWF	r0x0c
	RLCF	r0x11, W
	MOVWF	r0x0d
	MOVF	r0x0a, W
	ADDWF	r0x0a, F
	RLCF	r0x0b, F
	RLCF	r0x0c, F
	RLCF	r0x0d, F
	MOVF	r0x0a, W
	ADDWF	r0x0a, F
	RLCF	r0x0b, F
	RLCF	r0x0c, F
	RLCF	r0x0d, F
	MOVF	r0x0e, W
	ADDWF	r0x0e, W
	MOVWF	r0x15
	RLCF	r0x0f, W
	MOVWF	r0x16
	RLCF	r0x10, W
	MOVWF	r0x17
	RLCF	r0x11, W
	MOVWF	r0x19
	MOVF	r0x15, W
	ADDWF	r0x0a, W
	MOVWF	r0x0e
	MOVF	r0x16, W
	ADDWFC	r0x0b, W
	MOVWF	r0x0f
	MOVF	r0x17, W
	ADDWFC	r0x0c, W
	MOVWF	r0x10
	MOVF	r0x19, W
	ADDWFC	r0x0d, W
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
;	.line	282; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string++ = (frac_part >> 24) + '0';
	MOVWF	r0x0a
	MOVLW	0x30
	ADDWF	r0x0a, F
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	INCF	r0x03, F
	BNC	_00490_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00490_DS_:
;	.line	284; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	frac_part &= 0xFFFFFF;
	CLRF	r0x11
;	.line	277; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (m = 0; m < precision; m++)
	INCF	r0x06, F
	BRA	_00398_DS_
_00422_DS_:
	MOVFF	r0x03, r0x12
	MOVFF	r0x04, r0x13
	MOVFF	r0x05, r0x14
_00397_DS_:
;	.line	289; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string++ = '\0';
	CLRF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
;	.line	291; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return count + pprints(out, buffer, width, pad);
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprintfl_buffer_1_82)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprintfl_buffer_1_82)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x18, W
	ADDWF	r0x00, F
	MOVF	r0x00, W
_00402_DS_:
	MOVFF	PREINC1, r0x20
	MOVFF	PREINC1, r0x1f
	MOVFF	PREINC1, r0x1e
	MOVFF	PREINC1, r0x1d
	MOVFF	PREINC1, r0x1c
	MOVFF	PREINC1, r0x1b
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
S_main__pprinti	code
_pprinti:
;	.line	112; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	static u8 pprinti(u8 **out, u32 i, u8 base, u8 sign, u8 width, u8 pad, u8 separator, u8 letterbase)
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
	MOVFF	r0x1b, POSTDEC1
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
	MOVLW	0x0e
	MOVFF	PLUSW2, r0x0b
;	.line	116; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 neg = 0, pc = 0;
	CLRF	r0x0c
	CLRF	r0x0d
;	.line	117; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u32 t, uns32 = i;
	MOVFF	r0x03, r0x0e
	MOVFF	r0x04, r0x0f
	MOVFF	r0x05, r0x10
	MOVFF	r0x06, r0x11
;	.line	119; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (i == 0)
	MOVF	r0x03, W
	IORWF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	BNZ	_00309_DS_
;	.line	121; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[0] = '0';
	MOVLW	0x30
	BANKSEL	_pprinti_buffer_1_74
	MOVWF	_pprinti_buffer_1_74, B
; removed redundant BANKSEL
;	.line	122; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[1] = '\0';
	CLRF	(_pprinti_buffer_1_74 + 1), B
;	.line	123; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pprints(out, buffer, width, pad);
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprinti_buffer_1_74)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprinti_buffer_1_74)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x12
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x12, W
	BRA	_00325_DS_
_00309_DS_:
;	.line	127; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if ( (sign) && (base == 10) && ( (s32)i < 0 ) )
	MOVF	r0x08, W
	BZ	_00311_DS_
	MOVF	r0x07, W
	XORLW	0x0a
	BNZ	_00311_DS_
	BSF	STATUS, 0
	BTFSS	r0x06, 7
	BCF	STATUS, 0
	BNC	_00311_DS_
;	.line	129; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	neg = 1;
	MOVLW	0x01
	MOVWF	r0x0c
;	.line	130; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	uns32 = - (s32)i;
	COMF	r0x06, W
	MOVWF	r0x11
	COMF	r0x05, W
	MOVWF	r0x10
	COMF	r0x04, W
	MOVWF	r0x0f
	COMF	r0x03, W
	MOVWF	r0x0e
	INCF	r0x0e, F
	BNZ	_00311_DS_
	INCF	r0x0f, F
	BNZ	_00311_DS_
	INFSNZ	r0x10, F
	INCF	r0x11, F
_00311_DS_:
;	.line	134; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	string = buffer + PRINT_BUF_LEN - 1;
	MOVLW	HIGH(_pprinti_buffer_1_74 + 11)
	MOVWF	r0x04
	MOVLW	LOW(_pprinti_buffer_1_74 + 11)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
;	.line	135; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string = '\0';
	CLRF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	CALL	__gptrput1
;	.line	137; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	while (uns32)
	MOVFF	r0x03, r0x06
	MOVFF	r0x04, r0x08
	MOVFF	r0x05, r0x12
_00316_DS_:
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	IORWF	r0x10, W
	IORWF	r0x11, W
	BTFSC	STATUS, 2
	BRA	_00337_DS_
;	.line	139; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	t = uns32 % base;
	MOVFF	r0x07, r0x13
	CLRF	r0x14
	CLRF	r0x15
	CLRF	r0x16
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	CALL	__modulong
	MOVWF	r0x17
	MOVFF	PRODL, r0x18
	MOVFF	PRODH, r0x19
	MOVFF	FSR0L, r0x1a
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	140; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if ( t >= 10 )
	MOVLW	0x00
	SUBWF	r0x1a, W
	BNZ	_00361_DS_
	MOVLW	0x00
	SUBWF	r0x19, W
	BNZ	_00361_DS_
	MOVLW	0x00
	SUBWF	r0x18, W
	BNZ	_00361_DS_
	MOVLW	0x0a
	SUBWF	r0x17, W
_00361_DS_:
	BNC	_00315_DS_
;	.line	141; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	t += letterbase - '0' - 10;
	MOVFF	r0x0b, r0x1b
	MOVLW	0xc6
	ADDWF	r0x1b, F
	MOVF	r0x1b, W
	ADDWF	r0x17, F
_00315_DS_:
;	.line	142; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*--string = t + '0';
	MOVLW	0xff
	ADDWF	r0x06, F
	ADDWFC	r0x08, F
	ADDWFC	r0x12, F
	MOVLW	0x30
	ADDWF	r0x17, F
	MOVFF	r0x17, POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x12, W
	CALL	__gptrput1
;	.line	143; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	uns32 /= base;
	MOVF	r0x16, W
	MOVWF	POSTDEC1
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVFF	PRODH, r0x10
	MOVFF	FSR0L, r0x11
	MOVLW	0x08
	ADDWF	FSR1L, F
	BRA	_00316_DS_
_00337_DS_:
	MOVFF	r0x06, r0x03
	MOVFF	r0x08, r0x04
	MOVFF	r0x12, r0x05
;	.line	146; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (neg)
	MOVF	r0x0c, W
	BZ	_00324_DS_
;	.line	148; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (width && (pad & PAD_ZERO))
	MOVF	r0x09, W
	BZ	_00320_DS_
	BTFSS	r0x0a, 1
	BRA	_00320_DS_
;	.line	150; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pprintc(out, '-');
	MOVLW	0x2d
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintc
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	151; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++pc;
	MOVLW	0x01
	MOVWF	r0x0d
;	.line	152; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	--width;
	DECF	r0x09, F
	BRA	_00324_DS_
_00320_DS_:
;	.line	156; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*--string = '-';
	MOVLW	0xff
	ADDWF	r0x03, F
	ADDWFC	r0x04, F
	ADDWFC	r0x05, F
	MOVLW	0x2d
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
_00324_DS_:
;	.line	160; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pc + pprints(out, string, width, pad);
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
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
	CALL	_pprints
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x0d, W
	ADDWF	r0x00, F
	MOVF	r0x00, W
_00325_DS_:
	MOVFF	PREINC1, r0x1b
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
;	.line	62; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	static int pprints(u8 **out, const u8 *string, u8 width, u8 pad)
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
;	.line	64; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	register u8 pc = 0;
	CLRF	r0x08
;	.line	65; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 padchar = ' ';
	MOVLW	0x20
	MOVWF	r0x09
;	.line	69; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (width > 0)
	MOVF	r0x06, W
	BZ	_00235_DS_
;	.line	71; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (ptr = string; *ptr; ++ptr)
	CLRF	r0x0a
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
_00238_DS_:
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
	MOVWF	r0x0e
	MOVF	r0x0e, W
	BZ	_00241_DS_
;	.line	72; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++len;
	INCF	r0x0a, F
;	.line	71; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (ptr = string; *ptr; ++ptr)
	INCF	r0x0b, F
	BNC	_00238_DS_
	INFSNZ	r0x0c, F
	INCF	r0x0d, F
_00299_DS_:
	BRA	_00238_DS_
_00241_DS_:
;	.line	73; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (len >= width)
	MOVF	r0x06, W
	SUBWF	r0x0a, W
	BNC	_00230_DS_
;	.line	74; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	width = 0;
	CLRF	r0x06
	BRA	_00231_DS_
_00230_DS_:
;	.line	76; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	width -= len;
	MOVF	r0x0a, W
	SUBWF	r0x06, F
_00231_DS_:
;	.line	77; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (pad & PAD_ZERO) padchar = '0';
	BTFSS	r0x07, 1
	BRA	_00235_DS_
	MOVLW	0x30
	MOVWF	r0x09
_00235_DS_:
;	.line	79; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (!(pad & PAD_RIGHT))
	BTFSC	r0x07, 0
	BRA	_00268_DS_
	CLRF	r0x07
	MOVFF	r0x06, r0x0a
_00242_DS_:
;	.line	81; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x0a, W
	BNZ	_00243_DS_
	MOVFF	r0x07, r0x08
	MOVFF	r0x0a, r0x06
	BRA	_00268_DS_
_00243_DS_:
;	.line	83; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pprintc(out, padchar);
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintc
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	84; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++pc;
	INCF	r0x07, F
;	.line	81; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; width > 0; --width)
	DECF	r0x0a, F
	BRA	_00242_DS_
_00268_DS_:
	MOVFF	r0x08, r0x07
_00246_DS_:
;	.line	87; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; *string ; ++string)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x08
	MOVF	r0x08, W
	BZ	_00270_DS_
;	.line	89; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pprintc(out, *string);
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintc
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	90; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++pc;
	INCF	r0x07, F
;	.line	87; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; *string ; ++string)
	INCF	r0x03, F
	BNC	_00246_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00303_DS_:
	BRA	_00246_DS_
_00270_DS_:
	MOVFF	r0x07, r0x03
	MOVFF	r0x06, r0x04
_00250_DS_:
;	.line	92; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x04, W
	BZ	_00253_DS_
;	.line	94; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pprintc(out, padchar);
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintc
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	95; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++pc;
	INCF	r0x03, F
;	.line	92; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; width > 0; --width)
	DECF	r0x04, F
	BRA	_00250_DS_
; =DF= MOVFF: replaced by CRLF/SETF
_00253_DS_:
;	.line	98; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pc;
	CLRF	PRODL
	MOVF	r0x03, W
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
S_main__pprintc	code
_pprintc:
;	.line	42; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	static void pprintc(u8 **str, u8 c)
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
;	.line	44; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (str)
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00216_DS_
;	.line	46; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	**str = c;
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
;	.line	47; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++(*str);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	INCF	r0x04, F
	BNC	_00223_DS_
	INFSNZ	r0x05, F
	INCF	r0x06, F
_00223_DS_:
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
	BRA	_00218_DS_
_00216_DS_:
;	.line	51; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pputchar(c);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00224_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00224_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00224_DS_)
	MOVWF	TOSU
	BTFSC	PREINC1, 7
	BSF	INTCON, 7
	MOVFF	(_pputchar + 2), PCLATU
	MOVFF	(_pputchar + 1), PCLATH
	BANKSEL	_pputchar
	MOVF	_pputchar, W, B
	MOVWF	PCL
_00224_DS_:
	MOVF	POSTINC1, F
_00218_DS_:
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
S_main__toggle	code
_toggle:
;	.line	205; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	void toggle(u8 pin)
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
;	.line	212; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	u8  b = mask[pin];          // bit
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_mask)
	ADDWFC	r0x02, F
	CLRF	r0x03
	MOVLW	UPPER(_mask)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
;	.line	213; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	u8* p = port[pin] + 0xF80;  // lat
	CLRF	r0x02
	CLRF	r0x03
	MOVLW	LOW(_port)
	ADDWF	r0x00, F
	MOVLW	HIGH(_port)
	ADDWFC	r0x02, F
	MOVLW	UPPER(_port)
	ADDWFC	r0x03, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x02
	MOVLW	0x80
	ADDWF	r0x00, F
	MOVLW	0x0f
	ADDWFC	r0x02, F
; #	MOVF	r0x02, W
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
; #	MOVF	r0x00, W
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVFF	r0x00, r0x04
	MOVFF	r0x02, r0x05
	MOVFF	r0x03, r0x06
;	.line	214; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	if ((*p & b) == 0)          // bit is not set ?
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x07
	MOVF	r0x01, W
	ANDWF	r0x07, F
	MOVF	r0x07, W
	BNZ	_00208_DS_
;	.line	216; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	p = port[pin] + 0xF80;
	MOVFF	r0x00, r0x04
	MOVFF	r0x02, r0x05
	MOVFF	r0x03, r0x06
;	.line	217; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	*p |= b;                // set bit
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x07
	MOVF	r0x01, W
	IORWF	r0x07, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
	BRA	_00210_DS_
_00208_DS_:
;	.line	221; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	p = port[pin] + 0xF80;
	MOVFF	r0x00, r0x04
	MOVFF	r0x02, r0x05
	MOVFF	r0x03, r0x06
;	.line	222; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	*p &= (255-b);          // clear bit
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x00
	MOVF	r0x01, W
	SUBLW	0xff
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	ANDWF	r0x00, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
_00210_DS_:
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
S_main__pinmode	code
_pinmode:
;	.line	173; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	void pinmode(u8 pin, u8 state)
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
;	.line	197; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	u8  b = mask[pin];          // bit
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
;	.line	198; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	u8* p = port[pin] + 0xF92;  // tris
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	LOW(_port)
	ADDWF	r0x00, F
	MOVLW	HIGH(_port)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_port)
	ADDWFC	r0x04, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x03
	MOVLW	0x92
	ADDWF	r0x00, F
	MOVLW	0x0f
	ADDWFC	r0x03, F
; #	MOVF	r0x03, W
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
; #	MOVF	r0x00, W
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x04
;	.line	199; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	if (state)                  // if 1
	MOVF	r0x01, W
	BZ	_00200_DS_
;	.line	200; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	*p |= b;                // set bit (input)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x01
	MOVF	r0x02, W
	IORWF	r0x01, F
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrput1
	BRA	_00202_DS_
_00200_DS_:
;	.line	202; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	*p &= (255-b);          // clear bit (output)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x01
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	r0x01, F
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrput1
_00202_DS_:
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
;	.line	141; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	u8 digitalread(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	166; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	u8* p = port[pin] + 0xF80;  // lat
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
	CLRF	r0x02
	MOVLW	0x80
	ADDWF	r0x01, F
	MOVLW	0x0f
	ADDWFC	r0x02, F
; #	MOVF	r0x02, W
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
; #	MOVF	r0x01, W
; #	MOVF	r0x01, W
; #	MOVWF	r0x01
	MOVLW	0x80
;	.line	167; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	if ((*p & mask[pin]) == 0)
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	CALL	__gptrget1
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	MOVLW	LOW(_mask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_mask)
	ADDWFC	r0x02, F
	MOVLW	UPPER(_mask)
	ADDWFC	r0x03, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	MOVF	r0x00, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BNZ	_00192_DS_
;	.line	168; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	return 0;               // bit is not set
	CLRF	WREG
	BRA	_00194_DS_
_00192_DS_:
;	.line	170; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	return 1;               // bit is set
	MOVLW	0x01
_00194_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__digitalwrite	code
_digitalwrite:
;	.line	109; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	void digitalwrite(u8 pin, u8 state)
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
;	.line	133; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	u8  b = mask[pin];          // bit
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_mask)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
;	.line	134; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	u8* p = port[pin] + 0xF80;  // lat
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	LOW(_port)
	ADDWF	r0x00, F
	MOVLW	HIGH(_port)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_port)
	ADDWFC	r0x04, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x03
	MOVLW	0x80
	ADDWF	r0x00, F
	MOVLW	0x0f
	ADDWFC	r0x03, F
; #	MOVF	r0x03, W
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
; #	MOVF	r0x00, W
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x04
;	.line	135; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	if (state)
	MOVF	r0x01, W
	BZ	_00184_DS_
;	.line	136; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	*p |= b;                // set bit
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x01
	MOVF	r0x02, W
	IORWF	r0x01, F
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrput1
	BRA	_00186_DS_
_00184_DS_:
;	.line	138; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/digitalw.c	*p &= (255-b);          // clear bit
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x01
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	r0x01, F
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrput1
_00186_DS_:
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
;	.line	17; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/delay.c	void Delayus(u16 microsecondes)
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
;	.line	21; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/delay.c	for (i=0;i<microsecondes;i++);
	CLRF	r0x02
	CLRF	r0x03
_00165_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00178_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00178_DS_:
	BC	_00169_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00165_DS_
_00169_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayms	code
_Delayms:
;	.line	10; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/delay.c	void Delayms(u16 milliseconde)
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
;	.line	14; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/delay.c	for (i=0;i<milliseconde;i++) delay10ktcy(1);
	CLRF	r0x02
	CLRF	r0x03
_00147_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00160_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00160_DS_:
	BC	_00151_DS_
	MOVLW	0x01
	CALL	_delay10ktcy
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00147_DS_
_00151_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	53; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	52; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	void epapin_init()  { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	51; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	void epap_out()     { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	50; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	void epap_in()      { return; }
	RETURN	

; ; Starting pCode block
S_main__SystemReset	code
_SystemReset:
_00120_DS_:
;	.line	79; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/system.c	while(1);
	BRA	_00120_DS_
	RETURN	

; ; Starting pCode block
S_main__SystemLock	code
_SystemLock:
; #	MOVF	__gie_status_, W, B
; #	BTFSC	STATUS, 2
; #	GOTO	_00114_DS_
; #	BSF	_INTCONbits, 7
; #	MOVFF	PREINC1, FSR2L
	BANKSEL	__gie_status_
;	.line	67; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/system.c	if (_gie_status_)
	MOVF	__gie_status_, W, B
;	.line	68; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/system.c	INTCONbits.GIE = 1; // enable interrupts back
	BTFSS	STATUS, 2
	BSF	_INTCONbits, 7
	RETURN	

; ; Starting pCode block
S_main__SystemUnlock	code
_SystemUnlock:
;	.line	44; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/system.c	if (INTCONbits.GIE)
	BTFSS	_INTCONbits, 7
	BRA	_00106_DS_
;	.line	46; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/system.c	INTCONbits.GIE = 0; // disable interrupts
	BCF	_INTCONbits, 7
;	.line	47; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/system.c	_gie_status_ = 1;
	MOVLW	0x01
	BANKSEL	__gie_status_
	MOVWF	__gie_status_, B
_00106_DS_:
;	.line	49; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/system.c	EECON2 = 0x55;          // magic sequence
	MOVLW	0x55
	MOVWF	_EECON2
;	.line	50; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/system.c	EECON2 = 0xAA;
	MOVLW	0xaa
	MOVWF	_EECON2
	RETURN	

; ; Starting pCode block for Ival
	code
_mask:
	DB	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x40, 0x80, 0x01, 0x02
	DB	0x04, 0x01, 0x02, 0x04, 0x08, 0x20, 0x01, 0x02, 0x04, 0x01, 0x02, 0x04
	DB	0x08, 0x10, 0x20, 0x40, 0x80
; ; Starting pCode block for Ival
_port:
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02
	DB	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x04, 0x04, 0x03, 0x03, 0x03
	DB	0x03, 0x03, 0x03, 0x03, 0x03
; ; Starting pCode block
__str_0:
	DB	0x28, 0x6e, 0x75, 0x6c, 0x6c, 0x29, 0x00
; ; Starting pCode block
__str_1:
	DB	0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64
	DB	0x21, 0x00
; ; Starting pCode block
__str_2:
	DB	0x55, 0x70, 0x74, 0x69, 0x6d, 0x65, 0x3a, 0x20, 0x25, 0x64, 0x73, 0x00


; Statistics:
; code size:	10192 (0x27d0) bytes ( 7.78%)
;           	 5096 (0x13e8) words
; udata size:	  210 (0x00d2) bytes (11.72%)
; access size:	   33 (0x0021) bytes


	end
