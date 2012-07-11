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
	global	_stack
	global	_stack_end
	global	_start_write
	global	_set_boot_address
	global	_disable_boot
	global	_usb_configure_endpoints
	global	_usb_ep_data_out_callback
	global	_main
	global	_high_priority_isr
	global	_low_priority_isr
	global	_device_descriptor
	global	_configuration_descriptor

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern	_deviceState
	extern	_selfPowered
	extern	_currentConfiguration
	extern	_ep_bdt
	extern	_SetupPacket
	extern	_controlTransferBuffer
	extern	_bootCmd
	extern	_outPtr
	extern	_inPtr
	extern	_wCount
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


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1


ustat_main_00	udata	0X0200
_stack         	res	254
_stack_end     	res	1

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__high_priority_isr	code	0X000008
_high_priority_isr:
	goto 0x0C00 + 0x08
	
; ; Starting pCode block
S_main__low_priority_isr	code	0X000018
_low_priority_isr:
	goto 0x0C00 + 0x18
	
; I code from now on!
; ; Starting pCode block
S_main__main	code
_main:
;	.line	329; main.c	EP_IN_BD(1).ADDR = PTR16(&bootCmd);
	MOVLW	LOW(_bootCmd)
	MOVWF	r0x00
	MOVLW	HIGH(_bootCmd)
	MOVWF	r0x01
	MOVF	r0x00, W
	BANKSEL	(_ep_bdt + 14)
	MOVWF	(_ep_bdt + 14), B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 15), B
	BANKSEL	_currentConfiguration
;	.line	330; main.c	currentConfiguration = 0x00;
	CLRF	_currentConfiguration, B
	bsf _OSCTUNEbits, 6 ; Enable the PLL (PLLEN=bit6)
	; Wait 2+ms until the PLL locks before enabling USB module
	; Clock frequency = 48 MHz
	; Delay > 0.002 seconds > 24000 cycles
	movlw 0xFF
	movwf r0x00
	movlw 0xFF
	movwf r0x01
startup_loop:
	decfsz r0x00, f
	bra startup_loop
	decfsz r0x01, f
	bra startup_loop
	movlw 0x0F
	movwf _ANCON0 ; Default all pins to digital
	movwf _ANCON1 ; Default all pins to digital
	bcf _TRISC, 2 ; led output
	bsf _LATC, 2 ; led on
	movlw b'00110001' ; prescaler 8 (0b11)
	movwf _T1CON ; timer 1 on,
	bsf _INTCON, 6 ; Enable Peripheral interrupt (PEIE=bit6)
	bsf _INTCON, 7 ; Enable General interrupt (GIE=bit7)
	movlw 0x00 ; EECON1=0
	movwf _EECON1 ;
	movlw b'00010100' ; (0x14) Enable pullup resistors and full speed mode
	banksel _UCFG
	movwf _UCFG, b
	
	BANKSEL	_deviceState
;	.line	387; main.c	deviceState = DETACHED;
	CLRF	_deviceState, B
_00205_DS_:
	BANKSEL	_deviceState
;	.line	388; main.c	while(deviceState != CONFIGURED)
	MOVF	_deviceState, W, B
	XORLW	0x05
	BZ	_00222_DS_
;	.line	390; main.c	EnableUSBModule();
	CALL	_EnableUSBModule
;	.line	391; main.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
	BRA	_00205_DS_
_00222_DS_:
;	.line	394; main.c	while(1)
	CLRF	r0x00
	CLRF	r0x01
	CLRF	r0x02
_00215_DS_:
;	.line	396; main.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
;	.line	399; main.c	if (led_counter == 0)
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00209_DS_
	movlw 1 << 2 ; toggle
	xorwf _LATC, f ; the led
	
_00209_DS_:
;	.line	406; main.c	led_counter++;
	INFSNZ	r0x00, F
	INCF	r0x01, F
