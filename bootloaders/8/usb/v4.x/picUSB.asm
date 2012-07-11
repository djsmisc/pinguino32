;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.0 #8004 (Jul  4 2012) (Linux)
; This file was generated Wed Jul  4 21:30:28 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f26j50

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_bootCmd
	global	_deviceAddress
	global	_selfPowered
	global	_EnableUSBModule
	global	_ProcessUSBTransactions
	global	_deviceState
	global	_currentConfiguration
	global	_ctrlTransferStage
	global	_requestHandled
	global	_outPtr
	global	_inPtr
	global	_wCount
	global	_ep_bdt
	global	_SetupPacket
	global	_controlTransferBuffer
	global	_ProcessStandardRequest
	global	_InDataStage
	global	_OutDataStage
	global	_SetupStage
	global	_WaitForSetupStage
	global	_ProcessControlTransfer
	global	_UnSuspend
	global	_BusReset

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrget1
	extern	__gptrput1
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
	extern	_usb_configure_endpoints
	extern	_usb_ep_data_out_callback
	extern	_device_descriptor
	extern	_configuration_descriptor

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3


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


usbram5	udata
_SetupPacket	res	64
_controlTransferBuffer	res	64

udata_picUSB_0	udata
_selfPowered	res	1

udata_picUSB_1	udata
_deviceAddress	res	1

udata_picUSB_2	udata
_bootCmd	res	64

udata_picUSB_3	udata
_requestHandled	res	1

udata_picUSB_4	udata
_outPtr	res	3

udata_picUSB_5	udata
_wCount	res	2

udata_picUSB_6	udata
_deviceState	res	1

udata_picUSB_7	udata
_currentConfiguration	res	1

udata_picUSB_8	udata
_inPtr	res	3

udata_picUSB_9	udata
_ctrlTransferStage	res	1


ustat_picUSB_00	udata	0X0400
_ep_bdt        	res	128

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_picUSB__ProcessUSBTransactions	code
_ProcessUSBTransactions:
;	.line	511; picUSB.c	void ProcessUSBTransactions()
	MOVFF	r0x00, POSTDEC1
; #	MOVF	_deviceState, W, B
; #	BTFSS	STATUS, 2
; #	GOTO	_00381_DS_
; #	GOTO	_00398_DS_
; #	BTFSS	_UIRbits, 2
	BANKSEL	_deviceState
;	.line	514; picUSB.c	if(deviceState == DETACHED)
	MOVF	_deviceState, W, B
;	.line	515; picUSB.c	return;
	BZ	_00398_DS_
;	.line	518; picUSB.c	if(UIRbits.ACTVIF && UIEbits.ACTVIE)
	BTFSS	_UIRbits, 2
; #	GOTO	_00383_DS_
; #	BTFSS	_UIEbits, 2, B
; #	GOTO	_00383_DS_
; #	CALL	_UnSuspend
; #	CLRF	r0x00
;	.line	519; picUSB.c	UnSuspend();
	BRA	_00383_DS_
	BANKSEL	_UIEbits
;	.line	522; picUSB.c	if(UCONbits.SUSPND == 1)
	BTFSC	_UIEbits, 2, B
	CALL	_UnSuspend
_00383_DS_:
	CLRF	r0x00
	BTFSC	_UCONbits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
;	.line	523; picUSB.c	return;
	BZ	_00398_DS_
;	.line	526; picUSB.c	if (UIRbits.URSTIF && UIEbits.URSTIE)
	BTFSS	_UIRbits, 0
; #	GOTO	_00388_DS_
; #	BTFSS	_UIEbits, 0, B
; #	GOTO	_00388_DS_
; #	CALL	_BusReset
; #	BTFSS	_UIRbits, 1
;	.line	527; picUSB.c	BusReset();
	BRA	_00388_DS_
	BANKSEL	_UIEbits
;	.line	543; picUSB.c	if (UIRbits.UERRIF && UIEbits.UERRIE)
	BTFSC	_UIEbits, 0, B
	CALL	_BusReset
