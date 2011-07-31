;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Aug  9 2009) (UNIX)
; This file was generated Sun Jul 31 19:04:01 2011
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f2550

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _j
	global _hidRxLen
	global _hidProtocol
	global _hidIdleRate
	global _HIDPostProcess
	global _deviceAddress
	global _EnableUSBModule
	global _ProcessUSBTransactions
	global _ProcessCDCRequest
	global _CDCgets
	global _CDCInitEndpoint
	global _CONTROL_LINE
	global _deviceState
	global _remoteWakeup
	global _selfPowered
	global _currentConfiguration
	global _ctrlTransferStage
	global _requestHandled
	global _outPtr
	global _inPtr
	global _wCount
	global _ep_bdt
	global _SetupPacket
	global _controlTransferBuffer
	global _CDCControlBuffer
	global _CDCRxBuffer
	global _CDCTxBuffer
	global _line_config
	global _zlp
	global _rx
	global _wpointer
	global _rpointer
	global _i
	global _receivedbyte
	global _rxstr
	global _txstr
	global _serstr
	global _ProcessStandardRequest
	global _InDataStage
	global _OutDataStage
	global _SetupStage
	global _WaitForSetupStage
	global _ProcessControlTransfer
	global _UnSuspend
	global _StartOfFrame
	global _Stall
	global _Suspend
	global _BusReset
	global _CDCputs
	global _Delayms
	global _Delayus
	global _pprintf
	global _psprintf
	global _CDC_init
	global _CDCwrite
	global _CDCprintf
	global _CDCprintln
	global _CDCprint
	global _serial_begin
	global _serial_available
	global _serial_putchar
	global _serial_interrupt
	global _serial_read
	global _serial_flush
	global _serial_printf
	global _serial_getkey
	global _serial_getstring
	global _serial_print
	global _serial_println
	global _epap_in
	global _epap_out
	global _epapin_init
	global _epapout_init
	global _setup
	global _loop
	global _pinguino_main
	global _high_priority_isr
	global _low_priority_isr
	global _libdevice_descriptor
	global _libconfiguration_descriptor
	global _libstring_descriptor

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
	extern __gptrput1
	extern __gptrget3
	extern __gptrput3
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
	extern _uitoa
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
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW1	equ	0xfe3
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_CONTROL_LINE	db	0x00
_i	db	0x00
_j	db	0x00, 0x00, 0x00, 0x00
_txstr	db	0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65
_serstr	db	0x00, 0x00


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


usbram5	udata
_SetupPacket	res	64
_controlTransferBuffer	res	64
_CDCRxBuffer	res	64
_CDCTxBuffer	res	64

udata_main_0	udata
_deviceAddress	res	1

udata_main_1	udata
_HIDPostProcess	res	1

udata_main_2	udata
_hidIdleRate	res	1

udata_main_3	udata
_hidProtocol	res	1

udata_main_4	udata
_hidRxLen	res	1

udata_main_5	udata
_pputchar	res	3

udata_main_6	udata
_requestHandled	res	1

udata_main_7	udata
_outPtr	res	3

udata_main_8	udata
_wCount	res	2

udata_main_9	udata
_inPtr	res	3

udata_main_10	udata
_selfPowered	res	1

udata_main_11	udata
_remoteWakeup	res	1

udata_main_12	udata
_deviceState	res	1

udata_main_13	udata
_currentConfiguration	res	1

udata_main_14	udata
_ctrlTransferStage	res	1

udata_main_15	udata
_line_config	res	7

udata_main_16	udata
_zlp	res	8

udata_main_17	udata
_CDCControlBuffer	res	16

udata_main_18	udata
_pprinti_print_buf_1_1	res	12

udata_main_19	udata
_pprint_scr_1_1	res	2

udata_main_20	udata
_psprintf_out_1_1	res	3

udata_main_21	udata
_CDCprintf_buffer_1_1	res	80

udata_main_22	udata
_wpointer	res	1

udata_main_23	udata
_rpointer	res	1

udata_main_24	udata
_rx	res	128

udata_main_25	udata
_serial_getstring_buffer_1_1	res	80

udata_main_26	udata
_receivedbyte	res	1

udata_main_27	udata
_rxstr	res	64


ustat_main_00	udata	0X0400
_ep_bdt        	res	128

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__high_priority_isr	code	0X002020
_high_priority_isr:
;	.line	129; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	void high_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	132; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	if(PIR2bits.USBIF)
	BTFSS	_PIR2bits, 5
	BRA	_01109_DS_
;	.line	134; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
;	.line	135; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	UIRbits.SOFIF = 0;
	BCF	_UIRbits, 6
;	.line	136; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	UIRbits.URSTIF = 0;
	BCF	_UIRbits, 0
;	.line	137; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	PIR2bits.USBIF = 0;
	BCF	_PIR2bits, 5
;	.line	138; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	UEIR = 0;
	CLRF	_UEIR
_01109_DS_:
;	.line	165; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	if (PIR1bits.RCIF) 
	BTFSS	_PIR1bits, 5
	BRA	_01112_DS_
;	.line	166; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	serial_interrupt();
	CALL	_serial_interrupt
_01112_DS_:
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
;	.line	193; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	void low_priority_isr(void) interrupt
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	198; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	}
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
;	.line	57; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	PIE1 = 0;
	CLRF	_PIE1
;	.line	58; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	PIE2 = 0;
	CLRF	_PIE2
;	.line	59; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	ADCON1 = 0b00001111;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	71; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	setup();
	CALL	_setup
;	.line	90; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	CDC_init();
	CALL	_CDC_init
;	.line	91; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	PIE2bits.USBIE  = 1;
	BSF	_PIE2bits, 5
;	.line	92; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	INTCONbits.PEIE = 1;
	BSF	_INTCONbits, 6
;	.line	93; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	INTCONbits.GIE  = 1;
	BSF	_INTCONbits, 7
;	.line	104; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	INTCONbits.PEIE = 1;
	BSF	_INTCONbits, 6
;	.line	105; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	INTCONbits.GIE  = 1;
	BSF	_INTCONbits, 7
_01101_DS_:
;	.line	123; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	loop();
	CALL	_loop
	BRA	_01101_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	19; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	void loop()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	22; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	receivedbyte=CDCgets(rxstr);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_rxstr)
	MOVWF	POSTDEC1
	MOVLW	LOW(_rxstr)
	MOVWF	POSTDEC1
	CALL	_CDCgets
	BANKSEL	_receivedbyte
	MOVWF	_receivedbyte, B
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	23; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	rxstr[receivedbyte]=0; 
	MOVLW	LOW(_rxstr)
; removed redundant BANKSEL
	ADDWF	_receivedbyte, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_rxstr)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	CLRF	INDF0
; removed redundant BANKSEL
;	.line	24; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	if (receivedbyte>0)
	MOVF	_receivedbyte, W, B
	BZ	_01082_DS_
	BANKSEL	_i
;	.line	25; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	for (i=0;i<receivedbyte;i++)
	CLRF	_i, B
_01085_DS_:
	BANKSEL	_receivedbyte
	MOVF	_receivedbyte, W, B
	BANKSEL	_i
	SUBWF	_i, W, B
	BC	_01082_DS_
;	.line	26; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	serial_printf(rxstr);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_rxstr)
	MOVWF	POSTDEC1
	MOVLW	LOW(_rxstr)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
	BANKSEL	_i
;	.line	25; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	for (i=0;i<receivedbyte;i++)
	INCF	_i, F, B
	BRA	_01085_DS_
_01082_DS_:
;	.line	38; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	if (serial_available())
	CALL	_serial_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_01089_DS_
;	.line	40; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	serstr[0]=serial_read();
	CALL	_serial_read
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	BANKSEL	_serstr
	MOVWF	_serstr, B
;	.line	41; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	CDCprint(txstr,7);
	CLRF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_txstr)
	MOVWF	POSTDEC1
	MOVLW	LOW(_txstr)
	MOVWF	POSTDEC1
	CALL	_CDCprint
	MOVLW	0x05
	ADDWF	FSR1L, F
_01089_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	7; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	serial_begin(9600);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x25
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	CALL	_serial_begin
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	8; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	serial_printf("Hello");
	MOVLW	UPPER(__str_8)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_8)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_8)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	45; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	44; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	void epapin_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	43; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	void epap_out() { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	42; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	void epap_in() { return; }
	RETURN	

; ; Starting pCode block
S_main__serial_println	code
_serial_println:
;	.line	218; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	void serial_println(char *fmt,...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	220; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	serial_print(fmt);
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	CALL	_serial_print
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	221; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	serial_printf("\n\r");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__serial_print	code
_serial_print:
;	.line	180; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	void serial_print(char *fmt,...)
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
;	.line	186; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	va_start(ap,fmt);
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
;	.line	187; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	s=va_start(ap,fmt);
	MOVLW	0x80
;	.line	189; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	switch (*s)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	CALL	__gptrget1
	MOVWF	r0x00
	MOVF	r0x00, W
	BNZ	_01038_DS_
	BRA	_01025_DS_
_01038_DS_:
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_01040_DS_
	BRA	_01027_DS_
_01040_DS_:
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_01042_DS_
	BRA	_01026_DS_
_01042_DS_:
	MOVF	r0x00, W
	XORLW	0x0a
	BZ	_01023_DS_
	MOVF	r0x00, W
	XORLW	0x10
	BZ	_01024_DS_
	BRA	_01028_DS_
_01023_DS_:
;	.line	191; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	case DEC:       serial_printf("%d",(int)fmt);
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x04
	MOVLW	0x03
	MOVFF	PLUSW2, r0x05
	MOVLW	0x04
	MOVFF	PLUSW2, r0x06
	MOVF	r0x04, W
	MOVWF	r0x00
	MOVF	r0x05, W
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
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
;	.line	192; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	break;
	BRA	_01030_DS_
_01024_DS_:
;	.line	193; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	case HEX: 		serial_printf("%x",(int)fmt);
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x04
	MOVLW	0x03
	MOVFF	PLUSW2, r0x05
	MOVLW	0x04
	MOVFF	PLUSW2, r0x06
	MOVF	r0x04, W
	MOVWF	r0x00
	MOVF	r0x05, W
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	194; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	break;
	BRA	_01030_DS_
_01025_DS_:
;	.line	195; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	case BYTE: 		serial_printf("%d",(unsigned char)fmt);
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x04
	MOVLW	0x03
	MOVFF	PLUSW2, r0x05
	MOVLW	0x04
	MOVFF	PLUSW2, r0x06
	MOVF	r0x04, W
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	196; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	break;
	BRA	_01030_DS_
_01026_DS_:
;	.line	197; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	case OCT:     uitoa((int)fmt,chaine,8);
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x04
	MOVLW	0x03
	MOVFF	PLUSW2, r0x05
	MOVLW	0x04
	MOVFF	PLUSW2, r0x06
	MOVF	r0x04, W
	MOVWF	r0x00
	MOVF	r0x05, W
	MOVWF	r0x01
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVLW	0xf9
	ADDWF	FSR2L, W
	MOVWF	r0x02
	MOVLW	0xff
	ADDWFC	FSR2H, W
	MOVWF	r0x03
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_uitoa
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	198; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	serial_printf(chaine);
	MOVLW	0xf9
	ADDWF	FSR2L, W
	MOVWF	r0x00
	MOVLW	0xff
	ADDWFC	FSR2H, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
; #	MOVWF	r0x01
; #	MOVWF	r0x01
	MOVWF	r0x01
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	199; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	break;
	BRA	_01030_DS_
_01027_DS_:
;	.line	200; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	case BIN:       uitoa((int)fmt,chaine,2);
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x04
	MOVLW	0x03
	MOVFF	PLUSW2, r0x05
	MOVLW	0x04
	MOVFF	PLUSW2, r0x06
	MOVF	r0x04, W
	MOVWF	r0x00
	MOVF	r0x05, W
	MOVWF	r0x01
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVLW	0xf9
	ADDWF	FSR2L, W
	MOVWF	r0x02
	MOVLW	0xff
	ADDWFC	FSR2H, W
	MOVWF	r0x03
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_uitoa
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	201; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	serial_printf(chaine);
	MOVLW	0xf9
	ADDWF	FSR2L, W
	MOVWF	r0x00
	MOVLW	0xff
	ADDWFC	FSR2H, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
; #	MOVWF	r0x01
; #	MOVWF	r0x01
	MOVWF	r0x01
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	202; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	break;           
	BRA	_01030_DS_
_01028_DS_:
;	.line	203; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	default:	serial_printf(fmt);
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x04
	MOVLW	0x03
	MOVFF	PLUSW2, r0x05
	MOVLW	0x04
	MOVFF	PLUSW2, r0x06
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x04
	MOVLW	0x03
	MOVFF	PLUSW2, r0x05
	MOVLW	0x04
	MOVFF	PLUSW2, r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	CALL	_serial_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
_01030_DS_:
;	.line	207; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	va_end(ap);
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
S_main__serial_getstring	code
_serial_getstring:
;	.line	159; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	u8 * serial_getstring()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	166; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	do {
	CLRF	r0x00
_01009_DS_:
;	.line	167; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	c = serial_getkey();
	CALL	_serial_getkey
	MOVWF	r0x01
;	.line	168; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	serial_printf("%c", c);
	MOVFF	r0x01, r0x02
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_7)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_7)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_7)
	MOVWF	POSTDEC1
	CALL	_serial_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	169; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	buffer[i++] = c;
	MOVFF	r0x00, r0x02
	INCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(_serial_getstring_buffer_1_1)
	ADDWF	r0x02, F
	MOVLW	HIGH(_serial_getstring_buffer_1_1)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
