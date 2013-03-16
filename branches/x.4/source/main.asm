;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.1 #8392 (Jan 21 2013) (Linux)
; This file was generated Sat Mar 16 00:20:56 2013
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f2550
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_valor
	global	_preloadL
	global	_preloadH
	global	_intCountLimit
	global	_intCount
	global	_hidRxLen
	global	_hidProtocol
	global	_hidIdleRate
	global	_HIDPostProcess
	global	_deviceAddress
	global	_EnableUSBModule
	global	_ProcessUSBTransactions
	global	_ProcessCDCRequest
	global	_CDCgets
	global	_CDCInitEndpoint
	global	_CONTROL_LINE
	global	_deviceState
	global	_remoteWakeup
	global	_selfPowered
	global	_currentConfiguration
	global	_ctrlTransferStage
	global	_requestHandled
	global	_outPtr
	global	_inPtr
	global	_wCount
	global	_ep_bdt
	global	_SetupPacket
	global	_controlTransferBuffer
	global	_CDCControlBuffer
	global	_CDCRxBuffer
	global	_CDCTxBuffer
	global	_line_config
	global	_zlp
	global	__cdc_buffer
	global	__cpu_clock_
	global	_intUsed
	global	__pr2_plus1
	global	__t2con
	global	_lectura
	global	_bloque
	global	_par1
	global	_cont
	global	_i
	global	_epap_in
	global	_epap_out
	global	_epapin_init
	global	_epapout_init
	global	_ProcessStandardRequest
	global	_InDataStage
	global	_OutDataStage
	global	_SetupStage
	global	_WaitForSetupStage
	global	_ProcessControlTransfer
	global	_UnSuspend
	global	_StartOfFrame
	global	_Stall
	global	_Suspend
	global	_BusReset
	global	_CDCputs
	global	_Delayms
	global	_Delayus
	global	_pprintf
	global	_psprintf2
	global	_psprintf
	global	_CDC_init
	global	_CDCwrite
	global	_CDCprintf
	global	_CDCprint
	global	_CDCprintln
	global	_CDCgetkey
	global	_CDCgetstring
	global	_CDC_interrupt
	global	_analog_init
	global	_analogReference
	global	_analogread
	global	_digitalwrite
	global	_digitalread
	global	_pinmode
	global	_toggle
	global	_EEPROM_read8
	global	_EEPROM_read16
	global	_EEPROM_write8
	global	_EEPROM_write16
	global	_SystemReadFlashMemory
	global	_SystemClocksGetCpuFrequency
	global	_SystemClocksGetPeripheralFrequency
	global	_IntSetEnable
	global	_IntDisable
	global	_IntEnable
	global	_IntClearFlag
	global	_IntInit
	global	_IntTimerStart
	global	_IntTimerStop
	global	_userhighinterrupt
	global	_userlowinterrupt
	global	_PWM_set_frequency
	global	_PWM_set_dutycycle
	global	_PWM_set_percent_dutycycle
	global	_IOsetDigital
	global	_IOsetRemap
	global	_setup
	global	_leer_cadena
	global	_loop
	global	_pinguino_main
	global	_high_priority_isr
	global	_low_priority_isr
	global	_libdevice_descriptor
	global	_libconfiguration_descriptor
	global	_lang
	global	_manu
	global	_prod
	global	_libstring_descriptor
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
	extern	_PORTEbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_DDRAbits
	extern	_TRISAbits
	extern	_DDRBbits
	extern	_TRISBbits
	extern	_DDRCbits
	extern	_TRISCbits
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
	extern	_PORTE
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_DDRA
	extern	_TRISA
	extern	_DDRB
	extern	_TRISB
	extern	_DDRC
	extern	_TRISC
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
	extern	_strcpy
	extern	_strncmp
	extern	_strtok
	extern	_delay1ktcy
	extern	_delay10ktcy
	extern	__modulong
	extern	__divulong
	extern	__divslong
	extern	__mulint
	extern	__divuint
	extern	_atoi

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
POSTINC0	equ	0xfee
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_CONTROL_LINE	db	0x00
__cpu_clock_	db	0x00, 0x6c, 0xdc, 0x02
__pr2_plus1	db	0x00, 0x01


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
_intFunction	res	99

udata_main_7	udata
_intCount	res	8

udata_main_8	udata
_intCountLimit	res	8

udata_main_9	udata
_preloadH	res	4

udata_main_10	udata
_preloadL	res	4

udata_main_11	udata
_valor	res	2

udata_main_12	udata
_requestHandled	res	1

udata_main_13	udata
_outPtr	res	3

udata_main_14	udata
_wCount	res	2

udata_main_15	udata
_inPtr	res	3

udata_main_16	udata
_selfPowered	res	1

udata_main_17	udata
_remoteWakeup	res	1

udata_main_18	udata
_deviceState	res	1

udata_main_19	udata
_currentConfiguration	res	1

udata_main_20	udata
_ctrlTransferStage	res	1

udata_main_21	udata
_line_config	res	7

udata_main_22	udata
_zlp	res	8

udata_main_23	udata
_CDCControlBuffer	res	16

udata_main_24	udata
_pprinti_buffer_1_154	res	12

udata_main_25	udata
_pprintfl_buffer_1_164	res	12

udata_main_26	udata
_pprintfl_tmp_1_164	res	12

udata_main_27	udata
_pprintfl_helper_1_164	res	4

udata_main_28	udata
_pprint_scr_1_178	res	2

udata_main_29	udata
_psprintf2_out_1_199	res	3

udata_main_30	udata
__cdc_buffer	res	64

udata_main_31	udata
_intUsed	res	33

udata_main_32	udata
__t2con	res	1

udata_main_33	udata
_leer_cadena_valor_leido_1_305	res	21

udata_main_34	udata
_lectura	res	21

udata_main_35	udata
_cont	res	2

udata_main_36	udata
_bloque	res	3

udata_main_37	udata
_par1	res	2

udata_main_38	udata
_i	res	2


ustat_main_00	udata	0X0400
_ep_bdt        	res	128

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__high_priority_isr	code	0X002020
_high_priority_isr:
;	.line	167; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	void high_priority_isr(void) __interrupt 1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	178; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	CDC_interrupt();
	CALL	_CDC_interrupt
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
;	.line	229; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	void low_priority_isr(void) __interrupt 2
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
;	.line	245; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	userlowinterrupt();
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
;	.line	96; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	RCON   = 0x80;                // Enable priority levels on interrupts
	MOVLW	0x80
	MOVWF	_RCON
;	.line	108; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	IOsetDigital();
	CALL	_IOsetDigital
;	.line	109; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	IOsetRemap();
	CALL	_IOsetRemap
;	.line	112; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	IntInit();
	CALL	_IntInit
;	.line	120; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	CDC_init();
	CALL	_CDC_init
;	.line	128; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	analog_init();
	CALL	_analog_init
;	.line	144; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	setup();
	CALL	_setup
_02442_DS_:
;	.line	155; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	loop();
	CALL	_loop
	BRA	_02442_DS_
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	29; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	void loop() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	31; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	leer_cadena();
	CALL	_leer_cadena
	BANKSEL	_cont
;	.line	32; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont=0;
	CLRF	_cont, B
; removed redundant BANKSEL
	CLRF	(_cont + 1), B
;	.line	34; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	if (strncmp(lectura, "pinMode", 7)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_8)
	MOVWF	r0x05
	MOVLW	HIGH(__str_8)
	MOVWF	r0x04
	MOVLW	LOW(__str_8)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x07
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_02162_DS_
;	.line	35; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){ 
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	r0x05
	MOVLW	HIGH(__str_11)
	MOVWF	r0x04
	MOVLW	LOW(__str_11)
	MOVWF	r0x03
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
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
_02165_DS_:
	BANKSEL	_bloque
	MOVF	_bloque, W, B
	BNZ	_02388_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	BNZ	_02388_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 2), W, B
	BNZ	_02388_DS_
	GOTO	_02199_DS_
_02388_DS_:
;	.line	36; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	switch (cont){
	BSF	STATUS, 0
	BANKSEL	(_cont + 1)
	BTFSS	(_cont + 1), 7, B
	BCF	STATUS, 0
	BTFSC	STATUS, 0
	BRA	_02077_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_02389_DS_
	MOVLW	0x03
; removed redundant BANKSEL
	SUBWF	_cont, W, B
_02389_DS_:
	BTFSC	STATUS, 0
	BRA	_02077_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	BANKSEL	_cont
	RLCF	_cont, W, B
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_02390_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_02390_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_02390_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_02390_DS_:
	GOTO	_02069_DS_
	GOTO	_02070_DS_
	GOTO	_02071_DS_
_02069_DS_:
;	.line	37; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	case 0: break;
	BRA	_02077_DS_
_02070_DS_:
	BANKSEL	(_bloque + 2)
;	.line	39; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	par1=atoi(bloque);
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	BANKSEL	_par1
	MOVWF	_par1, B
	MOVFF	PRODL, (_par1 + 1)
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	40; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	break;
	BRA	_02077_DS_
_02071_DS_:
;	.line	42; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	if (strncmp(bloque, "INPUT", 5)==0) pinmode(par1,INPUT);
	MOVLW	UPPER(__str_9)
	MOVWF	r0x02
	MOVLW	HIGH(__str_9)
	MOVWF	r0x01
	MOVLW	LOW(__str_9)
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_bloque + 2)
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_02075_DS_
	BANKSEL	_par1
	MOVF	_par1, W, B
	MOVWF	r0x00
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BRA	_02077_DS_
_02075_DS_:
;	.line	43; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(bloque, "OUTPUT", 6)==0) pinmode(par1,OUTPUT);
	MOVLW	UPPER(__str_10)
	MOVWF	r0x02
	MOVLW	HIGH(__str_10)
	MOVWF	r0x01
	MOVLW	LOW(__str_10)
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_bloque + 2)
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_02077_DS_
	BANKSEL	_par1
	MOVF	_par1, W, B
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_02077_DS_:
	BANKSEL	_cont
;	.line	46; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont+=1;
	INCFSZ	_cont, F, B
	BRA	_12454_DS_
; removed redundant BANKSEL
	INCF	(_cont + 1), F, B
_12454_DS_:
;	.line	35; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){ 
	MOVLW	UPPER(__str_12)
	MOVWF	r0x02
	MOVLW	HIGH(__str_12)
	MOVWF	r0x01
	MOVLW	LOW(__str_12)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_02165_DS_
_02162_DS_:
;	.line	50; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "digitalWrite", 12)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_13)
	MOVWF	r0x05
	MOVLW	HIGH(__str_13)
	MOVWF	r0x04
	MOVLW	LOW(__str_13)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0c
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_02159_DS_
;	.line	51; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	r0x05
	MOVLW	HIGH(__str_11)
	MOVWF	r0x04
	MOVLW	LOW(__str_11)
	MOVWF	r0x03
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
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
_02168_DS_:
	BANKSEL	_bloque
	MOVF	_bloque, W, B
	BNZ	_02392_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	BNZ	_02392_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 2), W, B
	BNZ	_02392_DS_
	GOTO	_02199_DS_
_02392_DS_:
;	.line	52; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	switch (cont){
	BSF	STATUS, 0
	BANKSEL	(_cont + 1)
	BTFSS	(_cont + 1), 7, B
	BCF	STATUS, 0
	BTFSC	STATUS, 0
	BRA	_02087_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_02393_DS_
	MOVLW	0x03
; removed redundant BANKSEL
	SUBWF	_cont, W, B
_02393_DS_:
	BTFSC	STATUS, 0
	BRA	_02087_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	BANKSEL	_cont
	RLCF	_cont, W, B
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_02394_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_02394_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_02394_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_02394_DS_:
	GOTO	_02079_DS_
	GOTO	_02080_DS_
	GOTO	_02081_DS_
_02079_DS_:
;	.line	53; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	case 0: break;
	BRA	_02087_DS_
_02080_DS_:
	BANKSEL	(_bloque + 2)
;	.line	55; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	par1=atoi(bloque);
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	BANKSEL	_par1
	MOVWF	_par1, B
	MOVFF	PRODL, (_par1 + 1)
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	56; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	break;
	BRA	_02087_DS_
_02081_DS_:
;	.line	58; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	if (strncmp(bloque, "HIGH", 4)==0) digitalwrite(par1,HIGH);
	MOVLW	UPPER(__str_14)
	MOVWF	r0x02
	MOVLW	HIGH(__str_14)
	MOVWF	r0x01
	MOVLW	LOW(__str_14)
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_bloque + 2)
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_02085_DS_
	BANKSEL	_par1
	MOVF	_par1, W, B
	MOVWF	r0x00
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BRA	_02087_DS_
_02085_DS_:
;	.line	59; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(bloque, "LOW", 3)==0) digitalwrite(par1,LOW);
	MOVLW	UPPER(__str_15)
	MOVWF	r0x02
	MOVLW	HIGH(__str_15)
	MOVWF	r0x01
	MOVLW	LOW(__str_15)
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_bloque + 2)
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_02087_DS_
	BANKSEL	_par1
	MOVF	_par1, W, B
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_02087_DS_:
	BANKSEL	_cont
;	.line	62; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont+=1;
	INCFSZ	_cont, F, B
	BRA	_22455_DS_
; removed redundant BANKSEL
	INCF	(_cont + 1), F, B
_22455_DS_:
;	.line	51; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){
	MOVLW	UPPER(__str_12)
	MOVWF	r0x02
	MOVLW	HIGH(__str_12)
	MOVWF	r0x01
	MOVLW	LOW(__str_12)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_02168_DS_
_02159_DS_:
;	.line	66; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "analogWrite", 11)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_16)
	MOVWF	r0x05
	MOVLW	HIGH(__str_16)
	MOVWF	r0x04
	MOVLW	LOW(__str_16)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0b
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_02156_DS_
;	.line	67; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	r0x05
	MOVLW	HIGH(__str_11)
	MOVWF	r0x04
	MOVLW	LOW(__str_11)
	MOVWF	r0x03
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
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
_02171_DS_:
	BANKSEL	_bloque
	MOVF	_bloque, W, B
	BNZ	_02396_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	BNZ	_02396_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 2), W, B
	BNZ	_02396_DS_
	GOTO	_02199_DS_
_02396_DS_:
;	.line	68; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	switch (cont){
	BSF	STATUS, 0
	BANKSEL	(_cont + 1)
	BTFSS	(_cont + 1), 7, B
	BCF	STATUS, 0
	BTFSC	STATUS, 0
	BRA	_02092_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_02397_DS_
	MOVLW	0x03
; removed redundant BANKSEL
	SUBWF	_cont, W, B
_02397_DS_:
	BTFSC	STATUS, 0
	BRA	_02092_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	BANKSEL	_cont
	RLCF	_cont, W, B
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_02398_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_02398_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_02398_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_02398_DS_:
	GOTO	_02089_DS_
	GOTO	_02090_DS_
	GOTO	_02091_DS_
_02089_DS_:
;	.line	69; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	case 0: break;
	BRA	_02092_DS_
_02090_DS_:
	BANKSEL	(_bloque + 2)
;	.line	71; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	par1=atoi(bloque);
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	BANKSEL	_par1
	MOVWF	_par1, B
	MOVFF	PRODL, (_par1 + 1)
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	72; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	break;
	BRA	_02092_DS_
_02091_DS_:
	BANKSEL	_par1
;	.line	74; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	PWM_set_dutycycle(par1,atoi(bloque));
	MOVF	_par1, W, B
	MOVWF	r0x00
	BANKSEL	(_bloque + 2)
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_PWM_set_dutycycle
	MOVLW	0x03
	ADDWF	FSR1L, F
_02092_DS_:
	BANKSEL	_cont
;	.line	77; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont+=1;
	INCFSZ	_cont, F, B
	BRA	_32456_DS_
; removed redundant BANKSEL
	INCF	(_cont + 1), F, B
_32456_DS_:
;	.line	67; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){
	MOVLW	UPPER(__str_12)
	MOVWF	r0x02
	MOVLW	HIGH(__str_12)
	MOVWF	r0x01
	MOVLW	LOW(__str_12)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_02171_DS_
_02156_DS_:
;	.line	81; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "digitalRead", 11)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_17)
	MOVWF	r0x05
	MOVLW	HIGH(__str_17)
	MOVWF	r0x04
	MOVLW	LOW(__str_17)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0b
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_02153_DS_
;	.line	82; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	r0x05
	MOVLW	HIGH(__str_11)
	MOVWF	r0x04
	MOVLW	LOW(__str_11)
	MOVWF	r0x03
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
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
_02174_DS_:
	BANKSEL	_bloque
	MOVF	_bloque, W, B
	BNZ	_02400_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	BNZ	_02400_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 2), W, B
	BNZ	_02400_DS_
	GOTO	_02199_DS_
_02400_DS_:
	BANKSEL	_cont
;	.line	83; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	switch (cont){
	MOVF	_cont, W, B
	BNZ	_02402_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02096_DS_
_02402_DS_:
	BANKSEL	_cont
	MOVF	_cont, W, B
	XORLW	0x01
	BNZ	_02403_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02404_DS_
_02403_DS_:
	BRA	_02096_DS_
_02404_DS_:
	BANKSEL	(_bloque + 2)
;	.line	86; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	CDCprintf("%d\n",digitalread(atoi(bloque)));
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalread
	MOVWF	r0x00
	MOVF	POSTINC1, F
	CLRF	r0x01
	MOVLW	UPPER(__str_18)
	MOVWF	r0x04
	MOVLW	HIGH(__str_18)
	MOVWF	r0x03
	MOVLW	LOW(__str_18)
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x05
	ADDWF	FSR1L, F
_02096_DS_:
	BANKSEL	_cont
;	.line	89; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont+=1;
	INCFSZ	_cont, F, B
	BRA	_42457_DS_
; removed redundant BANKSEL
	INCF	(_cont + 1), F, B
_42457_DS_:
;	.line	82; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	UPPER(__str_19)
	MOVWF	r0x02
	MOVLW	HIGH(__str_19)
	MOVWF	r0x01
	MOVLW	LOW(__str_19)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_02174_DS_
_02153_DS_:
;	.line	93; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "analogRead", 10)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_20)
	MOVWF	r0x05
	MOVLW	HIGH(__str_20)
	MOVWF	r0x04
	MOVLW	LOW(__str_20)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_02150_DS_
;	.line	94; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	r0x05
	MOVLW	HIGH(__str_11)
	MOVWF	r0x04
	MOVLW	LOW(__str_11)
	MOVWF	r0x03
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
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
_02177_DS_:
	BANKSEL	_bloque
	MOVF	_bloque, W, B
	BNZ	_02406_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	BNZ	_02406_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 2), W, B
	BNZ	_02406_DS_
	GOTO	_02199_DS_
_02406_DS_:
	BANKSEL	_cont
;	.line	95; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	switch (cont){
	MOVF	_cont, W, B
	BNZ	_02408_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02100_DS_
_02408_DS_:
	BANKSEL	_cont
	MOVF	_cont, W, B
	XORLW	0x01
	BNZ	_02409_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02410_DS_
_02409_DS_:
	BRA	_02100_DS_
_02410_DS_:
	BANKSEL	(_bloque + 2)
;	.line	98; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	CDCprintf("%d\n",analogread(atoi(bloque)));
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_analogread
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVF	POSTINC1, F
	MOVLW	UPPER(__str_18)
	MOVWF	r0x04
	MOVLW	HIGH(__str_18)
	MOVWF	r0x03
	MOVLW	LOW(__str_18)
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x05
	ADDWF	FSR1L, F
_02100_DS_:
	BANKSEL	_cont
;	.line	101; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont+=1;
	INCFSZ	_cont, F, B
	BRA	_52458_DS_
; removed redundant BANKSEL
	INCF	(_cont + 1), F, B
_52458_DS_:
;	.line	94; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	UPPER(__str_19)
	MOVWF	r0x02
	MOVLW	HIGH(__str_19)
	MOVWF	r0x01
	MOVLW	LOW(__str_19)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_02177_DS_
_02150_DS_:
;	.line	105; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "eepromRead", 10)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_21)
	MOVWF	r0x05
	MOVLW	HIGH(__str_21)
	MOVWF	r0x04
	MOVLW	LOW(__str_21)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_02147_DS_
;	.line	106; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	r0x05
	MOVLW	HIGH(__str_11)
	MOVWF	r0x04
	MOVLW	LOW(__str_11)
	MOVWF	r0x03
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
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
_02180_DS_:
	BANKSEL	_bloque
	MOVF	_bloque, W, B
	BNZ	_02412_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	BNZ	_02412_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 2), W, B
	BNZ	_02412_DS_
	GOTO	_02199_DS_
_02412_DS_:
	BANKSEL	_cont
;	.line	107; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	switch (cont){
	MOVF	_cont, W, B
	BNZ	_02414_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02104_DS_
_02414_DS_:
	BANKSEL	_cont
	MOVF	_cont, W, B
	XORLW	0x01
	BNZ	_02415_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02416_DS_
_02415_DS_:
	BRA	_02104_DS_
_02416_DS_:
	BANKSEL	(_bloque + 2)
;	.line	110; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	CDCprintf("%d\n",EEPROM_read8(atoi(bloque)));
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_EEPROM_read8
	MOVWF	r0x00
	MOVF	POSTINC1, F
	CLRF	r0x01
	MOVLW	UPPER(__str_18)
	MOVWF	r0x04
	MOVLW	HIGH(__str_18)
	MOVWF	r0x03
	MOVLW	LOW(__str_18)
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x05
	ADDWF	FSR1L, F
_02104_DS_:
	BANKSEL	_cont
;	.line	113; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont+=1;
	INCFSZ	_cont, F, B
	BRA	_62459_DS_
; removed redundant BANKSEL
	INCF	(_cont + 1), F, B
_62459_DS_:
;	.line	106; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	UPPER(__str_19)
	MOVWF	r0x02
	MOVLW	HIGH(__str_19)
	MOVWF	r0x01
	MOVLW	LOW(__str_19)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_02180_DS_
_02147_DS_:
;	.line	117; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "eepromWrite", 11)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_22)
	MOVWF	r0x05
	MOVLW	HIGH(__str_22)
	MOVWF	r0x04
	MOVLW	LOW(__str_22)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0b
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_02144_DS_
;	.line	118; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	r0x05
	MOVLW	HIGH(__str_11)
	MOVWF	r0x04
	MOVLW	LOW(__str_11)
	MOVWF	r0x03
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
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
_02183_DS_:
	BANKSEL	_bloque
	MOVF	_bloque, W, B
	BNZ	_02418_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	BNZ	_02418_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 2), W, B
	BNZ	_02418_DS_
	GOTO	_02199_DS_
_02418_DS_:
;	.line	119; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	switch (cont){
	BSF	STATUS, 0
	BANKSEL	(_cont + 1)
	BTFSS	(_cont + 1), 7, B
	BCF	STATUS, 0
	BTFSC	STATUS, 0
	BRA	_02109_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_02419_DS_
	MOVLW	0x03
; removed redundant BANKSEL
	SUBWF	_cont, W, B
_02419_DS_:
	BTFSC	STATUS, 0
	BRA	_02109_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	BANKSEL	_cont
	RLCF	_cont, W, B
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_02420_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_02420_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_02420_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_02420_DS_:
	GOTO	_02106_DS_
	GOTO	_02107_DS_
	GOTO	_02108_DS_
_02106_DS_:
;	.line	120; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	case 0: break;
	BRA	_02109_DS_
_02107_DS_:
	BANKSEL	(_bloque + 2)
;	.line	122; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	par1=atoi(bloque);
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	BANKSEL	_par1
	MOVWF	_par1, B
	MOVFF	PRODL, (_par1 + 1)
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	123; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	break;
	BRA	_02109_DS_
_02108_DS_:
;	.line	125; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	bloque = strtok(bloque,")");
	MOVLW	UPPER(__str_19)
	MOVWF	r0x02
	MOVLW	HIGH(__str_19)
	MOVWF	r0x01
	MOVLW	LOW(__str_19)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_bloque + 2)
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BANKSEL	_par1
;	.line	126; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	EEPROM_write8(par1, atoi(bloque));
	MOVF	_par1, W, B
	MOVWF	r0x00
	BANKSEL	(_bloque + 2)
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_EEPROM_write8
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_02109_DS_:
	BANKSEL	_cont
