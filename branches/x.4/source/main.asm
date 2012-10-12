;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.0 #7941 (Jun 20 2012) (Linux)
; This file was generated Tue Sep 25 11:07:22 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f26j50

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_ILI9325_writeRegister
	global	_ILI9325_writeData
	global	_ILI9325_write
	global	_ILI9325_readData
	global	_ILI9325_read
	global	_ILI9325_getDevice
	global	_ILI9325_init
	global	_ILI9325_color565
	global	_ILI9325_setColor
	global	_ILI9325_setBackgroundColor
	global	_ILI9325_setCursor
	global	_ILI9325_drawPixel
	global	_ILI9325_readPixel
	global	_ILI9325_setWindow
	global	_ILI9325_clearScreen
	global	_ILI9325_setPortrait
	global	_ILI9325_setLandscape
	global	_ILI9325_getScreenWidth
	global	_ILI9325_getScreenHeight
	global	_ILI9325_scroll
	global	_ILI9325_enterSleep
	global	_ILI9325_exitSleep
	global	_drawPixel
	global	__gie_status_
	global	_ILI9325
	global	_i
	global	_SystemUnlock
	global	_SystemLock
	global	_SystemReset
	global	_ILI9325_getFontWidth
	global	_ILI9325_getFontHeight
	global	_Delayms
	global	_Delayus
	global	_pprintf
	global	_psprintf2
	global	_psprintf
	global	_drawCircle
	global	_fillCircle
	global	_drawLine
	global	_drawBitmap
	global	_ILI9325_test
	global	_ILI9325_delPixel
	global	_ILI9325_clearWindow
	global	_ILI9325_getOrientation
	global	_ILI9325_printChar
	global	_ILI9325_printString
	global	_ILI9325_printf
	global	_ILI9325_drawCircle
	global	_ILI9325_fillCircle
	global	_ILI9325_drawLine
	global	_ILI9325_drawBitmap
	global	_IOsetSpecial
	global	_IOsetDigital
	global	_IOsetRemap
	global	_setup
	global	_loop
	global	_pinguino_main
	global	_high_priority_isr
	global	_low_priority_isr
	global	_font

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrget3
	extern	__gptrput1
	extern	__gptrput3
	extern	__gptrget1
	extern	__gptrget4
	extern	__gptrget2
	extern	_PPSCONbits
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
	extern	_UIEbits
	extern	_UEIEbits
	extern	_UADDRbits
	extern	_UCFGbits
	extern	_PADCFG1bits
	extern	_REFOCONbits
	extern	_RTCCALbits
	extern	_RTCCFGbits
	extern	_ODCON3bits
	extern	_ODCON2bits
	extern	_ODCON1bits
	extern	_ANCON0bits
	extern	_ANCON1bits
	extern	_DSWAKELbits
	extern	_DSWAKEHbits
	extern	_DSCONLbits
	extern	_DSCONHbits
	extern	_TCLKCONbits
	extern	_CVRCONbits
	extern	_PMSTATLbits
	extern	_PMSTATHbits
	extern	_PMELbits
	extern	_PMEHbits
	extern	_PMMODELbits
	extern	_PMMODEHbits
	extern	_PMCONLbits
	extern	_PMCONHbits
	extern	_UFRMLbits
	extern	_UFRMHbits
	extern	_UIRbits
	extern	_UEIRbits
	extern	_USTATbits
	extern	_UCONbits
	extern	_PMADDRHbits
	extern	_CMSTATbits
	extern	_CMSTATUSbits
	extern	_SSP2CON2bits
	extern	_SSP2CON1bits
	extern	_SSP2STATbits
	extern	_SSP2ADDbits
	extern	_T4CONbits
	extern	_T3CONbits
	extern	_BAUDCON2bits
	extern	_BAUDCONbits
	extern	_BAUDCON1bits
	extern	_BAUDCTLbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_HLVDCONbits
	extern	_DMACON2bits
	extern	_DMACON1bits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_LATDbits
	extern	_LATEbits
	extern	_ALRMRPTbits
	extern	_ALRMCFGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_TRISDbits
	extern	_TRISEbits
	extern	_T3GCONbits
	extern	_T1GCONbits
	extern	_OSCTUNEbits
	extern	_RCSTA2bits
	extern	_PIE1bits
	extern	_PIR1bits
	extern	_IPR1bits
	extern	_PIE2bits
	extern	_PIR2bits
	extern	_IPR2bits
	extern	_PIE3bits
	extern	_PIR3bits
	extern	_IPR3bits
	extern	_EECON1bits
	extern	_TXSTA2bits
	extern	_RCSTAbits
	extern	_RCSTA1bits
	extern	_TXSTAbits
	extern	_TXSTA1bits
	extern	_CTMUICONbits
	extern	_CTMUCONLbits
	extern	_CTMUCONHbits
	extern	_CCP2CONbits
	extern	_ECCP2CONbits
	extern	_ECCP2DELbits
	extern	_PWM2CONbits
	extern	_ECCP2ASbits
	extern	_PSTR2CONbits
	extern	_CCP1CONbits
	extern	_ECCP1CONbits
	extern	_ECCP1DELbits
	extern	_PWM1CONbits
	extern	_ECCP1ASbits
	extern	_PSTR1CONbits
	extern	_WDTCONbits
	extern	_ADCON1bits
	extern	_ADCON0bits
	extern	_SSP1CON2bits
	extern	_SSPCON2bits
	extern	_SSP1CON1bits
	extern	_SSPCON1bits
	extern	_SSP1STATbits
	extern	_SSPSTATbits
	extern	_SSP1ADDbits
	extern	_SSPADDbits
	extern	_T2CONbits
	extern	_T1CONbits
	extern	_RCONbits
	extern	_CM2CONbits
	extern	_CM2CON1bits
	extern	_CM1CONbits
	extern	_CM1CON1bits
	extern	_OSCCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_STKPTRbits
	extern	_RPOR0
	extern	_RPOR1
	extern	_RPOR2
	extern	_RPOR3
	extern	_RPOR4
	extern	_RPOR5
	extern	_RPOR6
	extern	_RPOR7
	extern	_RPOR8
	extern	_RPOR9
	extern	_RPOR10
	extern	_RPOR11
	extern	_RPOR12
	extern	_RPOR13
	extern	_RPOR17
	extern	_RPOR18
	extern	_RPOR19
	extern	_RPOR20
	extern	_RPOR21
	extern	_RPOR22
	extern	_RPOR23
	extern	_RPOR24
	extern	_RPINR1
	extern	_RPINR2
	extern	_RPINR3
	extern	_RPINR4
	extern	_RPINR6
	extern	_RPINR7
	extern	_RPINR8
	extern	_RPINR12
	extern	_RPINR13
	extern	_RPINR16
	extern	_RPINR17
	extern	_RPINR21
	extern	_RPINR22
	extern	_RPINR23
	extern	_RPINR24
	extern	_PPSCON
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
	extern	_UIE
	extern	_UEIE
	extern	_UADDR
	extern	_UCFG
	extern	_PADCFG1
	extern	_REFOCON
	extern	_RTCCAL
	extern	_RTCCFG
	extern	_ODCON3
	extern	_ODCON2
	extern	_ODCON1
	extern	_ANCON0
	extern	_ANCON1
	extern	_DSWAKEL
	extern	_DSWAKEH
	extern	_DSCONL
	extern	_DSCONH
	extern	_DSGPR0
	extern	_DSGPR1
	extern	_TCLKCON
	extern	_CVRCON
	extern	_PMSTATL
	extern	_PMSTATH
	extern	_PMEL
	extern	_PMEH
	extern	_PMDIN2L
	extern	_PMDIN2H
	extern	_PMDOUT2L
	extern	_PMDOUT2H
	extern	_PMMODEL
	extern	_PMMODEH
	extern	_PMCONL
	extern	_PMCONH
	extern	_UFRM
	extern	_UFRML
	extern	_UFRMH
	extern	_UIR
	extern	_UEIR
	extern	_USTAT
	extern	_UCON
	extern	_DMABCH
	extern	_DMABCL
	extern	_RXADDRH
	extern	_RXADDRL
	extern	_TXADDRH
	extern	_TXADDRL
	extern	_PMDIN1L
	extern	_PMDIN1H
	extern	_PMADDRL
	extern	_PMDOUT1L
	extern	_PMADDRH
	extern	_PMDOUT1H
	extern	_CMSTAT
	extern	_CMSTATUS
	extern	_SSP2CON2
	extern	_SSP2CON1
	extern	_SSP2STAT
	extern	_SSP2ADD
	extern	_SSP2BUF
	extern	_T4CON
	extern	_PR4
	extern	_TMR4
	extern	_T3CON
	extern	_TMR3L
	extern	_TMR3H
	extern	_BAUDCON2
	extern	_SPBRGH2
	extern	_BAUDCON
	extern	_BAUDCON1
	extern	_BAUDCTL
	extern	_SPBRGH
	extern	_SPBRGH1
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_HLVDCON
	extern	_DMACON2
	extern	_DMACON1
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_LATD
	extern	_LATE
	extern	_ALRMVALL
	extern	_ALRMVALH
	extern	_ALRMRPT
	extern	_ALRMCFG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISD
	extern	_TRISE
	extern	_T3GCON
	extern	_RTCVALL
	extern	_RTCVALH
	extern	_T1GCON
	extern	_OSCTUNE
	extern	_RCSTA2
	extern	_PIE1
	extern	_PIR1
	extern	_IPR1
	extern	_PIE2
	extern	_PIR2
	extern	_IPR2
	extern	_PIE3
	extern	_PIR3
	extern	_IPR3
	extern	_EECON1
	extern	_EECON2
	extern	_TXSTA2
	extern	_TXREG2
	extern	_RCREG2
	extern	_SPBRG2
	extern	_RCSTA
	extern	_RCSTA1
	extern	_TXSTA
	extern	_TXSTA1
	extern	_TXREG
	extern	_TXREG1
	extern	_RCREG
	extern	_RCREG1
	extern	_SPBRG
	extern	_SPBRG1
	extern	_CTMUICON
	extern	_CTMUCONL
	extern	_CTMUCONH
	extern	_CCP2CON
	extern	_ECCP2CON
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_ECCP2DEL
	extern	_PWM2CON
	extern	_ECCP2AS
	extern	_PSTR2CON
	extern	_CCP1CON
	extern	_ECCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ECCP1DEL
	extern	_PWM1CON
	extern	_ECCP1AS
	extern	_PSTR1CON
	extern	_WDTCON
	extern	_ADCON1
	extern	_ADCON0
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSP1CON2
	extern	_SSPCON2
	extern	_SSP1CON1
	extern	_SSPCON1
	extern	_SSP1STAT
	extern	_SSPSTAT
	extern	_SSP1ADD
	extern	_SSPADD
	extern	_SSP1BUF
	extern	_SSPBUF
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_T1CON
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_CM2CON
	extern	_CM2CON1
	extern	_CM1CON
	extern	_CM1CON1
	extern	_OSCCON
	extern	_T0CON
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
	extern	__mulint

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
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW1	equ	0xfe3
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
__gie_status_	db	0x00
_i	db	0x00, 0x00, 0x00, 0x00


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
_pputchar	res	3

udata_main_1	udata
_pprinti_buffer_1_30	res	12

udata_main_2	udata
_pprintfl_buffer_1_38	res	12

udata_main_3	udata
_pprintfl_tmp_1_38	res	12

udata_main_4	udata
_pprintfl_helper_1_38	res	4

udata_main_5	udata
_pprint_scr_1_52	res	2

udata_main_6	udata
_psprintf2_out_1_73	res	3

udata_main_7	udata
_ILI9325_writeData_d_1_109	res	2

udata_main_8	udata
_ILI9325_readData_d_1_112	res	2

udata_main_9	udata
_ILI9325	res	29

udata_main_10	udata
_ILI9325_clearScreen_c_1_139	res	2

udata_main_11	udata
_ILI9325_clearWindow_c_1_142	res	2

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_main_ivec_0x1_high_priority_isr	code	0X000C08
ivec_0x1_high_priority_isr:
	GOTO	_high_priority_isr

; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_main_ivec_0x2_low_priority_isr	code	0X000C18
ivec_0x2_low_priority_isr:
	GOTO	_low_priority_isr

; I code from now on!
; ; Starting pCode block
S_main__low_priority_isr	code
_low_priority_isr:
;	.line	255; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	void low_priority_isr(void) __interrupt 2
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	267; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	}
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

; ; Starting pCode block
S_main__high_priority_isr	code
_high_priority_isr:
;	.line	164; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	void high_priority_isr(void) __interrupt 1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	241; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	}
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

