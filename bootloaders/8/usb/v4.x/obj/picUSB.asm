;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8163 (Oct 23 2012) (Linux)
; This file was generated Tue Dec 18 18:50:52 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f25k50
	radix	dec


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
	extern	_SRCON1bits
	extern	_SRCON0bits
	extern	_CCPTMRSbits
	extern	_ANSELAbits
	extern	_ANSELBbits
	extern	_ANSELCbits
	extern	_UCONbits
	extern	_USTATbits
	extern	_UCFGbits
	extern	_UADDRbits
	extern	_UIEbits
	extern	_UIRbits
	extern	_UEIEbits
	extern	_UEIRbits
	extern	_UFRMLbits
	extern	_UFRMHbits
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
	extern	_SLRCONbits
	extern	_VREFCON2bits
	extern	_VREFCON1bits
	extern	_VREFCON0bits
	extern	_PMD0bits
	extern	_PMD1bits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTEbits
	extern	_WPUBbits
	extern	_IOCBbits
	extern	_IOCCbits
	extern	_CTMUICONbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_CTMUCON1bits
	extern	_CTMUCONLbits
	extern	_CTMUCON0bits
	extern	_CTMUCONHbits
	extern	_DDRAbits
	extern	_TRISAbits
	extern	_DDRBbits
	extern	_TRISBbits
	extern	_DDRCbits
	extern	_TRISCbits
	extern	_CCP2CONbits
	extern	_ECCP2CONbits
	extern	_CM1CON0bits
	extern	_CM2CON0bits
	extern	_CM2CON1bits
	extern	_OSCTUNEbits
	extern	_HLVDCONbits
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
	extern	_RCSTA1bits
	extern	_TXSTA1bits
	extern	_SPBRG1bits
	extern	_SPBRGH1bits
	extern	_T3CONbits
	extern	_T3GCONbits
	extern	_ACTCONbits
	extern	_STCONbits
	extern	_ECCP1ASbits
	extern	_ECCP1DELbits
	extern	_PWM1CONbits
	extern	_BAUDCON1bits
	extern	_PSTR1CONbits
	extern	_T2CONbits
	extern	_CCP1CONbits
	extern	_ECCP1CONbits
	extern	_ADCON2bits
	extern	_ADCON1bits
	extern	_ADCON0bits
	extern	_SSP1CON2bits
	extern	_SSPCON2bits
	extern	_SSP1CONbits
	extern	_SSP1CON1bits
	extern	_SSPCONbits
	extern	_SSP1STATbits
	extern	_SSPSTATbits
	extern	_SSP1ADDbits
	extern	_SSPADDbits
	extern	_SSP1MSKbits
	extern	_SSPMSKbits
	extern	_SSP1CON3bits
	extern	_SSPCON3bits
	extern	_T1GCONbits
	extern	_T1CONbits
	extern	_RCONbits
	extern	_WDTCONbits
	extern	_OSCCON2bits
	extern	_OSCCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_STKPTRbits
	extern	_SRCON1
	extern	_SRCON0
	extern	_CCPTMRS
	extern	_VREGCON
	extern	_ANSELA
	extern	_ANSELB
	extern	_ANSELC
	extern	_UCON
	extern	_USTAT
	extern	_UCFG
	extern	_UADDR
	extern	_UIE
	extern	_UIR
	extern	_UEIE
	extern	_UEIR
	extern	_UFRM
	extern	_UFRML
	extern	_UFRMH
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
	extern	_SLRCON
	extern	_VREFCON2
	extern	_VREFCON1
	extern	_VREFCON0
	extern	_PMD0
	extern	_PMD1
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTE
	extern	_WPUB
	extern	_IOCB
	extern	_IOCC
	extern	_CTMUICON
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_CTMUCON1
	extern	_CTMUCONL
	extern	_CTMUCON0
	extern	_CTMUCONH
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_DDRA
	extern	_TRISA
	extern	_DDRB
	extern	_TRISB
	extern	_DDRC
	extern	_TRISC
	extern	_CCP2CON
	extern	_ECCP2CON
	extern	_CM1CON0
	extern	_CM2CON0
	extern	_CM2CON1
	extern	_OSCTUNE
	extern	_HLVDCON
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
	extern	_EEDATA
	extern	_EEADR
	extern	_RCSTA1
	extern	_TXSTA1
	extern	_TXREG1
	extern	_RCREG1
	extern	_SPBRG1
	extern	_SPBRGH1
	extern	_T3CON
	extern	_TMR3
	extern	_TMR3L
	extern	_TMR3H
	extern	_T3GCON
	extern	_ACTCON
	extern	_STCON
	extern	_ECCP1AS
	extern	_ECCP1DEL
	extern	_PWM1CON
	extern	_BAUDCON1
	extern	_PSTR1CON
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_CCP1CON
	extern	_ECCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ADCON2
	extern	_ADCON1
	extern	_ADCON0
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSP1CON2
	extern	_SSPCON2
	extern	_SSP1CON
	extern	_SSP1CON1
	extern	_SSPCON
	extern	_SSP1STAT
	extern	_SSPSTAT
	extern	_SSP1ADD
	extern	_SSPADD
	extern	_SSP1BUF
	extern	_SSPBUF
	extern	_SSP1MSK
	extern	_SSPMSK
	extern	_SSP1CON3
	extern	_SSPCON3
	extern	_T1GCON
	extern	_T1CON
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_WDTCON
	extern	_OSCCON2
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
;	.line	500; src/picUSB.c	void ProcessUSBTransactions()
	MOVFF	r0x00, POSTDEC1
