;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8163 (Oct 23 2012) (Linux)
; This file was generated Sat Dec 15 16:08:57 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f4550
	radix	dec
	CONFIG	PLLDIV=5
	CONFIG	CPUDIV=OSC1_PLL2
	CONFIG	USBDIV=2
	CONFIG	FOSC=HSPLL_HS
	CONFIG	FCMEN=ON
	CONFIG	IESO=OFF
	CONFIG	PWRT=ON
	CONFIG	BOR=OFF
	CONFIG	VREGEN=ON
	CONFIG	WDT=OFF
	CONFIG	MCLRE=ON
	CONFIG	LPT1OSC=OFF
	CONFIG	PBADEN=OFF
	CONFIG	CCP2MX=ON
	CONFIG	STVREN=ON
	CONFIG	LVP=OFF
	CONFIG	XINST=OFF
	CONFIG	DEBUG=OFF
	CONFIG	CP0=OFF
	CONFIG	CP1=OFF
	CONFIG	CP2=OFF
	CONFIG	CPB=OFF
	CONFIG	CPD=OFF
	CONFIG	WRT0=OFF
	CONFIG	WRT1=OFF
	CONFIG	WRT2=OFF
	CONFIG	WRTB=OFF
	CONFIG	WRTC=OFF
	CONFIG	WRTD=OFF
	CONFIG	EBTR0=OFF
	CONFIG	EBTR1=OFF
	CONFIG	EBTR2=OFF
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
	global	_reset_isr
	global	_high_priority_isr
	global	_low_priority_isr
	global	_device_descriptor
	global	_configuration_descriptor
	global	_lang
	global	_manu
	global	_prod
	global	_string_descriptor

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__reset_isr	code	0X000000
_reset_isr:
	goto _main
	;goto _startup
	
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
;	.line	368; src/main.c	byte t1_count = 0;
	CLRF	r0x00
	; movlw 0x0F
	; movwf _ADCON1 ; all I/O to Digital mode
	; movlw 0x07
	; movwf _CMCON ; all I/O to Digital mode
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
	
;	.line	445; src/main.c	EP_IN_BD(1).ADDR = PTR16(&bootCmd);
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
;	.line	446; src/main.c	currentConfiguration = 0x00;
	CLRF	_currentConfiguration, B
	BANKSEL	_deviceState
;	.line	447; src/main.c	deviceState = DETACHED;
	CLRF	_deviceState, B
;	.line	450; src/main.c	do {
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	CLRF	r0x04
_00217_DS_:
;	.line	451; src/main.c	EnableUSBModule();
	CALL	_EnableUSBModule
;	.line	452; src/main.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
;	.line	453; src/main.c	i = i + 1;
	INCF	r0x01, F
	BNC	_00256_DS_
	INCF	r0x02, F
	BNC	_00256_DS_
	INFSNZ	r0x03, F
	INCF	r0x04, F
_00256_DS_:
;	.line	454; src/main.c	if (i == 0xFFFFF) break; 
	MOVF	r0x01, W
	XORLW	0xff
	BNZ	_00258_DS_
	MOVF	r0x02, W
	XORLW	0xff
	BNZ	_00258_DS_
	MOVF	r0x03, W
	XORLW	0x0f
	BNZ	_00258_DS_
	MOVF	r0x04, W
	BZ	_00219_DS_
_00258_DS_:
	BANKSEL	_deviceState
;	.line	455; src/main.c	} while (deviceState != CONFIGURED);
	MOVF	_deviceState, W, B
	XORLW	0x05
	BNZ	_00217_DS_
_00219_DS_:
	BANKSEL	_deviceState
;	.line	458; src/main.c	if (deviceState != CONFIGURED)
	MOVF	_deviceState, W, B
	XORLW	0x05
	BZ	_00237_DS_
;	.line	460; src/main.c	t1_count = BOOT_TIMER_TICS;
	MOVLW	0xe5
	MOVWF	r0x00
	bcf _LATA, 4 ; led on
	
_00237_DS_:
;	.line	466; src/main.c	while (1)
	CLRF	r0x01
	CLRF	r0x02
_00229_DS_:
;	.line	469; src/main.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
;	.line	472; src/main.c	if (led_counter == 0)
	MOVF	r0x01, W
	IORWF	r0x02, W
	BNZ	_00223_DS_
	movlw 1 << 4 ; toggle
	xorwf _LATA, f ; the led
	
_00223_DS_:
;	.line	479; src/main.c	led_counter++;
	INFSNZ	r0x01, F
	INCF	r0x02, F
;	.line	482; src/main.c	if (PIR1bits.TMR1IF == 1)
	CLRF	r0x03
	BTFSC	_PIR1bits, 0
	INCF	r0x03, F
	MOVF	r0x03, W
	XORLW	0x01
	BNZ	_00229_DS_
