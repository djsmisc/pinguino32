;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8163 (Oct 23 2012) (Linux)
; This file was generated Tue Dec 18 18:50:51 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f25k50
	radix	dec
	CONFIG	PLLSEL=PLL3X
	CONFIG	CFGPLLEN=ON
	CONFIG	CPUDIV=NOCLKDIV
	CONFIG	LS48MHZ=SYS24X4
	CONFIG	FOSC=INTOSCIO
	CONFIG	PCLKEN=ON
	CONFIG	FCMEN=OFF
	CONFIG	IESO=OFF
	CONFIG	nPWRTEN=OFF
	CONFIG	BOREN=SBORDIS
	CONFIG	BORV=190
	CONFIG	nLPBOR=OFF
	CONFIG	WDTEN=SWON
	CONFIG	WDTPS=32768
	CONFIG	CCP2MX=RC1
	CONFIG	PBADEN=OFF
	CONFIG	T3CMX=RC0
	CONFIG	SDOMX=RC7
	CONFIG	MCLRE=ON
	CONFIG	STVREN=ON
	CONFIG	LVP=ON
	CONFIG	XINST=OFF
	CONFIG	CP0=OFF
	CONFIG	CP1=OFF
	CONFIG	CP2=OFF
	CONFIG	CP3=OFF
	CONFIG	CPB=OFF
	CONFIG	CPD=OFF
	CONFIG	WRT0=OFF
	CONFIG	WRT1=OFF
	CONFIG	WRT2=OFF
	CONFIG	WRT3=OFF
	CONFIG	WRTC=OFF
	CONFIG	WRTB=OFF
	CONFIG	WRTD=OFF
	CONFIG	EBTR0=OFF
	CONFIG	EBTR1=OFF
	CONFIG	EBTR2=OFF
	CONFIG	EBTR3=OFF
	CONFIG	EBTRB=OFF


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_delay
	global	_start_write
	global	_disable_boot
	global	_usb_configure_endpoints
	global	_usb_ep_data_out_callback
	global	_main
	global	_device_descriptor
	global	_configuration_descriptor

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern	_SetupPacket
	extern	_controlTransferBuffer
	extern	_bootCmd
	extern	_outPtr
	extern	_inPtr
	extern	_wCount
	extern	_deviceState
	extern	_selfPowered
	extern	_currentConfiguration
	extern	_ep_bdt
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
	extern	_EnableUSBModule
	extern	_ProcessUSBTransactions

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
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

udata_main_0	udata
_delay_i_1_6	res	2

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_main__main	code
_main:
;	.line	386; src/main.c	byte t1_count = 0;
	CLRF	r0x00
	movlw 0x70 ; 0b01110000 : 111 = HFINTOSC (16 MHz)
	movwf _OSCCON ; enable the 16MHz internal clock
wait_hfintosc:
	btfss _OSCCON, 2 ; HFIOFS: HFINTOSC Frequency Stable bit
	bra wait_hfintosc ; wait HFINTOSC frequency is stable (HFIOFS=1)
	clrf _ANSELA ; all I/O to Digital mode
	clrf _ANSELB ; all I/O to Digital mode
	clrf _ANSELC ; all I/O to Digital mode
	bcf _TRISA, 4 ; led output
	bsf _LATA, 4 ; led on
	;bcf _PIR1, 0 ; PIR1bits.TMR1IF = 0;
	movlw b'00110001' ; prescaler 8 (0b11)
	movwf _T1CON ; timer 1 on,
	;bsf _INTCON, 6 ; Enable Peripheral interrupt (PEIE=bit6)
	;bsf _INTCON, 7 ; Enable General interrupt (GIE=bit7)
	clrf _EECON1 ; EECON1=0
	movlw b'00010100' ; (0x14) Enable pullup resistors and full speed mode
	banksel _UCFG
	movwf _UCFG, b
	
