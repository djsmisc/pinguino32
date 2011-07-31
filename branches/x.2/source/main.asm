;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Aug  9 2009) (UNIX)
; This file was generated Sun Jul 31 19:51:45 2011
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f2550

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _OneWireReset
	global _OneWireReadBit
	global _OneWireWriteBit
	global _DS18B20Read
	global _DS18B20Configure
	global _DS18B20MatchRom
	global _DS18B20ReadRom
	global _DS18B20Find
	global _DS18B20GetFirst
	global _DS18B20GetNext
	global _DS18B20_crc
	global _DS18B20Rom
	global _ROM
	global _lastDiscrep
	global _doneFlag
	global _numROMs
	global _dowcrc
	global _TXBuffer
	global _RXbuffer
	global _usbrx
	global _usbwp
	global _usbrp
	global _ep2_num_bytes_to_send
	global _ep2_source_data
	global _Delayms
	global _Delayus
	global _digitalwrite
	global _digitalread
	global _pinmode
	global _toggle
	global _OneWireRead
	global _OneWireWrite
	global _usbavailable
	global _epapin_init
	global _prepare_ep2_in
	global _usbsend
	global _epap_in
	global _usbread
	global _epap_out
	global _epapout_init
	global _setup
	global _loop
	global _pinguino_main
	global _high_priority_isr
	global _low_priority_isr
	global _mask
	global _port
	global _dscrc_table

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput1
	extern __gptrput2
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
	extern _ep_bdt
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
	extern _dispatch_usb_event
	extern _fill_in_buffer
	extern _delay10ktcy
	extern __mulint
	extern __divuint
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
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


	idata
_lastDiscrep	db	0x00
_doneFlag	db	0x00


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


usb_buf	udata
_TXBuffer	res	64
_RXbuffer	res	64

udata_main_0	udata
_last_send_was_null	res	1

udata_main_1	udata
_DS18B20Rom	res	48

udata_main_2	udata
_numROMs	res	1

udata_main_3	udata
_ROM	res	8

udata_main_4	udata
_dowcrc	res	1

udata_main_5	udata
_usbwp	res	1

udata_main_6	udata
_usbrp	res	1

udata_main_7	udata
_ep2_num_bytes_to_send	res	2

udata_main_8	udata
_ep2_source_data	res	3

udata_main_9	udata
_usbrx	res	64

udata_main_10	udata
_loop_t_1_1	res	4

udata_main_11	udata
_loop_temp_1_1	res	4

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
;	.line	154; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	if(PIR2bits.USBIF)
	BTFSS	_PIR2bits, 5
	BRA	_00620_DS_
;	.line	156; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	dispatch_usb_event();
	CALL	_dispatch_usb_event
;	.line	157; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	UIRbits.SOFIF = 0;
	BCF	_UIRbits, 6
;	.line	158; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	UIRbits.URSTIF = 0;
	BCF	_UIRbits, 0
;	.line	159; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	PIR2bits.USBIF = 0;
	BCF	_PIR2bits, 5
;	.line	160; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	UEIR = 0;
	CLRF	_UEIR
_00620_DS_:
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
;	.line	66; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	PIE2bits.USBIE  = 1;
	BSF	_PIE2bits, 5
;	.line	67; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	INTCONbits.PEIE = 1;
	BSF	_INTCONbits, 6
;	.line	68; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	INTCONbits.GIE  = 1;
	BSF	_INTCONbits, 7
;	.line	71; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	setup();
	CALL	_setup
_00611_DS_:
;	.line	123; /home/mandon/pinguino32X2/trunk/x.2/source/main.c	loop();
	CALL	_loop
	BRA	_00611_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	29; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	void loop()
	MOVFF	r0x00, POSTDEC1
;	.line	36; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	if (DS18B20Read(ONEWIREBUS, SKIPROM, RES12BIT, &t))
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_loop_t_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_loop_t_1_1)
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xcc
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_DS18B20Read
	MOVWF	r0x00
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BZ	_00605_DS_
	BANKSEL	_loop_t_1_1
;	.line	39; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	temp[0] = t.sign;			
	MOVF	_loop_t_1_1, W, B
	BANKSEL	_loop_temp_1_1
	MOVWF	_loop_temp_1_1, B
	BANKSEL	(_loop_t_1_1 + 1)
;	.line	40; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	temp[1] = t.integer;		
	MOVF	(_loop_t_1_1 + 1), W, B
	BANKSEL	(_loop_temp_1_1 + 1)
	MOVWF	(_loop_temp_1_1 + 1), B
	BANKSEL	(_loop_t_1_1 + 3)
;	.line	41; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	temp[2] = high8(t.fraction);	
	MOVF	(_loop_t_1_1 + 3), W, B
	BANKSEL	(_loop_temp_1_1 + 2)
	MOVWF	(_loop_temp_1_1 + 2), B
	BANKSEL	(_loop_t_1_1 + 2)
;	.line	42; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	temp[3] = low8(t.fraction);
	MOVF	(_loop_t_1_1 + 2), W, B
	BANKSEL	(_loop_temp_1_1 + 3)
	MOVWF	(_loop_temp_1_1 + 3), B
;	.line	43; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	usbsend(temp, 4);			
	CLRF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_loop_temp_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_loop_temp_1_1)
	MOVWF	POSTDEC1
	CALL	_usbsend
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	45; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	Delayms(1000);			
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVLW	0x04
	ADDWF	FSR1L, F
_00605_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	27; /home/mandon/pinguino32X2/trunk/x.2/source/user.c	}
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	146; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_OUT_BD(1).Cnt = EP1_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 9)
	MOVWF	(_ep_bdt + 9), B
;	.line	147; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_OUT_BD(1).ADR = (uchar __data *)&RXbuffer;
	MOVLW	LOW(_RXbuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 10), B
	MOVLW	HIGH(_RXbuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 11), B
;	.line	148; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_OUT_BD(1).Stat.uc = BDS_USIE | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 8), B
;	.line	149; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	UEP1 = EPHSHK_EN | EPOUTEN_EN | EPCONDIS_EN;       	// Init EPAPPLI as an OUT EP
	MOVLW	0x1c
	MOVWF	_UEP1
; #	MOVLW	0x01
; #	MOVWF	_usbwp, B
; #	MOVLW	0x01
;	.line	150; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	usbwp=1;						// init pointer for rx buffer pinguino
	MOVLW	0x01
	BANKSEL	_usbwp
;	.line	151; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	usbrp=1;
	MOVWF	_usbwp, B
	BANKSEL	_usbrp
	MOVWF	_usbrp, B
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	110; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	void epap_out(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	116; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if((EP_OUT_BD(1).Cnt >= 1) && ( EP_OUT_BD(1).Cnt<EP1_BUFFER_SIZE))
	MOVLW	0x01
	BANKSEL	(_ep_bdt + 9)
	SUBWF	(_ep_bdt + 9), W, B
	BTFSS	STATUS, 0
	BRA	_00562_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	(_ep_bdt + 9), W, B
	BTFSC	STATUS, 0
	BRA	_00562_DS_
;	.line	118; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	for (cpt=0;cpt<EP_OUT_BD(1).Cnt;cpt++)
	CLRF	r0x00
_00565_DS_:
	BANKSEL	(_ep_bdt + 9)
	MOVF	(_ep_bdt + 9), W, B
	SUBWF	r0x00, W
	BC	_00568_DS_
;	.line	120; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	caractere=RXbuffer[cpt];
	MOVLW	LOW(_RXbuffer)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_RXbuffer)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	BANKSEL	_usbwp
