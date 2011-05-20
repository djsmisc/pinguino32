
/*
 * pic18f8680.c - PIC18F8680 Device Library Source
 *
 * This file is part of the GNU PIC Library.
 *
 * January, 2004
 * The GNU PIC Library is maintained by,
 * 	Vangelis Rokas <vrokas@otenet.gr>
 *
 * $Id: pic18f8680.c 3765 2005-05-18 20:32:06Z tecodev $
 *
 */

#include <pic18f8680.h>

__sfr __at (0xf00) RXF0SIDH;
__sfr __at (0xf01) RXF0SIDL;
volatile __RXF0SIDLbits_t __at (0xf01) RXF0SIDLbits;

__sfr __at (0xf02) RXF0EIDH;
__sfr __at (0xf03) RXF0EIDL;
__sfr __at (0xf04) RXF1SIDH;
__sfr __at (0xf05) RXF1SIDL;
volatile __RXF1SIDLbits_t __at (0xf05) RXF1SIDLbits;

__sfr __at (0xf06) RXF1EIDH;
__sfr __at (0xf07) RXF1EIDL;
__sfr __at (0xf08) RXF2SIDH;
__sfr __at (0xf09) RXF2SIDL;
__sfr __at (0xf0a) RXF2EIDH;
__sfr __at (0xf0b) RXF2EIDL;
volatile __RXF2EIDLbits_t __at (0xf0b) RXF2EIDLbits;

__sfr __at (0xf0c) RXF3SIDH;
__sfr __at (0xf0d) RXF3SIDL;
volatile __RXF3SIDLbits_t __at (0xf0d) RXF3SIDLbits;

__sfr __at (0xf0e) RXF3EIDH;
__sfr __at (0xf0f) RXF3EIDL;
__sfr __at (0xf10) RXF4SIDH;
__sfr __at (0xf11) RXF4SIDL;
volatile __RXF4SIDLbits_t __at (0xf11) RXF4SIDLbits;

__sfr __at (0xf12) RXF4EIDH;
__sfr __at (0xf13) RXF4EIDL;
__sfr __at (0xf14) RXF5SIDH;
__sfr __at (0xf15) RXF5SIDL;
volatile __RXF5SIDLbits_t __at (0xf15) RXF5SIDLbits;

__sfr __at (0xf16) RXF5EIDH;
__sfr __at (0xf17) RXF5EIDL;
__sfr __at (0xf18) RXM0SIDH;
__sfr __at (0xf19) RXM0SIDL;
volatile __RXM0SIDLbits_t __at (0xf19) RXM0SIDLbits;

__sfr __at (0xf1a) RXM0EIDH;
__sfr __at (0xf1b) RXM0EIDL;
__sfr __at (0xf1c) RXM1SIDH;
__sfr __at (0xf1d) RXM1SIDL;
volatile __RXM1SIDLbits_t __at (0xf1d) RXM1SIDLbits;

__sfr __at (0xf1e) RXM1EIDH;
__sfr __at (0xf1f) RXM1EIDL;
__sfr __at (0xf20) TXB2CON;
volatile __TXB2CONbits_t __at (0xf20) TXB2CONbits;

__sfr __at (0xf21) TXB2SIDH;
__sfr __at (0xf22) TXB2SIDL;
volatile __TXB2SIDLbits_t __at (0xf22) TXB2SIDLbits;

__sfr __at (0xf23) TXB2EIDH;
__sfr __at (0xf24) TXB2EIDL;
__sfr __at (0xf25) TXB2DLC;
volatile __TXB2DLCbits_t __at (0xf25) TXB2DLCbits;

__sfr __at (0xf26) TXB2D0;
__sfr __at (0xf27) TXB2D1;
__sfr __at (0xf28) TXB2D2;
__sfr __at (0xf29) TXB2D3;
__sfr __at (0xf2a) TXB2D4;
__sfr __at (0xf2b) TXB2D5;
__sfr __at (0xf2c) TXB2D6;
__sfr __at (0xf2d) TXB2D7;
__sfr __at (0xf2e) CANSTATRO3;
__sfr __at (0xf30) TXB1CON;
volatile __TXB1CONbits_t __at (0xf30) TXB1CONbits;