;	.line	466; src/main.c	EP_IN_BD(1).ADDR = PTR16(&bootCmd);
	MOVLW	LOW(_bootCmd)
	MOVWF	r0x01
	MOVLW	HIGH(_bootCmd)
	MOVWF	r0x02
	CLRF	r0x03
	CLRF	r0x04
	CLRF	r0x03
	CLRF	r0x04
	MOVF	r0x01, W
	BANKSEL	(_ep_bdt + 14)
	MOVWF	(_ep_bdt + 14), B
	MOVF	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 15), B
	BANKSEL	_currentConfiguration
;	.line	467; src/main.c	currentConfiguration = 0x00;
	CLRF	_currentConfiguration, B
	BANKSEL	_deviceState
;	.line	468; src/main.c	deviceState = DETACHED;
	CLRF	_deviceState, B
;	.line	471; src/main.c	do {
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	CLRF	r0x04
_00220_DS_:
;	.line	472; src/main.c	EnableUSBModule();
	CALL	_EnableUSBModule
;	.line	473; src/main.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
;	.line	474; src/main.c	i = i + 1;
	INCF	r0x01, F
	BNC	_00259_DS_
	INCF	r0x02, F
	BNC	_00259_DS_
	INFSNZ	r0x03, F
	INCF	r0x04, F
_00259_DS_:
;	.line	475; src/main.c	if (i == 0xFFFFF) break; 
	MOVF	r0x01, W
	XORLW	0xff
	BNZ	_00261_DS_
	MOVF	r0x02, W
	XORLW	0xff
	BNZ	_00261_DS_
	MOVF	r0x03, W
	XORLW	0x0f
	BNZ	_00261_DS_
	MOVF	r0x04, W
	BZ	_00222_DS_
_00261_DS_:
	BANKSEL	_deviceState
;	.line	476; src/main.c	} while (deviceState != CONFIGURED);
	MOVF	_deviceState, W, B
	XORLW	0x05
	BNZ	_00220_DS_
_00222_DS_:
	BANKSEL	_deviceState
;	.line	479; src/main.c	if (deviceState != CONFIGURED)
	MOVF	_deviceState, W, B
	XORLW	0x05
	BZ	_00240_DS_
;	.line	481; src/main.c	t1_count = BOOT_TIMER_TICS;
	MOVLW	0xe5
	MOVWF	r0x00
	bcf _LATA, 4 ; led on
	
_00240_DS_:
;	.line	487; src/main.c	while (1)
	CLRF	r0x01
	CLRF	r0x02
_00232_DS_:
;	.line	490; src/main.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
;	.line	493; src/main.c	if (led_counter == 0)
	MOVF	r0x01, W
	IORWF	r0x02, W
	BNZ	_00226_DS_
	movlw 1 << 4 ; toggle
	xorwf _LATA, f ; the led
	
_00226_DS_:
;	.line	500; src/main.c	led_counter++;
	INFSNZ	r0x01, F
	INCF	r0x02, F
;	.line	503; src/main.c	if (PIR1bits.TMR1IF == 1)
	CLRF	r0x03
	BTFSC	_PIR1bits, 0
	INCF	r0x03, F
	MOVF	r0x03, W
	XORLW	0x01
	BNZ	_00232_DS_
;	.line	505; src/main.c	t1_count++;
	INCF	r0x00, F
;	.line	506; src/main.c	PIR1bits.TMR1IF = 0;
	BCF	_PIR1bits, 0
;	.line	509; src/main.c	if (t1_count > BOOT_TIMER_TICS)
	MOVLW	0xe6
	SUBWF	r0x00, W
	BNC	_00232_DS_
;	.line	511; src/main.c	disable_boot();
	CALL	_disable_boot
	goto 0x0C00 ; start user app
	
	BRA	_00232_DS_
	RETURN	

; ; Starting pCode block
S_main__usb_ep_data_out_callback	code
_usb_ep_data_out_callback:
;	.line	193; src/main.c	void usb_ep_data_out_callback(char end_point)
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
	bsf _LATA, 4 ; led on
	
;	.line	203; src/main.c	EP_IN_BD(end_point).Cnt = 0;
	RLNCF	r0x00, W
	ANDLW	0xfe
	MOVWF	r0x01
	INCF	r0x01, W
