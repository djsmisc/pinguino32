/*******************************************************************************

    USB Header File

Summary:
    This file aggregates all necessary header files for the Microchip USB Host &
    Device libraries.  It provides a single-file that can be included in
    application code.  The USB libraries simplify the implementation of USB
    applications by providing an abstraction of the USB module, its registers
    and bits such that the source code for the application can be the same 
    across various hardware platforms.

Description:
    This file aggregates all necessary header files for the Microchip USB Host &
    Device libraries.  It provides a single-file that can be included in
    application code.  The USB libraries simplify the implementation of USB
    applications by providing an abstraction of the USB module, its registers
    and bits such that the source code for the application can be the same 
    across various hardware platforms.

    Note that this file does not include the header files for any client or
    function drivers.

******************************************************************************/
//DOM-IGNORE-BEGIN
 /*********************************************************************
 * The following lines are used by VDI.
 * GUID=E537A0C0-6FEE-4afd-89B9-0C35BF72A80B
 * GUIInterfaceVersion=1.00
 * LibraryVersion=2.1
 *********************************************************************/
/******************************************************************************
 FileName:     usb.h
 Dependencies: See INCLUDES section
 Processor:    PIC18, PIC24, & PIC32 USB Microcontrollers
 Hardware:
 Complier:     Microchip C18 (for PIC18), C30 (for PIC24), or C32 (for PIC32)
 Company:      Microchip Technology, Inc.

 Software License Agreement:

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

********************************************************************

 Change History:
 Date         Description
 02/20/2008   Initial version
********************************************************************/
//DOM-IGNORE-END

//DOM-IGNORE-BEGIN
#ifndef _USB_H_
#define _USB_H_
//DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: All necessary USB Library headers
// *****************************************************************************
// *****************************************************************************

#include "usb/usb_common.h"         // Common USB library definitions
#include "usb_config.h"             // Must be defined by the application
#include "usb/usb_ch9.h"            // USB device framework definitions
#include "usb/usb_hal.h"            // Hardware Abstraction Layer interface

#if defined( USB_SUPPORT_DEVICE )
    #include "usb/usb_device.h"     // USB Device abstraction layer interface
#endif

#if defined( USB_SUPPORT_HOST )
    #include "usb/usb_host.h"       // USB Host abstraction layer interface
#endif

#if defined ( USB_SUPORT_OTG )
    #error "USB OTG is not supported."
#endif


// *****************************************************************************
// *****************************************************************************
// Section: Host Firmware Version
// *****************************************************************************
// *****************************************************************************

#define USB_MAJOR_VER   1       // Firmware version, major release number.
#define USB_MINOR_VER   0       // Firmware version, minor release number.
#define USB_DOT_VER     0       // Firmware version, dot release number.


// *****************************************************************************
// *****************************************************************************
// Section: USB Application Program Interface (API) Routines
// *****************************************************************************
// *****************************************************************************

/****************************************************************************
    Function:
        BOOL USBInitialize ( unsigned long flags )

    Summary:
        This interface initializes the variables of the USB host stack.

    Description:
        This interface initializes the USB stack.

    Precondition:
        None

    Parameters:
        flags - reserved

    Return Values:
        TRUE  - Initialization successful
        FALSE - Initialization failure

    Remarks:
        This interface is implemented as a macro that can be defined by the
        application or by default is defined correctly for the stack mode.
        
  ***************************************************************************/

#ifndef USBInitialize   // Implemented as a macro that can be overridden.
    #if defined( USB_SUPPORT_DEVICE )
        #if defined( USB_SUPPORT_HOST )
            #if defined( USB_SUPPORT_OTG )
                // True USB OTG Device
                #error "USB OTG is not yet supported."
            #else
                // USB Dual Role, Non-OTG Device
                #define USBInitialize(f) \
                        (USBDEVInitialize(f) && USBHostInit(f)) ? \
                        TRUE : FALSE
            #endif
        #else
            // USB Device Only
            #define USBInitialize(f) USBDEVInitialize(f)
        #endif
    #else
        #if defined( USB_SUPPORT_HOST )
            // USB Host Only
            #define USBInitialize(f) USBHostInit(f)
        #else
            #error "Application must define support mode in usb_config.h"
        #endif
    #endif
#endif


/****************************************************************************
    Function:
        void USBTasks( void )

    Summary:
        This function executes the tasks for USB operation.

    Description:
        This function executes the tasks for USB host operation.  It must be
        executed on a regular basis to keep everything functioning.

    Precondition:
        USBInitialize() has been called.

    Parameters:
        None

    Returns:
        None

    Remarks:
        This interface is implemented as a macro that can be defined by the
        application or by default is defined correctly for the stack mode.
        
  ***************************************************************************/

#ifndef USBTasks    // Implemented as a macro that can be overridden.
    #if defined( USB_SUPPORT_DEVICE )
        #if defined( USB_SUPPORT_HOST )
            #if defined( USB_SUPPORT_OTG )
                // True USB OTG Device
                #error "USB OTG is not yet supported."
            #else
                // USB Dual Role, Non-OTG Device
                #error "USB Dual-Role Non-OTG not yet supported"
            #endif
        #else
            // USB Device Only
            #if defined(USB_DEV_INTERRUPT_DRIVEN)
                #define USBTasks()
            #else
                #define USBTasks() USBHALHandleBusEvent()
            #endif
        #endif
    #else
        #if defined( USB_SUPPORT_HOST )
            // USB Host Only
            #define USBTasks() USBHostTasks()
        #else
            #error "Application must define support mode in usb_config.h"
        #endif
    #endif
#endif


#endif // _USB_H_
/*************************************************************************
 * EOF
 */

