;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8447 (Jul 12 2013) (Linux)
; This file was generated Thu Apr  3 15:53:19 2014
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f47j53
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	___uflags
	global	__entry
	global	__startup
	global	_main
	global	_Delayms
	global	_Delayus
	global	_digitalwrite
	global	_digitalread
	global	_pinmode
	global	_toggle
	global	_IO_init
	global	_IO_digital
	global	_IO_remap
	global	_setup
	global	_loop
	global	_mask
	global	_port

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	_ADCTRIGbits
	extern	_PD0bits
	extern	_PMDIS0bits
	extern	_PD1bits
	extern	_PMDIS1bits
	extern	_PD2bits
	extern	_PMDIS2bits
	extern	_PD3bits
	extern	_PMDIS3bits
	extern	_PPSCONbits
	extern	_CCP10CONbits
	extern	_CCP9CONbits
	extern	_CCP8CONbits
	extern	_CCP7CONbits
	extern	_CCP6CONbits
	extern	_CCP5CONbits
	extern	_CCP4CONbits
	extern	_CCP3CONbits
	extern	_ECCP3DELbits
	extern	_ECCP3ASbits
	extern	_PSTR3CONbits
	extern	_T8CONbits
	extern	_T6CONbits
	extern	_T5GCONbits
	extern	_T5CONbits
	extern	_CM3CONbits
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
	extern	_ALRMRPTbits
	extern	_ALRMCFGbits
	extern	_ANCON0bits
	extern	_ANCON1bits
	extern	_DSWAKELbits
	extern	_DSWAKEHbits
	extern	_DSCONLbits
	extern	_DSCONHbits
	extern	_CCPTMRS2bits
	extern	_CCPTMRS1bits
	extern	_CCPTMRS0bits
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
	extern	_SSP2MSKbits
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
	extern	_OSCCON2bits
	extern	_DMACON1bits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_LATDbits
	extern	_LATEbits
	extern	_PIE4bits
	extern	_PIR4bits
	extern	_IPR4bits
	extern	_PIE5bits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_TRISDbits
	extern	_TRISEbits
	extern	_T3GCONbits
	extern	_PIR5bits
	extern	_IPR5bits
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
	extern	_SSP1MSKbits
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
	extern	_stack_end
	extern	_ADCTRIG
	extern	_PD0
	extern	_PMDIS0
	extern	_PD1
	extern	_PMDIS1
	extern	_PD2
	extern	_PMDIS2
	extern	_PD3
	extern	_PMDIS3
	extern	_PPSCON
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
	extern	_RPINR15
	extern	_RPINR7
	extern	_RPINR8
	extern	_RPINR9
	extern	_RPINR12
	extern	_RPINR13
	extern	_RPINR14
	extern	_RPINR16
	extern	_RPINR17
	extern	_RPINR21
	extern	_RPINR22
	extern	_RPINR23
	extern	_RPINR24
	extern	_CCP10CON
	extern	_CCPR10L
	extern	_CCPR10H
	extern	_CCP9CON
	extern	_CCPR9L
	extern	_CCPR9H
	extern	_CCP8CON
	extern	_CCPR8L
	extern	_CCPR8H
	extern	_CCP7CON
	extern	_CCPR7L
	extern	_CCPR7H
	extern	_CCP6CON
	extern	_CCPR6L
	extern	_CCPR6H
	extern	_CCP5CON
	extern	_CCPR5L
	extern	_CCPR5H
	extern	_CCP4CON
	extern	_CCPR4L
	extern	_CCPR4H
	extern	_CCP3CON
	extern	_CCPR3L
	extern	_CCPR3H
	extern	_ECCP3DEL
	extern	_ECCP3AS
	extern	_PSTR3CON
	extern	_T8CON
	extern	_PR8
	extern	_TMR8
	extern	_T6CON
	extern	_PR6
	extern	_TMR6
	extern	_T5GCON
	extern	_T5CON
	extern	_TMR5L
	extern	_TMR5H
	extern	_CM3CON
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
	extern	_RTCVALL
	extern	_RTCVALH
	extern	_PADCFG1
	extern	_REFOCON
	extern	_RTCCAL
	extern	_RTCCFG
	extern	_ODCON3
	extern	_ODCON2
	extern	_ODCON1
	extern	_ALRMVALL
	extern	_ALRMVALH
	extern	_ALRMRPT
	extern	_ALRMCFG
	extern	_ANCON0
	extern	_ANCON1
	extern	_DSWAKEL
	extern	_DSWAKEH
	extern	_DSCONL
	extern	_DSCONH
	extern	_DSGPR0
	extern	_DSGPR1
	extern	_CCPTMRS2
	extern	_CCPTMRS1
	extern	_CCPTMRS0
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
	extern	_SSP2MSK
	extern	_SSP2BUF
	extern	_T4CON
	extern	_PR4
	extern	_TMR4
	extern	_T3CON
	extern	_TMR3
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
	extern	_OSCCON2
	extern	_DMACON1
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_LATD
	extern	_LATE
	extern	_PIE4
	extern	_PIR4
	extern	_IPR4
	extern	_PIE5
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISD
	extern	_TRISE
	extern	_T3GCON
	extern	_PIR5
	extern	_IPR5
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
	extern	_SSP1MSK
	extern	_SSPADD
	extern	_SSP1BUF
	extern	_SSPBUF
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_T1CON
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_CM2CON
	extern	_CM2CON1
	extern	_CM1CON
	extern	_CM1CON1
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
	extern	_cinit

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
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb


	idata