; #	MOVWF	r0x00
; #;;multiply lit val:0x04 by variable r0x00 and store in r0x00
; #	MOVF	r0x00, W
	MOVWF	r0x00
	MULLW	0x04
	MOVF	PRODH, W
	BTFSC	r0x00, 7
	SUBLW	0x04
	MOVWF	r0x02
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, W
	MOVWF	r0x04
	INFSNZ	r0x03, F
	INCF	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
;	.line	206; src/main.c	TBLPTRU = bootCmd.addru;
	MOVFF	(_bootCmd + 4), _TBLPTRU
;	.line	207; src/main.c	TBLPTRH = bootCmd.addrh;
	MOVFF	(_bootCmd + 3), _TBLPTRH
;	.line	208; src/main.c	TBLPTRL = bootCmd.addrl;
	MOVFF	(_bootCmd + 2), _TBLPTRL
	BANKSEL	_bootCmd
;	.line	211; src/main.c	if (bootCmd.cmd ==  RESET)
	MOVF	_bootCmd, W, B
	XORLW	0xff
	BNZ	_00140_DS_
;	.line	214; src/main.c	disable_boot();
	CALL	_disable_boot
	goto 0x0C00 ; start user app
	
	BRA	_00141_DS_
_00140_DS_:
	BANKSEL	_bootCmd
;	.line	220; src/main.c	else if (bootCmd.cmd == READ_VERSION)
	MOVF	_bootCmd, W, B
	BNZ	_00137_DS_
;	.line	223; src/main.c	bootCmd.buffer[2] = MINOR_VERSION;
	MOVLW	0x07
; removed redundant BANKSEL
	MOVWF	(_bootCmd + 2), B
;	.line	224; src/main.c	bootCmd.buffer[3] = MAJOR_VERSION;
	MOVLW	0x04
; removed redundant BANKSEL
	MOVWF	(_bootCmd + 3), B
;	.line	226; src/main.c	EP_IN_BD(end_point).Cnt = 4;
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, W
	MOVWF	r0x04
	INFSNZ	r0x03, F
	INCF	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x04
	MOVWF	INDF0
	BRA	_00141_DS_
_00137_DS_:
	BANKSEL	_bootCmd
;	.line	231; src/main.c	else if (bootCmd.cmd == READ_FLASH)
	MOVF	_bootCmd, W, B
	XORLW	0x01
	BNZ	_00134_DS_
;	.line	234; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	CLRF	r0x03
_00147_DS_:
	BANKSEL	(_bootCmd + 1)
	MOVF	(_bootCmd + 1), W, B
	SUBWF	r0x03, W
	BC	_00150_DS_
	TBLRD*+ 
;	.line	237; src/main.c	bootCmd.xdat[counter] = TABLAT;
	MOVLW	LOW(_bootCmd + 5)
	ADDWF	r0x03, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_bootCmd + 5)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	_TABLAT, INDF0
;	.line	234; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	INCF	r0x03, F
	BRA	_00147_DS_
_00150_DS_:
;	.line	241; src/main.c	EP_IN_BD(end_point).Cnt = 5 + bootCmd.len;
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, W
	MOVWF	r0x04
	INFSNZ	r0x03, F
	INCF	r0x04, F
	MOVLW	0x05
	BANKSEL	(_bootCmd + 1)
	ADDWF	(_bootCmd + 1), W, B
	MOVWF	r0x05
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x05, INDF0
	BRA	_00141_DS_
_00134_DS_:
	BANKSEL	_bootCmd
;	.line	245; src/main.c	else if (bootCmd.cmd == WRITE_FLASH)
	MOVF	_bootCmd, W, B
	XORLW	0x02
	BNZ	_00131_DS_
;	.line	264; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	CLRF	r0x03
_00151_DS_:
	BANKSEL	(_bootCmd + 1)
	MOVF	(_bootCmd + 1), W, B
	SUBWF	r0x03, W
	BC	_00154_DS_
