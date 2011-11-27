/*                  - Dimax Israel Confidential and Proprietary -
 *
 *  Copyright (C) June 2000, Dimax Israel.  ALL RIGHTS RESERVED.
 *
 *  Except as specifically permitted herein, no portion of the information,
 *  including but not limited to object code and source code, may be reproduced,
 *  modified, distributed, republished or otherwise exploited in any form or by
 *  any means for any purpose without the prior written permission of Dimax 
 *  Israel. Use of software subject to the terms and conditions
 *  detailed in the file "LICENSE.txt".
 *
 */

/*-------------------------------------------------------------------
 * $Id: io_cfg.h,v 1.1.1.1 2006/02/16 17:37:44 mtvs12 Exp $
 *-------------------------------------------------------------------
*/
#ifndef IO_CFG_H
#define IO_CFG_H

/*
*-----------------------------------------------------------------------------
* Constants
*-----------------------------------------------------------------------------
*/

/* LED */
#define	USE_LED
#ifdef	USE_LED
 #define LEDout     LATEbits.LATE0
 #define LEDtris	TRISEbits.TRISE0
#endif

/* Jumpers */
#define USE_JP_BOOTLOADER_EN
#ifdef  USE_JP_BOOTLOADER_EN
 #define JP_BOOTLOADER_EN	0	
 #define jp_bootloaderEN	PORTEbits.RE0
#endif

#endif //IO_CFG_H