;	.line	409; main.c	if (PIR1bits.TMR1IF == 1)
	CLRF	r0x03
	BTFSC	_PIR1bits, 0
	INCF	r0x03, F
	MOVF	r0x03, W
	XORLW	0x01
	BNZ	_00215_DS_
;	.line	411; main.c	t1_count++;
	INCF	r0x02, F
;	.line	412; main.c	PIR1bits.TMR1IF = 0;
	BCF	_PIR1bits, 0
;	.line	415; main.c	if (t1_count > BOOT_TIMER_TICS)
	MOVLW	0xe6
	SUBWF	r0x02, W
	BNC	_00215_DS_
;	.line	417; main.c	disable_boot();
	CALL	_disable_boot
	goto 0x0C00 ; start user app
	
	BRA	_00215_DS_
	RETURN	

; ; Starting pCode block
S_main__usb_ep_data_out_callback	code
_usb_ep_data_out_callback:
;	.line	155; main.c	void usb_ep_data_out_callback(char end_point)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	159; main.c	EP_IN_BD(end_point).Cnt = 0x00;
	RLNCF	r0x00, W
	ANDLW	0xfe
	MOVWF	r0x01
	INCF	r0x01, W
; #	MOVWF	r0x00
; #;;multiply lit val:0x04 by variable r0x00 and store in r0x00
; #	MOVF	r0x00, W
	MOVWF	r0x00
	MULLW	0x04
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	BTFSC	r0x00, 7
	SETF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, F
	INFSNZ	r0x02, F
	INCF	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
;	.line	160; main.c	set_boot_address();
	CALL	_set_boot_address
	bsf _LATC, 2 ; led on
	
	BANKSEL	_bootCmd
;	.line	167; main.c	if (bootCmd.cmd == READ_VERSION)
	MOVF	_bootCmd, W, B
	BNZ	_00140_DS_
;	.line	169; main.c	bootCmd.buffer[2] = MINOR_VERSION;
	MOVLW	0x03
; removed redundant BANKSEL
	MOVWF	(_bootCmd + 2), B
;	.line	170; main.c	bootCmd.buffer[3] = MAJOR_VERSION;
	MOVLW	0x04
; removed redundant BANKSEL
	MOVWF	(_bootCmd + 3), B
;	.line	171; main.c	EP_IN_BD(end_point).Cnt = 4;
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	BTFSC	r0x00, 7
	SETF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, F
	INFSNZ	r0x02, F
	INCF	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x04
	MOVWF	INDF0
;	.line	172; main.c	T1CON = 0b00000000; // disable timer 1
	CLRF	_T1CON
	BRA	_00141_DS_
_00140_DS_:
	BANKSEL	_bootCmd
;	.line	175; main.c	else if (bootCmd.cmd == READ_FLASH)
	MOVF	_bootCmd, W, B
	XORLW	0x01
	BNZ	_00137_DS_
;	.line	179; main.c	for (counter=0; counter < bootCmd.len; counter++)
	CLRF	r0x02
_00147_DS_:
	BANKSEL	(_bootCmd + 1)
	MOVF	(_bootCmd + 1), W, B
	SUBWF	r0x02, W
	BC	_00150_DS_
	TBLRD*+
	
;	.line	184; main.c	bootCmd.xdat[counter] = TABLAT;
	MOVLW	LOW(_bootCmd + 5)
	ADDWF	r0x02, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_bootCmd + 5)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	_TABLAT, INDF0
;	.line	179; main.c	for (counter=0; counter < bootCmd.len; counter++)
	INCF	r0x02, F
	BRA	_00147_DS_
_00150_DS_:
;	.line	187; main.c	EP_IN_BD(end_point).Cnt = 5 + bootCmd.len;
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	BTFSC	r0x00, 7
	SETF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, F
	INFSNZ	r0x02, F
	INCF	r0x03, F
	MOVLW	0x05
	BANKSEL	(_bootCmd + 1)
	ADDWF	(_bootCmd + 1), W, B
	MOVWF	r0x04
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
	BRA	_00141_DS_
