// Firmware framework for USB I/O on PIC 18F2455 (and siblings)
// Copyright (C) 2005 Alexander Enzmann
//
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License, or (at your option) any later version.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this library; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
//

#include <p32xxxx.h>
#include "hardware.h"
#include "picUSB.h"
#include "types.h"
#include "config.h"

// USB Descriptors
extern USB_Device_Descriptor device_descriptor;
extern USB_Configuration_Descriptor configuration_descriptor;

// String Descriptors
//extern const char *lang;
//extern const char *manu;
//extern const char *prod;
extern const char * const string_descriptor[];

// Device and configuration descriptors.  These are used as the
// host enumerates the device and discovers what class of device
// it is and what interfaces it supports.
// TODO: remove below lines and replace with the apropriate device_desc.blength etc.
extern void usb_configure_endpoints();
//extern void usb_ep_data_out_callback(char end_point, word buffer_addr, unsigned char byte_count);
extern void usb_ep_data_out_callback(char end_point);

// Global variables
byte deviceState;
byte selfPowered;
//byte remoteWakeup;
byte currentConfiguration;

byte deviceAddress;

// Control Transfer Stages - see USB spec chapter 5
#define SETUP_STAGE    0                // Start of a control transfer (followed by 0 or more data stages)
#define DATA_OUT_STAGE 1                // Data from host to device
#define DATA_IN_STAGE  2                // Data from device to host
#define STATUS_STAGE   3                // Unused - if data I/O went ok, then back to Setup

byte ctrlTransferStage;                 // Holds the current stage in a control transfer

byte requestHandled;                    // Set to 1 if request was understood and processed.

byte *outPtr;                           // Data to send to the host
byte *inPtr;                            // Data from the host
word wCount;                            // Number of bytes of data


/**
    Buffer descriptors Table (see datasheet page 171)
    A RAM Bank (2, 4 or 13 depending on MCU) is used specifically for
    endpoint buffer control in a structure known as
    Buffer Descriptor Table (BDTZ).
    TODO: find something smarter to allocate the buffer,
    like in usbmmap.c of the microchip firmware.
    If not all endpoints are used the space in RAM is wasted.
**/

volatile BufferDescriptorTable ep_bdt[32];

#pragma udata usbram5 SetupPacket controlTransferBuffer
volatile setupPacketStruct SetupPacket;
volatile byte controlTransferBuffer[EP0_BUFFER_SIZE];

volatile allcmd bootCmd;

//
// Start of code to process standard requests (USB chapter 9)
//

// Process GET_DESCRIPTOR
void BOOTZONE GetDescriptor()
{
    if(SetupPacket.bmRequestType == 0x80)
    {
        //byte descriptorType  = SetupPacket.wValue1;
        //byte descriptorIndex = SetupPacket.wValue0;

        if (SetupPacket.wValue1 == DEVICE_DESCRIPTOR)
        {
            requestHandled = 1;
            outPtr = (byte *)&device_descriptor;
            wCount = sizeof(USB_Device_Descriptor);
        }

        else if (SetupPacket.wValue1 == CONFIGURATION_DESCRIPTOR)
        {
            requestHandled = 1;
            outPtr = (byte *)&configuration_descriptor;
            wCount = configuration_descriptor.Header.wTotalLength;
        }

        else if (SetupPacket.wValue1 == STRING_DESCRIPTOR)
        {
            requestHandled = 1;
            outPtr = (byte *)&string_descriptor[SetupPacket.wValue0];
            //outPtr = string_descriptor[SetupPacket.wValue0];
            wCount = *outPtr;
        }

    /*
        else if (SetupPacket.wValue1 == DEVICE_QUALIFIER_DESCRIPTOR)
        {
            requestHandled = 1;
            // TODO: check if this is needed if not requestHandled is not set to 1 the device will
            // stall later when the linux kernel requests this descriptor
            //outPtr = (byte *)&configuration_descriptor;
            //wCount = sizeof();
        }
    */
    }
}