; ; Starting pCode block
S_main__pinguino_main	code
_pinguino_main:
;	.line	69; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	void pinguino_main(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	74; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	OSCTUNEbits.PLLEN = 1;
	BSF	_OSCTUNEbits, 6
;	.line	75; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	while(pll_startup_counter--);
	MOVLW	0x58
	MOVWF	r0x00
	MOVLW	0x02
	MOVWF	r0x01
_01092_DS_:
	MOVFF	r0x00, r0x02
	MOVFF	r0x01, r0x03
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	MOVF	r0x02, W
	IORWF	r0x03, W
	BNZ	_01092_DS_
;	.line	78; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	PIE1 = 0;
	CLRF	_PIE1
;	.line	79; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	PIE2 = 0;
	CLRF	_PIE2
;	.line	81; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	IOsetSpecial();
	CALL	_IOsetSpecial
;	.line	82; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	IOsetDigital();
	CALL	_IOsetDigital
;	.line	83; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	IOsetRemap();
	CALL	_IOsetRemap
;	.line	143; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	setup();
	CALL	_setup
_01096_DS_:
;	.line	149; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/main.c	loop();
	CALL	_loop
	BRA	_01096_DS_
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	25; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	void loop()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	28; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	ILI9325_printf("i=%u \r\n", i++);
	MOVFF	_i, r0x00
	MOVFF	(_i + 1), r0x01
	MOVFF	(_i + 2), r0x02
	MOVFF	(_i + 3), r0x03
	BANKSEL	_i
	INCF	_i, F, B
	BNC	_01087_DS_
; removed redundant BANKSEL
	INCF	(_i + 1), F, B
	BNC	_01087_DS_
; removed redundant BANKSEL
	INCFSZ	(_i + 2), F, B
	BRA	_11108_DS_
; removed redundant BANKSEL
	INCF	(_i + 3), F, B
_11108_DS_:
_01087_DS_:
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	CALL	_ILI9325_printf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	32; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	Delayms(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
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
;	.line	16; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/source/user.c	ILI9325_init();
	CALL	_ILI9325_init
	RETURN	

; ; Starting pCode block
S_main__IOsetRemap	code
_IOsetRemap:
;	.line	82; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	SystemUnlock();
	CALL	_SystemUnlock
	BANKSEL	_PPSCONbits
;	.line	83; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	PPSCONbits.IOLOCK = 0;			// Turn off PPS Write Protect
	BCF	_PPSCONbits, 0, B
;	.line	84; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	SystemLock();
	CALL	_SystemLock
;	.line	105; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	SystemUnlock();
	CALL	_SystemUnlock
	BANKSEL	_PPSCONbits
;	.line	106; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	PPSCONbits.IOLOCK = 1;			// Turn on PPS Write Protect
	BSF	_PPSCONbits, 0, B
;	.line	107; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	SystemLock();
	CALL	_SystemLock
	RETURN	

; ; Starting pCode block
S_main__IOsetDigital	code
_IOsetDigital:
	BANKSEL	_ANCON0
;	.line	48; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	ANCON0 = 0xFF;				// AN0 to AN7  Digital I/O
	SETF	_ANCON0, B
;	.line	49; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	ANCON1 = 0x1F;				// AN8 to AN12 Digital I/O
	MOVLW	0x1f
	BANKSEL	_ANCON1
	MOVWF	_ANCON1, B
	RETURN	

; ; Starting pCode block
S_main__IOsetSpecial	code
_IOsetSpecial:
;	.line	38; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/io.c	}
	RETURN	

; ; Starting pCode block
S_main__ILI9325_drawBitmap	code
_ILI9325_drawBitmap:
;	.line	971; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_drawBitmap(u16 x, u16 y, u16 w, u16 h, u8* bitmap)
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
;	.line	973; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	drawBitmap(x, y, w, h, bitmap);
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
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
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_drawBitmap
	MOVLW	0x0b
	ADDWF	FSR1L, F
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
S_main__ILI9325_drawLine	code
_ILI9325_drawLine:
;	.line	966; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_drawLine(u16 x0, u16 y0, u16 x1, u16 y1)
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
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	968; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	drawLine(x0, y0, x1, y1);
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
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_drawLine
	MOVLW	0x08
	ADDWF	FSR1L, F
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
S_main__ILI9325_fillCircle	code
_ILI9325_fillCircle:
;	.line	961; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_fillCircle(u16 x, u16 y, u16 radius)
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
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
;	.line	963; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	fillCircle(x, y, radius);
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
	CALL	_fillCircle
	MOVLW	0x06
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
S_main__ILI9325_drawCircle	code
_ILI9325_drawCircle:
;	.line	956; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_drawCircle(u16 x, u16 y, u16 radius)
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
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
;	.line	958; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	drawCircle(x, y, radius);
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
	CALL	_drawCircle
	MOVLW	0x06
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
S_main__drawPixel	code
_drawPixel:
;	.line	951; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void drawPixel(u16 x, u16 y)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	953; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_drawPixel(x, y);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_exitSleep	code
_ILI9325_exitSleep:
;	.line	927; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl1,0x0000);// SAP, BT[3:0], AP, DSTB, SLP, STB
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	928; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl2,0x0007);//DC1[2:0], DC0[2:0], VC[2:0]
	CLRF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0x11
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	929; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl3,0x0000);//VREG1OUT voltage
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	930; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl4,0x0000); //VDV[4:0] for VCOM amplitude
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x13
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	931; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(200);
	CLRF	POSTDEC1
	MOVLW	0xc8
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	932; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl1,0x1490);//SAP, BT[3:0], AP, DSTB, SLP, STB
	MOVLW	0x14
	MOVWF	POSTDEC1
	MOVLW	0x90
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	933; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl2,0x0227);//DC1[2:0], DC0[2:0], VC[2:0]
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x11
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	934; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(50);
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	935; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl3,0x001C);//External reference voltage=Vci
	CLRF	POSTDEC1
	MOVLW	0x1c
	MOVWF	POSTDEC1
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	936; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(50);
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	937; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl4,0x1800);//VDV[4:0] for VCOM amplitude
	MOVLW	0x18
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x13
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	938; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl7,0x001C);//VCM[4:0] for VCOMH
	CLRF	POSTDEC1
	MOVLW	0x1c
	MOVWF	POSTDEC1
	MOVLW	0x29
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	939; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(50);
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	940; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DisplayControl1,0x0133);// 
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x33
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__ILI9325_enterSleep	code
_ILI9325_enterSleep:
;	.line	902; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DisplayControl1,0x0131);//setD1=0,D0=1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x31
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	903; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(10);//Wait for 2 frames or more
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	904; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DisplayControl1,0x0130);//setD1=0,D0=0
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	905; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(10);//Wait for 2 frames or more
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	906; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DisplayControl1,0x0000);//displayoff 
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	908; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl1,0x0000);//SAP,BT[3:0],AP,DSTB,SLP,STB
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	909; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl2,0x0000);//DC1[2:0],DC0[2:0],VC[2:0]
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x11
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	910; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl3,0x0000);//VREG1OUTvoltage
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	911; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl4,0x0000);//VDV[4:0]forVCOMamplitude
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x13
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	912; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(200);//dis-chargecapacitorpowervoltage
	CLRF	POSTDEC1
	MOVLW	0xc8
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	913; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl1,0x0002);//SAP,BT[3:0],APE,AP,DSTB,SLP
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__ILI9325_printf	code
_ILI9325_printf:
;	.line	877; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_printf(const u8 *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x50
	SUBWF	FSR1L, F
	BTFSS	STATUS, 0
	DECF	FSR1H, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
;	.line	884; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	va_start(args, fmt);
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
;	.line	887; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	length = psprintf2(buffer, fmt, args);
	MOVLW	0xb1
	ADDWF	FSR2L, W
	MOVWF	r0x03
	MOVLW	0xff
	ADDWFC	FSR2H, W
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	MOVWF	r0x04
	MOVWF	r0x06
	MOVF	r0x03, W
	MOVWF	r0x05
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
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_psprintf2
	MOVLW	0x09
	ADDWF	FSR1L, F
; #	MOVF	r0x04, W
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
; #	MOVF	r0x03, W
; #	MOVF	r0x03, W
; #	MOVWF	r0x03
;	.line	888; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_printString(buffer);
	MOVLW	0x80
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_printString
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	889; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	va_end(args);
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVWF	POSTINC1
	MOVLW	0x4f
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	COMF	WREG, F
	MOVF	PLUSW1, W
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_printString	code
_ILI9325_printString:
;	.line	830; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_printString(u8 *s)
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
_00996_DS_:
;	.line	834; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	while (c = *s++)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x00, F
	BNC	_01014_DS_
	INFSNZ	r0x01, F
	INCF	r0x02, F
_01014_DS_:
	MOVFF	r0x03, r0x04
	MOVF	r0x03, W
	BTFSC	STATUS, 2
	BRA	_00999_DS_
; #	MOVF	r0x04, W
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
;	.line	836; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	switch (c)
	MOVF	r0x04, W
	MOVWF	r0x03
	XORLW	0x0a
	BZ	_00991_DS_
	MOVF	r0x03, W
	XORLW	0x0d
	BNZ	_00992_DS_
;	.line	839; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if (ILI9325.cursor.y > (ILI9325.screen.endy - ILI9325.font.height))
	MOVFF	(_ILI9325 + 25), r0x03
	MOVFF	(_ILI9325 + 26), r0x05
	MOVFF	(_ILI9325 + 28), r0x06
	CLRF	r0x07
	MOVF	r0x06, W
	BANKSEL	(_ILI9325 + 7)
	SUBWF	(_ILI9325 + 7), W, B
	MOVWF	r0x08
	MOVF	r0x07, W
; removed redundant BANKSEL
	SUBWFB	(_ILI9325 + 8), W, B
	MOVWF	r0x09
	MOVF	r0x05, W
	SUBWF	r0x09, W
	BNZ	_01019_DS_
	MOVF	r0x03, W
	SUBWF	r0x08, W
_01019_DS_:
	BC	_00989_DS_
;	.line	845; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(VerticalScrollControl, 1);//ILI9325.font.height);	
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x6a
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00996_DS_
_00989_DS_:
;	.line	850; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.y += ILI9325.font.height;
	MOVF	r0x06, W
	ADDWF	r0x03, F
	MOVF	r0x07, W
	ADDWFC	r0x05, F
	MOVF	r0x03, W
	BANKSEL	(_ILI9325 + 25)
	MOVWF	(_ILI9325 + 25), B
	MOVF	r0x05, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 26), B
;	.line	852; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	break;
	BRA	_00996_DS_
_00991_DS_:
	BANKSEL	(_ILI9325 + 23)
;	.line	854; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.x = 0;
	CLRF	(_ILI9325 + 23), B
; removed redundant BANKSEL
	CLRF	(_ILI9325 + 24), B
;	.line	855; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	break;
	BRA	_00996_DS_
_00992_DS_:
	BANKSEL	(_ILI9325 + 26)
;	.line	857; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_printChar(c, ILI9325.cursor.x, ILI9325.cursor.y);
	MOVF	(_ILI9325 + 26), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 25), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 24), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 23), W, B
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_printChar
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	858; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.x += ILI9325.font.width;
	MOVFF	(_ILI9325 + 27), r0x03
	CLRF	r0x04
	BANKSEL	(_ILI9325 + 23)
	MOVF	(_ILI9325 + 23), W, B
	ADDWF	r0x03, F
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 24), W, B
	ADDWFC	r0x04, F
	MOVF	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 23), B
	MOVF	r0x04, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 24), B
; removed redundant BANKSEL
;	.line	859; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if (ILI9325.cursor.x > ILI9325.screen.endx)
	SUBWF	(_ILI9325 + 6), W, B
	BNZ	_01020_DS_
	MOVF	r0x03, W
; removed redundant BANKSEL
	SUBWF	(_ILI9325 + 5), W, B
_01020_DS_:
	BTFSC	STATUS, 0
	BRA	_00996_DS_
	BANKSEL	(_ILI9325 + 23)
;	.line	861; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.x = 0;
	CLRF	(_ILI9325 + 23), B
; removed redundant BANKSEL
	CLRF	(_ILI9325 + 24), B
;	.line	862; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.y += ILI9325.font.height;
	MOVFF	(_ILI9325 + 28), r0x03
	CLRF	r0x04
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 25), W, B
	ADDWF	r0x03, F
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 26), W, B
	ADDWFC	r0x04, F
	MOVF	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 25), B
	MOVF	r0x04, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 26), B
;	.line	864; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	}
	BRA	_00996_DS_
_00999_DS_:
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
S_main__ILI9325_printChar	code
_ILI9325_printChar:
;	.line	796; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_printChar(u8 c, u16 x, u16 y)
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
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	802; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	offset = ((c-32) * ILI9325.font.height);    // 32 first characters are not included in the font
	CLRF	r0x05
	MOVLW	0xe0
	ADDWF	r0x00, F
	BTFSS	STATUS, 0
	DECF	r0x05, F
	MOVFF	(_ILI9325 + 28), r0x06
	CLRF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	803; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GRAMHorizontalAddressSet, x);	// setCursor
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	804; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	for (j = 0; j < ILI9325.font.height; j++)
	CLRF	r0x01
_00962_DS_:
	BANKSEL	(_ILI9325 + 28)
	MOVF	(_ILI9325 + 28), W, B
	SUBWF	r0x01, W
	BTFSC	STATUS, 0
	BRA	_00966_DS_
;	.line	806; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GRAMVerticalAddressSet, y + j);
	MOVFF	r0x01, r0x02
	CLRF	r0x06
	MOVF	r0x03, W
	ADDWF	r0x02, F
	MOVF	r0x04, W
	ADDWFC	r0x06, F
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x21
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	807; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	by = font[offset++];
	MOVFF	r0x00, r0x02
	MOVFF	r0x05, r0x06
	INFSNZ	r0x00, F
	INCF	r0x05, F
	CLRF	r0x07
	MOVLW	LOW(_font)
	ADDWF	r0x02, F
	MOVLW	HIGH(_font)
	ADDWFC	r0x06, F
	MOVLW	UPPER(_font)
	ADDWFC	r0x07, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x06, TBLPTRH
	MOVFF	r0x07, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
;	.line	808; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	for (i = 0; i < 8; i++)
	CLRF	r0x06
_00958_DS_:
	MOVLW	0x08
	SUBWF	r0x06, W
	BC	_00964_DS_
;	.line	811; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if (by&0x80) // Foreground color		   
	BTFSS	r0x02, 7
	BRA	_00956_DS_
	BANKSEL	(_ILI9325 + 22)
;	.line	812; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(WriteDatatoGRAM, ILI9325.color.c);
	MOVF	(_ILI9325 + 22), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 21), W, B
	MOVWF	POSTDEC1
	MOVLW	0x22
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00957_DS_
_00956_DS_:
	BANKSEL	(_ILI9325 + 17)
;	.line	814; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(WriteDatatoGRAM, ILI9325.bcolor.c);
	MOVF	(_ILI9325 + 17), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 16), W, B
	MOVWF	POSTDEC1
	MOVLW	0x22
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
_00957_DS_:
;	.line	815; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	by <<= 1;    // Shift out bits right
	BCF	STATUS, 0
	RLCF	r0x02, F
;	.line	808; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	for (i = 0; i < 8; i++)
	INCF	r0x06, F
	BRA	_00958_DS_
_00964_DS_:
;	.line	804; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	for (j = 0; j < ILI9325.font.height; j++)
	INCF	r0x01, F
	BRA	_00962_DS_
_00966_DS_:
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
S_main__ILI9325_scroll	code
_ILI9325_scroll:
;	.line	771; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_scroll(u16 pixels)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
_00940_DS_:
;	.line	778; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	while (y >= 320)
	MOVLW	0x01
	SUBWF	r0x01, W
	BNZ	_00950_DS_
	MOVLW	0x40
	SUBWF	r0x00, W
_00950_DS_:
	BNC	_00942_DS_
;	.line	779; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	y -= 320;    
	MOVLW	0xc0
	ADDWF	r0x00, F
	MOVLW	0xfe
	ADDWFC	r0x01, F
	BRA	_00940_DS_
_00942_DS_:
;	.line	782; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(VerticalScrollControl, y);	
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x6a
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_getScreenHeight	code
_ILI9325_getScreenHeight:
	BANKSEL	_ILI9325
;	.line	756; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if (ILI9325.orientation == PORTRAIT)
	MOVF	_ILI9325, W, B
	XORLW	0x64
	BNZ	_00925_DS_