_00137_DS_:
	BANKSEL	_bootCmd
;	.line	224; main.c	else if (bootCmd.cmd == WRITE_FLASH)
	MOVF	_bootCmd, W, B
	XORLW	0x02
	BZ	_00194_DS_
	BRA	_00134_DS_
_00194_DS_:
;	.line	230; main.c	EECON1bits.WPROG = 1; // Enable single-word write
	BSF	_EECON1bits, 5
;	.line	231; main.c	for (counter=0; counter < bootCmd.len; counter+=2)
	CLRF	r0x02
_00151_DS_:
	BANKSEL	(_bootCmd + 1)
	MOVF	(_bootCmd + 1), W, B
	SUBWF	r0x02, W
	BC	_00154_DS_
;	.line	233; main.c	TBLPTRL =  bootCmd.addrl + counter;
	MOVF	r0x02, W
; removed redundant BANKSEL
	ADDWF	(_bootCmd + 2), W, B
	MOVWF	_TBLPTRL
;	.line	234; main.c	TABLAT = bootCmd.xdat[counter];
	MOVLW	LOW(_bootCmd + 5)
	ADDWF	r0x02, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_bootCmd + 5)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, _TABLAT
	TBLWT*+ ; TBLPTR is incremented after the write
	
;	.line	238; main.c	TABLAT = bootCmd.xdat[counter + 1];
	INCF	r0x02, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	LOW(_bootCmd + 5)
	ADDWF	r0x03, F
	MOVLW	HIGH(_bootCmd + 5)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, _TABLAT
	TBLWT* ; TBLPTR is not incremented after the write
	
;	.line	242; main.c	start_write();
	CALL	_start_write
;	.line	231; main.c	for (counter=0; counter < bootCmd.len; counter+=2)
	INCF	r0x02, F
	INCF	r0x02, F
	BRA	_00151_DS_
_00154_DS_:
;	.line	244; main.c	EECON1bits.WPROG = 0;	// Disable single-word write
	BCF	_EECON1bits, 5
;	.line	245; main.c	EP_IN_BD(end_point).Cnt = 1;
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	BTFSC	r0x00, 7
	SETF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, F
	INFSNZ	r0x02, F
	INCF	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
	BRA	_00141_DS_
_00134_DS_:
	BANKSEL	_bootCmd
;	.line	277; main.c	else if (bootCmd.cmd ==  ERASE_FLASH)
	MOVF	_bootCmd, W, B
	XORLW	0x03
	BNZ	_00131_DS_
;	.line	282; main.c	for (counter=0; counter < bootCmd.len; counter++)
	CLRF	r0x02
_00155_DS_:
	BANKSEL	(_bootCmd + 1)
	MOVF	(_bootCmd + 1), W, B
	SUBWF	r0x02, W
	BC	_00158_DS_
;	.line	284; main.c	EECON1bits.FREE = 1;    // allow a program memory erase operation
	BSF	_EECON1bits, 4
;	.line	285; main.c	start_write();
	CALL	_start_write
;	.line	286; main.c	EECON1bits.FREE = 0;    // inhibit program memory erase operation
	BCF	_EECON1bits, 4
	movlw 0x04 ; 0x04 + (TBLPTRH) -> TBLPTRH
	addwf _TBLPTRH, 1 ; (W) + (TBLPTRH) -> TBLPTRH
	; (C) is affected
	movlw 0x00 ; 0x00 + (TBLPTRU) + (C) -> TBLPTRU
	addwfc _TBLPTRU, 1 ; (W) + (TBLPTRU) + (C) -> TBLPTRU
	
;	.line	282; main.c	for (counter=0; counter < bootCmd.len; counter++)
	INCF	r0x02, F
	BRA	_00155_DS_
_00158_DS_:
;	.line	298; main.c	EP_IN_BD(end_point).Cnt = 1;
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	BTFSC	r0x00, 7
	SETF	r0x03
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x03, F
	INFSNZ	r0x02, F
	INCF	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
	BRA	_00141_DS_