_00388_DS_:
	BTFSS	_UIRbits, 1
; #	GOTO	_00391_DS_
; #	BTFSS	_UIEbits, 1, B
; #	GOTO	_00391_DS_
; #	BCF	_UIRbits, 1
; #	MOVLW	0x03
;	.line	544; picUSB.c	UIRbits.UERRIF = 0;// Clear errors
	BRA	_00391_DS_
	BANKSEL	_UIEbits
;	.line	547; picUSB.c	if (deviceState < DEFAULT)
	BTFSC	_UIEbits, 1, B
	BCF	_UIRbits, 1
_00391_DS_:
	MOVLW	0x03
; #	SUBWF	_deviceState, W, B
; #	BTFSC	STATUS, 0
; #	GOTO	_00394_DS_
; #	GOTO	_00398_DS_
; #	BTFSS	_UIRbits, 3
	BANKSEL	_deviceState
;	.line	548; picUSB.c	return;
	SUBWF	_deviceState, W, B
;	.line	551; picUSB.c	if(UIRbits.TRNIF && UIEbits.TRNIE)
	BNC	_00398_DS_
	BTFSS	_UIRbits, 3
	BRA	_00398_DS_
	BANKSEL	_UIEbits
	BTFSS	_UIEbits, 3, B
	BRA	_00398_DS_
;	.line	553; picUSB.c	ProcessControlTransfer();
	CALL	_ProcessControlTransfer
;	.line	555; picUSB.c	UIRbits.TRNIF = 0;
	BCF	_UIRbits, 3
_00398_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_picUSB__BusReset	code
_BusReset:
;	.line	483; picUSB.c	void BusReset()
	MOVFF	r0x00, POSTDEC1
;	.line	485; picUSB.c	UEIR  = 0x00;
	CLRF	_UEIR
;	.line	486; picUSB.c	UIR   = 0x00;
	CLRF	_UIR
;	.line	487; picUSB.c	UEIE  = 0x9f;
	MOVLW	0x9f
	BANKSEL	_UEIE
	MOVWF	_UEIE, B
;	.line	488; picUSB.c	UIE   = 0x7b;
	MOVLW	0x7b
	BANKSEL	_UIE
	MOVWF	_UIE, B
	BANKSEL	_UADDR
;	.line	489; picUSB.c	UADDR = 0x00;
	CLRF	_UADDR, B
;	.line	492; picUSB.c	UEP0 = EP_CTRL | HSHK_EN;
	MOVLW	0x16
	BANKSEL	_UEP0
	MOVWF	_UEP0, B
_00365_DS_:
;	.line	495; picUSB.c	while (UIRbits.TRNIF == 1)
	CLRF	r0x00
	BTFSC	_UIRbits, 3
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00367_DS_
;	.line	496; picUSB.c	UIRbits.TRNIF = 0;
	BCF	_UIRbits, 3
	BRA	_00365_DS_
_00367_DS_:
;	.line	499; picUSB.c	UCONbits.PKTDIS = 0;
	BCF	_UCONbits, 4
;	.line	502; picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BANKSEL	_selfPowered
;	.line	505; picUSB.c	selfPowered = 0;                      // Self powered is off by default
	CLRF	_selfPowered, B
	BANKSEL	_currentConfiguration
;	.line	506; picUSB.c	currentConfiguration = 0;             // Clear active configuration
	CLRF	_currentConfiguration, B
;	.line	507; picUSB.c	deviceState = DEFAULT;
	MOVLW	0x03
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_picUSB__UnSuspend	code
_UnSuspend:
;	.line	478; picUSB.c	UCONbits.SUSPND = 0;
	BCF	_UCONbits, 1
	BANKSEL	_UIEbits
;	.line	479; picUSB.c	UIEbits.ACTVIE = 0;
	BCF	_UIEbits, 2, B
;	.line	480; picUSB.c	UIRbits.ACTVIF = 0;
	BCF	_UIRbits, 2
	RETURN	

