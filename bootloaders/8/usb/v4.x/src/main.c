/*******************************************************************************
    Title:	USB Pinguino Bootloader
    File:	hardware.h
    Descr.: bootloader def. (version, led, tempo.)
    Author:	André Gentric
            Régis Blanchot <rblanchot@gmail.com>
            Based on Albert Faber's JAL bootloader
            and Alexander Enzmann's USB Framework
    This file is part of Pinguino (http://www.pinguino.cc)
    Released under the LGPL license (http://www.gnu.org/licenses/lgpl.html)
*******************************************************************************/

//#pragma stack 0x300 255                         // Initializes stack of 255 bytes at RAM address 0x300

#include <pic18fregs.h>
#include "types.h"
#include "hardware.h"
#include "picUSB.h"
#include "config.h"
#include "vectors.h"

__code USB_Device_Descriptor device_descriptor = 
{
    sizeof(USB_Device_Descriptor),              // Size of this descriptor in bytes
    DEVICE_DESCRIPTOR,                          // Device descriptor type
    0x0200,                                     // USB Spec Release Number in BCD format (0x0100 for USB 1.0, 0x0110 for USB1.1, 0x0200 for USB2.0)
    0xff,                                       // Class Code-->00
    0x00,                                       // Subclass code
    0xff,                                       // Protocol code
    EP0_BUFFER_SIZE,                            // Max packet size for EP0
    0x04D8,                                     // Vendor ID, microchip=0x04D8, generic=0x05f9, test=0x067b
    0xFEAA,                                     // Product ID 0x00A für CDC, generic=0xffff, test=0x2303
    (MAJOR_VERSION<<8)+MINOR_VERSION,           // Device release number in BCD format-->0
    1,                                          // Manufacturer string index (0=no string descriptor)
    2,                                          // Product string index (0=no string descriptor)
    0,                                          // Device serial number string index
    1                                           // Number of possible configurations
};

__code USB_Configuration_Descriptor configuration_descriptor =
{
    // Configuration Descriptor Header
    {sizeof(USB_Configuration_Descriptor_Header),// Size of this descriptor in bytes
    CONFIGURATION_DESCRIPTOR,                   // CONFIGURATION descriptor type
    sizeof(USB_Configuration_Descriptor),       // Total length of data for this configuration
    1,                                          // Number of interfaces in this configuration
    1,                                          // Index value of this configuration
    0,                                          // Configuration string index
    192,//DEFAULT | POWERED,                          // Attributes
    20},                                         // Maximum Power Consumption in 2mA units
    // Data Interface Descriptor with in and out EPs
    {sizeof(USB_Interface_Descriptor),          // Size of this descriptor in bytes
    INTERFACE_DESCRIPTOR,                       // Interface descriptor type
    0,                                          // Interface Number
    0,                                          // Alternate Setting Number
    2,                                          // Number of endpoints in this interface
    0xff,                                       // Class code
    0xff,                                       // TODO: Subclass code
    0xff,                                       // TODO: Protocol code
    0},                                         // Index of String Descriptor Describing this interface-->2
    // Endpoint 1 Out
    {sizeof(USB_Endpoint_Descriptor),           // Size of Descriptor
    ENDPOINT_DESCRIPTOR,                        // Descriptor Type
    0x01,                                       // Endpoint Address
    0x02,                                       // Attribute = Bulk Transfer
    EP1_BUFFER_SIZE,                            // Packet Size
    0x00},                                      // Poll Intervall
    // Endpoint 1 IN
    {sizeof(USB_Endpoint_Descriptor),           // Size of Descriptor
    ENDPOINT_DESCRIPTOR,                        // Descriptor Type
    0x81,                                       // Endpoint Address
    0x02,                                       // Attribute = Bulk Transfer
    EP1_BUFFER_SIZE,                            // Packet Size
    0x00}
};

