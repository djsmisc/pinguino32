#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

########################################################################
#                                                                      #
#	Wistiti - Pinguino's Best Friend                                   #
#	8-bit USB Bootloader Factory                                       #
#	Author:	Régis Blanchot <rblanchot@gmail.com>                       #
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
    '18f2455',    '18f2550',    '18f25k50',   '18f26j50',
    '18f4455',    '18f4550',    '18f45k50',   '18f46j50'
]

oscillatorList = \
[
    '8',    '20',   'INTOSC'
]

########################################################################
class MainPanel(wx.Panel):
    """"""
 
    #-------------------------------------------------------------------
    def __init__(self, parent):
        """Constructor"""
        wx.Panel.__init__(self, parent=parent)
        self.SetBackgroundStyle(wx.BG_STYLE_CUSTOM)

        self.checkboxList = []
        self.radiobuttonList = []
        sizerList = []
        
        # Create a Label
        lDevices = wx.StaticText ( self, -1, label = u'Choose one device or more :')
        sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
        sizerList[-1].Add ( lDevices, 1, wx.ALL|wx.EXPAND, 5 )

        # Create CheckBoxes for each supported processor
        old_col = 0
        sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
        for i in range(len(devicesList)):
            self.checkboxList.append( wx.CheckBox ( self, id = i, label = devicesList[i] ) )
            new_col = i / 4
            if ( new_col > old_col ) :
                old_col = new_col
                sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
            sizerList[-1].Add ( self.checkboxList[-1], 0, wx.ALL, 5 )

        # Line
        sizerList.append ( wx.BoxSizer ( wx.VERTICAL ) )
        sizerList[-1].Add ( wx.StaticLine(self,), 0, wx.ALL|wx.EXPAND, 5)
        
        # Create a Label
        lOscillator = wx.StaticText ( self, -1, label = u'Choose Oscillator frequency :')
        sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
        sizerList[-1].Add ( lOscillator, 1, wx.ALL|wx.EXPAND, 5 )

        # Create Radio buttons for each supported oscillator 
        old_col = 0
        sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
        for i in range(len(oscillatorList)):
            self.radiobuttonList.append( wx.RadioButton ( self, id = i, label = oscillatorList[i] ) )
            new_col = i / 4
            if ( new_col > old_col ) :
                old_col = new_col
                sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
            sizerList[-1].Add ( self.radiobuttonList[-1], 0, wx.ALL, 5 )

        # Line
        sizerList.append ( wx.BoxSizer ( wx.VERTICAL ) )
        sizerList[-1].Add ( wx.StaticLine(self,), 0, wx.ALL|wx.EXPAND, 5)
        
        # Create CheckBox for String Descriptor
        sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
        self.cbString = wx.CheckBox ( self, -1, label = "String Descriptor" )
        self.cbSpeed  = wx.CheckBox ( self, -1, label = "Low Speed USB" )
        sizerList[-1].Add ( self.cbString, 0, wx.ALL, 5 )
        sizerList[-1].Add ( self.cbSpeed, 0, wx.ALL, 5 )

        # Line
        sizerList.append ( wx.BoxSizer ( wx.VERTICAL ) )
        sizerList[-1].Add ( wx.StaticLine(self,), 0, wx.ALL|wx.EXPAND, 5)
        
        # Create a 'Compile' and a 'Upload on Pinguino' Button
        bCompile = wx.Button(self, -1, "Compile")
        bUpload  = wx.Button(self, -1, "Upload")
        sizerList.append ( wx.BoxSizer ( wx.HORIZONTAL ) )
        sizerList[-1].Add ( bCompile, 1, wx.ALL|wx.EXPAND, 5 )
        sizerList[-1].Add ( bUpload,  1, wx.ALL|wx.EXPAND, 5 )
        bUpload.Disable()
        
        # Create a Sizer to organize our widgets and attach it to the panel
        topSizer = wx.BoxSizer ( wx.VERTICAL   )
        for i in range(len(sizerList)):
            topSizer.Add ( sizerList[i], 0, wx.ALL|wx.EXPAND, 5 )

        self.SetSizerAndFit ( topSizer )
        self.Show ( True )

        # Catch events
        self.Bind(wx.EVT_ERASE_BACKGROUND, self.OnEraseBackground)            
        self.Bind(wx.EVT_BUTTON, self.OnCompile, bCompile)
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
 
    #----------------------------------------------------------------------
    def OnCompile(self,event):
        message = "Compile"
        if (self.cbString.GetValue()):
            string = "1"
        else:
            string = "0"
        for i in range(len(oscillatorList)):
            if (self.radiobuttonList[i].GetValue()):
                osc = self.radiobuttonList[i].GetLabel()
        for i in range(len(devicesList)):
            if (self.checkboxList[i].GetValue()):
                proc = self.checkboxList[i].GetLabel()
                self.Compile(proc, osc, string)
            
    #----------------------------------------------------------------------
    def OnUpload(self,event):
        message = "Upload"
        if (self.cbString.GetValue()):
            string = "1"
        else:
            string = "0"
        for i in range(len(oscillatorList)):
            if (self.radiobuttonList[i].GetValue()):
                osc = self.radiobuttonList[i].GetLabel()
        for i in range(len(devicesList)):
            if (self.checkboxList[i].GetValue()):
                proc = self.checkboxList[i].GetLabel()
                self.Compile(proc, osc, string)
        # Display a dialog with the results
        dialog = wx.MessageDialog ( self, message, 'Results', style = wx.OK )
        dialog.ShowModal()
        dialog.Destroy()
            
    #----------------------------------------------------------------------
    def Compile(self, proc, osc, string):
        output = Popen(args=[   "make", "--makefile=Makefile",
                                "-e",
                                "PROC=" + proc,
                                "OSC=" + osc,
                                "STRINGDESC=" + string ],
                                stdout=PIPE,
                                stderr=STDOUT,
                                shell=False,        # redirect error stream to stdout
                                close_fds=False)
        output.wait() # or poll()
        #output.communicate()
        outputlines = output.stdout.readlines()
        # Display a dialog with the results
        dialog = wx.MessageDialog ( self, outputlines[0], 'Results', style = wx.OK )
        dialog.ShowModal()
        dialog.Destroy()
        
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
        wx.Frame.__init__(self, None, title = 'Wiztiti - Pinguino\'s Best Friend !', size = ( 400, 374 )) 
        panel = MainPanel(self)        
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