void BOOTZONE ProcessStandardRequest()
{
    //byte request = SetupPacket.bRequest;

    if ((SetupPacket.bmRequestType & 0x60) != 0x00)
    // Not a standard request - don't process here.  Class or Vendor
    // requests have to be handled seperately.
        return;

    if (SetupPacket.bRequest == SET_ADDRESS)
    {
        // Set the address of the device.  All future requests
        // will come to that address.  Can't actually set UADDR
        // to the new address yet because the rest of the SET_ADDRESS
        // transaction uses address 0.
        requestHandled = 1;
        deviceState = ADDRESS;
        deviceAddress = SetupPacket.wValue0;
    }

    else if (SetupPacket.bRequest == GET_DESCRIPTOR)
    {
        GetDescriptor();
    }

    else if (SetupPacket.bRequest == SET_CONFIGURATION)
    {
        requestHandled = 1;
        usb_configure_endpoints();
        currentConfiguration = SetupPacket.wValue0;
        // TBD: ensure the new configuration value is one that
        // exists in the descriptor.
        if (currentConfiguration == 0)
            // If configuration value is zero, device is put in
            // address state (USB 2.0 - 9.4.7)
            deviceState = ADDRESS;
        else
            // Set the configuration.
            deviceState = CONFIGURED;

        // Initialize the endpoints for all interfaces
        // TBD: Add initialization code here for any additional
        // interfaces beyond the one used for the HID
    }

    else if (SetupPacket.bRequest == GET_CONFIGURATION)
    {
        requestHandled = 1;
        outPtr = (byte*)&currentConfiguration;
        wCount = 1;
    }

    /*
    else if (SetupPacket.bRequest == GET_STATUS)
    {
    //    GetStatus();
    }

    else if ((SetupPacket.bRequest == CLEAR_FEATURE) || (request == SET_FEATURE))
    {
    //    SetFeature();
    }
    */

    else if (SetupPacket.bRequest == GET_INTERFACE)
    {
        // No support for alternate interfaces.  Send
        // zero back to the host.
        requestHandled = 1;
        controlTransferBuffer[0] = 0;
        outPtr = (byte *)&controlTransferBuffer;
        wCount = 1;
    }

    else if (SetupPacket.bRequest == SET_INTERFACE)
    {
        // No support for alternate interfaces - just ignore.
        requestHandled = 1;
    }

    /*
    else if (SetupPacket.bRequest == SET_DESCRIPTOR) {
    }
    else if (SetupPacket.bRequest == SYNCH_FRAME) {
    }
    else {
    }
    */
}


  /**
   Data stage for a Control Transfer that sends data to the host
  **/

void BOOTZONE InDataStage(unsigned char ep)
{
    byte i;
    word bufferSize;

    // Determine how many bytes are going to the host
    if(wCount < EP0_BUFFER_SIZE)
        bufferSize = wCount;
    else
        bufferSize = EP0_BUFFER_SIZE;

    // Load the high two bits of the byte count into BC8:BC9
    // Clear BC8 and BC9
    EP_IN_BD(ep).Stat.uc &= ~(BDS_BC8 | BDS_BC9);
    EP_IN_BD(ep).Stat.uc |= (byte)((bufferSize & 0x0300) >> 8);
    EP_IN_BD(ep).Cnt = (byte)(bufferSize & 0xFF);
    EP_IN_BD(ep).ADDR = ConvertToPhysicalAddress(&controlTransferBuffer);

    // Update the number of bytes that still need to be sent.  Getting
    // all the data back to the host can take multiple transactions, so
    // we need to track how far along we are.
    wCount = wCount - bufferSize;

    // Move data to the USB output buffer from wherever it sits now.
    inPtr = (byte *)&controlTransferBuffer;

    for (i=0;i<bufferSize;i++)
        *inPtr++ = *outPtr++;
}

  /**
   Data stage for a Control Transfer that reads data from the host
  **/

void BOOTZONE OutDataStage(unsigned char ep)
{
    word i, bufferSize;

    bufferSize = ((0x03 & EP_OUT_BD(ep).Stat.uc) << 8) | EP_OUT_BD(ep).Cnt;

    // Accumulate total number of bytes read
    wCount = wCount + bufferSize;

    outPtr = (byte*)&controlTransferBuffer;

    for (i=0;i<bufferSize;i++)
        *inPtr++ = *outPtr++;
}

  /**
    Process the Setup stage of a control transfer.  This code initializes the
    flags that let the firmware know what to do during subsequent stages of
    the transfer.
    TODO:
    Only Ep0 is handled here.
  **/