; #	MOVF	_deviceState, W, B
; #	BTFSS	STATUS, 2
; #	GOTO	_00406_DS_
; #	GOTO	_00423_DS_
; #	BTFSS	_UIRbits, 2
	BANKSEL	_deviceState
;	.line	503; src/picUSB.c	if(deviceState == DETACHED)
	MOVF	_deviceState, W, B
;	.line	504; src/picUSB.c	return;
	BZ	_00423_DS_
;	.line	507; src/picUSB.c	if(UIRbits.ACTVIF && UIEbits.ACTVIE)
	BTFSS	_UIRbits, 2
; #	GOTO	_00408_DS_
; #	BTFSS	_UIEbits, 2
; #	GOTO	_00408_DS_
; #	CALL	_UnSuspend
; #	CLRF	r0x00
;	.line	508; src/picUSB.c	UnSuspend();
	BRA	_00408_DS_
;	.line	511; src/picUSB.c	if(UCONbits.SUSPND == 1)
	BTFSC	_UIEbits, 2
	CALL	_UnSuspend
_00408_DS_:
	CLRF	r0x00
	BTFSC	_UCONbits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
;	.line	512; src/picUSB.c	return;
	BZ	_00423_DS_
;	.line	515; src/picUSB.c	if (UIRbits.URSTIF && UIEbits.URSTIE)
	BTFSS	_UIRbits, 0
; #	GOTO	_00413_DS_
; #	BTFSS	_UIEbits, 0
; #	GOTO	_00413_DS_
; #	CALL	_BusReset
; #	BTFSS	_UIRbits, 1
;	.line	516; src/picUSB.c	BusReset();
	BRA	_00413_DS_
;	.line	532; src/picUSB.c	if (UIRbits.UERRIF && UIEbits.UERRIE)
	BTFSC	_UIEbits, 0
	CALL	_BusReset
_00413_DS_:
	BTFSS	_UIRbits, 1
; #	GOTO	_00416_DS_
; #	BTFSS	_UIEbits, 1
; #	GOTO	_00416_DS_
; #	BCF	_UIRbits, 1
; #	MOVLW	0x03
;	.line	533; src/picUSB.c	UIRbits.UERRIF = 0;// Clear errors
	BRA	_00416_DS_
;	.line	536; src/picUSB.c	if (deviceState < DEFAULT)  // DETACHED, ATTACHED or POWERED
	BTFSC	_UIEbits, 1
	BCF	_UIRbits, 1
_00416_DS_:
	MOVLW	0x03
; #	SUBWF	_deviceState, W, B
; #	BTFSC	STATUS, 0
; #	GOTO	_00419_DS_
; #	GOTO	_00423_DS_
; #	BTFSS	_UIRbits, 3
	BANKSEL	_deviceState
;	.line	537; src/picUSB.c	return;
	SUBWF	_deviceState, W, B