;	.line	266; src/main.c	TABLAT = bootCmd.xdat[counter];     // present data to table latch
	MOVLW	LOW(_bootCmd + 5)
	ADDWF	r0x03, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_bootCmd + 5)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, _TABLAT
	TBLWT*+ 
;	.line	264; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	INCF	r0x03, F
	BRA	_00151_DS_
_00154_DS_:
	TBLRD*- 
;	.line	271; src/main.c	EECON1 = 0b10000100; // allows write (WREN=1) in flash (EEPGD=1)
	MOVLW	0x84
	MOVWF	_EECON1
;	.line	272; src/main.c	start_write();
	CALL	_start_write
;	.line	301; src/main.c	EP_IN_BD(end_point).Cnt = 1;
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, W
	MOVWF	r0x04
	INFSNZ	r0x03, F
	INCF	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
	BRA	_00141_DS_
_00131_DS_:
	BANKSEL	_bootCmd
;	.line	305; src/main.c	else if (bootCmd.cmd ==  ERASE_FLASH)
	MOVF	_bootCmd, W, B
	XORLW	0x03
	BNZ	_00141_DS_
;	.line	317; src/main.c	EECON1 = 0b10010100; // allows erase (WREN=1, FREE=1) in flash (EEPGD=1)
	MOVLW	0x94
	MOVWF	_EECON1
;	.line	318; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	CLRF	r0x03
_00155_DS_:
	BANKSEL	(_bootCmd + 1)
	MOVF	(_bootCmd + 1), W, B
	SUBWF	r0x03, W
	BC	_00158_DS_
;	.line	320; src/main.c	EECON1bits.FREE = 1;    // allow a program memory erase operation
	BSF	_EECON1bits, 4
;	.line	321; src/main.c	start_write();
	CALL	_start_write
;	.line	322; src/main.c	EECON1bits.FREE = 0;    // inhibit program memory erase operation
	BCF	_EECON1bits, 4
	movlw 0x40 ; 0x40 + (TBLPTRL) -> TBLPTRL
	addwf _TBLPTRL, 1 ; (W) + (TBLPTRL) -> TBLPTRL
	; (C) is affected
	movlw 0x00 ; 0x00 + (TBLPTRH) + (C) -> TBLPTRH
	addwfc _TBLPTRH, 1 ; (W) + (TBLPTRH) + (C) -> TBLPTRH
	
;	.line	318; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	INCF	r0x03, F
	BRA	_00155_DS_
_00158_DS_:
;	.line	359; src/main.c	EP_IN_BD(end_point).Cnt = 1;
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, W
	MOVWF	r0x04
	INFSNZ	r0x03, F
	INCF	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
_00141_DS_:
;	.line	364; src/main.c	if (EP_IN_BD(end_point).Cnt > 0)
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, F
	INFSNZ	r0x00, F
	INCF	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
	MOVF	r0x00, W
	BZ	_00146_DS_
	BANKSEL	(_ep_bdt + 12)
;	.line	367; src/main.c	if (EP_IN_BD(1).Stat.DTS)
	BTFSS	(_ep_bdt + 12), 6, B
	BRA	_00143_DS_
;	.line	368; src/main.c	EP_IN_BD(1).Stat.uc = 0b10001000; // UOWN 1 DTS 0 DTSEN 1
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 12), B
	BRA	_00146_DS_
_00143_DS_:
;	.line	370; src/main.c	EP_IN_BD(1).Stat.uc = 0b11001000; // UOWN 1 DTS 1 DTSEN 1
	MOVLW	0xc8
	BANKSEL	(_ep_bdt + 12)
	MOVWF	(_ep_bdt + 12), B
; ;multiply lit val:0x04 by variable r0x01 and store in r0x01
_00146_DS_:
;	.line	374; src/main.c	EP_OUT_BD(end_point).Cnt = EP1_BUFFER_SIZE;
	MOVF	r0x01, W
	MULLW	0x04
	MOVF	PRODH, W
	BTFSC	r0x01, 7
	SUBLW	0x04
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x01, W
	MOVWF	r0x02
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x00, W
	MOVWF	r0x03
	INFSNZ	r0x02, F
	INCF	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x40
	MOVWF	INDF0