___uflags	db	0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main___entry	code	0X000C00
__entry:
	goto __startup
	
; I code from now on!
; ; Starting pCode block
S_main__main	code
_main:
;	.line	111; /dvpt/pinguino/svn/ide/x.4/source/main.c	if (RCONbits.NOT_POR == 0)
	BTFSC	_RCONbits, 1
	BRA	_00323_DS_
;	.line	113; /dvpt/pinguino/svn/ide/x.4/source/main.c	RCON |= 0b10010011;     // set all reset flag
	MOVLW	0x93
	IORWF	_RCON, F
_00323_DS_:
;	.line	164; /dvpt/pinguino/svn/ide/x.4/source/main.c	if (OSCCONbits.SCS > 0x02)
	MOVF	_OSCCONbits, W
	ANDLW	0x03
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ADDLW	0x80
	ADDLW	0x7d
	BNC	_00328_DS_
_00324_DS_:
;	.line	166; /dvpt/pinguino/svn/ide/x.4/source/main.c	while(!OSCCONbits.FLTS);
	BTFSS	_OSCCONbits, 2
	BRA	_00324_DS_
_00328_DS_:
;	.line	169; /dvpt/pinguino/svn/ide/x.4/source/main.c	OSCTUNEbits.PLLEN = 1;
	BSF	_OSCTUNEbits, 6
;	.line	170; /dvpt/pinguino/svn/ide/x.4/source/main.c	while (pll_startup_counter--);
	MOVLW	0x58
	MOVWF	r0x00
	MOVLW	0x02
	MOVWF	r0x01
_00329_DS_:
	MOVFF	r0x00, r0x02
	MOVFF	r0x01, r0x03
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	MOVF	r0x02, W
	IORWF	r0x03, W
	BNZ	_00329_DS_
;	.line	178; /dvpt/pinguino/svn/ide/x.4/source/main.c	IO_init();
	CALL	_IO_init
;	.line	179; /dvpt/pinguino/svn/ide/x.4/source/main.c	IO_digital();
	CALL	_IO_digital
;	.line	185; /dvpt/pinguino/svn/ide/x.4/source/main.c	IO_remap();
	CALL	_IO_remap
;	.line	226; /dvpt/pinguino/svn/ide/x.4/source/main.c	setup();
	CALL	_setup
_00333_DS_:
;	.line	247; /dvpt/pinguino/svn/ide/x.4/source/main.c	loop();
	CALL	_loop
	BRA	_00333_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	13; /dvpt/pinguino/svn/ide/x.4/source/user.c	toggle(USERLED);			
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_toggle
	MOVF	POSTINC1, F
;	.line	14; /dvpt/pinguino/svn/ide/x.4/source/user.c	Delayms(2500);		        
	MOVLW	0x09
	MOVWF	POSTDEC1
	MOVLW	0xc4
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	8; /dvpt/pinguino/svn/ide/x.4/source/user.c	pinmode(USERLED, OUTPUT);     
	CLRF	POSTDEC1
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	RETURN	

; ; Starting pCode block
S_main__IO_remap	code
_IO_remap:
;	.line	230; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	EECON2 = 0x55;
	MOVLW	0x55
	MOVWF	_EECON2