;	.line	129; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont+=1;
	INCFSZ	_cont, F, B
	BRA	_72460_DS_
; removed redundant BANKSEL
	INCF	(_cont + 1), F, B
_72460_DS_:
;	.line	118; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ",") ){
	MOVLW	UPPER(__str_12)
	MOVWF	r0x02
	MOVLW	HIGH(__str_12)
	MOVWF	r0x01
	MOVLW	LOW(__str_12)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_02183_DS_
_02144_DS_:
;	.line	133; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "delay", 5)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_23)
	MOVWF	r0x05
	MOVLW	HIGH(__str_23)
	MOVWF	r0x04
	MOVLW	LOW(__str_23)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x05
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_02141_DS_
;	.line	134; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	r0x05
	MOVLW	HIGH(__str_11)
	MOVWF	r0x04
	MOVLW	LOW(__str_11)
	MOVWF	r0x03
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
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
_02186_DS_:
	BANKSEL	_bloque
	MOVF	_bloque, W, B
	BNZ	_02422_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	BNZ	_02422_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 2), W, B
	BNZ	_02422_DS_
	GOTO	_02199_DS_
_02422_DS_:
	BANKSEL	_cont
;	.line	135; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	switch (cont){
	MOVF	_cont, W, B
	BNZ	_02424_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02113_DS_
_02424_DS_:
	BANKSEL	_cont
	MOVF	_cont, W, B
	XORLW	0x01
	BNZ	_02425_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02426_DS_
_02425_DS_:
	BRA	_02113_DS_
_02426_DS_:
	BANKSEL	(_bloque + 2)
;	.line	138; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	Delayms(atoi(bloque));
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_02113_DS_:
	BANKSEL	_cont
;	.line	141; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont+=1;
	INCFSZ	_cont, F, B
	BRA	_82461_DS_
; removed redundant BANKSEL
	INCF	(_cont + 1), F, B
_82461_DS_:
;	.line	134; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	UPPER(__str_19)
	MOVWF	r0x02
	MOVLW	HIGH(__str_19)
	MOVWF	r0x01
	MOVLW	LOW(__str_19)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_02186_DS_
_02141_DS_:
;	.line	145; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "delayMicroseconds", 17)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_24)
	MOVWF	r0x05
	MOVLW	HIGH(__str_24)
	MOVWF	r0x04
	MOVLW	LOW(__str_24)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x11
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_02138_DS_
;	.line	146; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_11)
	MOVWF	r0x05
	MOVLW	HIGH(__str_11)
	MOVWF	r0x04
	MOVLW	LOW(__str_11)
	MOVWF	r0x03
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
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
_02189_DS_:
	BANKSEL	_bloque
	MOVF	_bloque, W, B
	BNZ	_02428_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	BNZ	_02428_DS_
; removed redundant BANKSEL
	MOVF	(_bloque + 2), W, B
	BNZ	_02428_DS_
	BRA	_02199_DS_
_02428_DS_:
	BANKSEL	_cont
;	.line	147; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	switch (cont){
	MOVF	_cont, W, B
	BNZ	_02430_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02117_DS_
_02430_DS_:
	BANKSEL	_cont
	MOVF	_cont, W, B
	XORLW	0x01
	BNZ	_02431_DS_
; removed redundant BANKSEL
	MOVF	(_cont + 1), W, B
	BZ	_02432_DS_
_02431_DS_:
	BRA	_02117_DS_
_02432_DS_:
	BANKSEL	(_bloque + 2)
;	.line	150; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	Delayus(atoi(bloque));
	MOVF	(_bloque + 2), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_bloque + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bloque, W, B
	MOVWF	POSTDEC1
	CALL	_atoi
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Delayus
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	151; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	CDCprintf("Done\n");
	MOVLW	UPPER(__str_25)
	MOVWF	r0x02
	MOVLW	HIGH(__str_25)
	MOVWF	r0x01
	MOVLW	LOW(__str_25)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x03
	ADDWF	FSR1L, F
_02117_DS_:
	BANKSEL	_cont
;	.line	154; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	cont+=1;
	INCFSZ	_cont, F, B
	BRA	_92462_DS_
; removed redundant BANKSEL
	INCF	(_cont + 1), F, B
_92462_DS_:
;	.line	146; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (bloque = strtok(lectura,"("); bloque != NULL; bloque = strtok(NULL, ")") ){
	MOVLW	UPPER(__str_19)
	MOVWF	r0x02
	MOVLW	HIGH(__str_19)
	MOVWF	r0x01
	MOVLW	LOW(__str_19)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_strtok
	BANKSEL	_bloque
	MOVWF	_bloque, B
	MOVFF	PRODL, (_bloque + 1)
	MOVFF	PRODH, (_bloque + 2)
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_02189_DS_
_02138_DS_:
;	.line	158; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "allOutput", 9)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_26)
	MOVWF	r0x05
	MOVLW	HIGH(__str_26)
	MOVWF	r0x04
	MOVLW	LOW(__str_26)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x09
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_02135_DS_
	BANKSEL	_i
;	.line	159; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (i=0;i<=TotalPines;i++){
	CLRF	_i, B
; removed redundant BANKSEL
	CLRF	(_i + 1), B
_02191_DS_:
	BANKSEL	_i
;	.line	160; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	pinmode(i,OUTPUT);
	MOVF	_i, W, B
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	_i
;	.line	161; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	digitalwrite(i,LOW);
	MOVF	_i, W, B
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	_i
;	.line	159; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (i=0;i<=TotalPines;i++){
	INCFSZ	_i, F, B
	BRA	_102463_DS_
; removed redundant BANKSEL
	INCF	(_i + 1), F, B
_102463_DS_:
	BANKSEL	(_i + 1)
	MOVF	(_i + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_02433_DS_
	MOVLW	0x12
; removed redundant BANKSEL
	SUBWF	_i, W, B
_02433_DS_:
	BNC	_02191_DS_
	BRA	_02199_DS_
_02135_DS_:
;	.line	165; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "allInput", 8)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_27)
	MOVWF	r0x05
	MOVLW	HIGH(__str_27)
	MOVWF	r0x04
	MOVLW	LOW(__str_27)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_02132_DS_
	BANKSEL	_i
;	.line	166; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (i=0;i<=TotalPines;i++)
	CLRF	_i, B
; removed redundant BANKSEL
	CLRF	(_i + 1), B
_02193_DS_:
	BANKSEL	_i
;	.line	167; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	pinmode(i,INPUT);
	MOVF	_i, W, B
	MOVWF	r0x00
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	_i
;	.line	166; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (i=0;i<=TotalPines;i++)
	INCFSZ	_i, F, B
	BRA	_112464_DS_
; removed redundant BANKSEL
	INCF	(_i + 1), F, B
_112464_DS_:
	BANKSEL	(_i + 1)
	MOVF	(_i + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_02434_DS_
	MOVLW	0x12
; removed redundant BANKSEL
	SUBWF	_i, W, B
_02434_DS_:
	BNC	_02193_DS_
	BRA	_02199_DS_
_02132_DS_:
;	.line	170; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "allHigh", 7)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_28)
	MOVWF	r0x05
	MOVLW	HIGH(__str_28)
	MOVWF	r0x04
	MOVLW	LOW(__str_28)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x07
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_02129_DS_
	BANKSEL	_i
;	.line	171; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (i=0;i<=TotalPines;i++){
	CLRF	_i, B
; removed redundant BANKSEL
	CLRF	(_i + 1), B
_02195_DS_:
	BANKSEL	_i
;	.line	172; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	pinmode(i,OUTPUT);
	MOVF	_i, W, B
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	_i
;	.line	173; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	digitalwrite(i,HIGH);
	MOVF	_i, W, B
	MOVWF	r0x00
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	_i
;	.line	171; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (i=0;i<=TotalPines;i++){
	INCFSZ	_i, F, B
	BRA	_122465_DS_
; removed redundant BANKSEL
	INCF	(_i + 1), F, B
_122465_DS_:
	BANKSEL	(_i + 1)
	MOVF	(_i + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_02435_DS_
	MOVLW	0x12
; removed redundant BANKSEL
	SUBWF	_i, W, B
_02435_DS_:
	BNC	_02195_DS_
	BRA	_02199_DS_
_02129_DS_:
;	.line	177; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "allLow", 6)==0){
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_29)
	MOVWF	r0x05
	MOVLW	HIGH(__str_29)
	MOVWF	r0x04
	MOVLW	LOW(__str_29)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_02126_DS_
	BANKSEL	_i
;	.line	178; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (i=0;i<=TotalPines;i++){
	CLRF	_i, B
; removed redundant BANKSEL
	CLRF	(_i + 1), B
_02197_DS_:
	BANKSEL	_i
;	.line	179; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	pinmode(i,OUTPUT);
	MOVF	_i, W, B
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	_i
;	.line	180; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	digitalwrite(i,LOW);
	MOVF	_i, W, B
	MOVWF	r0x00
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_digitalwrite
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	_i
;	.line	178; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	for (i=0;i<=TotalPines;i++){
	INCFSZ	_i, F, B
	BRA	_132466_DS_
; removed redundant BANKSEL
	INCF	(_i + 1), F, B
_132466_DS_:
	BANKSEL	(_i + 1)
	MOVF	(_i + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_02436_DS_
	MOVLW	0x12
; removed redundant BANKSEL
	SUBWF	_i, W, B
_02436_DS_:
	BNC	_02197_DS_
	BRA	_02199_DS_
_02126_DS_:
;	.line	184; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	else if (strncmp(lectura, "reset", 5)==0)
	MOVLW	HIGH(_lectura)
	MOVWF	r0x01
	MOVLW	LOW(_lectura)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	UPPER(__str_30)
	MOVWF	r0x05
	MOVLW	HIGH(__str_30)
	MOVWF	r0x04
	MOVLW	LOW(__str_30)
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x05
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
	CALL	_strncmp
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_02199_DS_
	reset 
_02199_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__leer_cadena	code
_leer_cadena:
;	.line	19; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	void leer_cadena() {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
;	.line	22; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	int cont=1;
	MOVLW	0x01
	MOVWF	r0x00
	CLRF	r0x01
_02061_DS_:
;	.line	23; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	while (cont){    
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_02063_DS_
;	.line	24; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	receivedbyte=CDCgets(valor_leido);
	MOVLW	0x80
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_leer_cadena_valor_leido_1_305)
	MOVWF	POSTDEC1
	MOVLW	LOW(_leer_cadena_valor_leido_1_305)
	MOVWF	POSTDEC1
	CALL	_CDCgets
	MOVWF	r0x02
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	25; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	valor_leido[receivedbyte]=0;
	MOVLW	LOW(_leer_cadena_valor_leido_1_305)
	ADDWF	r0x02, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_leer_cadena_valor_leido_1_305)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	CLRF	INDF0
;	.line	26; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	if (receivedbyte>0) cont=0;}
	MOVF	r0x02, W
	BZ	_02061_DS_
	CLRF	r0x00
	CLRF	r0x01
	BRA	_02061_DS_
_02063_DS_:
;	.line	27; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	strcpy(lectura,valor_leido);}
	MOVLW	0x80
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_leer_cadena_valor_leido_1_305)
	MOVWF	POSTDEC1
	MOVLW	LOW(_leer_cadena_valor_leido_1_305)
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_lectura)
	MOVWF	POSTDEC1
	MOVLW	LOW(_lectura)
	MOVWF	POSTDEC1
	CALL	_strcpy
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	17; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/user.c	}
	RETURN	

; ; Starting pCode block
S_main__IOsetRemap	code
_IOsetRemap:
;	.line	157; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/io.c	void IOsetRemap(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	nop 
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__IOsetDigital	code
_IOsetDigital:
;	.line	46; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/io.c	ADCON1 = 0x0F;				// AN0 to AN12 Digital I/O
	MOVLW	0x0f
	MOVWF	_ADCON1
;	.line	47; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/io.c	CMCON = 0x07;               // Comparators as Digital I/O
	MOVLW	0x07
	MOVWF	_CMCON
;	.line	50; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/io.c	TRISA = 0x00;
	CLRF	_TRISA
;	.line	51; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/io.c	TRISB = 0x00;
	CLRF	_TRISB
;	.line	52; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/io.c	TRISC = 0x00;
	CLRF	_TRISC
;	.line	59; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/io.c	LATA  = 0x00;
	CLRF	_LATA
;	.line	60; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/io.c	LATB  = 0x00;
	CLRF	_LATB
;	.line	61; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/io.c	LATC  = 0x00;
	CLRF	_LATC
	RETURN	

; ; Starting pCode block
S_main__PWM_set_percent_dutycycle	code
_PWM_set_percent_dutycycle:
;	.line	173; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	void PWM_set_percent_dutycycle(u8 pin, u8 percent)
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
;	.line	176; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	if (percent == 0)
	MOVF	r0x01, W
	BNZ	_02029_DS_
;	.line	178; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	duty = 0;
	CLRF	r0x02
	CLRF	r0x03
	BRA	_02030_DS_
_02029_DS_:
;	.line	180; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	else if (percent >= 100)
	MOVLW	0x64
	SUBWF	r0x01, W
	BNC	_02026_DS_
	BANKSEL	__pr2_plus1
;	.line	182; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	duty = _pr2_plus1 - 1;
	MOVF	__pr2_plus1, W, B
	ADDLW	0xff
	MOVWF	r0x02
	MOVLW	0xff
; removed redundant BANKSEL
	ADDWFC	(__pr2_plus1 + 1), W, B
	MOVWF	r0x03
	BRA	_02030_DS_
_02026_DS_:
;	.line	186; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	duty = percent * (_pr2_plus1 / 4) / 25;	// (factor PR2/100)
	BCF	STATUS, 0
	BANKSEL	(__pr2_plus1 + 1)
	RRCF	(__pr2_plus1 + 1), W, B
	MOVWF	r0x05
; removed redundant BANKSEL
	RRCF	__pr2_plus1, W, B
	MOVWF	r0x04
	BCF	STATUS, 0
	RRCF	r0x05, F
	RRCF	r0x04, F
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x01
	MOVFF	PRODL, r0x04
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	POSTDEC1
	MOVLW	0x19
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x04
	ADDWF	FSR1L, F
_02030_DS_:
;	.line	188; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	PWM_set_dutycycle(pin, duty << 2);
	MOVF	r0x02, W
	MOVWF	r0x01
	ADDWF	r0x01, F
	RLCF	r0x03, W
	MOVWF	r0x04
	BCF	STATUS, 0
	RLCF	r0x01, F
	RLCF	r0x04, F
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_PWM_set_dutycycle
	MOVLW	0x03
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
S_main__PWM_set_dutycycle	code
_PWM_set_dutycycle:
;	.line	115; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	void PWM_set_dutycycle(u8 pin, u16 duty)
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
;	.line	119; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	if (duty > 1023) duty = 1023;		// upper limit (10-bit)
	MOVF	r0x02, W
	ANDLW	0xfc
	BZ	_01991_DS_
	SETF	r0x01
	MOVLW	0x03
	MOVWF	r0x02
_01991_DS_:
;	.line	122; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	pinmode(pin, INPUT);				// PWM pin as INPUT
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	__pr2_plus1
;	.line	124; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	PR2 = _pr2_plus1 - 1;				// set PR2
	MOVF	__pr2_plus1, W, B
	MOVWF	r0x03
	DECF	r0x03, W
	MOVWF	_PR2
;	.line	126; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	switch (pin)
	MOVF	r0x00, W
	XORLW	0x0b
	BZ	_01993_DS_
	MOVF	r0x00, W
	XORLW	0x0c
	BNZ	_01995_DS_
;	.line	130; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	CCP1CON = 0b00001111;
	MOVLW	0x0f
	MOVWF	_CCP1CON
;	.line	132; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	temp = duty & 0b00000011;		// extract 2 LSbits of the duty
	MOVLW	0x03
	ANDWF	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
;	.line	133; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	temp <<= 4;						// shift left 4 bits
	SWAPF	r0x03, W
	ANDLW	0xf0
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
;	.line	134; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	CCP1CON |= temp;				// put in CCP2CON 4:5
	IORWF	_CCP1CON, F
;	.line	135; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	CCPR1L = duty >> 2;				// 8 MSbits of the duty
	BCF	STATUS, 0
	RRCF	r0x02, W
	MOVWF	r0x05
	RRCF	r0x01, W
	MOVWF	r0x04
	BCF	STATUS, 0
	RRCF	r0x05, F
	RRCF	r0x04, F
	MOVF	r0x04, W
	MOVWF	_CCPR1L
;	.line	136; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	break;
	BRA	_01995_DS_
_01993_DS_:
;	.line	139; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	CCP2CON = 0b00001111;			// reset also 2 LSbits of duty cycle
	MOVLW	0x0f
	MOVWF	_CCP2CON
;	.line	141; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	temp = duty & 0b00000011;		// extract 2 LSbits of duty
	MOVLW	0x03
	ANDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x03
;	.line	142; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	temp <<= 4;						// shift left 4 bits
	SWAPF	r0x03, W
	ANDLW	0xf0
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
;	.line	143; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	CCP2CON |= temp;				// put in CCP2CON 4:5  (DCBx1 and DCBx0)
	IORWF	_CCP2CON, F
;	.line	144; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	CCPR2L = duty >> 2;				// 8 MSbits of duty
	BCF	STATUS, 0
	RRCF	r0x02, F
	RRCF	r0x01, F
	BCF	STATUS, 0
	RRCF	r0x02, F
	RRCF	r0x01, F
	MOVF	r0x01, W
	MOVWF	_CCPR2L
_01995_DS_:
;	.line	153; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	intUsed[INT_TMR2] = INT_USED;		// tell interrupt.c we use TMR2
	MOVLW	0x01
	BANKSEL	(_intUsed + 2)
	MOVWF	(_intUsed + 2), B
;	.line	155; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	T2CON = _t2con;						// Timer2 prescaler
	MOVFF	__t2con, _T2CON
;	.line	156; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	T2CONbits.TMR2ON = ON;				// enable Timer2
	BSF	_T2CONbits, 2
_01996_DS_:
;	.line	158; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	while (PIR1bits.TMR2IF == 0);		// Wait until TMR2 overflows
	BTFSS	_PIR1bits, 1
	BRA	_01996_DS_
;	.line	159; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	pinmode(pin, OUTPUT);				// PWM pin as OUTPUT
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pinmode
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__PWM_set_frequency	code
_PWM_set_frequency:
;	.line	72; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	void PWM_set_frequency(u32 freq)
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
;	.line	75; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	_pr2_plus1 = SystemGetClock() / 4 / freq;	// FOSC / (4 * PWM Frequency)
	BCF	STATUS, 0
	BANKSEL	(__cpu_clock_ + 3)
	RRCF	(__cpu_clock_ + 3), W, B
	MOVWF	r0x07
; removed redundant BANKSEL
	RRCF	(__cpu_clock_ + 2), W, B
	MOVWF	r0x06
; removed redundant BANKSEL
	RRCF	(__cpu_clock_ + 1), W, B
	MOVWF	r0x05
; removed redundant BANKSEL
	RRCF	__cpu_clock_, W, B
	MOVWF	r0x04
	BCF	STATUS, 0
	RRCF	r0x07, F
	RRCF	r0x06, F
	RRCF	r0x05, F
	RRCF	r0x04, F
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BANKSEL	__pr2_plus1
	MOVWF	__pr2_plus1, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(__pr2_plus1 + 1), B
;	.line	81; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	if (_pr2_plus1 <= 4096)					// check if it's not too high
	MOVLW	0x10
; removed redundant BANKSEL
	SUBWF	(__pr2_plus1 + 1), W, B
	BNZ	_01983_DS_
	MOVLW	0x01
; removed redundant BANKSEL
	SUBWF	__pr2_plus1, W, B
_01983_DS_:
	BC	_01972_DS_
;	.line	83; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	if (_pr2_plus1 <= 256)				// no needs of any prescaler
	MOVLW	0x01
	BANKSEL	(__pr2_plus1 + 1)
	SUBWF	(__pr2_plus1 + 1), W, B
	BNZ	_01984_DS_
	MOVLW	0x01
; removed redundant BANKSEL
	SUBWF	__pr2_plus1, W, B
_01984_DS_:
	BC	_01968_DS_
	BANKSEL	__t2con
;	.line	85; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	_t2con = 0b00;					// prescaler is 1
	CLRF	__t2con, B
	BRA	_01972_DS_
_01968_DS_:
;	.line	87; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	else if (_pr2_plus1 <= 1024)		// needs prescaler 1:4
	MOVLW	0x04
	BANKSEL	(__pr2_plus1 + 1)
	SUBWF	(__pr2_plus1 + 1), W, B
	BNZ	_01985_DS_
	MOVLW	0x01
; removed redundant BANKSEL
	SUBWF	__pr2_plus1, W, B
_01985_DS_:
	BC	_01965_DS_
;	.line	89; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	_pr2_plus1 = _pr2_plus1 >> 2;	// divided by 4
	BCF	STATUS, 0
	BANKSEL	(__pr2_plus1 + 1)
	RRCF	(__pr2_plus1 + 1), F, B
; removed redundant BANKSEL
	RRCF	__pr2_plus1, F, B
	BCF	STATUS, 0
; removed redundant BANKSEL
	RRCF	(__pr2_plus1 + 1), F, B
; removed redundant BANKSEL
	RRCF	__pr2_plus1, F, B
;	.line	90; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	_t2con = 0b01;					// prescaler is 4
	MOVLW	0x01
	BANKSEL	__t2con
	MOVWF	__t2con, B
	BRA	_01972_DS_
_01965_DS_:
;	.line	94; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	_pr2_plus1 = _pr2_plus1 >> 4;	// divided by 16
	MOVLW	0xf0
	BANKSEL	__pr2_plus1
	ANDWF	__pr2_plus1, F, B
	SWAPF	__pr2_plus1, F, B
; removed redundant BANKSEL
	SWAPF	(__pr2_plus1 + 1), F, B
	ANDWF	(__pr2_plus1 + 1), W, B
	XORWF	(__pr2_plus1 + 1), F, B
; removed redundant BANKSEL
	ADDWF	__pr2_plus1, F, B
;	.line	95; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/pwm.c	_t2con = 0b10;					// prescaler is 16
	MOVLW	0x02
	BANKSEL	__t2con
	MOVWF	__t2con, B
_01972_DS_:
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
S_main__userlowinterrupt	code
_userlowinterrupt:
;	.line	1360; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__userhighinterrupt	code
_userhighinterrupt:
;	.line	1173; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__IntTimerStop	code
_IntTimerStop:
;	.line	413; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__IntTimerStart	code
_IntTimerStart:
;	.line	381; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	}
	RETURN	

; ; Starting pCode block
S_main__IntInit	code
_IntInit:
;	.line	335; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	void IntInit()
	MOVFF	r0x00, POSTDEC1
;	.line	339; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	RCONbits.IPEN = 1;					// Enable HP/LP interrupts
	BSF	_RCONbits, 7
;	.line	341; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.GIEH = 0;                // Disable global HP interrupts
	BCF	_INTCONbits, 7
;	.line	342; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.GIEL = 0;                // Disable global LP interrupts
	BCF	_INTCONbits, 6
;	.line	344; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	for (i = 0; i < INT_NUM; i++)		// Disable all interrupts
	CLRF	r0x00
_01928_DS_:
;	.line	345; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	IntSetEnable(i, INT_DISABLE);
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_IntSetEnable
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	344; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	for (i = 0; i < INT_NUM; i++)		// Disable all interrupts
	INCF	r0x00, F
	MOVLW	0x21
	SUBWF	r0x00, W
	BNC	_01928_DS_
;	.line	347; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.GIEH = 1;				// Enable HP interrupts
	BSF	_INTCONbits, 7
;	.line	348; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.GIEL = 1;				// Enable LP interrupts
	BSF	_INTCONbits, 6
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__IntClearFlag	code
_IntClearFlag:
;	.line	218; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	void IntClearFlag(u8 inter)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	220; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	switch(inter)
	MOVF	r0x00, W
	BNZ	_01886_DS_
	BRA	_01809_DS_
