#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
	Tools

	(c) 2012 Yeison Cardona <yeison.eng@gmail.com> 

	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.

	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-------------------------------------------------------------------------"""

import wx, re, webbrowser
from treeExamples import treeExamples
from autoCompleter import autoCompleter

########################################################################
class Tools(treeExamples, autoCompleter):
    #----------------------------------------------------------------------
    def initTools(self):
        self.__initTree__()
        self.__initCompleter__()
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