;	.line	757; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return ILI9325.screen.height;
	MOVFF	(_ILI9325 + 12), PRODL
	BANKSEL	(_ILI9325 + 11)
	MOVF	(_ILI9325 + 11), W, B
	BRA	_00927_DS_
_00925_DS_:
;	.line	759; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return ILI9325.screen.width;
	MOVFF	(_ILI9325 + 10), PRODL
	BANKSEL	(_ILI9325 + 9)
	MOVF	(_ILI9325 + 9), W, B
_00927_DS_:
	RETURN	

; ; Starting pCode block
S_main__ILI9325_getScreenWidth	code
_ILI9325_getScreenWidth:
	BANKSEL	_ILI9325
;	.line	748; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if (ILI9325.orientation == PORTRAIT)
	MOVF	_ILI9325, W, B
	XORLW	0x64
	BNZ	_00912_DS_
;	.line	749; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return ILI9325.screen.width;
	MOVFF	(_ILI9325 + 10), PRODL
	BANKSEL	(_ILI9325 + 9)
	MOVF	(_ILI9325 + 9), W, B
	BRA	_00914_DS_
_00912_DS_:
;	.line	751; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return ILI9325.screen.height;
	MOVFF	(_ILI9325 + 12), PRODL
	BANKSEL	(_ILI9325 + 11)
	MOVF	(_ILI9325 + 11), W, B
_00914_DS_:
	RETURN	

; ; Starting pCode block
S_main__ILI9325_getOrientation	code
_ILI9325_getOrientation:
	BANKSEL	_ILI9325
;	.line	743; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return ILI9325.orientation;
	MOVF	_ILI9325, W, B
	RETURN	

; ; Starting pCode block
S_main__ILI9325_setLandscape	code
_ILI9325_setLandscape:
;	.line	726; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.orientation = LANDSCAPE;
	MOVLW	0x65
	BANKSEL	_ILI9325
	MOVWF	_ILI9325, B
;	.line	731; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(EntryMode, 0x1028); // 0x28 = 0b00101000;
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x28
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	733; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DriverOutputControl, 0x0000);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	737; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setWindow(0, 0, 319, 239);
	CLRF	POSTDEC1
	MOVLW	0xef
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x3f
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_ILI9325_setWindow
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	738; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_clearScreen();
	CALL	_ILI9325_clearScreen
	RETURN	

; ; Starting pCode block
S_main__ILI9325_setPortrait	code
_ILI9325_setPortrait:
;	.line	708; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.orientation = PORTRAIT;
	MOVLW	0x64
	BANKSEL	_ILI9325
	MOVWF	_ILI9325, B
;	.line	709; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.font.width = ILI9325_getFontWidth();
	CALL	_ILI9325_getFontWidth
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	BANKSEL	(_ILI9325 + 27)
	MOVWF	(_ILI9325 + 27), B
;	.line	710; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.font.height= ILI9325_getFontHeight();
	CALL	_ILI9325_getFontHeight
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	BANKSEL	(_ILI9325 + 28)
	MOVWF	(_ILI9325 + 28), B
;	.line	714; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(EntryMode, 0x1030); // 0x30 = 0b00110000;
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	716; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DriverOutputControl, 0x0100);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	720; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setWindow(0, 0, 239, 319);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x3f
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0xef
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_ILI9325_setWindow
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	721; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_clearScreen();
	CALL	_ILI9325_clearScreen
	RETURN	

; ; Starting pCode block
S_main__ILI9325_clearWindow	code
_ILI9325_clearWindow:
;	.line	653; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_clearWindow(u16 x1, u16 y1, u16 x2, u16 y2)
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
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	656; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	u32 i=((x2-x1+1)*(y2-y1+1));                // height * width
	MOVF	r0x00, W
	SUBWF	r0x04, F
	MOVF	r0x01, W
	SUBWFB	r0x05, F
	INFSNZ	r0x04, F
	INCF	r0x05, F
	MOVF	r0x02, W
	SUBWF	r0x06, F
	MOVF	r0x03, W
	SUBWFB	r0x07, F
	INFSNZ	r0x06, F
	INCF	r0x07, F
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x06
	CLRF	r0x07
	BANKSEL	(_ILI9325 + 16)
;	.line	658; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	c.w = ILI9325.bcolor.c;						// current background color
	MOVF	(_ILI9325 + 16), W, B
	BANKSEL	_ILI9325_clearWindow_c_1_142
	MOVWF	_ILI9325_clearWindow_c_1_142, B
	BANKSEL	(_ILI9325 + 17)
	MOVF	(_ILI9325 + 17), W, B
	BANKSEL	(_ILI9325_clearWindow_c_1_142 + 1)
	MOVWF	(_ILI9325_clearWindow_c_1_142 + 1), B
;	.line	660; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setCursor(x1, y1);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_setCursor
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	664; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_writeRegister(WriteDatatoGRAM);		// write GRAM
	MOVLW	0x22
	MOVWF	POSTDEC1
	CALL	_ILI9325_writeRegister
	MOVF	POSTINC1, F
;	.line	666; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRS;	// Disable Register Selection Signal
	BSF	_LATA, 0
;	.line	667; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRD; // Disable Read Mode
	BSF	_LATA, 2
;	.line	668; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR; // Disable Write Mode
	BSF	_LATA, 1
;	.line	670; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	while (i--)
	MOVFF	r0x04, r0x00
	MOVFF	r0x05, r0x01
	MOVFF	r0x06, r0x02
	MOVFF	r0x07, r0x03
_00888_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BZ	_00891_DS_
;	.line	672; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	DATA = c.h8;
	MOVFF	(_ILI9325_clearWindow_c_1_142 + 1), _LATB
;	.line	673; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowWR;	// Enable Write
	MOVF	_LATA, W
	MOVWF	r0x04
	MOVLW	0xfd
	ANDWF	r0x04, W
	MOVWF	_LATA
;	.line	674; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR;	// Disable Write
	BSF	_LATA, 1
;	.line	676; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	DATA = c.l8;
	MOVFF	_ILI9325_clearWindow_c_1_142, _LATB
;	.line	677; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowWR;	// Enable Write
	MOVF	_LATA, W
	MOVWF	r0x04
	MOVLW	0xfd
	ANDWF	r0x04, W
	MOVWF	_LATA
;	.line	678; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR;	// Disable Write
	BSF	_LATA, 1
	BRA	_00888_DS_
_00891_DS_:
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
S_main__ILI9325_clearScreen	code
_ILI9325_clearScreen:
;	.line	608; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_clearScreen()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	BANKSEL	(_ILI9325 + 16)
;	.line	613; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	c.w = ILI9325.bcolor.c;						// current background color
	MOVF	(_ILI9325 + 16), W, B
	BANKSEL	_ILI9325_clearScreen_c_1_139
	MOVWF	_ILI9325_clearScreen_c_1_139, B
	BANKSEL	(_ILI9325 + 17)
	MOVF	(_ILI9325 + 17), W, B
	BANKSEL	(_ILI9325_clearScreen_c_1_139 + 1)
	MOVWF	(_ILI9325_clearScreen_c_1_139 + 1), B
;	.line	615; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setCursor(0, 0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_ILI9325_setCursor
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	625; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_writeRegister(WriteDatatoGRAM);		// write GRAM
	MOVLW	0x22
	MOVWF	POSTDEC1
	CALL	_ILI9325_writeRegister
	MOVF	POSTINC1, F
;	.line	627; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRS;	// Disable Register Selection Signal
	BSF	_LATA, 0
;	.line	628; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRD; // Disable Read Mode
	BSF	_LATA, 2
;	.line	629; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR; // Disable Write Mode
	BSF	_LATA, 1
;	.line	631; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	while (i--)
	CLRF	r0x00
	MOVLW	0x2c
	MOVWF	r0x01
	MOVLW	0x01
	MOVWF	r0x02
	CLRF	r0x03
_00880_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BZ	_00883_DS_
;	.line	633; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	DATA = c.h8;
	MOVFF	(_ILI9325_clearScreen_c_1_139 + 1), _LATB
;	.line	634; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowWR;	// Enable Write
	MOVF	_LATA, W
	MOVWF	r0x04
	MOVLW	0xfd
	ANDWF	r0x04, W
	MOVWF	_LATA
;	.line	635; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR;	// Disable Write
	BSF	_LATA, 1
;	.line	637; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	DATA = c.l8;
	MOVFF	_ILI9325_clearScreen_c_1_139, _LATB
;	.line	638; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowWR;	// Enable Write
	MOVF	_LATA, W
	MOVWF	r0x04
	MOVLW	0xfd
	ANDWF	r0x04, W
	MOVWF	_LATA
;	.line	639; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR;	// Disable Write
	BSF	_LATA, 1
	BRA	_00880_DS_
_00883_DS_:
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__ILI9325_setWindow	code
_ILI9325_setWindow:
;	.line	579; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_setWindow(u16 x1, u16 y1, u16 x2, u16 y2)
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
;	.line	581; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.startx = x1;
	MOVF	r0x00, W
	BANKSEL	(_ILI9325 + 1)
	MOVWF	(_ILI9325 + 1), B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 2), B
;	.line	582; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.starty = y1;
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 3), B
	MOVF	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 4), B
;	.line	583; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.endx = x2;
	MOVF	r0x04, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 5), B
	MOVF	r0x05, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 6), B
;	.line	584; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.endy = y2;
	MOVF	r0x06, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 7), B
	MOVF	r0x07, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 8), B
;	.line	585; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.width = x2 - x1;
	MOVF	r0x00, W
	SUBWF	r0x04, W
	MOVWF	r0x08
	MOVF	r0x01, W
	SUBWFB	r0x05, W
	MOVWF	r0x09
	MOVF	r0x08, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 9), B
	MOVF	r0x09, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 10), B
;	.line	586; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.height = y2 - y1;
	MOVF	r0x02, W
	SUBWF	r0x06, W
	MOVWF	r0x08
	MOVF	r0x03, W
	SUBWFB	r0x07, W
	MOVWF	r0x09
	MOVF	r0x08, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 11), B
	MOVF	r0x09, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 12), B
;	.line	590; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(HorizontalRAMStartAddressPosition, x1);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x50
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	591; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(HorizontalRAMEndAddressPosition, x2);
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVLW	0x51
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	592; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(VerticalRAMStartAddressPosition, y1);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x52
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	593; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(VerticalRAMEndAddressPosition, y2);
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVLW	0x53
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	597; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setCursor(x1, y1);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_setCursor
	MOVLW	0x04
	ADDWF	FSR1L, F
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
S_main__ILI9325_readPixel	code
_ILI9325_readPixel:
;	.line	554; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	u16 ILI9325_readPixel(u16 x, u16 y)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	558; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if ((x > ILI9325.screen.endx) || (y > ILI9325.screen.endy)) return 0;
	MOVF	r0x01, W
	BANKSEL	(_ILI9325 + 6)
	SUBWF	(_ILI9325 + 6), W, B
	BNZ	_00869_DS_
	MOVF	r0x00, W
; removed redundant BANKSEL
	SUBWF	(_ILI9325 + 5), W, B
_00869_DS_:
	BNC	_00862_DS_
	MOVF	r0x03, W
	BANKSEL	(_ILI9325 + 8)
	SUBWF	(_ILI9325 + 8), W, B
	BNZ	_00870_DS_
	MOVF	r0x02, W
; removed redundant BANKSEL
	SUBWF	(_ILI9325 + 7), W, B
_00870_DS_:
	BC	_00863_DS_
_00862_DS_:
	CLRF	PRODL
	CLRF	WREG
	BRA	_00865_DS_
_00863_DS_:
;	.line	559; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setCursor(x, y);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_setCursor
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	561; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	c = ILI9325_read(ReadDatatoGRAM);
	MOVLW	0x22
	MOVWF	POSTDEC1
	CALL	_ILI9325_read
	MOVFF	PRODL, r0x01
	MOVF	POSTINC1, F
;	.line	564; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return c;
	MOVFF	r0x01, PRODL
_00865_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_delPixel	code
_ILI9325_delPixel:
;	.line	535; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_delPixel(u16 x, u16 y)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	537; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if ((x > ILI9325.screen.endx) || (y > ILI9325.screen.endy)) return;
	MOVF	r0x01, W
	BANKSEL	(_ILI9325 + 6)
	SUBWF	(_ILI9325 + 6), W, B
	BNZ	_00856_DS_
	MOVF	r0x00, W
; removed redundant BANKSEL
	SUBWF	(_ILI9325 + 5), W, B
_00856_DS_:
	BNC	_00852_DS_
	MOVF	r0x03, W
	BANKSEL	(_ILI9325 + 8)
	SUBWF	(_ILI9325 + 8), W, B
	BNZ	_00857_DS_
	MOVF	r0x02, W
; removed redundant BANKSEL
	SUBWF	(_ILI9325 + 7), W, B
_00857_DS_:
	BC	_00850_DS_
_00849_DS_:
	BRA	_00852_DS_
_00850_DS_:
;	.line	538; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setCursor(x, y);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_setCursor
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	(_ILI9325 + 17)
;	.line	540; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(WriteDatatoGRAM, ILI9325.bcolor.c);// write color to GRAM
	MOVF	(_ILI9325 + 17), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 16), W, B
	MOVWF	POSTDEC1
	MOVLW	0x22
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
_00852_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_drawPixel	code
_ILI9325_drawPixel:
;	.line	517; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_drawPixel(u16 x, u16 y)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	519; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if ((x > ILI9325.screen.endx) || (y > ILI9325.screen.endy)) return;
	MOVF	r0x01, W
	BANKSEL	(_ILI9325 + 6)
	SUBWF	(_ILI9325 + 6), W, B
	BNZ	_00843_DS_
	MOVF	r0x00, W
; removed redundant BANKSEL
	SUBWF	(_ILI9325 + 5), W, B
_00843_DS_:
	BNC	_00839_DS_
	MOVF	r0x03, W
	BANKSEL	(_ILI9325 + 8)
	SUBWF	(_ILI9325 + 8), W, B
	BNZ	_00844_DS_
	MOVF	r0x02, W
; removed redundant BANKSEL
	SUBWF	(_ILI9325 + 7), W, B
_00844_DS_:
	BC	_00837_DS_
_00836_DS_:
	BRA	_00839_DS_