;	.line	170; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	} while (c != '\r');
	MOVF	r0x01, W
	XORLW	0x0d
	BNZ	_01009_DS_
;	.line	171; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	buffer[i] = '\0';
	CLRF	r0x01
	MOVLW	LOW(_serial_getstring_buffer_1_1)
	ADDWF	r0x00, F
	MOVLW	HIGH(_serial_getstring_buffer_1_1)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	CLRF	INDF0
;	.line	172; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	return (buffer);
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVLW	LOW(_serial_getstring_buffer_1_1)
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_getkey	code
_serial_getkey:
;	.line	145; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	u8 serial_getkey()
	MOVFF	r0x00, POSTDEC1
_01001_DS_:
;	.line	148; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	while (!(serial_available()));
	CALL	_serial_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_01001_DS_
;	.line	149; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	c = serial_read();
	CALL	_serial_read
	MOVWF	r0x00
;	.line	150; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	serial_flush();
	CALL	_serial_flush
;	.line	151; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	return (c);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_printf	code
_serial_printf:
;	.line	131; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	void serial_printf(char *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	135; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	va_start(args, fmt);
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
;	.line	136; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	pprintf(serial_putchar, fmt, args);
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
	CALL	_pprintf
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	137; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	va_end(args);
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__serial_flush	code
_serial_flush:
; #	MOVLW	0x01
; #	MOVWF	_wpointer, B
; #	MOVLW	0x01
;	.line	121; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	wpointer=1;
	MOVLW	0x01
	BANKSEL	_wpointer
;	.line	122; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	rpointer=1;
	MOVWF	_wpointer, B
	BANKSEL	_rpointer
	MOVWF	_rpointer, B
	RETURN	

; ; Starting pCode block
S_main__serial_read	code
_serial_read:
;	.line	105; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	unsigned char serial_read()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	107; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	unsigned char caractere=0;
	CLRF	r0x00
;	.line	109; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	if (serial_available())
	CALL	_serial_available
	MOVWF	r0x01
	MOVF	r0x01, W
	BZ	_00980_DS_
;	.line	111; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	caractere=rx[rpointer++];
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
;	.line	112; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	if (rpointer==RXBUFFERLENGTH)
	MOVF	_rpointer, W, B
	XORLW	0x80
	BNZ	_00980_DS_
;	.line	113; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	rpointer=1;
	MOVLW	0x01
	BANKSEL	_rpointer
	MOVWF	_rpointer, B
_00980_DS_:
;	.line	115; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	return(caractere);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_interrupt	code
_serial_interrupt:
;	.line	85; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	void serial_interrupt(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	90; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	PIR1bits.RCIF=0;				// clear RX interrupt flag
	BCF	_PIR1bits, 5
;	.line	91; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	caractere=RCREG;				// take received char
	MOVFF	_RCREG, r0x00
	BANKSEL	_wpointer
;	.line	92; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	if (wpointer!=RXBUFFERLENGTH-1)	// if not last place in buffer
	MOVF	_wpointer, W, B
	XORLW	0x7f
	BZ	_00956_DS_
_00968_DS_:
	BANKSEL	_wpointer
;	.line	93; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	newwp=wpointer+1;			// place=place+1
	INCF	_wpointer, W, B
	MOVWF	r0x01
	BRA	_00957_DS_
_00956_DS_:
;	.line	95; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	newwp=1;					// else place=1
	MOVLW	0x01
	MOVWF	r0x01
_00957_DS_:
	BANKSEL	_rpointer
;	.line	97; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	if (rpointer!=newwp)			// if read pointer!=write pointer
	MOVF	_rpointer, W, B
	XORWF	r0x01, W
	BZ	_00959_DS_
;	.line	98; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	rx[wpointer++]=caractere;	// store received char
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
_00959_DS_:
	BANKSEL	_wpointer
;	.line	100; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	if (wpointer==RXBUFFERLENGTH)	// if write pointer=length buffer
	MOVF	_wpointer, W, B
	XORLW	0x80
	BNZ	_00962_DS_
;	.line	101; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	wpointer=1;					// write pointer = 1
	MOVLW	0x01
	BANKSEL	_wpointer
	MOVWF	_wpointer, B
_00962_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__serial_putchar	code
_serial_putchar:
;	.line	78; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	void serial_putchar(unsigned char caractere)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
_00947_DS_:
;	.line	80; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	while (!TXSTAbits.TRMT);
	BTFSS	_TXSTAbits, 1
	BRA	_00947_DS_
;	.line	81; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	TXREG=caractere;		        // yes, send char
	MOVFF	r0x00, _TXREG
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__serial_available	code
_serial_available:
;	.line	72; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	unsigned char serial_available()
	MOVFF	r0x00, POSTDEC1
;	.line	74; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	return(wpointer!=rpointer);
	CLRF	r0x00
	BANKSEL	_wpointer
	MOVF	_wpointer, W, B
	BANKSEL	_rpointer
	XORWF	_rpointer, W, B
	BNZ	_00942_DS_
	INCF	r0x00, F
_00942_DS_:
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
;	.line	48; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	void serial_begin(unsigned long baudrate)
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
;	.line	53; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	spbrg=(48000000/(4*baudrate))-1;
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
;	.line	54; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	highbyte=spbrg/256;
	MOVF	r0x01, W
;	.line	55; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	lowbyte=spbrg%256;
	MOVWF	r0x04
;	.line	56; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	TXSTAbits.BRGH=1;               	  	// set BRGH bit
	BSF	_TXSTAbits, 2
;	.line	57; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	BAUDCONbits.BRG16=1;					// set 16 bits SPBRG
	BSF	_BAUDCONbits, 3
;	.line	58; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	SPBRGH=highbyte;                        // set UART speed SPBRGH
	MOVFF	r0x04, _SPBRGH
;	.line	59; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	SPBRG=lowbyte;   						// set UART speed SPBRGL
	MOVFF	r0x00, _SPBRG
;	.line	60; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	RCSTA=0x90;                             // set RCEN and SPEN
	MOVLW	0x90
	MOVWF	_RCSTA
;	.line	61; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	BAUDCONbits.RCIDL=1;			// set receive active
	BSF	_BAUDCONbits, 6
;	.line	62; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	PIE1bits.RCIE=1;                        // enable interrupt on RX
	BSF	_PIE1bits, 5
;	.line	63; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	INTCONbits.PEIE=1;                      // enable peripheral interrupts
	BSF	_INTCONbits, 6
;	.line	64; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	IPR1bits.RCIP=1;                        // define high priority for RX interrupt
	BSF	_IPR1bits, 5
; #	MOVLW	0x01
; #	MOVWF	_wpointer, B
; #	MOVLW	0x01
;	.line	65; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	wpointer=1;                             // initialize write pointer
	MOVLW	0x01
	BANKSEL	_wpointer
;	.line	66; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	rpointer=1;                             // initialize read pointer
	MOVWF	_wpointer, B
	BANKSEL	_rpointer
	MOVWF	_rpointer, B
;	.line	67; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	TXSTAbits.TXEN=1;                       // enable TX
	BSF	_TXSTAbits, 5
;	.line	68; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/serial.c	INTCONbits.GIE=1;
	BSF	_INTCONbits, 7
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__CDCprint	code
_CDCprint:
;	.line	70; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	void CDCprint(char *fmt,...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	75; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	va_start(ap,fmt);
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
;	.line	76; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	s = va_start(ap,fmt);
	MOVLW	0x80
;	.line	78; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	switch (*s)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	CALL	__gptrget1
	MOVWF	r0x00
	MOVF	r0x00, W
	BNZ	_00921_DS_
	BRA	_00908_DS_
_00921_DS_:
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00923_DS_
	BRA	_00910_DS_
_00923_DS_:
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00925_DS_
	BRA	_00909_DS_
_00925_DS_:
	MOVF	r0x00, W
	XORLW	0x0a
	BZ	_00906_DS_
	MOVF	r0x00, W
	XORLW	0x10
	BNZ	_00929_DS_
	BRA	_00907_DS_
_00929_DS_:
	BRA	_00911_DS_
_00906_DS_:
;	.line	81; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCprintf("%d",fmt);
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	82; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	break;
	BRA	_00913_DS_
_00907_DS_:
;	.line	84; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCprintf("%x",fmt);
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	85; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	break;
	BRA	_00913_DS_
_00908_DS_:
;	.line	87; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCprintf("%d",fmt);
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	88; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	break;
	BRA	_00913_DS_
_00909_DS_:
;	.line	90; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCprintf("%o",fmt);
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	91; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	break;
	BRA	_00913_DS_
_00910_DS_:
;	.line	93; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCprintf("%b",fmt);
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVLW	UPPER(__str_6)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_6)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_6)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	94; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	break;           
	BRA	_00913_DS_
_00911_DS_:
;	.line	96; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCprintf(fmt);
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	CALL	_CDCprintf
	MOVLW	0x03
	ADDWF	FSR1L, F
_00913_DS_:
;	.line	100; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	va_end(ap);
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__CDCprintln	code
_CDCprintln:
;	.line	63; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	void CDCprintln(char *fmt,...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	65; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCprintf(fmt);
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x03
	MOVLW	0x03
	MOVFF	PLUSW2, r0x04
	MOVLW	0x04
	MOVFF	PLUSW2, r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	CALL	_CDCprintf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	66; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCprintf("\n\r");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__CDCprintf	code
_CDCprintf:
;	.line	50; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	void CDCprintf(char *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	56; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	va_start(args, fmt);
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
;	.line	57; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	length = psprintf(buffer, fmt, args);
	MOVLW	0x80
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
	MOVLW	HIGH(_CDCprintf_buffer_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_CDCprintf_buffer_1_1)
	MOVWF	POSTDEC1
	CALL	_psprintf
	MOVWF	r0x00
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	58; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCputs(buffer,length);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_CDCprintf_buffer_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_CDCprintf_buffer_1_1)
	MOVWF	POSTDEC1
	CALL	_CDCputs
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	59; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	va_end(args);
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__CDCwrite	code
_CDCwrite:
;	.line	44; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	void CDCwrite(char c)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
;	.line	46; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	CDCputs(c, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_CDCputs
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__CDC_init	code
_CDC_init:
;	.line	19; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	INTCON=0;
	CLRF	_INTCON
;	.line	20; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	INTCON2=0xC0;
	MOVLW	0xc0
	MOVWF	_INTCON2
;	.line	21; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	UCON=0;
	CLRF	_UCON
;	.line	22; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	UCFG=0;
	CLRF	_UCFG
;	.line	23; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	UEP0=0;UEP1=0;UEP2=0;UEP3=0;UEP4=0;UEP5=0;
	CLRF	_UEP0
	CLRF	_UEP1
	CLRF	_UEP2
	CLRF	_UEP3
	CLRF	_UEP4
	CLRF	_UEP5
;	.line	24; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	UEP6=0;UEP7=0;UEP8=0;UEP9=0;UEP10=0;UEP11=0;
	CLRF	_UEP6
	CLRF	_UEP7
	CLRF	_UEP8
	CLRF	_UEP9
	CLRF	_UEP10
	CLRF	_UEP11
;	.line	25; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	UEP12=0;UEP13=0;UEP14=0;UEP15=0;
	CLRF	_UEP12
	CLRF	_UEP13
	CLRF	_UEP14
	CLRF	_UEP15
;	.line	27; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	Delayms(2000);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0xd0
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	29; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	UCFG = 0x14; 				// Enable pullup resistors; full speed mode
	MOVLW	0x14
	MOVWF	_UCFG
	BANKSEL	_deviceState
;	.line	30; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	deviceState = DETACHED;
	CLRF	_deviceState, B
	BANKSEL	_remoteWakeup
;	.line	31; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	remoteWakeup = 0x00;
	CLRF	_remoteWakeup, B
	BANKSEL	_currentConfiguration
;	.line	32; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	currentConfiguration = 0x00;
	CLRF	_currentConfiguration, B
_00878_DS_:
	BANKSEL	_deviceState
;	.line	34; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	while(deviceState != CONFIGURED)
	MOVF	_deviceState, W, B
	XORLW	0x05
	BZ	_00881_DS_
;	.line	36; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	EnableUSBModule();
	CALL	_EnableUSBModule
;	.line	37; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/__cdc.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
	BRA	_00878_DS_
_00881_DS_:
	RETURN	

; ; Starting pCode block
S_main__psprintf	code
_psprintf:
;	.line	248; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	int psprintf(char *out, const char *format, va_list args)
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
;	.line	253; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	return pprint(&out, format, args);
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
;	.line	238; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	int pprintf(stdout func, const char *format, va_list args)
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
;	.line	244; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	return pprint(0, format, args);
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
;	.line	141; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	static int pprint(char **out, const char *format, va_list args)
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
;	.line	144; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	register int pc = 0;
	CLRF	r0x09
	CLRF	r0x0a
_00796_DS_:
;	.line	147; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for (; *format != 0; ++format)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVF	r0x0b, W
	BTFSC	STATUS, 2
	GOTO	_00799_DS_
;	.line	149; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == '%')
	MOVF	r0x0b, W
	XORLW	0x25
	BZ	_00836_DS_
	GOTO	_00792_DS_
_00836_DS_:
;	.line	151; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++format;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
;	.line	152; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	width = pad = 0;
	CLRF	r0x0b
	CLRF	r0x0c
	CLRF	r0x0d
	CLRF	r0x0e
;	.line	153; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == '\0')
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0f
	MOVF	r0x0f, W
	BTFSC	STATUS, 2
	GOTO	_00799_DS_
;	.line	155; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == '%')
	MOVF	r0x0f, W
	XORLW	0x25
	BNZ	_00838_DS_
	GOTO	_00792_DS_