;	.line	231; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	EECON2 = 0xAA;
	MOVLW	0xaa
	MOVWF	_EECON2
	BANKSEL	_PPSCONbits
;	.line	232; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	PPSCONbits.IOLOCK = 0;			// Turn on PPS Write Protect
	BCF	_PPSCONbits, 0, B
;	.line	234; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	RPINR21 = 6;                    // RP6 (RB3) <- SDI2
	MOVLW	0x06
	BANKSEL	_RPINR21
	MOVWF	_RPINR21, B
;	.line	235; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	RPOR5 = 11;                     // RP5 (RB2) -> SCK2
	MOVLW	0x0b
	BANKSEL	_RPOR5
	MOVWF	_RPOR5, B
;	.line	236; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	RPOR4 = 10;                     // RP4 (RB1) -> SDO2 (func. num. 10)
	MOVLW	0x0a
	BANKSEL	_RPOR4
	MOVWF	_RPOR4, B
;	.line	238; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	EECON2 = 0x55;
	MOVLW	0x55
	MOVWF	_EECON2
;	.line	239; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	EECON2 = 0xAA;
	MOVLW	0xaa
	MOVWF	_EECON2
	BANKSEL	_PPSCONbits
;	.line	240; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	PPSCONbits.IOLOCK = 1;			// Turn on PPS Write Protect
	BSF	_PPSCONbits, 0, B
	RETURN	

; ; Starting pCode block
S_main__IO_digital	code
_IO_digital:
	BANKSEL	_ANCON0
;	.line	137; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	ANCON0 = 0xFF;				// AN0 to AN7  Digital I/O
	SETF	_ANCON0, B
;	.line	138; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	ANCON1 = 0x1F;				// AN8 to AN12 Digital I/O
	MOVLW	0x1f
	BANKSEL	_ANCON1
	MOVWF	_ANCON1, B
	RETURN	

; ; Starting pCode block
S_main__IO_init	code
_IO_init:
;	.line	46; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATA  = 0x00;
	CLRF	_LATA
;	.line	47; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATB  = 0x00;
	CLRF	_LATB
;	.line	54; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATC  = 0x00;	
	CLRF	_LATC
;	.line	71; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATD  = 0x00; 
	CLRF	_LATD
;	.line	72; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	LATE  = 0x00; 
	CLRF	_LATE
;	.line	75; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISA = 0x00;
	CLRF	_TRISA
;	.line	77; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISB = 0x00;
	CLRF	_TRISB
;	.line	79; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC0 = 0x00;
	BCF	_TRISCbits, 0
;	.line	80; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC1 = 0x00;
	BCF	_TRISCbits, 1
;	.line	81; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC2 = 0x00;
	BCF	_TRISCbits, 2
;	.line	82; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC6 = 0x00;
	BCF	_TRISCbits, 6
;	.line	83; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISCbits.TRISC7 = 0x00;
	BCF	_TRISCbits, 7
;	.line	87; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISD = 0x00; 
	CLRF	_TRISD
;	.line	88; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	TRISE = 0x00; 
	CLRF	_TRISE
;	.line	92; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	PORTA  = 0x00;
	CLRF	_PORTA
;	.line	93; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	PORTB  = 0x00;
	CLRF	_PORTB
;	.line	94; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	PORTC  = 0x00;
	CLRF	_PORTC
;	.line	98; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	PORTD  = 0x00; 
	CLRF	_PORTD
;	.line	99; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/io.c	PORTE  = 0x00; 
	CLRF	_PORTE
	RETURN	

; ; Starting pCode block
S_main__toggle	code
_toggle:
;	.line	409; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	void toggle(unsigned char pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	422; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	state = digitalread(pin);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalread
	MOVWF	r0x01
	MOVF	POSTINC1, F
;	.line	423; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	digitalwrite(pin, state^1);
	BTG	r0x01, 0
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__pinmode	code
_pinmode:
;	.line	363; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	void pinmode(unsigned char pin, unsigned char state)
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
;	.line	365; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	switch (port[pin])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_port)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_port)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVLW	0x05
	SUBWF	r0x02, W
	BTFSC	STATUS, 0
	BRA	_00266_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x02, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00287_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00287_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00287_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00287_DS_:
	GOTO	_00245_DS_
	GOTO	_00249_DS_
	GOTO	_00253_DS_
	GOTO	_00257_DS_
	GOTO	_00261_DS_
