/******************************************************************************

    USB Device Abstraction Layer
    
This file contains all of the application-specific support required by the USB
Device FW stack.  It defines the following:

 - USB Descriptor Table
 - USB_DEV_GET_DESCRIPTOR_FUNC Function Implementation
 - Endpoint Configuration Table
 - USB_DEV_GET_EP_CONFIG_TABLE_FUNC Function Implementation
 - USB Device-Functions Table
 - USB_DEV_GET_FUNCTION_DRIVER_TABLE_FUNC Implementation

 * Filename:        usb_app.c
 * Dependancies:    TBD
 * Processor:       TBD
 * Hardware:        TBD
 * Assembler:       TBD
 * Linker:          TBD
 * Company:         Microchip Technology, Inc.

Software License Agreement

The software supplied herewith by Microchip Technology Incorporated
(the “Company”) for its PICmicro® Microcontroller is intended and
supplied to you, the Company’s customer, for use solely and
exclusively on Microchip PICmicro Microcontroller products. The
software is owned by the Company and/or its supplier, and is
protected under applicable copyright laws. All rights are reserved.
Any use in violation of the foregoing restrictions may subject the
user to criminal sanctions under applicable laws, as well as to
civil liability for the breach of the terms and conditions of this
license.

THIS SOFTWARE IS PROVIDED IN AN “AS IS” CONDITION. NO WARRANTIES,
WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.

Author          Date    Comments
--------------------------------------------------------------------------------
BC              2006    Initial Creation

*******************************************************************************/
 
#include "GenericTypeDefs.h"
#include "USB/usb.h"
#include "USB/usb_device_cdc_serial.h"


/************************
 * USB Descriptor Table *
 ************************/                

#define LANG_1_ID   0x0409
#define NUM_LANGS   1
#define STR_1_LEN   25
#define STR_2_LEN   25
#define STR_3_LEN   10

/* USB Descriptor Table Structure
 *************************************************************************
 * This structure defines the complete set of descriptors necessary for 
 * the USB device portion of this application.
 */

#pragma pack(push,1)  // Must not have any padding.

typedef struct _config_descriptors
{
    USB_CONFIGURATION_DESCRIPTOR    config_desc;        // Config descriptor

    USB_INTERFACE_DESCRIPTOR        intf0_desc;         // Com class Interface

    USB_CDC_HEADER_FN_DSC           cdc_header;         // CDC Class-specific
    USB_CDC_ACM_FN_DSC              cdc_acm;
    USB_CDC_UNION_FN_DSC            cdc_union;
    USB_CDC_CALL_MGT_FN_DSC         cdc_call_mgt;
    USB_ENDPOINT_DESCRIPTOR         intf0_ep2_desc;     // Notification EP

    USB_INTERFACE_DESCRIPTOR        intf1_desc;         // Data Class Interface
    USB_ENDPOINT_DESCRIPTOR         intf1_ep2_desc;
    USB_ENDPOINT_DESCRIPTOR         intf1_ep3_desc;

} CDC_CFG_DSC;

typedef struct _usb_descriptor_table
{
    USB_DEVICE_DESCRIPTOR           dev_desc;           // Device Descriptor

    CDC_CFG_DSC                     cdc_config_descs;   // CDC config Desriptors

    USB_STRING_DESCRIPTOR           string_0;           // String Descriptors
    WORD                            langid[NUM_LANGS];
    USB_STRING_DESCRIPTOR           string_1;
    WORD                            string_1_data[STR_1_LEN];
    USB_STRING_DESCRIPTOR           string_2;
    WORD                            string_2_data[STR_2_LEN];
    USB_STRING_DESCRIPTOR           string_3;
    WORD                            string_3_data[STR_3_LEN];

} USB_DESC_TABLE, *PUSB_DESC_TABLE;

#pragma pack(pop)