;	.line	540; src/picUSB.c	if(UIRbits.TRNIF && UIEbits.TRNIE)
	BNC	_00423_DS_
	BTFSS	_UIRbits, 3
	BRA	_00423_DS_
	BTFSS	_UIEbits, 3
	BRA	_00423_DS_
;	.line	542; src/picUSB.c	ProcessControlTransfer();
	CALL	_ProcessControlTransfer
;	.line	544; src/picUSB.c	UIRbits.TRNIF = 0;
	BCF	_UIRbits, 3
_00423_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_picUSB__BusReset	code
_BusReset:
;	.line	472; src/picUSB.c	void BusReset()
	MOVFF	r0x00, POSTDEC1
;	.line	474; src/picUSB.c	UEIR  = 0x00;
	CLRF	_UEIR
;	.line	475; src/picUSB.c	UIR   = 0x00;
	CLRF	_UIR
;	.line	476; src/picUSB.c	UEIE  = 0x9f;
	MOVLW	0x9f
	MOVWF	_UEIE
;	.line	477; src/picUSB.c	UIE   = 0x7b;
	MOVLW	0x7b
	MOVWF	_UIE
;	.line	478; src/picUSB.c	UADDR = 0x00;
	CLRF	_UADDR
;	.line	481; src/picUSB.c	UEP0 = EP_CTRL | HSHK_EN;
	MOVLW	0x16
	MOVWF	_UEP0
_00388_DS_:
;	.line	484; src/picUSB.c	while (UIRbits.TRNIF == 1)
	CLRF	r0x00
	BTFSC	_UIRbits, 3
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00390_DS_
;	.line	485; src/picUSB.c	UIRbits.TRNIF = 0;
	BCF	_UIRbits, 3
	BRA	_00388_DS_
_00390_DS_:
;	.line	488; src/picUSB.c	UCONbits.PKTDIS = 0;
	BCF	_UCONbits, 4
;	.line	491; src/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BANKSEL	_selfPowered
;	.line	494; src/picUSB.c	selfPowered = 0;                      // Self powered is off by default
	CLRF	_selfPowered, B
	BANKSEL	_currentConfiguration
;	.line	495; src/picUSB.c	currentConfiguration = 0;             // Clear active configuration
	CLRF	_currentConfiguration, B
;	.line	496; src/picUSB.c	deviceState = DEFAULT;
	MOVLW	0x03
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_picUSB__UnSuspend	code
_UnSuspend:
;	.line	467; src/picUSB.c	UCONbits.SUSPND = 0;
	BCF	_UCONbits, 1
;	.line	468; src/picUSB.c	UIEbits.ACTVIE = 0;
	BCF	_UIEbits, 2
;	.line	469; src/picUSB.c	UIRbits.ACTVIF = 0;
	BCF	_UIRbits, 2
	RETURN	

; ; Starting pCode block
S_picUSB__EnableUSBModule	code
_EnableUSBModule:
;	.line	445; src/picUSB.c	if(UCONbits.USBEN == 0)
	BTFSC	_UCONbits, 3
	BRA	_00362_DS_
;	.line	447; src/picUSB.c	UCON = 0;
	CLRF	_UCON
;	.line	448; src/picUSB.c	UIE = 0;
	CLRF	_UIE
;	.line	449; src/picUSB.c	UCONbits.USBEN = 1;
	BSF	_UCONbits, 3
;	.line	450; src/picUSB.c	deviceState = ATTACHED;
	MOVLW	0x01
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00362_DS_:
	BANKSEL	_deviceState
;	.line	454; src/picUSB.c	if ((deviceState == ATTACHED) && !UCONbits.SE0)
	MOVF	_deviceState, W, B
	XORLW	0x01
	BNZ	_00366_DS_
	BTFSC	_UCONbits, 5
	BRA	_00366_DS_
;	.line	456; src/picUSB.c	UIR = 0;
	CLRF	_UIR
;	.line	457; src/picUSB.c	UIE = 0;
	CLRF	_UIE
;	.line	458; src/picUSB.c	UIEbits.URSTIE = 1;
	BSF	_UIEbits, 0
;	.line	459; src/picUSB.c	UIEbits.IDLEIE = 1;
	BSF	_UIEbits, 4
;	.line	460; src/picUSB.c	deviceState = POWERED;
	MOVLW	0x02
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00366_DS_:
	RETURN	