;	.line	121; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if (usbwp!=USBRXSIZE-1) newusbwp=usbwp+1;               
	MOVF	_usbwp, W, B
	XORLW	0x3f
	BZ	_00552_DS_
_00584_DS_:
	BANKSEL	_usbwp
	INCF	_usbwp, W, B
	MOVWF	r0x02
	BRA	_00553_DS_
_00552_DS_:
;	.line	122; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	else newusbwp=1;
	MOVLW	0x01
	MOVWF	r0x02
_00553_DS_:
	BANKSEL	_usbrp
;	.line	123; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if (usbrp!=newusbwp) usbrx[usbwp++]=caractere;
	MOVF	_usbrp, W, B
	XORWF	r0x02, W
	BZ	_00555_DS_
	MOVFF	_usbwp, r0x02
	BANKSEL	_usbwp
	INCF	_usbwp, F, B
	CLRF	r0x03
	MOVLW	LOW(_usbrx)
	ADDWF	r0x02, F
	MOVLW	HIGH(_usbrx)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
_00555_DS_:
	BANKSEL	_usbwp
;	.line	124; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if (usbwp==USBRXSIZE) usbwp=1;
	MOVF	_usbwp, W, B
	XORLW	0x40
	BNZ	_00567_DS_
	MOVLW	0x01
	BANKSEL	_usbwp
	MOVWF	_usbwp, B
_00567_DS_:
;	.line	118; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	for (cpt=0;cpt<EP_OUT_BD(1).Cnt;cpt++)
	INCF	r0x00, F
	BRA	_00565_DS_
_00568_DS_:
;	.line	126; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_OUT_BD(1).Cnt = EP1_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 9)
	MOVWF	(_ep_bdt + 9), B
; removed redundant BANKSEL
;	.line	127; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if(EP_OUT_BD(1).Stat.DTS == 0)
	BTFSC	(_ep_bdt + 8), 6, B
	BRA	_00559_DS_
;	.line	129; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_OUT_BD(1).Stat.uc = BDS_USIE | BDS_DAT1 | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 8), B
	BRA	_00569_DS_
_00559_DS_:
;	.line	133; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_OUT_BD(1).Stat.uc = BDS_USIE | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
	BANKSEL	(_ep_bdt + 8)
	MOVWF	(_ep_bdt + 8), B
	BRA	_00569_DS_
_00562_DS_:
;	.line	138; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_OUT_BD(1).Cnt = EP1_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 9)
	MOVWF	(_ep_bdt + 9), B
;	.line	139; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_OUT_BD(1).ADR = (uchar __data *)&RXbuffer;
	MOVLW	LOW(_RXbuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 10), B
	MOVLW	HIGH(_RXbuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 11), B
;	.line	140; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_OUT_BD(1).Stat.uc = BDS_USIE | BDS_BSTALL;
	MOVLW	0x84
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 8), B
_00569_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__usbread	code
_usbread:
;	.line	97; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	uchar usbread()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	99; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	uchar caractere=0;
	CLRF	r0x00
;	.line	101; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if (usbavailable)
	MOVF	LOW(_usbavailable), W
	IORWF	HIGH(_usbavailable), W
	IORWF	UPPER(_usbavailable), W
	BZ	_00540_DS_
;	.line	103; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	caractere=usbrx[usbrp++];
	MOVFF	_usbrp, r0x01
	BANKSEL	_usbrp
	INCF	_usbrp, F, B
	CLRF	r0x02
	MOVLW	LOW(_usbrx)
	ADDWF	r0x01, F
	MOVLW	HIGH(_usbrx)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
; removed redundant BANKSEL
;	.line	104; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if (usbrp==USBRXSIZE)
	MOVF	_usbrp, W, B
	XORLW	0x40
	BNZ	_00540_DS_
;	.line	105; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	usbrp=1;
	MOVLW	0x01
	BANKSEL	_usbrp
	MOVWF	_usbrp, B
_00540_DS_:
;	.line	107; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	return(caractere);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
	BANKSEL	_ep2_num_bytes_to_send
;	.line	78; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if((ep2_num_bytes_to_send == 0) && last_send_was_null)
	MOVF	_ep2_num_bytes_to_send, W, B
; removed redundant BANKSEL
	IORWF	(_ep2_num_bytes_to_send + 1), W, B
	BNZ	_00521_DS_
; #	MOVF	_last_send_was_null, W, B
; #	BTFSC	STATUS, 2
; #	GOTO	_00521_DS_
; #	GOTO	_00526_DS_
; #	MOVLW	0x00
	BANKSEL	_last_send_was_null
;	.line	80; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	return;
	MOVF	_last_send_was_null, W, B
;	.line	82; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	last_send_was_null = (ep2_num_bytes_to_send < EP2_BUFFER_SIZE);
	BNZ	_00526_DS_
_00521_DS_:
	MOVLW	0x00
	BANKSEL	(_ep2_num_bytes_to_send + 1)
	SUBWF	(_ep2_num_bytes_to_send + 1), W, B
	BNZ	_00532_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	_ep2_num_bytes_to_send, W, B
_00532_DS_:
	BTG	STATUS, 0
	BANKSEL	_last_send_was_null
	CLRF	_last_send_was_null, B
	RLCF	_last_send_was_null, F, B
; #	MOVF	_ep2_num_bytes_to_send, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	BANKSEL	_ep2_num_bytes_to_send
;	.line	83; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_IN_BD(2).Cnt = ep2_num_bytes_to_send;
	MOVF	_ep2_num_bytes_to_send, W, B
	BANKSEL	(_ep_bdt + 21)
	MOVWF	(_ep_bdt + 21), B
;	.line	84; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	fill_in_buffer(2, &ep2_source_data, EP2_BUFFER_SIZE, &ep2_num_bytes_to_send);
	MOVLW	0x80
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_ep2_num_bytes_to_send)
	MOVWF	POSTDEC1
	MOVLW	LOW(_ep2_num_bytes_to_send)
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_ep2_source_data)
	MOVWF	POSTDEC1
	MOVLW	LOW(_ep2_source_data)
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_fill_in_buffer
	MOVLW	0x09
	ADDWF	FSR1L, F
	BANKSEL	(_ep_bdt + 20)
;	.line	85; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if(EP_IN_BD(2).Stat.DTS == 0)
	BTFSC	(_ep_bdt + 20), 6, B
	BRA	_00524_DS_
;	.line	87; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_IN_BD(2).Stat.uc = BDS_USIE | BDS_DAT1 | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 20), B
	BRA	_00526_DS_
