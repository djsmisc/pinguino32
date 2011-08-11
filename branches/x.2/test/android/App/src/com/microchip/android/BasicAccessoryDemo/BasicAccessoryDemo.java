/********************************************************************
 Software License Agreement:

 The software supplied herewith by Microchip Technology Incorporated
 (the "Company") for its PIC(R) Microcontroller is intended and
 supplied to you, the Company’s customer, for use solely and
 exclusively on Microchip PIC Microcontroller products. The
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
********************************************************************/

package com.microchip.android.BasicAccessoryDemo;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

public class BasicAccessoryDemo extends Activity{
	private final static int USBAccessoryWhat = 0;

	public static final int UPDATE_LED_SETTING		 	= 1;
	public static final int PUSHBUTTON_STATUS_CHANGE	= 2;
	public static final int POT_STATUS_CHANGE			= 3;
	
	public static final int LED_0_ON					= 0x01;
	public static final int LED_1_ON					= 0x02;
	public static final int LED_2_ON					= 0x04;
	public static final int LED_3_ON					= 0x08;
	public static final int LED_4_ON					= 0x10;
	public static final int LED_5_ON					= 0x20;
	public static final int LED_6_ON					= 0x40;
	public static final int LED_7_ON					= 0x80;
	
	public static final int BUTTON_1_PRESSED			= 0x01;
	public static final int BUTTON_2_PRESSED			= 0x02;
	public static final int BUTTON_3_PRESSED			= 0x04;
	public static final int BUTTON_4_PRESSED			= 0x08;
	
	public static final int POT_UPPER_LIMIT				= 100;
	public static final int POT_LOWER_LIMIT				= 0;
	
	private USBAccessoryManager accessoryManager; 
	
	/** Called when the activity is first created. */
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        setContentView(R.layout.main);
        
       	accessoryManager = new USBAccessoryManager(handler, USBAccessoryWhat);
        
        try {
    		//Set the link to the message handler for this class
        	LEDControl ledControl;
        	
			ledControl = ((LEDControl)findViewById(R.id.led_0));
			ledControl.setHandler(handler);
			
			ledControl = ((LEDControl)findViewById(R.id.led_1));
			ledControl.setHandler(handler);

			ledControl = ((LEDControl)findViewById(R.id.led_2));
			ledControl.setHandler(handler);

			ledControl = ((LEDControl)findViewById(R.id.led_3));
			ledControl.setHandler(handler);

			ledControl = ((LEDControl)findViewById(R.id.led_4));
			ledControl.setHandler(handler);

			ledControl = ((LEDControl)findViewById(R.id.led_5));
			ledControl.setHandler(handler);

			ledControl = ((LEDControl)findViewById(R.id.led_6));
			ledControl.setHandler(handler);

			ledControl = ((LEDControl)findViewById(R.id.led_7));
			ledControl.setHandler(handler);

        } catch (Exception e) {
        }
        