; ; Starting pCode block
S_picUSB__ProcessControlTransfer	code
_ProcessControlTransfer:
;	.line	361; src/picUSB.c	void ProcessControlTransfer()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	364; src/picUSB.c	byte PID, end_point = USTAT >> 3;
	SWAPF	_USTAT, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x00
;	.line	366; src/picUSB.c	if (end_point == 0) // Endpoint 0
	MOVF	r0x00, W
	BTFSS	STATUS, 2
	BRA	_00311_DS_
;	.line	369; src/picUSB.c	if (USTATbits.DIR == OUT)
	BTFSC	_USTATbits, 2
	BRA	_00306_DS_
;	.line	373; src/picUSB.c	PID = (EP_OUT_BD(0).Stat.uc & 0x3C) >> 2;
	MOVLW	0x3c
	BANKSEL	_ep_bdt
	ANDWF	_ep_bdt, W, B
	MOVWF	r0x01
	RRNCF	r0x01, W
	RRNCF	WREG, W
	ANDLW	0x3f
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
;	.line	374; src/picUSB.c	if (PID == 0x0D)
	XORLW	0x0d
	BNZ	_00292_DS_
;	.line	376; src/picUSB.c	SetupStage();
	CALL	_SetupStage
	BRA	_00313_DS_
_00292_DS_:
	BANKSEL	_ctrlTransferStage
;	.line	378; src/picUSB.c	else if (ctrlTransferStage == DATA_OUT_STAGE)
	MOVF	_ctrlTransferStage, W, B
	XORLW	0x01
	BNZ	_00289_DS_
;	.line	382; src/picUSB.c	OutDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_OutDataStage
	MOVF	POSTINC1, F
	BANKSEL	_ep_bdt
;	.line	385; src/picUSB.c	if(EP_OUT_BD(0).Stat.DTS)
	BTFSS	_ep_bdt, 6, B
	BRA	_00286_DS_
;	.line	386; src/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
	BRA	_00313_DS_
_00286_DS_:
;	.line	388; src/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
	BANKSEL	_ep_bdt
	MOVWF	_ep_bdt, B
	BRA	_00313_DS_
_00289_DS_:
;	.line	394; src/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BRA	_00313_DS_
_00306_DS_:
;	.line	401; src/picUSB.c	if ((UADDR == 0) && (deviceState == ADDRESS))
	MOVF	_UADDR, W
	BNZ	_00297_DS_
	BANKSEL	_deviceState
	MOVF	_deviceState, W, B
	XORLW	0x04
	BNZ	_00297_DS_
;	.line	405; src/picUSB.c	UADDR = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _UADDR
;	.line	406; src/picUSB.c	if(UADDR == 0)
	MOVF	_UADDR, W
	BNZ	_00297_DS_
;	.line	409; src/picUSB.c	deviceState = DEFAULT;
	MOVLW	0x03
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00297_DS_:
	BANKSEL	_ctrlTransferStage
;	.line	412; src/picUSB.c	if (ctrlTransferStage == DATA_IN_STAGE)
	MOVF	_ctrlTransferStage, W, B
	XORLW	0x02
	BNZ	_00303_DS_
;	.line	415; src/picUSB.c	InDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_InDataStage
	MOVF	POSTINC1, F
	BANKSEL	(_ep_bdt + 4)
;	.line	418; src/picUSB.c	if(EP_IN_BD(0).Stat.DTS)
	BTFSS	(_ep_bdt + 4), 6, B
	BRA	_00300_DS_
;	.line	419; src/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00313_DS_
_00300_DS_:
;	.line	421; src/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
	BANKSEL	(_ep_bdt + 4)
	MOVWF	(_ep_bdt + 4), B
	BRA	_00313_DS_
_00303_DS_:
;	.line	427; src/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BRA	_00313_DS_
_00311_DS_:
;	.line	436; src/picUSB.c	if (!USTATbits.DIR) // If OUT
	BTFSC	_USTATbits, 2
	BRA	_00313_DS_
;	.line	437; src/picUSB.c	usb_ep_data_out_callback(end_point);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_usb_ep_data_out_callback
	MOVF	POSTINC1, F
_00313_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_picUSB__WaitForSetupStage	code
_WaitForSetupStage:
	BANKSEL	_ctrlTransferStage