; ; Starting pCode block
S_picUSB__EnableUSBModule	code
_EnableUSBModule:
;	.line	456; picUSB.c	if(UCONbits.USBEN == 0)
	BTFSC	_UCONbits, 3
	BRA	_00342_DS_
;	.line	458; picUSB.c	UCON = 0;
	CLRF	_UCON
	BANKSEL	_UIE
;	.line	459; picUSB.c	UIE = 0;
	CLRF	_UIE, B
;	.line	460; picUSB.c	UCONbits.USBEN = 1;
	BSF	_UCONbits, 3
;	.line	461; picUSB.c	deviceState = ATTACHED;
	MOVLW	0x01
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00342_DS_:
	BANKSEL	_deviceState
;	.line	465; picUSB.c	if ((deviceState == ATTACHED) && !UCONbits.SE0)
	MOVF	_deviceState, W, B
	XORLW	0x01
	BNZ	_00346_DS_
	BTFSC	_UCONbits, 5
	BRA	_00346_DS_
;	.line	467; picUSB.c	UIR = 0;
	CLRF	_UIR
	BANKSEL	_UIE
;	.line	468; picUSB.c	UIE = 0;
	CLRF	_UIE, B
	BANKSEL	_UIEbits
;	.line	469; picUSB.c	UIEbits.URSTIE = 1;
	BSF	_UIEbits, 0, B
;	.line	470; picUSB.c	UIEbits.IDLEIE = 1;
	BSF	_UIEbits, 4, B
;	.line	471; picUSB.c	deviceState = POWERED;
	MOVLW	0x02
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00346_DS_:
	RETURN	

; ; Starting pCode block
S_picUSB__ProcessControlTransfer	code
_ProcessControlTransfer:
;	.line	364; picUSB.c	void ProcessControlTransfer()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	368; picUSB.c	end_point = USTAT >> 3;
	SWAPF	_USTAT, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x00
;	.line	370; picUSB.c	if (end_point == 0)
	MOVF	r0x00, W
	BTFSS	STATUS, 2
	BRA	_00294_DS_
;	.line	373; picUSB.c	if (USTATbits.DIR == OUT)
	BTFSC	_USTATbits, 2
	BRA	_00287_DS_
;	.line	377; picUSB.c	byte PID = (EP_OUT_BD(0).Stat.uc & 0x3C) >> 2;
	MOVLW	0x3c
	BANKSEL	_ep_bdt
	ANDWF	_ep_bdt, W, B
	MOVWF	r0x01
	RRNCF	r0x01, W
	RRNCF	WREG, W
	ANDLW	0x3f
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
;	.line	378; picUSB.c	if (PID == 0x0D)
	XORLW	0x0d
	BNZ	_00271_DS_
;	.line	380; picUSB.c	SetupStage();
	CALL	_SetupStage
	BRA	_00296_DS_
_00271_DS_:
	BANKSEL	_ctrlTransferStage
;	.line	382; picUSB.c	else if (ctrlTransferStage == DATA_OUT_STAGE)
	MOVF	_ctrlTransferStage, W, B
	XORLW	0x01
	BNZ	_00268_DS_
;	.line	386; picUSB.c	OutDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_OutDataStage
	MOVF	POSTINC1, F
	BANKSEL	_ep_bdt
;	.line	389; picUSB.c	if(EP_OUT_BD(0).Stat.DTS)
	BTFSS	_ep_bdt, 6, B
	BRA	_00265_DS_
;	.line	390; picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
	BRA	_00296_DS_
_00265_DS_:
;	.line	392; picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
	BANKSEL	_ep_bdt
	MOVWF	_ep_bdt, B
	BRA	_00296_DS_
_00268_DS_:
;	.line	398; picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BRA	_00296_DS_
_00287_DS_:
;	.line	402; picUSB.c	else if(USTATbits.DIR == IN)
	CLRF	r0x01
	BTFSC	_USTATbits, 2
	INCF	r0x01, F
	MOVF	r0x01, W
	XORLW	0x01
	BNZ	_00296_DS_
_00330_DS_:
	BANKSEL	_UADDR