_00524_DS_:
;	.line	91; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_IN_BD(2).Stat.uc = BDS_USIE | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
	BANKSEL	(_ep_bdt + 20)
	MOVWF	(_ep_bdt + 20), B
_00526_DS_:
	RETURN	

; ; Starting pCode block
S_main__usbsend	code
_usbsend:
;	.line	59; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	void usbsend(uchar *txpointer,uint length)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, _ep2_source_data
	MOVLW	0x03
	MOVFF	PLUSW2, (_ep2_source_data + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (_ep2_source_data + 2)
	MOVLW	0x05
	MOVFF	PLUSW2, _ep2_num_bytes_to_send
	MOVLW	0x06
	MOVFF	PLUSW2, (_ep2_num_bytes_to_send + 1)
;	.line	63; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	prepare_ep2_in();
	CALL	_prepare_ep2_in
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__prepare_ep2_in	code
_prepare_ep2_in:
;	.line	45; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	last_send_was_null = (ep2_num_bytes_to_send < EP2_BUFFER_SIZE);
	MOVLW	0x00
	BANKSEL	(_ep2_num_bytes_to_send + 1)
	SUBWF	(_ep2_num_bytes_to_send + 1), W, B
	BNZ	_00510_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	_ep2_num_bytes_to_send, W, B
_00510_DS_:
	BTG	STATUS, 0
	BANKSEL	_last_send_was_null
	CLRF	_last_send_was_null, B
	RLCF	_last_send_was_null, F, B
; #	MOVF	_ep2_num_bytes_to_send, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	BANKSEL	_ep2_num_bytes_to_send
;	.line	46; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_IN_BD(2).Cnt = ep2_num_bytes_to_send;
	MOVF	_ep2_num_bytes_to_send, W, B
	BANKSEL	(_ep_bdt + 21)
	MOVWF	(_ep_bdt + 21), B
;	.line	47; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_IN_BD(2).ADR = (uchar __data *)&TXBuffer;
	MOVLW	LOW(_TXBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 22), B
	MOVLW	HIGH(_TXBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 23), B
;	.line	48; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	fill_in_buffer(2, &ep2_source_data, EP2_BUFFER_SIZE, &ep2_num_bytes_to_send);
	MOVLW	0x80
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_ep2_num_bytes_to_send)
	MOVWF	POSTDEC1
	MOVLW	LOW(_ep2_num_bytes_to_send)
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_ep2_source_data)
	MOVWF	POSTDEC1
	MOVLW	LOW(_ep2_source_data)
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_fill_in_buffer
	MOVLW	0x09
	ADDWF	FSR1L, F
	BANKSEL	(_ep_bdt + 20)
;	.line	49; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	if(EP_IN_BD(2).Stat.DTS == 0)
	BTFSC	(_ep_bdt + 20), 6, B
	BRA	_00504_DS_
;	.line	51; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_IN_BD(2).Stat.uc = BDS_USIE | BDS_DAT1 | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 20), B
	BRA	_00506_DS_
_00504_DS_:
;	.line	55; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_IN_BD(2).Stat.uc = BDS_USIE | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
	BANKSEL	(_ep_bdt + 20)
	MOVWF	(_ep_bdt + 20), B
_00506_DS_:
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	39; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	EP_IN_BD(2).Stat.uc = BDS_UCPU | BDS_DAT1 | BDS_DTSEN;
	MOVLW	0x48
	BANKSEL	(_ep_bdt + 20)
	MOVWF	(_ep_bdt + 20), B
;	.line	40; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	UEP2 = EPHSHK_EN | EPINEN_EN |  EPCONDIS_EN;
	MOVLW	0x1a
	MOVWF	_UEP2
	RETURN	

; ; Starting pCode block
S_main__usbavailable	code
_usbavailable:
;	.line	30; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	uchar usbavailable()
	MOVFF	r0x00, POSTDEC1
;	.line	32; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/usb.c	return (usbwp!=usbrp);
	CLRF	r0x00
	BANKSEL	_usbwp
	MOVF	_usbwp, W, B
	BANKSEL	_usbrp
	XORWF	_usbrp, W, B
	BNZ	_00493_DS_
	INCF	r0x00, F
_00493_DS_:
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
S_main__DS18B20_crc	code
_DS18B20_crc:
;	.line	420; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	u8 DS18B20_crc(u8 x)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	BANKSEL	_dowcrc
;	.line	431; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	dowcrc = dscrc_table[dowcrc^x];
	MOVF	_dowcrc, W, B
	XORWF	r0x00, F
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_dscrc_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_dscrc_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_dscrc_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, _dowcrc
; removed redundant BANKSEL
;	.line	432; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	return dowcrc;
	MOVF	_dowcrc, W, B
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__DS18B20GetNext	code
_DS18B20GetNext:
;	.line	341; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	u8 DS18B20GetNext(u8 pin)
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
;	.line	345; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	u8 k = 1;					// bit mask
	MOVLW	0x01
	MOVWF	r0x01
;	.line	347; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	u8 discrepMarker = 0;				// discrepancy marker
	CLRF	r0x02
;	.line	352; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	nxt = FALSE;					// set the next flag to false
	CLRF	r0x03
	BANKSEL	_dowcrc
;	.line	353; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	dowcrc = 0;					// reset the dowcrc
	CLRF	_dowcrc, B
;	.line	355; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	flag = OneWireReset(pin);			// reset the 1-wire
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReset
	INCF	FSR1L, F
	CLRF	r0x05
;	.line	356; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if(flag||doneFlag)				// no parts -> return false
	IORWF	r0x05, W
	BNZ	_00416_DS_
	BANKSEL	_doneFlag
	MOVF	_doneFlag, W, B
	BZ	_00417_DS_
_00416_DS_:
	BANKSEL	_lastDiscrep
;	.line	358; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	lastDiscrep = 0;			// reset the search
	CLRF	_lastDiscrep, B
;	.line	359; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	return FALSE;
	CLRF	WREG
	BRA	_00446_DS_