;	.line	349; src/picUSB.c	ctrlTransferStage = SETUP_STAGE;
	CLRF	_ctrlTransferStage, B
;	.line	350; src/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	351; src/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	353; src/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
; removed redundant BANKSEL
;	.line	354; src/picUSB.c	EP_IN_BD(0).Stat.uc = 0x00;           // Give control to CPU
	CLRF	(_ep_bdt + 4), B
	RETURN	

; ; Starting pCode block
S_picUSB__SetupStage	code
_SetupStage:
;	.line	280; src/picUSB.c	void SetupStage()
	MOVFF	r0x00, POSTDEC1
	BANKSEL	(_ep_bdt + 4)
;	.line	284; src/picUSB.c	EP_IN_BD(0).Stat.uc &= ~BDS_UOWN;
	MOVF	(_ep_bdt + 4), W, B
	MOVWF	r0x00
	BCF	r0x00, 7
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
; removed redundant BANKSEL
;	.line	285; src/picUSB.c	EP_OUT_BD(0).Stat.uc &= ~BDS_UOWN;
	MOVF	_ep_bdt, W, B
	MOVWF	r0x00
	BCF	r0x00, 7
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
	BANKSEL	_ctrlTransferStage
;	.line	288; src/picUSB.c	ctrlTransferStage = SETUP_STAGE;
	CLRF	_ctrlTransferStage, B
	BANKSEL	_requestHandled
;	.line	289; src/picUSB.c	requestHandled = 0;                   // Default is that request hasn't been handled
	CLRF	_requestHandled, B
	BANKSEL	_wCount
;	.line	290; src/picUSB.c	wCount = 0;                           // No bytes transferred
	CLRF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	293; src/picUSB.c	ProcessStandardRequest();
	CALL	_ProcessStandardRequest
	BANKSEL	_requestHandled
;	.line	296; src/picUSB.c	if (!requestHandled)
	MOVF	_requestHandled, W, B
	BNZ	_00258_DS_
;	.line	299; src/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	300; src/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
; #	MOVLW	0x84
; #	MOVWF	_ep_bdt, B
; #	MOVLW	0x84
;	.line	301; src/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
	MOVLW	0x84
; removed redundant BANKSEL
;	.line	302; src/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
	MOVWF	_ep_bdt, B
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00259_DS_
_00258_DS_:
	BANKSEL	_SetupPacket
;	.line	305; src/picUSB.c	else if (SetupPacket.bmRequestType & 0x80)
	BTFSS	_SetupPacket, 7, B
	BRA	_00255_DS_
	BANKSEL	(_wCount + 1)
;	.line	308; src/picUSB.c	if(SetupPacket.wLength < wCount)
	MOVF	(_wCount + 1), W, B
	BANKSEL	(_SetupPacket + 7)
	SUBWF	(_SetupPacket + 7), W, B
	BNZ	_00275_DS_
	BANKSEL	_wCount
	MOVF	_wCount, W, B
	BANKSEL	(_SetupPacket + 6)
	SUBWF	(_SetupPacket + 6), W, B
_00275_DS_:
	BC	_00253_DS_
;	.line	309; src/picUSB.c	wCount = SetupPacket.wLength;
	MOVFF	(_SetupPacket + 6), _wCount
	MOVFF	(_SetupPacket + 7), (_wCount + 1)
_00253_DS_:
;	.line	311; src/picUSB.c	InDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_InDataStage
	MOVF	POSTINC1, F
;	.line	312; src/picUSB.c	ctrlTransferStage = DATA_IN_STAGE;
	MOVLW	0x02
	BANKSEL	_ctrlTransferStage
	MOVWF	_ctrlTransferStage, B
;	.line	314; src/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	315; src/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	316; src/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN;
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
;	.line	319; src/picUSB.c	EP_IN_BD(0).ADDR = PTR16(&controlTransferBuffer);
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 6), B
	MOVLW	HIGH(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 7), B
;	.line	321; src/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00259_DS_
_00255_DS_:
;	.line	327; src/picUSB.c	ctrlTransferStage = DATA_OUT_STAGE;
	MOVLW	0x01
	BANKSEL	_ctrlTransferStage
	MOVWF	_ctrlTransferStage, B
	BANKSEL	(_ep_bdt + 5)