#if (STRING == 1)
    const char lang[] = {sizeof(lang),  STRING_DESCRIPTOR,
        0x09,0x04}; // english = 0x0409
    const char manu[] = {sizeof(manu),  STRING_DESCRIPTOR,
        'R',0x00,'.',0x00,'B',0x00,'l',0x00,'a',0x00,'n',0x00,'c',0x00,'h',0x00,'o',0x00,'t',0x00,
//        '/',0x00,
//        'A',0x00,'.',0x00,'G',0x00,'e',0x00,'n',0x00,'t',0x00,'r',0x00,'i',0x00,'c',0x00
        };
    const char prod[] = {sizeof(prod),  STRING_DESCRIPTOR,
        'P',0x00,'i',0x00,'n',0x00,'g',0x00,'u',0x00,'i',0x00,'n',0x00,'o',0x00};
    const char * const string_descriptor[] = { lang, manu, prod};
#endif

/*  --------------------------------------------------------------------
    ------------------------------------------------------------------*/
    
void delay(void) __naked
{
    word i;//=0xffff;
    while(i--);
/*
    __asm
        movlw	0xFF
        movwf	r0x00
        movlw	0xFF
        movwf	r0x01
    startup_loop:
        decfsz	r0x00, f
        bra 	startup_loop
        decfsz	r0x01, f
        bra 	startup_loop
    __endasm;
*/
}

/*  --------------------------------------------------------------------
    ------------------------------------------------------------------*/
    
void start_write(void) //__naked
{
    __asm
    
        movlw   0x55
        movwf   _EECON2         ; EECON2 = 0x55;
        movlw   0xAA
        movwf   _EECON2         ; EECON2 = 0xAA;
        bsf     _EECON1, 1      ; WR = 1; start write or erase operation
                                ; CPU stall here for 2ms
        nop                     ; proc. can forget to execute the first operation

    __endasm;
}

/*  --------------------------------------------------------------------
    ------------------------------------------------------------------*/
    
void disable_boot(void) __naked
{
    __asm
        clrf    _T1CON              ; disable timer 1
        clrf    _UCON               ; disable USB
        bsf     LED_TRIS, LED_PIN   ; led input
        bcf     LED_PORT, LED_PIN   ; led off
        call    _delay              ; force timeout on USB
    __endasm;
    //delay();
}

/*  --------------------------------------------------------------------
    UEP1bits.EPHSHK   = 1;		// EP handshaking on
    UEP1bits.EPCONDIS = 1;		// control transfers off
    UEP1bits.EPOUTEN  = 1;		// EP OUT enabled
    UEP1bits.EPINEN   = 1;		// EP IN enabled
    ------------------------------------------------------------------*/
    
void usb_configure_endpoints()
{
    UEP1 = 0b00011110;
    
    // for IN
    // set DTS bit, turn on data togle sync TOGGLE
    EP_IN_BD(1).Stat.uc  = 0b01000000;

    // for OUT
    EP_OUT_BD(1).Cnt  = EP1_BUFFER_SIZE;
    EP_OUT_BD(1).ADDR = PTR16(&bootCmd);
    // set UOWN bit, SIE owns the buffer
    EP_OUT_BD(1).Stat.uc = 0b10000000;
}

/*  --------------------------------------------------------------------
    ------------------------------------------------------------------*/
    