USB_DESC_TABLE gDescTable =
{
    {   // Device Descriptor
        sizeof(USB_DEVICE_DESCRIPTOR),  // Size of this descriptor in bytes
        USB_DESCRIPTOR_DEVICE,          // DEVICE descriptor type
        0x0200,                         // USB Spec Release Number in BCD format
        CDC_DEVICE,                     // Class Code
        0x00,                           // Subclass code
        0x00,                           // Protocol code
        USB_DEV_EP0_MAX_PACKET_SIZE,    // Max packet size for EP0, see usbcfg.h
        0x04D8,                         // Vendor ID
        0x000A,                         // Product ID: CDC RS-232 Emulation Demo
        0x0000,                         // Device release number in BCD format
        0x01,                           // Manufacturer string index
        0x02,                           // Product string index
        0x03,                           // Device serial number string index
        0x01                            // Number of possible configurations
    },

    // Configuration 1:

    {
        {   // Configuration Descriptor
            sizeof(USB_CONFIGURATION_DESCRIPTOR),       // Size of this descriptor in bytes
            USB_DESCRIPTOR_CONFIGURATION,               // CONFIGURATION descriptor type
            sizeof(CDC_CFG_DSC),                        // Total length of data for this cfg
            2,                                          // Number of interfaces in this cfg
            CDC_CONFIG_NUM,                             // Index value of this configuration
            0,                                          // Configuration string index (none)
            USB_CFG_DSC_REQUIRED|USB_CFG_DSC_SELF_PWR,  // Set required bit
            100/2                                       // Max power consumption (100 mA)
        },
        {   // Communication Management Interface Descriptor
            sizeof(USB_INTERFACE_DESCRIPTOR),       // Size of this descriptor in bytes
            USB_DESCRIPTOR_INTERFACE,               // INTERFACE descriptor type
            CDC_COMM_INTF_ID,                       // Interface Number
            0,                                      // Alternate Setting Number
            1,                                      // Number of endpoints in this intf
            COMM_INTF,                              // Class code
            ABSTRACT_CONTROL_MODEL,                 // Subclass code
            V25TER,                                 // Protocol code
            0                                       // Interface string index (none)
        },

        // CDC Class-Specific Descriptors:

        {   // CDC Header Functional Descriptor
            sizeof(USB_CDC_HEADER_FN_DSC),      // Size of this descriptor in bytes
            CS_INTERFACE,                       // Descriptor Type
            DSC_FN_HEADER,                      // Descriptor Subtype
            0x0110                              // USB Class definition revision (BCD)
        },
        {   // Abstract Control Model Functional Descriptor
            sizeof(USB_CDC_ACM_FN_DSC),         // Size of this descriptor in bytes
            CS_INTERFACE,                       // Descriptor Type
            DSC_FN_ACM,                         // Descriptor Subtype
            0x02                                // Capabilities (line control)
        },
        {   // Union Functional Descriptor
            sizeof(USB_CDC_UNION_FN_DSC),       // Size of this descriptor in bytes
            CS_INTERFACE,                       // Descriptor Type
            DSC_FN_UNION,                       // Descriptor Subtype
            CDC_COMM_INTF_ID,                   // Master Interface
            CDC_DATA_INTF_ID                    // First (and only) Slave Interface
        },
        {   // Call Management Functional Descriptor
            sizeof(USB_CDC_CALL_MGT_FN_DSC),    // Size of this descriptor in bytes
            CS_INTERFACE,                       // Descriptor Type
            DSC_FN_CALL_MGT,                    // Descriptor Subtype
            0x00,                               // Capabalities (no call management)
            CDC_DATA_INTF_ID                    // Data Interface ID
        },

        // Com Class Endpoint (also uses EP0)

        {   // EP 2, In - Notifications
            sizeof(USB_ENDPOINT_DESCRIPTOR),    // Size of this descriptor in bytes
            USB_DESCRIPTOR_ENDPOINT,            // ENDPOINT descriptor type
            EP_DIR_IN|CDC_INT_EP_NUM,           // Enpoint Direction & Number
            EP_ATTR_INTR,                       // Endpoint used for interrupt transfers
            CDC_INT_EP_SIZE,                    // Size of EP buffer, in bytes
            2                                   // 2 ms polling period (see USB Spec)
        },

        // Data Class Interface

        {   // Data Interface Descriptor
            sizeof(USB_INTERFACE_DESCRIPTOR),   // Size of this descriptor in bytes
            USB_DESCRIPTOR_INTERFACE,           // INTERFACE descriptor type
            CDC_DATA_INTF_ID,                   // Interface Number
            0,                                  // Alternate Setting Number
            2,                                  // Number of endpoints in this intf
            DATA_INTF,                          // Class code
            0,                                  // Subclass code
            0,                                  // Protocol code
            0                                   // Interface string index (none)
        },
        {   // EP3, Out - Data Rx Endpoint
            sizeof(USB_ENDPOINT_DESCRIPTOR),    // Size of this descriptor in bytes
            USB_DESCRIPTOR_ENDPOINT,            // ENDPOINT descriptor type
            EP_DIR_OUT|CDC_BULK_EP_NUM,         // Enpoint Direction & Number
            EP_ATTR_BULK,                       // Type of transfers on this endpoint
            CDC_BULK_OUT_EP_SIZE,               // Max packet size
            0                                   // Polling period
        },
        {   // EP 3, In - Data Tx Endpoint
            sizeof(USB_ENDPOINT_DESCRIPTOR),    // Size of this descriptor in bytes
            USB_DESCRIPTOR_ENDPOINT,            // ENDPOINT descriptor type
            EP_DIR_IN|CDC_BULK_EP_NUM,          // Enpoint Direction & Number
            EP_ATTR_BULK,                       // Endpoint used for interrupt transfers
            CDC_BULK_IN_EP_SIZE,                // Max packet size
            0                                   // Polling period
        }
    },
    
    // String Descriptors

    {   // Language ID: English
        sizeof(USB_STRING_DESCRIPTOR)+sizeof(gDescTable.langid),
        USB_DESCRIPTOR_STRING
    },
    {LANG_1_ID},
    
    {   // Vendor Description
        sizeof(USB_STRING_DESCRIPTOR)+sizeof(gDescTable.string_1_data),
        USB_DESCRIPTOR_STRING
    },
    {'M','i','c','r','o','c','h','i','p',' ',
    'T','e','c','h','n','o','l','o','g','y',' ',
    'I','n','c','.'},
    
    {   // Device Description
        sizeof(USB_STRING_DESCRIPTOR)+sizeof(gDescTable.string_2_data),
        USB_DESCRIPTOR_STRING
    },
    {'C','D','C',' ','R','S','-','2','3','2',' ',
    'E','m','u','l','a','t','i','o','n',' ','D','e','m','o'},

    {   // Serial Number
        sizeof(USB_STRING_DESCRIPTOR)+sizeof(gDescTable.string_3_data),
        USB_DESCRIPTOR_STRING
    },
    {'0','0','0','0','0','0','0','0','0','0'}
};


