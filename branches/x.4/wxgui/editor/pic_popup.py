#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    description

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	26/September/2012
    last release:	26/September/2012

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

import wx, os

########################################################################
class PICpopup:
    """"""
    
    #----------------------------------------------------------------------
    def __init_list__(self, IDE):
        """"""
        self.IDE = IDE
        self.Bind(wx.EVT_LIST_ITEM_ACTIVATED, self.setDevice, self.listCtrl_devices)
        

    #----------------------------------------------------------------------
    def setItems(self, lista):
	self.listCtrl_devices.ClearAll()
        for i in range(len(lista)):
            self.listCtrl_devices.InsertStringItem(i, lista[i])        
        
        
    #----------------------------------------------------------------------
    def activate(self, event=None):
        """"""
	pos = self.IDE.textCtrlDevices.GetPosition() + self.IDE.GetPosition() + \
	    wx.Point(0, self.IDE.textCtrlDevices.Size[1])
	
	if os.name == "posix":
	    pos += wx.Point(0, self.IDE.MenuBar.Size[1])
	    
	    if not self.IDE.IsMaximized():
		pos += wx.Point(0, 27)
	    
	self.Move(pos)
	
	if self.IsShown(): self.Hide()
	else: self.Show()
    
    #----------------------------------------------------------------------    
    def setDevice(self, event):
        selection = self.listCtrl_devices.GetItemText(event.GetIndex())
	self.IDE.textCtrlDevices.SetValue(selection)
        self.Hide()
	
	#self.IDE.setConfig("IDE", "boardNoBoot", selection)
	
	self.IDE.OnBoard(event)