_00838_DS_:
;	.line	157; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == '-')
	MOVF	r0x0f, W
	XORLW	0x2d
	BNZ	_00817_DS_
;	.line	159; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++format;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
;	.line	160; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pad = PAD_RIGHT;
	MOVLW	0x01
	MOVWF	r0x0b
	CLRF	r0x0c
_00817_DS_:
;	.line	162; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	while (*format == '0')
	MOVFF	r0x03, r0x0f
	MOVFF	r0x04, r0x10
	MOVFF	r0x05, r0x11
_00771_DS_:
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	XORLW	0x30
	BNZ	_00803_DS_
;	.line	164; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++format;
	INCF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
;	.line	165; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pad |= PAD_ZERO;
	BSF	r0x0b, 1
	BRA	_00771_DS_
_00803_DS_:
;	.line	167; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x12
; #	MOVF	r0x12, W
	MOVWF	r0x12
	ADDLW	0x80
	ADDLW	0x50
	BNC	_00834_DS_
	MOVF	r0x12, W
	ADDLW	0x80
	ADDLW	0x46
	BC	_00834_DS_
;	.line	169; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	width *= 10;
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
;	.line	170; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	width += *format - '0';
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
;	.line	167; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	INCF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BRA	_00803_DS_
_00834_DS_:
	MOVFF	r0x0f, r0x03
	MOVFF	r0x10, r0x04
	MOVFF	r0x11, r0x05
;	.line	172; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == 's')
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
; #	MOVWF	r0x0f
; #	MOVF	r0x0f, W
	MOVWF	r0x0f
	XORLW	0x73
	BZ	_00847_DS_
	BRA	_00775_DS_
_00847_DS_:
;	.line	175; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	char *s = va_arg(args, char*);
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
;	.line	177; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pc += pprints(out, s?s:"(null)", width, pad);
	IORWF	r0x11, W
; #	IORWF	r0x12, W
; #	BTFSC	STATUS, 2
; #	GOTO	_00809_DS_
; #	GOTO	_00810_DS_
; #	MOVLW	LOW(__str_0)
	IORWF	r0x12, W
	BNZ	_00810_DS_
	MOVLW	LOW(__str_0)
	MOVWF	r0x10
	MOVLW	HIGH(__str_0)
	MOVWF	r0x11
	MOVLW	UPPER(__str_0)
	MOVWF	r0x12
_00810_DS_:
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
;	.line	178; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	continue;
	GOTO	_00798_DS_
_00775_DS_:
;	.line	180; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == 'd')
	MOVF	r0x0f, W
	XORLW	0x64
	BZ	_00849_DS_
	BRA	_00777_DS_
_00849_DS_:
;	.line	182; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 10, 1, width, pad, 'a');
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
;	.line	183; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00798_DS_
_00777_DS_:
;	.line	185; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == 'x')
	MOVF	r0x0f, W
	XORLW	0x78
	BZ	_00851_DS_
	BRA	_00779_DS_
_00851_DS_:
;	.line	187; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 16, 0, width, pad, 'a');
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
;	.line	188; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00798_DS_
_00779_DS_:
;	.line	190; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == 'X')
	MOVF	r0x0f, W
	XORLW	0x58
	BZ	_00853_DS_
	BRA	_00781_DS_
_00853_DS_:
;	.line	192; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 16, 0, width, pad, 'A');
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
;	.line	193; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00798_DS_
_00781_DS_:
;	.line	195; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == 'b')
	MOVF	r0x0f, W
	XORLW	0x62
	BZ	_00855_DS_
	BRA	_00783_DS_
_00855_DS_:
;	.line	197; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 2, 0, width, pad, 'a');
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
;	.line	198; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00798_DS_
_00783_DS_:
;	.line	200; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == 'o')
	MOVF	r0x0f, W
	XORLW	0x6f
	BZ	_00857_DS_
	BRA	_00785_DS_
_00857_DS_:
;	.line	202; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 8, 0, width, pad, 'a');
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
;	.line	203; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00798_DS_
_00785_DS_:
;	.line	205; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == 'u')
	MOVF	r0x0f, W
	XORLW	0x75
	BZ	_00859_DS_
	BRA	_00787_DS_
_00859_DS_:
;	.line	207; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pc += pprinti(out, va_arg(args, int), 10, 0, width, pad, 'a');
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
;	.line	208; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00798_DS_
_00787_DS_:
;	.line	210; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == 'c')
	MOVF	r0x0f, W
	XORLW	0x63
	BZ	_00861_DS_
	BRA	_00789_DS_
_00861_DS_:
;	.line	213; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	scr[0] = (char)va_arg(args, int);
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
;	.line	215; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	scr[1] = '\0';
	CLRF	(_pprint_scr_1_1 + 1), B
;	.line	216; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pc += pprints(out, scr, width, pad);
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
;	.line	217; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00798_DS_
_00789_DS_:
;	.line	219; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (*format == 'f')
	MOVF	r0x0f, W
	XORLW	0x66
	BNZ	_00798_DS_
;	.line	221; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pc += pprints(out, "not yet implemented\0", width, pad);
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
;	.line	222; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	continue;
	BRA	_00798_DS_
_00792_DS_:
;	.line	228; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pprintchar(out, *format);
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
;	.line	229; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++pc;
	INCF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
_00798_DS_:
;	.line	147; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for (; *format != 0; ++format)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	GOTO	_00796_DS_
_00799_DS_:
;	.line	232; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (out) **out = '\0';
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00801_DS_
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
_00801_DS_:
;	.line	234; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	return pc;
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
;	.line	92; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	static int pprinti(char **out, int i, int b, int sg, int width, int pad, int letbase)
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
;	.line	96; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	int t, neg = 0, pc = 0;
	CLRF	r0x0f
	CLRF	r0x10
	CLRF	r0x11
	CLRF	r0x12
;	.line	97; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	unsigned int u = i;
	MOVFF	r0x03, r0x13
	MOVFF	r0x04, r0x14
;	.line	99; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (i == 0)
	MOVF	r0x03, W
	IORWF	r0x04, W
	BNZ	_00727_DS_
;	.line	101; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	print_buf[0] = '0';
	MOVLW	0x30
	BANKSEL	_pprinti_print_buf_1_1
	MOVWF	_pprinti_print_buf_1_1, B
; removed redundant BANKSEL
;	.line	102; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	print_buf[1] = '\0';
	CLRF	(_pprinti_print_buf_1_1 + 1), B
;	.line	103; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	return pprints(out, print_buf, width, pad);
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
	BRA	_00743_DS_
_00727_DS_:
;	.line	106; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (sg && b == 10 && i < 0)
	MOVF	r0x07, W
	IORWF	r0x08, W
	BZ	_00729_DS_
	MOVF	r0x05, W
	XORLW	0x0a
	BNZ	_00756_DS_
	MOVF	r0x06, W
	BZ	_00757_DS_
_00756_DS_:
	BRA	_00729_DS_
_00757_DS_:
	BSF	STATUS, 0
	BTFSS	r0x04, 7
	BCF	STATUS, 0
	BNC	_00729_DS_
;	.line	108; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	neg = 1;
	MOVLW	0x01
	MOVWF	r0x0f
	CLRF	r0x10
;	.line	109; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	u = -i;
	COMF	r0x04, W
	MOVWF	r0x14
	COMF	r0x03, W
	MOVWF	r0x13
	INFSNZ	r0x13, F
	INCF	r0x14, F
_00729_DS_:
;	.line	112; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	s = print_buf + PRINT_BUF_LEN-1;
	MOVLW	HIGH(_pprinti_print_buf_1_1 + 11)
	MOVWF	r0x04
	MOVLW	LOW(_pprinti_print_buf_1_1 + 11)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x07
;	.line	113; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	*s = '\0';
	CLRF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	CALL	__gptrput1
;	.line	115; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	while (u)
	MOVF	r0x0d, W
	ADDLW	0xc6
	MOVWF	r0x0d
	MOVFF	r0x05, r0x0e
	MOVFF	r0x06, r0x15
	MOVFF	r0x03, r0x16
	MOVFF	r0x04, r0x17
	MOVFF	r0x07, r0x18
_00734_DS_:
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00755_DS_
;	.line	117; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	t = u % b;
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
;	.line	118; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if( t >= 10 )
	MOVF	r0x1a, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00759_DS_
	MOVLW	0x0a
	SUBWF	r0x19, W
_00759_DS_:
	BNC	_00733_DS_
;	.line	119; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	t += letbase - '0' - 10;
	MOVF	r0x0d, W
	ADDWF	r0x19, F
_00733_DS_:
;	.line	120; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	*--s = t + '0';
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
;	.line	121; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	u /= b;
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
	BRA	_00734_DS_
_00755_DS_:
	MOVFF	r0x16, r0x03
	MOVFF	r0x17, r0x04
	MOVFF	r0x18, r0x07
;	.line	124; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (neg)
	MOVF	r0x0f, W
	IORWF	r0x10, W
	BZ	_00742_DS_
;	.line	126; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (width && (pad & PAD_ZERO))
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BZ	_00738_DS_
	BTFSS	r0x0b, 1
	BRA	_00738_DS_
;	.line	128; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pprintchar(out, '-');
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
;	.line	129; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++pc;
	MOVLW	0x01
	MOVWF	r0x11
	CLRF	r0x12
;	.line	130; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	--width;
	MOVLW	0xff
	ADDWF	r0x09, F
	BTFSS	STATUS, 0
	DECF	r0x0a, F
	BRA	_00742_DS_