_00837_DS_:
;	.line	520; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setCursor(x, y);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_setCursor
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	(_ILI9325 + 22)
;	.line	522; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(WriteDatatoGRAM, ILI9325.color.c);// write color to GRAM
	MOVF	(_ILI9325 + 22), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 21), W, B
	MOVWF	POSTDEC1
	MOVLW	0x22
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
_00839_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_setCursor	code
_ILI9325_setCursor:
;	.line	489; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_setCursor(u16 x, u16 y)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	BANKSEL	_ILI9325
;	.line	491; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if (ILI9325.orientation == LANDSCAPE)
	MOVF	_ILI9325, W, B
	XORLW	0x65
	BNZ	_00824_DS_
;	.line	493; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.x = y;			// save current position
	MOVF	r0x02, W
	BANKSEL	(_ILI9325 + 23)
	MOVWF	(_ILI9325 + 23), B
	MOVF	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 24), B
;	.line	494; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.y = x;
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 25), B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 26), B
	BRA	_00825_DS_
_00824_DS_:
;	.line	498; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.x = x;			// save current position
	MOVF	r0x00, W
	BANKSEL	(_ILI9325 + 23)
	MOVWF	(_ILI9325 + 23), B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 24), B
;	.line	499; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.y = y;
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 25), B
	MOVF	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 26), B
_00825_DS_:
	BANKSEL	(_ILI9325 + 24)
;	.line	503; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GRAMHorizontalAddressSet, ILI9325.cursor.x);
	MOVF	(_ILI9325 + 24), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 23), W, B
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	BANKSEL	(_ILI9325 + 26)
;	.line	504; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GRAMVerticalAddressSet, ILI9325.cursor.y);
	MOVF	(_ILI9325 + 26), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_ILI9325 + 25), W, B
	MOVWF	POSTDEC1
	MOVLW	0x21
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_test	code
_ILI9325_test:
;	.line	451; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_test(void)
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
;	.line	455; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setCursor(0,0);	// set cursor home
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_ILI9325_setCursor
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	459; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_writeRegister(WriteDatatoGRAM);		// write GRAM
	MOVLW	0x22
	MOVWF	POSTDEC1
	CALL	_ILI9325_writeRegister
	MOVF	POSTINC1, F
;	.line	460; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	for (i=ILI9325.screen.starty; i<ILI9325.screen.endy; i++)
	MOVFF	(_ILI9325 + 3), r0x00
	MOVFF	(_ILI9325 + 4), r0x01
	CLRF	r0x02
	CLRF	r0x03
_00791_DS_:
	MOVFF	(_ILI9325 + 7), r0x04
	MOVFF	(_ILI9325 + 8), r0x05
	CLRF	r0x06
	CLRF	r0x07
	MOVF	r0x07, W
	SUBWF	r0x03, W
	BNZ	_00811_DS_
	MOVF	r0x06, W
	SUBWF	r0x02, W
	BNZ	_00811_DS_
	MOVF	r0x05, W
	SUBWF	r0x01, W
	BNZ	_00811_DS_
	MOVF	r0x04, W
	SUBWF	r0x00, W
_00811_DS_:
	BTFSC	STATUS, 0
	BRA	_00795_DS_
;	.line	462; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	for (j=ILI9325.screen.startx; j<ILI9325.screen.endx; j++)
	MOVFF	(_ILI9325 + 1), r0x04
	MOVFF	(_ILI9325 + 2), r0x05
	CLRF	r0x06
	CLRF	r0x07
	MOVLW	0x00
	SUBWF	r0x03, W
	BNZ	_00813_DS_
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00813_DS_
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00813_DS_
	MOVLW	0xd6
	SUBWF	r0x00, W
_00813_DS_:
	CLRF	r0x08
	RLCF	r0x08, F
	MOVLW	0x00
	SUBWF	r0x03, W
	BNZ	_00815_DS_
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00815_DS_
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00815_DS_
	MOVLW	0x6b
	SUBWF	r0x00, W
_00815_DS_:
	CLRF	r0x09
	RLCF	r0x09, F
_00787_DS_:
	MOVFF	(_ILI9325 + 5), r0x0a
	MOVFF	(_ILI9325 + 6), r0x0b
	CLRF	r0x0c
	CLRF	r0x0d
	MOVF	r0x0d, W
	SUBWF	r0x07, W
	BNZ	_00816_DS_
	MOVF	r0x0c, W
	SUBWF	r0x06, W
	BNZ	_00816_DS_
	MOVF	r0x0b, W
	SUBWF	r0x05, W
	BNZ	_00816_DS_
	MOVF	r0x0a, W
	SUBWF	r0x04, W
_00816_DS_:
	BC	_00793_DS_
;	.line	464; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	if (i>213) ILI9325_writeData(Red);
	MOVF	r0x08, W
	BZ	_00785_DS_
	MOVLW	0xf8
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_ILI9325_writeData
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BRA	_00789_DS_
_00785_DS_:
;	.line	465; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	else if(i>106) ILI9325_writeData(White);
	MOVF	r0x09, W
	BZ	_00782_DS_
	MOVLW	0xff
	SETF	POSTDEC1
	SETF	POSTDEC1
	CALL	_ILI9325_writeData
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BRA	_00789_DS_
_00782_DS_:
;	.line	466; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	else ILI9325_writeData(Blue);
	CLRF	POSTDEC1
	MOVLW	0x1f
	MOVWF	POSTDEC1
	CALL	_ILI9325_writeData
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00789_DS_:
;	.line	462; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	for (j=ILI9325.screen.startx; j<ILI9325.screen.endx; j++)
	INCF	r0x04, F
	BNC	_00787_DS_
	INCF	r0x05, F
	BNC	_00787_DS_
	INFSNZ	r0x06, F
	INCF	r0x07, F
_00817_DS_:
	BRA	_00787_DS_
_00793_DS_:
;	.line	460; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	for (i=ILI9325.screen.starty; i<ILI9325.screen.endy; i++)
	INCF	r0x00, F
	BNC	_00791_DS_
	INCF	r0x01, F
	BNC	_00791_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
_00818_DS_:
	BRA	_00791_DS_
_00795_DS_:
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
	RETURN	

; ; Starting pCode block
S_main__ILI9325_setBackgroundColor	code
_ILI9325_setBackgroundColor:
;	.line	435; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_setBackgroundColor(u16 color)
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
;	.line	437; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.bcolor.r = (color >> 11) & 0x1f;
	SWAPF	r0x01, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x02
	MOVLW	0x1f
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BANKSEL	(_ILI9325 + 13)
	MOVWF	(_ILI9325 + 13), B
;	.line	438; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.bcolor.g = (color >> 5)  & 0x3f;
	SWAPF	r0x00, W
	ANDLW	0x0f
	MOVWF	r0x02
	SWAPF	r0x01, W
	MOVWF	r0x03
	ANDLW	0xf0
	XORWF	r0x03, F
	ADDWF	r0x02, F
	RRCF	r0x03, F
	RRCF	r0x02, F
	MOVLW	0x3f
	ANDWF	r0x02, F
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 14), B
;	.line	439; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.bcolor.b = (color >> 0)  & 0x1f;
	MOVFF	r0x00, r0x02
	MOVLW	0x1f
	ANDWF	r0x02, F
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 15), B
;	.line	440; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.bcolor.c = color; // ILI9325_color565(r,g,b);
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 16), B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 17), B
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_setColor	code
_ILI9325_setColor:
;	.line	418; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_setColor(u16 color)
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
;	.line	420; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.color.r = (color >> 11) & 0x1f;
	SWAPF	r0x01, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x02
	MOVLW	0x1f
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BANKSEL	(_ILI9325 + 18)
	MOVWF	(_ILI9325 + 18), B
;	.line	421; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.color.g = (color >> 5)  & 0x3f;
	SWAPF	r0x00, W
	ANDLW	0x0f
	MOVWF	r0x02
	SWAPF	r0x01, W
	MOVWF	r0x03
	ANDLW	0xf0
	XORWF	r0x03, F
	ADDWF	r0x02, F
	RRCF	r0x03, F
	RRCF	r0x02, F
	MOVLW	0x3f
	ANDWF	r0x02, F
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 19), B
;	.line	422; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.color.b = (color >> 0)  & 0x1f;
	MOVFF	r0x00, r0x02
	MOVLW	0x1f
	ANDWF	r0x02, F
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 20), B
;	.line	423; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.color.c = color; // ILI9325_color565(r,g,b);
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 21), B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 22), B
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_color565	code
_ILI9325_color565:
;	.line	393; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	u16 ILI9325_color565(u8 r, u8 g, u8 b)
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
;	.line	406; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return ((r >> 3) << 11) | ((g >> 2) << 5) | (b >> 3);
	SWAPF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x00
	SWAPF	r0x00, W
	RRNCF	WREG, W
	ANDLW	0xf8
	MOVWF	r0x05
	CLRF	r0x04
	RRNCF	r0x01, W
	RRNCF	WREG, W
	ANDLW	0x3f
	MOVWF	r0x01
	CLRF	r0x00
	SWAPF	r0x00, W
	ANDLW	0xf0
	MOVWF	r0x06
	SWAPF	r0x01, W
	MOVWF	r0x03
	ANDLW	0x0f
	XORWF	r0x03, F
	ADDWF	r0x06, F
	RLCF	r0x03, F
	RLCF	r0x06, F
	MOVF	r0x03, W
	IORWF	r0x04, F
	MOVF	r0x06, W
	IORWF	r0x05, F
	SWAPF	r0x02, W
	RLNCF	WREG, W
	ANDLW	0x1f
	IORWF	r0x04, F
	MOVF	r0x00, W
	IORWF	r0x05, F
	MOVFF	r0x05, PRODL
	MOVF	r0x04, W
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
S_main__ILI9325_init	code
_ILI9325_init:
;	.line	225; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.orientation = PORTRAIT;
	MOVLW	0x64
	BANKSEL	_ILI9325
	MOVWF	_ILI9325, B
; removed redundant BANKSEL
;	.line	226; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.x = 0;
	CLRF	(_ILI9325 + 23), B
; removed redundant BANKSEL
	CLRF	(_ILI9325 + 24), B
; removed redundant BANKSEL
;	.line	227; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.cursor.y = 0;
	CLRF	(_ILI9325 + 25), B
; removed redundant BANKSEL
	CLRF	(_ILI9325 + 26), B
; removed redundant BANKSEL
;	.line	228; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.startx = 0;
	CLRF	(_ILI9325 + 1), B
; removed redundant BANKSEL
	CLRF	(_ILI9325 + 2), B
; removed redundant BANKSEL
;	.line	229; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.starty = 0;
	CLRF	(_ILI9325 + 3), B
; removed redundant BANKSEL
	CLRF	(_ILI9325 + 4), B
;	.line	230; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.endx = 239;
	MOVLW	0xef
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 5), B
; removed redundant BANKSEL
	CLRF	(_ILI9325 + 6), B
;	.line	231; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.endy = 319;
	MOVLW	0x3f
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 7), B
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 8), B
;	.line	232; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.width = 240;
	MOVLW	0xf0
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 9), B
; removed redundant BANKSEL
	CLRF	(_ILI9325 + 10), B
;	.line	233; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.screen.height = 320;
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 11), B
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	(_ILI9325 + 12), B
;	.line	234; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.font.width = ILI9325_getFontWidth();
	CALL	_ILI9325_getFontWidth
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	BANKSEL	(_ILI9325 + 27)
	MOVWF	(_ILI9325 + 27), B
;	.line	235; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325.font.height= ILI9325_getFontHeight();
	CALL	_ILI9325_getFontHeight
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	BANKSEL	(_ILI9325 + 28)
	MOVWF	(_ILI9325 + 28), B
;	.line	240; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	dDATA = 0x00;
	CLRF	_TRISB
;	.line	241; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	dCMD  = 0x00;
	CLRF	_TRISA
;	.line	252; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	DATA = 0x00;
	CLRF	_LATB
;	.line	281; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DriverOutputControl, 0x0100); // SS=1 (shift dir. to the right)
	MOVLW	0x01
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	282; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(EntryMode, 0x1030);		    //set GRAM write direction and BGR=1 PORTRAIT MODE
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	283; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(LCDDrivingWaveControl, 0x0700); // set 1 line inversion
	MOVLW	0x07
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	286; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DisplayControl2, 0x0202); // set the back porch and front porch to 4 lines
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	287; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DisplayControl3, 0x0000); // set non-display area refresh cycle ISC[3:0]
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x09
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	288; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DisplayControl4, 0x0000); // FMARK function
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	294; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl1, 0x0000); // SAP, BT[3:0], AP, DSTB, SLP, STB
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	295; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl2, 0x0007); // DC1[2:0], DC0[2:0], VC[2:0]
	CLRF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0x11
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	296; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl3, 0x0000); // VREG1OUT voltage
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	297; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl4, 0x0000); // VDV[4:0] for VCOM amplitude
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x13
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	298; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(200); // Discharge capacitor power voltage
	CLRF	POSTDEC1
	MOVLW	0xc8
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	300; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl1, 0x1690); // SAP=1, BT[3:0]=110, APE=1, AP=001, DSTB=0, SLP=0, STB=0
	MOVLW	0x16
	MOVWF	POSTDEC1
	MOVLW	0x90
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	301; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl2, 0x0000); // DC1[2:0]=010, DC0[2:0]=010, VC[2:0]=000
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x11
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	302; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(50);
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	304; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl3, 0x001F); // External reference voltage= Vci;
	CLRF	POSTDEC1
	MOVLW	0x1f
	MOVWF	POSTDEC1
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	305; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(50);
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	307; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PowerControl4, 0x1F00); // R13=1200 when R12=009D;VDV[4:0] for VCOM amplitude
	MOVLW	0x1f
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x13
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	309; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(50);
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	316; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl1, 0x0007);
	CLRF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	317; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl2, 0x0107);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0x31
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	318; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl3, 0x0000);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	319; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl4, 0x0203);
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0x35
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	320; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl5, 0x0402);
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x36
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	321; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl6, 0x0000);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x37
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	322; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl7, 0x0207);
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0x38
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	323; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl8, 0x0000);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x39
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	324; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl9, 0x0203);
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0x3c
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	325; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(GammaControl10, 0x0403);
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0x3d
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	332; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(HorizontalRAMStartAddressPosition, 0x0000); // Horizontal GRAM Start Address
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x50
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	333; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(HorizontalRAMEndAddressPosition, 239); // Horizontal GRAM End Address
	CLRF	POSTDEC1
	MOVLW	0xef
	MOVWF	POSTDEC1
	MOVLW	0x51
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	334; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(VerticalRAMStartAddressPosition, 0x0000); // Vertical GRAM Start Address
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x52
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	335; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(VerticalRAMEndAddressPosition, 319); // Vertical GRAM Start Address
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x3f
	MOVWF	POSTDEC1
	MOVLW	0x53
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	337; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DriverOutputControl2, 0xA700); // Gate Scan Line
	MOVLW	0xa7
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x60
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	338; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(BaseImageDisplayControl, 0x0001);//b111); // NDL, VLE, REV
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x61
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	352; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(PanelInterfaceControl1, 0x0010); // sync with fosc/1 - 16 clocks/line
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x90
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	365; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_write(DisplayControl1, 0x0133);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x33
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_ILI9325_write
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	371; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setColor(White);
	MOVLW	0xff
	SETF	POSTDEC1
	SETF	POSTDEC1
	CALL	_ILI9325_setColor
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	372; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setBackgroundColor(Blue);
	CLRF	POSTDEC1
	MOVLW	0x1f
	MOVWF	POSTDEC1
	CALL	_ILI9325_setBackgroundColor
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	373; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_setPortrait();
	CALL	_ILI9325_setPortrait