void usb_ep_data_out_callback(char end_point)
{
    byte counter;

    // whatever the command, keep LED high
    __asm
    bsf		LED_PORT, LED_PIN	; led on
    __endasm;
 
    // Number of byte(s) to return
    EP_IN_BD(end_point).Cnt = 0;

    // load table pointer
    TBLPTRU = bootCmd.addru;
    TBLPTRH = bootCmd.addrh;
    TBLPTRL = bootCmd.addrl;

/**********************************************************************/
    if (bootCmd.cmd ==  RESET)
/**********************************************************************/
    {
        //disable_boot();
        __asm
        call    _disable_boot
        goto    ENTRY       ; start user app
        __endasm;
    }
/**********************************************************************/
    else if (bootCmd.cmd == READ_VERSION)
/**********************************************************************/
    {
        bootCmd.buffer[2] = MINOR_VERSION;
        bootCmd.buffer[3] = MAJOR_VERSION;

        // Number of byte(s) to return
        EP_IN_BD(end_point).Cnt = 4;
    }

/**********************************************************************/
    else if (bootCmd.cmd == READ_FLASH)
/**********************************************************************/
    {
        for (counter=0; counter < bootCmd.len; counter++)
        {
            __asm TBLRD*+ __endasm;
            bootCmd.xdat[counter] = TABLAT;
        }

        // Number of byte(s) to return
        EP_IN_BD(end_point).Cnt = 5 + bootCmd.len;
    }

/**********************************************************************/
    else if (bootCmd.cmd == WRITE_FLASH)
/**********************************************************************/
    {
        EECON1bits.FREE = 0;                    // perform write-only
        
        #if defined(__18f13k50) || defined(__18f14k50) || \
            defined(__18f2455)  || defined(__18f4455)  || \
            defined(__18f2550)  || defined(__18f4550)  || \
            defined(__18f25k50) || defined(__18f45k50)

        /// Word or byte programming is not supported by these chips.
        /// The programming block is 32 bytes for all chips except x5k50
        /// The programming block is 64 bytes for x5k50.
        /// It is not necessary to load all holding register before a write operation
        /// NB:
        /// * High Speed USB has a Max. packet size of 64 bytes
        /// * Uploader (uploader8.py) sends 32-byte Data block + 5-byte Command block 

        // Load max. 32 holding registers
        for (counter=0; counter < bootCmd.len; counter++)
        {
            TABLAT = bootCmd.xdat[counter];     // present data to table latch
            __asm TBLWT*+ __endasm;             // write data in TBLWT holding register
        }
        __asm
            TBLRD*-             ; one back to be inside the 32 bytes range
            call    _start_write    ; issue the block
        __endasm;
 
        #elif defined(__18f26j50) || defined(__18f46j50) || \
              defined(__18f26j53) || defined(__18f46j53) || \
              defined(__18f27j53) || defined(__18f47j53)
        
        /// blocks must be erased before written
        /// uploader8.py erases the whole memory once at the begining of upload
        /// so we can't write only one time at the same place
        /// but we write 32 bytes at a time not 64 bytes :
        /// 0   : write [address]       + 64 bytes
        /// 1   : write [address + 32]  + 64 bytes
        /// ...
        /// n   : write [address + 32n] + 64 bytes
        /// if we used 64-byte write mode, 32 bytes were written 2 times : not possible
        /// that's why we use 2-byte write instead
        
        for (counter=0; counter < bootCmd.len; counter+=2)
        {
            TBLPTRL =  bootCmd.addrl + counter;
            
            TABLAT = bootCmd.xdat[counter];
            // TBLPTR is incremented after the write
            __asm TBLWT*+ __endasm;
            TABLAT = bootCmd.xdat[counter + 1];
            // TBLPTR is NOT incremented after the write
            __asm
                TBLWT*
                call   _start_write
            __endasm;
        }

        #endif

        // Number of byte(s) to return
        EP_IN_BD(end_point).Cnt = 1;
    }

/**********************************************************************/
    else if (bootCmd.cmd ==  ERASE_FLASH)
/**********************************************************************/
    {

        EECON1bits.FREE = 1;                    // perform erase operation

        // bootCmd.len = num. of blocks to erase
        for (counter=0; counter < bootCmd.len; counter++)
        {
            __asm

                call    _start_write        ; issue current block

            #if defined(__18f13k50) || defined(__18f14k50) || \
                defined(__18f2455)  || defined(__18f4455)  || \
                defined(__18f2550)  || defined(__18f4550)  || \
                defined(__18f25k50) || defined(__18f45k50)

                /*
                 * The erase block is 64-byte long
                 * so next block is pointed by TBLPTR = TBLPTR + 64
                 */
                 
                movlw	0x40                ; 0x40 + (TBLPTRL) -> TBLPTRL
                addwf	_TBLPTRL, 1			;  (W) + (TBLPTRL) -> TBLPTRL
                                            ;  (C) is affected
                movlw	0x00				; 0x00 + (TBLPTRH) + (C) -> TBLPTRH
                addwfc	_TBLPTRH, 1			;  (W) + (TBLPTRH) + (C) -> TBLPTRH

            #elif defined(__18f26j50) || defined(__18f46j50) || \
                  defined(__18f26j53) || defined(__18f46j53) || \
                  defined(__18f27j53) || defined(__18f47j53)

                /*
                 * The erase block is 1024-byte long
                 * so next block is pointed by TBLPTR = TBLPTR + 1024
                 */
                
                movlw	0x04                ; 0x04 + (TBLPTRH) -> TBLPTRH
                addwf	_TBLPTRH, 1			;  (W) + (TBLPTRH) -> TBLPTRH
                                            ;  (C) is affected
                movlw	0x00				; 0x00 + (TBLPTRU) + (C) -> TBLPTRU
                addwfc	_TBLPTRU, 1			;  (W) + (TBLPTRU) + (C) -> TBLPTRU

            #endif

            __endasm;
        }

        // Number of byte(s) to return
        EP_IN_BD(end_point).Cnt = 1;
    }

/**********************************************************************/
    // Is there something to return ?
    if (EP_IN_BD(end_point).Cnt > 0)
    {
        // Data packet toggle
        if (EP_IN_BD(1).Stat.DTS)
            EP_IN_BD(1).Stat.uc = 0b10001000; // UOWN 1 DTS 0 DTSEN 1
        else
            EP_IN_BD(1).Stat.uc = 0b11001000; // UOWN 1 DTS 1 DTSEN 1
    }

    // reset size
    EP_OUT_BD(end_point).Cnt = EP1_BUFFER_SIZE;
    // set to UOWN
    EP_OUT_BD(end_point).Stat.uc = 0x80;      // UOWN 1
}

