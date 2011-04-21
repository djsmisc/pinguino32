








typedef enum _app_state
{
    BUFFER_EMPTY = 0,       // Buffer is empty & available to receive data.
    RECEIVING_DATA,         // App is waiting to receive data from USB.
    DATA_AVAILABLE,         // Data has been received, app can act on the data.
    SENDING_DATA            // App is waiting for data to finish sending on USB.

} APP_STATE;

//
#define BUFFER_SIZE 64
BYTE      gBuffer[BUFFER_SIZE];
BYTE      gSize;                    // Uninitialized data, cleared to zero.
APP_STATE gState;                   // Uninitialized data, cleared to zero.

//
char gCommand[8];

//
const char gTestStr[] = "Hello from the Microchip USB CDC Serial Demo!\r";

//
CDC_NOTIFICATION gNotification = CDC_INIT_NOTIFICATION(RESPONSE_AVAILABLE,0,CDC_COMM_INTF_ID,0);

//
const char *gRespStr = "\r\nOK\r\n";


/*************************************************************************
 * Function:        CdcDemoEventHandler
 *
 * Preconditions:   1. The system must have been built with the CDC Serial
 *                     Emulation function driver.
 *
 *                  2. This routine must be linked as the CDC Serial 
 *                     function driver's application event handler.
 *
 *                  3. USBInitialize must have been called to initialize 
 *                     the USB SW Stack.
 *
 *                  4. The host must have configured the system as a USB
 *                     CDC Serial Emulation Device. 
 *                  
 * Input:           event       Identifies the bus event that occured
 *
 *                  data        Pointer to event-specific data
 *
 *                  size        Size of the event-specific data
 *
 * Output:          none
 *
 * Returns:         TRUE if the event was handled, FALSE if not
 *
 * Side Effects:    Event-specific actions have been taken.
 *
 * Overview:        This routine is called by the CDC Serial Emulation 
 *                  function driver to notify the application of events 
 *                  that occur on the USB.  If the event is recognized,
 *                  it is handled and the routine returns TRUE.  Otherwise,
 *                  it is ignored and the routine returns FALSE.
 *************************************************************************/

PUBLIC BOOL CdcDemoEventHandler ( USB_EVENT event, void *data, int size )
{
    UINT16      cmd_size;
    LINE_CODING line_coding;


//
    switch ((UINT)event)
    {
//
    case EVENT_CDC_LINE_CTRL:

//
//
//
//
        return USBUSARTGetLineCoding (&line_coding);


//
    case EVENT_CDC_CMD:

//
        if (size == sizeof(UINT16) && data != NULL)
        {
            cmd_size = (UINT16)min(sizeof(gCommand), size);
            return USBUSARTGetCmdStr (gCommand, cmd_size);
        }
        break;


    } // switch (event)


//
    return FALSE;

} // CdcDemoEventHandler

void setup()
{
	USBInitialize(0);		// Initialize the USB stack
}

void loop()
{
//
	USBTasks();

//
	switch (gState)
	{
		case BUFFER_EMPTY:      // Buffer is empty & available to receive data.
//

//
			if (USBUSARTRxIsReady())
			{
				gState = RECEIVING_DATA;
				USBUSARTRx(gBuffer, BUFFER_SIZE);
			}
			break;

		case RECEIVING_DATA:    // App is waiting to receive data from USB.

//
			if ( (gSize = USBUSARTRxGetLength()) > 0 ) 
			{
				gState = DATA_AVAILABLE;
//
			}
			else
			{
				break;
			}

		case DATA_AVAILABLE:    // Data has been received, app can act on the data.

//
			if (USBUSARTTxIsReady())
			{
				gState = SENDING_DATA;
				USBUSARTTx(gBuffer, gSize);
			}
			break;

		case SENDING_DATA:      // App is waiting for data to finish sending on USB.

//
			if (USBUSARTTxIsReady())
			{
				gSize  = 0;
				gState = BUFFER_EMPTY;
			}
			break;

		default:

			while(1);           // Invalid state, hang the application.
	}

	if(USBUSARTTxIsReady())
	{
		USBUSARTPuts(gTestStr);
	}
}