/*******************************************************
 * USB_DEV_GET_DESCRIPTOR_FUNC Function Implementation *
 *******************************************************/

/* GetConfigurationDescriptor
 *************************************************************************
 * Returns a pointer to the requested configuration descriptor & provides
 * the total size of the configuration descriptor set.
 */

static inline const void *GetConfigurationDescriptor( BYTE config, unsigned int *length )
{
    switch (config)
    {
    case 0: // Configuration 1
        *length = sizeof(gDescTable.cdc_config_descs);
        return &gDescTable.cdc_config_descs;
   
    default:
        return NULL;
    }

} // GetConfigurationDescriptor


/* GetStringDescriptor
 *************************************************************************
 * Returns a pointer to the requested string descriptor and provides it's
 * size.
 */

//static inline const void *GetStringDescriptor( BYTE string, unsigned int *length )
static inline const void *GetStringDescriptor( PDESC_ID desc, unsigned int *length )
{
    // Check language ID
    if (desc->index > 0 && desc->lang_id != LANG_1_ID) {
        return NULL;
    }

    switch(desc->index)
    {
    case 0: // String 0
        *length = sizeof(gDescTable.string_0)+sizeof(gDescTable.langid);
        return &gDescTable.string_0;

    case 1: // String 1
        *length = sizeof(gDescTable.string_1)+sizeof(gDescTable.string_1_data);
        return &gDescTable.string_1;

    case 2: // String 2
        *length = sizeof(gDescTable.string_2)+sizeof(gDescTable.string_2_data);
        return &gDescTable.string_2;

    case 3: // String 3
        *length = sizeof(gDescTable.string_3)+sizeof(gDescTable.string_3_data);
        return &gDescTable.string_3;

    default:
        return NULL;
    }

} // GetStringDescriptor


/*************************************************************************
 * Function:        USBDEVGetDescriptor
 *
 * Precondition:    Assumes that the USB SW stack has been initialized.
 *
 * Input:           type    Type of USB Descriptor desired.
 *
 *                  index   Which descriptor of that type is desired.
 *
 * Output:          length  Length of the descriptor in bytes.
 *
 * Returns:         A pointer to the descriptor.
 *
 * Side Effects:    none
 *
 * Overview:        This function is a "call out" from the USB SW stack
 *                  that must be implemented by the application.  The 
 *                  USB device support will call it in response to 
 *                  GET_DESCRIPTOR setup requests in order to provide the
 *                  host with the desired descriptor data.
 *
 * Notes:           Must be implemented by application.  
 *
 *                  Define the USB_DEV_GET_DESCRIPTOR_FUNC macro in the
 *                  USB configuration file to the name of this routine.
 *************************************************************************/