_00738_DS_:
;	.line	134; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	*--s = '-';
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
_00742_DS_:
;	.line	138; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	return pc + pprints(out, s, width, pad);
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
_00743_DS_:
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
;	.line	50; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	static int pprints(char **out, const char *string, int width, int pad)
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
;	.line	52; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	register int pc = 0;
	CLRF	r0x0a
	CLRF	r0x0b
;	.line	53; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	int padchar = ' ';
	MOVLW	0x20
	MOVWF	r0x0c
;	.line	57; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (width > 0)
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00716_DS_
	MOVLW	0x01
	SUBWF	r0x06, W
_00716_DS_:
	BNC	_00680_DS_
;	.line	59; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for (ptr = string; *ptr; ++ptr)
	CLRF	r0x0e
	CLRF	r0x0f
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
_00683_DS_:
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x13
	MOVF	r0x13, W
	BZ	_00686_DS_
;	.line	60; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++len;
	INCF	r0x0e, F
	BTFSC	STATUS, 0
	INCF	r0x0f, F
;	.line	59; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for (ptr = string; *ptr; ++ptr)
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	BRA	_00683_DS_
_00686_DS_:
;	.line	61; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (len >= width)
	MOVF	r0x0f, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x07, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00717_DS_
	MOVF	r0x06, W
	SUBWF	r0x0e, W
_00717_DS_:
	BNC	_00675_DS_
;	.line	62; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	width = 0;
	CLRF	r0x06
	CLRF	r0x07
	BRA	_00676_DS_
_00675_DS_:
;	.line	64; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	width -= len;
	MOVF	r0x0e, W
	SUBWF	r0x06, F
	MOVF	r0x0f, W
	SUBWFB	r0x07, F
_00676_DS_:
;	.line	65; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (pad & PAD_ZERO) padchar = '0';
	BTFSS	r0x08, 1
	BRA	_00680_DS_
	MOVLW	0x30
	MOVWF	r0x0c
_00680_DS_:
;	.line	67; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (!(pad & PAD_RIGHT))
	BTFSC	r0x08, 0
	BRA	_00709_DS_
	CLRF	r0x08
	CLRF	r0x09
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
_00687_DS_:
;	.line	69; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x0f, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00720_DS_
	MOVLW	0x01
	SUBWF	r0x0e, W
_00720_DS_:
	BNC	_00713_DS_
; #	MOVF	r0x0c, W
; #	MOVWF	r0x10
; #	MOVF	r0x10, W
;	.line	71; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pprintchar(out, padchar);
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
;	.line	72; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++pc;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	69; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for ( ; width > 0; --width)
	MOVLW	0xff
	ADDWF	r0x0e, F
	BTFSS	STATUS, 0
	DECF	r0x0f, F
	BRA	_00687_DS_
_00713_DS_:
	MOVFF	r0x08, r0x0a
	MOVFF	r0x09, r0x0b
	MOVFF	r0x0e, r0x06
	MOVFF	r0x0f, r0x07
_00709_DS_:
	MOVFF	r0x0a, r0x08
	MOVFF	r0x0b, r0x09
_00691_DS_:
;	.line	75; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for ( ; *string ; ++string)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0a
	MOVF	r0x0a, W
	BZ	_00711_DS_
;	.line	77; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pprintchar(out, *string);
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
;	.line	78; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++pc;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	75; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for ( ; *string ; ++string)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BRA	_00691_DS_
_00711_DS_:
	MOVFF	r0x08, r0x03
	MOVFF	r0x09, r0x04
	MOVFF	r0x06, r0x05
	MOVFF	r0x07, r0x06
_00695_DS_:
;	.line	80; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x06, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00721_DS_
	MOVLW	0x01
	SUBWF	r0x05, W
_00721_DS_:
	BNC	_00698_DS_
; #	MOVF	r0x0c, W
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
;	.line	82; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pprintchar(out, padchar);
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
;	.line	83; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++pc;
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
;	.line	80; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	for ( ; width > 0; --width)
	MOVLW	0xff
	ADDWF	r0x05, F
	BTFSS	STATUS, 0
	DECF	r0x06, F
	BRA	_00695_DS_
_00698_DS_:
;	.line	86; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	return pc;
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
;	.line	34; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	static void pprintchar(char **str, char c)
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
;	.line	36; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	if (str)
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00664_DS_
;	.line	38; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	**str = c;
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
;	.line	39; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	++(*str);
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
	BRA	_00666_DS_
_00664_DS_:
;	.line	43; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/stdio.c	pputchar(c);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00669_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00669_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00669_DS_)
	MOVWF	TOSU
	MOVF	PREINC1, W
	MOVWF	INTCON
	MOVFF	(_pputchar + 2), PCLATU
	MOVFF	(_pputchar + 1), PCLATH
	BANKSEL	_pputchar
	MOVF	_pputchar, W, B
	MOVWF	PCL
_00669_DS_:
	MOVLW	0x01
	ADDWF	FSR1L, F
_00666_DS_:
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
;	.line	16; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/delay.c	void Delayus(int microsecondes)
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
;	.line	20; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/delay.c	for (i=0;i<microsecondes;i++);
	CLRF	r0x02
	CLRF	r0x03
_00649_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00658_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00658_DS_:
	BC	_00653_DS_
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00649_DS_
_00653_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayms	code
_Delayms:
;	.line	9; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/delay.c	void Delayms(unsigned long milliseconde)
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
;	.line	13; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/delay.c	for (i=0;i<milliseconde;i++) delay10ktcy(1);
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
_00635_DS_:
	MOVF	r0x03, W
	SUBWF	r0x07, W
	BNZ	_00644_DS_
	MOVF	r0x02, W
	SUBWF	r0x06, W
	BNZ	_00644_DS_
	MOVF	r0x01, W
	SUBWF	r0x05, W
	BNZ	_00644_DS_
	MOVF	r0x00, W
	SUBWF	r0x04, W
_00644_DS_:
	BC	_00639_DS_
	MOVLW	0x01
	CALL	_delay10ktcy
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00635_DS_
_00639_DS_:
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
S_main__CDCInitEndpoint	code
_CDCInitEndpoint:
	BANKSEL	_line_config
;	.line	167; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	line_config.dwDTERate = USB_CDC_BAUD_RATE;
	CLRF	_line_config, B
	MOVLW	0xc2
; removed redundant BANKSEL
	MOVWF	(_line_config + 1), B
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	(_line_config + 2), B
; removed redundant BANKSEL
	CLRF	(_line_config + 3), B
; removed redundant BANKSEL
;	.line	168; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	line_config.bCharFormat = USB_CDC_STOP_BITS;
	CLRF	(_line_config + 4), B
; removed redundant BANKSEL
;	.line	169; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	line_config.bParityType = USB_CDC_PARITY;
	CLRF	(_line_config + 5), B
;	.line	170; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	line_config.bDataBits = USB_CDC_DATA_BITS;
	MOVLW	0x08
; removed redundant BANKSEL
	MOVWF	(_line_config + 6), B
	BANKSEL	_zlp
;	.line	171; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	zlp.wValue0=0;
	CLRF	_zlp, B
; removed redundant BANKSEL
;	.line	172; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	zlp.wValue1=0;
	CLRF	(_zlp + 1), B
; removed redundant BANKSEL
;	.line	173; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	zlp.wValue2=0;
	CLRF	(_zlp + 2), B
; removed redundant BANKSEL
;	.line	174; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	zlp.wValue3=0;
	CLRF	(_zlp + 3), B
; removed redundant BANKSEL
;	.line	175; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	zlp.wValue4=0;
	CLRF	(_zlp + 4), B
; removed redundant BANKSEL
;	.line	176; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	zlp.wValue5=0;
	CLRF	(_zlp + 5), B
; removed redundant BANKSEL
;	.line	177; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	zlp.wValue6=0;
	CLRF	(_zlp + 6), B
; removed redundant BANKSEL
;	.line	178; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	zlp.wValue7=0;
	CLRF	(_zlp + 7), B
;	.line	183; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	USB_COMM_EP_UEP = EP_IN | HSHK_EN;
	MOVLW	0x1a
	MOVWF	_UEP2
;	.line	186; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	CDC_DATA_EP_UEP = EP_OUT_IN | HSHK_EN;
	MOVLW	0x1e
	MOVWF	_UEP3
;	.line	190; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_IN_BD(USB_COMM_EP_NUM).ADDR = PTR16(&CDCControlBuffer);
	MOVLW	LOW(_CDCControlBuffer)
	BANKSEL	(_ep_bdt + 22)
	MOVWF	(_ep_bdt + 22), B
	MOVLW	HIGH(_CDCControlBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 23), B
; #	MOVLW	0x40
; #	MOVWF	(_ep_bdt + 20), B
; #	MOVLW	0x40
;	.line	191; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_IN_BD(USB_COMM_EP_NUM).Stat.uc = BDS_DAT1 | BDS_COWN;
	MOVLW	0x40
; removed redundant BANKSEL
;	.line	194; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Cnt = sizeof(CDCRxBuffer);
	MOVWF	(_ep_bdt + 20), B
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 25), B
;	.line	195; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).ADDR = PTR16(&CDCRxBuffer);
	MOVLW	LOW(_CDCRxBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 26), B
	MOVLW	HIGH(_CDCRxBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 27), B
;	.line	196; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Stat.uc = BDS_UOWN | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 24), B
;	.line	198; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).ADDR = PTR16(&CDCTxBuffer); // +1 
	MOVLW	LOW(_CDCTxBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 30), B
	MOVLW	HIGH(_CDCTxBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 31), B
;	.line	199; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Stat.uc = BDS_DAT1 | BDS_COWN; 
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 28), B
;	.line	200; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	deviceState=CONFIGURED; 
	MOVLW	0x05
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	RETURN	