_00417_DS_:
;	.line	362; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, SEARCHROM);
	MOVLW	0xf0
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	363; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	do {
	CLRF	r0x04
	MOVLW	0x01
	MOVWF	r0x05
_00439_DS_:
;	.line	364; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	x = 0;
	CLRF	r0x06
;	.line	365; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if(OneWireReadBit(pin) == 1) x = 2;
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReadBit
	INCF	FSR1L, F
	XORLW	0x01
	BNZ	_00420_DS_
	MOVLW	0x02
	MOVWF	r0x06
_00420_DS_:
;	.line	367; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if(OneWireReadBit(pin) == 1 ) x |= 1;
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReadBit
	INCF	FSR1L, F
	XORLW	0x01
	BNZ	_00422_DS_
	BSF	r0x06, 0
_00422_DS_:
;	.line	368; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if(x == 3)
	MOVF	r0x06, W
	XORLW	0x03
	BNZ	_00469_DS_
	BRA	_00441_DS_
_00469_DS_:
;	.line	372; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if(x > 0)				// all devices coupled have 0 or 1
	MOVF	r0x06, W
	BZ	_00429_DS_
;	.line	373; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	g = x >> 1;			// bit write value for search
	RRNCF	r0x06, W
	ANDLW	0x7f
	MOVWF	r0x06
	BRA	_00430_DS_
_00429_DS_:
	BANKSEL	_lastDiscrep
;	.line	379; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if(m < lastDiscrep)
	MOVF	_lastDiscrep, W, B
	SUBWF	r0x05, W
	BC	_00424_DS_
;	.line	380; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	g = ( (ROM[n] & k) > 0);
	MOVLW	LOW(_ROM)
	ADDWF	r0x04, W
	MOVWF	r0x07
	CLRF	r0x08
	MOVLW	HIGH(_ROM)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	INDF0, r0x07
	MOVF	r0x01, W
	ANDWF	r0x07, F
	MOVF	r0x07, W
	BZ	_00448_DS_
	MOVLW	0x01
	MOVWF	r0x07
	BRA	_00449_DS_
_00448_DS_:
	CLRF	r0x07
_00449_DS_:
	MOVFF	r0x07, r0x06
	BRA	_00425_DS_
_00424_DS_:
;	.line	382; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	g = (m == lastDiscrep);	// if not then pick 0
	CLRF	r0x06
	MOVF	r0x05, W
	BANKSEL	_lastDiscrep
	XORWF	_lastDiscrep, W, B
	BNZ	_00425_DS_
	INCF	r0x06, F
_00425_DS_:
;	.line	384; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (g == 0) discrepMarker = m;
	MOVF	r0x06, W
	BNZ	_00430_DS_
	MOVFF	r0x05, r0x02
_00430_DS_:
;	.line	386; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (g == 1)	// isolate bit in ROM[n] with mask k
	MOVF	r0x06, W
	XORLW	0x01
	BNZ	_00432_DS_
;	.line	387; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	ROM[n] |= k;
	MOVLW	LOW(_ROM)
	ADDWF	r0x04, W
	MOVWF	r0x07
	CLRF	r0x08
	MOVLW	HIGH(_ROM)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	INDF0, r0x09
	MOVF	r0x01, W
	IORWF	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	r0x09, INDF0
	BRA	_00433_DS_
_00432_DS_:
;	.line	389; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	ROM[n] &= ~k;
	MOVLW	LOW(_ROM)
	ADDWF	r0x04, W
	MOVWF	r0x07
	CLRF	r0x08
	MOVLW	HIGH(_ROM)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	INDF0, r0x09
	COMF	r0x01, W
; #	MOVWF	r0x0a
; #	MOVF	r0x0a, W
	ANDWF	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	r0x09, INDF0
_00433_DS_:
;	.line	390; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWriteBit(pin, g);		// ROM search write
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWriteBit
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	391; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	m++;								// increment bit counter m
	INCF	r0x05, F
;	.line	392; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	k = k << 1;							// and shift the bit mask k
	BCF	STATUS, 0
	RLCF	r0x01, F
;	.line	393; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if(k == 0)							// if the mask is 0 then go to new ROM
	MOVF	r0x01, W
	BNZ	_00440_DS_
;	.line	395; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	DS18B20_crc(ROM[n]);			// accumulate the CRC
	MOVLW	LOW(_ROM)
	ADDWF	r0x04, W
	MOVWF	r0x06
	CLRF	r0x07
	MOVLW	HIGH(_ROM)
	ADDWFC	r0x07, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	INDF0, r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_DS18B20_crc
	INCF	FSR1L, F
;	.line	396; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	n++;
	INCF	r0x04, F
;	.line	397; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	k++;
	INCF	r0x01, F
_00440_DS_:
;	.line	400; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	} while (n < 8);							// loop until through all ROM bytes 0-7
	MOVLW	0x08
	SUBWF	r0x04, W
	BTFSS	STATUS, 0
	BRA	_00439_DS_
_00441_DS_:
;	.line	401; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if(m < 65 || dowcrc)						// if search was unsuccessful then
	MOVLW	0x41
	SUBWF	r0x05, W
	BNC	_00442_DS_
	BANKSEL	_dowcrc
	MOVF	_dowcrc, W, B
	BZ	_00443_DS_
_00442_DS_:
	BANKSEL	_lastDiscrep
;	.line	402; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	lastDiscrep=0;							// reset the last discrepancy to 0
	CLRF	_lastDiscrep, B
	BRA	_00444_DS_
_00443_DS_:
;	.line	405; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	lastDiscrep = discrepMarker;
	MOVFF	r0x02, _lastDiscrep
	BANKSEL	_doneFlag
;	.line	406; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	doneFlag = (lastDiscrep == 0);
	CLRF	_doneFlag, B
	BANKSEL	_lastDiscrep
	MOVF	_lastDiscrep, W, B
	BNZ	_00480_DS_
	BANKSEL	_doneFlag
	INCF	_doneFlag, F, B
_00480_DS_:
;	.line	407; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	nxt = TRUE;								// indicates search is not complete yet, more parts remain
	MOVLW	0x01
	MOVWF	r0x03
_00444_DS_:
;	.line	409; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	return nxt;
	MOVF	r0x03, W
_00446_DS_:
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
S_main__DS18B20GetFirst	code
_DS18B20GetFirst:
;	.line	326; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	u8 DS18B20GetFirst(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	BANKSEL	_lastDiscrep
;	.line	328; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	lastDiscrep = 0;			// reset the rom search last discrepancy global
	CLRF	_lastDiscrep, B
	BANKSEL	_doneFlag
;	.line	329; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	doneFlag = FALSE;
	CLRF	_doneFlag, B
;	.line	330; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	return DS18B20GetNext(pin);	// call Next and return its return value
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DS18B20GetNext
	INCF	FSR1L, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__DS18B20Find	code
_DS18B20Find:
;	.line	295; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	void DS18B20Find(u8 pin)
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
;	.line	299; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (!OneWireReset(pin))	// Detects presence of devices
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReset
	MOVWF	r0x01
	INCF	FSR1L, F
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00396_DS_
;	.line	301; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (DS18B20GetFirst(pin))	// Begins when at least one part is found
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DS18B20GetFirst
	MOVWF	r0x01
	INCF	FSR1L, F
	MOVF	r0x01, W
	BZ	_00396_DS_
	BANKSEL	_numROMs
;	.line	303; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	numROMs=0;
	CLRF	_numROMs, B
_00385_DS_:
	BANKSEL	_numROMs
;	.line	305; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	numROMs++;
	INCF	_numROMs, F, B
;	.line	307; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	for(m = 0; m < 8; m++)
	CLRF	r0x01
_00392_DS_:
	MOVLW	0x08
	SUBWF	r0x01, W
	BC	_00386_DS_
; ;multiply lit val:0x08 by variable _numROMs and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_numROMs
;	.line	310; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	DS18B20Rom[numROMs][m] = ROM[m];
	MOVF	_numROMs, W, B
	MULLW	0x08
	MOVFF	PRODL, r0x02
	CLRF	r0x03
	MOVLW	LOW(_DS18B20Rom)
	ADDWF	r0x02, F
	MOVLW	HIGH(_DS18B20Rom)
	ADDWFC	r0x03, F
	MOVF	r0x01, W
	ADDWF	r0x02, F
	CLRF	WREG
	ADDWFC	r0x03, F
	MOVLW	LOW(_ROM)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_ROM)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