;	.line	377; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_clearScreen();
	CALL	_ILI9325_clearScreen
	RETURN	

; ; Starting pCode block
S_main__ILI9325_getDevice	code
_ILI9325_getDevice:
;	.line	201; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	u16 ILI9325_getDevice()
	MOVFF	r0x01, POSTDEC1
;	.line	206; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	dev = ILI9325_read(DriverCodeRead);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_ILI9325_read
	MOVFF	PRODL, r0x01
	MOVF	POSTINC1, F
;	.line	209; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return dev;
	MOVFF	r0x01, PRODL
	MOVFF	PREINC1, r0x01
	RETURN	

; ; Starting pCode block
S_main__ILI9325_read	code
_ILI9325_read:
;	.line	186; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	u16 ILI9325_read(u8 index)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	188; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_writeRegister(index);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_writeRegister
	MOVF	POSTINC1, F
;	.line	189; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return ILI9325_readData();
	CALL	_ILI9325_readData
	MOVFF	PRODL, r0x01
	MOVFF	r0x01, PRODL
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_readData	code
_ILI9325_readData:
;	.line	141; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	u16 ILI9325_readData()
	MOVFF	r0x00, POSTDEC1
;	.line	145; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRS;	// Disable Register Selection Signal
	BSF	_LATA, 0
;	.line	146; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRD; // Disable Read Mode
	BSF	_LATA, 2
;	.line	147; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR; // Disable Write Mode
	BSF	_LATA, 1
;	.line	151; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	dDATA = 0xFF;
	SETF	_TRISB
;	.line	156; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowRD;
	MOVF	_LATA, W
	MOVWF	r0x00
	MOVLW	0xfb
	ANDWF	r0x00, W
	MOVWF	_LATA
;	.line	157; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(10);
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	158; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	d.h8 = DATA;
	MOVF	_LATB, W
	BANKSEL	(_ILI9325_readData_d_1_112 + 1)
	MOVWF	(_ILI9325_readData_d_1_112 + 1), B
;	.line	159; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRD;
	BSF	_LATA, 2
;	.line	161; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowRD;
	MOVF	_LATA, W
	MOVWF	r0x00
	MOVLW	0xfb
	ANDWF	r0x00, W
	MOVWF	_LATA
;	.line	162; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	Delayms(10);
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	163; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	d.l8 = DATA;
	MOVF	_LATB, W
	BANKSEL	_ILI9325_readData_d_1_112
	MOVWF	_ILI9325_readData_d_1_112, B
;	.line	164; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRD;
	BSF	_LATA, 2
;	.line	168; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	dDATA = 0x00;
	CLRF	_TRISB
;	.line	173; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	return d.w;
	MOVFF	(_ILI9325_readData_d_1_112 + 1), PRODL
; removed redundant BANKSEL
	MOVF	_ILI9325_readData_d_1_112, W, B
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__ILI9325_write	code
_ILI9325_write:
;	.line	121; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_write(u8 index, u16 data15)
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
;	.line	123; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_writeRegister(index);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_writeRegister
	MOVF	POSTINC1, F
;	.line	124; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	ILI9325_writeData(data15);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_ILI9325_writeData
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_writeData	code
_ILI9325_writeData:
;	.line	92; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_writeData(u16 data15)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	96; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	d.w = data15;
	MOVF	r0x00, W
	BANKSEL	_ILI9325_writeData_d_1_109
	MOVWF	_ILI9325_writeData_d_1_109, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_ILI9325_writeData_d_1_109 + 1), B
;	.line	97; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRS;	// Disable Register Selection Signal
	BSF	_LATA, 0
;	.line	98; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRD; // Disable Read Mode
	BSF	_LATA, 2
;	.line	99; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR; // Disable Write Mode
	BSF	_LATA, 1
;	.line	101; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	DATA = d.h8;
	MOVFF	(_ILI9325_writeData_d_1_109 + 1), _LATB
;	.line	102; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowWR;	// Enable Write
	MOVF	_LATA, W
	MOVWF	r0x00
	MOVLW	0xfd
	ANDWF	r0x00, W
	MOVWF	_LATA
;	.line	103; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR;	// Disable Write
	BSF	_LATA, 1
;	.line	105; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	DATA = d.l8;
	MOVFF	_ILI9325_writeData_d_1_109, _LATB
;	.line	106; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowWR;	// Enable Write
	MOVF	_LATA, W
	MOVWF	r0x00
	MOVLW	0xfd
	ANDWF	r0x00, W
	MOVWF	_LATA
;	.line	107; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR;	// Disable Write
	BSF	_LATA, 1
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_writeRegister	code
_ILI9325_writeRegister:
;	.line	63; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	void ILI9325_writeRegister(u8 index)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	65; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowRS;	// Enable Register Selection Signal
	MOVF	_LATA, W
	MOVWF	r0x01
	MOVLW	0xfe
	ANDWF	r0x01, W
	MOVWF	_LATA
;	.line	66; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighRD; // Disable Read Mode
	BSF	_LATA, 2
;	.line	67; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR; // Disable Write Mode
	BSF	_LATA, 1
;	.line	69; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	DATA = 0;
	CLRF	_LATB
;	.line	70; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowWR;	// Enable Write
	MOVF	_LATA, W
	MOVWF	r0x01
	MOVLW	0xfd
	ANDWF	r0x01, W
	MOVWF	_LATA
;	.line	71; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR;	// Disable Write
	BSF	_LATA, 1
;	.line	73; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	DATA = index;
	MOVFF	r0x00, _LATB
;	.line	74; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	LowWR;	// Enable Write
	MOVF	_LATA, W
	MOVWF	r0x00
	MOVLW	0xfd
	ANDWF	r0x00, W
	MOVWF	_LATA
;	.line	75; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/ILI9325.c	HighWR;	// Disable Write
	BSF	_LATA, 1
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__drawBitmap	code
_drawBitmap:
;	.line	542; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	void drawBitmap(u16 x, u16 y, u16 w, u16 h, const u8* bitmap)
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
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x0a
;	.line	546; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for (j=0; j<h; j++)
	CLRF	r0x0b
	CLRF	r0x0c
_00709_DS_:
	MOVF	r0x07, W
	SUBWF	r0x0c, W
	BNZ	_00725_DS_
	MOVF	r0x06, W
	SUBWF	r0x0b, W
_00725_DS_:
	BTFSC	STATUS, 0
	BRA	_00713_DS_
;	.line	548; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for (i=0; i<w; i++ )
	BCF	STATUS, 0
	RRCF	r0x0c, W
	MOVWF	r0x0e
	RRCF	r0x0b, W
	MOVWF	r0x0d
	BCF	STATUS, 0
	RRCF	r0x0e, F
	RRCF	r0x0d, F
	BCF	STATUS, 0
	RRCF	r0x0e, F
	RRCF	r0x0d, F
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x0d
	MOVFF	PRODL, r0x0e
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x0b, W
	ADDWF	r0x02, W
	MOVWF	r0x0f
	MOVF	r0x0c, W
	ADDWFC	r0x03, W
	MOVWF	r0x10
	CLRF	r0x11
	CLRF	r0x12
_00705_DS_:
	MOVF	r0x05, W
	SUBWF	r0x12, W
	BNZ	_00726_DS_
	MOVF	r0x04, W
	SUBWF	r0x11, W
_00726_DS_:
	BC	_00711_DS_
;	.line	550; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	ILI9325_setColor(bitmap[i + (j/8) * w]);
	MOVF	r0x0d, W
	ADDWF	r0x11, W
	MOVWF	r0x13
	MOVF	r0x0e, W
	ADDWFC	r0x12, W
	MOVWF	r0x14
	CLRF	r0x15
	MOVF	r0x08, W
	ADDWF	r0x13, F
	MOVF	r0x09, W
	ADDWFC	r0x14, F
	MOVF	r0x0a, W
	ADDWFC	r0x15, F
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget1
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_ILI9325_setColor
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	551; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x+i, y+j);
	MOVF	r0x11, W
	ADDWF	r0x00, W
	MOVWF	r0x13
	MOVF	r0x12, W
	ADDWFC	r0x01, W
	MOVWF	r0x14
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	548; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for (i=0; i<w; i++ )
	INFSNZ	r0x11, F
	INCF	r0x12, F
	BRA	_00705_DS_
_00711_DS_:
;	.line	546; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for (j=0; j<h; j++)
	INFSNZ	r0x0b, F
	INCF	r0x0c, F
	BRA	_00709_DS_
_00713_DS_:
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
S_main__drawLine	code
_drawLine:
;	.line	116; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	void drawLine(u16 x0, u16 y0, u16 x1, u16 y1)
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
;	.line	131; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	steep = _abs_(y1 - y0) > abs(x1 - x0);
	MOVF	r0x02, W
	SUBWF	r0x06, W
	MOVWF	r0x08
	MOVF	r0x03, W
	SUBWFB	r0x07, W
; #	MOVWF	r0x09
; #	MOVF	r0x08, W
; #	IORWF	r0x09, W
	MOVWF	r0x09
	IORWF	r0x08, W
	BZ	_00665_DS_
	MOVFF	r0x08, r0x0a
	MOVFF	r0x09, r0x0b
	BRA	_00666_DS_
_00665_DS_:
	COMF	r0x09, W
	MOVWF	r0x0b
	COMF	r0x08, W
	MOVWF	r0x0a
	INFSNZ	r0x0a, F
	INCF	r0x0b, F
_00666_DS_:
	MOVF	r0x00, W
	SUBWF	r0x04, W
	MOVWF	r0x08
	MOVF	r0x01, W
	SUBWFB	r0x05, W
; #	MOVWF	r0x09
; #	MOVF	r0x08, W
; #	IORWF	r0x09, W
	MOVWF	r0x09
	IORWF	r0x08, W
	BZ	_00667_DS_
	MOVFF	r0x08, r0x0c
	MOVFF	r0x09, r0x0d
	BRA	_00668_DS_
_00667_DS_:
	COMF	r0x09, W
	MOVWF	r0x0d
	COMF	r0x08, W
	MOVWF	r0x0c
	INFSNZ	r0x0c, F
	INCF	r0x0d, F
_00668_DS_:
	MOVF	r0x0b, W
	SUBWF	r0x0d, W
	BNZ	_00695_DS_
	MOVF	r0x0a, W
	SUBWF	r0x0c, W
_00695_DS_:
	BTG	STATUS, 0
	CLRF	r0x0a
	RLCF	r0x0a, F
	MOVFF	r0x0a, r0x08
	CLRF	r0x09
	BTFSC	r0x0a, 7
	SETF	r0x09
;	.line	133; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	if (steep)
	MOVF	r0x08, W
	IORWF	r0x09, W
	BZ	_00648_DS_
;	.line	135; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	t = x0; x0 = y0; y0 = t;
	MOVFF	r0x00, r0x0a
	MOVFF	r0x01, r0x0b
	MOVFF	r0x02, r0x00
	MOVFF	r0x03, r0x01
	MOVFF	r0x0a, r0x02
	MOVFF	r0x0b, r0x03
;	.line	136; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	t = x1; x1 = y1; y1 = t;
	MOVFF	r0x04, r0x0a
	MOVFF	r0x05, r0x0b
	MOVFF	r0x06, r0x04
	MOVFF	r0x07, r0x05
	MOVFF	r0x0a, r0x06
	MOVFF	r0x0b, r0x07
_00648_DS_:
;	.line	139; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	if (x0 > x1)
	MOVF	r0x01, W
	SUBWF	r0x05, W
	BNZ	_00696_DS_
	MOVF	r0x00, W
	SUBWF	r0x04, W
_00696_DS_:
	BC	_00650_DS_
;	.line	141; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	t = x0; x0 = x1; x1 = t;
	MOVFF	r0x00, r0x0a
	MOVFF	r0x01, r0x0b
	MOVFF	r0x04, r0x00
	MOVFF	r0x05, r0x01
	MOVFF	r0x0a, r0x04
	MOVFF	r0x0b, r0x05
;	.line	142; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	t = y0; y0 = y1; y1 = t;
	MOVFF	r0x02, r0x0a
	MOVFF	r0x03, r0x0b
	MOVFF	r0x06, r0x02
	MOVFF	r0x07, r0x03
	MOVFF	r0x0a, r0x06
	MOVFF	r0x0b, r0x07
_00650_DS_:
;	.line	145; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	deltax = x1 - x0;
	MOVF	r0x00, W
	SUBWF	r0x04, W
	MOVWF	r0x0a
	MOVF	r0x01, W
	SUBWFB	r0x05, W
	MOVWF	r0x0b
;	.line	146; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	deltay = _abs_(y1 - y0);
	MOVF	r0x02, W
	SUBWF	r0x06, W
	MOVWF	r0x0c
	MOVF	r0x03, W
	SUBWFB	r0x07, W
; #	MOVWF	r0x0d
; #	MOVF	r0x0c, W
; #	IORWF	r0x0d, W
	MOVWF	r0x0d
	IORWF	r0x0c, W
	BZ	_00669_DS_
	MOVFF	r0x0c, r0x0e
	MOVFF	r0x0d, r0x0f
	BRA	_00670_DS_
_00669_DS_:
	COMF	r0x0d, W
	MOVWF	r0x0f
	COMF	r0x0c, W
	MOVWF	r0x0e
	INFSNZ	r0x0e, F
	INCF	r0x0f, F
_00670_DS_:
	MOVFF	r0x0e, r0x0c
	MOVFF	r0x0f, r0x0d
;	.line	148; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	error = 0;
	CLRF	r0x0e
	CLRF	r0x0f
;	.line	149; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	y = y0;
	MOVFF	r0x02, r0x10
	MOVFF	r0x03, r0x11