_01886_DS_:
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_01888_DS_
	BRA	_01810_DS_
_01888_DS_:
	MOVF	r0x00, W
	XORLW	0x02
	BZ	_01811_DS_
	MOVF	r0x00, W
	XORLW	0x03
	BZ	_01812_DS_
	MOVF	r0x00, W
	XORLW	0x09
	BZ	_01806_DS_
	MOVF	r0x00, W
	XORLW	0x0a
	BZ	_01807_DS_
	MOVF	r0x00, W
	XORLW	0x0b
	BZ	_01808_DS_
	MOVF	r0x00, W
	XORLW	0x0d
	BZ	_01813_DS_
	MOVF	r0x00, W
	XORLW	0x0e
	BZ	_01818_DS_
	MOVF	r0x00, W
	XORLW	0x0f
	BZ	_01819_DS_
	MOVF	r0x00, W
	XORLW	0x10
	BZ	_01821_DS_
	MOVF	r0x00, W
	XORLW	0x12
	BZ	_01816_DS_
	MOVF	r0x00, W
	XORLW	0x13
	BZ	_01817_DS_
	MOVF	r0x00, W
	XORLW	0x16
	BZ	_01815_DS_
	MOVF	r0x00, W
	XORLW	0x17
	BZ	_01820_DS_
	MOVF	r0x00, W
	XORLW	0x18
	BZ	_01822_DS_
	MOVF	r0x00, W
	XORLW	0x19
	BZ	_01824_DS_
	MOVF	r0x00, W
	XORLW	0x1a
	BZ	_01823_DS_
	MOVF	r0x00, W
	XORLW	0x1c
	BZ	_01814_DS_
	BRA	_01826_DS_
_01806_DS_:
;	.line	223; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.INT0IF = 0;
	BCF	_INTCONbits, 1
;	.line	224; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01807_DS_:
;	.line	226; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCON3bits.INT1IF = 0;
	BCF	_INTCON3bits, 0
;	.line	227; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01808_DS_:
;	.line	229; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCON3bits.INT2IF = 0;
	BCF	_INTCON3bits, 1
;	.line	230; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01809_DS_:
;	.line	232; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.TMR0IF = 0;
	BCF	_INTCONbits, 2
;	.line	233; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01810_DS_:
;	.line	235; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR1bits.TMR1IF = 0;
	BCF	_PIR1bits, 0
;	.line	236; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01811_DS_:
;	.line	238; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR1bits.TMR2IF = 0;
	BCF	_PIR1bits, 1
;	.line	239; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01812_DS_:
;	.line	241; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR2bits.TMR3IF = 0;
	BCF	_PIR2bits, 1
;	.line	242; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01813_DS_:
;	.line	252; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.RBIF = 0;
	BCF	_INTCONbits, 0
;	.line	254; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01814_DS_:
;	.line	261; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR2bits.USBIF = 0;
	BCF	_PIR2bits, 5
;	.line	263; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01815_DS_:
;	.line	266; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR1bits.ADIF = 0;
	BCF	_PIR1bits, 6
;	.line	267; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01816_DS_:
;	.line	269; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR1bits.RCIF = 0;
	BCF	_PIR1bits, 5
;	.line	270; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01817_DS_:
;	.line	272; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR1bits.TXIF = 0;
	BCF	_PIR1bits, 4
;	.line	273; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01818_DS_:
;	.line	275; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR1bits.CCP1IF = 0;
	BCF	_PIR1bits, 2
;	.line	276; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01819_DS_:
;	.line	280; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR2bits.CCP2IF = 0;
	BCF	_PIR2bits, 0
;	.line	281; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01820_DS_:
;	.line	284; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR2bits.OSCFIF = 0;
	BCF	_PIR2bits, 7
;	.line	285; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01821_DS_:
;	.line	288; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR2bits.CMIF = 0;
	BCF	_PIR2bits, 6
;	.line	293; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01822_DS_:
;	.line	296; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR2bits.EEIF = 0;
	BCF	_PIR2bits, 4
;	.line	297; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01823_DS_:
;	.line	301; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR2bits.BCLIF = 0;
	BCF	_PIR2bits, 3
;	.line	306; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01826_DS_
_01824_DS_:
;	.line	309; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIR2bits.HLVDIF = 0;
	BCF	_PIR2bits, 2
_01826_DS_:
;	.line	325; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__IntEnable	code
_IntEnable:
;	.line	205; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	void IntEnable(u8 inter)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	207; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	IntSetEnable(inter, INT_ENABLE);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_IntSetEnable
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__IntDisable	code
_IntDisable:
;	.line	200; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	void IntDisable(u8 inter)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	202; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	IntSetEnable(inter, INT_DISABLE);
	CLRF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_IntSetEnable
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__IntSetEnable	code
_IntSetEnable:
;	.line	85; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	void IntSetEnable(u8 inter, u8 enable)
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
;	.line	87; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	if (enable == INT_DISABLE)
	MOVF	r0x01, W
	BNZ	_01670_DS_
;	.line	88; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	intUsed[inter] = INT_NOT_USED;	// This interrupt is no longer used
	MOVLW	LOW(_intUsed)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_intUsed)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	CLRF	INDF0
	BRA	_01671_DS_
_01670_DS_:
;	.line	90; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	intUsed[inter] = INT_USED;	    // This interrupt is used
	MOVLW	LOW(_intUsed)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_intUsed)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
_01671_DS_:
;	.line	92; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	switch(inter)
	MOVF	r0x00, W
	BNZ	_01755_DS_
	BRA	_01675_DS_
_01755_DS_:
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_01757_DS_
	BRA	_01676_DS_
_01757_DS_:
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_01759_DS_
	BRA	_01677_DS_
_01759_DS_:
	MOVF	r0x00, W
	XORLW	0x03
	BNZ	_01761_DS_
	BRA	_01678_DS_
_01761_DS_:
	MOVF	r0x00, W
	XORLW	0x09
	BZ	_01672_DS_
	MOVF	r0x00, W
	XORLW	0x0a
	BNZ	_01765_DS_
	BRA	_01673_DS_
_01765_DS_:
	MOVF	r0x00, W
	XORLW	0x0b
	BNZ	_01767_DS_
	BRA	_01674_DS_
_01767_DS_:
	MOVF	r0x00, W
	XORLW	0x0d
	BNZ	_01769_DS_
	BRA	_01679_DS_
_01769_DS_:
	MOVF	r0x00, W
	XORLW	0x0e
	BNZ	_01771_DS_
	BRA	_01684_DS_
_01771_DS_:
	MOVF	r0x00, W
	XORLW	0x0f
	BNZ	_01773_DS_
	BRA	_01685_DS_
_01773_DS_:
	MOVF	r0x00, W
	XORLW	0x10
	BNZ	_01775_DS_
	BRA	_01687_DS_
_01775_DS_:
	MOVF	r0x00, W
	XORLW	0x12
	BNZ	_01777_DS_
	BRA	_01682_DS_
_01777_DS_:
	MOVF	r0x00, W
	XORLW	0x13
	BNZ	_01779_DS_
	BRA	_01683_DS_
_01779_DS_:
	MOVF	r0x00, W
	XORLW	0x16
	BNZ	_01781_DS_
	BRA	_01681_DS_
_01781_DS_:
	MOVF	r0x00, W
	XORLW	0x17
	BNZ	_01783_DS_
	BRA	_01686_DS_
_01783_DS_:
	MOVF	r0x00, W
	XORLW	0x18
	BNZ	_01785_DS_
	BRA	_01688_DS_
_01785_DS_:
	MOVF	r0x00, W
	XORLW	0x19
	BNZ	_01787_DS_
	BRA	_01690_DS_
_01787_DS_:
	MOVF	r0x00, W
	XORLW	0x1a
	BNZ	_01789_DS_
	BRA	_01689_DS_
_01789_DS_:
	MOVF	r0x00, W
	XORLW	0x1c
	BNZ	_01791_DS_
	BRA	_01680_DS_
_01791_DS_:
	BRA	_01692_DS_
_01672_DS_:
;	.line	95; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.INT0IE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_INTCONbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_INTCONbits
;	.line	96; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01673_DS_:
;	.line	98; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCON3bits.INT1IE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_INTCON3bits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_INTCON3bits
;	.line	99; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01674_DS_:
;	.line	101; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCON3bits.INT2IE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_INTCON3bits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_INTCON3bits
;	.line	102; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01675_DS_:
;	.line	104; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.TMR0IE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_INTCONbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_INTCONbits
;	.line	105; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01676_DS_:
;	.line	107; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE1bits.TMR1IE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_PIE1bits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_PIE1bits
;	.line	108; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01677_DS_:
;	.line	110; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE1bits.TMR2IE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE1bits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_PIE1bits
;	.line	111; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01678_DS_:
;	.line	113; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE2bits.TMR3IE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE2bits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_PIE2bits
;	.line	114; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01679_DS_:
;	.line	124; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	INTCONbits.RBIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_INTCONbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_INTCONbits
;	.line	126; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01680_DS_:
;	.line	133; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE2bits.USBIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE2bits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_PIE2bits
;	.line	135; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01681_DS_:
;	.line	138; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE1bits.ADIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE1bits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_PIE1bits
;	.line	139; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01682_DS_:
;	.line	141; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE1bits.RCIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE1bits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_PIE1bits
;	.line	142; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01683_DS_:
;	.line	144; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE1bits.TXIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE1bits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_PIE1bits
;	.line	145; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01684_DS_:
;	.line	147; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE1bits.CCP1IE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE1bits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_PIE1bits
;	.line	148; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01685_DS_:
;	.line	152; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE2bits.CCP2IE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_PIE2bits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_PIE2bits
;	.line	153; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01686_DS_:
;	.line	156; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE2bits.OSCFIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE2bits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_PIE2bits
;	.line	157; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01687_DS_:
;	.line	160; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE2bits.CMIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE2bits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_PIE2bits
;	.line	165; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01688_DS_:
;	.line	168; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE2bits.EEIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE2bits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_PIE2bits
;	.line	169; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01689_DS_:
;	.line	173; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE2bits.BCLIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE2bits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_PIE2bits
;	.line	178; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	break;
	BRA	_01692_DS_
_01690_DS_:
;	.line	181; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	PIE2bits.HLVDIE = enable;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_PIE2bits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_PIE2bits
_01692_DS_:
;	.line	197; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/interrupt.c	}
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__SystemClocksGetPeripheralFrequency	code
_SystemClocksGetPeripheralFrequency:
;	.line	226; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	u32 SystemClocksGetPeripheralFrequency() 
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	228; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	return SystemClocksGetCpuFrequency() >> 2;
	CALL	_SystemClocksGetCpuFrequency
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	BCF	STATUS, 0
	RRCF	r0x03, F
	RRCF	r0x02, F
	RRCF	r0x01, F
	RRCF	r0x00, F
	BCF	STATUS, 0
	RRCF	r0x03, F
	RRCF	r0x02, F
	RRCF	r0x01, F
	RRCF	r0x00, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__SystemClocksGetCpuFrequency	code
_SystemClocksGetCpuFrequency:
;	.line	181; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	u32 SystemClocksGetCpuFrequency() 
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	188; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	CPUDIV  = SystemReadFlashMemory(__CONFIG1L) & 0b00011000;
	CLRF	POSTDEC1
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_SystemReadFlashMemory
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x18
	ANDWF	r0x00, F
	CLRF	r0x01
;	.line	203; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	return 48000000L / cpudiv[CPUDIV];
	CLRF	r0x02
	MOVLW	LOW(_cpudiv)
	ADDWF	r0x00, F
	MOVLW	HIGH(_cpudiv)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_cpudiv)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
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
	CALL	__divslong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
;	.line	216; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	}
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__SystemReadFlashMemory	code
_SystemReadFlashMemory:
;	.line	147; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	u16 SystemReadFlashMemory(u32 address)
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
;	.line	151; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	TBLPTRU=address>>16;
	MOVF	r0x02, W
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x05
	CLRF	r0x06
	CLRF	r0x07
	MOVF	r0x04, W
	MOVWF	_TBLPTRU
;	.line	152; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	TBLPTRH=address>>8;
	MOVF	r0x01, W
	MOVWF	r0x04
	MOVF	r0x02, W
	MOVWF	r0x05
	MOVF	r0x03, W
	MOVWF	r0x06
	CLRF	r0x07
	MOVF	r0x04, W
	MOVWF	_TBLPTRH
;	.line	153; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	TBLPTRL=address;
	MOVF	r0x00, W
	MOVWF	_TBLPTRL
	tblrd*+ 
;	.line	155; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	l8=TABLAT;
	MOVFF	_TABLAT, r0x00
	tblrd*+ 
;	.line	157; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	h8=TABLAT;
	MOVFF	_TABLAT, r0x01
;	.line	158; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/oscillator.c	return((h8<<8)+l8);
	CLRF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x03
	CLRF	r0x05
	MOVF	r0x00, W
	ADDWF	r0x03, F
	MOVF	r0x05, W
	ADDWFC	r0x04, F
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
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
S_main__EEPROM_write16	code
_EEPROM_write16:
;	.line	113; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	void EEPROM_write16(u8 address, u16 mydata)
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
;	.line	120; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EEPROM_write8(address,   high8(mydata));
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_EEPROM_write8
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	121; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EEPROM_write8(address+1, low8(mydata));
	INCF	r0x00, F
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_EEPROM_write8
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__EEPROM_write8	code
_EEPROM_write8:
;	.line	81; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	void EEPROM_write8(u8 address, u8 mydata)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, _EEADR
	MOVLW	0x03
	MOVFF	PLUSW2, _EEDATA
;	.line	86; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON1bits.EEPGD = 0;
	BCF	_EECON1bits, 7
;	.line	87; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON1bits.CFGS = 0;
	BCF	_EECON1bits, 6
;	.line	88; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON1bits.WREN = 1;	// enable writes to data EEPROM
	BSF	_EECON1bits, 2
;	.line	89; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	INTCONbits.GIE = 0;		// disable interrupts
	BCF	_INTCONbits, 7
;	.line	90; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON2 = 0x55;
	MOVLW	0x55
	MOVWF	_EECON2
;	.line	91; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON2 = 0x0AA;
	MOVLW	0xaa
	MOVWF	_EECON2
;	.line	92; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON1bits.WR = 1;		// start writing
	BSF	_EECON1bits, 1
_01633_DS_:
;	.line	93; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	while (EECON1bits.WR)
	BTFSS	_EECON1bits, 1
	BRA	_01635_DS_
	nop 
	BRA	_01633_DS_
; ;;!!! pic16_aopOp:1117 called for a spillLocation -- assigning WREG instead --- CHECK
_01635_DS_:
;	.line	97; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	if (EECON1bits.WRERR)
	CLRF	WREG
	BTFSC	_EECON1bits, 3
	INCF	WREG, F
;	.line	103; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON1bits.WREN = 0;
	BCF	_EECON1bits, 2
;	.line	104; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	INTCONbits.GIE = 1;	// enable interrupts
	BSF	_INTCONbits, 7
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__EEPROM_read16	code
_EEPROM_read16:
;	.line	62; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	u16 EEPROM_read16(u8 address)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	68; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	hibyte = EEPROM_read8(address);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_EEPROM_read8
	MOVWF	r0x01
	MOVF	POSTINC1, F
;	.line	69; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	lobyte = EEPROM_read8(address+1);
	INCF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_EEPROM_read8
	MOVWF	r0x00
	MOVF	POSTINC1, F
;	.line	70; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	mydata = (hibyte << 8) | lobyte;
	MOVF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x03
	CLRF	r0x05
	MOVF	r0x00, W
	IORWF	r0x03, F
	MOVF	r0x05, W
	IORWF	r0x04, F
;	.line	71; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	return mydata;
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__EEPROM_read8	code
_EEPROM_read8:
;	.line	47; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	u8 EEPROM_read8(u8 address)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, _EEADR
;	.line	50; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON1bits.EEPGD = 0;
	BCF	_EECON1bits, 7
;	.line	51; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON1bits.CFGS = 0;
	BCF	_EECON1bits, 6
;	.line	52; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	EECON1bits.RD = 1;
	BSF	_EECON1bits, 0