//const void *USBDEVGetDescriptor ( BYTE type, BYTE index, unsigned int *length )
const void *USBDEVGetDescriptor ( PDESC_ID desc, unsigned int *length )
{
    switch (desc->type)
    {
    case USB_DESCRIPTOR_DEVICE:           // Device Descriptor
        *length = sizeof(gDescTable.dev_desc);
        return &gDescTable.dev_desc;

    case USB_DESCRIPTOR_CONFIGURATION:    // Configuration Descriptor
        return GetConfigurationDescriptor(desc->index, length);

    case USB_DESCRIPTOR_STRING:           // String Descriptor
        return GetStringDescriptor(desc, length);

    // Fail all un-supported descriptor requests:
    default:
        return NULL;
    }

} // USBDEVGetDescriptor


/********************************
 * Endpoint Configuration Table *
 ********************************
 *
 * This table defines all supported endpoint configurations for this 
 * application.  The configurations must match with the information 
 * provided to the host in the descriptors (defined above).
 */

const EP_CONFIG gEpConfigTable[] =
{
    //
    // Device Configuration 1 Endpoint Configurations:
    //

    // EP2 Com Class Notification Endpoint
    {
        CDC_INT_EP_SIZE,        // Maximum packet size for this endpoint
        USB_EP_TRANSMIT|        // Configuration flags for this endpoint (see below)
        USB_EP_HANDSHAKE,   
        CDC_CONFIG_NUM,         // Configuration number
        CDC_INT_EP_NUM,         // Endpoint number.
        0,                      // Interface number
        0,                      // Alternate interface setting (default=0)
        0                       // Index in device function table (see below)
    },

    // EP3 Data Class Endpoints
    {
        CDC_BULK_OUT_EP_SIZE,   // Maximum packet size for this endpoint
        USB_EP_RECEIVE |        // Configuration flags for this endpoint (see below)
        USB_EP_TRANSMIT|
        USB_EP_HANDSHAKE,   
        CDC_CONFIG_NUM,         // Configuration number (start at 1)
        CDC_BULK_EP_NUM,        // Endpoint number.
        1,                      // Interface number
        0,                      // Alternate interface setting (default=0)
        0                       // Index in device function table (see below)
    }
};


/************************************************************
 * USB_DEV_GET_EP_CONFIG_TABLE_FUNC Function Implementation *
 ************************************************************/

/*************************************************************************
 * Function:        USBDEVGetEpConfigurationTable
 *
 * Precondition:    none
 *
 * Input:           none
 *
 * Output:          num_entries     Number of entries in the endpoint 
 *                                  configuration table.
 *
 * Returns:         A pointer to the endpoint configuration table.
 *
 * Side Effects:    none
 *
 * Overview:        This function is a "call out" from the USB SW stack
 *                  that must be implemented by the application.  The 
 *                  USB device support will call it when it needs the
 *                  endpoint configuration table.
 *
 * Notes:           Must be implemented by application.
 *
 *                  Define the USB_DEV_GET_EP_CONFIG_TABLE_FUNC macro in 
 *                  the USB configuration file to the name of this routine.
 *************************************************************************/

inline const EP_CONFIG *USBDEVGetEpConfigurationTable ( int *num_entries )
{
    // Provide the number of entries
    *num_entries = sizeof(gEpConfigTable)/sizeof(EP_CONFIG);

    // Provide the table pointer.
    return gEpConfigTable;

} // USBDEVGetEpConfigurationTable


/******************************
 * USB Device Functions Table *
 ******************************
 *
 * This table provides information about the USB device functions that are
 * supported by this application.
 *
 * Note: This table cannot have more then 32 entries in it.
 */

const FUNC_DRV gDevFuncTable[] = 
{
    // USB CDC Serial Emulation Function Driver
    {
        USBUARTInit,                // Init routine
        USBUARTEventHandler,        // Event routine
        0                           // Init flags
    }
};


/*********************************************************
 * USB_DEV_GET_FUNCTION_DRIVER_TABLE_FUNC Implementation *
 *********************************************************/

/*************************************************************************
 * Function:        USBDEVGetFunctionDriverTable
 *
 * Precondition:    none
 *
 * Input:           none
 *
 * Output:          none
 *
 * Returns:         A pointer to the function driver table.
 *
 * Side Effects:    none
 *
 * Overview:        This function is a "call out" from the USB SW stack
 *                  that must be implemented by the application.  The 
 *                  USB device support will call it when it needs get 
 *                  the function driver table.
 *
 * Notes:           Must be implemented by application.
 *
 *                  Define the USB_DEV_GET_FUNCTION_DRIVER_TABLE_FUNC 
 *                  macro in the USB configuration file to the name of 
 *                  this routine.
 *************************************************************************/

inline const FUNC_DRV *USBDEVGetFunctionDriverTable ( void )
{
    // Index into array and provide interface pointer.
    return gDevFuncTable;

} // USBDEVGetFunctionDriverTable


/*************************************************************************
 * EOF
 */
