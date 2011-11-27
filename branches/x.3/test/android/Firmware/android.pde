/*******************************************************************************

    USB Android Accessory basic demo with accessory in host mode

*******************************************************************************/

// Include files
#include "USB/usb.h"
#include "USB/usb_host_android.h"
#include "Compiler.h"
#include "HardwareProfile.h"

// If a maximum current rating hasn't been defined, then define 500mA by default
#ifndef MAX_ALLOWED_CURRENT
    #define MAX_ALLOWED_CURRENT             (500)         // Maximum power we can supply in mA
#endif

//Definitions of the various application commnands that can be sent
typedef enum _ACCESSORY_DEMO_COMMANDS
{
    COMMAND_SET_LEDS            = 0x01,
    COMMAND_UPDATE_PUSHBUTTONS  = 0x02,
    COMMAND_UPDATE_POT          = 0x03
} ACCESSORY_DEMO_COMMANDS;

//Creation of the data packet that is going to be sent.  In this example
//  there is just a command code and a one byte data.
typedef struct __attribute__((packed))
{
    BYTE command;
    BYTE data;
} ACCESSORY_APP_PACKET;

static void InitPIC32(void);

static void SetLEDs(BYTE setting);
static BYTE GetPushbuttons(void);
static BYTE ReadPOT(void);

//local variables
static BYTE read_buffer[64];
static ACCESSORY_APP_PACKET outgoing_packet;
static void* device_handle = NULL;
static BOOL device_attached = FALSE;

static char manufacturer[] = "Microchip Technology Inc.";
static char model[] = "Basic Accessory Demo";
static char description[] = DEMO_BOARD_NAME_STRING;
static char version[] = "1.0";
static char uri[] = "http://www.microchip.com/android";
static char serial[] = "N/A";

ANDROID_ACCESSORY_INFORMATION myDeviceInfo =
{
    manufacturer,
    sizeof(manufacturer),
    model,
    sizeof(model),
    description,
    sizeof(description),
    version,
    sizeof(version),
    uri,
    sizeof(uri),
    serial,
    sizeof(serial)
};

void setup(void)
{
    DWORD size;
    BOOL responseNeeded;
    BYTE pushButtonValues = 0xFF;
    BYTE potPercentage = 0xFF;
    BOOL buttonsNeedUpdate = FALSE;
    BOOL potNeedsUpdate = FALSE;
    BOOL readInProgress = FALSE;
    BOOL writeInProgress = FALSE;
    BYTE tempValue = 0xFF;
    BYTE errorCode;

    InitPIC32();

    USBInitialize(0);
    AndroidAppStart(&myDeviceInfo);

    responseNeeded = FALSE;
    mInitPOT();
}