;	.line	53; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/eeprom.c	return EEDATA;
	MOVF	_EEDATA, W
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__toggle	code
_toggle:
;	.line	254; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	void toggle(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	262; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	u8  b = mask[pin];          // 1<<bit
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
;	.line	265; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	pPORT = (__data u8*) (port[pin] + 0x0F80); // PORTx
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
;	.line	267; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	if ( *pPORT & b )           // bit is set ?
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x03
	MOVF	r0x01, W
	ANDWF	r0x03, W
	MOVWF	r0x04
	MOVF	r0x04, W
	BZ	_01616_DS_
;	.line	268; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	*pPORT &= (255-b);      // clear bit
	MOVF	r0x01, W
	SUBLW	0xff
	MOVWF	r0x04
	MOVF	r0x03, W
	ANDWF	r0x04, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x04, INDF0
	BRA	_01618_DS_
_01616_DS_:
;	.line	270; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	*pPORT |= b;            // set bit
	MOVF	r0x03, W
	IORWF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x01, INDF0
_01618_DS_:
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
;	.line	217; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	void pinmode(u8 pin, u8 state)
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
;	.line	241; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	u8  b = mask[pin];          // 1<<bit
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
;	.line	244; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	pTRIS = (__data u8*) (port[pin] + 0x0F92); // TRISx
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
;	.line	246; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	if (state)                  // if 1
	MOVF	r0x01, W
	BZ	_01608_DS_
;	.line	247; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	*pTRIS |= b;            // set bit (input)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x02, W
	IORWF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
	BRA	_01610_DS_
_01608_DS_:
;	.line	249; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	*pTRIS &= (255-b);      // clear bit (output)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
_01610_DS_:
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
;	.line	181; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	u8 digitalread(u8 pin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	206; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	u8  b = mask[pin];          // 1<<bit
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
;	.line	209; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	pPORT = (__data u8*) (port[pin] + 0x0F80); // PORTx
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
;	.line	211; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	if ( *pPORT & b )
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
	MOVF	r0x00, W
	ANDWF	r0x01, F
	MOVF	r0x01, W
	BZ	_01600_DS_
;	.line	212; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	return 1;               // bit is set
	MOVLW	0x01
	BRA	_01602_DS_
_01600_DS_:
;	.line	214; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	return 0;               // bit is not set
	CLRF	WREG
_01602_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__digitalwrite	code
_digitalwrite:
;	.line	146; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	void digitalwrite(u8 pin, u8 state)
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
;	.line	170; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	u8  b = mask[pin];          // 1<<bit
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
;	.line	173; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	pPORT = (__data u8*) (port[pin] + 0x0F80); // PORTx
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
;	.line	175; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	if (state)
	MOVF	r0x01, W
	BZ	_01592_DS_
;	.line	176; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	*pPORT |= b;            // set bit
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x02, W
	IORWF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
	BRA	_01594_DS_
_01592_DS_:
;	.line	178; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/digitalw.c	*pPORT &= (255-b);      // clear bit
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x02, W
	SUBLW	0xff
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ANDWF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
_01594_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__analogread	code
_analogread:
;	.line	64; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	u16 analogread(u8 channel)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	79; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	if(channel>=13 && channel<=17)
	MOVLW	0x0d
	SUBWF	r0x00, W
	BNC	_01550_DS_
	MOVLW	0x12
	SUBWF	r0x00, W
	BC	_01550_DS_
;	.line	80; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	ADCON0=(channel-13)*4;              // A0 = 13, A1 = 14, ...
	MOVLW	0xf3
	ADDWF	r0x00, W
; #	MOVWF	r0x01
; #;;multiply lit val:0x04 by variable r0x01 and store in _ADCON0
; #	MOVF	r0x01, W
	MOVWF	r0x01
	MULLW	0x04
	MOVFF	PRODL, _ADCON0
	BRA	_01551_DS_
_01550_DS_:
;	.line	81; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	else if(channel<=5)
	MOVLW	0x06
	SUBWF	r0x00, W
	BC	_01551_DS_
; ;multiply lit val:0x04 by variable r0x00 and store in _ADCON0
;	.line	82; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	ADCON0 = channel * 4;              // A0 = 0, A1 = 1, ...
	MOVF	r0x00, W
	MULLW	0x04
	MOVFF	PRODL, _ADCON0
_01551_DS_:
;	.line	86; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	ADCON0bits.ADON=1;
	BSF	_ADCON0bits, 0
;	.line	87; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	for (result=1;result<10;result++)
	MOVLW	0x09
	MOVWF	r0x00
	CLRF	r0x01
_01559_DS_:
	NOP 
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
;	.line	87; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	for (result=1;result<10;result++)
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_01559_DS_
;	.line	89; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	ADCON0bits.GO=1;
	BSF	_ADCON0bits, 1
_01554_DS_:
;	.line	90; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	while (ADCON0bits.GO);
	BTFSC	_ADCON0bits, 1
	BRA	_01554_DS_
;	.line	91; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	result=ADRESH<<8;
	MOVFF	_ADRESH, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x02
;	.line	92; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	result+=ADRESL;
	MOVFF	_ADRESL, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	ADDWF	r0x02, F
	MOVF	r0x01, W
	ADDWFC	r0x03, F
;	.line	93; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	ADCON0bits.ADON=0;
	BCF	_ADCON0bits, 0
;	.line	94; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	return(result);
	MOVFF	r0x03, PRODL
	MOVF	r0x02, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__analogReference	code
_analogReference:
;	.line	49; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	void analogReference(u8 Type)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
; #	MOVF	r0x00, W
; #	BTFSS	STATUS, 2
; #	GOTO	_01531_DS_
; #	GOTO	_01533_DS_
; #	MOVF	r0x00, W
;	.line	52; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	if(Type == DEFAULT)			//the default analog reference of 5 volts (on 5V Arduino boards) or 3.3 volts (on 3.3V Arduino boards)
	MOVF	r0x00, W
;	.line	53; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	ADCON1|=0x00;			//Vref+ = VDD
	BZ	_01533_DS_
;	.line	54; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	else if(Type == EXTERNAL)	//the voltage applied to the AREF pin (0 to 5V only) is used as the reference.
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_01533_DS_
;	.line	55; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	ADCON1|=0x10;			//Vref+ = External source
	BSF	_ADCON1, 4
_01533_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__analog_init	code
_analog_init:
;	.line	42; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	TRISA=TRISA | 0x2F; // 0b00101111 = RA0,1,2,3 and RA5 = AN0 to AN4 are INPUT
	MOVLW	0x2f
	IORWF	_TRISA, F
;	.line	43; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	ADCON1=0x0A;        // 0b00001000 = 0, 0, VRef-=VSS, VRef+=VDD, AN0 to AN4 enabled 
	MOVLW	0x0a
	MOVWF	_ADCON1
;	.line	44; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/analog.c	ADCON2=0xBD;        // 0b10111101 = Right justified, 0, 20 TAD, FOSC/16
	MOVLW	0xbd
	MOVWF	_ADCON2
	RETURN	

; ; Starting pCode block
S_main__CDC_interrupt	code
_CDC_interrupt:
;	.line	174; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	if(PIR2bits.USBIF)
	BTFSS	_PIR2bits, 5
	BRA	_01518_DS_
;	.line	176; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	PIR2bits.USBIF = 0;
	BCF	_PIR2bits, 5
;	.line	178; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
;	.line	179; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	UIRbits.SOFIF = 0;
	BCF	_UIRbits, 6
;	.line	180; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	UIRbits.URSTIF = 0;
	BCF	_UIRbits, 0
;	.line	182; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	UEIR = 0;
	CLRF	_UEIR
_01518_DS_:
	RETURN	

; ; Starting pCode block
S_main__CDCgetstring	code
_CDCgetstring:
;	.line	151; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	u8 * CDCgetstring(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	156; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	do {
	CLRF	r0x00
_01498_DS_:
;	.line	157; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	c = CDCgetkey();
	CALL	_CDCgetkey
	MOVWF	r0x01
;	.line	158; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf("%c", c);
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
	CALL	_CDCprintf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	159; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	_cdc_buffer[i++] = c;
	MOVFF	r0x00, r0x02
	INCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(__cdc_buffer)
	ADDWF	r0x02, F
	MOVLW	HIGH(__cdc_buffer)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
;	.line	160; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	} while (c != '\r');
	MOVF	r0x01, W
	XORLW	0x0d
	BNZ	_01498_DS_
;	.line	161; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	_cdc_buffer[i] = '\0';
	CLRF	r0x01
	MOVLW	LOW(__cdc_buffer)
	ADDWF	r0x00, F
	MOVLW	HIGH(__cdc_buffer)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	CLRF	INDF0
;	.line	162; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	return _cdc_buffer;
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVLW	LOW(__cdc_buffer)
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__CDCgetkey	code
_CDCgetkey:
;	.line	142; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	u8 CDCgetkey(void)
	MOVFF	r0x00, POSTDEC1
_01490_DS_:
;	.line	146; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	while (!CDCgets(_cdc_buffer));
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(__cdc_buffer)
	MOVWF	POSTDEC1
	MOVLW	LOW(__cdc_buffer)
	MOVWF	POSTDEC1
	CALL	_CDCgets
	MOVWF	r0x00
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BZ	_01490_DS_
	BANKSEL	__cdc_buffer
;	.line	147; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	return (_cdc_buffer[0]);	// return only the first character
	MOVF	__cdc_buffer, W, B
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__CDCprintln	code
_CDCprintln:
;	.line	132; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	void CDCprintln(const u8 *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	135; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	va_start(args, fmt);					// initialize the list
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
;	.line	137; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf(fmt, args);
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
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
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
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	138; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf("\n\r");
	MOVLW	UPPER(__str_6)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_6)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_6)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__CDCprint	code
_CDCprint:
;	.line	95; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	void CDCprint(const u8 *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	99; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	va_start(args, fmt);					// initialize the list
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
; #	MOVF	r0x02, W
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
; #	MOVF	r0x01, W
; #	MOVF	r0x01, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
; #	MOVF	r0x00, W
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
;	.line	100; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	s = (u8) va_arg(args, u32);				// get the first variable arg.
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget4
	MOVWF	r0x00
;	.line	103; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	switch (s)
	XORLW	0x01
	BNZ	_01470_DS_
	BRA	_01444_DS_
_01470_DS_:
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_01472_DS_
	BRA	_01446_DS_
_01472_DS_:
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_01474_DS_
	BRA	_01445_DS_
_01474_DS_:
	MOVF	r0x00, W
	XORLW	0x0a
	BZ	_01442_DS_
	MOVF	r0x00, W
	XORLW	0x10
	BNZ	_01478_DS_
	BRA	_01443_DS_
_01478_DS_:
	MOVF	r0x00, W
	XORLW	0x20
	BZ	_01480_DS_
	BRA	_01447_DS_
_01480_DS_:
;	.line	106; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf("%f", (u32)fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVFF	r0x07, r0x00
	MOVFF	r0x08, r0x01
	MOVFF	r0x09, r0x02
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	CLRF	POSTDEC1
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
	CALL	_CDCprintf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	107; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	break;
	BRA	_01449_DS_
_01442_DS_:
;	.line	109; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf("%d", (u32)fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVFF	r0x07, r0x00
	MOVFF	r0x08, r0x01
	MOVFF	r0x09, r0x02
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	CLRF	POSTDEC1
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
	CALL	_CDCprintf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	110; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	break;
	BRA	_01449_DS_
_01443_DS_:
;	.line	112; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf("%x", (u32)fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVFF	r0x07, r0x00
	MOVFF	r0x08, r0x01
	MOVFF	r0x09, r0x02
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	113; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	break;
	BRA	_01449_DS_
_01444_DS_:
;	.line	116; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf("%d", (u32)fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVFF	r0x07, r0x00
	MOVFF	r0x08, r0x01
	MOVFF	r0x09, r0x02
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	CLRF	POSTDEC1
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
	CALL	_CDCprintf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	117; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	break;
	BRA	_01449_DS_
_01445_DS_:
;	.line	119; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf("%o", (u32)fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVFF	r0x07, r0x00
	MOVFF	r0x08, r0x01
	MOVFF	r0x09, r0x02
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	120; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	break;
	BRA	_01449_DS_
_01446_DS_:
;	.line	122; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf("%b", (u32)fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVFF	r0x07, r0x00
	MOVFF	r0x08, r0x01
	MOVFF	r0x09, r0x02
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	CALL	_CDCprintf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	123; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	break;           
	BRA	_01449_DS_
_01447_DS_:
;	.line	125; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCprintf(fmt);
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x07
	MOVLW	0x03
	MOVFF	PLUSW2, r0x08
	MOVLW	0x04
	MOVFF	PLUSW2, r0x09
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	CALL	_CDCprintf
	MOVLW	0x03
	ADDWF	FSR1L, F
_01449_DS_:
;	.line	128; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	va_end(args);
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__CDCprintf	code
_CDCprintf:
;	.line	77; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	void CDCprintf(const u8 *fmt, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	84; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	va_start(args, fmt);
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
;	.line	87; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	length = psprintf2(_cdc_buffer, fmt, args);
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
	MOVLW	HIGH(__cdc_buffer)
	MOVWF	POSTDEC1
	MOVLW	LOW(__cdc_buffer)
	MOVWF	POSTDEC1
	CALL	_psprintf2
	MOVWF	r0x00
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	88; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCputs(_cdc_buffer,length);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(__cdc_buffer)
	MOVWF	POSTDEC1
	MOVLW	LOW(__cdc_buffer)
	MOVWF	POSTDEC1
	CALL	_CDCputs
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	89; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	va_end(args);
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__CDCwrite	code
_CDCwrite:
;	.line	71; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	void CDCwrite(u8 c)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
;	.line	73; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	CDCputs(c, 1);
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
;	.line	30; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	INTCON=0;                   // Disable global HP interrupts
	CLRF	_INTCON
;	.line	32; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	UCON=0;
	CLRF	_UCON
;	.line	33; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	UCFG=0;
	CLRF	_UCFG
;	.line	34; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	UEP0=0;UEP1=0;UEP2=0;UEP3=0;UEP4=0;UEP5=0;
	CLRF	_UEP0
	CLRF	_UEP1
	CLRF	_UEP2
	CLRF	_UEP3
	CLRF	_UEP4
	CLRF	_UEP5
;	.line	35; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	UEP6=0;UEP7=0;UEP8=0;UEP9=0;UEP10=0;UEP11=0;
	CLRF	_UEP6
	CLRF	_UEP7
	CLRF	_UEP8
	CLRF	_UEP9
	CLRF	_UEP10
	CLRF	_UEP11
;	.line	36; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	UEP12=0;UEP13=0;UEP14=0;UEP15=0;
	CLRF	_UEP12
	CLRF	_UEP13
	CLRF	_UEP14
	CLRF	_UEP15
;	.line	39; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	Delayms(2000);
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0xd0
	MOVWF	POSTDEC1
	CALL	_Delayms
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	42; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	UCFG = 0x14; 				// Enable pullup resistors; full speed mode
	MOVLW	0x14
	MOVWF	_UCFG
	BANKSEL	_deviceState
;	.line	43; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	deviceState = DETACHED;
	CLRF	_deviceState, B
	BANKSEL	_remoteWakeup
;	.line	44; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	remoteWakeup = 0x00;
	CLRF	_remoteWakeup, B
	BANKSEL	_currentConfiguration
;	.line	45; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	currentConfiguration = 0x00;
	CLRF	_currentConfiguration, B
_01414_DS_:
	BANKSEL	_deviceState
;	.line	48; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	while(deviceState != CONFIGURED)
	MOVF	_deviceState, W, B
	XORLW	0x05
	BZ	_01416_DS_
;	.line	50; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	EnableUSBModule();
	CALL	_EnableUSBModule
;	.line	51; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	ProcessUSBTransactions();
	CALL	_ProcessUSBTransactions
	BRA	_01414_DS_
_01416_DS_:
;	.line	60; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	PIR2bits.USBIF = 0;     // clear usb interrupt flag
	BCF	_PIR2bits, 5
;	.line	61; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	PIE2bits.USBIE = 1;     // enable usb interrupt
	BSF	_PIE2bits, 5
;	.line	62; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	IPR2bits.USBIP = 1;     // high priority interrupt
	BSF	_IPR2bits, 5
;	.line	64; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	INTCONbits.GIEH = 1;   // Enable global HP interrupts
	BSF	_INTCONbits, 7
;	.line	65; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/__cdc.c	INTCONbits.GIEL = 1;   // Enable global LP interrupts
	BSF	_INTCONbits, 6
	RETURN	

; ; Starting pCode block
S_main__psprintf	code
_psprintf:
;	.line	474; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 psprintf(u8 *out, const u8 *format, ...)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
;	.line	478; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	va_start(args, format);
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
;	.line	479; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	return pprint(&out, format, args);
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
;	.line	468; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 psprintf2(u8 *out, const u8 *format, va_list args)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, _psprintf2_out_1_199
	MOVLW	0x03
	MOVFF	PLUSW2, (_psprintf2_out_1_199 + 1)
	MOVLW	0x04
	MOVFF	PLUSW2, (_psprintf2_out_1_199 + 2)
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
;	.line	470; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	return pprint(&out, format, args);
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
	MOVLW	HIGH(_psprintf2_out_1_199)
	MOVWF	POSTDEC1
	MOVLW	LOW(_psprintf2_out_1_199)
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
;	.line	454; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 pprintf(funcout func, const u8 *format, va_list args)
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
;	.line	460; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	return pprint(0, format, args);
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
;	.line	306; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	static u8 pprint(u8 **out, const u8 *format, va_list args)
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
;	.line	310; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	register u8 pc = 0;
	CLRF	r0x09
;	.line	311; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 precision = 2; // default value is 2 digits fractional part
	MOVLW	0x02
	MOVWF	r0x0a
_01226_DS_:
;	.line	315; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for (; *format != 0; ++format)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVF	r0x0b, W
	BNZ	_01346_DS_
	GOTO	_01214_DS_
_01346_DS_:
;	.line	318; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	islong = 0;                 // default is 16-bit
	CLRF	r0x0c
;	.line	320; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == '%')
	MOVF	r0x0b, W
	XORLW	0x25
	BZ	_01348_DS_
	GOTO	_01209_DS_
_01348_DS_:
;	.line	322; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	width = pad = 0;		// default is left justify, no zero padded
	CLRF	r0x0b
	CLRF	r0x0d
;	.line	323; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++format;				// get the next format identifier
	INCF	r0x03, F
	BNC	_01349_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_01349_DS_:
;	.line	325; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == '\0')	// end of line
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x0e
	MOVF	r0x0e, W
	BTFSC	STATUS, 2
	GOTO	_01214_DS_
;	.line	328; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == '%')		// error
	MOVF	r0x0e, W
	XORLW	0x25
	BNZ	_01351_DS_
	GOTO	_01209_DS_
_01351_DS_:
;	.line	331; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == '-')		// right justify
	MOVF	r0x0e, W
	XORLW	0x2d
	BNZ	_01249_DS_
;	.line	333; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++format;
	INCF	r0x03, F
	BNC	_01354_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_01354_DS_:
;	.line	334; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pad = PAD_RIGHT;
	MOVLW	0x01
	MOVWF	r0x0b
_01249_DS_:
;	.line	337; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	while (*format == '0')	// field is padded with 0's instead of blanks
	MOVFF	r0x03, r0x0e
	MOVFF	r0x04, r0x0f
	MOVFF	r0x05, r0x10
_01179_DS_:
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
	XORLW	0x30
	BNZ	_01219_DS_
;	.line	339; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++format;
	INCF	r0x0e, F
	BNC	_01357_DS_
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_01357_DS_:
;	.line	340; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pad |= PAD_ZERO;
	BSF	r0x0b, 1
	BRA	_01179_DS_
_01219_DS_:
;	.line	343; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x11
	MOVLW	0x30
	SUBWF	r0x11, W
	BNC	_01277_DS_
	MOVLW	0x3a
	SUBWF	r0x11, W
	BC	_01277_DS_
; ;multiply lit val:0x0a by variable r0x0d and store in r0x0d
;	.line	345; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	width *= 10;
	MOVF	r0x0d, W
	MULLW	0x0a
	MOVFF	PRODL, r0x0d
;	.line	346; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	width += *format - '0';
	MOVLW	0xd0
	ADDWF	r0x11, F
	MOVF	r0x0d, W
	MOVWF	r0x12
	MOVF	r0x11, W
	ADDWF	r0x12, W
	MOVWF	r0x0d
;	.line	343; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	INCF	r0x0e, F
	BNC	_01361_DS_
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_01361_DS_:
	BRA	_01219_DS_
_01277_DS_:
	MOVFF	r0x0e, r0x03
	MOVFF	r0x0f, r0x04
	MOVFF	r0x10, r0x05
;	.line	356; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == '.')		// float precision
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
	XORLW	0x2e
	BNZ	_01185_DS_
;	.line	358; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++format;
	MOVF	r0x0e, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x05
;	.line	359; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	precision = 0;
	CLRF	r0x0a
	MOVFF	r0x03, r0x0e
	MOVFF	r0x04, r0x0f
	MOVFF	r0x05, r0x10
_01223_DS_:
;	.line	361; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x11
	MOVLW	0x30
	SUBWF	r0x11, W
	BNC	_01278_DS_
	MOVLW	0x3a
	SUBWF	r0x11, W
	BC	_01278_DS_
; ;multiply lit val:0x0a by variable r0x0a and store in r0x0a
;	.line	363; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	precision *= 10;
	MOVF	r0x0a, W
	MULLW	0x0a
	MOVFF	PRODL, r0x0a
;	.line	364; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	precision += *format - '0';
	MOVLW	0xd0
	ADDWF	r0x11, F
	MOVF	r0x0a, W
	MOVWF	r0x12
	MOVF	r0x11, W
	ADDWF	r0x12, W
	MOVWF	r0x0a
;	.line	361; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; *format >= '0' && *format <= '9'; ++format)
	INCF	r0x0e, F
	BNC	_01366_DS_
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_01366_DS_:
	BRA	_01223_DS_
_01278_DS_:
	MOVFF	r0x0e, r0x03
	MOVFF	r0x0f, r0x04
	MOVFF	r0x10, r0x05
_01185_DS_:
;	.line	368; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 'f') 	// float
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
; #	MOVWF	r0x0e
; #	MOVF	r0x0e, W
	MOVWF	r0x0e
	XORLW	0x66
	BZ	_01368_DS_
	BRA	_01187_DS_
_01368_DS_:
;	.line	370; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pc += pprintfl(out, va_arg(args, float), width, pad, separator, precision);
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x0f
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x11
	MOVFF	r0x0f, r0x06
	MOVFF	r0x10, r0x07
	MOVFF	r0x11, r0x08
	MOVLW	0xfc
	ADDWF	r0x0f, F
	MOVLW	0xff
	ADDWFC	r0x10, F
	ADDWFC	r0x11, F
; #	MOVF	r0x11, W
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
; #	MOVF	r0x10, W
; #	MOVF	r0x10, W
; #	MOVWF	r0x10
; #	MOVF	r0x10, W
; #	MOVF	r0x0f, W
; #	MOVF	r0x0f, W
; #	MOVWF	r0x0f
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget4
	MOVWF	r0x0f
	MOVFF	PRODL, r0x10
	MOVFF	PRODH, r0x11
	MOVFF	FSR0L, r0x12
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprintfl
	MOVWF	r0x0f
	MOVLW	0x0b
	ADDWF	FSR1L, F
	MOVF	r0x0f, W
	ADDWF	r0x09, F
;	.line	371; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	continue;
	GOTO	_01213_DS_
_01187_DS_:
;	.line	374; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 's')		// string
	MOVF	r0x0e, W
	XORLW	0x73
	BZ	_01370_DS_
	BRA	_01189_DS_
_01370_DS_:
;	.line	376; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 *s = va_arg(args, u8*);
	MOVF	r0x06, W
	ADDLW	0x03
	MOVWF	r0x0f
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x11
	MOVFF	r0x0f, r0x06
	MOVFF	r0x10, r0x07
	MOVFF	r0x11, r0x08
	MOVLW	0xfd
	ADDWF	r0x0f, F
	MOVLW	0xff
	ADDWFC	r0x10, F
	ADDWFC	r0x11, F
; #	MOVF	r0x11, W
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
; #	MOVF	r0x10, W
; #	MOVF	r0x10, W
; #	MOVWF	r0x10
; #	MOVF	r0x10, W
; #	MOVF	r0x0f, W
; #	MOVF	r0x0f, W
; #	MOVWF	r0x0f
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget3
	MOVWF	r0x0f
	MOVFF	PRODL, r0x10
	MOVFF	PRODH, r0x11
;	.line	377; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pc += pprints(out, s?s:"(null)", width, pad);
	IORWF	r0x10, W
; #	IORWF	r0x11, W
; #	BTFSC	STATUS, 2
; #	GOTO	_01229_DS_
; #	GOTO	_01230_DS_
; #	MOVLW	UPPER(__str_0)
	IORWF	r0x11, W
	BNZ	_01230_DS_
	MOVLW	UPPER(__str_0)
	MOVWF	r0x11
	MOVLW	HIGH(__str_0)
	MOVWF	r0x10
	MOVLW	LOW(__str_0)
	MOVWF	r0x0f
_01230_DS_:
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x0f
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	MOVWF	r0x10
	MOVF	r0x0f, W
	ADDWF	r0x10, W
	MOVWF	r0x09
;	.line	378; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	continue;
	GOTO	_01213_DS_
_01189_DS_:
;	.line	381; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 'l')		// long support
	MOVF	r0x0e, W
	XORLW	0x6c
	BNZ	_01191_DS_
;	.line	383; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++format;
	INCF	r0x03, F
	BNC	_01373_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_01373_DS_:
;	.line	384; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	islong = 1;
	MOVLW	0x01
	MOVWF	r0x0c
_01191_DS_:
;	.line	387; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 'u')		// decimal (10) unsigned (0) integer
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
; #	MOVWF	r0x0e
; #	MOVF	r0x0e, W
	MOVWF	r0x0e
	XORLW	0x75
	BZ	_01375_DS_
	BRA	_01193_DS_
_01375_DS_:
;	.line	389; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	val = (islong) ? va_arg(args, u32) : va_arg(args, u16);
	MOVF	r0x0c, W
	BZ	_01231_DS_
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x0f
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x11
	MOVFF	r0x0f, r0x06
	MOVFF	r0x10, r0x07
	MOVFF	r0x11, r0x08
	MOVLW	0xfc
	ADDWF	r0x0f, F
	MOVLW	0xff
	ADDWFC	r0x10, F
	ADDWFC	r0x11, F
; #	MOVF	r0x11, W
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
; #	MOVF	r0x10, W
; #	MOVF	r0x10, W
; #	MOVWF	r0x10
; #	MOVF	r0x10, W
; #	MOVF	r0x0f, W
; #	MOVF	r0x0f, W
; #	MOVWF	r0x0f
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget4
	MOVWF	r0x0f
	MOVFF	PRODL, r0x10
	MOVFF	PRODH, r0x11
	MOVFF	FSR0L, r0x12
	BRA	_01232_DS_
_01231_DS_:
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x14
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x15
	MOVFF	r0x13, r0x06
	MOVFF	r0x14, r0x07
	MOVFF	r0x15, r0x08
	MOVLW	0xfe
	ADDWF	r0x13, F
	MOVLW	0xff
	ADDWFC	r0x14, F
	ADDWFC	r0x15, F
; #	MOVF	r0x15, W
; #	MOVWF	r0x15
; #	MOVF	r0x15, W
; #	MOVF	r0x14, W
; #	MOVF	r0x14, W
; #	MOVWF	r0x14
; #	MOVF	r0x14, W
; #	MOVF	r0x13, W
; #	MOVF	r0x13, W
; #	MOVWF	r0x13
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget2
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVFF	r0x13, r0x0f
	MOVFF	r0x14, r0x10
	CLRF	r0x11
	CLRF	r0x12
_01232_DS_:
;	.line	390; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pc += pprinti(out, val, islong, 10, 0, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0e
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	391; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	continue;
	GOTO	_01213_DS_
_01193_DS_:
;	.line	394; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 'd' || *format == 'i') // decimal (10) signed (1) integer
	MOVF	r0x0e, W
	XORLW	0x64
	BZ	_01194_DS_
	MOVF	r0x0e, W
	XORLW	0x69
	BZ	_01194_DS_
	BRA	_01195_DS_
_01194_DS_:
;	.line	396; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	val = (islong) ? va_arg(args, u32) : va_arg(args, u16);
	MOVF	r0x0c, W
	BZ	_01233_DS_
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x14
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x15
	MOVFF	r0x13, r0x06
	MOVFF	r0x14, r0x07
	MOVFF	r0x15, r0x08
	MOVLW	0xfc
	ADDWF	r0x13, F
	MOVLW	0xff
	ADDWFC	r0x14, F
	ADDWFC	r0x15, F
; #	MOVF	r0x15, W
; #	MOVWF	r0x15
; #	MOVF	r0x15, W
; #	MOVF	r0x14, W
; #	MOVF	r0x14, W
; #	MOVWF	r0x14
; #	MOVF	r0x14, W
; #	MOVF	r0x13, W
; #	MOVF	r0x13, W
; #	MOVWF	r0x13
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget4
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVFF	PRODH, r0x15
	MOVFF	FSR0L, r0x16
	BRA	_01234_DS_
_01233_DS_:
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x17
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x18
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x19
	MOVFF	r0x17, r0x06
	MOVFF	r0x18, r0x07
	MOVFF	r0x19, r0x08
	MOVLW	0xfe
	ADDWF	r0x17, F
	MOVLW	0xff
	ADDWFC	r0x18, F
	ADDWFC	r0x19, F
; #	MOVF	r0x19, W
; #	MOVWF	r0x19
; #	MOVF	r0x19, W
; #	MOVF	r0x18, W
; #	MOVF	r0x18, W
; #	MOVWF	r0x18
; #	MOVF	r0x18, W
; #	MOVF	r0x17, W
; #	MOVF	r0x17, W
; #	MOVWF	r0x17
	MOVFF	r0x17, FSR0L
	MOVFF	r0x18, PRODL
	MOVF	r0x19, W
	CALL	__gptrget2
	MOVWF	r0x17
	MOVFF	PRODL, r0x18
	MOVFF	r0x17, r0x13
	MOVFF	r0x18, r0x14
	CLRF	r0x15
	CLRF	r0x16
_01234_DS_:
	MOVFF	r0x13, r0x0f
	MOVFF	r0x14, r0x10
	MOVFF	r0x15, r0x11
	MOVFF	r0x16, r0x12
;	.line	397; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pc += pprinti(out, val, islong, 10, 1, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0e
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	398; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	continue;
	GOTO	_01213_DS_
_01195_DS_:
;	.line	401; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 'x' || *format == 'p')	// unsigned (0) lower ('a') hexa (16) or pointer
	MOVF	r0x0e, W
	XORLW	0x78
	BZ	_01197_DS_
	MOVF	r0x0e, W
	XORLW	0x70
	BZ	_01197_DS_
	BRA	_01198_DS_
_01197_DS_:
;	.line	403; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	val = (islong) ? va_arg(args, u32) : va_arg(args, u16);
	MOVF	r0x0c, W
	BZ	_01235_DS_
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x14
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x15
	MOVFF	r0x13, r0x06
	MOVFF	r0x14, r0x07
	MOVFF	r0x15, r0x08
	MOVLW	0xfc
	ADDWF	r0x13, F
	MOVLW	0xff
	ADDWFC	r0x14, F
	ADDWFC	r0x15, F
; #	MOVF	r0x15, W
; #	MOVWF	r0x15
; #	MOVF	r0x15, W
; #	MOVF	r0x14, W
; #	MOVF	r0x14, W
; #	MOVWF	r0x14
; #	MOVF	r0x14, W
; #	MOVF	r0x13, W
; #	MOVF	r0x13, W
; #	MOVWF	r0x13
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget4
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVFF	PRODH, r0x15
	MOVFF	FSR0L, r0x16
	BRA	_01236_DS_
