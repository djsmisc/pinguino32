#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    ShortDescription.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	31/March/2012
    last release:	31/March/2012
    
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
import sys, os

HOME_DIR = sys.path[0]
THEME_DIR = os.path.join(HOME_DIR, 'theme')

########################################################################
class Preferences():
    #----------------------------------------------------------------------
    def __initPreferences__(self, parent):
        self.IDE = parent
        
        self.auinotebookPreferences.SetTabCtrlHeight(0)
        
        self.Bind(wx.EVT_LISTBOX, self.setPage, self.listBoxPreferences)
        self.Bind(wx.EVT_BUTTON, self.setDefaultConfig, self.buttonRestore)
        self.Bind(wx.EVT_BUTTON, self.writeConfig, self.buttonApply)
        self.Bind(wx.EVT_BUTTON, lambda x:self.Close(), self.buttonCancel)

        self.initInfo()
        
    #----------------------------------------------------------------------
    def initInfo(self):
        self.themeList = [f for f in os.listdir(THEME_DIR)
                          if os.path.isdir(os.path.join(THEME_DIR, f))
                          and not f.startswith(".")
                          and f != "icons_autocompleter"]   
        
        self.choiceTheme.AppendItems(self.themeList)
        self.choiceTheme.SetStringSelection(self.IDE.theme)
        self.Bind(wx.EVT_CHOICE,  self.SetTheme, self.choiceTheme)
        
                
        
            

        
    #----------------------------------------------------------------------
    def setPage(self, event):
        if type(event) == type(""): string = event
        else: string = event.GetString()
        self.auinotebookPreferences.SetSelection(event.GetSelection())
        self.staticTextPage.SetLabel(string)
        
    #----------------------------------------------------------------------
    def readConfig(self, event=None):
        print "Loading Config"
        
    #----------------------------------------------------------------------
    def writeConfig(self, event=None):
        self.IDE.appyPreferences()
        
    #----------------------------------------------------------------------
    def setDefaultConfig(self, event=None):
        print "Restaurando Config"
        
    #---------------------------------------------------------------------- 
    def SetTheme(self, event):
        tid = event.GetInt()
        self.IDE.theme = self.themeList[tid]
    