#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

########################################################################
#                                                                      #
#	Wistiti - Pinguino's Best Friend                                   #
#	8-bit USB Bootloader Factory                                       #
#	Author:	2012 - Régis Blanchot <rblanchot@gmail.com>                #
#                                                                      #
#	Usage: ./wiztiti.py                                                #
#                                                                      #
#	This file is part of Pinguino Project (http://www.pinguino.cc)     #
#	Released under the LGPL license (www.gnu.org/licenses/lgpl.html)   #
#                                                                      #
########################################################################

from subprocess import Popen,PIPE,STDOUT

try:
    import wx
except ImportError:
    raise ImportError,"The wxPython module is required to run this program"

devicesList = \
[  
    '18f13k50',   '18f14k50',
    '18f2455',    '18f4455',
    '18f2550',    '18f4550',
    '18f25k50',   '18f45k50',
    '18f26j50',   '18f46j50',
    '18f26j53',   '18f46j53',
    '18f27j53',   '18f47j53'
]

oscillatorList = \
[
    '4',    '8',    '12',    '16',    '20',    '24',    '40',   '48',    'INTOSC'
]

help_what    = "What : A bootloader can program the microcontroller remaining flash memory without necessity to use any external hardware (like ICD2 programmer). Bootloader receives data from PC through USB bus and writes it into the PIC microcontroller memory.\r\n\r\n"
help_why     = "Why : Wiztiti Bootloader doesn't require any Hardware changes in your device. It uses the standard USB interface of your microcontroller.\r\n\r\n"
help_how     = "How : Wiztiti Bootloader utilizes memory self-programming ability of PIC18F microcontrollers. Once burned into the microcontroller flash memory, bootloader can repeatedly reprogram it without expensive chip writers or ICSP (In-Circuit Serial Programmer).\r\n\r\n"
help_where   = "Where : Wiztiti Bootloader resides in the lower 3072 bytes (0x0C00) of the PIC microcontroller flash memory.\r\n\r\n"
help_compile = "Compile : translate high-level programming language into microcontroller language. After the compilation bootloader can be programmed (upload) into the target microcontroller.\r\n\r\n"
help_upload  = "Upload : program the Bootloader into the target microcontroller. You would need a chip writer to do it.\r\n\r\n"