void loop(void)
{
        //Keep the USB stack running
        USBTasks();

        //If the device isn't attached yet,
        if(device_attached == FALSE)
        {
            buttonsNeedUpdate = TRUE;
            potNeedsUpdate = TRUE;

            //Reset the accessory state variables
            InitAllLEDs();

            //Continue to the top of the while loop to start the check over again.
            continue;
        }

        //If the accessory is ready, then this is where we run all of the demo code

        if(readInProgress == FALSE)
        {
            errorCode = AndroidAppRead(device_handle, (BYTE*)&read_buffer, (DWORD)sizeof(read_buffer));
            //If the device is attached, then lets wait for a command from the application
            if( errorCode != USB_SUCCESS)
            {
                //Error
                DEBUG_ERROR("Error trying to start read");
            }
            else
            {
                readInProgress = TRUE;
            }
        }

        if(AndroidAppIsReadComplete(device_handle, &errorCode, &size) == TRUE)
        {
            readInProgress = FALSE;

            //We've received a command over the USB from the Android device.
            if(errorCode == USB_SUCCESS)
            {
                //Maybe process the data here.  Maybe process it somewhere else.
                ACCESSORY_APP_PACKET* command_packet = (ACCESSORY_APP_PACKET*)&read_buffer[0];

                while(size > 0)
                {
                    switch(command_packet->command)
                    {
                        case COMMAND_SET_LEDS:
                            SetLEDs(command_packet->data);
                            //This command is two bytes, so remove that from the queue
                            size -= 2;
                            //And move the pointer to the next packet (this works because
                            //  all command packets are 2 bytes.  If variable packet size
                            //  then need to handle moving the pointer by the size of the
                            //  command type that arrived.
                            command_packet++;
                            break;
                        default:
                            //Error, unknown command
                            DEBUG_ERROR("Error: unknown command received");
                            break;
                    }
                }
            }
            else
            {
                //Error
                DEBUG_ERROR("Error trying to complete read request");
            }

        }

        //Get the current pushbutton settings
        tempValue = GetPushbuttons();

        //If the current button settings are different than the last time
        //  we read the button values, then we need to send an update to the
        //  attached Android device
        if(tempValue != pushButtonValues)
        {
            buttonsNeedUpdate = TRUE;
            pushButtonValues = tempValue;
        }

        //Get the current potentiometer setting
        tempValue = ReadPOT();

        //If it is different than the last time we read the pot, then we need
        //  to send it to the Android device
        if(tempValue != potPercentage)
        {
            potNeedsUpdate = TRUE;
            potPercentage = tempValue;
        }
    
        //If there is a write already in progress, we need to check its status
        if( writeInProgress == TRUE ) 
        {
            if(AndroidAppIsWriteComplete(device_handle, &errorCode, &size) == TRUE)
            {
                writeInProgress = FALSE;

                if(errorCode != USB_SUCCESS)
                {
                    //Error
                    DEBUG_ERROR("Error trying to complete write");
                }
            }       
        }

        //If we need up update the button status on the Android device and we aren't
        //  already busy in a write, then we can send the new button data.
        if((buttonsNeedUpdate == TRUE) && (writeInProgress == FALSE))
        {
            outgoing_packet.command = COMMAND_UPDATE_PUSHBUTTONS;
            outgoing_packet.data = pushButtonValues;

            errorCode = AndroidAppWrite(device_handle,(BYTE*)&outgoing_packet, 2);
            if( errorCode != USB_SUCCESS )
            {
                DEBUG_ERROR("Error trying to send button update");
            }

            buttonsNeedUpdate = FALSE;
            writeInProgress = TRUE;
        }

        //If we need up update the pot status on the Android device and we aren't
        //  already busy in a write, then we can send the new pot data.
        if((potNeedsUpdate == TRUE) && (writeInProgress == FALSE))
        {
            outgoing_packet.command = COMMAND_UPDATE_POT;
            outgoing_packet.data = potPercentage;

            errorCode = AndroidAppWrite(device_handle,(BYTE*)&outgoing_packet, 2);
            if( errorCode != USB_SUCCESS )
            {
                DEBUG_ERROR("Error trying to send pot update");
            }

            potNeedsUpdate = FALSE;
            writeInProgress = TRUE;
        } 
}


/****************************************************************************
  Function:
    BOOL USB_ApplicationDataEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )

  Summary:
    Handles USB data application events

  Description:
    Handles USB data application events

  Precondition:
    None

  Parameters:
    BYTE address - address of the device causing the event
    USB_EVENT event - the event that has occurred
    void* data - data associated with the event
    DWORD size - the size of the data in the data field

  Return Values:
    BOOL - Return TRUE of the event was processed.  Return FALSE if the event
           wasn't handled.

  Remarks:
    None
  ***************************************************************************/
BOOL USB_ApplicationDataEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )
{
    return FALSE;
}


/****************************************************************************
  Function:
    BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )

  Summary:
    Handles USB application events

  Description:
    Handles USB application events

  Precondition:
    None

  Parameters:
    BYTE address - address of the device causing the event
    USB_EVENT event - the event that has occurred
    void* data - data associated with the event
    DWORD size - the size of the data in the data field

  Return Values:
    BOOL - Return TRUE of the event was processed.  Return FALSE if the event
           wasn't handled.

  Remarks:
    None
  ***************************************************************************/
BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )
{
    switch( event )
    {
        case EVENT_VBUS_REQUEST_POWER:
            // The data pointer points to a byte that represents the amount of power
            // requested in mA, divided by two.  If the device wants too much power,
            // we reject it.
            if (((USB_VBUS_POWER_EVENT_DATA*)data)->current <= (MAX_ALLOWED_CURRENT / 2))
            {
                return TRUE;
            }
            else
            {
                DEBUG_ERROR( "\r\n***** USB Error - device requires too much current *****\r\n" );
            }
            break;

        case EVENT_VBUS_RELEASE_POWER:
        case EVENT_HUB_ATTACH:
        case EVENT_UNSUPPORTED_DEVICE:
        case EVENT_CANNOT_ENUMERATE:
        case EVENT_CLIENT_INIT_ERROR:
        case EVENT_OUT_OF_MEMORY:
        case EVENT_UNSPECIFIED_ERROR:   // This should never be generated.
        case EVENT_DETACH:              // USB cable has been detached (data: BYTE, address of device)
        case EVENT_ANDROID_DETACH:
            device_attached = FALSE;
            return TRUE;
            break;

        // Android Specific events
        case EVENT_ANDROID_ATTACH:
            device_attached = TRUE;
            device_handle = data;
            return TRUE;

        default :
            break;
    }
    return FALSE;
}

/****************************************************************************
  Function:
    void SetLEDs(BYTE setting)

  Summary:
    change the LED settings of the boards

  Description:
    change the LED settings of the boards

  Precondition:
    None

  Parameters:
    BYTE setting - bitmap for desired LED setting (1 = On, 0 = Off)
        bit 0 = LED 0
        bit 1 = LED 1
        bit 2 = LED 2
        ...
        bit 7 = LED 7

  Return Values:
    None

  Remarks:
    None
  ***************************************************************************/
static void SetLEDs(BYTE setting)
{
    if((setting & 0x01) == 0x01) { LED0_On(); } else { LED0_Off(); }
    if((setting & 0x02) == 0x02) { LED1_On(); } else { LED1_Off(); }
    if((setting & 0x04) == 0x04) { LED2_On(); } else { LED2_Off(); }
    if((setting & 0x08) == 0x08) { LED3_On(); } else { LED3_Off(); }
    if((setting & 0x10) == 0x10) { LED4_On(); } else { LED4_Off(); }
    if((setting & 0x20) == 0x20) { LED5_On(); } else { LED5_Off(); }
    if((setting & 0x40) == 0x40) { LED6_On(); } else { LED6_Off(); }
    if((setting & 0x80) == 0x80) { LED7_On(); } else { LED7_Off(); }
}

/****************************************************************************
  Function:
    BYTE GetPushbuttons(void)

  Summary:
    Reads the current push button status.

  Description:
    Reads the current push button status.

  Precondition:
    None

  Parameters:
    None

  Return Values:
    BYTE - bitmap for button representations (1 = pressed, 0 = not pressed)
        bit 0 = button 1
        bit 1 = button 2
        bit 2 = button 3
        bit 3 = button 4

  Remarks:
    None
  ***************************************************************************/

static BYTE GetPushbuttons(void)
{
    BYTE toReturn;
    
    InitAllSwitches();    

    toReturn = 0;

    if(Switch1Pressed()){toReturn |= 0x1;}
    if(Switch2Pressed()){toReturn |= 0x2;}
    if(Switch3Pressed()){toReturn |= 0x4;}
    if(Switch4Pressed()){toReturn |= 0x8;}
    
    return toReturn;
}

/****************************************************************************
  Function:
    BYTE ReadPOT(void)

  Summary:
    Reads the pot value and returns the percentage of full scale (0-100)

  Description:
    Reads the pot value and returns the percentage of full scale (0-100)

  Precondition:
    A/D is initialized properly

  Parameters:
    None

  Return Values:
    None

  Remarks:
    None
  ***************************************************************************/

static BYTE ReadPOT(void)
{
    DWORD temp;
    temp = 50;

    return (BYTE)temp;
}

