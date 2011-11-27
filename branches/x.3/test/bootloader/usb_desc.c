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
 * $Id: usb_desc.c,v 1.1.1.1 2006/02/16 17:37:44 mtvs12 Exp $
 *-------------------------------------------------------------------
*/

#include <p18cxxx.h>
#include "typedefs.h"
#include "usb_defs.h"
#include "usb_desc.h"

/*
*-----------------------------------------------------------------------------
* Constants
*-----------------------------------------------------------------------------
*/


/*
*-----------------------------------------------------------------------------
* Type Definitions
*-----------------------------------------------------------------------------
*/


/*
*-----------------------------------------------------------------------------
* Global Variables
*-----------------------------------------------------------------------------
*/
#pragma romdata
    
/* Device Descriptor */ 
rom USB_DEV_DSC device_desc =
{    
    sizeof(USB_DEV_DSC),	/* Size of this descriptor in bytes */
    DSC_DEV,                /* DEVICE descriptor type */
    0x0200,                 /* USB Spec Release Number in BCD format */
    0x00,                   /* Class Code */
    0x00,                   /* Subclass code */
    0x00,                   /* Protocol code */
    EP0_BUFF_SIZE,          /* Max packet size for EP0 */
    0x04D8,  				/* Vendor ID */
    0xFFC3, 				/* Product ID */
    0x0001,                 /* Device release number in BCD format */
    0x01,                   /* Manufacturer string index */
    0x02,                   /* Product string index */
    0x00,                   /* Device serial number string index */
    0x01                    /* Number of possible configurations */
};

/* Configuration 1 Descriptor */
rom struct struct_cfg01 cfg01 =
{
    /* Configuration Descriptor */
    sizeof(USB_CFG_DSC),	/* Size of this descriptor in bytes */
    DSC_CFG,                /* CONFIGURATION descriptor type */
    sizeof(cfg01),          /* Total length of data for this cfg */
    1,                      /* Number of interfaces in this cfg */
    1,                      /* Index value of this configuration */
    0,                      /* Configuration string index */
    _DEFAULT,               /* Attributes */
    50,                     /* Max power consumption (2X mA) */

    /* Interface Descriptor */
    sizeof(USB_INTF_DSC),   /* Size of this descriptor in bytes */
    DSC_INTF,               /* INTERFACE descriptor type */
    0,                      /* Interface Number */
    0,                      /* Alternate Setting Number */
    1,                      /* Number of endpoints in this intf */
    HID_INTF,               /* Class code */
    NO_SUBCLASS,            /* Subclass code */
    HID_PROTOCOL_NONE,      /* Protocol code */
    0,                      /* Interface string index */

    /* HID Class-Specific Descriptor */
    sizeof(USB_HID_DSC),    /* Size of this descriptor in bytes */
    DSC_HID,                /* HID descriptor type */
    0x0101,                 /* HID Spec Release Number in BCD format */
    0x00,                   /* Country Code (0x00 for Not supported) */
    HID_NUM_OF_DSC,         /* Number of class descriptors */
    DSC_RPT,                /* Report descriptor type */
    sizeof(hid_rpt01),      /* Size of the report descriptor */

    /* Endpoint Descriptors */
    sizeof(USB_EP_DSC),DSC_EP,_EP01_IN,_INT,HID_IN_EP_SIZE,0x01
};

/*
* String descriptors
*/
rom struct{byte bLength;byte bDscType;word string[1];}
	sd000={sizeof(sd000),DSC_STR,0x0409};

rom struct{byte bLength;byte bDscType;word string[10];}
	sd001={sizeof(sd001),DSC_STR,
        {'D','M','X','-','L','o','a','d','e','r'}
	};

rom struct struct_hid_rpt01 hid_rpt01 =
{
    0x05, 0x0C, 				/* Usage Page (Consumer devices) */
    0x09, 0x00, 				/* Usage (unassigned) */
    0xA1, 0x02, 				/* Collection (datalink) */
    0x09, 0x00, 				/* Usage (unassigned) */
	0x95, HID_IN_EP_SIZE,		/* report count 8 */
	0x75, 0x08,					/* report size 8 */
	0x81, 0x00,					/* input */
	0x09, 0x00,					/* Usage (unassigned) */
	0x95, HID_OUT_EP_SIZE,		/* report count 8 */
	0x75, 0x08,					/* report size 8 */
	0x91, 0x00,					/* output */
	0xc0						/* End Collection */
};