_00245_DS_:
;	.line	367; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pA: if (state) TRISA=TRISA | mask[pin];
	MOVF	r0x01, W
	BZ	_00247_DS_
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
	MOVF	r0x02, W
	IORWF	_TRISA, F
	BRA	_00266_DS_
_00247_DS_:
;	.line	368; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else TRISA=TRISA & (255-mask[pin]);
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
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_TRISA, F
;	.line	369; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	break;
	BRA	_00266_DS_
_00249_DS_:
;	.line	370; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pB: if (state) TRISB=TRISB | mask[pin];
	MOVF	r0x01, W
	BZ	_00251_DS_
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
	MOVF	r0x02, W
	IORWF	_TRISB, F
	BRA	_00266_DS_
_00251_DS_:
;	.line	371; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else TRISB=TRISB & (255-mask[pin]);
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
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_TRISB, F
;	.line	372; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	break;
	BRA	_00266_DS_
_00253_DS_:
;	.line	373; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pC: if (state) TRISC=TRISC | mask[pin];
	MOVF	r0x01, W
	BZ	_00255_DS_
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
	MOVF	r0x02, W
	IORWF	_TRISC, F
	BRA	_00266_DS_
_00255_DS_:
;	.line	374; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else TRISC=TRISC & (255-mask[pin]);
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
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_TRISC, F
;	.line	375; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	break;
	BRA	_00266_DS_
_00257_DS_:
;	.line	379; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pD: if (state) TRISD=TRISD | mask[pin];
	MOVF	r0x01, W
	BZ	_00259_DS_
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
	MOVF	r0x02, W
	IORWF	_TRISD, F
	BRA	_00266_DS_
_00259_DS_:
;	.line	380; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else TRISD=TRISD & (255-mask[pin]);
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
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_TRISD, F
;	.line	381; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	break;
	BRA	_00266_DS_
_00261_DS_:
;	.line	382; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pE: if (state) TRISE=TRISE | mask[pin];
	MOVF	r0x01, W
	BZ	_00263_DS_
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
	MOVF	r0x01, W
	IORWF	_TRISE, F
	BRA	_00266_DS_
_00263_DS_:
;	.line	383; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else TRISE=TRISE & (255-mask[pin]);
	CLRF	r0x01
	CLRF	r0x02
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
	ANDWF	_TRISE, F
_00266_DS_:
;	.line	386; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	}
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
;	.line	314; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	unsigned char digitalread(unsigned char pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	320; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	switch (port[pin])
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
	MOVLW	0x05
	SUBWF	r0x01, W
	BTFSC	STATUS, 0
	BRA	_00218_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x01, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00240_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00240_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00240_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00240_DS_:
	GOTO	_00198_DS_
	GOTO	_00202_DS_
	GOTO	_00206_DS_
	GOTO	_00210_DS_
	GOTO	_00214_DS_
_00198_DS_:
;	.line	322; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pA: if ((PORTA & mask[pin])!=0) return (1);
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
	MOVF	_PORTA, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BZ	_00200_DS_
	MOVLW	0x01
	BRA	_00219_DS_
_00200_DS_:
;	.line	323; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else return (0);
	CLRF	WREG
	BRA	_00219_DS_
_00202_DS_:
;	.line	325; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pB: if ((PORTB & mask[pin])!=0) return (1);
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
	MOVF	_PORTB, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BZ	_00204_DS_
	MOVLW	0x01
	BRA	_00219_DS_
_00204_DS_:
;	.line	326; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else return (0);
	CLRF	WREG
	BRA	_00219_DS_
_00206_DS_:
;	.line	328; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pC: if ((PORTC & mask[pin])!=0) return (1);
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
	MOVF	_PORTC, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BZ	_00208_DS_
	MOVLW	0x01
	BRA	_00219_DS_
_00208_DS_:
;	.line	329; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else return (0);
	CLRF	WREG
	BRA	_00219_DS_
_00210_DS_:
;	.line	334; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pD: if ((PORTD & mask[pin])!=0) return (1);
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
	MOVF	_PORTD, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BZ	_00212_DS_
	MOVLW	0x01
	BRA	_00219_DS_
_00212_DS_:
;	.line	335; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else return (0);
	CLRF	WREG
	BRA	_00219_DS_
_00214_DS_:
;	.line	337; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pE: if ((PORTE & mask[pin])!=0) return (1);
	CLRF	r0x01
	CLRF	r0x02
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
	MOVF	_PORTE, W
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00216_DS_
	MOVLW	0x01
	BRA	_00219_DS_
_00216_DS_:
;	.line	338; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else return (0);
	CLRF	WREG
	BRA	_00219_DS_
_00218_DS_:
;	.line	342; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	return (0);
	CLRF	WREG
_00219_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__digitalwrite	code
_digitalwrite:
;	.line	266; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	void digitalwrite(unsigned char pin, unsigned char state)
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
;	.line	272; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	switch (port[pin])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_port)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	UPPER(_port)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVLW	0x05
	SUBWF	r0x02, W
	BTFSC	STATUS, 0
	BRA	_00172_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x02, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00193_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00193_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00193_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00193_DS_:
	GOTO	_00151_DS_
	GOTO	_00155_DS_
	GOTO	_00159_DS_
	GOTO	_00163_DS_
	GOTO	_00167_DS_