;	.line	376; src/main.c	EP_OUT_BD(end_point).Stat.uc = 0x80;      // UOWN 1
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x01, F
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x00, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x00, FSR0H
	MOVLW	0x80
	MOVWF	INDF0
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__usb_configure_endpoints	code
_usb_configure_endpoints:
;	.line	177; src/main.c	UEP1 = 0b00011110;
	MOVLW	0x1e
	MOVWF	_UEP1
; #	MOVLW	0x40
; #	MOVWF	(_ep_bdt + 12), B
; #	MOVLW	0x40
;	.line	181; src/main.c	EP_IN_BD(1).Stat.uc  = 0b01000000;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 12)
;	.line	184; src/main.c	EP_OUT_BD(1).Cnt  = EP1_BUFFER_SIZE;
	MOVWF	(_ep_bdt + 12), B
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 9), B
;	.line	185; src/main.c	EP_OUT_BD(1).ADDR = PTR16(&bootCmd);
	MOVLW	LOW(_bootCmd)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 10), B
	MOVLW	HIGH(_bootCmd)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 11), B
;	.line	187; src/main.c	EP_OUT_BD(1).Stat.uc = 0b10000000;
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 8), B
	RETURN	

; ; Starting pCode block
S_main__disable_boot	code
_disable_boot:
;	.line	156; src/main.c	T1CON = 0x00;
	CLRF	_T1CON
;	.line	157; src/main.c	UCON = 0x00;
	CLRF	_UCON
	;clrf _T1CON ; disable timer 1
	;clrf _UCON ; disable USB
	bsf _TRISA, 4 ; led input
	bcf _LATA, 4 ; led off
	;call _delay ; force timeout on USB
	
;	.line	165; src/main.c	delay();
	CALL	_delay
; ; Starting pCode block
S_main__start_write	code
_start_write:
	;bcf _INTCON, 7 ; INTCONbits.GIE = 0 ; disable interrupts (activated in startup sequence)
	movlw 0x55
	movwf _EECON2 ; EECON2 = 0x55;
	movlw 0xAA
	movwf _EECON2 ; EECON2 = 0xAA;
	bsf _EECON1, 1 ; EECON1bits.WR = 1; start flash/eeprom writing
	; CPU stall here for 2ms
	;bsf _INTCON, 7 ; INTCONbits.GIE = 1 ; re-enable interrupts
	;nop ; proc. can forget to execute the first operation
	
	RETURN	

; ; Starting pCode block
S_main__delay	code
_delay:
;	.line	92; src/main.c	void delay(void) //__naked
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	95; src/main.c	while(i--);
	MOVFF	_delay_i_1_6, r0x00
	MOVFF	(_delay_i_1_6 + 1), r0x01
_00105_DS_:
	MOVFF	r0x00, r0x02
	MOVFF	r0x01, r0x03
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	MOVF	r0x02, W
	IORWF	r0x03, W
	BNZ	_00105_DS_
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block for Ival
	code
_device_descriptor:
	DB	0x12, 0x01, 0x00, 0x02, 0xff, 0x00, 0xff, 0x40, 0xd8, 0x04, 0xaa, 0xfe
	DB	0x07, 0x04, 0x01, 0x02, 0x00, 0x01
; ; Starting pCode block for Ival
_configuration_descriptor:
	DB	0x09, 0x02, 0x20, 0x00, 0x01, 0x01, 0x00, 0xc0, 0x14, 0x09, 0x04, 0x00
	DB	0x00, 0x02, 0xff, 0xff, 0xff, 0x00, 0x07, 0x05, 0x01, 0x02, 0x40, 0x00
	DB	0x00, 0x07, 0x05, 0x81, 0x02, 0x40, 0x00, 0x00


; Statistics:
; code size:	  906 (0x038a) bytes ( 0.69%)
;           	  453 (0x01c5) words
; udata size:	    2 (0x0002) bytes ( 0.11%)
; access size:	    6 (0x0006) bytes


	end