; ; Starting pCode block
S_main__CDCputs	code
_CDCputs:
;	.line	131; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	byte CDCputs(char *buffer, byte length) {
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
;	.line	132; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	byte i=0;
	CLRF	r0x04
	BANKSEL	_deviceState
;	.line	134; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if (deviceState != CONFIGURED) return 0;
	MOVF	_deviceState, W, B
	XORLW	0x05
	BZ	_00602_DS_
	CLRF	WREG
	BRA	_00613_DS_
_00602_DS_:
	BANKSEL	_CONTROL_LINE
;	.line	135; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if (!CONTROL_LINE) return 0;
	MOVF	_CONTROL_LINE, W, B
	BNZ	_00604_DS_
	CLRF	WREG
	BRA	_00613_DS_
_00604_DS_:
	BANKSEL	(_ep_bdt + 28)
;	.line	136; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if (!EP_IN_BD(CDC_DATA_EP_NUM).Stat.UOWN) {
	BTFSC	(_ep_bdt + 28), 7, B
	BRA	_00608_DS_
;	.line	137; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if (length > CDC_BULK_IN_SIZE) length = CDC_BULK_IN_SIZE;
	MOVLW	0x41
	SUBWF	r0x03, W
	BNC	_00620_DS_
	MOVLW	0x40
	MOVWF	r0x03
_00620_DS_:
;	.line	138; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	for (i=0; i < length; i++) {
	CLRF	r0x05
_00609_DS_:
	MOVF	r0x03, W
	SUBWF	r0x05, W
	BC	_00621_DS_
;	.line	139; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	CDCTxBuffer[i] = buffer[i];
	MOVLW	LOW(_CDCTxBuffer)
	ADDWF	r0x05, W
	MOVWF	r0x06
	CLRF	r0x07
	MOVLW	HIGH(_CDCTxBuffer)
	ADDWFC	r0x07, F
	MOVF	r0x05, W
	ADDWF	r0x00, W
	MOVWF	r0x08
	CLRF	WREG
	ADDWFC	r0x01, W
	MOVWF	r0x09
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	CALL	__gptrget1
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	r0x08, INDF0
;	.line	138; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	for (i=0; i < length; i++) {
	INCF	r0x05, F
	BRA	_00609_DS_
_00621_DS_:
	MOVFF	r0x05, r0x04
;	.line	148; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Cnt = i;
	MOVF	r0x05, W
	BANKSEL	(_ep_bdt + 29)
	MOVWF	(_ep_bdt + 29), B
;	.line	150; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Stat.uc &= 0x40;
	MOVLW	0x40
; removed redundant BANKSEL
	ANDWF	(_ep_bdt + 28), W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	(_ep_bdt + 28), B
;	.line	151; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Stat.DTS = !EP_IN_BD(CDC_DATA_EP_NUM).Stat.DTS;
	CLRF	r0x00
; removed redundant BANKSEL
	BTFSC	(_ep_bdt + 28), 6, B
	INCF	r0x00, F
	MOVF	r0x00, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_ep_bdt + 28), W, B
	ANDLW	0xbf
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 28), B
;	.line	153; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Stat.uc |= BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	IORWF	(_ep_bdt + 28), W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	(_ep_bdt + 28), B
_00608_DS_:
;	.line	156; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	return i;
	MOVF	r0x04, W
_00613_DS_:
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
S_main__CDCgets	code
_CDCgets:
;	.line	98; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	byte CDCgets(char *buffer) {
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
;	.line	99; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	byte i=0;
	CLRF	r0x03
	BANKSEL	_deviceState
;	.line	101; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if (deviceState != CONFIGURED) return 0;
	MOVF	_deviceState, W, B
	XORLW	0x05
	BZ	_00573_DS_
	CLRF	WREG
	BRA	_00584_DS_
_00573_DS_:
	BANKSEL	_CONTROL_LINE
;	.line	103; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if (!CONTROL_LINE) return 0;
	MOVF	_CONTROL_LINE, W, B
	BNZ	_00575_DS_
	CLRF	WREG
	BRA	_00584_DS_
_00575_DS_:
	BANKSEL	(_ep_bdt + 24)
;	.line	105; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if (!EP_OUT_BD(CDC_DATA_EP_NUM).Stat.UOWN) {
	BTFSC	(_ep_bdt + 24), 7, B
	BRA	_00579_DS_
;	.line	110; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if (length > EP_OUT_BD(CDC_DATA_EP_NUM).Cnt) length = EP_OUT_BD(CDC_DATA_EP_NUM).Cnt;
	MOVLW	0x40
; #	SUBWF	(_ep_bdt + 25), W, B
; #	BTFSC	STATUS, 0
; #	GOTO	_00591_DS_
; #;;;!!! pic16_aopOp:1071 called for a spillLocation -- assigning WREG instead --- CHECK
; #	MOVFF	(_ep_bdt + 25), WREG
; #	CLRF	r0x04
; removed redundant BANKSEL
;	.line	111; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	for (i=0; i < EP_OUT_BD(CDC_DATA_EP_NUM).Cnt; i++) {
	SUBWF	(_ep_bdt + 25), W, B
	BTFSS	STATUS, 0
	MOVFF	(_ep_bdt + 25), WREG
	CLRF	r0x04
_00580_DS_:
	BANKSEL	(_ep_bdt + 25)
	MOVF	(_ep_bdt + 25), W, B
	SUBWF	r0x04, W
	BC	_00592_DS_
;	.line	112; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	buffer[i] = CDCRxBuffer[i];
	MOVF	r0x04, W
	ADDWF	r0x00, W
	MOVWF	r0x05
	CLRF	WREG
	ADDWFC	r0x01, W
	MOVWF	r0x06
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVLW	LOW(_CDCRxBuffer)
	ADDWF	r0x04, W
	MOVWF	r0x08
	CLRF	r0x09
	MOVLW	HIGH(_CDCRxBuffer)
	ADDWFC	r0x09, F
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVFF	INDF0, r0x08
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	111; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	for (i=0; i < EP_OUT_BD(CDC_DATA_EP_NUM).Cnt; i++) {
	INCF	r0x04, F
	BRA	_00580_DS_
_00592_DS_:
	MOVFF	r0x04, r0x03
;	.line	121; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Stat.uc &= 0x40;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 24)
	ANDWF	(_ep_bdt + 24), W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	(_ep_bdt + 24), B
;	.line	122; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Stat.DTS = !EP_OUT_BD(CDC_DATA_EP_NUM).Stat.DTS;
	CLRF	r0x00
; removed redundant BANKSEL
	BTFSC	(_ep_bdt + 24), 6, B
	INCF	r0x00, F
	MOVF	r0x00, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_ep_bdt + 24), W, B
	ANDLW	0xbf
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 24), B
;	.line	124; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Cnt = sizeof(CDCRxBuffer);
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 25), B
;	.line	125; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Stat.uc |= BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	IORWF	(_ep_bdt + 24), W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	(_ep_bdt + 24), B
_00579_DS_:
;	.line	128; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	return i;
	MOVF	r0x03, W
_00584_DS_:
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
S_main__ProcessCDCRequest	code
_ProcessCDCRequest:
;	.line	29; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	void ProcessCDCRequest(void)
	MOVFF	r0x00, POSTDEC1
;	.line	38; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if ((SetupPacket.bmRequestType & USB_TYPE_MASK) != USB_TYPE_CLASS) return;
	MOVLW	0x60
	BANKSEL	_SetupPacket
	ANDWF	_SetupPacket, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	XORLW	0x20
	BZ	_00534_DS_
	BRA	_00544_DS_
_00534_DS_:
;	.line	42; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	switch(SetupPacket.bRequest)
	MOVFF	(_SetupPacket + 1), r0x00
	MOVF	r0x00, W
	BNZ	_00557_DS_
	BRA	_00544_DS_
_00557_DS_:
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00559_DS_
	BRA	_00544_DS_
_00559_DS_:
	MOVF	r0x00, W
	XORLW	0x20
	BZ	_00537_DS_
	MOVF	r0x00, W
	XORLW	0x21
	BZ	_00538_DS_
	MOVF	r0x00, W
	XORLW	0x22
	BZ	_00539_DS_
	BRA	_00544_DS_
_00537_DS_:
;	.line	62; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	outPtr = (data byte *)&line_config;
	MOVLW	HIGH(_line_config)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_line_config)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	63; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	wCount = sizeof(USB_CDC_Line_Coding) ;
	MOVLW	0x07
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	64; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	requestHandled = 1;				
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	65; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	break;
	BRA	_00544_DS_
_00538_DS_:
;	.line	71; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	outPtr = (data byte *)&line_config;
	MOVLW	HIGH(_line_config)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_line_config)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	72; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	wCount = sizeof(USB_CDC_Line_Coding) ;
	MOVLW	0x07
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	73; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	74; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	break;
	BRA	_00544_DS_
_00539_DS_:
	BANKSEL	(_SetupPacket + 2)
;	.line	82; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	if (SetupPacket.wValue0==3) CONTROL_LINE=1;
	MOVF	(_SetupPacket + 2), W, B
	XORLW	0x03
	BNZ	_00541_DS_
	MOVLW	0x01
	BANKSEL	_CONTROL_LINE
	MOVWF	_CONTROL_LINE, B
	BRA	_00542_DS_
_00541_DS_:
	BANKSEL	_CONTROL_LINE
;	.line	83; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	else CONTROL_LINE=0;		
	CLRF	_CONTROL_LINE, B