;	.line	405; picUSB.c	if ((UADDR == 0) && (deviceState == ADDRESS))
	MOVF	_UADDR, W, B
	BNZ	_00276_DS_
	BANKSEL	_deviceState
	MOVF	_deviceState, W, B
	XORLW	0x04
	BNZ	_00276_DS_
;	.line	409; picUSB.c	UADDR = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _UADDR
	BANKSEL	_UADDR
;	.line	410; picUSB.c	if(UADDR == 0)
	MOVF	_UADDR, W, B
	BNZ	_00276_DS_
;	.line	413; picUSB.c	deviceState = DEFAULT;
	MOVLW	0x03
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00276_DS_:
	BANKSEL	_ctrlTransferStage
;	.line	416; picUSB.c	if (ctrlTransferStage == DATA_IN_STAGE)
	MOVF	_ctrlTransferStage, W, B
	XORLW	0x02
	BNZ	_00282_DS_
;	.line	419; picUSB.c	InDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_InDataStage
	MOVF	POSTINC1, F
	BANKSEL	(_ep_bdt + 4)
;	.line	422; picUSB.c	if(EP_IN_BD(0).Stat.DTS)
	BTFSS	(_ep_bdt + 4), 6, B
	BRA	_00279_DS_
;	.line	423; picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00296_DS_
_00279_DS_:
;	.line	425; picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
	BANKSEL	(_ep_bdt + 4)
	MOVWF	(_ep_bdt + 4), B
	BRA	_00296_DS_
_00282_DS_:
;	.line	431; picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BRA	_00296_DS_
_00294_DS_:
;	.line	437; picUSB.c	else if (end_point == 1)
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00296_DS_
;	.line	440; picUSB.c	if (!USTATbits.DIR)
	BTFSC	_USTATbits, 2
	BRA	_00296_DS_
;	.line	445; picUSB.c	usb_ep_data_out_callback(end_point);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_usb_ep_data_out_callback
	MOVF	POSTINC1, F
_00296_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_picUSB__WaitForSetupStage	code
_WaitForSetupStage:
	BANKSEL	_ctrlTransferStage
;	.line	352; picUSB.c	ctrlTransferStage = SETUP_STAGE;
	CLRF	_ctrlTransferStage, B
;	.line	353; picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	354; picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	356; picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
; removed redundant BANKSEL
;	.line	357; picUSB.c	EP_IN_BD(0).Stat.uc = 0x00;           // Give control to CPU
	CLRF	(_ep_bdt + 4), B
	RETURN	

; ; Starting pCode block
S_picUSB__SetupStage	code
_SetupStage:
;	.line	283; picUSB.c	void SetupStage()
	MOVFF	r0x00, POSTDEC1
	BANKSEL	(_ep_bdt + 4)
;	.line	287; picUSB.c	EP_IN_BD(0).Stat.uc &= ~BDS_UOWN;
	MOVF	(_ep_bdt + 4), W, B
	MOVWF	r0x00
	BCF	r0x00, 7
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
; removed redundant BANKSEL
;	.line	288; picUSB.c	EP_OUT_BD(0).Stat.uc &= ~BDS_UOWN;
	MOVF	_ep_bdt, W, B
	MOVWF	r0x00
	BCF	r0x00, 7
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
	BANKSEL	_ctrlTransferStage
;	.line	291; picUSB.c	ctrlTransferStage = SETUP_STAGE;
	CLRF	_ctrlTransferStage, B
	BANKSEL	_requestHandled
;	.line	292; picUSB.c	requestHandled = 0;                   // Default is that request hasn't been handled
	CLRF	_requestHandled, B
	BANKSEL	_wCount
;	.line	293; picUSB.c	wCount = 0;                           // No bytes transferred
	CLRF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	296; picUSB.c	ProcessStandardRequest();
	CALL	_ProcessStandardRequest
	BANKSEL	_requestHandled
;	.line	299; picUSB.c	if (!requestHandled)
	MOVF	_requestHandled, W, B
	BNZ	_00241_DS_