;	.line	484; src/main.c	t1_count++;
	INCF	r0x00, F
;	.line	485; src/main.c	PIR1bits.TMR1IF = 0;
	BCF	_PIR1bits, 0
;	.line	488; src/main.c	if (t1_count > BOOT_TIMER_TICS)
	MOVLW	0xe6
	SUBWF	r0x00, W
	BNC	_00229_DS_
;	.line	490; src/main.c	disable_boot();
	CALL	_disable_boot
	goto 0x0C00 ; start user app
	
	BRA	_00229_DS_
; ; Starting pCode block
S_main__usb_ep_data_out_callback	code
_usb_ep_data_out_callback:
;	.line	180; src/main.c	void usb_ep_data_out_callback(char end_point)
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
	
;	.line	190; src/main.c	EP_IN_BD(end_point).Cnt = 0;
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
;	.line	193; src/main.c	TBLPTRU = bootCmd.addru;
	MOVFF	(_bootCmd + 4), _TBLPTRU
;	.line	194; src/main.c	TBLPTRH = bootCmd.addrh;
	MOVFF	(_bootCmd + 3), _TBLPTRH
;	.line	195; src/main.c	TBLPTRL = bootCmd.addrl;
	MOVFF	(_bootCmd + 2), _TBLPTRL
	BANKSEL	_bootCmd
;	.line	198; src/main.c	if (bootCmd.cmd ==  RESET)
	MOVF	_bootCmd, W, B
	XORLW	0xff
	BNZ	_00137_DS_
;	.line	201; src/main.c	disable_boot();
	CALL	_disable_boot
	goto 0x0C00 ; start user app
	
	BRA	_00138_DS_
_00137_DS_:
	BANKSEL	_bootCmd
;	.line	207; src/main.c	else if (bootCmd.cmd == READ_VERSION)
	MOVF	_bootCmd, W, B
	BNZ	_00134_DS_
;	.line	210; src/main.c	bootCmd.buffer[2] = MINOR_VERSION;
	MOVLW	0x07
; removed redundant BANKSEL
	MOVWF	(_bootCmd + 2), B
;	.line	211; src/main.c	bootCmd.buffer[3] = MAJOR_VERSION;
	MOVLW	0x04
; removed redundant BANKSEL
	MOVWF	(_bootCmd + 3), B
;	.line	213; src/main.c	EP_IN_BD(end_point).Cnt = 4;
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
	BRA	_00138_DS_
_00134_DS_:
	BANKSEL	_bootCmd
;	.line	218; src/main.c	else if (bootCmd.cmd == READ_FLASH)
	MOVF	_bootCmd, W, B
	XORLW	0x01
	BNZ	_00131_DS_
;	.line	221; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	CLRF	r0x03
_00144_DS_:
	BANKSEL	(_bootCmd + 1)
	MOVF	(_bootCmd + 1), W, B
	SUBWF	r0x03, W
	BC	_00147_DS_
	TBLRD*+ 
;	.line	224; src/main.c	bootCmd.xdat[counter] = TABLAT;
	MOVLW	LOW(_bootCmd + 5)
	ADDWF	r0x03, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_bootCmd + 5)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	_TABLAT, INDF0
;	.line	221; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	INCF	r0x03, F
	BRA	_00144_DS_
_00147_DS_:
;	.line	228; src/main.c	EP_IN_BD(end_point).Cnt = 5 + bootCmd.len;
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
	BRA	_00138_DS_
_00131_DS_:
	BANKSEL	_bootCmd
;	.line	232; src/main.c	else if (bootCmd.cmd == WRITE_FLASH)
	MOVF	_bootCmd, W, B
	XORLW	0x02
	BNZ	_00128_DS_
;	.line	251; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	CLRF	r0x03
_00148_DS_:
	BANKSEL	(_bootCmd + 1)
	MOVF	(_bootCmd + 1), W, B
	SUBWF	r0x03, W
	BC	_00151_DS_
;	.line	253; src/main.c	TABLAT = bootCmd.xdat[counter];     // present data to table latch
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
;	.line	251; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	INCF	r0x03, F
	BRA	_00148_DS_
_00151_DS_:
	TBLRD*- 
;	.line	258; src/main.c	EECON1 = 0b10000100; // allows write (WREN=1) in flash (EEPGD=1)
	MOVLW	0x84
	MOVWF	_EECON1
;	.line	259; src/main.c	start_write();
	CALL	_start_write
;	.line	288; src/main.c	EP_IN_BD(end_point).Cnt = 1;
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
	BRA	_00138_DS_
_00128_DS_:
	BANKSEL	_bootCmd
;	.line	292; src/main.c	else if (bootCmd.cmd ==  ERASE_FLASH)
	MOVF	_bootCmd, W, B
	XORLW	0x03
	BNZ	_00138_DS_