_01235_DS_:
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x17
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x18
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x19
	MOVFF	r0x17, r0x06
	MOVFF	r0x18, r0x07
	MOVFF	r0x19, r0x08
	MOVLW	0xfe
	ADDWF	r0x17, F
	MOVLW	0xff
	ADDWFC	r0x18, F
	ADDWFC	r0x19, F
; #	MOVF	r0x19, W
; #	MOVWF	r0x19
; #	MOVF	r0x19, W
; #	MOVF	r0x18, W
; #	MOVF	r0x18, W
; #	MOVWF	r0x18
; #	MOVF	r0x18, W
; #	MOVF	r0x17, W
; #	MOVF	r0x17, W
; #	MOVWF	r0x17
	MOVFF	r0x17, FSR0L
	MOVFF	r0x18, PRODL
	MOVF	r0x19, W
	CALL	__gptrget2
	MOVWF	r0x17
	MOVFF	PRODL, r0x18
	MOVFF	r0x17, r0x13
	MOVFF	r0x18, r0x14
	CLRF	r0x15
	CLRF	r0x16
_01236_DS_:
	MOVFF	r0x13, r0x0f
	MOVFF	r0x14, r0x10
	MOVFF	r0x15, r0x11
	MOVFF	r0x16, r0x12
;	.line	404; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pc += pprinti(out, val, islong, 16, 0, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0e
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	405; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	continue;
	BRA	_01213_DS_
_01198_DS_:
;	.line	408; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 'X' || *format == 'P')	// unsigned (0) upper ('A') hexa (16) or pointer
	MOVF	r0x0e, W
	XORLW	0x58
	BZ	_01200_DS_
	MOVF	r0x0e, W
	XORLW	0x50
	BZ	_01200_DS_
	BRA	_01201_DS_
_01200_DS_:
;	.line	410; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	val = (islong) ? va_arg(args, u32) : va_arg(args, u16);
	MOVF	r0x0c, W
	BZ	_01237_DS_
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x14
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x15
	MOVFF	r0x13, r0x06
	MOVFF	r0x14, r0x07
	MOVFF	r0x15, r0x08
	MOVLW	0xfc
	ADDWF	r0x13, F
	MOVLW	0xff
	ADDWFC	r0x14, F
	ADDWFC	r0x15, F
; #	MOVF	r0x15, W
; #	MOVWF	r0x15
; #	MOVF	r0x15, W
; #	MOVF	r0x14, W
; #	MOVF	r0x14, W
; #	MOVWF	r0x14
; #	MOVF	r0x14, W
; #	MOVF	r0x13, W
; #	MOVF	r0x13, W
; #	MOVWF	r0x13
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget4
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVFF	PRODH, r0x15
	MOVFF	FSR0L, r0x16
	BRA	_01238_DS_
_01237_DS_:
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x17
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x18
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x19
	MOVFF	r0x17, r0x06
	MOVFF	r0x18, r0x07
	MOVFF	r0x19, r0x08
	MOVLW	0xfe
	ADDWF	r0x17, F
	MOVLW	0xff
	ADDWFC	r0x18, F
	ADDWFC	r0x19, F
; #	MOVF	r0x19, W
; #	MOVWF	r0x19
; #	MOVF	r0x19, W
; #	MOVF	r0x18, W
; #	MOVF	r0x18, W
; #	MOVWF	r0x18
; #	MOVF	r0x18, W
; #	MOVF	r0x17, W
; #	MOVF	r0x17, W
; #	MOVWF	r0x17
	MOVFF	r0x17, FSR0L
	MOVFF	r0x18, PRODL
	MOVF	r0x19, W
	CALL	__gptrget2
	MOVWF	r0x17
	MOVFF	PRODL, r0x18
	MOVFF	r0x17, r0x13
	MOVFF	r0x18, r0x14
	CLRF	r0x15
	CLRF	r0x16
_01238_DS_:
	MOVFF	r0x13, r0x0f
	MOVFF	r0x14, r0x10
	MOVFF	r0x15, r0x11
	MOVFF	r0x16, r0x12
;	.line	411; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pc += pprinti(out, val, islong, 16, 0, width, pad, separator, 'A');
	MOVLW	0x41
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0e
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	412; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	continue;
	BRA	_01213_DS_
_01201_DS_:
;	.line	415; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 'b')		// binary
	MOVF	r0x0e, W
	XORLW	0x62
	BZ	_01389_DS_
	BRA	_01204_DS_
_01389_DS_:
;	.line	417; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	val = (islong) ? va_arg(args, u32) : va_arg(args, u16);
	MOVF	r0x0c, W
	BZ	_01239_DS_
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x14
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x15
	MOVFF	r0x13, r0x06
	MOVFF	r0x14, r0x07
	MOVFF	r0x15, r0x08
	MOVLW	0xfc
	ADDWF	r0x13, F
	MOVLW	0xff
	ADDWFC	r0x14, F
	ADDWFC	r0x15, F
; #	MOVF	r0x15, W
; #	MOVWF	r0x15
; #	MOVF	r0x15, W
; #	MOVF	r0x14, W
; #	MOVF	r0x14, W
; #	MOVWF	r0x14
; #	MOVF	r0x14, W
; #	MOVF	r0x13, W
; #	MOVF	r0x13, W
; #	MOVWF	r0x13
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget4
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVFF	PRODH, r0x15
	MOVFF	FSR0L, r0x16
	BRA	_01240_DS_
_01239_DS_:
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x17
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x18
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x19
	MOVFF	r0x17, r0x06
	MOVFF	r0x18, r0x07
	MOVFF	r0x19, r0x08
	MOVLW	0xfe
	ADDWF	r0x17, F
	MOVLW	0xff
	ADDWFC	r0x18, F
	ADDWFC	r0x19, F
; #	MOVF	r0x19, W
; #	MOVWF	r0x19
; #	MOVF	r0x19, W
; #	MOVF	r0x18, W
; #	MOVF	r0x18, W
; #	MOVWF	r0x18
; #	MOVF	r0x18, W
; #	MOVF	r0x17, W
; #	MOVF	r0x17, W
; #	MOVWF	r0x17
	MOVFF	r0x17, FSR0L
	MOVFF	r0x18, PRODL
	MOVF	r0x19, W
	CALL	__gptrget2
	MOVWF	r0x17
	MOVFF	PRODL, r0x18
	MOVFF	r0x17, r0x13
	MOVFF	r0x18, r0x14
	CLRF	r0x15
	CLRF	r0x16
_01240_DS_:
	MOVFF	r0x13, r0x0f
	MOVFF	r0x14, r0x10
	MOVFF	r0x15, r0x11
	MOVFF	r0x16, r0x12
;	.line	418; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pc += pprinti(out, val, islong, 2, 0, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x13
	MOVLW	0x0e
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x09, F
;	.line	419; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	continue;
	BRA	_01213_DS_
_01204_DS_:
;	.line	422; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 'o')		// octal
	MOVF	r0x0e, W
	XORLW	0x6f
	BZ	_01391_DS_
	BRA	_01206_DS_
_01391_DS_:
;	.line	424; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	val = (islong) ? va_arg(args, u32) : va_arg(args, u16);
	MOVF	r0x0c, W
	BZ	_01241_DS_
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x14
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x15
	MOVFF	r0x13, r0x06
	MOVFF	r0x14, r0x07
	MOVFF	r0x15, r0x08
	MOVLW	0xfc
	ADDWF	r0x13, F
	MOVLW	0xff
	ADDWFC	r0x14, F
	ADDWFC	r0x15, F
; #	MOVF	r0x15, W
; #	MOVWF	r0x15
; #	MOVF	r0x15, W
; #	MOVF	r0x14, W
; #	MOVF	r0x14, W
; #	MOVWF	r0x14
; #	MOVF	r0x14, W
; #	MOVF	r0x13, W
; #	MOVF	r0x13, W
; #	MOVWF	r0x13
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget4
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVFF	PRODH, r0x15
	MOVFF	FSR0L, r0x16
	BRA	_01242_DS_
_01241_DS_:
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x17
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x18
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x19
	MOVFF	r0x17, r0x06
	MOVFF	r0x18, r0x07
	MOVFF	r0x19, r0x08
	MOVLW	0xfe
	ADDWF	r0x17, F
	MOVLW	0xff
	ADDWFC	r0x18, F
	ADDWFC	r0x19, F
; #	MOVF	r0x19, W
; #	MOVWF	r0x19
; #	MOVF	r0x19, W
; #	MOVF	r0x18, W
; #	MOVF	r0x18, W
; #	MOVWF	r0x18
; #	MOVF	r0x18, W
; #	MOVF	r0x17, W
; #	MOVF	r0x17, W
; #	MOVWF	r0x17
	MOVFF	r0x17, FSR0L
	MOVFF	r0x18, PRODL
	MOVF	r0x19, W
	CALL	__gptrget2
	MOVWF	r0x17
	MOVFF	PRODL, r0x18
	MOVFF	r0x17, r0x13
	MOVFF	r0x18, r0x14
	CLRF	r0x15
	CLRF	r0x16
_01242_DS_:
	MOVFF	r0x13, r0x0f
	MOVFF	r0x14, r0x10
	MOVFF	r0x15, r0x11
	MOVFF	r0x16, r0x12
;	.line	425; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pc += pprinti(out, val, islong, 8, 0, width, pad, separator, 'a');
	MOVLW	0x61
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprinti
	MOVWF	r0x0c
	MOVLW	0x0e
	ADDWF	FSR1L, F
	MOVF	r0x0c, W
	ADDWF	r0x09, F
;	.line	426; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	continue;
	BRA	_01213_DS_
_01206_DS_:
;	.line	429; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (*format == 'c') 	// ascii
	MOVF	r0x0e, W
	XORLW	0x63
	BZ	_01393_DS_
	BRA	_01213_DS_
_01393_DS_:
;	.line	431; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	scr[0] = va_arg(args, u16);
	MOVF	r0x06, W
	ADDLW	0x02
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0e
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x0f
	MOVFF	r0x0c, r0x06
	MOVFF	r0x0e, r0x07
	MOVFF	r0x0f, r0x08
	MOVLW	0xfe
	ADDWF	r0x0c, F
	MOVLW	0xff
	ADDWFC	r0x0e, F
	ADDWFC	r0x0f, F
; #	MOVF	r0x0f, W
; #	MOVWF	r0x0f
; #	MOVF	r0x0f, W
; #	MOVF	r0x0e, W
; #	MOVF	r0x0e, W
; #	MOVWF	r0x0e
; #	MOVF	r0x0e, W
; #	MOVF	r0x0c, W
; #	MOVF	r0x0c, W
; #	MOVWF	r0x0c
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0e, PRODL
	MOVF	r0x0f, W
	CALL	__gptrget2
	BANKSEL	_pprint_scr_1_178
	MOVWF	_pprint_scr_1_178, B
; removed redundant BANKSEL
;	.line	432; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	scr[1] = '\0';
	CLRF	(_pprint_scr_1_178 + 1), B
;	.line	433; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pc += pprints(out, scr, width, pad);
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprint_scr_1_178)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprint_scr_1_178)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x0b
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	MOVWF	r0x0c
	MOVF	r0x0b, W
	ADDWF	r0x0c, W
	MOVWF	r0x09
;	.line	434; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	continue;
	BRA	_01213_DS_
_01209_DS_:
;	.line	441; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pprintc(out, *format);
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
	CALL	_pprintc
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	442; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++pc;
	INCF	r0x09, F
_01213_DS_:
;	.line	315; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for (; *format != 0; ++format)
	INCF	r0x03, F
	BNC	_01394_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_01394_DS_:
	GOTO	_01226_DS_
_01214_DS_:
;	.line	445; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (out) **out = '\0';
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_01216_DS_
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
_01216_DS_:
;	.line	446; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	return pc;
	MOVF	r0x09, W
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
S_main__pprintfl	code
_pprintfl:
;	.line	175; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	static u8 pprintfl(u8 **out, float value, u8 width, u8 pad, u8 separator, u8 precision)
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
;	.line	184; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u32 int_part  = 0;
	CLRF	r0x0a
	CLRF	r0x0b
	CLRF	r0x0c
	CLRF	r0x0d
;	.line	185; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u32 frac_part = 0;
	CLRF	r0x0e
	CLRF	r0x0f
	CLRF	r0x10
	CLRF	r0x11
;	.line	187; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 buffer[PRINT_BUF_LEN], *string = buffer;
	MOVLW	HIGH(_pprintfl_buffer_1_164)
	MOVWF	r0x13
	MOVLW	LOW(_pprintfl_buffer_1_164)
	MOVWF	r0x12
	MOVLW	0x80
	MOVWF	r0x14
;	.line	188; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 tmp[PRINT_BUF_LEN], *s = tmp;
	MOVLW	HIGH(_pprintfl_tmp_1_164)
	MOVWF	r0x16
	MOVLW	LOW(_pprintfl_tmp_1_164)
	MOVWF	r0x15
	MOVLW	0x80
	MOVWF	r0x17
;	.line	189; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 count = 0, m, t;
	CLRF	r0x18
;	.line	190; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 length = PRINT_BUF_LEN - 1;
	MOVLW	0x0b
	MOVWF	r0x19
;	.line	192; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	helper.f = value;
	MOVF	r0x03, W
	BANKSEL	_pprintfl_helper_1_164
	MOVWF	_pprintfl_helper_1_164, B
	MOVF	r0x04, W
; removed redundant BANKSEL
	MOVWF	(_pprintfl_helper_1_164 + 1), B
	MOVF	r0x05, W
; removed redundant BANKSEL
	MOVWF	(_pprintfl_helper_1_164 + 2), B
	MOVF	r0x06, W
; removed redundant BANKSEL
	MOVWF	(_pprintfl_helper_1_164 + 3), B
;	.line	195; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (helper.l < 0)
	BSF	STATUS, 0
; removed redundant BANKSEL
	BTFSS	(_pprintfl_helper_1_164 + 3), 7, B
	BCF	STATUS, 0
	BNC	_01050_DS_
;	.line	197; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (width && (pad & PAD_ZERO))
	MOVF	r0x07, W
	BZ	_01046_DS_
	BTFSS	r0x08, 1
	BRA	_01046_DS_
;	.line	199; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pprintc(out, '-');
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
;	.line	200; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++count;
	MOVLW	0x01
	MOVWF	r0x18
;	.line	201; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	--width;
	DECF	r0x07, F
	BRA	_01050_DS_
_01046_DS_:
;	.line	205; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*string++ = '-';
	MOVLW	0x2d
	MOVWF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
	INCF	r0x12, F
	BNC	_01134_DS_
	INFSNZ	r0x13, F
	INCF	r0x14, F
_01134_DS_:
;	.line	206; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	length--;
	MOVLW	0x0a
	MOVWF	r0x19
_01050_DS_:
	BANKSEL	(_pprintfl_helper_1_164 + 2)
;	.line	212; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	exponent = ((helper.l >> 23) & 0xFF) - 127;	
	RLCF	(_pprintfl_helper_1_164 + 2), W, B
; removed redundant BANKSEL
	RLCF	(_pprintfl_helper_1_164 + 3), W, B
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	0x81
	ADDWF	r0x03, F
; removed redundant BANKSEL
;	.line	215; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	mantissa = (helper.l & 0x7FFFFF) | 0x800000;
	MOVF	_pprintfl_helper_1_164, W, B
	MOVWF	r0x04
; removed redundant BANKSEL
	MOVF	(_pprintfl_helper_1_164 + 1), W, B
	MOVWF	r0x05
	MOVLW	0x7f
; removed redundant BANKSEL
	ANDWF	(_pprintfl_helper_1_164 + 2), W, B
	MOVWF	r0x06
	CLRF	r0x1a
	BSF	r0x06, 7
;	.line	217; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if ( (exponent >= 31) || (exponent < -23) )
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x61
	BC	_01057_DS_
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x97
	BC	_01058_DS_
_01057_DS_:
;	.line	219; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	buffer[0] = 'i';
	MOVLW	0x69
	BANKSEL	_pprintfl_buffer_1_164
	MOVWF	_pprintfl_buffer_1_164, B
;	.line	220; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	buffer[1] = 'n';
	MOVLW	0x6e
; removed redundant BANKSEL
	MOVWF	(_pprintfl_buffer_1_164 + 1), B
;	.line	221; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	buffer[2] = 'f';
	MOVLW	0x66
; removed redundant BANKSEL
	MOVWF	(_pprintfl_buffer_1_164 + 2), B
; removed redundant BANKSEL
;	.line	222; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	buffer[3] = '\0';
	CLRF	(_pprintfl_buffer_1_164 + 3), B
;	.line	223; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	return pprints(out, buffer, width, pad);
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprintfl_buffer_1_164)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprintfl_buffer_1_164)
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
	BRA	_01080_DS_
_01058_DS_:
;	.line	225; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	else if (exponent >= 23)
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x69
	BNC	_01055_DS_
;	.line	227; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	int_part = mantissa << (exponent - 23);
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
	BZ	_01141_DS_
	BN	_01144_DS_
	NEGF	WREG
	BCF	STATUS, 0
_01142_DS_:
	RLCF	r0x0a, F
	RLCF	r0x0b, F
	RLCF	r0x0c, F
	RLCF	r0x0d, F
	ADDLW	0x01
	BNC	_01142_DS_
	BRA	_01059_DS_
_01144_DS_:
	BCF	STATUS, 0
_01143_DS_:
	RRCF	r0x0d, F
	RRCF	r0x0c, F
	RRCF	r0x0b, F
	RRCF	r0x0a, F
	ADDLW	0x01
	BNC	_01143_DS_
_01141_DS_:
	BRA	_01059_DS_
_01055_DS_:
;	.line	229; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	else if (exponent >= 0) 
	BSF	STATUS, 0
	BTFSS	r0x03, 7
	BCF	STATUS, 0
	BTFSC	STATUS, 0
	BRA	_01052_DS_
;	.line	231; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	int_part = mantissa >> (23 - exponent);
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
	BZ	_01145_DS_
	BN	_01148_DS_
	NEGF	WREG
	BCF	STATUS, 0
_01146_DS_:
	RRCF	r0x0d, F
	RRCF	r0x0c, F
	RRCF	r0x0b, F
	RRCF	r0x0a, F
	ADDLW	0x01
	BNC	_01146_DS_
	BRA	_01145_DS_
_01148_DS_:
	BCF	STATUS, 0
_01147_DS_:
	RLCF	r0x0a, F
	RLCF	r0x0b, F
	RLCF	r0x0c, F
	RLCF	r0x0d, F
	ADDLW	0x01
	BNC	_01147_DS_
_01145_DS_:
;	.line	232; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	frac_part = (mantissa << (exponent + 1)) & 0xFFFFFF; // mfh
	INFSNZ	r0x1b, F
	INCF	r0x1c, F
	MOVFF	r0x04, r0x1d
	MOVFF	r0x05, r0x1e
	MOVFF	r0x06, r0x1f
	MOVFF	r0x1a, r0x20
	MOVF	r0x1b, W
	BZ	_01149_DS_
	BN	_01152_DS_
	NEGF	WREG
	BCF	STATUS, 0
_01150_DS_:
	RLCF	r0x1d, F
	RLCF	r0x1e, F
	RLCF	r0x1f, F
	RLCF	r0x20, F
	ADDLW	0x01
	BNC	_01150_DS_
	BRA	_01149_DS_
_01152_DS_:
	BCF	STATUS, 0
_01151_DS_:
	RRCF	r0x20, F
	RRCF	r0x1f, F
	RRCF	r0x1e, F
	RRCF	r0x1d, F
	ADDLW	0x01
	BNC	_01151_DS_
_01149_DS_:
	MOVF	r0x1d, W
	MOVWF	r0x0e
	MOVF	r0x1e, W
	MOVWF	r0x0f
	MOVF	r0x1f, W
	MOVWF	r0x10
	CLRF	r0x11
	BRA	_01059_DS_
_01052_DS_:
;	.line	235; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	frac_part = (mantissa & 0xFFFFFF) >> -(exponent + 1);
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
	BZ	_01059_DS_
	BN	_01159_DS_
	NEGF	WREG
	BCF	STATUS, 0
_01157_DS_:
	RRCF	r0x11, F
	RRCF	r0x10, F
	RRCF	r0x0f, F
	RRCF	r0x0e, F
	ADDLW	0x01
	BNC	_01157_DS_
	BRA	_01059_DS_
_01159_DS_:
	BCF	STATUS, 0
_01158_DS_:
	RLCF	r0x0e, F
	RLCF	r0x0f, F
	RLCF	r0x10, F
	RLCF	r0x11, F
	ADDLW	0x01
	BNC	_01158_DS_
_01059_DS_:
;	.line	238; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (int_part == 0)
	MOVF	r0x0a, W
	IORWF	r0x0b, W
	IORWF	r0x0c, W
	IORWF	r0x0d, W
	BNZ	_01090_DS_
;	.line	240; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*string++ = '0';
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
	INCF	r0x12, F
	BNC	_01160_DS_
	INFSNZ	r0x13, F
	INCF	r0x14, F
_01160_DS_:
;	.line	241; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	length--;
	DECF	r0x19, F
	BRA	_01069_DS_
_01090_DS_:
;	.line	247; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	while (int_part)
	MOVFF	r0x15, r0x03
	MOVFF	r0x16, r0x04
	MOVFF	r0x17, r0x05
	CLRF	r0x06
	MOVFF	r0x19, r0x15
_01061_DS_:
	MOVF	r0x0a, W
	IORWF	r0x0b, W
	IORWF	r0x0c, W
	IORWF	r0x0d, W
	BTFSC	STATUS, 2
	BRA	_01098_DS_
;	.line	249; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	t = int_part % 10;		// decimal base
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
;	.line	250; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*s++ = t + '0';
	MOVLW	0x30
	ADDWF	r0x16, F
	MOVFF	r0x16, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	INCF	r0x03, F
	BNC	_01161_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_01161_DS_:
;	.line	251; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	int_part /= 10;
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
;	.line	252; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	m++;					// string's length counter
	INCF	r0x06, F
;	.line	253; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	length--;
	DECF	r0x15, F
	BRA	_01061_DS_
_01098_DS_:
;	.line	256; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	while (m--)
	MOVFF	r0x15, r0x19
	MOVFF	r0x12, r0x0a
	MOVFF	r0x13, r0x0b
	MOVFF	r0x14, r0x0c
_01064_DS_:
	MOVFF	r0x06, r0x0d
	DECF	r0x06, F
	MOVF	r0x0d, W
	BZ	_01099_DS_
;	.line	258; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*string++ = *--s;
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
	BNC	_01064_DS_
	INFSNZ	r0x0b, F
	INCF	r0x0c, F
_01162_DS_:
	BRA	_01064_DS_
_01099_DS_:
	MOVFF	r0x0a, r0x12
	MOVFF	r0x0b, r0x13
	MOVFF	r0x0c, r0x14
_01069_DS_:
;	.line	271; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (precision > 6)
	MOVLW	0x07
	SUBWF	r0x09, W
	BNC	_01071_DS_
;	.line	272; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	precision = 6;
	MOVLW	0x06
	MOVWF	r0x09
_01071_DS_:
;	.line	275; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (precision > length)
	MOVF	r0x09, W
; #	SUBWF	r0x19, W
; #	BTFSC	STATUS, 0
; #	GOTO	_01073_DS_
; #	MOVFF	r0x19, r0x09
; #	MOVLW	0x01
;	.line	276; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	precision = length;
	SUBWF	r0x19, W
;	.line	279; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (precision >= 1)
	BTFSS	STATUS, 0
	MOVFF	r0x19, r0x09
	MOVLW	0x01
	SUBWF	r0x09, W
	BTFSS	STATUS, 0
	BRA	_01076_DS_
;	.line	282; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*string++ = '.';
	MOVLW	0x2e
	MOVWF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
	INCF	r0x12, F
	BNC	_01166_DS_
	INFSNZ	r0x13, F
	INCF	r0x14, F
_01166_DS_:
;	.line	285; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for (m = 0; m < precision; m++)
	MOVFF	r0x12, r0x03
	MOVFF	r0x13, r0x04
	MOVFF	r0x14, r0x05
	CLRF	r0x06
_01078_DS_:
	MOVF	r0x09, W
	SUBWF	r0x06, W
	BC	_01100_DS_