_00542_DS_:
;	.line	84; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	outPtr = (data byte *)&zlp;
	MOVLW	HIGH(_zlp)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_zlp)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	85; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	wCount = sizeof(Zero_Packet_Length) ;
	MOVLW	0x08
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	86; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	requestHandled = 1;						
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
_00544_DS_:
;	.line	88; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/usb_cdc.c	}
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__ProcessUSBTransactions	code
_ProcessUSBTransactions:
;	.line	740; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	void ProcessUSBTransactions(void) {
	MOVFF	r0x00, POSTDEC1
; #	MOVF	_deviceState, W, B
; #	BTFSS	STATUS, 2
; #	GOTO	_00481_DS_
; #	GOTO	_00507_DS_
; #	BTFSS	_UIRbits, 2
	BANKSEL	_deviceState
;	.line	742; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(deviceState == DETACHED)
	MOVF	_deviceState, W, B
;	.line	743; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	return;
	BZ	_00507_DS_
;	.line	746; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(UIRbits.ACTVIF && UIEbits.ACTVIE)
	BTFSS	_UIRbits, 2
; #	GOTO	_00483_DS_
; #	BTFSS	_UIEbits, 2
; #	GOTO	_00483_DS_
; #	CALL	_UnSuspend
; #	CLRF	r0x00
;	.line	747; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UnSuspend();
	BRA	_00483_DS_
;	.line	751; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(UCONbits.SUSPND == 1)
	BTFSC	_UIEbits, 2
	CALL	_UnSuspend
_00483_DS_:
	CLRF	r0x00
	BTFSC	_UCONbits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
;	.line	752; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	return;
	BZ	_00507_DS_
;	.line	755; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (UIRbits.URSTIF && UIEbits.URSTIE) {
	BTFSS	_UIRbits, 0
; #	GOTO	_00488_DS_
; #	BTFSS	_UIEbits, 0
; #	GOTO	_00488_DS_
; #	CALL	_BusReset
; #	BTFSS	_UIRbits, 4
;	.line	756; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	BusReset();
	BRA	_00488_DS_
;	.line	759; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (UIRbits.IDLEIF && UIEbits.IDLEIE) {
	BTFSC	_UIEbits, 0
	CALL	_BusReset
_00488_DS_:
	BTFSS	_UIRbits, 4
; #	GOTO	_00491_DS_
; #	BTFSS	_UIEbits, 4
; #	GOTO	_00491_DS_
; #	CALL	_Suspend
; #	BTFSS	_UIRbits, 6
;	.line	761; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	Suspend();
	BRA	_00491_DS_
;	.line	763; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (UIRbits.SOFIF && UIEbits.SOFIE) {
	BTFSC	_UIEbits, 4
	CALL	_Suspend
_00491_DS_:
	BTFSS	_UIRbits, 6
; #	GOTO	_00494_DS_
; #	BTFSS	_UIEbits, 6
; #	GOTO	_00494_DS_
; #	CALL	_StartOfFrame
; #	BTFSS	_UIRbits, 5
;	.line	764; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	StartOfFrame();
	BRA	_00494_DS_
;	.line	766; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (UIRbits.STALLIF && UIEbits.STALLIE) {
	BTFSC	_UIEbits, 6
	CALL	_StartOfFrame
_00494_DS_:
	BTFSS	_UIRbits, 5
; #	GOTO	_00497_DS_
; #	BTFSS	_UIEbits, 5
; #	GOTO	_00497_DS_
; #	CALL	_Stall
; #	BTFSS	_UIRbits, 1
;	.line	767; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	Stall();
	BRA	_00497_DS_
;	.line	770; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (UIRbits.UERRIF && UIEbits.UERRIE) {
	BTFSC	_UIEbits, 5
	CALL	_Stall
_00497_DS_:
	BTFSS	_UIRbits, 1
; #	GOTO	_00500_DS_
; #	BTFSS	_UIEbits, 1
; #	GOTO	_00500_DS_
; #	BCF	_UIRbits, 1
; #	MOVLW	0x03
;	.line	774; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIRbits.UERRIF = 0;
	BRA	_00500_DS_
;	.line	778; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (deviceState < DEFAULT)
	BTFSC	_UIEbits, 1
	BCF	_UIRbits, 1
_00500_DS_:
	MOVLW	0x03
; #	SUBWF	_deviceState, W, B
; #	BTFSC	STATUS, 0
; #	GOTO	_00503_DS_
; #	GOTO	_00507_DS_
; #	BTFSS	_UIRbits, 3
	BANKSEL	_deviceState
;	.line	779; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	return;
	SUBWF	_deviceState, W, B
;	.line	782; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(UIRbits.TRNIF && UIEbits.TRNIE) {
	BNC	_00507_DS_
	BTFSS	_UIRbits, 3
	BRA	_00507_DS_
	BTFSS	_UIEbits, 3
	BRA	_00507_DS_
;	.line	783; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	ProcessControlTransfer();
	CALL	_ProcessControlTransfer
;	.line	786; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIRbits.TRNIF = 0;
	BCF	_UIRbits, 3
_00507_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__BusReset	code
_BusReset:
;	.line	712; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	void BusReset() {
	MOVFF	r0x00, POSTDEC1
;	.line	713; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UEIR  = 0x00;
	CLRF	_UEIR
;	.line	714; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIR   = 0x00;
	CLRF	_UIR
;	.line	715; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UEIE  = 0x9f;
	MOVLW	0x9f
	MOVWF	_UEIE
;	.line	716; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIE   = 0x7b;
	MOVLW	0x7b
	MOVWF	_UIE
;	.line	717; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UADDR = 0x00;
	CLRF	_UADDR
;	.line	720; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UEP0 = EP_CTRL | HSHK_EN;
	MOVLW	0x16
	MOVWF	_UEP0
_00467_DS_:
;	.line	723; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	while (UIRbits.TRNIF == 1)
	CLRF	r0x00
	BTFSC	_UIRbits, 3
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00469_DS_
;	.line	724; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIRbits.TRNIF = 0;
	BCF	_UIRbits, 3
	BRA	_00467_DS_
_00469_DS_:
;	.line	727; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UCONbits.PKTDIS = 0;
	BCF	_UCONbits, 4
;	.line	730; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BANKSEL	_remoteWakeup
;	.line	732; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	remoteWakeup = 0;                     // Remote wakeup is off by default
	CLRF	_remoteWakeup, B
	BANKSEL	_selfPowered
;	.line	733; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	selfPowered = 0;                      // Self powered is off by default
	CLRF	_selfPowered, B
	BANKSEL	_currentConfiguration
;	.line	734; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	currentConfiguration = 0;             // Clear active configuration
	CLRF	_currentConfiguration, B
;	.line	735; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	deviceState = DEFAULT;
	MOVLW	0x03
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__Suspend	code
_Suspend:
;	.line	682; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	void Suspend(void) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	687; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIEbits.ACTVIE = 1;
	BSF	_UIEbits, 2
;	.line	688; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIRbits.IDLEIF = 0;
	BCF	_UIRbits, 4
;	.line	689; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UCONbits.SUSPND = 1;
	BSF	_UCONbits, 1
;	.line	691; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	PIR2bits.USBIF = 0;
	BCF	_PIR2bits, 5
;	.line	692; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	INTCONbits.RBIF = 0;
	BCF	_INTCONbits, 0
;	.line	693; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	PIE2bits.USBIE = 1;
	BSF	_PIE2bits, 5
;	.line	694; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	INTCONbits.RBIE = 1;
	BSF	_INTCONbits, 3
;	.line	697; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	RCSTAbits.CREN = 0;
	BCF	_RCSTAbits, 4
;	.line	698; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	TXSTAbits.TXEN = 0;
	BCF	_TXSTAbits, 5
	sleep 
;	.line	703; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	RCSTAbits.CREN = 1;
	BSF	_RCSTAbits, 4
;	.line	704; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	TXSTAbits.TXEN = 1;
	BSF	_TXSTAbits, 5
;	.line	706; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	PIE2bits.USBIE = 0;
	BCF	_PIE2bits, 5
;	.line	707; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	INTCONbits.RBIE = 0;
	BCF	_INTCONbits, 3
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Stall	code
_Stall:
;	.line	668; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	void Stall(void) {
	MOVFF	r0x00, POSTDEC1
;	.line	672; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(UEP0bits.EPSTALL == 1) {
	CLRF	r0x00
	BTFSC	_UEP0bits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00449_DS_
;	.line	674; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
;	.line	675; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UEP0bits.EPSTALL = 0;
	BCF	_UEP0bits, 0
_00449_DS_:
;	.line	677; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIRbits.STALLIF = 0;
	BCF	_UIRbits, 5
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__StartOfFrame	code
_StartOfFrame:
;	.line	663; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIRbits.SOFIF = 0;
	BCF	_UIRbits, 6
	RETURN	

; ; Starting pCode block
S_main__UnSuspend	code
_UnSuspend:
;	.line	653; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UCONbits.SUSPND = 0;
	BCF	_UCONbits, 1
;	.line	654; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIEbits.ACTVIE = 0;
	BCF	_UIEbits, 2
;	.line	655; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIRbits.ACTVIF = 0;
	BCF	_UIRbits, 2
	RETURN	

; ; Starting pCode block
S_main__EnableUSBModule	code
_EnableUSBModule:
;	.line	623; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(UCONbits.USBEN == 0) {
	BTFSC	_UCONbits, 3
	BRA	_00423_DS_
;	.line	627; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UCON = 0;
	CLRF	_UCON
;	.line	628; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIE = 0;
	CLRF	_UIE
;	.line	629; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UCONbits.USBEN = 1;
	BSF	_UCONbits, 3
;	.line	630; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	deviceState = ATTACHED;
	MOVLW	0x01
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00423_DS_:
	BANKSEL	_deviceState
;	.line	634; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if ((deviceState == ATTACHED) && !UCONbits.SE0) {
	MOVF	_deviceState, W, B
	XORLW	0x01
	BNZ	_00427_DS_
	BTFSC	_UCONbits, 5
	BRA	_00427_DS_
;	.line	635; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIR = 0;
	CLRF	_UIR
;	.line	636; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIE = 0;
	CLRF	_UIE
;	.line	637; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIEbits.URSTIE = 1;
	BSF	_UIEbits, 0
;	.line	638; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UIEbits.IDLEIE = 1;
	BSF	_UIEbits, 4
;	.line	639; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	deviceState = POWERED;
	MOVLW	0x02
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00427_DS_:
	RETURN	

; ; Starting pCode block
S_main__ProcessControlTransfer	code
_ProcessControlTransfer:
;	.line	533; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	void ProcessControlTransfer(void) {
	MOVFF	r0x00, POSTDEC1
;	.line	537; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (USTATbits.DIR == OUT) {
	BTFSC	_USTATbits, 2
	BRA	_00393_DS_
;	.line	540; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte PID = (EP_OUT_BD(0).Stat.uc & 0x3C) >> 2;
	MOVLW	0x3c
	BANKSEL	_ep_bdt
	ANDWF	_ep_bdt, W, B
	MOVWF	r0x00
	RRNCF	r0x00, W
	RRNCF	WREG, W
	ANDLW	0x3f
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
;	.line	541; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (PID == 0x0D)
	XORLW	0x0d
	BNZ	_00377_DS_
;	.line	543; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	SetupStage();
	CALL	_SetupStage
	BRA	_00395_DS_
_00377_DS_:
	BANKSEL	_ctrlTransferStage
;	.line	544; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (ctrlTransferStage == DATA_OUT_STAGE) {
	MOVF	_ctrlTransferStage, W, B
	XORLW	0x01
	BNZ	_00374_DS_
;	.line	547; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	OutDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_OutDataStage
	INCF	FSR1L, F
	BANKSEL	_ep_bdt
;	.line	571; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(EP_OUT_BD(0).Stat.DTS)
	BTFSS	_ep_bdt, 6, B
	BRA	_00371_DS_
;	.line	572; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
	BRA	_00395_DS_
_00371_DS_:
;	.line	574; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
	BANKSEL	_ep_bdt
	MOVWF	_ep_bdt, B
	BRA	_00395_DS_
_00374_DS_:
;	.line	578; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BRA	_00395_DS_
_00393_DS_:
;	.line	581; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if(USTATbits.DIR == IN) {
	CLRF	r0x00
	BTFSC	_USTATbits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00395_DS_
;	.line	583; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if ((UADDR == 0) && (deviceState == ADDRESS)) {
	MOVF	_UADDR, W
	BNZ	_00382_DS_
	BANKSEL	_deviceState
	MOVF	_deviceState, W, B
	XORLW	0x04
	BNZ	_00382_DS_
;	.line	586; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UADDR = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _UADDR
;	.line	590; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(UADDR == 0)
	MOVF	_UADDR, W
	BNZ	_00382_DS_
;	.line	593; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	deviceState = DEFAULT;
	MOVLW	0x03
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00382_DS_:
	BANKSEL	_ctrlTransferStage
;	.line	596; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (ctrlTransferStage == DATA_IN_STAGE) {
	MOVF	_ctrlTransferStage, W, B
	XORLW	0x02
	BNZ	_00388_DS_
;	.line	598; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	InDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_InDataStage
	INCF	FSR1L, F
	BANKSEL	(_ep_bdt + 4)
;	.line	601; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(EP_IN_BD(0).Stat.DTS)
	BTFSS	(_ep_bdt + 4), 6, B
	BRA	_00385_DS_
;	.line	602; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00395_DS_
_00385_DS_:
;	.line	604; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
	BANKSEL	(_ep_bdt + 4)
	MOVWF	(_ep_bdt + 4), B
	BRA	_00395_DS_
_00388_DS_:
;	.line	608; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
_00395_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__WaitForSetupStage	code
_WaitForSetupStage:
	BANKSEL	_ctrlTransferStage
;	.line	520; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	ctrlTransferStage = SETUP_STAGE;
	CLRF	_ctrlTransferStage, B
;	.line	521; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	522; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	524; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
; removed redundant BANKSEL
;	.line	525; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(0).Stat.uc = 0x00;           // Give control to CPU
	CLRF	(_ep_bdt + 4), B
	RETURN	

; ; Starting pCode block
S_main__SetupStage	code
_SetupStage:
;	.line	450; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(0).Stat.uc &= ~BDS_UOWN;
	MOVLW	0x7f
	BANKSEL	(_ep_bdt + 4)
	ANDWF	(_ep_bdt + 4), W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	(_ep_bdt + 4), B
;	.line	451; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Stat.uc &= ~BDS_UOWN;
	MOVLW	0x7f
; removed redundant BANKSEL
	ANDWF	_ep_bdt, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	_ep_bdt, B
	BANKSEL	_ctrlTransferStage
;	.line	454; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	ctrlTransferStage = SETUP_STAGE;
	CLRF	_ctrlTransferStage, B
	BANKSEL	_requestHandled
;	.line	455; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 0;                   // Default is that request hasn't been handled
	CLRF	_requestHandled, B
	BANKSEL	_HIDPostProcess
;	.line	456; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	HIDPostProcess = 0;                   // Assume standard request until know otherwise
	CLRF	_HIDPostProcess, B
	BANKSEL	_wCount
;	.line	457; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = 0;                           // No bytes transferred
	CLRF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	460; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	ProcessStandardRequest();
	CALL	_ProcessStandardRequest
;	.line	470; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if ((SetupPacket.bmRequestType & USB_RECIP_MASK) == USB_RECIP_INTERFACE)  
	MOVLW	0x1f
	BANKSEL	_SetupPacket
	ANDWF	_SetupPacket, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00338_DS_
;	.line	471; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	ProcessCDCRequest();
	CALL	_ProcessCDCRequest
_00338_DS_:
	BANKSEL	_requestHandled
;	.line	474; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (!requestHandled) {
	MOVF	_requestHandled, W, B
	BNZ	_00345_DS_
;	.line	476; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	477; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
; #	MOVLW	0x84
; #	MOVWF	_ep_bdt, B
; #	MOVLW	0x84
;	.line	478; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
	MOVLW	0x84
; removed redundant BANKSEL
;	.line	479; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
	MOVWF	_ep_bdt, B
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00346_DS_
_00345_DS_:
	BANKSEL	_SetupPacket
;	.line	481; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (SetupPacket.bmRequestType & 0x80) {
	BTFSS	_SetupPacket, 7, B
	BRA	_00342_DS_
	BANKSEL	(_wCount + 1)
;	.line	483; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(SetupPacket.wLength < wCount)
	MOVF	(_wCount + 1), W, B
	BANKSEL	(_SetupPacket + 7)
	SUBWF	(_SetupPacket + 7), W, B
	BNZ	_00360_DS_
	BANKSEL	_wCount
	MOVF	_wCount, W, B
	BANKSEL	(_SetupPacket + 6)
	SUBWF	(_SetupPacket + 6), W, B
_00360_DS_:
	BC	_00340_DS_
;	.line	484; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = SetupPacket.wLength;
	MOVFF	(_SetupPacket + 6), _wCount
	MOVFF	(_SetupPacket + 7), (_wCount + 1)
_00340_DS_:
;	.line	485; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	InDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_InDataStage
	INCF	FSR1L, F
;	.line	486; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	ctrlTransferStage = DATA_IN_STAGE;
	MOVLW	0x02
	BANKSEL	_ctrlTransferStage
	MOVWF	_ctrlTransferStage, B
;	.line	488; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	489; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	490; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN;
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
;	.line	493; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(0).ADDR = PTR16(&controlTransferBuffer);
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 6), B
	MOVLW	HIGH(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 7), B
;	.line	495; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00346_DS_
_00342_DS_:
;	.line	499; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	ctrlTransferStage = DATA_OUT_STAGE;
	MOVLW	0x01
	BANKSEL	_ctrlTransferStage
	MOVWF	_ctrlTransferStage, B
	BANKSEL	(_ep_bdt + 5)
;	.line	502; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(0).Cnt = 0;
	CLRF	(_ep_bdt + 5), B
;	.line	503; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
;	.line	506; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 1), B
;	.line	507; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&controlTransferBuffer);
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	509; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
_00346_DS_:
;	.line	513; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	UCONbits.PKTDIS = 0;
	BCF	_UCONbits, 4
	RETURN	

; ; Starting pCode block
S_main__OutDataStage	code
_OutDataStage:
;	.line	411; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	void OutDataStage(unsigned char ep) {
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
;	.line	414; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	bufferSize = ((0x03 & EP_OUT_BD(ep).Stat.uc) << 8) | EP_OUT_BD(ep).Cnt;
	RLNCF	r0x00, W
	ANDLW	0xfe
; #	MOVWF	r0x01
; #;;multiply lit val:0x04 by variable r0x01 and store in r0x00
; #;;Unrolled 8 X 8 multiplication
; #;;FIXME: the function does not support result==WREG
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
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	CLRF	r0x01
	MOVF	r0x03, W
	IORWF	r0x00, F
	MOVF	r0x04, W
	IORWF	r0x01, F
;	.line	421; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = wCount + bufferSize;
	MOVF	r0x00, W
	BANKSEL	_wCount
	ADDWF	_wCount, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_wCount + 1), F, B
;	.line	423; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	outPtr = (byte*)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	427; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	for (i=0;i<bufferSize;i++) {
	CLRF	r0x02
	CLRF	r0x03
_00321_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00332_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00332_DS_:
	BC	_00325_DS_
;	.line	431; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	*inPtr++ = *outPtr++;
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
	BNC	_11117_DS_
; removed redundant BANKSEL
	INCF	(_outPtr + 1), F, B
_11117_DS_:
	BNC	_21118_DS_
	BANKSEL	(_outPtr + 2)
	INCF	(_outPtr + 2), F, B
_21118_DS_:
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
	BANKSEL	_inPtr
	INCF	_inPtr, F, B
	BNC	_31119_DS_
; removed redundant BANKSEL
	INCF	(_inPtr + 1), F, B
_31119_DS_:
	BNC	_41120_DS_
	BANKSEL	(_inPtr + 2)
	INCF	(_inPtr + 2), F, B
_41120_DS_:
;	.line	427; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	for (i=0;i<bufferSize;i++) {
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00321_DS_
_00325_DS_:
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
S_main__InDataStage	code
_InDataStage:
;	.line	364; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	void InDataStage(unsigned char ep) {
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
;	.line	371; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(wCount < EP0_BUFFER_SIZE)
	MOVLW	0x00
	BANKSEL	(_wCount + 1)
	SUBWF	(_wCount + 1), W, B
	BNZ	_00310_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	_wCount, W, B
_00310_DS_:
	BC	_00298_DS_
;	.line	372; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	bufferSize = wCount;
	MOVFF	_wCount, r0x01
	MOVFF	(_wCount + 1), r0x02
	BRA	_00299_DS_
_00298_DS_:
;	.line	374; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	bufferSize = EP0_BUFFER_SIZE;
	MOVLW	0x40
	MOVWF	r0x01
	CLRF	r0x02
_00299_DS_:
;	.line	382; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(ep).Stat.uc &= ~(BDS_BC8 | BDS_BC9);
	RLNCF	r0x00, W
	ANDLW	0xfe
	MOVWF	r0x03
	INCF	r0x03, W
; #	MOVWF	r0x00
; #;;multiply lit val:0x04 by variable r0x00 and store in r0x00
; #;;Unrolled 8 X 8 multiplication
; #;;FIXME: the function does not support result==WREG
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
;	.line	383; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(ep).Stat.uc |= (byte)((bufferSize & 0x0300) >> 8);
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
;	.line	384; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(ep).Cnt = (byte)(bufferSize & 0xFF);
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x04, F
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	MOVF	r0x01, W
	MOVWF	r0x05
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x05, INDF0
;	.line	385; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	EP_IN_BD(ep).ADDR = PTR16(&controlTransferBuffer);
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
;	.line	390; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = wCount - bufferSize;
	MOVF	r0x01, W
	BANKSEL	_wCount
	SUBWF	_wCount, F, B
	MOVF	r0x02, W
; removed redundant BANKSEL
	SUBWFB	(_wCount + 1), F, B
;	.line	393; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	inPtr = (byte *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_inPtr + 1)
	MOVWF	(_inPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_inPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_inPtr + 2), B
;	.line	398; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	for (i=0;i<bufferSize;i++) {
	CLRF	r0x00
_00300_DS_:
	MOVFF	r0x00, r0x03
	CLRF	r0x04
	MOVF	r0x02, W
	SUBWF	r0x04, W
	BNZ	_00316_DS_
	MOVF	r0x01, W
	SUBWF	r0x03, W
_00316_DS_:
	BC	_00304_DS_
;	.line	402; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	*inPtr++ = *outPtr++;
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
	BNC	_51121_DS_
; removed redundant BANKSEL
	INCF	(_outPtr + 1), F, B
_51121_DS_:
	BNC	_61122_DS_
	BANKSEL	(_outPtr + 2)
	INCF	(_outPtr + 2), F, B
_61122_DS_:
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	BANKSEL	_inPtr
	INCF	_inPtr, F, B
	BNC	_71123_DS_
; removed redundant BANKSEL
	INCF	(_inPtr + 1), F, B
_71123_DS_:
	BNC	_81124_DS_
	BANKSEL	(_inPtr + 2)
	INCF	(_inPtr + 2), F, B
_81124_DS_:
;	.line	398; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	for (i=0;i<bufferSize;i++) {
	INCF	r0x00, F
	BRA	_00300_DS_
_00304_DS_:
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
S_main__ProcessStandardRequest	code
_ProcessStandardRequest:
;	.line	253; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	void ProcessStandardRequest(void) {
	MOVFF	r0x00, POSTDEC1
;	.line	254; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte request = SetupPacket.bRequest;
	MOVFF	(_SetupPacket + 1), r0x00
	BANKSEL	_SetupPacket
;	.line	256; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if((SetupPacket.bmRequestType & 0x60) != 0x00)
	MOVF	_SetupPacket, W, B
; #	ANDLW	0x60
; #	BTFSC	STATUS, 2
; #	GOTO	_00231_DS_
; #	GOTO	_00263_DS_
; #	MOVF	r0x00, W
;	.line	259; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	return;
	ANDLW	0x60
;	.line	261; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (request == SET_ADDRESS) {
	BTFSS	STATUS, 2
	BRA	_00263_DS_
	MOVF	r0x00, W
	XORLW	0x05
	BNZ	_00261_DS_
;	.line	269; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	270; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	deviceState = ADDRESS;
	MOVLW	0x04
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
;	.line	271; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	deviceAddress = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _deviceAddress
	BRA	_00263_DS_
_00261_DS_:
;	.line	273; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (request == GET_DESCRIPTOR) {
	MOVF	r0x00, W
	XORLW	0x06
	BNZ	_00258_DS_
;	.line	274; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	GetDescriptor();
	CALL	_GetDescriptor
	BRA	_00263_DS_
_00258_DS_:
;	.line	276; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (request == SET_CONFIGURATION) {
	MOVF	r0x00, W
	XORLW	0x09
	BNZ	_00255_DS_
;	.line	280; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	281; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	currentConfiguration = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _currentConfiguration
	BANKSEL	_currentConfiguration
;	.line	284; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (currentConfiguration == 0)
	MOVF	_currentConfiguration, W, B
	BNZ	_00233_DS_
;	.line	287; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	deviceState = ADDRESS;
	MOVLW	0x04
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	BRA	_00263_DS_
_00233_DS_:
;	.line	290; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	deviceState = CONFIGURED;
	MOVLW	0x05
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
;	.line	300; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	CDCInitEndpoint();
	CALL	_CDCInitEndpoint
	BRA	_00263_DS_
_00255_DS_:
;	.line	310; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (request == GET_CONFIGURATION) {
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00252_DS_
;	.line	314; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	315; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	outPtr = (byte*)&currentConfiguration;
	MOVLW	HIGH(_currentConfiguration)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_currentConfiguration)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	316; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = 1;
	MOVLW	0x01
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00263_DS_
_00252_DS_:
;	.line	318; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (request == GET_STATUS) {
	MOVF	r0x00, W
	BNZ	_00249_DS_
;	.line	319; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	GetStatus();
	CALL	_GetStatus
	BRA	_00263_DS_
_00249_DS_:
;	.line	321; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if ((request == CLEAR_FEATURE) ||
	MOVF	r0x00, W
	XORLW	0x01
	BZ	_00244_DS_
;	.line	322; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	(request == SET_FEATURE)) {
	MOVF	r0x00, W
	XORLW	0x03
	BNZ	_00245_DS_
_00244_DS_:
;	.line	323; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	SetFeature();
	CALL	_SetFeature
	BRA	_00263_DS_
_00245_DS_:
;	.line	325; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (request == GET_INTERFACE) {
	MOVF	r0x00, W
	XORLW	0x0a
	BNZ	_00242_DS_
;	.line	331; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BANKSEL	_controlTransferBuffer
;	.line	332; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	controlTransferBuffer[0] = 0;
	CLRF	_controlTransferBuffer, B
;	.line	333; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	outPtr = (byte *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	334; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = 1;
	MOVLW	0x01
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00263_DS_
_00242_DS_:
;	.line	336; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (request == SET_INTERFACE) {
	MOVF	r0x00, W
	XORLW	0x0b
	BNZ	_00263_DS_
;	.line	341; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
_00263_DS_:
;	.line	348; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (request == SYNCH_FRAME) {
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__SetFeature	code
_SetFeature:
;	.line	209; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	static void SetFeature(void) {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	210; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte recipient = SetupPacket.bmRequestType & 0x1F;
	MOVLW	0x1f
	BANKSEL	_SetupPacket
	ANDWF	_SetupPacket, W, B
	MOVWF	r0x00
;	.line	211; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte feature = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), r0x01
;	.line	216; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (recipient == 0x00) {
	MOVF	r0x00, W
	BNZ	_00200_DS_
;	.line	218; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (feature == DEVICE_REMOTE_WAKEUP) {
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00215_DS_
	BRA	_00202_DS_
_00215_DS_:
;	.line	219; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BANKSEL	(_SetupPacket + 1)
;	.line	220; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (SetupPacket.bRequest == SET_FEATURE)
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x03
	BNZ	_00182_DS_
;	.line	221; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	remoteWakeup = 1;
	MOVLW	0x01
	BANKSEL	_remoteWakeup
	MOVWF	_remoteWakeup, B
	BRA	_00202_DS_
_00182_DS_:
	BANKSEL	_remoteWakeup
;	.line	223; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	remoteWakeup = 0;
	CLRF	_remoteWakeup, B
	BRA	_00202_DS_
_00200_DS_:
;	.line	227; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (recipient == 0x02) {
	MOVF	r0x00, W
	XORLW	0x02
	BZ	_00219_DS_
	BRA	_00202_DS_
_00219_DS_:
;	.line	229; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte endpointNum = SetupPacket.wIndex0 & 0x0F;
	MOVLW	0x0f
	BANKSEL	(_SetupPacket + 4)
	ANDWF	(_SetupPacket + 4), W, B
	MOVWF	r0x00
;	.line	230; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte endpointDir = SetupPacket.wIndex0 & 0x80;
	MOVLW	0x80
; removed redundant BANKSEL
	ANDWF	(_SetupPacket + 4), W, B
	MOVWF	r0x02
;	.line	231; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if ((feature == ENDPOINT_HALT) && (endpointNum != 0)) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00202_DS_
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00202_DS_
;	.line	233; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
; ;multiply lit val:0x08 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	236; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	inPtr = (byte *)&EP_OUT_BD(0) + (endpointNum * 8);
	MOVF	r0x00, W
	MULLW	0x08
	MOVFF	PRODL, r0x00
	MOVFF	PRODH, r0x01
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x01, F
	MOVF	r0x01, W
	BANKSEL	(_inPtr + 1)
	MOVWF	(_inPtr + 1), B
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	_inPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_inPtr + 2), B
;	.line	237; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (endpointDir)
	MOVF	r0x02, W
	BZ	_00187_DS_
;	.line	238; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	inPtr += 4;
	MOVLW	0x04
; removed redundant BANKSEL
	ADDWF	_inPtr, F, B
	MOVLW	0x00
; removed redundant BANKSEL
	ADDWFC	(_inPtr + 1), F, B
; removed redundant BANKSEL
	ADDWFC	(_inPtr + 2), F, B
_00187_DS_:
	BANKSEL	(_SetupPacket + 1)
;	.line	240; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(SetupPacket.bRequest == SET_FEATURE)
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x03
	BNZ	_00192_DS_
;	.line	241; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	*inPtr = 0x84;
	MOVFF	_inPtr, r0x00
	MOVFF	(_inPtr + 1), r0x01
	MOVFF	(_inPtr + 2), r0x03
	MOVLW	0x84
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x03, W
	CALL	__gptrput1
	BRA	_00202_DS_
_00192_DS_:
;	.line	243; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(endpointDir == 1)
	MOVF	r0x02, W
	XORLW	0x01
	BNZ	_00189_DS_
;	.line	244; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	*inPtr = 0x00;
	MOVFF	_inPtr, r0x00
	MOVFF	(_inPtr + 1), r0x01
	MOVFF	(_inPtr + 2), r0x02
	CLRF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BRA	_00202_DS_
_00189_DS_:
;	.line	246; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	*inPtr = 0x88;
	MOVFF	_inPtr, r0x00
	MOVFF	(_inPtr + 1), r0x01
	MOVFF	(_inPtr + 2), r0x02
	MOVLW	0x88
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00202_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__GetStatus	code
_GetStatus:
;	.line	164; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	static void GetStatus(void) {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	166; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte recipient = SetupPacket.bmRequestType & 0x1F;
	MOVLW	0x1f
	BANKSEL	_SetupPacket
	ANDWF	_SetupPacket, W, B
	MOVWF	r0x00
	BANKSEL	_controlTransferBuffer
;	.line	170; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	controlTransferBuffer[0] = 0;
	CLRF	_controlTransferBuffer, B
; removed redundant BANKSEL
;	.line	171; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	controlTransferBuffer[1] = 0;
	CLRF	(_controlTransferBuffer + 1), B
;	.line	174; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (recipient == 0x00) {
	MOVF	r0x00, W
	BNZ	_00153_DS_
;	.line	176; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BANKSEL	_selfPowered
;	.line	178; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (selfPowered)
	MOVF	_selfPowered, W, B
	BZ	_00140_DS_
;	.line	179; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	controlTransferBuffer[0] |= 0x01;
	MOVLW	0x01
	BANKSEL	_controlTransferBuffer
	IORWF	_controlTransferBuffer, W, B
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	_controlTransferBuffer, B
_00140_DS_:
	BANKSEL	_remoteWakeup
;	.line	180; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (remoteWakeup)
	MOVF	_remoteWakeup, W, B
	BTFSC	STATUS, 2
	BRA	_00154_DS_
;	.line	181; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	controlTransferBuffer[0] |= 0x02;
	MOVLW	0x02
	BANKSEL	_controlTransferBuffer
	IORWF	_controlTransferBuffer, W, B
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	_controlTransferBuffer, B
	BRA	_00154_DS_
_00153_DS_:
;	.line	183; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (recipient == 0x01) {
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00150_DS_
;	.line	185; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BRA	_00154_DS_
_00150_DS_:
;	.line	187; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (recipient == 0x02) {
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00154_DS_
;	.line	189; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte endpointNum = SetupPacket.wIndex0 & 0x0F;
	MOVLW	0x0f
	BANKSEL	(_SetupPacket + 4)
	ANDWF	(_SetupPacket + 4), W, B
	MOVWF	r0x00
;	.line	190; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte endpointDir = SetupPacket.wIndex0 & 0x80;
	MOVLW	0x80
; removed redundant BANKSEL
	ANDWF	(_SetupPacket + 4), W, B
	MOVWF	r0x01
;	.line	191; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
; ;multiply lit val:0x08 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	194; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	inPtr = (byte *)&EP_OUT_BD(0) + (endpointNum * 8);
	MOVF	r0x00, W
	MULLW	0x08
	MOVFF	PRODL, r0x00
	MOVFF	PRODH, r0x02
	MOVLW	LOW(_ep_bdt)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ep_bdt)
	ADDWFC	r0x02, F
	MOVF	r0x02, W
	BANKSEL	(_inPtr + 1)
	MOVWF	(_inPtr + 1), B
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	_inPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_inPtr + 2), B
;	.line	195; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (endpointDir)
	MOVF	r0x01, W
	BZ	_00144_DS_
;	.line	196; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	inPtr += 4;
	MOVLW	0x04
; removed redundant BANKSEL
	ADDWF	_inPtr, F, B
	MOVLW	0x00
; removed redundant BANKSEL
	ADDWFC	(_inPtr + 1), F, B
; removed redundant BANKSEL
	ADDWFC	(_inPtr + 2), F, B
_00144_DS_:
;	.line	197; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(*inPtr & BDS_BSTALL)
	MOVFF	_inPtr, r0x00
	MOVFF	(_inPtr + 1), r0x01
	MOVFF	(_inPtr + 2), r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	BTFSS	r0x00, 2
	BRA	_00154_DS_
;	.line	198; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	controlTransferBuffer[0] = 0x01;
	MOVLW	0x01
	BANKSEL	_controlTransferBuffer
	MOVWF	_controlTransferBuffer, B
_00154_DS_:
	BANKSEL	_requestHandled
;	.line	201; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (requestHandled) {
	MOVF	_requestHandled, W, B
	BZ	_00157_DS_
;	.line	202; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	outPtr = (byte *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	203; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = 2;
	MOVLW	0x02
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
_00157_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__GetDescriptor	code
_GetDescriptor:
;	.line	97; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	static void GetDescriptor(void) {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	BANKSEL	_SetupPacket
;	.line	101; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if(SetupPacket.bmRequestType == 0x80) {
	MOVF	_SetupPacket, W, B
	XORLW	0x80
	BZ	_00126_DS_
	BRA	_00118_DS_
_00126_DS_:
;	.line	102; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte descriptorType  = SetupPacket.wValue1;
	MOVFF	(_SetupPacket + 3), r0x00
;	.line	103; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	byte descriptorIndex = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), r0x01
;	.line	105; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	if (descriptorType == DEVICE_DESCRIPTOR) {
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00114_DS_
;	.line	109; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	110; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	outPtr = (byte *)&libdevice_descriptor;
	MOVLW	LOW(_libdevice_descriptor)
	BANKSEL	_outPtr
	MOVWF	_outPtr, B
	MOVLW	HIGH(_libdevice_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 1), B
	MOVLW	UPPER(_libdevice_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	111; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = sizeof(USB_Device_Descriptor);
	MOVLW	0x12
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00118_DS_
_00114_DS_:
;	.line	113; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (descriptorType == CONFIGURATION_DESCRIPTOR) {
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00111_DS_
;	.line	117; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	128; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	outPtr = (byte *)&libconfiguration_descriptor;
	MOVLW	LOW(_libconfiguration_descriptor)
	BANKSEL	_outPtr
	MOVWF	_outPtr, B
	MOVLW	HIGH(_libconfiguration_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 1), B
	MOVLW	UPPER(_libconfiguration_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	130; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = libconfiguration_descriptor.Header.wTotalLength;
	MOVLW	LOW(_libconfiguration_descriptor + 2)
	MOVWF	TBLPTRL
	MOVLW	HIGH(_libconfiguration_descriptor + 2)
	MOVWF	TBLPTRH
	MOVLW	UPPER(_libconfiguration_descriptor + 2)
	MOVWF	TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, _wCount
	TBLRD*+	
	MOVFF	TABLAT, (_wCount + 1)
	BRA	_00118_DS_
_00111_DS_:
;	.line	136; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (descriptorType == STRING_DESCRIPTOR) {
	MOVF	r0x00, W
	XORLW	0x03
	BNZ	_00108_DS_
;	.line	140; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
; ;multiply lit val:0x03 by variable r0x01 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	141; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	outPtr = (byte *)&libstring_descriptor[descriptorIndex];
	MOVF	r0x01, W
	MULLW	0x03
	MOVFF	PRODL, r0x01
	MOVLW	LOW(_libstring_descriptor)
	ADDWF	r0x01, W
	BANKSEL	_outPtr
	MOVWF	_outPtr, B
; removed redundant BANKSEL
	CLRF	(_outPtr + 1), B
	MOVLW	HIGH(_libstring_descriptor)
; removed redundant BANKSEL
	ADDWFC	(_outPtr + 1), F, B
; removed redundant BANKSEL
	CLRF	(_outPtr + 2), B
	MOVLW	UPPER(_libstring_descriptor)
; removed redundant BANKSEL
	ADDWFC	(_outPtr + 2), F, B
;	.line	142; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	wCount = *outPtr;
	MOVFF	_outPtr, r0x01
	MOVFF	(_outPtr + 1), r0x02
	MOVFF	(_outPtr + 2), r0x03
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget1
	MOVWF	r0x01
	MOVFF	r0x01, _wCount
	BANKSEL	(_wCount + 1)
	CLRF	(_wCount + 1), B
	BRA	_00118_DS_
_00108_DS_:
;	.line	144; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	else if (descriptorType == DEVICE_QUALIFIER_DESCRIPTOR) {
	MOVF	r0x00, W
	XORLW	0x06
	BNZ	_00118_DS_
;	.line	148; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
_00118_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block for Ival
	code
_libdevice_descriptor:
	DB	0x12, 0x01, 0x00, 0x02, 0x02, 0x00, 0x00, 0x40, 0xd8, 0x04, 0xab, 0xfe
	DB	0x00, 0x00, 0x00, 0x01, 0x00, 0x01
; ; Starting pCode block for Ival
_libconfiguration_descriptor:
	DB	0x09, 0x02, 0x43, 0x00, 0x02, 0x01, 0x00, 0x03, 0x14, 0x09, 0x04, 0x00
	DB	0x00, 0x01, 0x02, 0x02, 0x01, 0x00, 0x05, 0x24, 0x00, 0x10, 0x01, 0x04
	DB	0x24, 0x02, 0x00, 0x05, 0x24, 0x06, 0x00, 0x01, 0x05, 0x24, 0x01, 0x00
	DB	0x01, 0x07, 0x05, 0x82, 0x03, 0x10, 0x00, 0x02, 0x09, 0x04, 0x01, 0x00
	DB	0x02, 0x0a, 0x00, 0x00, 0x00, 0x07, 0x05, 0x03, 0x02, 0x40, 0x00, 0x00
	DB	0x07, 0x05, 0x83, 0x02, 0x40, 0x00, 0x00
; ; Starting pCode block for Ival
_libstring_descriptor:
	DB	0x28, 0x03, 0x50, 0x0c, 0x03, 0x50, 0x0c, 0x03, 0x50, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; ; Starting pCode block
__str_0:
	DB	0x28, 0x6e, 0x75, 0x6c, 0x6c, 0x29, 0x00
; ; Starting pCode block
__str_1:
	DB	0x6e, 0x6f, 0x74, 0x20, 0x79, 0x65, 0x74, 0x20, 0x69, 0x6d, 0x70, 0x6c
	DB	0x65, 0x6d, 0x65, 0x6e, 0x74, 0x65, 0x64, 0x00, 0x00
; ; Starting pCode block
__str_2:
	DB	0x0a, 0x0d, 0x00
; ; Starting pCode block
__str_3:
	DB	0x25, 0x64, 0x00
; ; Starting pCode block
__str_4:
	DB	0x25, 0x78, 0x00
; ; Starting pCode block
__str_5:
	DB	0x25, 0x6f, 0x00
; ; Starting pCode block
__str_6:
	DB	0x25, 0x62, 0x00
; ; Starting pCode block
__str_7:
	DB	0x25, 0x63, 0x00
; ; Starting pCode block
__str_8:
	DB	0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x00


; Statistics:
; code size:	10548 (0x2934) bytes ( 8.05%)
;           	 5274 (0x149a) words
; udata size:	  809 (0x0329) bytes (45.15%)
; access size:	   27 (0x001b) bytes


	end