########################################################################
class MainPanel(wx.Panel):
    """"""
 
    #-------------------------------------------------------------------
    def __init__(self, parent):
        """Constructor"""
        self.panel = wx.Panel.__init__(self, parent=parent)
        self.SetBackgroundStyle(wx.BG_STYLE_CUSTOM)

        self.checkboxList = []
        self.radiobuttonList = []
        sizerList = []                  # list of all sizers
        
        # Create a Static Box and a StaticBoxSizer, giving it the static box
        DevBox = wx.StaticBox( self, -1, label = u'Choose one Target Microcontroller or more')
        sizerList.append ( wx.StaticBoxSizer ( DevBox, wx.VERTICAL ) )

        # Create CheckBoxes for each supported processor
        old_col = 0
        grid = []
        grid.append ( wx.BoxSizer ( wx.HORIZONTAL ) )

        for i in range(len(devicesList)):
            # list of all checkboxes
            self.checkboxList.append( wx.CheckBox ( self, id = i, label = devicesList[i] ) )

            new_col = i / 4
            if ( new_col > old_col ) :
                old_col = new_col
                grid.append ( wx.BoxSizer ( wx.HORIZONTAL ) )

            grid[-1].Add ( self.checkboxList[-1], 0, wx.ALL|wx.EXPAND, 5 )

        for i in range(len(grid)):
            sizerList[-1].Add ( grid[i], 0, wx.ALL|wx.EXPAND, 5 )

        # Create a Static Box
        OscBox = wx.StaticBox( self, -1, label = u'Choose External Oscillator Frequency or Internal Oscillator')
        sizerList.append ( wx.StaticBoxSizer ( OscBox, wx.VERTICAL ) )

        # Create Radio buttons for each supported oscillator 
        old_col = 0
        grid = []
        grid.append ( wx.BoxSizer ( wx.HORIZONTAL ) )

        for i in range(len(oscillatorList)):
            # list of all radio buttons
            self.radiobuttonList.append( wx.RadioButton ( self, id = i, label = oscillatorList[i] ) )

            new_col = i / 8
            if ( new_col > old_col ) :
                old_col = new_col
                grid.append ( wx.BoxSizer ( wx.HORIZONTAL ) )

            grid[-1].Add ( self.radiobuttonList[-1], 0, wx.ALL, 5 )

        for i in range(len(grid)):
            sizerList[-1].Add ( grid[i], 0, wx.ALL|wx.EXPAND, 5 )

        # Create a Static Box
        OptBox = wx.StaticBox( self, -1, label = u'Other options')
        sizerList.append ( wx.StaticBoxSizer ( OptBox, wx.HORIZONTAL ) )

        # Create CheckBox for every option
        self.cbString = wx.CheckBox ( self, -1, label = "String Descriptor" )
        self.cbSpeed  = wx.CheckBox ( self, -1, label = "Low Speed USB" )
        self.cbLvp  = wx.CheckBox ( self, -1, label = "Low Voltage Programming" )
        #sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
        sizerList[-1].Add ( self.cbString, 0, wx.ALL, 5 )
        sizerList[-1].Add ( self.cbSpeed, 0, wx.ALL, 5 )
        sizerList[-1].Add ( self.cbLvp, 0, wx.ALL, 5 )

        # Create a Static Box
        ButBox = wx.StaticBox( self, -1, label = u'')
        sizerList.append ( wx.StaticBoxSizer ( ButBox, wx.HORIZONTAL ) )

        # Create a 'Compile' and a 'Upload on Pinguino' Button
        bCompile = wx.Button(self, -1, "Compile")
        bHelp  = wx.Button(self, -1, "Help")
        bUpload  = wx.Button(self, -1, "Upload")
        #sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
        sizerList[-1].Add ( bCompile, 1, wx.ALL|wx.EXPAND, 5 )
        sizerList[-1].Add ( bHelp, 1, wx.ALL|wx.EXPAND, 5 )
        sizerList[-1].Add ( bUpload,  1, wx.ALL|wx.EXPAND, 5 )
        bUpload.Disable()
        
        # Create a Sizer to organize our widgets and attach it to the panel
        topSizer = wx.BoxSizer ( wx.VERTICAL   )
        for i in range(len(sizerList)):
            topSizer.Add ( sizerList[i], 0, wx.ALL|wx.EXPAND, 5 )

        self.SetSizerAndFit ( topSizer )
        self.Show ( True )

        # Catch events
        #self.Bind(wx.EVT_ERASE_BACKGROUND, self.OnEraseBackground)            
        self.Bind(wx.EVT_BUTTON, self.OnCompile, bCompile)
        self.Bind(wx.EVT_BUTTON, self.OnHelp, bHelp)
        self.Bind(wx.EVT_BUTTON, self.OnUpload,  bUpload)

    # Add a picture to the background
    #----------------------------------------------------------------------
    def OnEraseBackground(self, event):
        dc = event.GetDC()
        if not dc:
            dc = wx.ClientDC(self)
            rect = self.GetUpdateRegion().GetBox()
            dc.SetClippingRect(rect)
        dc.Clear()
        bmp = wx.Bitmap("img/wiztiti.jpg")
        dc.DrawBitmap(bmp, 0, 0)
 
    # If User press Compile button
    #----------------------------------------------------------------------
    def OnCompile(self,event):
        message = "Compile"

        if (self.cbString.GetValue()):
            string = "1"
        else:
            string = "0"

        if (self.cbSpeed.GetValue()):
            speed = "1"
        else:
            speed = "0"

        if (self.cbLvp.GetValue()):
            lvp = "1"
        else:
            lvp = "0"

        for i in range(len(oscillatorList)):
            if (self.radiobuttonList[i].GetValue()):
                osc = self.radiobuttonList[i].GetLabel()

        for i in range(len(devicesList)):
            if (self.checkboxList[i].GetValue()):
                proc = self.checkboxList[i].GetLabel()
                self.Compile(proc, osc, string, speed, lvp)

    # If User press Upload button
    #----------------------------------------------------------------------
    def OnHelp(self,event):
        """Display some information"""
        dialog = wx.MessageDialog ( self, help_what + help_why + help_how + help_where + help_compile + help_upload, 'Help', style = wx.OK )
        dialog.ShowModal()
        dialog.Destroy()

    # If User press Upload button
    #----------------------------------------------------------------------
    def OnUpload(self,event):
        """Upload Hex file"""

    # Compile Bootloader(s) by calling Makefile
    #----------------------------------------------------------------------
    def Compile(self, proc, osc, string, speed, lvp):
        output = Popen(args=[   "make", "--makefile=Makefile",
                                "-e",
                                "PROC=" + proc,
                                "OSC=" + osc,
                                "STRINGDESC=" + string,
                                "SPEED=" + speed,
                                "LVP=" + lvp ],
                                stdout=PIPE,
                                stderr=STDOUT,
                                shell=False,        # redirect error stream to stdout
                                close_fds=False)
        output.wait() # or poll()
        #output.communicate()
        outputlines = output.stdout.readlines()
        error = ""
        for i in range(len(outputlines)):
            pos = outputlines[i].find("error:")
            if pos != -1:
                error = error + outputlines[i][pos+7:-1] + "\r\n"
        # Display a dialog with the results
        if error != "":
            dialog = wx.MessageDialog ( self, error, 'Error!', style = wx.OK )
        else:
            dialog = wx.MessageDialog ( self, outputlines[0] + "\r\nCompilation Sucessful!", 'Results', style = wx.OK )
        dialog.ShowModal()
        dialog.Destroy()
        
    # Upload Hex file on Pinguino Board
    #----------------------------------------------------------------------
    def Upload(self, proc, osc, hex_file):
        print "hex=" + hex_file

########################################################################
class MainFrame(wx.Frame):
    """"""
 
    # Create a panel to house everything
    #-------------------------------------------------------------------
    def __init__(self):
        """Constructor"""
        wx.Frame.__init__(self, None, title = 'Wiztiti - Pinguino\'s Best Friend !', size = ( 550, 480 )) 
        panel = MainPanel(self)        
        ico = wx.Icon("img/wiztiti.ico", wx.BITMAP_TYPE_ICO)
        self.SetIcon(ico)
        self.Center()

########################################################################
class wiztiti(wx.App):
    """"""
 
    #-------------------------------------------------------------------
    def __init__(self, redirect=False, filename=None):
        """Constructor"""
        wx.App.__init__(self, redirect, filename)
        dlg = MainFrame()
        dlg.Show()
 
#----------------------------------------------------------------------
if __name__ == "__main__":
    app = wiztiti()
    app.MainLoop()
