#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    ShortDescription.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	31/March/2012
    last release:	06/May/2012

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

HOME_DIR = os.getcwd()
from wxgui._trad import _
THEME_DIR = os.path.join(HOME_DIR, 'theme')

########################################################################
class Preferences():
    #----------------------------------------------------------------------
    def __initPreferences__(self, parent):
        self.IDE = parent
        
        self.GlobalSet = ["auto-complete", "open-save", "tools"]
        
        self.labelNotice.Hide()

        self.auinotebookPreferences.SetTabCtrlHeight(0)
        self.auinotebookPreferences.SetSelection(0)
        self.listBoxPreferences.SetSelection(0)
        self.checkListPreferences.SetSelection(0)
        self.listBoxPreferences.SetFocus()
        self.checkListPreferences.SetSelection(-1)        
        
        self.Bind(wx.EVT_CHECKLISTBOX, lambda event:
                  self.setPage_enable(event, self.listBoxPreferences.Count), self.checkListPreferences)
        self.Bind(wx.EVT_LISTBOX, lambda event: self.setPage(event, 0), self.listBoxPreferences)
        self.Bind(wx.EVT_LISTBOX, lambda event: self.setPage(event, self.listBoxPreferences.Count), self.checkListPreferences)
        self.Bind(wx.EVT_BUTTON, self.setDefaultConfig, self.buttonRestore)
        self.Bind(wx.EVT_BUTTON, self.writeConfig, self.buttonApply)
        self.Bind(wx.EVT_BUTTON, lambda x:self.Close(), self.buttonCancel)
        
        if not os.path.isfile(".config"): self.setDefaultConfig()
            
        self.loadPreferences()
        
        

        #Appearance
        #----------------------------------------------------------------------
        self.Bind(wx.EVT_CHOICE,  self.SetTheme, self.choiceTheme)

        #Source
        #----------------------------------------------------------------------
        self.Bind(wx.EVT_FONTPICKER_CHANGED, self.setFont, self.fontPickerSource)
        self.Bind(wx.EVT_SPINCTRL, lambda x:self.IDE.setConfig("Source", "tabsize", self.spinCtrlSource.Value), self.spinCtrlSource)
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Source", "fontdefault", self.radioBtnSourcedefault.Value), self.radioBtnSourcedefault)
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Source", "fontdefault", self.radioBtnSourcedefault.Value), self.radioBtnSourceselected)
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Source", "userfontinoutput", self.checkBoxuseoutput.Value), self.checkBoxuseoutput)
        

        #Auto-Completer
        #----------------------------------------------------------------------
        self.Bind(wx.EVT_SPINCTRL, lambda x:self.IDE.setConfig("Completer", "charscount", self.spinCtrlCompleterCount.Value), self.spinCtrlCompleterCount)
        self.Bind(wx.EVT_SPINCTRL, lambda x:self.IDE.setConfig("Completer", "MaxItemsCount", self.spinCtrlItemsCompleterCount.Value), self.spinCtrlItemsCompleterCount)
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Completer", "Enable", self.radioBtnCompleterEn.Value), self.radioBtnCompleterEn)
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Completer", "Enable", self.radioBtnCompleterEn.Value), self.radioBtnCompleterDis)
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Completer", "insertParentheses", self.checkBoxInsertParenthesis.Value), self.checkBoxInsertParenthesis)
        
        #Insert
        #----------------------------------------------------------------------        
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "brackets", self.checkBoxBrackets.Value), self.checkBoxBrackets) 
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "doublecuotation", self.checkBoxDoubleCuotes.Value), self.checkBoxDoubleCuotes) 
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "singlecuotation", self.checkBoxSingleCuotes.Value), self.checkBoxSingleCuotes) 
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "keys", self.checkBoxKeys.Value), self.checkBoxKeys) 
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Insert", "parentheses", self.checkBoxParentheses.Value), self.checkBoxParentheses)  

        #Open/Save
        #----------------------------------------------------------------------
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Open/Save", "template", self.radioBtnFileTemplate.Value), self.radioBtnFileTemplate)  
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Open/Save", "autosave", self.radioBtnSaveEach.Value), self.radioBtnSaveEach)  
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Open/Save", "autosave", self.radioBtnSaveEach.Value), self.radioBtnSaveNever)
        self.Bind(wx.EVT_SPINCTRL, lambda x:self.IDE.setConfig("Open/Save", "autosavetime", self.spinCtrlSaveTime.Value), self.spinCtrlSaveTime)  
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Open/Save", "openlast", self.radioBtnOpenAll.Value), self.radioBtnOpenAll)    
        self.Bind(wx.EVT_RADIOBUTTON, lambda x:self.IDE.setConfig("Open/Save", "openlast", self.radioBtnOpenAll.Value), self.radioBtnOpenNever)       

        #Tools
        #----------------------------------------------------------------------
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Tools", "files", self.checkBoxFiles.Value), self.checkBoxFiles)  
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Tools", "documents", self.checkBoxDocuments.Value), self.checkBoxDocuments)  
        self.Bind(wx.EVT_CHECKBOX, lambda x:self.IDE.setConfig("Tools", "search", self.checkBoxSearch.Value), self.checkBoxSearch)  

        
    #----------------------------------------------------------------------
    def setColor(self, selColor, TextCtrl, option):
        color = selColor.GetColour()
        TextCtrl.SetBackgroundColour(color)
        self.IDE.setConfig("Highligh", option, list(color))
        
        
    #----------------------------------------------------------------------
    def setInsertParenthesis(self, event):
        insertParentheses = event.GetInt()
        self.IDE.setConfig("Completer", "insertParentheses", insertParentheses==1)

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
    def loadPreferences(self):
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

        value = self.IDE.getElse("Source", "fontdefault", "True")
        self.radioBtnSourcedefault.SetValue(value)
        self.radioBtnSourceselected.SetValue(not value)

        value = self.IDE.getElse("Source", "tabSize", 4)
        self.spinCtrlSource.SetValue(value)

        value = self.IDE.getElse("Completer", "charscount", 2)	
        self.spinCtrlCompleterCount.SetValue(value)

        value = self.IDE.getElse("Completer", "MaxItemsCount", 14)
        self.spinCtrlItemsCompleterCount.SetValue(value)

        value = self.IDE.getElse("Completer", "enable", "True")
        self.radioBtnCompleterEn.SetValue(value)
        self.radioBtnCompleterDis.SetValue(not value)

        value = self.IDE.getElse("Completer", "insertParentheses", "True")
        self.checkBoxInsertParenthesis.SetValue(value)
        
        value = self.IDE.getElse("Insert", "brackets", "False")
        self.checkBoxBrackets.SetValue(value)
        
        value = self.IDE.getElse("Insert", "doublecuotation", "False")
        self.checkBoxDoubleCuotes.SetValue(value)
        
        value = self.IDE.getElse("Insert", "singlecuotation", "False")
        self.checkBoxSingleCuotes.SetValue(value)
        
        value = self.IDE.getElse("Insert", "keys", "False")
        self.checkBoxKeys.SetValue(value)
        
        value = self.IDE.getElse("Insert", "parentheses", "False")
        self.checkBoxParentheses.SetValue(value)
        
        value = self.IDE.getElse("OpenSave", "template", "True")
        self.radioBtnFileTemplate.SetValue(value)
        self.radioBtnFileEmpty.SetValue(not value)
        
        value = self.IDE.getElse("Open/Save", "openlast", "False")
        self.radioBtnOpenAll.SetValue(value)
        self.radioBtnOpenNever.SetValue(not value)
        
        value = self.IDE.getElse("Open/Save", "autosave", "False")
        self.radioBtnSaveEach.SetValue(value)
        self.radioBtnSaveNever.SetValue(not value)
        
        value = self.IDE.getElse("Open/Save", "autosavetime", 10)
        self.spinCtrlSaveTime.SetValue(value)
        
        
        value = self.IDE.getColorConfig("Highligh", "searchreplace", [255, 250, 70])
        self.colourPickerSearch.SetColour(value)
        self.textCtrlSearch.SetBackgroundColour(value)
        
        value = self.IDE.getColorConfig("Highligh", "codenavigation", [120, 255, 152])
        self.colourPickerCodeNav.SetColour(value)
        self.textCtrlCodeNav.SetBackgroundColour(value)
        
        value = self.IDE.getColorConfig("Highligh", "selection", [241, 132, 88])
        self.colourPickerCurrentLine.SetColour(value)
        self.textCtrlCurrentLine.SetBackgroundColour(value)
        
        value = self.IDE.getColorConfig("Highligh", "codeerror", [241, 0, 0])
        self.colourPickerErrorLine.SetColour(value)
        self.textCtrlErrorLine.SetBackgroundColour(value)
        
        #value = self.IDE.getElse("IDE", "checkupgradeatstart", "True")
        #self.checkBoxUpgrade.SetValue(value)
        
        value = self.IDE.getElse("Source", "userfontinoutput", "False")
        self.checkBoxuseoutput.SetValue(value)
        
        value = self.IDE.getElse("Tools", "files", "False")
        self.checkBoxFiles.SetValue(value)
        
        value = self.IDE.getElse("Tools", "documents", "False")
        self.checkBoxDocuments.SetValue(value)
        
        value = self.IDE.getElse("Tools", "search", "False")
        self.checkBoxSearch.SetValue(value)        
        
        checks = []
        for item in self.GlobalSet:
            value = self.IDE.getElse("Main", item, "True")
            if value: checks.append(self.GlobalSet.index(item))
        self.checkListPreferences.SetChecked(checks)
        
        self.IDE.saveConfig()
        
    #----------------------------------------------------------------------
    def setPage(self, event, esc=0):
        if type(event) == type(""): string = event
        else: string = event.GetString()
        
        if esc: self.listBoxPreferences.SetSelection(-1)
        else: self.checkListPreferences.SetSelection(-1)
        
        self.auinotebookPreferences.SetSelection(event.GetSelection()+esc)
        self.staticTextPage.SetLabel(string)
        self.auinotebookPreferences.Enable(self.checkListPreferences.IsChecked(event.GetSelection()))
        
        
    #----------------------------------------------------------------------
    def setPage_enable(self, event, esc):
        if type(event) == type(""): string = event
        else: string = event.GetString()
        self.auinotebookPreferences.SetSelection(event.GetSelection()+esc)
        #self.staticTextPage.SetLabel(string)
        self.auinotebookPreferences.Enable(self.checkListPreferences.IsChecked(event.GetSelection()))
        
        self.IDE.setConfig("Main",
                           self.GlobalSet[event.GetSelection()],
                           self.checkListPreferences.IsChecked(event.GetSelection()))
        
        if not self.labelNotice.IsShown():
            self.labelNotice.Show()
            self.fgSizer2.Layout()
            self.SetSize(self.Size+wx.Size(0, self.labelNotice.Size[1]))
            self.IDE.setConfig("Main", "needRestart", "True")
        
    #----------------------------------------------------------------------
    def writeConfig(self, event=None):
        self.IDE.saveConfig()
        self.setFont()
        self.IDE.applyPreferences()

    #----------------------------------------------------------------------
    def setDefaultConfig(self, event=None):
        defaultConfig = os.path.join(HOME_DIR, "extra", "IDE", "config_default")
        defaultConfig = open(defaultConfig, mode='r', buffering=1)
        lines = defaultConfig.readlines()
        defaultConfig.close()
        config = open(".config", mode='w', buffering=1)
        config.writelines(lines)
        config.close()
        
        self.IDE.loadConfig()
        self.IDE.applyPreferences()
        self.loadPreferences()        

    #---------------------------------------------------------------------- 
    def SetTheme(self, event):
        tid = event.GetInt()
        self.IDE.theme = self.themeList[tid]