;	.line	288; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	frac_part = (frac_part << 3) + (frac_part << 1); 
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
;	.line	290; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*string++ = (frac_part >> 24) + '0';
	MOVWF	r0x0a
	MOVLW	0x30
	ADDWF	r0x0a, F
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	INCF	r0x03, F
	BNC	_01168_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_01168_DS_:
;	.line	292; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	frac_part &= 0xFFFFFF;
	CLRF	r0x11
;	.line	285; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for (m = 0; m < precision; m++)
	INCF	r0x06, F
	BRA	_01078_DS_
_01100_DS_:
	MOVFF	r0x03, r0x12
	MOVFF	r0x04, r0x13
	MOVFF	r0x05, r0x14
_01076_DS_:
;	.line	297; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*string++ = '\0';
	CLRF	POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
;	.line	299; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	return count + pprints(out, buffer, width, pad);
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprintfl_buffer_1_164)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprintfl_buffer_1_164)
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
_01080_DS_:
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
;	.line	112; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	static u8 pprinti(u8 **out, u32 i, u8 islong, u8 base, u8 sign, u8 width, u8 pad, u8 separator, u8 letterbase)
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
	MOVLW	0x0d
	MOVFF	PLUSW2, r0x0b
	MOVLW	0x0f
	MOVFF	PLUSW2, r0x0c
;	.line	116; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 neg = 0, pc = 0;
	CLRF	r0x0d
	CLRF	r0x0e
;	.line	117; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u32 t, uns32 = i;
	MOVFF	r0x03, r0x0f
	MOVFF	r0x04, r0x10
	MOVFF	r0x05, r0x11
	MOVFF	r0x06, r0x12
;	.line	119; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (i == 0)
	MOVF	r0x03, W
	IORWF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	BNZ	_00972_DS_
;	.line	121; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	buffer[0] = '0';
	MOVLW	0x30
	BANKSEL	_pprinti_buffer_1_154
	MOVWF	_pprinti_buffer_1_154, B
; removed redundant BANKSEL
;	.line	122; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	buffer[1] = '\0';
	CLRF	(_pprinti_buffer_1_154 + 1), B
;	.line	123; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	return pprints(out, buffer, width, pad);
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_pprinti_buffer_1_154)
	MOVWF	POSTDEC1
	MOVLW	LOW(_pprinti_buffer_1_154)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_pprints
	MOVWF	r0x13
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	BRA	_00993_DS_
_00972_DS_:
;	.line	127; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if  ( (sign) && (base == 10) )          // decimal signed number ?
	MOVF	r0x09, W
	BZ	_00980_DS_
	MOVF	r0x08, W
	XORLW	0x0a
	BNZ	_00980_DS_
;	.line	129; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if ( (islong) && ((s32)i < 0) )     // negative 32-bit ?
	MOVF	r0x07, W
	BZ	_00974_DS_
	MOVF	r0x03, W
	MOVWF	r0x09
	MOVF	r0x04, W
	MOVWF	r0x13
	MOVF	r0x05, W
	MOVWF	r0x14
	MOVF	r0x06, W
	MOVWF	r0x15
	BSF	STATUS, 0
	BTFSS	r0x15, 7
	BCF	STATUS, 0
	BNC	_00974_DS_
;	.line	131; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	neg = 1;
	MOVLW	0x01
	MOVWF	r0x0d
;	.line	132; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	uns32 = - (s32)i;
	COMF	r0x15, W
	MOVWF	r0x12
	COMF	r0x14, W
	MOVWF	r0x11
	COMF	r0x13, W
	MOVWF	r0x10
	COMF	r0x09, W
	MOVWF	r0x0f
	INCF	r0x0f, F
	BNZ	_00974_DS_
	INCF	r0x10, F
	BNZ	_00974_DS_
	INFSNZ	r0x11, F
	INCF	r0x12, F
_00974_DS_:
;	.line	134; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if ( (!islong) && ((s16)i < 0) )    // negative 16-bit ?
	MOVF	r0x07, W
	BNZ	_00980_DS_
	BSF	STATUS, 0
	BTFSS	r0x04, 7
	BCF	STATUS, 0
	BNC	_00980_DS_
;	.line	136; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	neg = 1;
	MOVLW	0x01
	MOVWF	r0x0d
;	.line	137; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	uns32 = - (s16)i;
	COMF	r0x04, F
	NEGF	r0x03
	BTFSC	STATUS, 2
	INCF	r0x04, F
	MOVFF	r0x03, r0x0f
	MOVFF	r0x04, r0x10
	CLRF	WREG
	BTFSC	r0x04, 7
	MOVLW	0xff
	MOVWF	r0x11
	MOVWF	r0x12
_00980_DS_:
;	.line	142; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	string = buffer + PRINT_BUF_LEN - 1;
	MOVLW	HIGH(_pprinti_buffer_1_154 + 11)
	MOVWF	r0x04
	MOVLW	LOW(_pprinti_buffer_1_154 + 11)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
;	.line	143; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*string = '\0';
	CLRF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	CALL	__gptrput1
;	.line	145; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	while (uns32)
	MOVFF	r0x03, r0x06
	MOVFF	r0x04, r0x07
	MOVFF	r0x05, r0x09
_00984_DS_:
	MOVF	r0x0f, W
	IORWF	r0x10, W
	IORWF	r0x11, W
	IORWF	r0x12, W
	BTFSC	STATUS, 2
	BRA	_01008_DS_
;	.line	147; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	t = uns32 % base;
	MOVFF	r0x08, r0x13
	CLRF	r0x14
	CLRF	r0x15
	CLRF	r0x16
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	CALL	__modulong
	MOVWF	r0x17
	MOVFF	PRODL, r0x18
	MOVFF	PRODH, r0x19
	MOVFF	FSR0L, r0x1a
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	148; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if ( t >= 10 )
	MOVLW	0x00
	SUBWF	r0x1a, W
	BNZ	_01039_DS_
	MOVLW	0x00
	SUBWF	r0x19, W
	BNZ	_01039_DS_
	MOVLW	0x00
	SUBWF	r0x18, W
	BNZ	_01039_DS_
	MOVLW	0x0a
	SUBWF	r0x17, W
_01039_DS_:
	BNC	_00983_DS_
;	.line	149; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	t += letterbase - '0' - 10;
	MOVFF	r0x0c, r0x1b
	MOVLW	0xc6
	ADDWF	r0x1b, F
	MOVF	r0x1b, W
	ADDWF	r0x17, F
_00983_DS_:
;	.line	150; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*--string = t + '0';
	MOVLW	0xff
	ADDWF	r0x06, F
	ADDWFC	r0x07, F
	ADDWFC	r0x09, F
	MOVLW	0x30
	ADDWF	r0x17, F
	MOVFF	r0x17, POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x09, W
	CALL	__gptrput1
;	.line	151; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	uns32 /= base;
	MOVF	r0x16, W
	MOVWF	POSTDEC1
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x0f
	MOVFF	PRODL, r0x10
	MOVFF	PRODH, r0x11
	MOVFF	FSR0L, r0x12
	MOVLW	0x08
	ADDWF	FSR1L, F
	BRA	_00984_DS_
_01008_DS_:
	MOVFF	r0x06, r0x03
	MOVFF	r0x07, r0x04
	MOVFF	r0x09, r0x05
;	.line	154; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (neg)
	MOVF	r0x0d, W
	BZ	_00992_DS_
;	.line	156; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (width && (pad & PAD_ZERO))
	MOVF	r0x0a, W
	BZ	_00988_DS_
	BTFSS	r0x0b, 1
	BRA	_00988_DS_
;	.line	158; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pprintc(out, '-');
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
;	.line	159; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++pc;
	MOVLW	0x01
	MOVWF	r0x0e
;	.line	160; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	--width;
	DECF	r0x0a, F
	BRA	_00992_DS_
_00988_DS_:
;	.line	164; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	*--string = '-';
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
_00992_DS_:
;	.line	168; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	return pc + pprints(out, string, width, pad);
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
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
	MOVF	r0x0e, W
	ADDWF	r0x00, F
	MOVF	r0x00, W
_00993_DS_:
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
;	.line	62; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	static int pprints(u8 **out, const u8 *string, u8 width, u8 pad)
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
;	.line	64; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	register u8 pc = 0;
	CLRF	r0x08
;	.line	65; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	u8 padchar = ' ';
	MOVLW	0x20
	MOVWF	r0x09
;	.line	69; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (width > 0)
	MOVF	r0x06, W
	BZ	_00899_DS_
;	.line	71; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for (ptr = string; *ptr; ++ptr)
	CLRF	r0x0a
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
_00906_DS_:
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
	MOVWF	r0x0e
	MOVF	r0x0e, W
	BZ	_00892_DS_
;	.line	72; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++len;
	INCF	r0x0a, F
;	.line	71; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for (ptr = string; *ptr; ++ptr)
	INCF	r0x0b, F
	BNC	_00906_DS_
	INFSNZ	r0x0c, F
	INCF	r0x0d, F
_00962_DS_:
	BRA	_00906_DS_
_00892_DS_:
;	.line	73; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (len >= width)
	MOVF	r0x06, W
	SUBWF	r0x0a, W
	BNC	_00894_DS_
;	.line	74; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	width = 0;
	CLRF	r0x06
	BRA	_00895_DS_
_00894_DS_:
;	.line	76; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	width -= len;
	MOVF	r0x0a, W
	SUBWF	r0x06, F
_00895_DS_:
;	.line	77; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (pad & PAD_ZERO) padchar = '0';
	BTFSS	r0x07, 1
	BRA	_00899_DS_
	MOVLW	0x30
	MOVWF	r0x09
_00899_DS_:
;	.line	79; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (!(pad & PAD_RIGHT))
	BTFSC	r0x07, 0
	BRA	_00931_DS_
	CLRF	r0x07
	MOVFF	r0x06, r0x0a
_00909_DS_:
;	.line	81; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x0a, W
	BNZ	_00908_DS_
	MOVFF	r0x07, r0x08
	MOVFF	r0x0a, r0x06
	BRA	_00931_DS_
_00908_DS_:
;	.line	83; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pprintc(out, padchar);
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
;	.line	84; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++pc;
	INCF	r0x07, F
;	.line	81; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; width > 0; --width)
	DECF	r0x0a, F
	BRA	_00909_DS_
_00931_DS_:
	MOVFF	r0x08, r0x07
_00912_DS_:
;	.line	87; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; *string ; ++string)
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x08
	MOVF	r0x08, W
	BZ	_00933_DS_
;	.line	89; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pprintc(out, *string);
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
;	.line	90; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++pc;
	INCF	r0x07, F
;	.line	87; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; *string ; ++string)
	INCF	r0x03, F
	BNC	_00912_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00966_DS_:
	BRA	_00912_DS_
_00933_DS_:
	MOVFF	r0x07, r0x03
	MOVFF	r0x06, r0x04
_00915_DS_:
;	.line	92; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; width > 0; --width)
	MOVF	r0x04, W
	BZ	_00904_DS_
;	.line	94; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pprintc(out, padchar);
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
;	.line	95; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++pc;
	INCF	r0x03, F
;	.line	92; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	for ( ; width > 0; --width)
	DECF	r0x04, F
	BRA	_00915_DS_
; =DF= MOVFF: replaced by CRLF/SETF
_00904_DS_:
;	.line	98; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	return pc;
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
;	.line	42; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	static void pprintc(u8 **str, u8 c)
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
;	.line	44; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	if (str)
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00879_DS_
;	.line	46; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	**str = c;
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
;	.line	47; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	++(*str);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	INCF	r0x04, F
	BNC	_00886_DS_
	INFSNZ	r0x05, F
	INCF	r0x06, F
_00886_DS_:
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
	BRA	_00881_DS_
_00879_DS_:
;	.line	51; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/stdio.c	pputchar(c);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVFF	INTCON, POSTDEC1
	BCF	INTCON, 7
	PUSH	
	MOVLW	LOW(_00887_DS_)
	MOVWF	TOSL
	MOVLW	HIGH(_00887_DS_)
	MOVWF	TOSH
	MOVLW	UPPER(_00887_DS_)
	MOVWF	TOSU
	BTFSC	PREINC1, 7
	BSF	INTCON, 7
	MOVFF	(_pputchar + 2), PCLATU
	MOVFF	(_pputchar + 1), PCLATH
	BANKSEL	_pputchar
	MOVF	_pputchar, W, B
	MOVWF	PCL
_00887_DS_:
	MOVF	POSTINC1, F
_00881_DS_:
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
;	.line	88; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/delay.c	void Delayus(u16 microseconds)
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
;	.line	91; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/delay.c	for (i=0;i<microseconds;i++);
	CLRF	r0x02
	CLRF	r0x03
_00862_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00873_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00873_DS_:
	BC	_00864_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00862_DS_
_00864_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Delayms	code
_Delayms:
;	.line	77; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/delay.c	void Delayms(u16 milliseconds)
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
;	.line	81; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/delay.c	for (i=0;i<milliseconds;i++)
	CLRF	r0x02
	CLRF	r0x03
_00844_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00855_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00855_DS_:
	BC	_00846_DS_
;	.line	83; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/delay.c	delay10ktcy(1);
	MOVLW	0x01
	CALL	_delay10ktcy
;	.line	84; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/delay.c	delay1ktcy(2);
	MOVLW	0x02
	CALL	_delay1ktcy
;	.line	81; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/core/delay.c	for (i=0;i<milliseconds;i++)
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00844_DS_
_00846_DS_:
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
;	.line	195; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	line_config.dwDTERate = USB_CDC_BAUD_RATE;
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
;	.line	196; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	line_config.bCharFormat = USB_CDC_STOP_BITS;
	CLRF	(_line_config + 4), B
; removed redundant BANKSEL
;	.line	197; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	line_config.bParityType = USB_CDC_PARITY;
	CLRF	(_line_config + 5), B
;	.line	198; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	line_config.bDataBits = USB_CDC_DATA_BITS;
	MOVLW	0x08
; removed redundant BANKSEL
	MOVWF	(_line_config + 6), B
	BANKSEL	_zlp
;	.line	199; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	zlp.wValue0=0;
	CLRF	_zlp, B
; removed redundant BANKSEL
;	.line	200; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	zlp.wValue1=0;
	CLRF	(_zlp + 1), B
; removed redundant BANKSEL
;	.line	201; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	zlp.wValue2=0;
	CLRF	(_zlp + 2), B
; removed redundant BANKSEL
;	.line	202; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	zlp.wValue3=0;
	CLRF	(_zlp + 3), B
; removed redundant BANKSEL
;	.line	203; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	zlp.wValue4=0;
	CLRF	(_zlp + 4), B
; removed redundant BANKSEL
;	.line	204; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	zlp.wValue5=0;
	CLRF	(_zlp + 5), B
; removed redundant BANKSEL
;	.line	205; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	zlp.wValue6=0;
	CLRF	(_zlp + 6), B
; removed redundant BANKSEL
;	.line	206; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	zlp.wValue7=0;
	CLRF	(_zlp + 7), B
;	.line	211; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	USB_COMM_EP_UEP = EP_IN | HSHK_EN;
	MOVLW	0x1a
	MOVWF	_UEP2
;	.line	214; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	CDC_DATA_EP_UEP = EP_OUT_IN | HSHK_EN;
	MOVLW	0x1e
	MOVWF	_UEP3
;	.line	218; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_IN_BD(USB_COMM_EP_NUM).ADDR = PTR16(&CDCControlBuffer);
	MOVLW	LOW(_CDCControlBuffer)
	BANKSEL	(_ep_bdt + 22)
	MOVWF	(_ep_bdt + 22), B
	MOVLW	HIGH(_CDCControlBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 23), B
; #	MOVLW	0x40
; #	MOVWF	(_ep_bdt + 20), B
; #	MOVLW	0x40
;	.line	219; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_IN_BD(USB_COMM_EP_NUM).Stat.uc = BDS_DAT1 | BDS_COWN;
	MOVLW	0x40
; removed redundant BANKSEL
;	.line	222; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Cnt = sizeof(CDCRxBuffer);
	MOVWF	(_ep_bdt + 20), B
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 25), B
;	.line	223; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).ADDR = PTR16(&CDCRxBuffer);
	MOVLW	LOW(_CDCRxBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 26), B
	MOVLW	HIGH(_CDCRxBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 27), B
;	.line	224; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Stat.uc = BDS_UOWN | BDS_DAT0 | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 24), B
;	.line	226; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).ADDR = PTR16(&CDCTxBuffer); // +1 
	MOVLW	LOW(_CDCTxBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 30), B
	MOVLW	HIGH(_CDCTxBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 31), B
;	.line	227; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Stat.uc = BDS_DAT1 | BDS_COWN; 
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 28), B
;	.line	228; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	deviceState=CONFIGURED; 
	MOVLW	0x05
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	RETURN	

; ; Starting pCode block
S_main__CDCputs	code
_CDCputs:
;	.line	153; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	u8 CDCputs(u8 *buffer, u8 length)
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
;	.line	155; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	u8 i=0;
	CLRF	r0x04
	BANKSEL	_deviceState
;	.line	157; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if (deviceState != CONFIGURED) return 0;
	MOVF	_deviceState, W, B
	XORLW	0x05
	BZ	_00797_DS_
	CLRF	WREG
	BRA	_00808_DS_
_00797_DS_:
	BANKSEL	_CONTROL_LINE
;	.line	158; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if (!CONTROL_LINE) return 0;
	MOVF	_CONTROL_LINE, W, B
	BNZ	_00799_DS_
	CLRF	WREG
	BRA	_00808_DS_
_00799_DS_:
	BANKSEL	(_ep_bdt + 28)
;	.line	159; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if (!EP_IN_BD(CDC_DATA_EP_NUM).Stat.UOWN)
	BTFSC	(_ep_bdt + 28), 7, B
	BRA	_00804_DS_
;	.line	161; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if (length > CDC_BULK_IN_SIZE) length = CDC_BULK_IN_SIZE;
	MOVLW	0x41
	SUBWF	r0x03, W
	BNC	_00815_DS_
	MOVLW	0x40
	MOVWF	r0x03
_00815_DS_:
;	.line	162; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	for (i=0; i < length; i++)
	CLRF	r0x05
_00806_DS_:
	MOVF	r0x03, W
	SUBWF	r0x05, W
	BC	_00816_DS_
;	.line	164; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	CDCTxBuffer[i] = buffer[i];
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
;	.line	162; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	for (i=0; i < length; i++)
	INCF	r0x05, F
	BRA	_00806_DS_
_00816_DS_:
	MOVFF	r0x05, r0x04
;	.line	176; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Cnt = i;
	MOVF	r0x05, W
	BANKSEL	(_ep_bdt + 29)
	MOVWF	(_ep_bdt + 29), B
;	.line	178; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Stat.uc &= 0x40;
	MOVLW	0x40
; removed redundant BANKSEL
	ANDWF	(_ep_bdt + 28), W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	(_ep_bdt + 28), B
;	.line	179; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Stat.DTS = !EP_IN_BD(CDC_DATA_EP_NUM).Stat.DTS;
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
;	.line	181; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_IN_BD(CDC_DATA_EP_NUM).Stat.uc |= BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	IORWF	(_ep_bdt + 28), W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	(_ep_bdt + 28), B
_00804_DS_:
;	.line	183; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	return i;
	MOVF	r0x04, W
_00808_DS_:
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
;	.line	106; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	u8 CDCgets(u8 *buffer)
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
;	.line	108; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	u8 i=0;
	CLRF	r0x03
	BANKSEL	_deviceState
;	.line	111; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if (deviceState != CONFIGURED)
	MOVF	_deviceState, W, B
	XORLW	0x05
	BZ	_00756_DS_
;	.line	112; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	return 0;
	CLRF	WREG
	BRA	_00767_DS_
_00756_DS_:
	BANKSEL	_CONTROL_LINE
;	.line	115; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if (!CONTROL_LINE)
	MOVF	_CONTROL_LINE, W, B
	BNZ	_00758_DS_
;	.line	116; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	return 0;
	CLRF	WREG
	BRA	_00767_DS_
_00758_DS_:
	BANKSEL	(_ep_bdt + 24)
;	.line	119; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if (!EP_OUT_BD(CDC_DATA_EP_NUM).Stat.UOWN)
	BTFSC	(_ep_bdt + 24), 7, B
	BRA	_00763_DS_
;	.line	126; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if (length > EP_OUT_BD(CDC_DATA_EP_NUM).Cnt)
	MOVLW	0x40
; #	SUBWF	(_ep_bdt + 25), W, B
; #	BTFSC	STATUS, 0
; #	GOTO	_00774_DS_
; #;;;!!! pic16_aopOp:1117 called for a spillLocation -- assigning WREG instead --- CHECK
; #	MOVFF	(_ep_bdt + 25), WREG
; #	CLRF	r0x04
; removed redundant BANKSEL
;	.line	127; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	length = EP_OUT_BD(CDC_DATA_EP_NUM).Cnt;
	SUBWF	(_ep_bdt + 25), W, B
;	.line	129; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	for (i=0; i < EP_OUT_BD(CDC_DATA_EP_NUM).Cnt; i++)
	BTFSS	STATUS, 0
	MOVFF	(_ep_bdt + 25), WREG
	CLRF	r0x04
_00765_DS_:
	BANKSEL	(_ep_bdt + 25)
	MOVF	(_ep_bdt + 25), W, B
	SUBWF	r0x04, W
	BC	_00775_DS_
;	.line	131; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	buffer[i] = CDCRxBuffer[i];
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
;	.line	129; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	for (i=0; i < EP_OUT_BD(CDC_DATA_EP_NUM).Cnt; i++)
	INCF	r0x04, F
	BRA	_00765_DS_
_00775_DS_:
	MOVFF	r0x04, r0x03
;	.line	143; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Stat.uc &= 0x40;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 24)
	ANDWF	(_ep_bdt + 24), W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	(_ep_bdt + 24), B
;	.line	144; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Stat.DTS = !EP_OUT_BD(CDC_DATA_EP_NUM).Stat.DTS;
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
;	.line	146; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Cnt = sizeof(CDCRxBuffer);
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 25), B
;	.line	147; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	EP_OUT_BD(CDC_DATA_EP_NUM).Stat.uc |= BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	IORWF	(_ep_bdt + 24), W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	(_ep_bdt + 24), B
_00763_DS_:
;	.line	150; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	return i;
	MOVF	r0x03, W
_00767_DS_:
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
;	.line	29; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	void ProcessCDCRequest(void)
	MOVFF	r0x00, POSTDEC1
;	.line	40; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if ((SetupPacket.bmRequestType & USB_TYPE_MASK) != USB_TYPE_CLASS) return;
	MOVLW	0x60
	BANKSEL	_SetupPacket
	ANDWF	_SetupPacket, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	XORLW	0x20
	BZ	_00703_DS_
	BRA	_00713_DS_
_00703_DS_:
;	.line	46; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	switch(SetupPacket.bRequest)
	MOVFF	(_SetupPacket + 1), r0x00
	MOVF	r0x00, W
	BNZ	_00740_DS_
	BRA	_00713_DS_
_00740_DS_:
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00742_DS_
	BRA	_00713_DS_
_00742_DS_:
	MOVF	r0x00, W
	XORLW	0x20
	BZ	_00706_DS_
	MOVF	r0x00, W
	XORLW	0x21
	BZ	_00707_DS_
	MOVF	r0x00, W
	XORLW	0x22
	BZ	_00708_DS_
	BRA	_00713_DS_
_00706_DS_:
;	.line	68; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	outPtr = (__data u8 *)&line_config;
	MOVLW	HIGH(_line_config)
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_line_config)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	69; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	wCount = sizeof(USB_CDC_Line_Coding) ;
	MOVLW	0x07
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	70; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	requestHandled = 1;				
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	71; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	break;
	BRA	_00713_DS_
_00707_DS_:
;	.line	78; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	outPtr = (__data u8 *)&line_config;
	MOVLW	HIGH(_line_config)
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_line_config)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	79; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	wCount = sizeof(USB_CDC_Line_Coding) ;
	MOVLW	0x07
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	80; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	81; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	break;
	BRA	_00713_DS_
_00708_DS_:
	BANKSEL	(_SetupPacket + 2)