        //Restore UI state from the savedInstanceState
        //  If the savedInstanceState Bundle exists, then there is saved data to
        //  restore.
        if (savedInstanceState != null) {
        	try {
        		//Restore the saved data for each of the LEDs.
        		LEDControl ledControl;
        		ProgressBar progressBar;

        		updateButton(R.id.button4,savedInstanceState.getBoolean("BUTTON4"));
        		updateButton(R.id.button3,savedInstanceState.getBoolean("BUTTON3"));
        		updateButton(R.id.button2,savedInstanceState.getBoolean("BUTTON2"));
        		updateButton(R.id.button1,savedInstanceState.getBoolean("BUTTON1"));
        		
        		progressBar = (ProgressBar)findViewById(R.id.progress_bar);
        		progressBar.setProgress(savedInstanceState.getInt("POT"));
        		
        		ledControl = (LEDControl)findViewById(R.id.led_7);
				ledControl.setState(savedInstanceState.getBoolean("LED7"));
        		
				ledControl = (LEDControl)findViewById(R.id.led_6);
				ledControl.setState(savedInstanceState.getBoolean("LED6"));

				ledControl = (LEDControl)findViewById(R.id.led_5);
				ledControl.setState(savedInstanceState.getBoolean("LED5"));
				
				ledControl = (LEDControl)findViewById(R.id.led_4);
				ledControl.setState(savedInstanceState.getBoolean("LED4"));
				
				ledControl = (LEDControl)findViewById(R.id.led_3);
				ledControl.setState(savedInstanceState.getBoolean("LED3"));
				
				ledControl = (LEDControl)findViewById(R.id.led_2);
				ledControl.setState(savedInstanceState.getBoolean("LED2"));
				
				ledControl = (LEDControl)findViewById(R.id.led_1);
				ledControl.setState(savedInstanceState.getBoolean("LED1"));
				
				ledControl = (LEDControl)findViewById(R.id.led_0);
				ledControl.setState(savedInstanceState.getBoolean("LED0"));
						
        	} catch (Exception e) {
        		//Just in case there is some way for the savedInstanceState to exist but for a single
        		//  item not to exist, lets catch any exceptions that might come.
        	}
        }
    }
	
	@Override
	public void onStart() {
		super.onStart();
		
		this.setTitle("Basic Accessory Demo: Device not connected.");
	}
	
    @Override
    public void onResume() {
    	super.onResume();
        accessoryManager.enable(this);
    }
    
    @Override
    public void onSaveInstanceState(Bundle savedInstanceState) {	  
    	//Save the UI state into the savedInstanceState Bundle.
		//  We only need to save the state of the LEDs since they are the only control.
    	//  The state of the potentiometer and push buttons can be read and restored
    	//  from their current hardware state.
    	
		savedInstanceState.putBoolean("LED0", ((LEDControl)findViewById(R.id.led_0)).getState());
		savedInstanceState.putBoolean("LED1", ((LEDControl)findViewById(R.id.led_1)).getState());
		savedInstanceState.putBoolean("LED2", ((LEDControl)findViewById(R.id.led_2)).getState());
		savedInstanceState.putBoolean("LED3", ((LEDControl)findViewById(R.id.led_3)).getState()); 
		savedInstanceState.putBoolean("LED4", ((LEDControl)findViewById(R.id.led_4)).getState());
		savedInstanceState.putBoolean("LED5", ((LEDControl)findViewById(R.id.led_5)).getState());
		savedInstanceState.putBoolean("LED6", ((LEDControl)findViewById(R.id.led_6)).getState());
		savedInstanceState.putBoolean("LED7", ((LEDControl)findViewById(R.id.led_7)).getState());
		
		savedInstanceState.putInt("POT", ((ProgressBar)findViewById(R.id.progress_bar)).getProgress());
		
		savedInstanceState.putBoolean("BUTTON1", isButtonPressed(R.id.button1));
		savedInstanceState.putBoolean("BUTTON2", isButtonPressed(R.id.button2));
		savedInstanceState.putBoolean("BUTTON3", isButtonPressed(R.id.button3));
		savedInstanceState.putBoolean("BUTTON4", isButtonPressed(R.id.button4));
		
		//Call the super function that we are over writing now that we have saved our data.
		super.onSaveInstanceState(savedInstanceState);
    }
    
    @Override
    public void onPause() {
    	super.onPause();
    	accessoryManager.disable(this);
    	disconnectAccessory();
    }
    
    /** Resets the demo application when a device detaches 
     */
    public void disconnectAccessory() {
    	this.setTitle("Basic Accessory Demo: Device not connected.");
    	
		LEDControl ledControl;
		ProgressBar progressBar;

		updateButton(R.id.button4,false);
		updateButton(R.id.button3,false);
		updateButton(R.id.button2,false);
		updateButton(R.id.button1,false);
		
		progressBar = (ProgressBar)findViewById(R.id.progress_bar);
		progressBar.setProgress(0);
		
		ledControl = (LEDControl)findViewById(R.id.led_7);
		ledControl.setState(false);
		
		ledControl = (LEDControl)findViewById(R.id.led_6);
		ledControl.setState(false);

		ledControl = (LEDControl)findViewById(R.id.led_5);
		ledControl.setState(false);
		
		ledControl = (LEDControl)findViewById(R.id.led_4);
		ledControl.setState(false);
		
		ledControl = (LEDControl)findViewById(R.id.led_3);
		ledControl.setState(false);
		
		ledControl = (LEDControl)findViewById(R.id.led_2);
		ledControl.setState(false);
		
		ledControl = (LEDControl)findViewById(R.id.led_1);
		ledControl.setState(false);
		
		ledControl = (LEDControl)findViewById(R.id.led_0);
		ledControl.setState(false);
    }
    
    /** 
     * Handler for receiving messages from the USB Manager thread or
     *   the LED control modules
     */
    private Handler handler = new Handler() {
    	@Override
    	public void handleMessage(Message msg) {
    		byte[] commandPacket = new byte[2];
    		
			switch(msg.what)
			{				
			case UPDATE_LED_SETTING:
				if(accessoryManager.isConnected() == false) {
					return;
				}
				
				commandPacket[0] = UPDATE_LED_SETTING;
				commandPacket[1] = 0;
				
				if(((LEDControl)findViewById(R.id.led_0)).getState()) {
					commandPacket[1] |= LED_0_ON;
				}
				
				if(((LEDControl)findViewById(R.id.led_1)).getState()) {
					commandPacket[1] |= LED_1_ON;
				}
				
				if(((LEDControl)findViewById(R.id.led_2)).getState()) {
					commandPacket[1] |= LED_2_ON;
				}
				
				if(((LEDControl)findViewById(R.id.led_3)).getState()) {
					commandPacket[1] |= LED_3_ON;
				}
				
				if(((LEDControl)findViewById(R.id.led_4)).getState()) {
					commandPacket[1] |= LED_4_ON;
				}
				
				if(((LEDControl)findViewById(R.id.led_5)).getState()) {
					commandPacket[1] |= LED_5_ON;
				}
				
				if(((LEDControl)findViewById(R.id.led_6)).getState()) {
					commandPacket[1] |= LED_6_ON;
				}
				
				if(((LEDControl)findViewById(R.id.led_7)).getState()) {
					commandPacket[1] |= LED_7_ON;
				}
				
				accessoryManager.write(commandPacket);			
				break;
			
			case USBAccessoryWhat:
				switch(((USBAccessoryManagerMessage)msg.obj).type) {
				case READ:
					if(accessoryManager.isConnected() == false) {
						return;
					}
					
					while(true) {
						if(accessoryManager.available() < 2) {
							//All of our commands in this example are 2 bytes.  If there are less
							//  than 2 bytes left, it is a partial command
							break;
						}
					
						accessoryManager.read(commandPacket);
						
						switch(commandPacket[0]) {
						case POT_STATUS_CHANGE:
							ProgressBar progressBar = (ProgressBar) findViewById(R.id.progress_bar);
							
							if((commandPacket[1] >= 0) && (commandPacket[1] <= progressBar.getMax())) {
								progressBar.setProgress(commandPacket[1]);	
							}
							break;
						case PUSHBUTTON_STATUS_CHANGE:
			    			updateButton(R.id.button1, ((commandPacket[1] & BUTTON_1_PRESSED) == BUTTON_1_PRESSED)?true:false);
			    			updateButton(R.id.button2, ((commandPacket[1] & BUTTON_2_PRESSED) == BUTTON_2_PRESSED)?true:false);
			    			updateButton(R.id.button3, ((commandPacket[1] & BUTTON_3_PRESSED) == BUTTON_3_PRESSED)?true:false);
			    			updateButton(R.id.button4, ((commandPacket[1] & BUTTON_4_PRESSED) == BUTTON_4_PRESSED)?true:false);
			    			break;
						}
						
					}
					break;
				case CONNECTED:
					break;
				case READY:
					setTitle("Basic Accessory Demo: Device connected.");
					break;
				case DISCONNECTED:
					disconnectAccessory();
					break;
				}				
				
   				break;
			default:
				break;
			}	//switch
    	} //handleMessage
    }; //handler
    
    private void updateButton(int id, boolean pressed) {
		TextView textviewToUpdate;
		LinearLayout layoutToUpdate;
		
		textviewToUpdate = (TextView)findViewById(id);
		layoutToUpdate = (LinearLayout)textviewToUpdate.getParent();
		
		if(pressed)
		{
			textviewToUpdate.setText(R.string.pressed);
			layoutToUpdate.setBackgroundResource(R.color.button_pressed);	
		} else {
			textviewToUpdate.setText(R.string.not_pressed);
			layoutToUpdate.setBackgroundResource(0);
		}
    }
    
    private boolean isButtonPressed(int id)
    {
		TextView buttonTextView;
		String buttonText;
		
		buttonTextView = ((TextView)findViewById(id));
		buttonText = buttonTextView.getText().toString();
		return buttonText.equals(getString(R.string.pressed));
    }
} //Class definition BasicAccessoryDemo