_00151_DS_:
;	.line	274; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pA: if (state) LATA=LATA | mask[pin];
	MOVF	r0x01, W
	BZ	_00153_DS_
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
	MOVF	r0x02, W
	IORWF	_LATA, F
	BRA	_00172_DS_
_00153_DS_:
;	.line	275; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else LATA=LATA & (255-mask[pin]);
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
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_LATA, F
;	.line	276; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	break;
	BRA	_00172_DS_
_00155_DS_:
;	.line	277; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pB: if (state) LATB=LATB | mask[pin]; 
	MOVF	r0x01, W
	BZ	_00157_DS_
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
	MOVF	r0x02, W
	IORWF	_LATB, F
	BRA	_00172_DS_
_00157_DS_:
;	.line	278; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else LATB=LATB & (255-mask[pin]);
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
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_LATB, F
;	.line	279; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	break;
	BRA	_00172_DS_
_00159_DS_:
;	.line	280; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pC: if (state) LATC=LATC | mask[pin];
	MOVF	r0x01, W
	BZ	_00161_DS_
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
	MOVF	r0x02, W
	IORWF	_LATC, F
	BRA	_00172_DS_
_00161_DS_:
;	.line	281; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else LATC=LATC & (255-mask[pin]);
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
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_LATC, F
;	.line	282; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	break;
	BRA	_00172_DS_
_00163_DS_:
;	.line	286; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pD: if (state) LATD=LATD | mask[pin]; 
	MOVF	r0x01, W
	BZ	_00165_DS_
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
	MOVF	r0x02, W
	IORWF	_LATD, F
	BRA	_00172_DS_
_00165_DS_:
;	.line	287; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else LATD=LATD & (255-mask[pin]);
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
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	_LATD, F
;	.line	288; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	break;
	BRA	_00172_DS_
_00167_DS_:
;	.line	289; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	case pE: if (state) LATE=LATE | mask[pin]; 
	MOVF	r0x01, W
	BZ	_00169_DS_
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
	MOVF	r0x01, W
	IORWF	_LATE, F
	BRA	_00172_DS_
_00169_DS_:
;	.line	290; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	else LATE=LATE & (255-mask[pin]);
	CLRF	r0x01
	CLRF	r0x02
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
	ANDWF	_LATE, F
_00172_DS_:
;	.line	293; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/digitalw.c	}
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
_00135_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00146_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00146_DS_:
	BC	_00137_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00135_DS_
_00137_DS_:
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
_00117_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00128_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00128_DS_:
	BC	_00119_DS_
;	.line	83; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/delay.c	delay1ktcy(12);
	MOVLW	0x0c
	CALL	_delay1ktcy
;	.line	82; /dvpt/pinguino/svn/ide/x.4/p8/pinguino/core/delay.c	for (i=0; i<milliseconds; i++)
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00117_DS_
_00119_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main___startup	code
__startup:
	; Initialize the stack pointer
	lfsr 1, _stack_end
	lfsr 2, _stack_end
	; 1st silicon does not do this on POR
	clrf _TBLPTRU, 0
	; Initialize the flash memory access configuration.
	; This is harmless for non-flash devices, so we do it on all parts.
	bsf 0xa6, 7, 0 ; EECON1.EEPGD = 1, TBLPTR accesses program memory
	bcf 0xa6, 6, 0 ; EECON1.CFGS = 0, TBLPTR accesses program memory
	; Load FSR0 with top of RAM.
	movlw 0xbf
	movwf _FSR0L, 0
	movlw 0x0e
	movwf _FSR0H, 0
	; Place 0xff at address 0x00 as a sentinel.
	setf 0x00, 0