_00131_DS_:
	BANKSEL	_bootCmd
;	.line	302; main.c	else if (bootCmd.cmd ==  RESET)
	MOVF	_bootCmd, W, B
	XORLW	0xff
	BNZ	_00141_DS_
;	.line	304; main.c	disable_boot();
	CALL	_disable_boot
	goto 0x0C00 ; start user app
	
_00141_DS_:
;	.line	310; main.c	if (EP_IN_BD(end_point).Cnt > 0)
	CLRF	r0x02
	BTFSC	r0x00, 7
	SETF	r0x02
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
;	.line	312; main.c	if (EP_IN_BD(1).Stat.DTS)
	BTFSS	(_ep_bdt + 12), 6, B
	BRA	_00143_DS_
;	.line	313; main.c	EP_IN_BD(1).Stat.uc = 0b10001000;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 12), B
	BRA	_00146_DS_
_00143_DS_:
;	.line	315; main.c	EP_IN_BD(1).Stat.uc = 0b11001000;
	MOVLW	0xc8
	BANKSEL	(_ep_bdt + 12)
	MOVWF	(_ep_bdt + 12), B
; ;multiply lit val:0x04 by variable r0x01 and store in r0x01
_00146_DS_:
;	.line	319; main.c	EP_OUT_BD(end_point).Cnt = EP1_BUFFER_SIZE;
	MOVF	r0x01, W
	MULLW	0x04
	MOVFF	PRODL, r0x01
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x01, W
	MOVWF	r0x00
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, F
	INFSNZ	r0x00, F
	INCF	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x40
	MOVWF	INDF0
;	.line	321; main.c	EP_OUT_BD(end_point).Stat.uc = 0x80;
	CLRF	r0x00
	BTFSC	r0x01, 7
	SETF	r0x00
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x01, F
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x00, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x00, FSR0H
	MOVLW	0x80
	MOVWF	INDF0
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
	BANKSEL	_UEP1bits
;	.line	138; main.c	UEP1bits.EPHSHK   = 1;		// EP handshaking on
	BSF	_UEP1bits, 4, B
;	.line	139; main.c	UEP1bits.EPOUTEN  = 1;		// EP OUT enabled
	BSF	_UEP1bits, 2, B
;	.line	140; main.c	UEP1bits.EPINEN   = 1;		// EP IN enabled
	BSF	_UEP1bits, 1, B
;	.line	141; main.c	UEP1bits.EPCONDIS = 1;		// control transfers off
	BSF	_UEP1bits, 3, B
; #	MOVLW	0x40
; #	MOVWF	(_ep_bdt + 12), B
; #	MOVLW	0x40
;	.line	145; main.c	EP_IN_BD(1).Stat.uc  = 0b01000000;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 12)
;	.line	148; main.c	EP_OUT_BD(1).Cnt  = EP1_BUFFER_SIZE;
	MOVWF	(_ep_bdt + 12), B
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 9), B
;	.line	149; main.c	EP_OUT_BD(1).ADDR = PTR16(&bootCmd);
	MOVLW	LOW(_bootCmd)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 10), B
	MOVLW	HIGH(_bootCmd)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 11), B
;	.line	151; main.c	EP_OUT_BD(1).Stat.uc = 0b10000000;
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 8), B
	RETURN	

; ; Starting pCode block
S_main__disable_boot	code
_disable_boot:
;	.line	121; main.c	void disable_boot()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	clrf _T1CON ; disable timer 1
	clrf _UCON ; disable USB
	bsf _TRISC, 2 ; led input
	bcf _LATC, 2 ; led off
	
;	.line	133; main.c	while (big_counter != 0) big_counter--;
	MOVLW	0xff
	MOVWF	r0x00
	MOVWF	r0x01