/*  --------------------------------------------------------------------
    Main loop
    ------------------------------------------------------------------*/
 
void main(void) //__naked
{
    dword i = 0;
    byte t1_count = 0;
    word led_counter = 0;
    
    __asm

    // Init. oscillator and I/O

/**********************************************************************/
    #if defined(__18f13k50) || defined(__18f14k50) || \
        defined(__18f2455)  || defined(__18f4455)  || \
        defined(__18f2550)  || defined(__18f4550)        
/**********************************************************************/

        movlw   0x0F
        movwf   _ADCON1             ; all I/O to Digital mode
        
        movlw   0x07
        movwf   _CMCON              ; all I/O to Digital mode

/**********************************************************************/
    #elif defined(__18f25k50) || defined(__18f45k50)
/**********************************************************************/

    #if (CRYSTAL == INTOSC)
    
        movlw   0x70                ; 0b01110000 : 111 = HFINTOSC (16 MHz)
        movwf   _OSCCON             ; enable the 16 MHz internal clock

    wait_hfintosc:
        btfss   _OSCCON, 2          ; HFIOFS: HFINTOSC Frequency Stable bit
        bra     wait_hfintosc       ; wait HFINTOSC frequency is stable (HFIOFS=1) 

    #endif

        clrf    _ANSELA             ; all I/O to Digital mode
        clrf    _ANSELB             ; all I/O to Digital mode
        clrf    _ANSELC             ; all I/O to Digital mode
        
    #if defined(__18f45k50)

        clrf    _ANSELD             ; all I/O to Digital mode
        clrf    _ANSELE             ; all I/O to Digital mode

    #endif
    
/**********************************************************************/
    #elif defined(__18f26j50) || defined(__18f46j50) || \
          defined(__18f26j53) || defined(__18f46j53) || \
          defined(__18f27j53) || defined(__18f47j53)
/**********************************************************************/

    #if (CRYSTAL == INTOSC)

        movlw   0x70                ; 0b01110000 : 111 = INTOSC (8 MHz)
        movwf   _OSCCON             ; enable the 8 MHz internal clock

    wait_intosc:
        btfss   _OSCCON, 2          ; FLTS: Frequency Lock Tuning Status bit
        bra     wait_intosc         ; wait INTOSC frequency is stable (FLTS=1) 

    #else

        bsf     _OSCTUNEbits, 6     ; Enable the PLL (PLLEN=bit6)
        call    _delay              ; Wait 2+ms until the PLL locks
                                    ; before enabling USB module
    #endif

        movlw   0xFF
        movwf   _ANCON0             ; AN0 to AN7  are Digital I/O
        movlw   0x1F
        movwf   _ANCON1             ; AN8 to AN12 are Digital I/O

/**********************************************************************/
    #else
/**********************************************************************/

        #error "    --------------------------    "
        #error "    PIC NO YET SUPPORTED !        "
        #error "    Please contact developers.    "
        #error "    --------------------------    "

    #endif
/**********************************************************************/

    // Init. interrupts

        ;bsf     _RCON, 7            ; enable priority levels on interrupts
        bcf     _INTCON, 7          ; disable interrupts
        
    // Init. led

        bcf     LED_TRIS, LED_PIN   ; led output
        bsf     LED_PORT, LED_PIN   ; led on

    // Init. timer1

        movlw    b'00110001'        ; prescaler 8 (0b11)
        movwf    _T1CON             ; timer 1 on, 

    /* Init write/erase register (EECON1)
     * bit 7, EEPGD = 1, memory is flash (unimplemented on J PIC)
     * bit 6, CFGS  = 0, enable acces to flash (unimplemented on J PIC)
     * bit 5, WPROG = 1, enable single word write (unimplemented on non-J PIC)
     * bit 4, FREE  = 0, enable write operation
     * bit 3, WRERR = 0, 
     * bit 2, WREN  = 1, enable write to memory
     * bit 1, WR    = 0,
     * bit 0, RD    = 0, (unimplemented on J PIC)
     */

        movlw    b'10100100'
        movwf    _EECON1

    // Init. usb
    
        #if (SPEED == LOW_SPEED)
        movlw   b'00010000'         ; (0x10) Enable pullup resistors and low speed mode
        #else
        movlw   b'00010100'         ; (0x14) Enable pullup resistors and full speed mode
        #endif

        banksel _UCFG
        movwf   _UCFG, b

    __endasm;

    EP_IN_BD(1).ADDR = PTR16(&bootCmd);
    currentConfiguration = 0x00;
    deviceState = DETACHED;

    do {
        EnableUSBModule();
        ProcessUSBTransactions();
        i = i + 1;
        if (i == 0xFFFFF) break; 
    } while (deviceState != CONFIGURED);

    // If no USB cable then start user app. now
    if (deviceState != CONFIGURED)
    {
        t1_count = BOOT_TIMER_TICS;
        __asm
            bcf     LED_PORT, LED_PIN   ; led on
        __endasm;
    }

    // Wait for User Upload
    
    while (1)
    {
        if (i!=0)
        {
            T1CONbits.TMR1ON = 0;
            ProcessUSBTransactions();
            T1CONbits.TMR1ON = 1;
        }
        
        // strobing LED
        if (led_counter == 0)
        {
            __asm
            movlw   LED_MASK    ; toggle
            xorwf   LED_PORT, f ; the led
            __endasm;
        }
        led_counter++;

        // timeout ?
        if (PIR1bits.TMR1IF == 1)
        {
            t1_count++;
            PIR1bits.TMR1IF = 0;

            // if expired, then jump to user location
            if (t1_count > BOOT_TIMER_TICS)
            {
                //disable_boot();
                __asm
                call    _disable_boot
                goto    ENTRY   ; start user app
                __endasm;
            }
        }
    }
}