__sfr __at (0xf31) TXB1SIDH;
__sfr __at (0xf32) TXB1SIDL;
volatile __TXB1SIDLbits_t __at (0xf32) TXB1SIDLbits;

__sfr __at (0xf33) TXB1EIDH;
__sfr __at (0xf34) TXB1EIDL;
__sfr __at (0xf35) TXB1DLC;
volatile __TXB1DLCbits_t __at (0xf35) TXB1DLCbits;

__sfr __at (0xf36) TXB1D0;
__sfr __at (0xf37) TXB1D1;
__sfr __at (0xf38) TXB1D2;
__sfr __at (0xf39) TXB1D3;
__sfr __at (0xf3a) TXB1D4;
__sfr __at (0xf3b) TXB1D5;
__sfr __at (0xf3c) TXB1D6;
__sfr __at (0xf3d) TXB1D7;
__sfr __at (0xf3e) CANSTATRO2;
__sfr __at (0xf40) TXB0CON;
volatile __TXB0CONbits_t __at (0xf40) TXB0CONbits;

__sfr __at (0xf41) TXB0SIDH;
__sfr __at (0xf42) TXB0SIDL;
__sfr __at (0xf43) TXB0EIDH;
__sfr __at (0xf44) TXB0EIDL;
__sfr __at (0xf45) TXB0DLC;
volatile __TXB0DLCbits_t __at (0xf45) TXB0DLCbits;

__sfr __at (0xf46) TXB0D0;
__sfr __at (0xf47) TXB0D1;
__sfr __at (0xf48) TXB0D2;
__sfr __at (0xf49) TXB0D3;
__sfr __at (0xf4a) TXB0D4;
__sfr __at (0xf4b) TXB0D5;
__sfr __at (0xf4c) TXB0D6;
__sfr __at (0xf4d) TXB0D7;
__sfr __at (0xf4e) CANSTATRO1;
__sfr __at (0xf50) RXB1CON;
volatile __RXB1CONbits_t __at (0xf50) RXB1CONbits;

__sfr __at (0xf51) RXB1SIDH;
__sfr __at (0xf52) RXB1SIDL;
volatile __RXB1SIDLbits_t __at (0xf52) RXB1SIDLbits;

__sfr __at (0xf53) RXB1EIDH;
__sfr __at (0xf54) RXB1EIDL;
__sfr __at (0xf55) RXB1DLC;
volatile __RXB1DLCbits_t __at (0xf55) RXB1DLCbits;

__sfr __at (0xf56) RXB1D0;
__sfr __at (0xf57) RXB1D1;
__sfr __at (0xf58) RXB1D2;
__sfr __at (0xf59) RXB1D3;
__sfr __at (0xf5a) RXB1D4;
__sfr __at (0xf5b) RXB1D5;
__sfr __at (0xf5c) RXB1D6;
__sfr __at (0xf5d) RXB1D7;
__sfr __at (0xf5e) CANSTATRO0;
__sfr __at (0xf60) RXB0CON;
volatile __RXB0CONbits_t __at (0xf60) RXB0CONbits;

__sfr __at (0xf61) RXB0SIDH;
__sfr __at (0xf62) RXB0SIDL;
volatile __RXB0SIDLbits_t __at (0xf62) RXB0SIDLbits;

__sfr __at (0xf63) RXB0EIDH;
__sfr __at (0xf64) RXB0EIDL;
__sfr __at (0xf65) RXB0DLC;
__sfr __at (0xf66) RXB0D0;
__sfr __at (0xf67) RXB0D1;
__sfr __at (0xf68) RXB0D2;
__sfr __at (0xf69) RXB0D3;
__sfr __at (0xf6a) RXB0D4;
__sfr __at (0xf6b) RXB0D5;
__sfr __at (0xf6c) RXB0D6;
__sfr __at (0xf6d) RXB0D7;
__sfr __at (0xf6e) CANSTAT;
volatile __CANSTATbits_t __at (0xf6e) CANSTATbits;

