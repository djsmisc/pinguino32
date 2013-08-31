/*******************************************************************************
	Title:	USB Pinguino Bootloader
	File:	hardware.h
	Descr.: bootloader def. (version, speed, led, tempo.)
	Author:	Régis Blanchot <rblanchot@gmail.com>

	This file is part of Pinguino (http://www.pinguino.cc)
	Released under the LGPL license (http://www.gnu.org/licenses/lgpl.html)
*******************************************************************************/

#include <p32xxxx.h>

/*******************************************************************************
    memory organization
    BMXPFMSZ<31:0>: Program Flash Memory (PFM) Size bits
    0x00004000 = device has 16 KB Flash
    0x00008000 = device has 32 KB Flash
    0x00010000 = device has 64 KB Flash
    0x00020000 = device has 128 KB Flash
*******************************************************************************/
//#define FLASH_SIZE                      BMXPFMSZ
#define FLASH_PAGE_SIZE                 4096
/*
#define FLASH_PAGE_MAX                  FLASH_SIZE / FLASH_PAGE_SIZE
#define ProgramMemStart                 0x1D000000
#define ProgramMemEnd                   0x1D000000 + FLASH_SIZE - FLASH_PAGE_SIZE
// Put Bootloader at the end of Program Flash, Boot flash is too small
#define BootMemStart                    0x9D000000 + FLASH_SIZE - FLASH_PAGE_SIZE
*/
/*******************************************************************************
    boot blinking led : A4
*******************************************************************************/

#define LED_PIN							15
#define LED_PORT    					LATB
#define LED_PORT_SET					LATBSET
#define LED_PORT_CLR					LATBCLR
#define LED_PORT_INV					LATBINV
#define LED_TRIS_OUT					TRISBCLR
#define LED_MASK						1 << LED_PIN

/*******************************************************************************
    USB monitoring pin : B7
*******************************************************************************/

#define MON_PIN                         7
#define MON_PORT                        LATB
#define MON_TRIS_IN 					TRISBSET
#define MON_MASK						1 << MON_PIN

/*******************************************************************************
    boot timer delay (practical values between 1..10 seconds)
    timer ticks: CPU clock / 4 / prescaler = 8  / 16 timer overflow
*******************************************************************************/

#define BOOT_DELAY_IN_SECONDS			10
#define CPU_CLOCK						48000000
#define TIMER_TICKS_PER_SECOND			CPU_CLOCK / 65536 / 8 / 4
#define BOOT_TIMER_TICS					BOOT_DELAY_IN_SECONDS * TIMER_TICKS_PER_SECOND
//    #define BOOT_TIMER_TICS					229

#if BOOT_TIMER_TICS > 256
	#error "Boot delay too large"
#endif

/*******************************************************************************
	BOOTLOADER COMMANDS
	General Data Packet Structure:
	.
	__________________           RxBuffer fields
	|    COMMAND     |   0       [CMD]
	|      LEN       |   1       [LEN]
	|     ADDRL      |   2       [        ]  [addrl]
	|     ADDRH      |   3       [ADR.pAdr]: [addrh]
	|     ADDRU      |   4       [        ]  [addru]
	|                |   5       [DATA]
	|                |
	.      DATA      .
	.                .
	|                |   62
	|________________|   63

*******************************************************************************/

#define READ_VERSION     					0x00
#define READ_FLASH       					0x01
#define WRITE_FLASH      					0x02
#define ERASE_FLASH      					0x03
#define READ_EEDATA							0x04 // unused
#define WRITE_EEDATA						0x05 // unused
#define READ_CONFIG							0x06 // unused
#define WRITE_CONFIG						0x07 // unused
#define RESET								0xFF