;	.line	330; src/picUSB.c	EP_IN_BD(0).Cnt = 0;
	CLRF	(_ep_bdt + 5), B
;	.line	331; src/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
;	.line	334; src/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 1), B
;	.line	335; src/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&controlTransferBuffer);
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	337; src/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
_00259_DS_:
;	.line	341; src/picUSB.c	UCONbits.PKTDIS = 0;
	BCF	_UCONbits, 4
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_picUSB__OutDataStage	code
_OutDataStage:
;	.line	257; src/picUSB.c	void OutDataStage(unsigned char ep)
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
;	.line	261; src/picUSB.c	bufferSize = ((0x03 & EP_OUT_BD(ep).Stat.uc) << 8) | EP_OUT_BD(ep).Cnt;
	RLNCF	r0x00, W
	ANDLW	0xfe
; #	MOVWF	r0x01
; #;;multiply lit val:0x04 by variable r0x01 and store in r0x00
; #	MOVF	r0x01, W
	MULLW	0x04
	MOVF	PRODH, W
	MOVWF	r0x02
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x01
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, W
	MOVWF	r0x03
	MOVFF	r0x01, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x01
	MOVLW	0x03
	ANDWF	r0x01, F
	MOVF	r0x01, W
	MOVWF	r0x05
	CLRF	r0x04
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, F
	INFSNZ	r0x00, F
	INCF	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
	CLRF	r0x01
	MOVF	r0x04, W
	IORWF	r0x00, F
	MOVF	r0x05, W
	IORWF	r0x01, F
;	.line	264; src/picUSB.c	wCount = wCount + bufferSize;
	MOVF	r0x00, W
	BANKSEL	_wCount
	ADDWF	_wCount, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_wCount + 1), F, B
;	.line	266; src/picUSB.c	outPtr = (byte*)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	268; src/picUSB.c	for (i=0;i<bufferSize;i++)
	CLRF	r0x02
	CLRF	r0x03
_00230_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00245_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00245_DS_:
	BC	_00234_DS_
;	.line	269; src/picUSB.c	*inPtr++ = *outPtr++;
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
	BNC	_00246_DS_
; removed redundant BANKSEL
	INCFSZ	(_outPtr + 1), F, B
	BRA	_10405_DS_
; removed redundant BANKSEL
	INCF	(_outPtr + 2), F, B
_10405_DS_:
_00246_DS_:
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
	BANKSEL	_inPtr
	INCF	_inPtr, F, B
	BNC	_00247_DS_
; removed redundant BANKSEL
	INCFSZ	(_inPtr + 1), F, B
	BRA	_20406_DS_
; removed redundant BANKSEL
	INCF	(_inPtr + 2), F, B
_20406_DS_:
_00247_DS_:
;	.line	268; src/picUSB.c	for (i=0;i<bufferSize;i++)
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00230_DS_
_00234_DS_:
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
;	.line	223; src/picUSB.c	void InDataStage(unsigned char ep)
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
;	.line	229; src/picUSB.c	if(wCount < EP0_BUFFER_SIZE)
	MOVLW	0x00
	BANKSEL	(_wCount + 1)
	SUBWF	(_wCount + 1), W, B
	BNZ	_00217_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	_wCount, W, B
_00217_DS_:
	BC	_00199_DS_
;	.line	230; src/picUSB.c	bufferSize = wCount;
	MOVFF	_wCount, r0x01
	MOVFF	(_wCount + 1), r0x02
	BRA	_00200_DS_
_00199_DS_:
;	.line	232; src/picUSB.c	bufferSize = EP0_BUFFER_SIZE;
	MOVLW	0x40
	MOVWF	r0x01
	CLRF	r0x02
_00200_DS_:
;	.line	236; src/picUSB.c	EP_IN_BD(ep).Stat.uc &= ~(BDS_BC8 | BDS_BC9);
	RLNCF	r0x00, W
	ANDLW	0xfe
	MOVWF	r0x03
	INCF	r0x03, W
; #	MOVWF	r0x00
; #;;multiply lit val:0x04 by variable r0x00 and store in r0x00
; #	MOVF	r0x00, W
	MULLW	0x04
	MOVF	PRODH, W
	MOVWF	r0x03
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x06
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, W
	MOVWF	r0x07
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	INDF0, r0x06
	MOVLW	0xfc
	ANDWF	r0x06, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	r0x06, INDF0