__sfr __at (0xf6f) CANCON;
volatile __CANCONbits_t __at (0xf6f) CANCONbits;

__sfr __at (0xf70) BRGCON1;
volatile __BRGCON1bits_t __at (0xf70) BRGCON1bits;

__sfr __at (0xf71) BRGCON2;
volatile __BRGCON2bits_t __at (0xf71) BRGCON2bits;

__sfr __at (0xf72) BRGCON3;
volatile __BRGCON3bits_t __at (0xf72) BRGCON3bits;

__sfr __at (0xf73) CIOCON;
volatile __CIOCONbits_t __at (0xf73) CIOCONbits;

__sfr __at (0xf74) COMSTAT;
volatile __COMSTATbits_t __at (0xf74) COMSTATbits;

__sfr __at (0xf75) RXERRCNT;
volatile __RXERRCNTbits_t __at (0xf75) RXERRCNTbits;

__sfr __at (0xf76) TXERRCNT;
volatile __TXERRCNTbits_t __at (0xf76) TXERRCNTbits;

__sfr __at (0xf80) PORTA;
volatile __PORTAbits_t __at (0xf80) PORTAbits;

__sfr __at (0xf81) PORTB;
volatile __PORTBbits_t __at (0xf81) PORTBbits;

__sfr __at (0xf82) PORTC;
volatile __PORTCbits_t __at (0xf82) PORTCbits;

__sfr __at (0xf83) PORTD;
volatile __PORTDbits_t __at (0xf83) PORTDbits;

__sfr __at (0xf84) PORTE;
volatile __PORTEbits_t __at (0xf84) PORTEbits;

__sfr __at (0xf85) PORTF;
volatile __PORTFbits_t __at (0xf85) PORTFbits;

__sfr __at (0xf86) PORTG;
volatile __PORTGbits_t __at (0xf86) PORTGbits;

__sfr __at (0xf87) PORTH;
volatile __PORTHbits_t __at (0xf87) PORTHbits;

__sfr __at (0xf88) PORTJ;
volatile __PORTJbits_t __at (0xf88) PORTJbits;

__sfr __at (0xf89) LATA;
volatile __LATAbits_t __at (0xf89) LATAbits;

__sfr __at (0xf8a) LATB;
volatile __LATBbits_t __at (0xf8a) LATBbits;

__sfr __at (0xf8b) LATC;
volatile __LATCbits_t __at (0xf8b) LATCbits;

__sfr __at (0xf8c) LATD;
volatile __LATDbits_t __at (0xf8c) LATDbits;

__sfr __at (0xf8d) LATE;
volatile __LATEbits_t __at (0xf8d) LATEbits;

__sfr __at (0xf8e) LATF;
volatile __LATFbits_t __at (0xf8e) LATFbits;

__sfr __at (0xf8f) LATG;
volatile __LATGbits_t __at (0xf8f) LATGbits;

__sfr __at (0xf90) LATH;
volatile __LATHbits_t __at (0xf90) LATHbits;

__sfr __at (0xf91) LATJ;
volatile __LATJbits_t __at (0xf91) LATJbits;

__sfr __at (0xf92) TRISA;
volatile __TRISAbits_t __at (0xf92) TRISAbits;

__sfr __at (0xf93) TRISB;
volatile __TRISBbits_t __at (0xf93) TRISBbits;

__sfr __at (0xf94) TRISC;
volatile __TRISCbits_t __at (0xf94) TRISCbits;

__sfr __at (0xf95) TRISD;
volatile __TRISDbits_t __at (0xf95) TRISDbits;

__sfr __at (0xf96) TRISE;
volatile __TRISEbits_t __at (0xf96) TRISEbits;

__sfr __at (0xf97) TRISF;
volatile __TRISFbits_t __at (0xf97) TRISFbits;