;	.line	304; src/main.c	EECON1 = 0b10010100; // allows erase (WREN=1, FREE=1) in flash (EEPGD=1)
	MOVLW	0x94
	MOVWF	_EECON1
;	.line	305; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	CLRF	r0x03
_00152_DS_:
	BANKSEL	(_bootCmd + 1)
	MOVF	(_bootCmd + 1), W, B
	SUBWF	r0x03, W
	BC	_00155_DS_
;	.line	307; src/main.c	start_write();
	CALL	_start_write
	movlw 0x40
	addwf _TBLPTRL ; TBLPTR += 64
	movlw 0x00 ; if (TBLPTRL == 0)
	addwfc _TBLPTRH ; TBLPTRH += 1
	
;	.line	305; src/main.c	for (counter=0; counter < bootCmd.len; counter++)
	INCF	r0x03, F
	BRA	_00152_DS_
_00155_DS_:
;	.line	341; src/main.c	EP_IN_BD(end_point).Cnt = 1;
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
_00138_DS_:
;	.line	346; src/main.c	if (EP_IN_BD(end_point).Cnt > 0)
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
	BZ	_00143_DS_
	BANKSEL	(_ep_bdt + 12)
;	.line	349; src/main.c	if (EP_IN_BD(1).Stat.DTS)
	BTFSS	(_ep_bdt + 12), 6, B
	BRA	_00140_DS_
;	.line	350; src/main.c	EP_IN_BD(1).Stat.uc = 0b10001000; // UOWN 1 DTS 0 DTSEN 1
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 12), B
	BRA	_00143_DS_
_00140_DS_:
;	.line	352; src/main.c	EP_IN_BD(1).Stat.uc = 0b11001000; // UOWN 1 DTS 1 DTSEN 1
	MOVLW	0xc8
	BANKSEL	(_ep_bdt + 12)
	MOVWF	(_ep_bdt + 12), B
; ;multiply lit val:0x04 by variable r0x01 and store in r0x01
_00143_DS_:
;	.line	356; src/main.c	EP_OUT_BD(end_point).Cnt = EP1_BUFFER_SIZE;
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
;	.line	358; src/main.c	EP_OUT_BD(end_point).Stat.uc = 0x80;      // UOWN 1
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
;	.line	164; src/main.c	UEP1 = 0b00011110;
	MOVLW	0x1e
	MOVWF	_UEP1
; #	MOVLW	0x40
; #	MOVWF	(_ep_bdt + 12), B
; #	MOVLW	0x40
;	.line	168; src/main.c	EP_IN_BD(1).Stat.uc  = 0b01000000;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 12)
;	.line	171; src/main.c	EP_OUT_BD(1).Cnt  = EP1_BUFFER_SIZE;
	MOVWF	(_ep_bdt + 12), B
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 9), B
;	.line	172; src/main.c	EP_OUT_BD(1).ADDR = PTR16(&bootCmd);
	MOVLW	LOW(_bootCmd)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 10), B
	MOVLW	HIGH(_bootCmd)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 11), B
;	.line	174; src/main.c	EP_OUT_BD(1).Stat.uc = 0b10000000;
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 8), B
	RETURN	

; ; Starting pCode block
S_main__disable_boot	code
_disable_boot:
	clrf _T1CON ; disable timer 1
	clrf _UCON ; disable USB
	bsf _TRISA, 4 ; led input
	bcf _LATA, 4 ; led off
	call _delay ; force timeout on USB
	
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
	
; ; Starting pCode block
S_main__delay	code
_delay:
	movlw 0xFF
	movwf r0x00
	movlw 0xFF
	movwf r0x01
startup_loop:
	decfsz r0x00, f
	bra startup_loop
	decfsz r0x01, f
	bra startup_loop
	
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
; ; Starting pCode block for Ival
_lang:
	DB	0x04, 0x03, 0x09, 0x04
; ; Starting pCode block for Ival
_manu:
	DB	0x16, 0x03, 0x52, 0x00, 0x2e, 0x00, 0x42, 0x00, 0x6c, 0x00, 0x61, 0x00
	DB	0x6e, 0x00, 0x63, 0x00, 0x68, 0x00, 0x6f, 0x00, 0x74, 0x00
; ; Starting pCode block for Ival
_prod:
	DB	0x12, 0x03, 0x50, 0x00, 0x69, 0x00, 0x6e, 0x00, 0x67, 0x00, 0x75, 0x00
	DB	0x69, 0x00, 0x6e, 0x00, 0x6f, 0x00
; ; Starting pCode block for Ival
_string_descriptor:
	DB	LOW(_lang), HIGH(_lang), UPPER(_lang), LOW(_manu), HIGH(_manu), UPPER(_manu), LOW(_prod), HIGH(_prod), UPPER(_prod)


; Statistics:
; code size:	  864 (0x0360) bytes ( 0.66%)
;           	  432 (0x01b0) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    6 (0x0006) bytes


	end