;	.line	237; src/picUSB.c	EP_IN_BD(ep).Stat.uc |= (byte)((bufferSize & 0x0300) >> 8);
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x06
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, W
	MOVWF	r0x07
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	INDF0, r0x06
	MOVLW	0x03
	ANDWF	r0x02, W
; #	MOVWF	r0x08
; #	MOVF	r0x08, W
	IORWF	r0x06, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	r0x06, INDF0
;	.line	238; src/picUSB.c	EP_IN_BD(ep).Cnt = (byte)(bufferSize & 0xFF);
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, W
	MOVWF	r0x05
	INFSNZ	r0x04, F
	INCF	r0x05, F
	MOVF	r0x01, W
	MOVWF	r0x06
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	r0x06, INDF0
;	.line	239; src/picUSB.c	EP_IN_BD(ep).ADDR = PTR16(&controlTransferBuffer);
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
;	.line	244; src/picUSB.c	wCount = wCount - bufferSize;
	MOVF	r0x01, W
	BANKSEL	_wCount
	SUBWF	_wCount, F, B
	MOVF	r0x02, W
; removed redundant BANKSEL
	SUBWFB	(_wCount + 1), F, B
;	.line	247; src/picUSB.c	inPtr = (byte *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_inPtr + 1)
	MOVWF	(_inPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_inPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_inPtr + 2), B
;	.line	249; src/picUSB.c	for (i=0;i<bufferSize;i++)
	CLRF	r0x00
_00201_DS_:
	MOVFF	r0x00, r0x03
	CLRF	r0x04
	MOVF	r0x02, W
	SUBWF	r0x04, W
	BNZ	_00223_DS_
	MOVF	r0x01, W
	SUBWF	r0x03, W
_00223_DS_:
	BC	_00205_DS_
;	.line	250; src/picUSB.c	*inPtr++ = *outPtr++;
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
	BNC	_00224_DS_
; removed redundant BANKSEL
	INCFSZ	(_outPtr + 1), F, B
	BRA	_30407_DS_
; removed redundant BANKSEL
	INCF	(_outPtr + 2), F, B
_30407_DS_:
_00224_DS_:
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	BANKSEL	_inPtr
	INCF	_inPtr, F, B
	BNC	_00225_DS_
; removed redundant BANKSEL
	INCFSZ	(_inPtr + 1), F, B
	BRA	_40408_DS_
; removed redundant BANKSEL
	INCF	(_inPtr + 2), F, B
_40408_DS_:
_00225_DS_:
;	.line	249; src/picUSB.c	for (i=0;i<bufferSize;i++)
	INCF	r0x00, F
	BRA	_00201_DS_
_00205_DS_:
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
	BANKSEL	_SetupPacket
;	.line	132; src/picUSB.c	if((SetupPacket.bmRequestType & 0x60) != 0x00)
	MOVF	_SetupPacket, W, B
; #	ANDLW	0x60
; #	BTFSC	STATUS, 2
; #	GOTO	_00134_DS_
; #	GOTO	_00155_DS_
; #	MOVF	(_SetupPacket + 1), W, B
;	.line	135; src/picUSB.c	return;
	ANDLW	0x60
;	.line	137; src/picUSB.c	if (SetupPacket.bRequest == SET_ADDRESS)
	BTFSS	STATUS, 2
	BRA	_00155_DS_
; removed redundant BANKSEL
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x05
	BNZ	_00153_DS_
;	.line	143; src/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	144; src/picUSB.c	deviceState = ADDRESS;
	MOVLW	0x04
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
;	.line	145; src/picUSB.c	deviceAddress = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _deviceAddress
	BRA	_00155_DS_
_00153_DS_:
	BANKSEL	(_SetupPacket + 1)
;	.line	148; src/picUSB.c	else if (SetupPacket.bRequest == GET_DESCRIPTOR)
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x06
	BNZ	_00150_DS_
;	.line	150; src/picUSB.c	GetDescriptor();
	CALL	_GetDescriptor
	BRA	_00155_DS_
_00150_DS_:
	BANKSEL	(_SetupPacket + 1)
;	.line	153; src/picUSB.c	else if (SetupPacket.bRequest == SET_CONFIGURATION)
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x09
	BNZ	_00147_DS_
