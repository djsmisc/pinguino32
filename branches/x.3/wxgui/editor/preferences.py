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

        self.loadPreferences()

        #Appearance
        #----------------------------------------------------------------------
        self.Bind(wx.EVT_CHOICE,  self.SetTheme, self.choiceTheme)

        #Source
        #----------------------------------------------------------------------
        self.Bind(wx.EVT_FONTPICKER_CHANGED, self.setFont, self.fontPickerSource)
        self.Bind(wx.EVT_SPINCTRL, self.setTabSize, self.spinCtrlSource)
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Source", "fontdefault", True), self.radioBtnSourcedefault)
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Source", "fontdefault", False), self.radioBtnSourceselected)

        #Auto-Completer
        #----------------------------------------------------------------------
        self.Bind(wx.EVT_SPINCTRL, self.setCharsCount, self.spinCtrlCompleterCount)
        self.Bind(wx.EVT_SPINCTRL, self.setItemsCount, self.spinCtrlItemsCompleterCount)
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Completer", "Enable", True), self.radioBtnCompleterEn)
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Completer", "Enable", False), self.radioBtnCompleterDis)
        self.Bind(wx.EVT_CHECKBOX, self.setInsertParenthesis, self.checkBoxInsertParenthesis)
        
        #Insert
        #----------------------------------------------------------------------        
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "brackets", self.checkBoxBrackets.Value), self.checkBoxBrackets) 
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "doublecuotation", self.checkBoxDoubleCuotes.Value), self.checkBoxDoubleCuotes) 
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "singlecuotation", self.checkBoxSingleCuotes.Value), self.checkBoxSingleCuotes) 
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "keys", self.checkBoxKeys.Value), self.checkBoxKeys) 
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "parentheses", self.checkBoxParentheses.Value), self.checkBoxParentheses)  




    #----------------------------------------------------------------------
    def setInsertParenthesis(self, event):
        insertParentheses = event.GetInt()
        self.IDE.setConfig("Completer", "insertParentheses", insertParentheses==1)

    #----------------------------------------------------------------------
    def setCharsCount(self, event):
        charsCount = event.GetInt()
        self.IDE.setConfig("Completer", "charscount", charsCount)

    #----------------------------------------------------------------------
    def setItemsCount(self, event):
        MaxItemsCount = event.GetInt()
        self.IDE.setConfig("Completer", "MaxItemsCount", MaxItemsCount)


    #----------------------------------------------------------------------
    def setFont(self, event=None):
        if event != None:
            font = event.GetFont()
            self.IDE.setConfig("Source", "font", font.FaceName)
            self.IDE.setConfig("Source", "size", font.PointSize)
        else:
            font = self.fontPickerSource.GetSelectedFont()
            self.IDE.setConfig("Source", "font", font.FaceName)
            self.IDE.setConfig("Source", "size", font.PointSize)            
            

    #----------------------------------------------------------------------
    def setTabSize(self, event):
        tabSize = event.GetInt()
        self.IDE.setConfig("Source", "tabSize", tabSize)


    #----------------------------------------------------------------------
    def loadPreferences(self):

        #def getElse(section, option, default):
            #try: default = self.IDE.getConfig(section, option)
            #except: self.IDE.setConfig(section, option, default)
            #return default

        self.themeList = [f for f in os.listdir(THEME_DIR)
                          if os.path.isdir(os.path.join(THEME_DIR, f))
                          and not f.startswith(".")
                          and f != "icons_autocompleter"]   

        self.choiceTheme.AppendItems(self.themeList)
        self.choiceTheme.SetStringSelection(self.IDE.theme)


        font = wx.Font(10, wx.TELETYPE, wx.NORMAL, wx.NORMAL, True)

        FaceName = self.IDE.getElse("Source", "font", font.FaceName)
        PointSize = self.IDE.getElse("Source", "size", font.PointSize)
        font.SetFaceName(FaceName)
        font.SetPointSize(PointSize)	
        self.fontPickerSource.SetSelectedFont(font)

        value = self.IDE.getElse("Source", "fontdefault", "True") == "True"
        self.radioBtnSourcedefault.SetValue(value)
        self.radioBtnSourceselected.SetValue(not value)

        value = self.IDE.getElse("Source", "tabSize", 4)
        self.spinCtrlSource.SetValue(value)

        value = self.IDE.getElse("Completer", "charscount", 2)	
        self.spinCtrlCompleterCount.SetValue(value)

        value = self.IDE.getElse("Completer", "MaxItemsCount", 14)
        self.spinCtrlItemsCompleterCount.SetValue(value)

        value = self.IDE.getElse("Completer", "enable", "True") == "True"
        self.radioBtnCompleterEn.SetValue(value)
        self.radioBtnCompleterDis.SetValue(not value)

        value = self.IDE.getElse("Completer", "insertParentheses", "True") == "True"
        self.checkBoxInsertParenthesis.SetValue(value)
        
        value = self.IDE.getElse("Insert", "brackets", "False") == "True"
        self.checkBoxBrackets.SetValue(value)
        
        value = self.IDE.getElse("Insert", "doublecuotation", "False") == "True"
        self.checkBoxDoubleCuotes.SetValue(value)
        
        value = self.IDE.getElse("Insert", "singlecuotation", "False") == "True"
        self.checkBoxSingleCuotes.SetValue(value)
        
        value = self.IDE.getElse("Insert", "keys", "False") == "True"
        self.checkBoxKeys.SetValue(value)
        
        value = self.IDE.getElse("Insert", "parentheses", "False") == "True"
        self.checkBoxParentheses.SetValue(value)


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
        self.IDE.saveConfig()
        self.setFont()
        self.IDE.applyPreferences()

    #----------------------------------------------------------------------
    def setDefaultConfig(self, event=None):
        print "Restaurando Config"

    #---------------------------------------------------------------------- 
    def SetTheme(self, event):
        tid = event.GetInt()
        self.IDE.theme = self.themeList[tid]
