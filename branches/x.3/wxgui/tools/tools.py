#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Tools.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	2012-02-02
    last release:	2012-02-04
    
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

import wx, re, webbrowser
from treeExamples import treeExamples
from autoCompleter import autoCompleter

########################################################################
class Tools(treeExamples, autoCompleter):
    #----------------------------------------------------------------------
    def initTools(self):
        self.panel_find.Hide()
	self.panel_replace.Hide()
	self.updateIDE()
        self.__initTree__()
        self.__initCompleter__()
	self.makeFindText()
	self.makeReplaceText()
	self._init_sizers()
        self.centrarFrame()     

    #----------------------------------------------------------------------
    def centrarFrame(self):
        screen=wx.ScreenDC().Size
        size=self.Size
        self.SetPosition(((screen[0]-size[0])/2,(screen[1]-size[1])/2))

    #----------------------------------------------------------------------
    def contexMenuTools(self, event):
        menu = wx.Menu()
        self._initIDs_(self.editor.stcpage[self.editor.GetSelection()])

        word=self.wordUnderCursor(funtion=True)
	
        if word in self.keywordList:
            self.Bind(wx.EVT_MENU,
                      lambda x:webbrowser.open("http://wiki.pinguino.cc/index.php/"+word),
                      id=self.popupIDhelp)
            menu.Append(self.popupIDhelp, "Search info about %s" %word)
            menu.AppendSeparator()

        menu.Append(self.popupID1, "Undo")
        menu.Append(self.popupID2, "Redo")
        menu.AppendSeparator()
        menu.Append(self.popupID3, "Cut")
        menu.Append(self.popupID4, "Copy")
        menu.Append(self.popupID5, "Paste")
        menu.Append(self.popupID6, "Delete")
        menu.AppendSeparator()
        menu.Append(self.popupID7, "Delete All")

        self.PopupMenu(menu)
        menu.Destroy()

    #----------------------------------------------------------------------
    def wordUnderCursor(self,funtion=False):
        
        line,pos=self.editor.stcpage[self.editor.GetSelection()].CurLine
            
        so=line.split(" ")
        l=0
        for word in so:
            l+=len(word)+1
            if pos<l: break

        pos=len(word)-l+pos
        if funtion:
            all=re.findall("(\w*\.*\w*)",word)            
            l=0
            for word in all:
                if word=="": word=" "
                l+=len(word)
                if pos<l: return word  
        else:
            if not word.isalnum():
                all=re.findall("(\w*)",word)  
                l=0
                for word in all:
                    if word=="": word=" "
                    l+=len(word)
                    if pos<l: return word     
            else: return word
	    
	    
	    
	    
    #----------------------------------------------------------------------
    def makeFindText(self):
	self.FindText.Hide()
	self.FindText = wx.SearchCtrl(id=wx.NewId(),
	      name=u'FindText', parent=self.panel_find, pos=wx.Point(16, 5),
	      size=wx.Size(160, 25), style=0, value=u'')
	self.FindText.ShowSearchButton(False)
        self.FindText.ShowCancelButton(True)
        self.Bind(wx.EVT_SEARCHCTRL_CANCEL_BTN, self.hideSearchComplete, self.FindText)
	
    #----------------------------------------------------------------------
    def makeReplaceText(self):
	self.ReplaceText.Hide()
	self.ReplaceText = wx.SearchCtrl(id=wx.NewId(),
              name=u'ReplaceText', parent=self.panel_replace, pos=wx.Point(16,
              5), size=wx.Size(161, 25), style=0, value=u'') 
	self.ReplaceText.SetDescriptiveText("Replace")
	self.ReplaceText.ShowSearchButton(False)
        self.ReplaceText.ShowCancelButton(False)
	
    #----------------------------------------------------------------------
    def hideSearchComplete(self, event=None):
	self.panel_find.Hide()
	self.panel_replace.Hide()
	self.updateIDE()
	    


    #----------------------------------------------------------------------
    def _initIDs_(self,textEdit):
        self.popupID1 = wx.NewId()
        self.popupID2 = wx.NewId()
        self.popupID3 = wx.NewId()
        self.popupID4 = wx.NewId()
        self.popupID5 = wx.NewId()
        self.popupID6 = wx.NewId()
        self.popupID7 = wx.NewId()
        self.popupIDhelp = wx.NewId()

        self.Bind(wx.EVT_MENU, lambda x:textEdit.Undo(), id=self.popupID1)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Redo(), id=self.popupID2)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Cut(), id=self.popupID3)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Copy(), id=self.popupID4)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Paste(), id=self.popupID5)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Clear(), id=self.popupID6)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.ClearAll(), id=self.popupID7)