;	.line	155; src/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	156; src/picUSB.c	usb_configure_endpoints();
	CALL	_usb_configure_endpoints
;	.line	157; src/picUSB.c	currentConfiguration = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _currentConfiguration
	BANKSEL	_currentConfiguration
;	.line	160; src/picUSB.c	if (currentConfiguration == 0)
	MOVF	_currentConfiguration, W, B
	BNZ	_00136_DS_
;	.line	163; src/picUSB.c	deviceState = ADDRESS;
	MOVLW	0x04
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	BRA	_00155_DS_
_00136_DS_:
;	.line	166; src/picUSB.c	deviceState = CONFIGURED;
	MOVLW	0x05
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	BRA	_00155_DS_
_00147_DS_:
	BANKSEL	(_SetupPacket + 1)
;	.line	173; src/picUSB.c	else if (SetupPacket.bRequest == GET_CONFIGURATION)
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x08
	BNZ	_00144_DS_
;	.line	175; src/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	176; src/picUSB.c	outPtr = (byte*)&currentConfiguration;
	MOVLW	HIGH(_currentConfiguration)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_currentConfiguration)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	177; src/picUSB.c	wCount = 1;
	MOVLW	0x01
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00155_DS_
_00144_DS_:
	BANKSEL	(_SetupPacket + 1)
;	.line	192; src/picUSB.c	else if (SetupPacket.bRequest == GET_INTERFACE)
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x0a
	BNZ	_00141_DS_
;	.line	196; src/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BANKSEL	_controlTransferBuffer
;	.line	197; src/picUSB.c	controlTransferBuffer[0] = 0;
	CLRF	_controlTransferBuffer, B
;	.line	198; src/picUSB.c	outPtr = (byte *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	199; src/picUSB.c	wCount = 1;
	MOVLW	0x01
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00155_DS_
_00141_DS_:
	BANKSEL	(_SetupPacket + 1)
;	.line	202; src/picUSB.c	else if (SetupPacket.bRequest == SET_INTERFACE)
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x0b
	BNZ	_00155_DS_
;	.line	205; src/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
_00155_DS_:
	RETURN	

; ; Starting pCode block
S_picUSB__GetDescriptor	code
_GetDescriptor:
	BANKSEL	_SetupPacket
;	.line	88; src/picUSB.c	if(SetupPacket.bmRequestType == 0x80)
	MOVF	_SetupPacket, W, B
	XORLW	0x80
	BNZ	_00112_DS_
_00124_DS_:
	BANKSEL	(_SetupPacket + 3)
;	.line	93; src/picUSB.c	if (SetupPacket.wValue1 == DEVICE_DESCRIPTOR)
	MOVF	(_SetupPacket + 3), W, B
	XORLW	0x01
	BNZ	_00108_DS_
;	.line	95; src/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	96; src/picUSB.c	outPtr = (byte *)&device_descriptor;
	MOVLW	UPPER(_device_descriptor)
	BANKSEL	(_outPtr + 2)
	MOVWF	(_outPtr + 2), B
	MOVLW	HIGH(_device_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_device_descriptor)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
;	.line	97; src/picUSB.c	wCount = sizeof(USB_Device_Descriptor);
	MOVLW	0x12
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00112_DS_
_00108_DS_:
	BANKSEL	(_SetupPacket + 3)
;	.line	100; src/picUSB.c	else if (SetupPacket.wValue1 == CONFIGURATION_DESCRIPTOR)
	MOVF	(_SetupPacket + 3), W, B
	XORLW	0x02
	BNZ	_00112_DS_
;	.line	102; src/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	103; src/picUSB.c	outPtr = (byte *)&configuration_descriptor;
	MOVLW	UPPER(_configuration_descriptor)
	BANKSEL	(_outPtr + 2)
	MOVWF	(_outPtr + 2), B
	MOVLW	HIGH(_configuration_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_configuration_descriptor)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
;	.line	104; src/picUSB.c	wCount = configuration_descriptor.Header.wTotalLength;
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
	RETURN	



; Statistics:
; code size:	 1646 (0x066e) bytes ( 1.26%)
;           	  823 (0x0337) words
; udata size:	  334 (0x014e) bytes (18.64%)
; access size:	   10 (0x000a) bytes


	end