void BOOTZONE SetupStage()
{
    // Note: Microchip says to turn off the UOWN bit on the IN direction as
    // soon as possible after detecting that a SETUP has been received.
    EP_IN_BD(0).Stat.uc &= ~BDS_UOWN;
    EP_OUT_BD(0).Stat.uc &= ~BDS_UOWN;

    // Initialize the transfer process
    ctrlTransferStage = SETUP_STAGE;
    requestHandled = 0;                   // Default is that request hasn't been handled
    wCount = 0;                           // No bytes transferred

    // See if this is a standard (as definded in USB chapter 9) request
    ProcessStandardRequest();

    // TBD: Add handlers for any other classes/interfaces in the device
    if (!requestHandled)
    {
        // If this service wasn't handled then stall endpoint 0
        EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
        EP_OUT_BD(0).ADDR = ConvertToPhysicalAddress(&SetupPacket);
        EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
        EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_BSTALL;
    }

    else if (SetupPacket.bmRequestType & 0x80)
    {
        // Device-to-host
        if(SetupPacket.wLength < wCount)
            wCount = SetupPacket.wLength;

        InDataStage(0);
        ctrlTransferStage = DATA_IN_STAGE;
        // Reset the out buffer descriptor for endpoint 0
        EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
        EP_OUT_BD(0).ADDR = ConvertToPhysicalAddress(&SetupPacket);
        EP_OUT_BD(0).Stat.uc = BDS_UOWN;

        // Set the in buffer descriptor on endpoint 0 to send data
        EP_IN_BD(0).ADDR = ConvertToPhysicalAddress(&controlTransferBuffer);
        // Give to SIE, DATA1 packet, enable data toggle checks
        EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
    }

    else
    {
        // Host-to-device
        ctrlTransferStage = DATA_OUT_STAGE;

        // Clear the input buffer descriptor
        EP_IN_BD(0).Cnt = 0;
        EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;

        // Set the out buffer descriptor on endpoint 0 to receive data
        EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
        EP_OUT_BD(0).ADDR = ConvertToPhysicalAddress(&controlTransferBuffer);
        // Give to SIE, DATA1 packet, enable data toggle checks
        EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
    }

    // Enable SIE token and packet processing
    U1CONbits.PKTDIS = 0;
}


  // Configures the buffer descriptor for endpoint 0 so that it is waiting for
  // the status stage of a control transfer.
void BOOTZONE WaitForSetupStage()
{
    ctrlTransferStage = SETUP_STAGE;
    EP_OUT_BD(0).Cnt = EP0_BUFFER_SIZE;
    EP_OUT_BD(0).ADDR = ConvertToPhysicalAddress(&SetupPacket);
    // Give to SIE, enable data toggle checks
    EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
    EP_IN_BD(0).Stat.uc = 0x00;           // Give control to CPU
}

// This is the starting point for processing a Control Transfer.  The code directly
// follows the sequence of transactions described in the USB spec chapter 5.  The
// only Control Pipe in this firmware is the Default Control Pipe (endpoint 0).
// Control messages that have a different destination will be discarded.
void BOOTZONE ProcessControlTransfer()
{
    // get encoded number of the last active Endpoint
    byte PID, end_point = U1STAT >> 3;

    if (end_point == 0) // Endpoint 0
    {

        if (U1STATbits.DIR == OUT)
        {
            // Endpoint 0:out
            // Pull PID from middle of BD0STAT
            PID = (EP_OUT_BD(0).Stat.uc & 0x3C) >> 2;
            if (PID == 0x0D)
                // SETUP PID - a transaction is starting
                SetupStage();

            else if (ctrlTransferStage == DATA_OUT_STAGE)
            {
                // Complete the data stage so that all information has
                // passed from host to device before servicing it.
                OutDataStage(0);

                // Turn control over to the SIE and toggle the data bit
                if(EP_OUT_BD(0).Stat.DTS)
                    EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
                else
                    EP_OUT_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
            }

            else
            {
                // Prepare for the Setup stage of a control transfer
                WaitForSetupStage();
            }
        }

        else // if(USTATbits.DIR == IN)
        {
            // Endpoint 0:in
            if ((U1ADDR == 0) && (deviceState == ADDRESS))
            {
                // TBD: ensure that the new address matches the value of
                // "deviceAddress" (which came in through a SET_ADDRESS).
                U1ADDR = SetupPacket.wValue0;
                if (U1ADDR == 0)
                    // If we get a reset after a SET_ADDRESS, then we need
                    // to drop back to the Default state.
                    deviceState = DEFAULT;
            }

            if (ctrlTransferStage == DATA_IN_STAGE)
            {
                // Start (or continue) transmitting data
                InDataStage(0);

                // Turn control over to the SIE and toggle the data bit
                if(EP_IN_BD(0).Stat.DTS)
                    EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTSEN;
                else
                    EP_IN_BD(0).Stat.uc = BDS_UOWN | BDS_DTS | BDS_DTSEN;
            }

            else
            {
                // Prepare for the Setup stage of a control transfer
                WaitForSetupStage();
            }

        }
    }

    else //if (end_point == 1) // EndPoint 1
    {

        if (!U1STATbits.DIR) // If OUT
            usb_ep_data_out_callback(end_point);
    }
}