;	.line	302; picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	303; picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
; #	MOVLW	0x84
; #	MOVWF	_ep_bdt, B
; #	MOVLW	0x84
;	.line	304; picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
	MOVLW	0x84
; removed redundant BANKSEL
;	.line	305; picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
	MOVWF	_ep_bdt, B
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00242_DS_
_00241_DS_:
	BANKSEL	_SetupPacket
;	.line	308; picUSB.c	else if (SetupPacket.bmRequestType & 0x80)
	BTFSS	_SetupPacket, 7, B
	BRA	_00238_DS_
	BANKSEL	(_wCount + 1)
;	.line	311; picUSB.c	if(SetupPacket.wLength < wCount)
	MOVF	(_wCount + 1), W, B
	BANKSEL	(_SetupPacket + 7)
	SUBWF	(_SetupPacket + 7), W, B
	BNZ	_00254_DS_
	BANKSEL	_wCount
	MOVF	_wCount, W, B
	BANKSEL	(_SetupPacket + 6)
	SUBWF	(_SetupPacket + 6), W, B
_00254_DS_:
	BC	_00236_DS_
;	.line	312; picUSB.c	wCount = SetupPacket.wLength;
	MOVFF	(_SetupPacket + 6), _wCount
	MOVFF	(_SetupPacket + 7), (_wCount + 1)
_00236_DS_:
;	.line	314; picUSB.c	InDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_InDataStage
	MOVF	POSTINC1, F
;	.line	315; picUSB.c	ctrlTransferStage = DATA_IN_STAGE;
	MOVLW	0x02
	BANKSEL	_ctrlTransferStage
	MOVWF	_ctrlTransferStage, B
;	.line	317; picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	318; picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	319; picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN;
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
;	.line	322; picUSB.c	EP_IN_BD(0).ADDR = PTR16(&controlTransferBuffer);
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 6), B
	MOVLW	HIGH(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 7), B
;	.line	324; picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00242_DS_
_00238_DS_:
;	.line	330; picUSB.c	ctrlTransferStage = DATA_OUT_STAGE;
	MOVLW	0x01
	BANKSEL	_ctrlTransferStage
	MOVWF	_ctrlTransferStage, B
	BANKSEL	(_ep_bdt + 5)
;	.line	333; picUSB.c	EP_IN_BD(0).Cnt = 0;
	CLRF	(_ep_bdt + 5), B
;	.line	334; picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
;	.line	337; picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 1), B
;	.line	338; picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&controlTransferBuffer);
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	340; picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
_00242_DS_:
;	.line	344; picUSB.c	UCONbits.PKTDIS = 0;
	BCF	_UCONbits, 4
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_picUSB__OutDataStage	code
_OutDataStage:
;	.line	260; picUSB.c	void OutDataStage(unsigned char ep)
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
;	.line	264; picUSB.c	bufferSize = ((0x03 & EP_OUT_BD(ep).Stat.uc) << 8) | EP_OUT_BD(ep).Cnt;
	RLNCF	r0x00, W
	ANDLW	0xfe
; #	MOVWF	r0x01
; #;;multiply lit val:0x04 by variable r0x01 and store in r0x00
; #	MOVF	r0x01, W
	MULLW	0x04
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	MOVLW	0x03
	ANDWF	r0x01, F
	MOVF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x03
	CLRF	r0x01
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x01, F
	INFSNZ	r0x00, F
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	CLRF	r0x01
	MOVF	r0x03, W
	IORWF	r0x00, F
	MOVF	r0x04, W
	IORWF	r0x01, F
;	.line	267; picUSB.c	wCount = wCount + bufferSize;
	MOVF	r0x00, W
	BANKSEL	_wCount
	ADDWF	_wCount, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_wCount + 1), F, B
;	.line	269; picUSB.c	outPtr = (byte*)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	271; picUSB.c	for (i=0;i<bufferSize;i++)
	CLRF	r0x02
	CLRF	r0x03
_00215_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00228_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00228_DS_:
	BC	_00219_DS_