;	.line	307; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	for(m = 0; m < 8; m++)
	INCF	r0x01, F
	BRA	_00392_DS_
_00386_DS_:
;	.line	313; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	} while (DS18B20GetNext(pin)&&(numROMs<10));
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DS18B20GetNext
	MOVWF	r0x01
	INCF	FSR1L, F
	MOVF	r0x01, W
	BZ	_00396_DS_
	MOVLW	0x0a
	BANKSEL	_numROMs
	SUBWF	_numROMs, W, B
	BNC	_00385_DS_
_00396_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__DS18B20ReadRom	code
_DS18B20ReadRom:
;	.line	277; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	void DS18B20ReadRom(u8 pin, u8 *romcode)
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
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	280; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (!OneWireReset(pin))
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReset
	MOVWF	r0x04
	INCF	FSR1L, F
	MOVF	r0x04, W
	BNZ	_00373_DS_
;	.line	282; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, READROM);
	MOVLW	0x33
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	283; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	for (i = 0; i < 8; i++)		// Reads the ROM Code from a device
	CLRF	r0x04
_00369_DS_:
	MOVLW	0x08
	SUBWF	r0x04, W
	BC	_00373_DS_
;	.line	284; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	romcode[i] = OneWireRead(pin);
	MOVF	r0x04, W
	ADDWF	r0x01, W
	MOVWF	r0x05
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x06
	CLRF	WREG
	ADDWFC	r0x03, W
	MOVWF	r0x07
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireRead
	MOVWF	r0x08
	INCF	FSR1L, F
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	283; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	for (i = 0; i < 8; i++)		// Reads the ROM Code from a device
	INCF	r0x04, F
	BRA	_00369_DS_
_00373_DS_:
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
S_main__DS18B20MatchRom	code
_DS18B20MatchRom:
;	.line	254; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	u8 DS18B20MatchRom(u8 pin, u8 num)
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
;	.line	257; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (OneWireReset(pin)) return FALSE;
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReset
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	BZ	_00351_DS_
	CLRF	WREG
	BRA	_00356_DS_
_00351_DS_:
;	.line	258; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, MATCHROM);	// Match Rom
	MOVLW	0x55
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
; ;multiply lit val:0x08 by variable r0x01 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	259; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	for (i = 0; i < 8; i++)				// Send the Address ROM Code.
	MOVF	r0x01, W
	MULLW	0x08
	MOVFF	PRODL, r0x01
	CLRF	r0x02
_00352_DS_:
	MOVLW	0x08
	SUBWF	r0x02, W
	BC	_00355_DS_
;	.line	260; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, DS18B20Rom[num][i]);
	MOVLW	LOW(_DS18B20Rom)
	ADDWF	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_DS18B20Rom)
	ADDWFC	r0x04, F
	MOVF	r0x02, W
	ADDWF	r0x03, F
	CLRF	WREG
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	259; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	for (i = 0; i < 8; i++)				// Send the Address ROM Code.
	INCF	r0x02, F
	BRA	_00352_DS_
_00355_DS_:
;	.line	261; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	return TRUE;
	MOVLW	0x01
_00356_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__DS18B20Configure	code
_DS18B20Configure:
;	.line	220; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	u8 DS18B20Configure(u8 pin, u8 num, u8 TH, u8 TL, u8 config)
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
;	.line	222; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (OneWireReset(pin)) return FALSE;
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReset
	MOVWF	r0x05
	INCF	FSR1L, F
	MOVF	r0x05, W
	BZ	_00336_DS_
	CLRF	WREG
	BRA	_00340_DS_
_00336_DS_:
;	.line	223; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (num == SKIPROM)
	MOVF	r0x01, W
	XORLW	0xcc
	BNZ	_00338_DS_
;	.line	226; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, SKIPROM);
	MOVLW	0xcc
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
	BRA	_00339_DS_
_00338_DS_:
;	.line	231; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	DS18B20MatchRom(pin, num);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DS18B20MatchRom
	MOVLW	0x02
	ADDWF	FSR1L, F
_00339_DS_:
;	.line	233; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, WRITE_SCRATCHPAD);	// Allows the master to write 3 bytes of data to the scratchpad
	MOVLW	0x4e
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	234; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, TH);				// The first data byte is written into the TH register (byte 2 of the scratchpad)
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	235; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, TL);				// The second byte is written into the TL register (byte 3)
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	236; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, config);			// The third byte is written into the configuration register (byte 4)
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	237; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	return TRUE;
	MOVLW	0x01
_00340_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__DS18B20Read	code
_DS18B20Read:
;	.line	117; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	u8 DS18B20Read(u8 pin, u8 num, u8 resolution, DS18B20_Temperature * t)
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
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
;	.line	119; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	u8 res, busy = LOW;
	CLRF	r0x06
;	.line	122; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	switch (resolution)
	MOVLW	0x01
	SUBWF	r0x02, W
	BNC	_00284_DS_
	MOVLW	0x05
	SUBWF	r0x02, W
	BC	_00284_DS_
	DECF	r0x02, F
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	CLRF	r0x0b
	RLCF	r0x02, W
	RLCF	r0x0b, F
	RLCF	WREG, W
	RLCF	r0x0b, F
	ANDLW	0xfc
	MOVWF	r0x0a
	MOVLW	UPPER(_00327_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00327_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00327_DS_)
	ADDWF	r0x0a, F
	MOVF	r0x0b, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x0a, W
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVWF	PCL
_00327_DS_:
	GOTO	_00280_DS_
	GOTO	_00281_DS_
	GOTO	_00282_DS_
	GOTO	_00283_DS_
_00280_DS_:
;	.line	124; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	case RES12BIT:	res = 0b01100000;	break;	// 12-bit resolution
	MOVLW	0x60
	MOVWF	r0x02
	BRA	_00285_DS_
_00281_DS_:
;	.line	125; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	case RES11BIT:	res = 0b01000000;	break;	// 11-bit resolution
	MOVLW	0x40
	MOVWF	r0x02
	BRA	_00285_DS_
_00282_DS_:
;	.line	126; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	case RES10BIT:	res = 0b00100000;	break;	// 10-bit resolution
	MOVLW	0x20
	MOVWF	r0x02
	BRA	_00285_DS_
_00283_DS_:
;	.line	127; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	case  RES9BIT:	res = 0b00000000;	break;	//  9-bit resolution
	CLRF	r0x02
	BRA	_00285_DS_
_00284_DS_:
;	.line	128; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	default:		res = 0b00000000;	break;	//  9-bit resolution
	CLRF	r0x02
_00285_DS_:
;	.line	132; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (!DS18B20Configure(pin, num, 0, 0, res)) return FALSE; // no alarm
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DS18B20Configure
	MOVWF	r0x02
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x02, W
	BNZ	_00287_DS_
	CLRF	WREG
	BRA	_00310_DS_