void BOOTZONE EnableUSBModule()
{
    U1PWRCbits.USBPWR = 1;
    if(U1CONbits.USBEN == 0)
    {
        U1CON = 0x0000;               // USB Control Register
        U1IE = 0x0000;                // Disable USB Interrupt Register
        U1CONbits.USBEN = 1;     // Enable USB module
        deviceState = ATTACHED;
    }
    // If we are attached and no single-ended zero is detected, then
    // we can move to the Powered state.
    if ((deviceState == ATTACHED) && !U1CONbits.SE0)
    {
        U1IR = 0x0000;              // Clear all USB interrupts
        U1IE = 0x0000;                // Disable USB Interrupt Register
        U1IEbits.URSTIE = 1;     // Enable USB Reset Interrupt
        U1IEbits.IDLEIE = 1;     // Enable IDle Detect USB Interrupt
        deviceState = POWERED;
    }
}

// Main entry point for USB tasks.
// Checks interrupts, then checks for transactions.
void BOOTZONE ProcessUSBTransactions()
{
    word led_counter = 0;

    // See if the device is connected yet.
    if(deviceState == DETACHED)
        return;

    // If the USB became active then wake up from suspend
    //if(UIRbits.ACTVIF && UIEbits.ACTVIE)
    if (U1OTGIRbits.ACTVIF && U1OTGIEbits.ACTVIE)
    {
        // UnSuspend
        //U1CONbits.SUSPND = 0;
        U1PWRCbits.USUSPEND = 0;
        //UIEbits.ACTVIE = 0;
        //UIRbits.ACTVIF = 0;
        U1OTGIEbits.ACTVIE = 0;
        U1OTGIRbits.ACTVIF = 0;
    }

    // If we are supposed to be suspended, then don't try performing any processing.
    //if(UCONbits.SUSPND == 1)
    if (U1PWRCbits.USUSPEND)
        return;

    // Process a bus reset
    if (U1IRbits.URSTIF && U1IEbits.URSTIE)
    {
        U1EIR  = 0x0000;
        U1IR   = 0x0000;
        //U1EIE  = 0x9F; // PIC18F  All Error Int. Enabled
        U1EIE  = 0x00FF; // PIC32MX All Error Int. Enabled
        //UIE    = 0x7B; // PIC18F  ACTVIE = 0
        U1IE   = 0x00BF; // PIC32MX ATTACHIE = 0
        U1ADDR = 0x0000;

        // Set endpoint 0 as a control pipe
        U1EP0 = EP_CTRL | HSHK_EN;

        // Flush any pending transactions
        while (U1IRbits.TRNIF == 1)
            U1IRbits.TRNIF = 0;

        // Enable packet processing
        U1CONbits.PKTDIS = 0;

        // Prepare for the Setup stage of a control transfer
        WaitForSetupStage();

        //	remoteWakeup = 0;                 // Remote wakeup is off by default
        selfPowered = 0;                      // Self powered is off by default
        currentConfiguration = 0;             // Clear active configuration
        deviceState = DEFAULT;
    }

/*
    if (UIRbits.IDLEIF && UIEbits.IDLEIE)
    {
        // No bus activity for a while - suspend the firmware
        Suspend();
    }

    if (UIRbits.SOFIF && UIEbits.SOFIE)
    {
        StartOfFrame();
    }
    
    if (UIRbits.STALLIF && UIEbits.STALLIE)
    {
        Stall();
    }
*/

    // TBD: See where the error came from.
    if (U1IRbits.UERRIF && U1IEbits.UERRIE)
        U1IRbits.UERRIF = 0;// Clear errors

    // Unless we have been reset by the host, no need to keep processing
    if (deviceState < DEFAULT)  // DETACHED, ATTACHED or POWERED
{
        while(1)
        {
            // strobing LED
            if (led_counter == 0)
                LED_PORT_INV = LED_MASK;
            led_counter++;
        }
        return;
}

    // A transaction has finished.  Try default processing on endpoint 0.
    if(U1IRbits.TRNIF && U1IEbits.TRNIE)
    {
        ProcessControlTransfer();
        // Turn off interrupt
        U1IRbits.TRNIF = 0;
    }
}