;	.line	272; picUSB.c	*inPtr++ = *outPtr++;
	MOVFF	_inPtr, r0x04
	MOVFF	(_inPtr + 1), r0x05
	MOVFF	(_inPtr + 2), r0x06
	MOVFF	_outPtr, r0x07
	MOVFF	(_outPtr + 1), r0x08
	MOVFF	(_outPtr + 2), r0x09
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x07
	BANKSEL	_outPtr
	INCF	_outPtr, F, B
	BNC	_00229_DS_
; removed redundant BANKSEL
	INCFSZ	(_outPtr + 1), F, B
	BRA	_10380_DS_
; removed redundant BANKSEL
	INCF	(_outPtr + 2), F, B
_10380_DS_:
_00229_DS_:
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
	BANKSEL	_inPtr
	INCF	_inPtr, F, B
	BNC	_00230_DS_
; removed redundant BANKSEL
	INCFSZ	(_inPtr + 1), F, B
	BRA	_20381_DS_
; removed redundant BANKSEL
	INCF	(_inPtr + 2), F, B
_20381_DS_:
_00230_DS_:
;	.line	271; picUSB.c	for (i=0;i<bufferSize;i++)
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00215_DS_
_00219_DS_:
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
S_picUSB__InDataStage	code
_InDataStage:
;	.line	226; picUSB.c	void InDataStage(unsigned char ep)
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
;	.line	232; picUSB.c	if(wCount < EP0_BUFFER_SIZE)
	MOVLW	0x00
	BANKSEL	(_wCount + 1)
	SUBWF	(_wCount + 1), W, B
	BNZ	_00203_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	_wCount, W, B
_00203_DS_:
	BC	_00188_DS_
;	.line	233; picUSB.c	bufferSize = wCount;
	MOVFF	_wCount, r0x01
	MOVFF	(_wCount + 1), r0x02
	BRA	_00189_DS_
_00188_DS_:
;	.line	235; picUSB.c	bufferSize = EP0_BUFFER_SIZE;
	MOVLW	0x40
	MOVWF	r0x01
	CLRF	r0x02
_00189_DS_:
;	.line	239; picUSB.c	EP_IN_BD(ep).Stat.uc &= ~(BDS_BC8 | BDS_BC9);
	RLNCF	r0x00, W
	ANDLW	0xfe
	MOVWF	r0x03
	INCF	r0x03, W
; #	MOVWF	r0x00
; #;;multiply lit val:0x04 by variable r0x00 and store in r0x00
; #	MOVF	r0x00, W
	MULLW	0x04
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x04, F
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x06, F
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	INDF0, r0x05
	MOVLW	0xfc
	ANDWF	r0x05, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x05, INDF0
;	.line	240; picUSB.c	EP_IN_BD(ep).Stat.uc |= (byte)((bufferSize & 0x0300) >> 8);
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x04, F
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x06, F
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	INDF0, r0x05
	MOVLW	0x03
	ANDWF	r0x02, W
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
	IORWF	r0x05, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x05, INDF0
;	.line	241; picUSB.c	EP_IN_BD(ep).Cnt = (byte)(bufferSize & 0xFF);
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x04, F
	INFSNZ	r0x03, F
	INCF	r0x04, F
	MOVF	r0x01, W
	MOVWF	r0x05
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x05, INDF0
;	.line	242; picUSB.c	EP_IN_BD(ep).ADDR = PTR16(&controlTransferBuffer);
	CLRF	r0x03
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, F
	MOVLW	0x02
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVLW	LOW(_controlTransferBuffer)
	MOVWF	r0x04
	MOVLW	HIGH(_controlTransferBuffer)
	MOVWF	r0x05
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, POSTINC0
	MOVFF	r0x05, INDF0
;	.line	247; picUSB.c	wCount = wCount - bufferSize;
	MOVF	r0x01, W
	BANKSEL	_wCount
	SUBWF	_wCount, F, B
	MOVF	r0x02, W
; removed redundant BANKSEL
	SUBWFB	(_wCount + 1), F, B