_00287_DS_:
;	.line	134; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (OneWireReset(pin)) return FALSE;
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReset
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	BZ	_00289_DS_
	CLRF	WREG
	BRA	_00310_DS_
_00289_DS_:
;	.line	136; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (num == SKIPROM)
	CLRF	r0x02
	MOVF	r0x01, W
	XORLW	0xcc
	BNZ	_00329_DS_
	INCF	r0x02, F
_00329_DS_:
	MOVF	r0x02, W
	BZ	_00293_DS_
;	.line	139; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, SKIPROM);
	MOVLW	0xcc
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
	BRA	_00294_DS_
_00293_DS_:
;	.line	144; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (!DS18B20MatchRom(pin, num)) return FALSE;
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DS18B20MatchRom
	MOVWF	r0x07
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVF	r0x07, W
	BNZ	_00294_DS_
	CLRF	WREG
	BRA	_00310_DS_
_00294_DS_:
;	.line	147; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, CONVERT_T);		// Start temperature conversion
	MOVLW	0x44
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
_00295_DS_:
;	.line	149; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	while (busy == LOW)					// Wait while busy ( = bus is low)
	MOVF	r0x06, W
	BNZ	_00297_DS_
;	.line	150; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	busy = OneWireRead(pin);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireRead
	MOVWF	r0x06
	INCF	FSR1L, F
	BRA	_00295_DS_
_00297_DS_:
;	.line	152; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (OneWireReset(pin)) return FALSE;
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReset
	MOVWF	r0x06
	INCF	FSR1L, F
	MOVF	r0x06, W
	BZ	_00299_DS_
	CLRF	WREG
	BRA	_00310_DS_
_00299_DS_:
;	.line	154; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (num == SKIPROM)
	MOVF	r0x02, W
	BZ	_00303_DS_
;	.line	157; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, SKIPROM);
	MOVLW	0xcc
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
	BRA	_00304_DS_
_00303_DS_:
;	.line	162; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (!DS18B20MatchRom(pin, num)) return FALSE;
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DS18B20MatchRom
	MOVWF	r0x01
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVF	r0x01, W
	BNZ	_00304_DS_
	CLRF	WREG
	BRA	_00310_DS_
_00304_DS_:
;	.line	165; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	OneWireWrite(pin, READ_SCRATCHPAD);// Read scratchpad
	MOVLW	0xbe
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	167; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	temp_lsb = OneWireRead(pin);		// byte 0 of scratchpad : temperature lsb
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireRead
	MOVWF	r0x01
	INCF	FSR1L, F
;	.line	168; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	temp_msb = OneWireRead(pin);		// byte 1 of scratchpad : temperature msb
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireRead
	MOVWF	r0x02
	INCF	FSR1L, F
;	.line	170; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (OneWireReset(pin)) return FALSE;
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReset
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	BZ	_00306_DS_
	CLRF	WREG
	BRA	_00310_DS_
_00306_DS_:
;	.line	181; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	if (temp_msb >= 0b11111000)		// test if temperature is negative
	MOVLW	0xf8
	SUBWF	r0x02, W
	BNC	_00308_DS_
;	.line	183; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	t->sign = 1;
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	184; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	temp_msb -= 0b11111000;
	MOVLW	0x08
	ADDWF	r0x02, F
	BRA	_00309_DS_
_00308_DS_:
;	.line	188; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	t->sign = 0;
	CLRF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
_00309_DS_:
;	.line	191; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	t->integer = temp_lsb >> 4;			// fractional part is removed, it remains only integer part
	MOVF	r0x03, W
	ADDLW	0x01
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x07
	SWAPF	r0x01, W
	ANDLW	0x0f
	MOVWF	r0x08
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	192; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	t->integer |= (temp_msb << 4);		// integer part from temp_msb is added
	SWAPF	r0x02, W
	ANDLW	0xf0
; #	MOVWF	r0x09
; #	MOVF	r0x09, W
	IORWF	r0x08, W
	MOVWF	r0x02
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	201; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	t->fraction = (temp_lsb & 0x0F) * 625;
	MOVLW	0x02
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	ADDWFC	r0x05, F
	MOVLW	0x0f
	ANDWF	r0x01, F
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x71
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	202; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	t->fraction /= 100;					// two digits after decimal 
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget2
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	CLRF	POSTDEC1
	MOVLW	0x64
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
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	204; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/18b20.c	return TRUE;
	MOVLW	0x01
_00310_DS_:
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
S_main__OneWireWrite	code
_OneWireWrite:
;	.line	145; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	void OneWireWrite(u8 DQpin, u8 val)
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
;	.line	148; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	for (i=0; i<8; i++)					// writes byte, one bit at a time
	CLRF	r0x02
_00264_DS_:
	MOVLW	0x08
	SUBWF	r0x02, W
	BC	_00268_DS_
;	.line	150; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	temp = val >> i;				// shifts val right 'i' spaces
	MOVFF	r0x01, r0x03
	MOVF	r0x02, W
	BZ	_00274_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00275_DS_:
	RRCF	r0x03, F
	ADDLW	0x01
	BNC	_00275_DS_
_00274_DS_:
;	.line	151; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	temp &= 0x01;					// copy that bit to temp
	MOVLW	0x01
	ANDWF	r0x03, F
;	.line	152; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	OneWireWriteBit(DQpin, temp);	// write bit in temp into
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireWriteBit
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	148; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	for (i=0; i<8; i++)					// writes byte, one bit at a time
	INCF	r0x02, F
	BRA	_00264_DS_
_00268_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__OneWireWriteBit	code
_OneWireWriteBit:
;	.line	124; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	void OneWireWriteBit(u8 DQpin, u8 bitval)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	126; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	if(bitval == 1)
	MOVF	r0x01, W
	XORLW	0x01
	BNZ	_00253_DS_
;	.line	128; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	OneWireLow(DQpin);				// pull DQ line low
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireLow
	INCF	FSR1L, F
;	.line	130; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	OneWireHigh(DQpin);				// allow line to return high
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireHigh
	INCF	FSR1L, F
;	.line	131; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	Delayus(60);
	CLRF	POSTDEC1
	MOVLW	0x3c
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVLW	0x02
	ADDWF	FSR1L, F
	BRA	_00255_DS_
_00253_DS_:
;	.line	135; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	OneWireLow(DQpin);				// pull DQ line low
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireLow
	INCF	FSR1L, F
;	.line	136; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	Delayus(60);					// for the whole time slot
	CLRF	POSTDEC1
	MOVLW	0x3c
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	137; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	OneWireHigh(DQpin);				// allow line to return high
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireHigh
	INCF	FSR1L, F