;	.line	151; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	if (y0 < y1) ystep = 1; else ystep = -1;
	MOVF	r0x07, W
	SUBWF	r0x03, W
	BNZ	_00698_DS_
	MOVF	r0x06, W
	SUBWF	r0x02, W
_00698_DS_:
	BC	_00652_DS_
	MOVLW	0x01
	MOVWF	r0x02
	CLRF	r0x03
	BRA	_00659_DS_
_00652_DS_:
	SETF	r0x02
	SETF	r0x03
_00659_DS_:
;	.line	153; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for (x = x0; x < x1; x++)
	MOVF	r0x00, W
	MOVWF	r0x06
	MOVF	r0x01, W
	MOVWF	r0x07
	MOVF	r0x05, W
	SUBWF	r0x07, W
	BNZ	_00699_DS_
	MOVF	r0x04, W
	SUBWF	r0x06, W
_00699_DS_:
	BC	_00663_DS_
;	.line	155; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	if (steep)
	MOVF	r0x08, W
	IORWF	r0x09, W
	BZ	_00655_DS_
;	.line	156; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(y,x);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00656_DS_
_00655_DS_:
;	.line	158; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x,y);
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
_00656_DS_:
;	.line	160; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	error += deltay;
	MOVF	r0x0c, W
	ADDWF	r0x0e, F
	MOVF	r0x0d, W
	ADDWFC	r0x0f, F
;	.line	162; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	if ( (error<<1) >= deltax)
	MOVF	r0x0e, W
	MOVWF	r0x06
	ADDWF	r0x06, F
	RLCF	r0x0f, W
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x0b, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00700_DS_
	MOVF	r0x0a, W
	SUBWF	r0x06, W
_00700_DS_:
	BNC	_00661_DS_
;	.line	164; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	y += ystep;
	MOVF	r0x02, W
	ADDWF	r0x10, F
	MOVF	r0x03, W
	ADDWFC	r0x11, F
;	.line	165; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	error -= deltax;
	MOVF	r0x0a, W
	SUBWF	r0x0e, F
	MOVF	r0x0b, W
	SUBWFB	r0x0f, F
_00661_DS_:
;	.line	153; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for (x = x0; x < x1; x++)
	INFSNZ	r0x00, F
	INCF	r0x01, F
	BRA	_00659_DS_
_00663_DS_:
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
S_main__fillCircle	code
_fillCircle:
;	.line	105; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	void fillCircle(u16 x, u16 y, u16 radius)
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
;	.line	108; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for(y1=-radius; y1<=radius; y1++) 
	COMF	r0x05, W
	MOVWF	r0x07
	COMF	r0x04, W
	MOVWF	r0x06
	INFSNZ	r0x06, F
	INCF	r0x07, F
	MOVFF	r0x06, r0x08
	MOVFF	r0x07, r0x09
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVLW	0x04
	ADDWF	FSR1L, F
_00621_DS_:
	MOVF	r0x08, W
	MOVWF	r0x0c
; #	MOVF	r0x09, W
; #	MOVWF	r0x0d
; #	MOVF	r0x0d, W
	MOVF	r0x09, W
	SUBWF	r0x05, W
	BNZ	_00640_DS_
	MOVF	r0x0c, W
	SUBWF	r0x04, W
_00640_DS_:
	BTFSS	STATUS, 0
	BRA	_00625_DS_
;	.line	109; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for(x1=-radius; x1<=radius; x1++) 
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
_00617_DS_:
	MOVF	r0x0e, W
	MOVWF	r0x10
; #	MOVF	r0x0f, W
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
	MOVF	r0x0f, W
	MOVWF	r0x11
	SUBWF	r0x05, W
	BNZ	_00641_DS_
	MOVF	r0x10, W
	SUBWF	r0x04, W
_00641_DS_:
	BNC	_00623_DS_
;	.line	110; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	if(x1*x1+y1*y1 <= radius*radius) 
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x12
	MOVFF	PRODL, r0x13
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x0c, W
	ADDWF	r0x12, F
	MOVF	r0x0d, W
	ADDWFC	r0x13, F
	MOVF	r0x13, W
	SUBWF	r0x0b, W
	BNZ	_00642_DS_
	MOVF	r0x12, W
	SUBWF	r0x0a, W
_00642_DS_:
	BNC	_00619_DS_
;	.line	111; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x+x1, y+y1); 
	MOVF	r0x00, W
	ADDWF	r0x10, F
	MOVF	r0x01, W
	ADDWFC	r0x11, F
	MOVF	r0x08, W
	MOVWF	r0x12
	MOVF	r0x09, W
	MOVWF	r0x13
	MOVF	r0x02, W
	ADDWF	r0x12, F
	MOVF	r0x03, W
	ADDWFC	r0x13, F
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
_00619_DS_:
;	.line	109; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for(x1=-radius; x1<=radius; x1++) 
	INFSNZ	r0x0e, F
	INCF	r0x0f, F
	BRA	_00617_DS_
_00623_DS_:
;	.line	108; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	for(y1=-radius; y1<=radius; y1++) 
	INFSNZ	r0x08, F
	INCF	r0x09, F
	BRA	_00621_DS_
_00625_DS_:
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
S_main__drawCircle	code
_drawCircle:
;	.line	70; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	void drawCircle(u16 x, u16 y, u16 radius)
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
;	.line	72; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	s16 f = 1 - radius;
	MOVF	r0x04, W
	SUBLW	0x01
	MOVWF	r0x06
	MOVLW	0x00
	SUBFWB	r0x05, W
	MOVWF	r0x07
;	.line	74; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	s16 ddF_y = -2 * radius;
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	SETF	POSTDEC1
	MOVLW	0xfe
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	78; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x, y + radius);
	MOVF	r0x04, W
	ADDWF	r0x02, W
	MOVWF	r0x0a
	MOVF	r0x05, W
	ADDWFC	r0x03, W
; #	MOVWF	r0x0b
; #	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	79; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x, y - radius);
	MOVF	r0x04, W
	SUBWF	r0x02, W
	MOVWF	r0x0a
	MOVF	r0x05, W
	SUBWFB	r0x03, W
; #	MOVWF	r0x0b
; #	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	80; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x + radius, y);
	MOVF	r0x04, W
	ADDWF	r0x00, W
	MOVWF	r0x0a
	MOVF	r0x05, W
	ADDWFC	r0x01, W
	MOVWF	r0x0b
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	81; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x - radius, y);
	MOVF	r0x04, W
	SUBWF	r0x00, W
	MOVWF	r0x0a
	MOVF	r0x05, W
	SUBWFB	r0x01, W
	MOVWF	r0x0b
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	83; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	while(x1 < y1)
	CLRF	r0x0a
	CLRF	r0x0b
	MOVLW	0x01
	MOVWF	r0x0c
	CLRF	r0x0d
_00598_DS_:
	MOVF	r0x0b, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x05, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00610_DS_
	MOVF	r0x04, W
	SUBWF	r0x0a, W
_00610_DS_:
	BTFSC	STATUS, 0
	BRA	_00601_DS_
;	.line	85; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	if(f >= 0) 
	BSF	STATUS, 0
	BTFSS	r0x07, 7
	BCF	STATUS, 0
	BC	_00597_DS_
;	.line	87; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	y1--;
	MOVLW	0xff
	ADDWF	r0x04, F
	ADDWFC	r0x05, F
;	.line	88; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	ddF_y += 2;
	MOVLW	0x02
	ADDWF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	89; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	f += ddF_y;
	MOVF	r0x08, W
	ADDWF	r0x06, F
	MOVF	r0x09, W
	ADDWFC	r0x07, F
_00597_DS_:
;	.line	91; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	x1++;
	INFSNZ	r0x0a, F
	INCF	r0x0b, F
;	.line	92; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	ddF_x += 2;
	MOVLW	0x02
	ADDWF	r0x0c, F
	BTFSC	STATUS, 0
	INCF	r0x0d, F
;	.line	93; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	f += ddF_x;    
	MOVF	r0x0c, W
	ADDWF	r0x06, F
	MOVF	r0x0d, W
	ADDWFC	r0x07, F
;	.line	94; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x + x1, y + y1);
	MOVF	r0x0a, W
	MOVWF	r0x0e
	MOVF	r0x0b, W
	MOVWF	r0x0f
	MOVF	r0x0e, W
	ADDWF	r0x00, W
	MOVWF	r0x10
	MOVF	r0x0f, W
	ADDWFC	r0x01, W
	MOVWF	r0x11
	MOVF	r0x04, W
	MOVWF	r0x12
	MOVF	r0x05, W
	MOVWF	r0x13
	MOVF	r0x12, W
	ADDWF	r0x02, W
	MOVWF	r0x14
	MOVF	r0x13, W
	ADDWFC	r0x03, W
; #	MOVWF	r0x15
; #	MOVF	r0x15, W
	MOVWF	r0x15
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	95; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x - x1, y + y1);
	MOVF	r0x0e, W
	SUBWF	r0x00, W
	MOVWF	r0x16
	MOVF	r0x0f, W
	SUBWFB	r0x01, W
	MOVWF	r0x17
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x17, W
	MOVWF	POSTDEC1
	MOVF	r0x16, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	96; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x + x1, y - y1);
	MOVF	r0x12, W
	SUBWF	r0x02, W
	MOVWF	r0x14
	MOVF	r0x13, W
	SUBWFB	r0x03, W
; #	MOVWF	r0x15
; #	MOVF	r0x15, W
	MOVWF	r0x15
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	97; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x - x1, y - y1);
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x17, W
	MOVWF	POSTDEC1
	MOVF	r0x16, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	98; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x + y1, y + x1);
	MOVF	r0x12, W
	ADDWF	r0x00, W
	MOVWF	r0x10
	MOVF	r0x13, W
	ADDWFC	r0x01, W
	MOVWF	r0x11
	MOVF	r0x0e, W
	ADDWF	r0x02, W
	MOVWF	r0x14
	MOVF	r0x0f, W
	ADDWFC	r0x03, W
; #	MOVWF	r0x15
; #	MOVF	r0x15, W
	MOVWF	r0x15
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	99; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x - y1, y + x1);
	MOVF	r0x12, W
	SUBWF	r0x00, W
	MOVWF	r0x12
	MOVF	r0x13, W
	SUBWFB	r0x01, W
	MOVWF	r0x13
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	100; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x + y1, y - x1);
	MOVF	r0x0e, W
	SUBWF	r0x02, W
	MOVWF	r0x0e
	MOVF	r0x0f, W
	SUBWFB	r0x03, W
; #	MOVWF	r0x0f
; #	MOVF	r0x0f, W
	MOVWF	r0x0f
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	101; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/graphic.c	drawPixel(x - y1, y - x1);
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	CALL	_drawPixel
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00598_DS_
_00601_DS_:
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
	MOVFF	PLUSW2, _psprintf2_out_1_73
	MOVLW	0x03
	MOVFF	PLUSW2, (_psprintf2_out_1_73 + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (_psprintf2_out_1_73 + 2)
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
	MOVLW	HIGH(_psprintf2_out_1_73)
	MOVWF	POSTDEC1
	MOVLW	LOW(_psprintf2_out_1_73)
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
_00451_DS_:
;	.line	308; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (; *format != 0; ++format)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0c
	MOVF	r0x0c, W
	BTFSC	STATUS, 2
	GOTO	_00454_DS_
;	.line	310; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == '%')
	MOVF	r0x0c, W
	XORLW	0x25
	BZ	_00531_DS_
	GOTO	_00447_DS_
_00531_DS_:
;	.line	312; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	width = pad = 0;		// default is left justify, no zero padded
	CLRF	r0x0c
	CLRF	r0x0d
;	.line	313; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++format;				// get the next format identifier
	INCF	r0x03, F
	BNC	_00532_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00532_DS_:
;	.line	315; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == '\0')	// end of line
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0e
	MOVF	r0x0e, W
	BTFSC	STATUS, 2
	GOTO	_00454_DS_
;	.line	318; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == '%')		// error
	MOVF	r0x0e, W
	XORLW	0x25
	BNZ	_00534_DS_
	GOTO	_00447_DS_
_00534_DS_:
;	.line	321; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == '-')		// right justify
	MOVF	r0x0e, W
	XORLW	0x2d
	BNZ	_00477_DS_
;	.line	323; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++format;
	INCF	r0x03, F
	BNC	_00537_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00537_DS_:
;	.line	324; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pad = PAD_RIGHT;
	MOVLW	0x01
	MOVWF	r0x0c
_00477_DS_:
;	.line	327; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	while (*format == '0')	// field is padded with 0's instead of blanks
	MOVFF	r0x03, r0x0e
	MOVFF	r0x04, r0x0f
	MOVFF	r0x05, r0x10
_00416_DS_:
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
	XORLW	0x30
	BNZ	_00458_DS_
;	.line	329; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++format;
	INCF	r0x0e, F
	BNC	_00540_DS_
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_00540_DS_:
;	.line	330; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pad |= PAD_ZERO;
	BSF	r0x0c, 1
	BRA	_00416_DS_
_00458_DS_:
;	.line	333; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x11
	MOVLW	0x30
	SUBWF	r0x11, W
	BNC	_00500_DS_
	MOVLW	0x3a
	SUBWF	r0x11, W
	BC	_00500_DS_
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
	BNC	_00544_DS_
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_00544_DS_:
	BRA	_00458_DS_
_00500_DS_:
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
	BNZ	_00484_DS_
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
_00484_DS_:
	MOVFF	r0x03, r0x0e
	MOVFF	r0x04, r0x0f
	MOVFF	r0x05, r0x10
_00463_DS_:
;	.line	352; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x11
	MOVLW	0x30
	SUBWF	r0x11, W
	BNC	_00501_DS_
	MOVLW	0x3a
	SUBWF	r0x11, W
	BC	_00501_DS_
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
	BNC	_00549_DS_
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_00549_DS_:
	BRA	_00463_DS_
_00501_DS_:
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
	BZ	_00551_DS_
	BRA	_00422_DS_
_00551_DS_:
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
	BRA	_00453_DS_
_00422_DS_:
;	.line	364; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 's')		// string
	MOVF	r0x11, W
	XORLW	0x73
	BZ	_00553_DS_
	BRA	_00424_DS_
_00553_DS_:
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
; #	GOTO	_00469_DS_
; #	GOTO	_00470_DS_
; #	MOVLW	UPPER(__str_0)
	IORWF	r0x14, W
	BNZ	_00470_DS_
	MOVLW	UPPER(__str_0)
	MOVWF	r0x14
	MOVLW	HIGH(__str_0)
	MOVWF	r0x13
	MOVLW	LOW(__str_0)
	MOVWF	r0x12
_00470_DS_:
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
	BRA	_00453_DS_