__sfr __at (0xf98) TRISG;
volatile __TRISGbits_t __at (0xf98) TRISGbits;

__sfr __at (0xf99) TRISH;
volatile __TRISHbits_t __at (0xf99) TRISHbits;

__sfr __at (0xf9a) TRISJ;
volatile __TRISJbits_t __at (0xf9a) TRISJbits;

__sfr __at (0xf9c) MEMCON;
volatile __MEMCONbits_t __at (0xf9c) MEMCONbits;

__sfr __at (0xf9d) PIE1;
volatile __PIE1bits_t __at (0xf9d) PIE1bits;

__sfr __at (0xf9e) PIR1;
volatile __PIR1bits_t __at (0xf9e) PIR1bits;

__sfr __at (0xf9f) IPR1;
volatile __IPR1bits_t __at (0xf9f) IPR1bits;

__sfr __at (0xfa0) PIE2;
volatile __PIE2bits_t __at (0xfa0) PIE2bits;

__sfr __at (0xfa1) PIR2;
volatile __PIR2bits_t __at (0xfa1) PIR2bits;

__sfr __at (0xfa2) IPR2;
volatile __IPR2bits_t __at (0xfa2) IPR2bits;

__sfr __at (0xfa3) PIE3;
volatile __PIE3bits_t __at (0xfa3) PIE3bits;

__sfr __at (0xfa4) PIR3;
volatile __PIR3bits_t __at (0xfa4) PIR3bits;

__sfr __at (0xfa5) IPR3;
volatile __IPR3bits_t __at (0xfa5) IPR3bits;

__sfr __at (0xfa6) EECON1;
volatile __EECON1bits_t __at (0xfa6) EECON1bits;

__sfr __at (0xfa7) EECON2;
__sfr __at (0xfa8) EEDATA;
__sfr __at (0xfa9) EEADR;
__sfr __at (0xfaa) EEADRH;
__sfr __at (0xfab) RCSTA;
volatile __RCSTAbits_t __at (0xfab) RCSTAbits;

__sfr __at (0xfac) TXSTA;
volatile __TXSTAbits_t __at (0xfac) TXSTAbits;

__sfr __at (0xfad) TXREG;
__sfr __at (0xfae) RCREG;
__sfr __at (0xfaf) SPBRG;
__sfr __at (0xfb0) PSPCON;
volatile __PSPCONbits_t __at (0xfb0) PSPCONbits;

__sfr __at (0xfb1) T3CON;
volatile __T3CONbits_t __at (0xfb1) T3CONbits;

__sfr __at (0xfb2) TMR3L;
__sfr __at (0xfb3) TMR3H;
__sfr __at (0xfb4) CMCON;
volatile __CMCONbits_t __at (0xfb4) CMCONbits;

__sfr __at (0xfb5) CVRCON;
volatile __CVRCONbits_t __at (0xfb5) CVRCONbits;

__sfr __at (0xfb6) ECCPAS;
volatile __ECCPASbits_t __at (0xfb6) ECCPASbits;

__sfr __at (0xfb7) ECCP1DEL;
volatile __ECCP1DELbits_t __at (0xfb7) ECCP1DELbits;

__sfr __at (0xfba) ECCP1CON;
volatile __ECCP1CONbits_t __at (0xfba) ECCP1CONbits;

__sfr __at (0xfba) CCP2CON;
volatile __CCP2CONbits_t __at (0xfba) CCP2CONbits;

__sfr __at (0xfbb) ECCPR1L;
__sfr __at (0xfbb) CCPR2L;
__sfr __at (0xfbc) ECCPR1H;
__sfr __at (0xfbc) CCPR2H;
__sfr __at (0xfc0) ADCON2;
volatile __ADCON2bits_t __at (0xfc0) ADCON2bits;

__sfr __at (0xfc1) ADCON1;
volatile __ADCON1bits_t __at (0xfc1) ADCON1bits;

__sfr __at (0xfc2) ADCON0;
volatile __ADCON0bits_t __at (0xfc2) ADCON0bits;