;	.line	90; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	if (SetupPacket.wValue0==3) CONTROL_LINE=1;
	MOVF	(_SetupPacket + 2), W, B
	XORLW	0x03
	BNZ	_00710_DS_
	MOVLW	0x01
	BANKSEL	_CONTROL_LINE
	MOVWF	_CONTROL_LINE, B
	BRA	_00711_DS_
_00710_DS_:
	BANKSEL	_CONTROL_LINE
;	.line	91; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	else CONTROL_LINE=0;		
	CLRF	_CONTROL_LINE, B
_00711_DS_:
;	.line	92; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	outPtr = (__data u8 *)&zlp;
	MOVLW	HIGH(_zlp)
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_zlp)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	93; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	wCount = sizeof(Zero_Packet_Length) ;
	MOVLW	0x08
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	94; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	requestHandled = 1;						
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
_00713_DS_:
;	.line	96; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/usb_cdc.c	}
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__ProcessUSBTransactions	code
_ProcessUSBTransactions:
;	.line	809; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	void ProcessUSBTransactions(void)
	MOVFF	r0x00, POSTDEC1
; #	MOVF	_deviceState, W, B
; #	BTFSS	STATUS, 2
; #	GOTO	_00616_DS_
; #	GOTO	_00642_DS_
; #	BTFSS	_UIRbits, 2
	BANKSEL	_deviceState
;	.line	812; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(deviceState == DETACHED)
	MOVF	_deviceState, W, B
;	.line	813; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	return;
	BZ	_00642_DS_
;	.line	816; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(UIRbits.ACTVIF && UIEbits.ACTVIE)
	BTFSS	_UIRbits, 2
; #	GOTO	_00618_DS_
; #	BTFSS	_UIEbits, 2
; #	GOTO	_00618_DS_
; #	CALL	_UnSuspend
; #	CLRF	r0x00
;	.line	817; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UnSuspend();
	BRA	_00618_DS_
;	.line	821; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(UCONbits.SUSPND == 1)
	BTFSC	_UIEbits, 2
	CALL	_UnSuspend
_00618_DS_:
	CLRF	r0x00
	BTFSC	_UCONbits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
;	.line	822; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	return;
	BZ	_00642_DS_