_00424_DS_:
;	.line	371; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'l')		// long support
	MOVF	r0x11, W
	XORLW	0x6c
	BNZ	_00426_DS_
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
_00426_DS_:
;	.line	377; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (islong)
	MOVF	r0x0b, W
	BZ	_00428_DS_
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
	BRA	_00429_DS_
_00428_DS_:
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
_00429_DS_:
;	.line	382; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'u')		// unsigned integer
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	MOVWF	r0x12
	XORLW	0x75
	BNZ	_00431_DS_
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
	BRA	_00453_DS_
_00431_DS_:
;	.line	388; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'd' || *format == 'i')		// decimal signed integer
	MOVF	r0x12, W
	XORLW	0x64
	BZ	_00432_DS_
	MOVF	r0x12, W
	XORLW	0x69
	BNZ	_00433_DS_
_00432_DS_:
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
	BRA	_00453_DS_
_00433_DS_:
;	.line	394; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'x' || *format == 'p')	// lower hexa or pointer
	MOVF	r0x12, W
	XORLW	0x78
	BZ	_00435_DS_
	MOVF	r0x12, W
	XORLW	0x70
	BNZ	_00436_DS_
_00435_DS_:
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
	BRA	_00453_DS_
_00436_DS_:
;	.line	400; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'X' || *format == 'P')	// upper hexa or pointer
	MOVF	r0x12, W
	XORLW	0x58
	BZ	_00438_DS_
	MOVF	r0x12, W
	XORLW	0x50
	BNZ	_00439_DS_
_00438_DS_:
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
	BRA	_00453_DS_
_00439_DS_:
;	.line	406; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'b')		// binary
	MOVF	r0x12, W
	XORLW	0x62
	BNZ	_00442_DS_
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
	BRA	_00453_DS_
_00442_DS_:
;	.line	412; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'o')		// octal
	MOVF	r0x12, W
	XORLW	0x6f
	BNZ	_00444_DS_
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
	BRA	_00453_DS_
_00444_DS_:
;	.line	418; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (*format == 'c') 	// ascii
	MOVF	r0x12, W
	XORLW	0x63
	BNZ	_00453_DS_
;	.line	420; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	scr[0] = val;
	MOVF	r0x0e, W
	BANKSEL	_pprint_scr_1_52
	MOVWF	_pprint_scr_1_52, B
; removed redundant BANKSEL
;	.line	421; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	scr[1] = '\0';
	CLRF	(_pprint_scr_1_52 + 1), B
;	.line	422; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pc += pprints(out, scr, width, pad);
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprint_scr_1_52)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprint_scr_1_52)
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
	BRA	_00453_DS_
_00447_DS_:
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
_00453_DS_:
;	.line	308; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (; *format != 0; ++format)
	INCF	r0x03, F
	BNC	_00576_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00576_DS_:
	GOTO	_00451_DS_
_00454_DS_:
;	.line	434; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (out) **out = '\0';
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00456_DS_
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
_00456_DS_:
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
	MOVLW	HIGH(_pprintfl_buffer_1_38)
	MOVWF	r0x13
	MOVLW	LOW(_pprintfl_buffer_1_38)
	MOVWF	r0x12
	MOVLW	0x80
	MOVWF	r0x14
;	.line	180; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	u8 tmp[PRINT_BUF_LEN], *s = tmp;
	MOVLW	HIGH(_pprintfl_tmp_1_38)
	MOVWF	r0x16
	MOVLW	LOW(_pprintfl_tmp_1_38)
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
	BANKSEL	_pprintfl_helper_1_38
	MOVWF	_pprintfl_helper_1_38, B
	MOVF	r0x04, W
; removed redundant BANKSEL
	MOVWF	(_pprintfl_helper_1_38 + 1), B
	MOVF	r0x05, W
; removed redundant BANKSEL
	MOVWF	(_pprintfl_helper_1_38 + 2), B
	MOVF	r0x06, W
; removed redundant BANKSEL
	MOVWF	(_pprintfl_helper_1_38 + 3), B
;	.line	187; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (helper.l < 0)
	BSF	STATUS, 0
; removed redundant BANKSEL
	BTFSS	(_pprintfl_helper_1_38 + 3), 7, B
	BCF	STATUS, 0
	BNC	_00303_DS_
;	.line	189; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (width && (pad & PAD_ZERO))
	MOVF	r0x07, W
	BZ	_00299_DS_
	BTFSS	r0x08, 1
	BRA	_00299_DS_
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
	BRA	_00303_DS_
_00299_DS_:
;	.line	197; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string++ = '-';
	MOVLW	0x2d
	MOVWF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
	INCF	r0x12, F
	BNC	_00371_DS_
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00371_DS_:
;	.line	198; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	length--;
	MOVLW	0x0a
	MOVWF	r0x19
_00303_DS_:
	BANKSEL	(_pprintfl_helper_1_38 + 2)
;	.line	204; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	exponent = ((helper.l >> 23) & 0xFF) - 127;	
	RLCF	(_pprintfl_helper_1_38 + 2), W, B
; removed redundant BANKSEL
	RLCF	(_pprintfl_helper_1_38 + 3), W, B
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	0x81
	ADDWF	r0x03, F
; removed redundant BANKSEL
;	.line	207; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	mantissa = (helper.l & 0x7FFFFF) | 0x800000;
	MOVF	_pprintfl_helper_1_38, W, B
	MOVWF	r0x04
; removed redundant BANKSEL
	MOVF	(_pprintfl_helper_1_38 + 1), W, B
	MOVWF	r0x05
	MOVLW	0x7f
; removed redundant BANKSEL
	ANDWF	(_pprintfl_helper_1_38 + 2), W, B
	MOVWF	r0x06
	CLRF	r0x1a
	BSF	r0x06, 7
;	.line	209; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if ( (exponent >= 31) || (exponent < -23) )
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x61
	BC	_00310_DS_
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x97
	BC	_00311_DS_
_00310_DS_:
;	.line	211; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[0] = 'i';
	MOVLW	0x69
	BANKSEL	_pprintfl_buffer_1_38
	MOVWF	_pprintfl_buffer_1_38, B
;	.line	212; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[1] = 'n';
	MOVLW	0x6e
; removed redundant BANKSEL
	MOVWF	(_pprintfl_buffer_1_38 + 1), B
;	.line	213; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[2] = 'f';
	MOVLW	0x66
; removed redundant BANKSEL
	MOVWF	(_pprintfl_buffer_1_38 + 2), B
; removed redundant BANKSEL
;	.line	214; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[3] = '\0';
	CLRF	(_pprintfl_buffer_1_38 + 3), B
;	.line	215; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pprints(out, buffer, width, pad);
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprintfl_buffer_1_38)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprintfl_buffer_1_38)
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
	BRA	_00333_DS_
_00311_DS_:
;	.line	217; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	else if (exponent >= 23)
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x69
	BNC	_00308_DS_
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
	BZ	_00378_DS_
	BN	_00381_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00379_DS_:
	RLCF	r0x0a, F
	RLCF	r0x0b, F
	RLCF	r0x0c, F
	RLCF	r0x0d, F
	ADDLW	0x01
	BNC	_00379_DS_
	BRA	_00312_DS_
_00381_DS_:
	BCF	STATUS, 0
_00380_DS_:
	RRCF	r0x0d, F
	RRCF	r0x0c, F
	RRCF	r0x0b, F
	RRCF	r0x0a, F
	ADDLW	0x01
	BNC	_00380_DS_
_00378_DS_:
	BRA	_00312_DS_
_00308_DS_:
;	.line	221; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	else if (exponent >= 0) 
	BSF	STATUS, 0
	BTFSS	r0x03, 7
	BCF	STATUS, 0
	BTFSC	STATUS, 0
	BRA	_00305_DS_
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
	BZ	_00382_DS_
	BN	_00385_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00383_DS_:
	RRCF	r0x0d, F
	RRCF	r0x0c, F
	RRCF	r0x0b, F
	RRCF	r0x0a, F
	ADDLW	0x01
	BNC	_00383_DS_
	BRA	_00382_DS_
_00385_DS_:
	BCF	STATUS, 0
_00384_DS_:
	RLCF	r0x0a, F
	RLCF	r0x0b, F
	RLCF	r0x0c, F
	RLCF	r0x0d, F
	ADDLW	0x01
	BNC	_00384_DS_
_00382_DS_:
;	.line	224; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	frac_part = (mantissa << (exponent + 1)) & 0xFFFFFF; // mfh
	INFSNZ	r0x1b, F
	INCF	r0x1c, F
	MOVFF	r0x04, r0x1d
	MOVFF	r0x05, r0x1e
	MOVFF	r0x06, r0x1f
	MOVFF	r0x1a, r0x20
	MOVF	r0x1b, W
	BZ	_00386_DS_
	BN	_00389_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00387_DS_:
	RLCF	r0x1d, F
	RLCF	r0x1e, F
	RLCF	r0x1f, F
	RLCF	r0x20, F
	ADDLW	0x01
	BNC	_00387_DS_
	BRA	_00386_DS_
_00389_DS_:
	BCF	STATUS, 0
_00388_DS_:
	RRCF	r0x20, F
	RRCF	r0x1f, F
	RRCF	r0x1e, F
	RRCF	r0x1d, F
	ADDLW	0x01
	BNC	_00388_DS_
_00386_DS_:
	MOVF	r0x1d, W
	MOVWF	r0x0e
	MOVF	r0x1e, W
	MOVWF	r0x0f
	MOVF	r0x1f, W
	MOVWF	r0x10
	CLRF	r0x11
	BRA	_00312_DS_
_00305_DS_:
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
	BZ	_00312_DS_
	BN	_00396_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00394_DS_:
	RRCF	r0x11, F
	RRCF	r0x10, F
	RRCF	r0x0f, F
	RRCF	r0x0e, F
	ADDLW	0x01
	BNC	_00394_DS_
	BRA	_00312_DS_
_00396_DS_:
	BCF	STATUS, 0
_00395_DS_:
	RLCF	r0x0e, F
	RLCF	r0x0f, F
	RLCF	r0x10, F
	RLCF	r0x11, F
	ADDLW	0x01
	BNC	_00395_DS_
_00312_DS_:
;	.line	230; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (int_part == 0)
	MOVF	r0x0a, W
	IORWF	r0x0b, W
	IORWF	r0x0c, W
	IORWF	r0x0d, W
	BNZ	_00343_DS_
;	.line	232; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string++ = '0';
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
	INCF	r0x12, F
	BNC	_00397_DS_
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00397_DS_:
;	.line	233; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	length--;
	DECF	r0x19, F
	BRA	_00322_DS_
_00343_DS_:
;	.line	239; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	while (int_part)
	MOVFF	r0x15, r0x03
	MOVFF	r0x16, r0x04
	MOVFF	r0x17, r0x05
	CLRF	r0x06
	MOVFF	r0x19, r0x15
_00314_DS_:
	MOVF	r0x0a, W
	IORWF	r0x0b, W
	IORWF	r0x0c, W
	IORWF	r0x0d, W
	BTFSC	STATUS, 2
	BRA	_00351_DS_
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
	BNC	_00398_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00398_DS_:
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
	BRA	_00314_DS_
_00351_DS_:
;	.line	248; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	while (m--)
	MOVFF	r0x15, r0x19
	MOVFF	r0x12, r0x0a
	MOVFF	r0x13, r0x0b
	MOVFF	r0x14, r0x0c
_00317_DS_:
	MOVFF	r0x06, r0x0d
	DECF	r0x06, F
	MOVF	r0x0d, W
	BZ	_00352_DS_
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
	BNC	_00317_DS_
	INFSNZ	r0x0b, F
	INCF	r0x0c, F
_00399_DS_:
	BRA	_00317_DS_
_00352_DS_:
	MOVFF	r0x0a, r0x12
	MOVFF	r0x0b, r0x13
	MOVFF	r0x0c, r0x14
_00322_DS_:
;	.line	263; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (precision > 6)
	MOVLW	0x07
	SUBWF	r0x09, W
	BNC	_00324_DS_
;	.line	264; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	precision = 6;
	MOVLW	0x06
	MOVWF	r0x09
_00324_DS_:
;	.line	267; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (precision > length)
	MOVF	r0x09, W
; #	SUBWF	r0x19, W
; #	BTFSC	STATUS, 0
; #	GOTO	_00326_DS_
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
	BRA	_00328_DS_
;	.line	274; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	*string++ = '.';
	MOVLW	0x2e
	MOVWF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
	INCF	r0x12, F
	BNC	_00403_DS_
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00403_DS_:
;	.line	277; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (m = 0; m < precision; m++)
	MOVFF	r0x12, r0x03
	MOVFF	r0x13, r0x04
	MOVFF	r0x14, r0x05
	CLRF	r0x06
_00329_DS_:
	MOVF	r0x09, W
	SUBWF	r0x06, W
	BC	_00353_DS_
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
	BNC	_00405_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00405_DS_:
;	.line	284; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	frac_part &= 0xFFFFFF;
	CLRF	r0x11
;	.line	277; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (m = 0; m < precision; m++)
	INCF	r0x06, F
	BRA	_00329_DS_
_00353_DS_:
	MOVFF	r0x03, r0x12
	MOVFF	r0x04, r0x13
	MOVFF	r0x05, r0x14
_00328_DS_:
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
	MOVLW	HIGH(_pprintfl_buffer_1_38)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprintfl_buffer_1_38)
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
_00333_DS_:
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
	BNZ	_00250_DS_
;	.line	121; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[0] = '0';
	MOVLW	0x30
	BANKSEL	_pprinti_buffer_1_30
	MOVWF	_pprinti_buffer_1_30, B
; removed redundant BANKSEL
;	.line	122; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	buffer[1] = '\0';
	CLRF	(_pprinti_buffer_1_30 + 1), B
;	.line	123; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	return pprints(out, buffer, width, pad);
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprinti_buffer_1_30)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprinti_buffer_1_30)
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
	BRA	_00266_DS_
_00250_DS_:
;	.line	127; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if ( (sign) && (base == 10) && ( (s32)i < 0 ) )
	MOVF	r0x08, W
	BZ	_00252_DS_
	MOVF	r0x07, W
	XORLW	0x0a
	BNZ	_00252_DS_
	BSF	STATUS, 0
	BTFSS	r0x06, 7
	BCF	STATUS, 0
	BNC	_00252_DS_
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
	BNZ	_00252_DS_
	INCF	r0x0f, F
	BNZ	_00252_DS_
	INFSNZ	r0x10, F
	INCF	r0x11, F