clear_loop:
	clrf _POSTDEC0, 0
	movf 0x00, w, 0
	bnz clear_loop
	; TBLPTR = &cinit
	movlw low(_cinit)
	movwf _TBLPTRL, 0
	movlw high(_cinit)
	movwf _TBLPTRH, 0
	movlw upper(_cinit)
	movwf _TBLPTRU, 0
	; 0x05 = cinit.num_init
	tblrd*+
	movff _TABLAT, 0x05
	tblrd*+
	movff _TABLAT, (0x05 + 1)
	; while (0x05)
	bra entry_loop_dec
entry_loop:
	; Count down so we only have to look up the data in _cinit once.
	; At this point we know that TBLPTR points to the top of the current
	; entry in _cinit, so we can just start reading the from, to, and
	; size values.
	; Read the source address low.
	; 0x00 = 0x07 ->from;
	tblrd*+
	movff _TABLAT, 0x00
	; source address high
	tblrd*+
	movff _TABLAT, (0x00 + 1)
	; source address upper
	tblrd*+
	movff _TABLAT, (0x00 + 2)
	; Skip a byte since it is stored as a 32bit int.
	tblrd*+
	; Read the destination address directly into FSR0
	; destination address low.
	; FSR0 = (unsigned short)0x07 ->to;
	tblrd*+
	movff _TABLAT, _FSR0L
	; destination address high
	tblrd*+
	movff _TABLAT, _FSR0H
	; Skip two bytes since it is stored as a 32bit int.
	tblrd*+
	tblrd*+
	; Read the size of data to transfer to destination address.
	; 0x03 = (unsigned short)0x07 ->size;
	tblrd*+
	movff _TABLAT, 0x03
	tblrd*+
	movff _TABLAT, (0x03 + 1)
	; Skip two bytes since it is stored as a 32bit int.
	tblrd*+
	tblrd*+
	; 0x00 = 0x07 ->from;
	; FSR0 = (unsigned short)0x07 ->to;
	; 0x03 = (unsigned short)0x07 ->size;
	; The table pointer now points to the next entry. Save it
	; off since we will be using the table pointer to do the copying
	; for the entry.
	; 0x07 = TBLPTR
	movff _TBLPTRL, 0x07
	movff _TBLPTRH, (0x07 + 1)
	movff _TBLPTRU, (0x07 + 2)
	; Now assign the source address to the table pointer.
	; TBLPTR = 0x00
	movff 0x00, _TBLPTRL
	movff (0x00 + 1), _TBLPTRH
	movff (0x00 + 2), _TBLPTRU
	bra copy_loop_dec
copy_loop:
	tblrd*+
	movff _TABLAT, _POSTINC0
copy_loop_dec:
	; while (--0x03);
	; Decrement and test the byte counter.
	; The cycle ends when the value of counter reaches the -1.
	decf 0x03, f, 0
	bc copy_loop
	decf (0x03 + 1), f, 0
	bc copy_loop
	; Restore the table pointer for the next entry.
	; TBLPTR = 0x07
	movff 0x07, _TBLPTRL
	movff (0x07 + 1), _TBLPTRH
	movff (0x07 + 2), _TBLPTRU
entry_loop_dec:
	; while (--0x05);
	; Decrement and test the entry counter.
	; The cycle ends when the value of counter reaches the -1.
	decf 0x05, f, 0
	bc entry_loop
	decf (0x05 + 1), f, 0
	bc entry_loop
	
;	.line	259; /dvpt/pinguino/svn/ide/x.4/source/crt0iz.c	main ();
	CALL	_main
lockup:
	; Returning from main will lock up.
	bra lockup
	
; ; Starting pCode block for Ival
	code
_mask:
	DB	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08
	DB	0x10, 0x01, 0x02, 0x04, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
	DB	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80
; ; Starting pCode block for Ival
_port:
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x04, 0x04, 0x04, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02
	DB	0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03


; Statistics:
; code size:	 2320 (0x0910) bytes ( 1.77%)
;           	 1160 (0x0488) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    5 (0x0005) bytes


	end
