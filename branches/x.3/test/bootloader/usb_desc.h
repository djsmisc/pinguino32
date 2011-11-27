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
 * $Id: usb_desc.h,v 1.1.1.1 2006/02/16 17:37:44 mtvs12 Exp $
 *-------------------------------------------------------------------
*/

#ifndef USB_DESC_H_INCLUDED
#define USB_DESC_H_INCLUDED

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

/* USB Device Descriptor Structure */
typedef struct struct_USB_DEV_DSC
{
    byte bLength;       
	byte bDscType;      
	word bcdUSB;
    byte bDevCls;       
	byte bDevSubCls;    
	byte bDevProtocol;
    byte bMaxPktSize0;  
	word idVendor;      
	word idProduct;
    word bcdDevice;     
	byte iMFR;          
	byte iProduct;
    byte iSerialNum;    
	byte bNumCfg;
} USB_DEV_DSC;

/* USB Configuration Descriptor Structure */
typedef struct struct_USB_CFG_DSC
{
    byte bLength;       
	byte bDscType;      
	word wTotalLength;
    byte bNumIntf;      
	byte bCfgValue;     
	byte iCfg;
    byte bmAttributes;  
		#define _DEFAULT    0x01<<7		/* Default Value (Bit 7 is set) */
		#define _SELF       0x01<<6 	/* Self-powered (Supports if set) */
		#define _RWU        0x01<<5 	/* Remote Wakeup (Supports if set) */
	byte bMaxPower;
} USB_CFG_DSC;

/* USB Interface Descriptor Structure */
typedef struct struct_USB_INTF_DSC
{
    byte bLength;       
	byte bDscType;      
	byte bIntfNum;
    byte bAltSetting;   
	byte bNumEPs;       
	byte bIntfCls;		/* HID Interface Class Code */ 
#define HID_INTF				0x03
    byte bIntfSubCls;   /* HID Interface Class SubClass Codes */
#define NO_SUBCLASS				0x00
#define BOOT_INTF_SUBCLASS  	0x01
	byte bIntfProtocol; /* HID Interface Class Protocol Codes */
#define HID_PROTOCOL_NONE       0x00
#define HID_PROTOCOL_KEYBOAD	0x01
#define HID_PROTOCOL_MOUSE      0x02
	byte iIntf;
} USB_INTF_DSC;

/* USB Endpoint Descriptor Structure */
typedef struct struct_USB_EP_DSC
{
    byte bLength;       
	byte bDscType;      
	byte bEPAdr;
		#define _EP01_OUT   0x01
		#define _EP01_IN    0x81
    byte bmAttributes;  
		#define _CTRL       0x00
		#define _ISO        0x01
		#define _BULK       0x02
		#define _INT        0x03
	word wMaxPktSize;   
	byte bInterval;
} USB_EP_DSC;

/* HID Descriptor Header */
typedef struct struct_USB_HID_DSC_HEADER
{
    byte bDscType;
    word wDscLength;
} USB_HID_DSC_HEADER;

/* HID Descriptor */
typedef struct struct_USB_HID_DSC
{
    byte bLength;       
	byte bDscType;      
		#define DSC_HID         0x21
		#define DSC_RPT         0x22
		#define DSC_PHY         0x23
	word bcdHID;
    byte bCountryCode;  
	byte bNumDsc;
		#define HID_NUM_OF_DSC	1
    USB_HID_DSC_HEADER hid_dsc_header[HID_NUM_OF_DSC];
} USB_HID_DSC;

/*
*-----------------------------------------------------------------------------
* Global Variables
*-----------------------------------------------------------------------------
*/
extern rom USB_DEV_DSC device_desc;

rom struct struct_cfg01
{   
    USB_CFG_DSC     cd01;            
    USB_INTF_DSC    i00a00;          
    USB_HID_DSC     hid_i00a00;      
    USB_EP_DSC      ep01i_i00a00;    
} extern cfg01;

extern rom struct{byte bLength;byte bDscType;word string[1];}sd000;
extern rom struct{byte bLength;byte bDscType;word string[10];}sd001;

rom struct struct_hid_rpt01
{
#define HID_RPT01_SIZE 	23
	byte report[HID_RPT01_SIZE];
} extern hid_rpt01;

#endif /*_H_INCLUDED*/