__sfr __at (0xfc3) ADRESL;
__sfr __at (0xfc4) ADRESH;
__sfr __at (0xfc5) SSPCON2;
volatile __SSPCON2bits_t __at (0xfc5) SSPCON2bits;

__sfr __at (0xfc6) SSPCON1;
volatile __SSPCON1bits_t __at (0xfc6) SSPCON1bits;

__sfr __at (0xfc7) SSPSTAT;
volatile __SSPSTATbits_t __at (0xfc7) SSPSTATbits;

__sfr __at (0xfc8) SSPADD;
__sfr __at (0xfc9) SSPBUF;
__sfr __at (0xfca) T2CON;
volatile __T2CONbits_t __at (0xfca) T2CONbits;

__sfr __at (0xfcb) PR2;
__sfr __at (0xfcc) TMR2;
__sfr __at (0xfcd) T1CON;
volatile __T1CONbits_t __at (0xfcd) T1CONbits;

__sfr __at (0xfce) TMR1L;
__sfr __at (0xfcf) TMR1H;
__sfr __at (0xfd0) RCON;
volatile __RCONbits_t __at (0xfd0) RCONbits;

__sfr __at (0xfd1) WDTCON;
volatile __WDTCONbits_t __at (0xfd1) WDTCONbits;

__sfr __at (0xfd2) LVDCON;
volatile __LVDCONbits_t __at (0xfd2) LVDCONbits;

__sfr __at (0xfd3) OSCCON;
volatile __OSCCONbits_t __at (0xfd3) OSCCONbits;

__sfr __at (0xfd5) T0CON;
__sfr __at (0xfd6) TMR0L;
__sfr __at (0xfd7) TMR0H;
__sfr __at (0xfd8) STATUS;
volatile __STATUSbits_t __at (0xfd8) STATUSbits;

__sfr __at (0xfd9) FSR2L;
__sfr __at (0xfda) FSR2H;
__sfr __at (0xfdb) PLUSW2;
__sfr __at (0xfdc) PREINC2;
__sfr __at (0xfdd) POSTDEC2;
__sfr __at (0xfde) POSTINC2;
__sfr __at (0xfdf) INDF2;
__sfr __at (0xfe0) BSR;
__sfr __at (0xfe1) FSR1L;
__sfr __at (0xfe2) FSR1H;
__sfr __at (0xfe3) PLUSW1;
__sfr __at (0xfe4) PREINC1;
__sfr __at (0xfe5) POSTDEC1;
__sfr __at (0xfe6) POSTINC1;
__sfr __at (0xfe7) INDF1;
__sfr __at (0xfe8) WREG;
__sfr __at (0xfe9) FSR0L;
__sfr __at (0xfea) FSR0H;
__sfr __at (0xfeb) PLUSW0;
__sfr __at (0xfec) PREINC0;
__sfr __at (0xfed) POSTDEC0;
__sfr __at (0xfee) POSTINC0;
__sfr __at (0xfef) INDF0;
__sfr __at (0xff0) INTCON3;
volatile __INTCON3bits_t __at (0xff0) INTCON3bits;

__sfr __at (0xff1) INTCON2;
volatile __INTCON2bits_t __at (0xff1) INTCON2bits;

__sfr __at (0xff2) INTCON;
volatile __INTCONbits_t __at (0xff2) INTCONbits;

__sfr __at (0xff3) PRODL;
__sfr __at (0xff4) PRODH;
__sfr __at (0xff5) TABLAT;
__sfr __at (0xff6) TBLPTRL;
__sfr __at (0xff7) TBLPTRH;
__sfr __at (0xff8) TBLPTRU;
__sfr __at (0xff9) PCL;
__sfr __at (0xffa) PCLATH;
__sfr __at (0xffb) PCLATU;
__sfr __at (0xffc) STKPTR;
volatile __STKPTRbits_t __at (0xffc) STKPTRbits;

__sfr __at (0xffd) TOSL;
__sfr __at (0xffe) TOSH;
__sfr __at (0xfff) TOSU;