;	.line	250; picUSB.c	inPtr = (byte *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_inPtr + 1)
	MOVWF	(_inPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_inPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_inPtr + 2), B
;	.line	252; picUSB.c	for (i=0;i<bufferSize;i++)
	CLRF	r0x00
_00190_DS_:
	MOVFF	r0x00, r0x03
	CLRF	r0x04
	MOVF	r0x02, W
	SUBWF	r0x04, W
	BNZ	_00208_DS_
	MOVF	r0x01, W
	SUBWF	r0x03, W
_00208_DS_:
	BC	_00194_DS_
;	.line	253; picUSB.c	*inPtr++ = *outPtr++;
	MOVFF	_inPtr, r0x03
	MOVFF	(_inPtr + 1), r0x04
	MOVFF	(_inPtr + 2), r0x05
	MOVFF	_outPtr, r0x06
	MOVFF	(_outPtr + 1), r0x07
	MOVFF	(_outPtr + 2), r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget1
	MOVWF	r0x06
	BANKSEL	_outPtr
	INCF	_outPtr, F, B
	BNC	_00209_DS_
; removed redundant BANKSEL
	INCFSZ	(_outPtr + 1), F, B
	BRA	_30382_DS_
; removed redundant BANKSEL
	INCF	(_outPtr + 2), F, B
_30382_DS_:
_00209_DS_:
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	BANKSEL	_inPtr
	INCF	_inPtr, F, B
	BNC	_00210_DS_
; removed redundant BANKSEL
	INCFSZ	(_inPtr + 1), F, B
	BRA	_40383_DS_
; removed redundant BANKSEL
	INCF	(_inPtr + 2), F, B
_40383_DS_:
_00210_DS_:
;	.line	252; picUSB.c	for (i=0;i<bufferSize;i++)
	INCF	r0x00, F
	BRA	_00190_DS_
_00194_DS_:
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
S_picUSB__ProcessStandardRequest	code
_ProcessStandardRequest:
;	.line	131; picUSB.c	void ProcessStandardRequest()
	MOVFF	r0x00, POSTDEC1
;	.line	133; picUSB.c	byte request = SetupPacket.bRequest;
	MOVFF	(_SetupPacket + 1), r0x00
	BANKSEL	_SetupPacket
;	.line	135; picUSB.c	if((SetupPacket.bmRequestType & 0x60) != 0x00)
	MOVF	_SetupPacket, W, B
; #	ANDLW	0x60
; #	BTFSC	STATUS, 2
; #	GOTO	_00131_DS_
; #	GOTO	_00152_DS_
; #	MOVF	r0x00, W
;	.line	138; picUSB.c	return;
	ANDLW	0x60
;	.line	140; picUSB.c	if (request == SET_ADDRESS)
	BTFSS	STATUS, 2
	BRA	_00152_DS_
	MOVF	r0x00, W
	XORLW	0x05
	BNZ	_00150_DS_
;	.line	146; picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	147; picUSB.c	deviceState = ADDRESS;
	MOVLW	0x04
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
;	.line	148; picUSB.c	deviceAddress = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _deviceAddress
	BRA	_00152_DS_
_00150_DS_:
;	.line	151; picUSB.c	else if (request == GET_DESCRIPTOR)
	MOVF	r0x00, W
	XORLW	0x06
	BNZ	_00147_DS_
;	.line	153; picUSB.c	GetDescriptor();
	CALL	_GetDescriptor
	BRA	_00152_DS_
_00147_DS_:
;	.line	156; picUSB.c	else if (request == SET_CONFIGURATION)
	MOVF	r0x00, W
	XORLW	0x09
	BNZ	_00144_DS_
;	.line	158; picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	159; picUSB.c	usb_configure_endpoints();
	CALL	_usb_configure_endpoints
;	.line	160; picUSB.c	currentConfiguration = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _currentConfiguration
	BANKSEL	_currentConfiguration
;	.line	163; picUSB.c	if (currentConfiguration == 0)
	MOVF	_currentConfiguration, W, B
	BNZ	_00133_DS_