;	.line	825; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (UIRbits.URSTIF && UIEbits.URSTIE) {
	BTFSS	_UIRbits, 0
; #	GOTO	_00623_DS_
; #	BTFSS	_UIEbits, 0
; #	GOTO	_00623_DS_
; #	CALL	_BusReset
; #	BTFSS	_UIRbits, 4
;	.line	826; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	BusReset();
	BRA	_00623_DS_
;	.line	829; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (UIRbits.IDLEIF && UIEbits.IDLEIE) {
	BTFSC	_UIEbits, 0
	CALL	_BusReset
_00623_DS_:
	BTFSS	_UIRbits, 4
; #	GOTO	_00626_DS_
; #	BTFSS	_UIEbits, 4
; #	GOTO	_00626_DS_
; #	CALL	_Suspend
; #	BTFSS	_UIRbits, 6
;	.line	831; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	Suspend();
	BRA	_00626_DS_
;	.line	833; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (UIRbits.SOFIF && UIEbits.SOFIE) {
	BTFSC	_UIEbits, 4
	CALL	_Suspend
_00626_DS_:
	BTFSS	_UIRbits, 6
; #	GOTO	_00629_DS_
; #	BTFSS	_UIEbits, 6
; #	GOTO	_00629_DS_
; #	CALL	_StartOfFrame
; #	BTFSS	_UIRbits, 5
;	.line	834; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	StartOfFrame();
	BRA	_00629_DS_
;	.line	836; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (UIRbits.STALLIF && UIEbits.STALLIE) {
	BTFSC	_UIEbits, 6
	CALL	_StartOfFrame
_00629_DS_:
	BTFSS	_UIRbits, 5
; #	GOTO	_00632_DS_
; #	BTFSS	_UIEbits, 5
; #	GOTO	_00632_DS_
; #	CALL	_Stall
; #	BTFSS	_UIRbits, 1
;	.line	837; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	Stall();
	BRA	_00632_DS_
;	.line	840; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (UIRbits.UERRIF && UIEbits.UERRIE) {
	BTFSC	_UIEbits, 5
	CALL	_Stall
_00632_DS_:
	BTFSS	_UIRbits, 1
; #	GOTO	_00635_DS_
; #	BTFSS	_UIEbits, 1
; #	GOTO	_00635_DS_
; #	BCF	_UIRbits, 1
; #	MOVLW	0x03
;	.line	844; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIRbits.UERRIF = 0;
	BRA	_00635_DS_
;	.line	848; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (deviceState < DEFAULT)
	BTFSC	_UIEbits, 1
	BCF	_UIRbits, 1
_00635_DS_:
	MOVLW	0x03
; #	SUBWF	_deviceState, W, B
; #	BTFSC	STATUS, 0
; #	GOTO	_00638_DS_
; #	GOTO	_00642_DS_
; #	BTFSS	_UIRbits, 3
	BANKSEL	_deviceState
;	.line	849; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	return;
	SUBWF	_deviceState, W, B
;	.line	852; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(UIRbits.TRNIF && UIEbits.TRNIE) {
	BNC	_00642_DS_
	BTFSS	_UIRbits, 3
	BRA	_00642_DS_
	BTFSS	_UIEbits, 3
	BRA	_00642_DS_
;	.line	853; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	ProcessControlTransfer();
	CALL	_ProcessControlTransfer
;	.line	856; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIRbits.TRNIF = 0;
	BCF	_UIRbits, 3
_00642_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__BusReset	code
_BusReset:
;	.line	781; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	void BusReset() {
	MOVFF	r0x00, POSTDEC1
;	.line	782; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UEIR  = 0x00;
	CLRF	_UEIR
;	.line	783; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIR   = 0x00;
	CLRF	_UIR
;	.line	784; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UEIE  = 0x9f;
	MOVLW	0x9f
	MOVWF	_UEIE
;	.line	785; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIE   = 0x7b;
	MOVLW	0x7b
	MOVWF	_UIE
;	.line	786; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UADDR = 0x00;
	CLRF	_UADDR
;	.line	789; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UEP0 = EP_CTRL | HSHK_EN;
	MOVLW	0x16
	MOVWF	_UEP0
_00598_DS_:
;	.line	792; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	while (UIRbits.TRNIF == 1)
	CLRF	r0x00
	BTFSC	_UIRbits, 3
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00600_DS_
;	.line	793; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIRbits.TRNIF = 0;
	BCF	_UIRbits, 3
	BRA	_00598_DS_
_00600_DS_:
;	.line	796; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UCONbits.PKTDIS = 0;
	BCF	_UCONbits, 4
;	.line	799; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BANKSEL	_remoteWakeup
;	.line	801; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	remoteWakeup = 0;                     // Remote wakeup is off by default
	CLRF	_remoteWakeup, B
	BANKSEL	_selfPowered
;	.line	802; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	selfPowered = 0;                      // Self powered is off by default
	CLRF	_selfPowered, B
	BANKSEL	_currentConfiguration
;	.line	803; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	currentConfiguration = 0;             // Clear active configuration
	CLRF	_currentConfiguration, B
;	.line	804; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	deviceState = DEFAULT;
	MOVLW	0x03
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__Suspend	code
_Suspend:
;	.line	708; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	void Suspend(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	714; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIEbits.ACTVIE = 1;
	BSF	_UIEbits, 2
;	.line	715; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIRbits.IDLEIF = 0;
	BCF	_UIRbits, 4
;	.line	716; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UCONbits.SUSPND = 1;
	BSF	_UCONbits, 1
;	.line	721; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	PIR2bits.USBIF = 0;
	BCF	_PIR2bits, 5
;	.line	727; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	INTCONbits.RBIF = 0;
	BCF	_INTCONbits, 0
;	.line	733; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	PIE2bits.USBIE = 1;
	BSF	_PIE2bits, 5
;	.line	739; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	INTCONbits.RBIE = 1;
	BSF	_INTCONbits, 3
	sleep 
;	.line	769; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	PIE2bits.USBIE = 0;
	BCF	_PIE2bits, 5
;	.line	775; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	INTCONbits.RBIE = 0;
	BCF	_INTCONbits, 3
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__Stall	code
_Stall:
;	.line	692; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	void Stall(void)
	MOVFF	r0x00, POSTDEC1
;	.line	697; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(UEP0bits.EPSTALL == 1)
	CLRF	r0x00
	BTFSC	_UEP0bits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00581_DS_
;	.line	700; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
;	.line	701; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UEP0bits.EPSTALL = 0;
	BCF	_UEP0bits, 0
_00581_DS_:
;	.line	703; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIRbits.STALLIF = 0;
	BCF	_UIRbits, 5
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__StartOfFrame	code
_StartOfFrame:
;	.line	688; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIRbits.SOFIF = 0;
	BCF	_UIRbits, 6
	RETURN	

; ; Starting pCode block
S_main__UnSuspend	code
_UnSuspend:
;	.line	677; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UCONbits.SUSPND = 0;
	BCF	_UCONbits, 1
;	.line	678; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIEbits.ACTVIE = 0;
	BCF	_UIEbits, 2
;	.line	679; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIRbits.ACTVIF = 0;
	BCF	_UIRbits, 2
	RETURN	

; ; Starting pCode block
S_main__EnableUSBModule	code
_EnableUSBModule:
;	.line	643; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(UCONbits.USBEN == 0)
	BTFSC	_UCONbits, 3
	BRA	_00549_DS_
;	.line	648; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UCON = 0;
	CLRF	_UCON
;	.line	649; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIE = 0;
	CLRF	_UIE
;	.line	650; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UCONbits.USBEN = 1;
	BSF	_UCONbits, 3
;	.line	651; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	deviceState = ATTACHED;
	MOVLW	0x01
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00549_DS_:
	BANKSEL	_deviceState
;	.line	656; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if ((deviceState == ATTACHED) && !UCONbits.SE0)
	MOVF	_deviceState, W, B
	XORLW	0x01
	BNZ	_00553_DS_
	BTFSC	_UCONbits, 5
	BRA	_00553_DS_
;	.line	658; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIR = 0;
	CLRF	_UIR
;	.line	659; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIE = 0;
	CLRF	_UIE
;	.line	660; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIEbits.URSTIE = 1;
	BSF	_UIEbits, 0
;	.line	661; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UIEbits.IDLEIE = 1;
	BSF	_UIEbits, 4
;	.line	662; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	deviceState = POWERED;
	MOVLW	0x02
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00553_DS_:
	RETURN	

; ; Starting pCode block
S_main__ProcessControlTransfer	code
_ProcessControlTransfer:
;	.line	551; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	void ProcessControlTransfer(void) {
	MOVFF	r0x00, POSTDEC1
;	.line	555; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (USTATbits.DIR == OUT) {
	BTFSC	_USTATbits, 2
	BRA	_00499_DS_
;	.line	558; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 PID = (EP_OUT_BD(0).Stat.uc & 0x3C) >> 2;
	MOVLW	0x3c
	BANKSEL	_ep_bdt
	ANDWF	_ep_bdt, W, B
	MOVWF	r0x00
	RRNCF	r0x00, W
	RRNCF	WREG, W
	ANDLW	0x3f
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
;	.line	559; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (PID == 0x0D)
	XORLW	0x0d
	BNZ	_00483_DS_
;	.line	561; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	SetupStage();
	CALL	_SetupStage
	BRA	_00501_DS_
_00483_DS_:
	BANKSEL	_ctrlTransferStage
;	.line	562; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (ctrlTransferStage == DATA_OUT_STAGE) {
	MOVF	_ctrlTransferStage, W, B
	XORLW	0x01
	BNZ	_00480_DS_
;	.line	565; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	OutDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_OutDataStage
	MOVF	POSTINC1, F
	BANKSEL	_ep_bdt
;	.line	589; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(EP_OUT_BD(0).Stat.DTS)
	BTFSS	_ep_bdt, 6, B
	BRA	_00477_DS_
;	.line	590; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
	BRA	_00501_DS_
_00477_DS_:
;	.line	592; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
	BANKSEL	_ep_bdt
	MOVWF	_ep_bdt, B
	BRA	_00501_DS_
_00480_DS_:
;	.line	596; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
	BRA	_00501_DS_
_00499_DS_:
;	.line	599; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if(USTATbits.DIR == IN) {
	CLRF	r0x00
	BTFSC	_USTATbits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00501_DS_
;	.line	601; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if ((UADDR == 0) && (deviceState == ADDRESS)) {
	MOVF	_UADDR, W
	BNZ	_00488_DS_
	BANKSEL	_deviceState
	MOVF	_deviceState, W, B
	XORLW	0x04
	BNZ	_00488_DS_
;	.line	604; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UADDR = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _UADDR
;	.line	608; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(UADDR == 0)
	MOVF	_UADDR, W
	BNZ	_00488_DS_
;	.line	611; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	deviceState = DEFAULT;
	MOVLW	0x03
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
_00488_DS_:
	BANKSEL	_ctrlTransferStage
;	.line	614; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (ctrlTransferStage == DATA_IN_STAGE) {
	MOVF	_ctrlTransferStage, W, B
	XORLW	0x02
	BNZ	_00494_DS_
;	.line	616; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	InDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_InDataStage
	MOVF	POSTINC1, F
	BANKSEL	(_ep_bdt + 4)
;	.line	619; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(EP_IN_BD(0).Stat.DTS)
	BTFSS	(_ep_bdt + 4), 6, B
	BRA	_00491_DS_
;	.line	620; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00501_DS_
_00491_DS_:
;	.line	622; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
	BANKSEL	(_ep_bdt + 4)
	MOVWF	(_ep_bdt + 4), B
	BRA	_00501_DS_
_00494_DS_:
;	.line	626; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	WaitForSetupStage();
	CALL	_WaitForSetupStage
_00501_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__WaitForSetupStage	code
_WaitForSetupStage:
	BANKSEL	_ctrlTransferStage
;	.line	538; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	ctrlTransferStage = SETUP_STAGE;
	CLRF	_ctrlTransferStage, B
;	.line	539; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	540; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	542; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
	MOVLW	0x88
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
; removed redundant BANKSEL
;	.line	543; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(0).Stat.uc = 0x00;           // Give control to CPU
	CLRF	(_ep_bdt + 4), B
	RETURN	

; ; Starting pCode block
S_main__SetupStage	code
_SetupStage:
;	.line	465; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	void SetupStage(void) {
	MOVFF	r0x00, POSTDEC1
	BANKSEL	(_ep_bdt + 4)
;	.line	468; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(0).Stat.uc &= ~BDS_UOWN;
	MOVF	(_ep_bdt + 4), W, B
	MOVWF	r0x00
	BCF	r0x00, 7
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
; removed redundant BANKSEL
;	.line	469; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Stat.uc &= ~BDS_UOWN;
	MOVF	_ep_bdt, W, B
	MOVWF	r0x00
	BCF	r0x00, 7
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
	BANKSEL	_ctrlTransferStage
;	.line	472; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	ctrlTransferStage = SETUP_STAGE;
	CLRF	_ctrlTransferStage, B
	BANKSEL	_requestHandled
;	.line	473; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 0;                   // Default is that request hasn't been handled
	CLRF	_requestHandled, B
	BANKSEL	_HIDPostProcess
;	.line	474; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	HIDPostProcess = 0;                   // Assume standard request until know otherwise
	CLRF	_HIDPostProcess, B
	BANKSEL	_wCount
;	.line	475; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = 0;                           // No bytes transferred
	CLRF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
;	.line	478; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	ProcessStandardRequest();
	CALL	_ProcessStandardRequest
;	.line	488; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if ((SetupPacket.bmRequestType & USB_RECIP_MASK) == USB_RECIP_INTERFACE)  
	MOVLW	0x1f
	BANKSEL	_SetupPacket
	ANDWF	_SetupPacket, W, B
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00436_DS_
;	.line	489; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	ProcessCDCRequest();
	CALL	_ProcessCDCRequest
_00436_DS_:
	BANKSEL	_requestHandled
;	.line	492; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (!requestHandled) {
	MOVF	_requestHandled, W, B
	BNZ	_00443_DS_
;	.line	494; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	495; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
; #	MOVLW	0x84
; #	MOVWF	_ep_bdt, B
; #	MOVLW	0x84
;	.line	496; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
	MOVLW	0x84
; removed redundant BANKSEL
;	.line	497; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
	MOVWF	_ep_bdt, B
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00444_DS_
_00443_DS_:
	BANKSEL	_SetupPacket
;	.line	499; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (SetupPacket.bmRequestType & 0x80) {
	BTFSS	_SetupPacket, 7, B
	BRA	_00440_DS_
	BANKSEL	(_wCount + 1)
;	.line	501; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(SetupPacket.wLength < wCount)
	MOVF	(_wCount + 1), W, B
	BANKSEL	(_SetupPacket + 7)
	SUBWF	(_SetupPacket + 7), W, B
	BNZ	_00466_DS_
	BANKSEL	_wCount
	MOVF	_wCount, W, B
	BANKSEL	(_SetupPacket + 6)
	SUBWF	(_SetupPacket + 6), W, B
_00466_DS_:
	BC	_00438_DS_
;	.line	502; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = SetupPacket.wLength;
	MOVFF	(_SetupPacket + 6), _wCount
	MOVFF	(_SetupPacket + 7), (_wCount + 1)
_00438_DS_:
;	.line	503; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	InDataStage(0);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_InDataStage
	MOVF	POSTINC1, F
;	.line	504; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	ctrlTransferStage = DATA_IN_STAGE;
	MOVLW	0x02
	BANKSEL	_ctrlTransferStage
	MOVWF	_ctrlTransferStage, B
;	.line	506; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
	BANKSEL	(_ep_bdt + 1)
	MOVWF	(_ep_bdt + 1), B
;	.line	507; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&SetupPacket);
	MOVLW	LOW(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_SetupPacket)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	508; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN;
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
;	.line	511; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(0).ADDR = PTR16(&controlTransferBuffer);
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 6), B
	MOVLW	HIGH(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 7), B
;	.line	513; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
	BRA	_00444_DS_
_00440_DS_:
;	.line	517; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	ctrlTransferStage = DATA_OUT_STAGE;
	MOVLW	0x01
	BANKSEL	_ctrlTransferStage
	MOVWF	_ctrlTransferStage, B
	BANKSEL	(_ep_bdt + 5)
;	.line	520; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(0).Cnt = 0;
	CLRF	(_ep_bdt + 5), B
;	.line	521; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 4), B
;	.line	524; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 1), B
;	.line	525; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).ADDR = PTR16(&controlTransferBuffer);
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 2), B
	MOVLW	HIGH(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	(_ep_bdt + 3), B
;	.line	527; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
	MOVLW	0xc8
; removed redundant BANKSEL
	MOVWF	_ep_bdt, B
_00444_DS_:
;	.line	531; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	UCONbits.PKTDIS = 0;
	BCF	_UCONbits, 4
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__OutDataStage	code
_OutDataStage:
;	.line	429; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	void OutDataStage(unsigned char ep) {
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
;	.line	432; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	bufferSize = ((0x03 & EP_OUT_BD(ep).Stat.uc) << 8) | EP_OUT_BD(ep).Cnt;
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
;	.line	439; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = wCount + bufferSize;
	MOVF	r0x00, W
	BANKSEL	_wCount
	ADDWF	_wCount, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_wCount + 1), F, B
;	.line	441; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	outPtr = (u8*)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	445; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	for (i=0;i<bufferSize;i++) {
	CLRF	r0x02
	CLRF	r0x03
_00415_DS_:
	MOVF	r0x01, W
	SUBWF	r0x03, W
	BNZ	_00428_DS_
	MOVF	r0x00, W
	SUBWF	r0x02, W
_00428_DS_:
	BC	_00417_DS_
;	.line	449; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	*inPtr++ = *outPtr++;
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
	BNC	_00429_DS_
; removed redundant BANKSEL
	INCFSZ	(_outPtr + 1), F, B
	BRA	_142467_DS_
; removed redundant BANKSEL
	INCF	(_outPtr + 2), F, B
_142467_DS_:
_00429_DS_:
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
	BANKSEL	_inPtr
	INCF	_inPtr, F, B
	BNC	_00430_DS_
; removed redundant BANKSEL
	INCFSZ	(_inPtr + 1), F, B
	BRA	_152468_DS_
; removed redundant BANKSEL
	INCF	(_inPtr + 2), F, B
_152468_DS_:
_00430_DS_:
;	.line	445; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	for (i=0;i<bufferSize;i++) {
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00415_DS_
_00417_DS_:
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
;	.line	382; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	void InDataStage(unsigned char ep) {
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
;	.line	389; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(wCount < EP0_BUFFER_SIZE)
	MOVLW	0x00
	BANKSEL	(_wCount + 1)
	SUBWF	(_wCount + 1), W, B
	BNZ	_00400_DS_
	MOVLW	0x40
; removed redundant BANKSEL
	SUBWF	_wCount, W, B
_00400_DS_:
	BC	_00382_DS_
;	.line	390; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	bufferSize = wCount;
	MOVFF	_wCount, r0x01
	MOVFF	(_wCount + 1), r0x02
	BRA	_00383_DS_
_00382_DS_:
;	.line	392; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	bufferSize = EP0_BUFFER_SIZE;
	MOVLW	0x40
	MOVWF	r0x01
	CLRF	r0x02
_00383_DS_:
;	.line	400; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(ep).Stat.uc &= ~(BDS_BC8 | BDS_BC9);
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
;	.line	401; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(ep).Stat.uc |= (u8)((bufferSize & 0x0300) >> 8);
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
;	.line	402; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(ep).Cnt = (u8)(bufferSize & 0xFF);
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
;	.line	403; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	EP_IN_BD(ep).ADDR = PTR16(&controlTransferBuffer);
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
;	.line	408; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = wCount - bufferSize;
	MOVF	r0x01, W
	BANKSEL	_wCount
	SUBWF	_wCount, F, B
	MOVF	r0x02, W
; removed redundant BANKSEL
	SUBWFB	(_wCount + 1), F, B
;	.line	411; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	inPtr = (u8 *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_inPtr + 1)
	MOVWF	(_inPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_inPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_inPtr + 2), B
;	.line	416; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	for (i=0;i<bufferSize;i++) {
	CLRF	r0x00
_00386_DS_:
	MOVFF	r0x00, r0x03
	CLRF	r0x04
	MOVF	r0x02, W
	SUBWF	r0x04, W
	BNZ	_00406_DS_
	MOVF	r0x01, W
	SUBWF	r0x03, W
_00406_DS_:
	BC	_00388_DS_
;	.line	420; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	*inPtr++ = *outPtr++;
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
	BNC	_00407_DS_
; removed redundant BANKSEL
	INCFSZ	(_outPtr + 1), F, B
	BRA	_162469_DS_
; removed redundant BANKSEL
	INCF	(_outPtr + 2), F, B
_162469_DS_:
_00407_DS_:
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	BANKSEL	_inPtr
	INCF	_inPtr, F, B
	BNC	_00408_DS_
; removed redundant BANKSEL
	INCFSZ	(_inPtr + 1), F, B
	BRA	_172470_DS_
; removed redundant BANKSEL
	INCF	(_inPtr + 2), F, B
_172470_DS_:
_00408_DS_:
;	.line	416; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	for (i=0;i<bufferSize;i++) {
	INCF	r0x00, F
	BRA	_00386_DS_
_00388_DS_:
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
;	.line	271; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	void ProcessStandardRequest(void) {
	MOVFF	r0x00, POSTDEC1
;	.line	272; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 request = SetupPacket.bRequest;
	MOVFF	(_SetupPacket + 1), r0x00
	BANKSEL	_SetupPacket
;	.line	274; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if((SetupPacket.bmRequestType & 0x60) != 0x00)
	MOVF	_SetupPacket, W, B
; #	ANDLW	0x60
; #	BTFSC	STATUS, 2
; #	GOTO	_00295_DS_
; #	GOTO	_00327_DS_
; #	MOVF	r0x00, W
;	.line	277; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	return;
	ANDLW	0x60
;	.line	279; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (request == SET_ADDRESS) {
	BTFSS	STATUS, 2
	BRA	_00327_DS_
	MOVF	r0x00, W
	XORLW	0x05
	BNZ	_00325_DS_
;	.line	287; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	288; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	deviceState = ADDRESS;
	MOVLW	0x04
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
;	.line	289; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	deviceAddress = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _deviceAddress
	BRA	_00327_DS_
_00325_DS_:
;	.line	291; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (request == GET_DESCRIPTOR) {
	MOVF	r0x00, W
	XORLW	0x06
	BNZ	_00322_DS_
;	.line	292; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	GetDescriptor();
	CALL	_GetDescriptor
	BRA	_00327_DS_
_00322_DS_:
;	.line	294; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (request == SET_CONFIGURATION) {
	MOVF	r0x00, W
	XORLW	0x09
	BNZ	_00319_DS_
;	.line	298; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	299; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	currentConfiguration = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), _currentConfiguration
	BANKSEL	_currentConfiguration
;	.line	302; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (currentConfiguration == 0)
	MOVF	_currentConfiguration, W, B
	BNZ	_00297_DS_
;	.line	305; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	deviceState = ADDRESS;
	MOVLW	0x04
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
	BRA	_00327_DS_
_00297_DS_:
;	.line	308; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	deviceState = CONFIGURED;
	MOVLW	0x05
	BANKSEL	_deviceState
	MOVWF	_deviceState, B
;	.line	318; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	CDCInitEndpoint();
	CALL	_CDCInitEndpoint
	BRA	_00327_DS_
_00319_DS_:
;	.line	328; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (request == GET_CONFIGURATION) {
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00316_DS_
;	.line	332; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	333; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	outPtr = (u8*)&currentConfiguration;
	MOVLW	HIGH(_currentConfiguration)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_currentConfiguration)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	334; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = 1;
	MOVLW	0x01
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00327_DS_
_00316_DS_:
;	.line	336; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (request == GET_STATUS) {
	MOVF	r0x00, W
	BNZ	_00313_DS_
;	.line	337; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	GetStatus();
	CALL	_GetStatus
	BRA	_00327_DS_
_00313_DS_:
;	.line	339; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if ((request == CLEAR_FEATURE) ||
	MOVF	r0x00, W
	XORLW	0x01
	BZ	_00308_DS_
;	.line	340; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	(request == SET_FEATURE)) {
	MOVF	r0x00, W
	XORLW	0x03
	BNZ	_00309_DS_
_00308_DS_:
;	.line	341; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	SetFeature();
	CALL	_SetFeature
	BRA	_00327_DS_
_00309_DS_:
;	.line	343; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (request == GET_INTERFACE) {
	MOVF	r0x00, W
	XORLW	0x0a
	BNZ	_00306_DS_
;	.line	349; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BANKSEL	_controlTransferBuffer
;	.line	350; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	controlTransferBuffer[0] = 0;
	CLRF	_controlTransferBuffer, B
;	.line	351; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	outPtr = (u8 *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	352; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = 1;
	MOVLW	0x01
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00327_DS_
_00306_DS_:
;	.line	354; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (request == SET_INTERFACE) {
	MOVF	r0x00, W
	XORLW	0x0b
	BNZ	_00327_DS_
;	.line	359; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
_00327_DS_:
;	.line	366; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (request == SYNCH_FRAME) {
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__SetFeature	code
_SetFeature:
;	.line	227; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	static void SetFeature(void) {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	228; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 recipient = SetupPacket.bmRequestType & 0x1F;
	MOVLW	0x1f
	BANKSEL	_SetupPacket
	ANDWF	_SetupPacket, W, B
	MOVWF	r0x00
;	.line	229; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 feature = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), r0x01
;	.line	234; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (recipient == 0x00) {
	MOVF	r0x00, W
	BNZ	_00246_DS_
;	.line	236; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (feature == DEVICE_REMOTE_WAKEUP) {
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00279_DS_
	BRA	_00248_DS_
_00279_DS_:
;	.line	237; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BANKSEL	(_SetupPacket + 1)
;	.line	238; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (SetupPacket.bRequest == SET_FEATURE)
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x03
	BNZ	_00228_DS_
;	.line	239; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	remoteWakeup = 1;
	MOVLW	0x01
	BANKSEL	_remoteWakeup
	MOVWF	_remoteWakeup, B
	BRA	_00248_DS_
_00228_DS_:
	BANKSEL	_remoteWakeup
;	.line	241; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	remoteWakeup = 0;
	CLRF	_remoteWakeup, B
	BRA	_00248_DS_
_00246_DS_:
;	.line	245; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (recipient == 0x02) {
	MOVF	r0x00, W
	XORLW	0x02
	BZ	_00283_DS_
	BRA	_00248_DS_
_00283_DS_:
;	.line	247; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 endpointNum = SetupPacket.wIndex0 & 0x0F;
	MOVLW	0x0f
	BANKSEL	(_SetupPacket + 4)
	ANDWF	(_SetupPacket + 4), W, B
	MOVWF	r0x00
;	.line	248; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 endpointDir = SetupPacket.wIndex0 & 0x80;
	MOVLW	0x80
; removed redundant BANKSEL
	ANDWF	(_SetupPacket + 4), W, B
	MOVWF	r0x02
;	.line	249; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if ((feature == ENDPOINT_HALT) && (endpointNum != 0)) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00248_DS_
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00248_DS_
;	.line	251; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	254; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	inPtr = (u8 *)&EP_OUT_BD(0) + (endpointNum * 8);
	MOVLW	HIGH(_ep_bdt)
	MOVWF	r0x03
	MOVLW	LOW(_ep_bdt)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x04
; ;multiply lit val:0x08 by variable r0x00 and store in r0x00
	MOVF	r0x00, W
	MULLW	0x08
	MOVF	PRODH, W
	MOVWF	r0x05
	MOVFF	PRODL, r0x00
	MOVF	r0x00, W
	ADDWF	r0x01, W
	BANKSEL	_inPtr
	MOVWF	_inPtr, B
	MOVF	r0x05, W
	ADDWFC	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_inPtr + 1), B
	CLRF	WREG
	BTFSC	r0x05, 7
	SETF	WREG
	ADDWFC	r0x04, W
; removed redundant BANKSEL
	MOVWF	(_inPtr + 2), B
;	.line	255; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (endpointDir)
	MOVF	r0x02, W
	BZ	_00233_DS_
;	.line	256; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	inPtr += 4;
	MOVLW	0x04
; removed redundant BANKSEL
	ADDWF	_inPtr, F, B
	MOVLW	0x00
; removed redundant BANKSEL
	ADDWFC	(_inPtr + 1), F, B
; removed redundant BANKSEL
	ADDWFC	(_inPtr + 2), F, B
_00233_DS_:
	BANKSEL	(_SetupPacket + 1)
;	.line	258; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(SetupPacket.bRequest == SET_FEATURE)
	MOVF	(_SetupPacket + 1), W, B
	XORLW	0x03
	BNZ	_00238_DS_
;	.line	259; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	*inPtr = 0x84;
	MOVFF	_inPtr, r0x00
	MOVFF	(_inPtr + 1), r0x01
	MOVFF	(_inPtr + 2), r0x03
	MOVLW	0x84
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x03, W
	CALL	__gptrput1
	BRA	_00248_DS_
_00238_DS_:
;	.line	261; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(endpointDir == 1)
	MOVF	r0x02, W
	XORLW	0x01
	BNZ	_00235_DS_
;	.line	262; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	*inPtr = 0x00;
	MOVFF	_inPtr, r0x00
	MOVFF	(_inPtr + 1), r0x01
	MOVFF	(_inPtr + 2), r0x02
	CLRF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BRA	_00248_DS_
_00235_DS_:
;	.line	264; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	*inPtr = 0x88;
	MOVFF	_inPtr, r0x00
	MOVFF	(_inPtr + 1), r0x01
	MOVFF	(_inPtr + 2), r0x02
	MOVLW	0x88
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00248_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__GetStatus	code
_GetStatus:
;	.line	182; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	static void GetStatus(void) {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	184; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 recipient = SetupPacket.bmRequestType & 0x1F;
	MOVLW	0x1f
	BANKSEL	_SetupPacket
	ANDWF	_SetupPacket, W, B
	MOVWF	r0x00
	BANKSEL	_controlTransferBuffer
;	.line	188; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	controlTransferBuffer[0] = 0;
	CLRF	_controlTransferBuffer, B
; removed redundant BANKSEL
;	.line	189; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	controlTransferBuffer[1] = 0;
	CLRF	(_controlTransferBuffer + 1), B
;	.line	192; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (recipient == 0x00) {
	MOVF	r0x00, W
	BNZ	_00183_DS_
;	.line	194; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BANKSEL	_selfPowered
;	.line	196; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (selfPowered)
	MOVF	_selfPowered, W, B
	BZ	_00170_DS_
;	.line	197; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	controlTransferBuffer[0] |= 0x01;
	MOVLW	0x01
	BANKSEL	_controlTransferBuffer
	IORWF	_controlTransferBuffer, W, B
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	_controlTransferBuffer, B
_00170_DS_:
	BANKSEL	_remoteWakeup
;	.line	198; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (remoteWakeup)
	MOVF	_remoteWakeup, W, B
	BTFSC	STATUS, 2
	BRA	_00184_DS_
;	.line	199; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	controlTransferBuffer[0] |= 0x02;
	MOVLW	0x02
	BANKSEL	_controlTransferBuffer
	IORWF	_controlTransferBuffer, W, B
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	_controlTransferBuffer, B
	BRA	_00184_DS_
_00183_DS_:
;	.line	201; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (recipient == 0x01) {
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00180_DS_
;	.line	203; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
	BRA	_00184_DS_
_00180_DS_:
;	.line	205; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (recipient == 0x02) {
	MOVF	r0x00, W
	XORLW	0x02
	BZ	_00219_DS_
	BRA	_00184_DS_
_00219_DS_:
;	.line	207; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 endpointNum = SetupPacket.wIndex0 & 0x0F;
	MOVLW	0x0f
	BANKSEL	(_SetupPacket + 4)
	ANDWF	(_SetupPacket + 4), W, B
	MOVWF	r0x00
;	.line	208; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 endpointDir = SetupPacket.wIndex0 & 0x80;
	MOVLW	0x80
; removed redundant BANKSEL
	ANDWF	(_SetupPacket + 4), W, B
	MOVWF	r0x01
;	.line	209; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	212; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	inPtr = (u8 *)&EP_OUT_BD(0) + (endpointNum * 8);
	MOVLW	HIGH(_ep_bdt)
	MOVWF	r0x03
	MOVLW	LOW(_ep_bdt)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
; ;multiply lit val:0x08 by variable r0x00 and store in r0x00
	MOVF	r0x00, W
	MULLW	0x08
	MOVF	PRODH, W
	MOVWF	r0x05
	MOVFF	PRODL, r0x00
	MOVF	r0x00, W
	ADDWF	r0x02, W
	BANKSEL	_inPtr
	MOVWF	_inPtr, B
	MOVF	r0x05, W
	ADDWFC	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_inPtr + 1), B
	CLRF	WREG
	BTFSC	r0x05, 7
	SETF	WREG
	ADDWFC	r0x04, W
; removed redundant BANKSEL
	MOVWF	(_inPtr + 2), B
;	.line	213; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (endpointDir)
	MOVF	r0x01, W
	BZ	_00174_DS_
;	.line	214; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	inPtr += 4;
	MOVLW	0x04
; removed redundant BANKSEL
	ADDWF	_inPtr, F, B
	MOVLW	0x00
; removed redundant BANKSEL
	ADDWFC	(_inPtr + 1), F, B
; removed redundant BANKSEL
	ADDWFC	(_inPtr + 2), F, B
_00174_DS_:
;	.line	215; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(*inPtr & BDS_BSTALL)
	MOVFF	_inPtr, r0x00
	MOVFF	(_inPtr + 1), r0x01
	MOVFF	(_inPtr + 2), r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	BTFSS	r0x00, 2
	BRA	_00184_DS_
;	.line	216; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	controlTransferBuffer[0] = 0x01;
	MOVLW	0x01
	BANKSEL	_controlTransferBuffer
	MOVWF	_controlTransferBuffer, B
_00184_DS_:
	BANKSEL	_requestHandled
;	.line	219; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (requestHandled) {
	MOVF	_requestHandled, W, B
	BZ	_00187_DS_
;	.line	220; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	outPtr = (u8 *)&controlTransferBuffer;
	MOVLW	HIGH(_controlTransferBuffer)
	BANKSEL	(_outPtr + 1)
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_controlTransferBuffer)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_outPtr + 2), B
;	.line	221; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = 2;
	MOVLW	0x02
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
_00187_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__GetDescriptor	code
_GetDescriptor:
;	.line	97; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	static void GetDescriptor(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	BANKSEL	_SetupPacket
;	.line	103; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if(SetupPacket.bmRequestType == 0x80)
	MOVF	_SetupPacket, W, B
	XORLW	0x80
	BZ	_00156_DS_
	BRA	_00138_DS_
_00156_DS_:
;	.line	105; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 descriptorType  = SetupPacket.wValue1;
	MOVFF	(_SetupPacket + 3), r0x00
;	.line	106; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	u8 descriptorIndex = SetupPacket.wValue0;
	MOVFF	(_SetupPacket + 2), r0x01
;	.line	108; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	if (descriptorType == DEVICE_DESCRIPTOR)
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00134_DS_
;	.line	113; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	114; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	outPtr = (u8 *)&libdevice_descriptor;
	MOVLW	UPPER(_libdevice_descriptor)
	BANKSEL	(_outPtr + 2)
	MOVWF	(_outPtr + 2), B
	MOVLW	HIGH(_libdevice_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_libdevice_descriptor)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
;	.line	115; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = sizeof(USB_Device_Descriptor);
	MOVLW	0x12
	BANKSEL	_wCount
	MOVWF	_wCount, B
; removed redundant BANKSEL
	CLRF	(_wCount + 1), B
	BRA	_00138_DS_
_00134_DS_:
;	.line	118; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (descriptorType == CONFIGURATION_DESCRIPTOR)
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00131_DS_
;	.line	124; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
;	.line	136; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	outPtr = (u8 *)&libconfiguration_descriptor;
	MOVLW	UPPER(_libconfiguration_descriptor)
	BANKSEL	(_outPtr + 2)
	MOVWF	(_outPtr + 2), B
	MOVLW	HIGH(_libconfiguration_descriptor)
; removed redundant BANKSEL
	MOVWF	(_outPtr + 1), B
	MOVLW	LOW(_libconfiguration_descriptor)
; removed redundant BANKSEL
	MOVWF	_outPtr, B
;	.line	138; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = libconfiguration_descriptor.Header.wTotalLength;
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
	BRA	_00138_DS_
_00131_DS_:
;	.line	146; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (descriptorType == STRING_DESCRIPTOR)
	MOVF	r0x00, W
	XORLW	0x03
	BNZ	_00128_DS_
;	.line	152; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
; ;multiply lit val:0x03 by variable r0x01 and store in r0x01
;	.line	154; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	outPtr = libstring_descriptor[descriptorIndex];
	MOVF	r0x01, W
	MULLW	0x03
	MOVF	PRODH, W
	MOVWF	r0x02
	MOVFF	PRODL, r0x01
	CLRF	r0x03
	MOVLW	LOW(_libstring_descriptor)
	ADDWF	r0x01, F
	MOVLW	HIGH(_libstring_descriptor)
	ADDWFC	r0x02, F
	MOVLW	UPPER(_libstring_descriptor)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, _outPtr
	TBLRD*+	
	MOVFF	TABLAT, (_outPtr + 1)
	TBLRD*+	
	MOVFF	TABLAT, (_outPtr + 2)
;	.line	155; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	wCount = *outPtr;
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
	BRA	_00138_DS_
_00128_DS_:
;	.line	158; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	else if (descriptorType == DEVICE_QUALIFIER_DESCRIPTOR)
	MOVF	r0x00, W
	XORLW	0x06
	BNZ	_00138_DS_
;	.line	164; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/p8/pinguino/libraries/usb/picUSB.c	requestHandled = 1;
	MOVLW	0x01
	BANKSEL	_requestHandled
	MOVWF	_requestHandled, B
_00138_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__epapout_init	code
_epapout_init:
;	.line	59; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	void epapout_init() { return; }
	RETURN	

; ; Starting pCode block
S_main__epapin_init	code
_epapin_init:
;	.line	58; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	void epapin_init()  { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_out	code
_epap_out:
;	.line	57; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	void epap_out()     { return; }
	RETURN	

; ; Starting pCode block
S_main__epap_in	code
_epap_in:
;	.line	56; /home/yeison/Documentos/python/apps/pinguinoIDE/x.4/source/main.c	void epap_in()      { return; }
	RETURN	

; ; Starting pCode block for Ival
	code
_libdevice_descriptor:
	DB	0x12, 0x01, 0x00, 0x02, 0x02, 0x00, 0x00, 0x40, 0xd8, 0x04, 0xab, 0xfe
	DB	0x00, 0x00, 0x01, 0x02, 0x00, 0x01
; ; Starting pCode block for Ival
_libconfiguration_descriptor:
	DB	0x09, 0x02, 0x43, 0x00, 0x02, 0x01, 0x00, 0xc0, 0x14, 0x09, 0x04, 0x00
	DB	0x00, 0x01, 0x02, 0x02, 0x01, 0x00, 0x05, 0x24, 0x00, 0x10, 0x01, 0x04
	DB	0x24, 0x02, 0x00, 0x05, 0x24, 0x06, 0x00, 0x01, 0x05, 0x24, 0x01, 0x00
	DB	0x01, 0x07, 0x05, 0x82, 0x03, 0x10, 0x00, 0x02, 0x09, 0x04, 0x01, 0x00
	DB	0x02, 0x0a, 0x00, 0x00, 0x00, 0x07, 0x05, 0x03, 0x02, 0x40, 0x00, 0x00
	DB	0x07, 0x05, 0x83, 0x02, 0x40, 0x00, 0x00
; ; Starting pCode block for Ival
_lang:
	DB	0x04, 0x03, 0x09, 0x04
; ; Starting pCode block for Ival
_manu:
	DB	0x16, 0x03, 0x4a, 0x00, 0x50, 0x00, 0x20, 0x00, 0x4d, 0x00, 0x41, 0x00
	DB	0x4e, 0x00, 0x44, 0x00, 0x4f, 0x00, 0x4e, 0x00, 0x20, 0x00
; ; Starting pCode block for Ival
_prod:
	DB	0x12, 0x03, 0x50, 0x00, 0x69, 0x00, 0x6e, 0x00, 0x67, 0x00, 0x75, 0x00
	DB	0x69, 0x00, 0x6e, 0x00, 0x6f, 0x00
; ; Starting pCode block for Ival
_libstring_descriptor:
	DB	LOW(_lang), HIGH(_lang), UPPER(_lang), LOW(_manu), HIGH(_manu), UPPER(_manu), LOW(_prod), HIGH(_prod), UPPER(_prod)
; ; Starting pCode block
__str_0:
	DB	0x28, 0x6e, 0x75, 0x6c, 0x6c, 0x29, 0x00
; ; Starting pCode block
__str_1:
	DB	0x25, 0x66, 0x00
; ; Starting pCode block
__str_2:
	DB	0x25, 0x64, 0x00
; ; Starting pCode block
__str_3:
	DB	0x25, 0x78, 0x00
; ; Starting pCode block
__str_4:
	DB	0x25, 0x6f, 0x00
; ; Starting pCode block
__str_5:
	DB	0x25, 0x62, 0x00
; ; Starting pCode block
__str_6:
	DB	0x0a, 0x0d, 0x00
; ; Starting pCode block
__str_7:
	DB	0x25, 0x63, 0x00
; ; Starting pCode block for Ival
_mask:
	DB	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x40, 0x80, 0x01, 0x02
	DB	0x04, 0x01, 0x02, 0x04, 0x08, 0x20, 0x10
; ; Starting pCode block for Ival
_port:
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02
	DB	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; ; Starting pCode block for Ival
_cpudiv:
	DB	0x01, 0x02, 0x03, 0x06
; ; Starting pCode block for Ival
_ircf:
	DB	0x12, 0x7a, 0x00, 0x00, 0x48, 0xe8, 0x01, 0x00, 0x90, 0xd0, 0x03, 0x00
	DB	0x20, 0xa1, 0x07, 0x00, 0x40, 0x42, 0x0f, 0x00, 0x80, 0x84, 0x1e, 0x00
	DB	0x00, 0x09, 0x3d, 0x00, 0x00, 0x12, 0x7a, 0x00
; ; Starting pCode block
__str_8:
	DB	0x70, 0x69, 0x6e, 0x4d, 0x6f, 0x64, 0x65, 0x00
; ; Starting pCode block
__str_9:
	DB	0x49, 0x4e, 0x50, 0x55, 0x54, 0x00
; ; Starting pCode block
__str_10:
	DB	0x4f, 0x55, 0x54, 0x50, 0x55, 0x54, 0x00
; ; Starting pCode block
__str_11:
	DB	0x28, 0x00
; ; Starting pCode block
__str_12:
	DB	0x2c, 0x00
; ; Starting pCode block
__str_13:
	DB	0x64, 0x69, 0x67, 0x69, 0x74, 0x61, 0x6c, 0x57, 0x72, 0x69, 0x74, 0x65
	DB	0x00
; ; Starting pCode block
__str_14:
	DB	0x48, 0x49, 0x47, 0x48, 0x00
; ; Starting pCode block
__str_15:
	DB	0x4c, 0x4f, 0x57, 0x00
; ; Starting pCode block
__str_16:
	DB	0x61, 0x6e, 0x61, 0x6c, 0x6f, 0x67, 0x57, 0x72, 0x69, 0x74, 0x65, 0x00
; ; Starting pCode block
__str_17:
	DB	0x64, 0x69, 0x67, 0x69, 0x74, 0x61, 0x6c, 0x52, 0x65, 0x61, 0x64, 0x00
; ; Starting pCode block
__str_18:
	DB	0x25, 0x64, 0x0a, 0x00
; ; Starting pCode block
__str_19:
	DB	0x29, 0x00
; ; Starting pCode block
__str_20:
	DB	0x61, 0x6e, 0x61, 0x6c, 0x6f, 0x67, 0x52, 0x65, 0x61, 0x64, 0x00
; ; Starting pCode block
__str_21:
	DB	0x65, 0x65, 0x70, 0x72, 0x6f, 0x6d, 0x52, 0x65, 0x61, 0x64, 0x00
; ; Starting pCode block
__str_22:
	DB	0x65, 0x65, 0x70, 0x72, 0x6f, 0x6d, 0x57, 0x72, 0x69, 0x74, 0x65, 0x00
; ; Starting pCode block
__str_23:
	DB	0x64, 0x65, 0x6c, 0x61, 0x79, 0x00
; ; Starting pCode block
__str_24:
	DB	0x64, 0x65, 0x6c, 0x61, 0x79, 0x4d, 0x69, 0x63, 0x72, 0x6f, 0x73, 0x65
	DB	0x63, 0x6f, 0x6e, 0x64, 0x73, 0x00
; ; Starting pCode block
__str_25:
	DB	0x44, 0x6f, 0x6e, 0x65, 0x0a, 0x00
; ; Starting pCode block
__str_26:
	DB	0x61, 0x6c, 0x6c, 0x4f, 0x75, 0x74, 0x70, 0x75, 0x74, 0x00
; ; Starting pCode block
__str_27:
	DB	0x61, 0x6c, 0x6c, 0x49, 0x6e, 0x70, 0x75, 0x74, 0x00
; ; Starting pCode block
__str_28:
	DB	0x61, 0x6c, 0x6c, 0x48, 0x69, 0x67, 0x68, 0x00
; ; Starting pCode block
__str_29:
	DB	0x61, 0x6c, 0x6c, 0x4c, 0x6f, 0x77, 0x00
; ; Starting pCode block
__str_30:
	DB	0x72, 0x65, 0x73, 0x65, 0x74, 0x00


; Statistics:
; code size:	19164 (0x4adc) bytes (14.62%)
;           	 9582 (0x256e) words
; udata size:	  756 (0x02f4) bytes (42.19%)
; access size:	   33 (0x0021) bytes


	end
