#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    BoarSelector

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	25/November/2012
    last release:	26/November/2012

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-------------------------------------------------------------------------"""

import wx
from wxgui._trad import _
from frames import FrameSelectDevice


########################################################################
class BoarSelector:
    """"""

    #----------------------------------------------------------------------
    def __init_selector__(self, IDE):
        """"""
        #self.staticText_warningICSP.Show()
        
        self.Boot =[["noboot", 0], ["boot2", 0x2000], ["boot4", 0x0C00]]
        self.IDE = IDE

        self.buttonBoxOK.SetDefault()

        self.buttonBoxCancel.Bind(wx.EVT_BUTTON, self.b_cancel)
        self.buttonBoxOK.Bind(wx.EVT_BUTTON, self.b_acept)
        self.radioBox_arch.Bind(wx.EVT_RADIOBOX, self.r_arch)
        self.radioBox_mode.Bind(wx.EVT_RADIOBOX, self.r_mode)

        self.IDE.loadConfigFile()
        self.ARCH = self.IDE.getElse("Board", "architecture", 8)
        self.MODE = self.IDE.getElse("Board", "mode", "BOOT")
        #self.FAMILY = self.IDE.getElse("Board", "family", "18fxxx")
        self.DEVICE = self.IDE.getElse("Board", "device", "Pinguino 2550")
        self.BOOTLOADER = self.getCurrentBootloader()
    

        if self.MODE == "ICSP": self.staticText_warningICSP.SetLabel("WARNING!! this mode can\noverwrite the bootloader code.")
        else: self.staticText_warningICSP.SetLabel("") 
    
        if self.ARCH == 8: self.radioBox_arch.SetSelection(0)
        else: self.radioBox_arch.SetSelection(1)
            #self.r_arch()
        

        if self.MODE == "BOOT": self.radioBox_mode.SetSelection(1)
        else: self.radioBox_mode.SetSelection(0)        

        self.new_choices_fam()

        #if self.FAMILY in self.radioBox_famChoices:
            #index = self.radioBox_famChoices.index(self.FAMILY)
            #self.radioBox_fam.SetSelection(index)

        #if self.MODE == "BOOT": self.new_choices_dev()
        self.new_choices_dev()

        if self.DEVICE in self.radioBox_devChoices:
            index = self.radioBox_devChoices.index(self.DEVICE)
            self.radioBox_dev.SetSelection(index)
        
        self.updateFrame()


    #----------------------------------------------------------------------
    def b_acept(self, event=None):
        if self.ARCH == 32 and self.MODE == "ICSP":
            dlg = wx.MessageDialog(self,
                                    _("ICSP mode for 32-bit architecture not supported yet."), _("Warning")+"!",
                                    wx.YES_DEFAULT | wx.ICON_WARNING
                                    )
            result=dlg.ShowModal()
            dlg.Destroy()
            return
            
        self.IDE.setConfig("Board", "architecture", self.ARCH)
        self.IDE.setConfig("Board", "mode", self.MODE)
        self.IDE.setConfig("Board", "device", self.DEVICE)
        #self.IDE.setConfig("Board", "family", self.FAMILY)
        self.IDE.setConfig("Board", "bootloader", self.BOOTLOADER)
        self.IDE.saveConfig()
        self.IDE.setBoard(self.ARCH, self.MODE, self.DEVICE, self.BOOTLOADER)  #To set board in wxgui/pinguino.py
        self.Close()

    #----------------------------------------------------------------------
    def b_cancel(self, event=None):
        """"""
        self.Close()
        
        
    #----------------------------------------------------------------------
    def updateFrame(self, event=None):
        """"""
        self.m_scrolledWindow1.SetSizer( self.sizer2 )
        self.m_scrolledWindow1.Layout()
        self.sizer2.Fit( self.m_scrolledWindow1 )
        self.m_panel37.Layout()
        self.Layout()
              
        
        #self.Centre( wx.BOTH )


    #----------------------------------------------------------------------
    def r_arch(self, event=None):
        board = self.radioBox_arch.GetSelection()
        if board == 0: self.ARCH = 8
        elif board == 1: self.ARCH = 32       
            
        self.new_choices_fam()
        self.r_device()
        self.updateFrame()

    #----------------------------------------------------------------------
    def r_device(self, event=None):
        if self.radioBox_devChoices:
            board = self.radioBox_dev.GetSelection()
            if board == -1: return  #No list ICSP 32-bit
            self.DEVICE = self.radioBox_devChoices[board]

    #----------------------------------------------------------------------
    def r_mode(self, event=None):
        mode = self.radioBox_mode.GetSelection()
        if mode == 0: self.MODE = "ICSP"
        elif mode == 1: self.MODE = "BOOT"
            
        if self.MODE == "ICSP": self.staticText_warningICSP.SetLabel("WARNING!! this mode can\noverwrite the bootloader code.")
        else: self.staticText_warningICSP.SetLabel("")  
        
        if self.ARCH == 8:
            self.new_choices_fam()
            self.r_device()
            self.updateFrame()

    #----------------------------------------------------------------------
    def r_fam(self, event=None):
        sel = self.radioBox_fam.GetSelection()
        if self.ARCH == 8:
            if self.MODE == "BOOT": self.BOOTLOADER = self.Boot[sel+1]
            if self.MODE == "ICSP":
                self.BOOTLOADER = self.Boot[0]
        #else:
                #if self.radioBox_famChoices:  #families have not been generated.
                #self.FAMILY = self.radioBox_famChoices[sel]
        
                self.new_choices_dev()
        
        self.updateFrame()
        
    #----------------------------------------------------------------------
    def getCurrentBootloader(self):
        BOOTLOADER = self.IDE.getElse("Board", "bootloader", "['boot2', 0x2000]")
        BOOTLOADER = BOOTLOADER[1:-1].split(",")
        return [BOOTLOADER[0].replace("'", ""), eval(BOOTLOADER[1])]

    #----------------------------------------------------------------------
    def new_choices_fam(self):
        try: self.radioBox_fam.Destroy()
        except: pass 
        #columns, self.radioBox_famChoices = self.IDE.getfamilies(self.ARCH, self.MODE)
        #if not self.radioBox_famChoices: #if no families dfined, then, {8-bit/boot, 32-bit}
            
        if self.ARCH == 8 and self.MODE == "BOOT":
            self.radioBox_botChoices = ["Bootloader v1.x or v2.x", "Bootloader v4.x"]
            self.radioBox_fam = wx.RadioBox( self.m_panel37, wx.ID_ANY, _(u"Bootloader"), wx.DefaultPosition, wx.DefaultSize, self.radioBox_botChoices, majorDimension=2)
            self.r_fam()
            
            self.BOOTLOADER = self.getCurrentBootloader()
            index = self.Boot.index(self.BOOTLOADER)
            
            self.radioBox_fam.SetSelection( index-1 )
            
            self.buildChoicesFam()    
            self.new_choices_dev()
            return
        
        else:
            self.new_choices_dev()
            return
            
            
        #if self.ARCH == 8:
            #self.radioBox_fam = wx.RadioBox( self.m_panel37, wx.ID_ANY, _(u"Family"), wx.DefaultPosition, wx.DefaultSize, self.radioBox_famChoices, majorDimension=columns)
            #self.radioBox_fam.SetSelection( 0 )	
            #self.buildChoicesFam()
            #self.new_choices_dev()
            #if self.FAMILY in self.radioBox_famChoices:
                #index = self.radioBox_famChoices.index(self.FAMILY)
                #self.radioBox_fam.SetSelection(index)	
            #return
        
        if self.ARCH == 8: self.new_choices_dev()
        else:
            if self.MODE == "BOOT": self.new_choices_dev()
            elif self.MODE == "ICSP": self.new_choices_dev()
        


    #----------------------------------------------------------------------
    def new_choices_dev(self):
        try:
            self.radioBox_dev.Destroy()
            self.m_scrolledWindow1.Destroy()
        except: pass 
        columns, self.radioBox_devChoices = self.IDE.getDevices(self.ARCH)

        self.m_scrolledWindow1 = wx.ScrolledWindow( self.m_panel37, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.HSCROLL|wx.VSCROLL )
        self.m_scrolledWindow1.SetScrollRate( 5, 5 )
        self.sizer2 = wx.BoxSizer( wx.VERTICAL )
        
        if self.radioBox_devChoices:
            self.radioBox_dev = wx.RadioBox( self.m_scrolledWindow1, wx.ID_ANY, _(u"Devices"), wx.DefaultPosition, wx.DefaultSize, self.radioBox_devChoices, majorDimension=columns)
            self.radioBox_dev.SetSelection( 0 )
            self.radioBox_dev.Bind(wx.EVT_RADIOBOX, self.r_device)

            self.buildChoicesDev()


    #----------------------------------------------------------------------
    def buildChoicesDev(self):
        self.sizer2.Add( self.radioBox_dev, 1, wx.ALL|wx.EXPAND, 5 )
        self.m_scrolledWindow1.SetSizer( self.sizer2 )
        self.m_scrolledWindow1.Layout()
        self.sizer2.Fit( self.m_scrolledWindow1 )
        self.sizer.Add( self.m_scrolledWindow1, 1, wx.EXPAND |wx.ALL, 0 )
        self.SetSize(self.Size)
        

    #----------------------------------------------------------------------
    def buildChoicesFam(self):
        self.sizer.Add( self.radioBox_fam, 0, wx.ALL|wx.EXPAND, 5 )
        self.radioBox_fam.Bind(wx.EVT_RADIOBOX, self.r_fam)


########################################################################
class ConfigDevice(FrameSelectDevice, BoarSelector):
    """"""