;	.line	166; picUSB.c	deviceState = ADDRESS;
	MOVLW	0x04
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	BRA	_00152_DS_
_00133_DS_:
;	.line	169; picUSB.c	deviceState = CONFIGURED;
	MOVLW	0x05
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	BRA	_00152_DS_
_00144_DS_:
;	.line	176; picUSB.c	else if (request == GET_CONFIGURATION)
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00141_DS_
;	.line	178; picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	179; picUSB.c	outPtr = (byte*)&currentConfiguration;
	MOVLW	HIGH(_currentConfiguration)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_currentConfiguration)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	180; picUSB.c	wCount = 1;
	MOVLW	0x01
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00152_DS_
_00141_DS_:
;	.line	195; picUSB.c	else if (request == GET_INTERFACE)
	MOVF	r0x00, W
	XORLW	0x0a
	BNZ	_00138_DS_
;	.line	199; picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BANKSEL	_controlTransferBuffer
;	.line	200; picUSB.c	controlTransferBuffer[0] = 0;
	CLRF	_controlTransferBuffer, B
;	.line	201; picUSB.c	outPtr = (byte *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	202; picUSB.c	wCount = 1;
	MOVLW	0x01
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00152_DS_
_00138_DS_:
;	.line	205; picUSB.c	else if (request == SET_INTERFACE)
	MOVF	r0x00, W
	XORLW	0x0b
	BNZ	_00152_DS_
;	.line	208; picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
_00152_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_picUSB__GetDescriptor	code
_GetDescriptor:
;	.line	90; picUSB.c	static void GetDescriptor()
	MOVFF	r0x00, POSTDEC1
	BANKSEL	_SetupPacket
;	.line	92; picUSB.c	if(SetupPacket.bmRequestType == 0x80)
	MOVF	_SetupPacket, W, B
	XORLW	0x80
	BNZ	_00112_DS_
;	.line	94; picUSB.c	byte descriptorType  = SetupPacket.wValue1;
	MOVFF	(_SetupPacket + 3), r0x00
; ;;!!! pic16_aopOp:1117 called for a spillLocation -- assigning WREG instead --- CHECK
;	.line	95; picUSB.c	byte descriptorIndex = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), WREG
;	.line	97; picUSB.c	if (descriptorType == DEVICE_DESCRIPTOR)
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00108_DS_
;	.line	99; picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	100; picUSB.c	outPtr = (byte *)&device_descriptor;
	MOVLW	UPPER(_device_descriptor)
	BANKSEL	(_outPtr + 2)
	MOVWF	(_outPtr + 2), B
	MOVLW	HIGH(_device_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_device_descriptor)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
;	.line	101; picUSB.c	wCount = sizeof(USB_Device_Descriptor);
	MOVLW	0x12
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00112_DS_
_00108_DS_:
;	.line	104; picUSB.c	else if (descriptorType == CONFIGURATION_DESCRIPTOR)
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00112_DS_
;	.line	106; picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	107; picUSB.c	outPtr = (byte *)&configuration_descriptor;
	MOVLW	UPPER(_configuration_descriptor)
	BANKSEL	(_outPtr + 2)
	MOVWF	(_outPtr + 2), B
	MOVLW	HIGH(_configuration_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_configuration_descriptor)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
;	.line	108; picUSB.c	wCount = configuration_descriptor.Header.wTotalLength;
	MOVLW	LOW(_configuration_descriptor + 2)
	MOVWF	TBLPTRL
	MOVLW	HIGH(_configuration_descriptor + 2)
	MOVWF	TBLPTRH
	MOVLW	UPPER(_configuration_descriptor + 2)
	MOVWF	TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, _wCount
	TBLRD*+	
	MOVFF	TABLAT, (_wCount + 1)
_00112_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	



; Statistics:
; code size:	 1702 (0x06a6) bytes ( 1.30%)
;           	  851 (0x0353) words
; udata size:	  334 (0x014e) bytes ( 9.49%)
; access size:	   10 (0x000a) bytes


	end