_00252_DS_:
;	.line	134; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	string = buffer + PRINT_BUF_LEN - 1;
	MOVLW	HIGH(_pprinti_buffer_1_30 + 11)
	MOVWF	r0x04
	MOVLW	LOW(_pprinti_buffer_1_30 + 11)
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
_00257_DS_:
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	IORWF	r0x10, W
	IORWF	r0x11, W
	BTFSC	STATUS, 2
	BRA	_00278_DS_
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
	BNZ	_00292_DS_
	MOVLW	0x00
	SUBWF	r0x19, W
	BNZ	_00292_DS_
	MOVLW	0x00
	SUBWF	r0x18, W
	BNZ	_00292_DS_
	MOVLW	0x0a
	SUBWF	r0x17, W
_00292_DS_:
	BNC	_00256_DS_
;	.line	141; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	t += letterbase - '0' - 10;
	MOVFF	r0x0b, r0x1b
	MOVLW	0xc6
	ADDWF	r0x1b, F
	MOVF	r0x1b, W
	ADDWF	r0x17, F
_00256_DS_:
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
	BRA	_00257_DS_
_00278_DS_:
	MOVFF	r0x06, r0x03
	MOVFF	r0x08, r0x04
	MOVFF	r0x12, r0x05
;	.line	146; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (neg)
	MOVF	r0x0c, W
	BZ	_00265_DS_
;	.line	148; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (width && (pad & PAD_ZERO))
	MOVF	r0x09, W
	BZ	_00261_DS_
	BTFSS	r0x0a, 1
	BRA	_00261_DS_
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
	BRA	_00265_DS_
_00261_DS_:
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
_00265_DS_:
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
_00266_DS_:
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
	BZ	_00188_DS_
;	.line	71; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (ptr = string; *ptr; ++ptr)
	CLRF	r0x0a
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
_00191_DS_:
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
	MOVWF	r0x0e
	MOVF	r0x0e, W
	BZ	_00194_DS_
;	.line	72; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	++len;
	INCF	r0x0a, F
;	.line	71; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for (ptr = string; *ptr; ++ptr)
	INCF	r0x0b, F
	BNC	_00191_DS_
	INFSNZ	r0x0c, F
	INCF	r0x0d, F
_00240_DS_:
	BRA	_00191_DS_
_00194_DS_:
;	.line	73; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (len >= width)
	MOVF	r0x06, W
	SUBWF	r0x0a, W
	BNC	_00183_DS_
;	.line	74; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	width = 0;
	CLRF	r0x06
	BRA	_00184_DS_
_00183_DS_:
;	.line	76; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	width -= len;
	MOVF	r0x0a, W
	SUBWF	r0x06, F
_00184_DS_:
;	.line	77; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (pad & PAD_ZERO) padchar = '0';
	BTFSS	r0x07, 1
	BRA	_00188_DS_
	MOVLW	0x30
	MOVWF	r0x09
_00188_DS_:
;	.line	79; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	if (!(pad & PAD_RIGHT))
	BTFSC	r0x07, 0
	BRA	_00221_DS_
	CLRF	r0x07
	MOVFF	r0x06, r0x0a
_00195_DS_:
;	.line	81; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x0a, W
	BNZ	_00196_DS_
	MOVFF	r0x07, r0x08
	MOVFF	r0x0a, r0x06
	BRA	_00221_DS_
_00196_DS_:
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
	BRA	_00195_DS_
_00221_DS_:
	MOVFF	r0x08, r0x07
_00199_DS_:
;	.line	87; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; *string ; ++string)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x08
	MOVF	r0x08, W
	BZ	_00223_DS_
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
	BNC	_00199_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00244_DS_:
	BRA	_00199_DS_
_00223_DS_:
	MOVFF	r0x07, r0x03
	MOVFF	r0x06, r0x04
_00203_DS_:
;	.line	92; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x04, W
	BZ	_00206_DS_
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
	BRA	_00203_DS_
; =DF= MOVFF: replaced by CRLF/SETF
_00206_DS_:
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
	BZ	_00170_DS_
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
	BNC	_00176_DS_
	INFSNZ	r0x05, F
	INCF	r0x06, F
_00176_DS_:
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
	BRA	_00172_DS_
_00170_DS_:
;	.line	51; /home/regis/Hobbies/Electronique/Projets/Pinguino/svn/branches/x.4/p8/include/pinguino/core/stdio.c	pputchar(c);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00177_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00177_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00177_DS_)
	MOVWF	TOSU
	BTFSC	PREINC1, 7
	BSF	INTCON, 7
	MOVFF	(_pputchar + 2), PCLATU
	MOVFF	(_pputchar + 1), PCLATH
	BANKSEL	_pputchar
	MOVF	_pputchar, W, B
	MOVWF	PCL
_00177_DS_:
	MOVF	POSTINC1, F
_00172_DS_:
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
_00153_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00164_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00164_DS_:
	BC	_00157_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00153_DS_
_00157_DS_:
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
_00137_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00148_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00148_DS_:
	BC	_00141_DS_
	MOVLW	0x01
	CALL	_delay10ktcy
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00137_DS_
_00141_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ILI9325_getFontHeight	code
_ILI9325_getFontHeight:
;	.line	14; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/Font16x8.c	return 16;
	MOVLW	0x10
	RETURN	

; ; Starting pCode block
S_main__ILI9325_getFontWidth	code
_ILI9325_getFontWidth:
;	.line	9; /home/regis/Hobbies/Electronique/Projets/Pinguino/projets/TFT/Font16x8.c	return 8;
	MOVLW	0x08
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
_font:
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x3c, 0x3c, 0x3c
	DB	0x18, 0x18, 0x00, 0x18, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x66, 0x66, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x36, 0x36, 0x7f, 0x36, 0x36, 0x36, 0x7f, 0x36
	DB	0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x3c, 0x66, 0x60, 0x30
	DB	0x18, 0x0c, 0x06, 0x66, 0x3c, 0x18, 0x18, 0x00, 0x00, 0x00, 0x00, 0x70
	DB	0xd8, 0xda, 0x76, 0x0c, 0x18, 0x30, 0x6e, 0x5b, 0x1b, 0x0e, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x38, 0x6c, 0x6c, 0x38, 0x60, 0x6f, 0x66, 0x66
	DB	0x3b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x18, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x0c, 0x18, 0x18, 0x30, 0x30, 0x30, 0x30, 0x30, 0x18, 0x18, 0x0c, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x30, 0x18, 0x18, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c
	DB	0x18, 0x18, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x36, 0x1c
	DB	0x7f, 0x1c, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x18, 0x18, 0x7e, 0x18, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x1c
	DB	0x0c, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x1c, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x06, 0x06, 0x0c, 0x0c, 0x18, 0x18, 0x30, 0x30, 0x60
	DB	0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1e, 0x33, 0x37, 0x37, 0x33
	DB	0x3b, 0x3b, 0x33, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0c
	DB	0x1c, 0x7c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x3c, 0x66, 0x66, 0x06, 0x0c, 0x18, 0x30, 0x60, 0x7e
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x66, 0x66, 0x06, 0x1c
	DB	0x06, 0x66, 0x66, 0x3c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30
	DB	0x30, 0x36, 0x36, 0x36, 0x66, 0x7f, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x7e, 0x60, 0x60, 0x60, 0x7c, 0x06, 0x06, 0x0c, 0x78
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x18, 0x30, 0x7c, 0x66
	DB	0x66, 0x66, 0x66, 0x3c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e
	DB	0x06, 0x0c, 0x0c, 0x18, 0x18, 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x3c, 0x66, 0x66, 0x76, 0x3c, 0x6e, 0x66, 0x66, 0x3c
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x66, 0x66, 0x66, 0x66
	DB	0x3e, 0x0c, 0x18, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x1c, 0x1c, 0x00, 0x00, 0x00, 0x1c, 0x1c, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x1c, 0x00, 0x00, 0x00, 0x1c, 0x1c
	DB	0x0c, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x0c, 0x18, 0x30, 0x60
	DB	0x30, 0x18, 0x0c, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x7e, 0x00, 0x7e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x60, 0x30, 0x18, 0x0c, 0x06, 0x0c, 0x18, 0x30, 0x60
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x66, 0x66, 0x0c, 0x18
	DB	0x18, 0x00, 0x18, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e
	DB	0xc3, 0xc3, 0xcf, 0xdb, 0xdb, 0xcf, 0xc0, 0x7f, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x18, 0x3c, 0x66, 0x66, 0x66, 0x7e, 0x66, 0x66, 0x66
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7c, 0x66, 0x66, 0x66, 0x7c
	DB	0x66, 0x66, 0x66, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c
	DB	0x66, 0x66, 0x60, 0x60, 0x60, 0x66, 0x66, 0x3c, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x78, 0x6c, 0x66, 0x66, 0x66, 0x66, 0x66, 0x6c, 0x78
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e, 0x60, 0x60, 0x60, 0x7c
	DB	0x60, 0x60, 0x60, 0x7e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e
	DB	0x60, 0x60, 0x60, 0x7c, 0x60, 0x60, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x3c, 0x66, 0x66, 0x60, 0x60, 0x6e, 0x66, 0x66, 0x3e
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x66, 0x66, 0x66, 0x7e
	DB	0x66, 0x66, 0x66, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c
	DB	0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x3c, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x3c, 0x66, 0x66, 0x60, 0x60, 0x6e, 0x66, 0x66, 0x3e
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x66, 0x6c, 0x6c, 0x78
	DB	0x6c, 0x6c, 0x66, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60
	DB	0x60, 0x60, 0x60, 0x60, 0x60, 0x60, 0x60, 0x7e, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x63, 0x63, 0x77, 0x6b, 0x6b, 0x6b, 0x63, 0x63, 0x63
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x63, 0x63, 0x73, 0x7b, 0x6f
	DB	0x67, 0x63, 0x63, 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c
	DB	0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x3c, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x7c, 0x66, 0x66, 0x66, 0x7c, 0x60, 0x60, 0x60, 0x60
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x66, 0x66, 0x66, 0x66
	DB	0x66, 0x66, 0x66, 0x3c, 0x0c, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7c
	DB	0x66, 0x66, 0x66, 0x7c, 0x6c, 0x66, 0x66, 0x66, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x3c, 0x66, 0x60, 0x30, 0x18, 0x0c, 0x06, 0x66, 0x3c
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e, 0x18, 0x18, 0x18, 0x18
	DB	0x18, 0x18, 0x18, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66
	DB	0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x3c, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x3c, 0x18
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x63, 0x63, 0x63, 0x6b, 0x6b
	DB	0x6b, 0x36, 0x36, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66
	DB	0x66, 0x34, 0x18, 0x18, 0x2c, 0x66, 0x66, 0x66, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x66, 0x66, 0x66, 0x66, 0x3c, 0x18, 0x18, 0x18, 0x18
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e, 0x06, 0x06, 0x0c, 0x18
	DB	0x30, 0x60, 0x60, 0x7e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c
	DB	0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x3c, 0x00
	DB	0x00, 0x00, 0x00, 0x60, 0x60, 0x30, 0x30, 0x18, 0x18, 0x0c, 0x0c, 0x06
	DB	0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x0c, 0x0c, 0x0c, 0x0c
	DB	0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x3c, 0x00, 0x00, 0x18, 0x3c, 0x66
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0xff, 0x00, 0x00, 0x38, 0x18, 0x0c, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x3c, 0x06, 0x06, 0x3e, 0x66, 0x66, 0x3e, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x60, 0x60, 0x7c, 0x66, 0x66, 0x66, 0x66, 0x66, 0x7c
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x66, 0x60
	DB	0x60, 0x60, 0x66, 0x3c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06
	DB	0x06, 0x3e, 0x66, 0x66, 0x66, 0x66, 0x66, 0x3e, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x66, 0x66, 0x7e, 0x60, 0x60, 0x3c
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1e, 0x30, 0x30, 0x30, 0x7e
	DB	0x30, 0x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x3e, 0x66, 0x66, 0x66, 0x66, 0x66, 0x3e, 0x06, 0x06, 0x7c, 0x00
	DB	0x00, 0x00, 0x00, 0x60, 0x60, 0x7c, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x00, 0x78, 0x18, 0x18
	DB	0x18, 0x18, 0x18, 0x7e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0c, 0x0c
	DB	0x00, 0x3c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x78, 0x00
	DB	0x00, 0x00, 0x00, 0x60, 0x60, 0x66, 0x66, 0x6c, 0x78, 0x6c, 0x66, 0x66
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x18, 0x18, 0x18, 0x18
	DB	0x18, 0x18, 0x18, 0x7e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x7e, 0x6b, 0x6b, 0x6b, 0x6b, 0x6b, 0x63, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x7c, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x66, 0x66
	DB	0x66, 0x66, 0x66, 0x3c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x7c, 0x66, 0x66, 0x66, 0x66, 0x66, 0x7c, 0x60, 0x60, 0x60, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x3e, 0x66, 0x66, 0x66, 0x66, 0x66, 0x3e
	DB	0x06, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x6e, 0x70
	DB	0x60, 0x60, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x3e, 0x60, 0x60, 0x3c, 0x06, 0x06, 0x7c, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x30, 0x30, 0x7e, 0x30, 0x30, 0x30, 0x30, 0x30, 0x1e
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x66, 0x66
	DB	0x66, 0x66, 0x66, 0x3e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x66, 0x66, 0x66, 0x66, 0x66, 0x3c, 0x18, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x63, 0x6b, 0x6b, 0x6b, 0x6b, 0x36, 0x36
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x66, 0x3c
	DB	0x18, 0x3c, 0x66, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x3c, 0x0c, 0x18, 0xf0, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x7e, 0x06, 0x0c, 0x18, 0x30, 0x60, 0x7e
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0c, 0x18, 0x18, 0x18, 0x30
	DB	0x60, 0x30, 0x18, 0x18, 0x18, 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18
	DB	0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x00
	DB	0x00, 0x00, 0x00, 0x30, 0x18, 0x18, 0x18, 0x0c, 0x06, 0x0c, 0x18, 0x18
	DB	0x18, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x71, 0xdb, 0x8e, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; ; Starting pCode block
__str_0:
	DB	0x28, 0x6e, 0x75, 0x6c, 0x6c, 0x29, 0x00
; ; Starting pCode block
__str_1:
	DB	0x69, 0x3d, 0x25, 0x75, 0x20, 0x0d, 0x0a, 0x00


; Statistics:
; code size:	14034 (0x36d2) bytes (10.71%)
;           	 7017 (0x1b69) words
; udata size:	   85 (0x0055) bytes ( 2.41%)
; access size:	   33 (0x0021) bytes


	end