_00115_DS_:
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00118_DS_
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	BRA	_00115_DS_
_00118_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__set_boot_address	code
_set_boot_address:
;	.line	116; main.c	TBLPTRU = bootCmd.addru;
	MOVFF	(_bootCmd + 4), _TBLPTRU
;	.line	117; main.c	TBLPTRH = bootCmd.addrh;
	MOVFF	(_bootCmd + 3), _TBLPTRH
;	.line	118; main.c	TBLPTRL = bootCmd.addrl;
	MOVFF	(_bootCmd + 2), _TBLPTRL
	RETURN	

; ; Starting pCode block
S_main__start_write	code
_start_write:
	bsf _EECON1, 2 ; EECON1bits.WREN = 1; allows write cycles to Flash program memory
	bcf _INTCON, 7 ; INTCONbits.GIE = 0 ; disable interrupts (activated in startup sequence)
	movlw 0x55
	movwf _EECON2 ; EECON2 = 0x55;
	movlw 0xAA
	movwf _EECON2 ; EECON2 = 0xAA;
	bsf _EECON1, 1 ; EECON1bits.WR = 1; start flash/eeprom writing
	bcf _EECON1, 2 ; EECON1bits.WREN = 0; inhibits write cycles to Flash program memory
	bsf _INTCON, 7 ; INTCONbits.GIE = 1 ; re-enable interrupts
	
	RETURN	

; ; Starting pCode block
	CONFIG	WPDIS=OFF
; ; Starting pCode block
	CONFIG	WPFP=PAGE_1
; ; Starting pCode block
	CONFIG	WPEND=PAGE_0
; ; Starting pCode block
	CONFIG	WPCFG=OFF
; ; Starting pCode block
	CONFIG	IOL1WAY=OFF
; ; Starting pCode block
	CONFIG	MSSP7B_EN=MSK7
; ; Starting pCode block
	CONFIG	DSWDTOSC=INTOSCREF
; ; Starting pCode block
	CONFIG	RTCOSC=T1OSCREF
; ; Starting pCode block
	CONFIG	DSBOREN=OFF
; ; Starting pCode block
	CONFIG	DSWDTEN=OFF
; ; Starting pCode block
	CONFIG	DSWDTPS=8192
; ; Starting pCode block
	CONFIG	WDTPS=32768
; ; Starting pCode block
	CONFIG	T1DIG=ON
; ; Starting pCode block
	CONFIG	LPT1OSC=OFF
; ; Starting pCode block
	CONFIG	FCMEN=OFF
; ; Starting pCode block
	CONFIG	IESO=OFF
; ; Starting pCode block
	CONFIG	CP0=OFF
; ; Starting pCode block
	CONFIG	XINST=OFF
; ; Starting pCode block
	CONFIG	STVREN=ON
; ; Starting pCode block
	CONFIG	WDTEN=OFF
; ; Starting pCode block
	CONFIG	OSC=HSPLL
; ; Starting pCode block
	CONFIG	CPUDIV=OSC1
; ; Starting pCode block
	CONFIG	PLLDIV=2
; ; Starting pCode block for Ival
	code
_device_descriptor:
	DB	0x12, 0x01, 0x00, 0x02, 0x02, 0x00, 0x00, 0x40, 0xd8, 0x04, 0xaa, 0xfe
	DB	0x01, 0x00, 0x00, 0x00, 0x00, 0x01
; ; Starting pCode block for Ival
_configuration_descriptor:
	DB	0x09, 0x02, 0x20, 0x00, 0x01, 0x01, 0x00, 0x03, 0x14, 0x09, 0x04, 0x00
	DB	0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x07, 0x05, 0x01, 0x02, 0x40, 0x00
	DB	0x00, 0x07, 0x05, 0x81, 0x02, 0x40, 0x00, 0x00


; Statistics:
; code size:	  942 (0x03ae) bytes ( 0.72%)
;           	  471 (0x01d7) words
; udata size:	  255 (0x00ff) bytes ( 7.24%)
; access size:	    5 (0x0005) bytes


	end