_00255_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__OneWireRead	code
_OneWireRead:
;	.line	107; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	u8 OneWireRead(u8 DQpin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	109; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	u8 i, value = 0;
	CLRF	r0x01
;	.line	110; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	for (i=0; i<8; i++)
	CLRF	r0x02
_00235_DS_:
	MOVLW	0x08
	SUBWF	r0x02, W
	BC	_00238_DS_
;	.line	112; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	if (OneWireReadBit(DQpin))	// reads byte in, one bit at a time
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireReadBit
	MOVWF	r0x03
	INCF	FSR1L, F
	MOVF	r0x03, W
	BZ	_00237_DS_
;	.line	114; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	value |= 0x01 << i;			// and then shifts it left
	MOVLW	0x01
	MOVWF	r0x03
	MOVF	r0x02, W
	BZ	_00246_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00247_DS_:
	RLCF	r0x03, F
	ADDLW	0x01
	BNC	_00247_DS_
_00246_DS_:
	MOVF	r0x03, W
	IORWF	r0x01, F
_00237_DS_:
;	.line	110; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	for (i=0; i<8; i++)
	INCF	r0x02, F
	BRA	_00235_DS_
_00238_DS_:
;	.line	117; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	return(value);
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__OneWireReadBit	code
_OneWireReadBit:
;	.line	90; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	u8 OneWireReadBit(u8 DQpin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	94; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	OneWireLow(DQpin);			// pull DQ line low to start time slot
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireLow
	INCF	FSR1L, F
;	.line	96; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	OneWireHigh(DQpin);			// allow line to return high
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireHigh
	INCF	FSR1L, F
;	.line	98; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	dq = digitalread(DQpin);		// get presence signal
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalread
	MOVWF	r0x00
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	99; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	Delayus(50);				// wait for rest of timeslot
	CLRF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	100; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	return (dq);					// return value of DQ line
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__OneWireReset	code
_OneWireReset:
;	.line	73; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	u8 OneWireReset(u8 DQpin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	77; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	OneWireLow(DQpin);			// pull DQ line low
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireLow
	INCF	FSR1L, F
;	.line	78; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	Delayus(480);				// leave it low for min. 480us
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xe0
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	79; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	OneWireHigh(DQpin);			// allow line to return high
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OneWireHigh
	INCF	FSR1L, F
;	.line	80; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	Delayus(60);				// takes 15 to 60 us
	CLRF	POSTDEC1
	MOVLW	0x3c
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	81; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	presence = digitalread(DQpin);	// get presence signal
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalread
	MOVWF	r0x00
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	82; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	Delayus(420);				// wait for end of timeslot (960-480-60=420)
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xa4
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	83; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	return (presence);
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__OneWireHigh	code
_OneWireHigh:
;	.line	60; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	static void OneWireHigh(u8 DQpin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	62; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	pinmode(DQpin, INPUT);
	CLRF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__OneWireLow	code
_OneWireLow:
;	.line	50; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	static void OneWireLow(u8 DQpin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	52; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	digitalwrite(DQpin, LOW);
	CLRF	r0x01
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	53; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/1wire.c	pinmode(DQpin, OUTPUT);
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__toggle	code
_toggle:
;	.line	93; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	void toggle(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	96; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	val = digitalread(pin);
	CLRF	r0x01
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalread
	MOVWF	r0x02
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	97; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	digitalwrite(pin, val^1);
	MOVLW	0x01
	XORWF	r0x02, F
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__pinmode	code
_pinmode:
;	.line	69; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	void pinmode(int input, int state)
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
;	.line	71; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	switch (port[input])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_port)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_port)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVLW	0x03
	SUBWF	r0x04, W
	BTFSC	STATUS, 0
	BRA	_00196_DS_
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x04, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00203_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00203_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00203_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00203_DS_:
	GOTO	_00183_DS_
	GOTO	_00187_DS_
	GOTO	_00191_DS_
_00183_DS_:
;	.line	73; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	case 0: if (state) TRISB=TRISB | mask[input];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00185_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	IORWF	_TRISB, F
	BRA	_00196_DS_
_00185_DS_:
;	.line	74; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	else TRISB=TRISB & (255-mask[input]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	SUBLW	0xff
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	_TRISB, F
;	.line	75; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	break;
	BRA	_00196_DS_
_00187_DS_:
;	.line	76; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	case 1: if (state) TRISC=TRISC | mask[input];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00189_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	IORWF	_TRISC, F
	BRA	_00196_DS_
_00189_DS_:
;	.line	77; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	else TRISC=TRISC & (255-mask[input]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	SUBLW	0xff
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	_TRISC, F
;	.line	78; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	break;
	BRA	_00196_DS_
_00191_DS_:
;	.line	79; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	case 2: if (state) TRISA=TRISA | mask[input];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00193_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	BTFSC	r0x01, 7
	SETF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_TRISA, F
	BRA	_00196_DS_
_00193_DS_:
;	.line	80; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	else TRISA=TRISA & (255-mask[input]);
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
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
	ANDWF	_TRISA, F
_00196_DS_:
;	.line	90; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	}
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
S_main__digitalread	code
_digitalread:
;	.line	44; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	int digitalread(int input)
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
;	.line	46; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	switch (port[input])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_port)
	ADDWFC	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	BTFSC	r0x01, 7
	SETF	r0x04
	MOVLW	UPPER(_port)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVLW	0x03
	SUBWF	r0x02, W
	BTFSC	STATUS, 0
	BRA	_00170_DS_
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	CLRF	r0x06
	RLCF	r0x02, W
	RLCF	r0x06, F
	RLCF	WREG, W
	RLCF	r0x06, F
	ANDLW	0xfc
	MOVWF	r0x05
	MOVLW	UPPER(_00178_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00178_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00178_DS_)
	ADDWF	r0x05, F
	MOVF	r0x06, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x05, W
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVWF	PCL
_00178_DS_:
	GOTO	_00158_DS_
	GOTO	_00162_DS_
	GOTO	_00166_DS_
_00158_DS_:
;	.line	48; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	case 0: if ((PORTB & mask[input])!=0) return (1);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	BTFSC	r0x01, 7
	SETF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	_PORTB, W
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00160_DS_
	CLRF	PRODL
	MOVLW	0x01
	BRA	_00171_DS_
_00160_DS_:
;	.line	49; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	else return (0);
	CLRF	PRODL
	CLRF	WREG
	BRA	_00171_DS_
_00162_DS_:
;	.line	51; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	case 1: if ((PORTC & mask[input])!=0) return (1);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	BTFSC	r0x01, 7
	SETF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	_PORTC, W
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00164_DS_
	CLRF	PRODL
	MOVLW	0x01
	BRA	_00171_DS_
_00164_DS_:
;	.line	52; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	else return (0);
	CLRF	PRODL
	CLRF	WREG
	BRA	_00171_DS_
_00166_DS_:
;	.line	54; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	case 2: if ((PORTA & mask[input])!=0) return (1);
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
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
	MOVF	_PORTA, W
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00168_DS_
	CLRF	PRODL
	MOVLW	0x01
	BRA	_00171_DS_
_00168_DS_:
;	.line	55; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	else return (0);
	CLRF	PRODL
	CLRF	WREG
	BRA	_00171_DS_
_00170_DS_:
;	.line	66; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	return (0);
	CLRF	PRODL
	CLRF	WREG
_00171_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__digitalwrite	code
_digitalwrite:
;	.line	20; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	void digitalwrite(int output,int state)
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
;	.line	22; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	switch (port[output])
	MOVLW	LOW(_port)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_port)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_port)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVLW	0x03
	SUBWF	r0x04, W
	BTFSC	STATUS, 0
	BRA	_00146_DS_
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x04, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00153_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00153_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00153_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00153_DS_:
	GOTO	_00133_DS_
	GOTO	_00137_DS_
	GOTO	_00141_DS_
_00133_DS_:
;	.line	24; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	case 0: if (state) PORTB=PORTB | mask[output]; 
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00135_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	IORWF	_PORTB, F
	BRA	_00146_DS_
_00135_DS_:
;	.line	25; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	else PORTB=PORTB & (255-mask[output]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	SUBLW	0xff
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	_PORTB, F
;	.line	26; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	break;
	BRA	_00146_DS_
_00137_DS_:
;	.line	27; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	case 1: if (state) PORTC=PORTC | mask[output];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00139_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	IORWF	_PORTC, F
	BRA	_00146_DS_
_00139_DS_:
;	.line	28; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	else PORTC=PORTC & (255-mask[output]);
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x01, 7
	SETF	r0x06
	MOVLW	UPPER(_mask)
	ADDWFC	r0x06, F
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x05, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	MOVF	r0x04, W
	SUBLW	0xff
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	_PORTC, F
;	.line	29; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	break;
	BRA	_00146_DS_
_00141_DS_:
;	.line	30; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	case 2: if (state) PORTA=PORTA | mask[output];
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00143_DS_
	MOVLW	LOW(_mask)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_mask)
	ADDWFC	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	BTFSC	r0x01, 7
	SETF	r0x04
	MOVLW	UPPER(_mask)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	MOVF	r0x02, W
	IORWF	_PORTA, F
	BRA	_00146_DS_
_00143_DS_:
;	.line	31; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	else PORTA=PORTA & (255-mask[output]);
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
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
	ANDWF	_PORTA, F
_00146_DS_:
;	.line	41; /home/mandon/pinguino32X2/trunk/x.2/p8/share/sdcc/include/pic16/digitalw.c	}
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
_00119_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00128_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00128_DS_:
	BC	_00123_DS_
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00119_DS_
_00123_DS_:
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
_00105_DS_:
	MOVF	r0x03, W
	SUBWF	r0x07, W
	BNZ	_00114_DS_
	MOVF	r0x02, W
	SUBWF	r0x06, W
	BNZ	_00114_DS_
	MOVF	r0x01, W
	SUBWF	r0x05, W
	BNZ	_00114_DS_
	MOVF	r0x00, W
	SUBWF	r0x04, W
_00114_DS_:
	BC	_00109_DS_
	MOVLW	0x01
	CALL	_delay10ktcy
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00105_DS_
_00109_DS_:
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

; ; Starting pCode block for Ival
	code
_mask:
	DB	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x40, 0x80, 0x01, 0x02
	DB	0x04, 0x01, 0x02, 0x04, 0x08, 0x20
; ; Starting pCode block for Ival
_port:
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x02, 0x02, 0x02, 0x02, 0x02
; ; Starting pCode block for Ival
_dscrc_table:
	DB	0x00, 0x5e, 0xbc, 0xe2, 0x61, 0x3f, 0xdd, 0x83, 0xc2, 0x9c, 0x7e, 0x20
	DB	0xa3, 0xfd, 0x1f, 0x41, 0x9d, 0xc3, 0x21, 0x7f, 0xfc, 0xa2, 0x40, 0x1e
	DB	0x5f, 0x01, 0xe3, 0xbd, 0x3e, 0x60, 0x82, 0xdc, 0x23, 0x7d, 0x9f, 0xc1
	DB	0x42, 0x1c, 0xfe, 0xa0, 0xe1, 0xbf, 0x5d, 0x03, 0x80, 0xde, 0x3c, 0x62
	DB	0xbe, 0xe0, 0x02, 0x5c, 0xdf, 0x81, 0x63, 0x3d, 0x7c, 0x22, 0xc0, 0x9e
	DB	0x1d, 0x43, 0xa1, 0xff, 0x46, 0x18, 0xfa, 0xa4, 0x27, 0x79, 0x9b, 0xc5
	DB	0x84, 0xda, 0x38, 0x66, 0xe5, 0xbb, 0x59, 0x07, 0xdb, 0x85, 0x67, 0x39
	DB	0xba, 0xe4, 0x06, 0x58, 0x19, 0x47, 0xa5, 0xfb, 0x78, 0x26, 0xc4, 0x9a
	DB	0x65, 0x3b, 0xd9, 0x87, 0x04, 0x5a, 0xb8, 0xe6, 0xa7, 0xf9, 0x1b, 0x45
	DB	0xc6, 0x98, 0x7a, 0x24, 0xf8, 0xa6, 0x44, 0x1a, 0x99, 0xc7, 0x25, 0x7b
	DB	0x3a, 0x64, 0x86, 0xd8, 0x5b, 0x05, 0xe7, 0xb9, 0x8c, 0xd2, 0x30, 0x6e
	DB	0xed, 0xb3, 0x51, 0x0f, 0x4e, 0x10, 0xf2, 0xac, 0x2f, 0x71, 0x93, 0xcd
	DB	0x11, 0x4f, 0xad, 0xf3, 0x70, 0x2e, 0xcc, 0x92, 0xd3, 0x8d, 0x6f, 0x31
	DB	0xb2, 0xec, 0x0e, 0x50, 0xaf, 0xf1, 0x13, 0x4d, 0xce, 0x90, 0x72, 0x2c
	DB	0x6d, 0x33, 0xd1, 0x8f, 0x0c, 0x52, 0xb0, 0xee, 0x32, 0x6c, 0x8e, 0xd0
	DB	0x53, 0x0d, 0xef, 0xb1, 0xf0, 0xae, 0x4c, 0x12, 0x91, 0xcf, 0x2d, 0x73
	DB	0xca, 0x94, 0x76, 0x28, 0xab, 0xf5, 0x17, 0x49, 0x08, 0x56, 0xb4, 0xea
	DB	0x69, 0x37, 0xd5, 0x8b, 0x57, 0x09, 0xeb, 0xb5, 0x36, 0x68, 0x8a, 0xd4
	DB	0x95, 0xcb, 0x29, 0x77, 0xf4, 0xaa, 0x48, 0x16, 0xe9, 0xb7, 0x55, 0x0b
	DB	0x88, 0xd6, 0x34, 0x6a, 0x2b, 0x75, 0x97, 0xc9, 0x4a, 0x14, 0xf6, 0xa8
	DB	0x74, 0x2a, 0xc8, 0x96, 0x15, 0x4b, 0xa9, 0xf7, 0xb6, 0xe8, 0x0a, 0x54
	DB	0xd7, 0x89, 0x6b, 0x35


; Statistics:
; code size:	 5514 (0x158a) bytes ( 4.21%)
;           	 2757 (0x0ac5) words
; udata size:	  266 (0x010a) bytes (14.84%)
; access size:	   12 (0x000c) bytes


	end
