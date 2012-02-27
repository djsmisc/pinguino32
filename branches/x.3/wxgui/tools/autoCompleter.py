#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Auto-complete control.

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

import wx
from dic import Dictionary, Snippet

########################################################################
class autoCompleter:
    #----------------------------------------------------------------------
    def __initCompleter__(self):
        self.recent = False  #To control the hide/show when a word is inserted
        
    #----------------------------------------------------------------------
    def inserted(self, event): 
        if event.GetText() in Snippet:
            self.insertSnippet(event.GetText())
            return 
        index = self.wordUnderCursor()
        textEdit = self.stcpage[self.notebook1.GetSelection()]
        for i in index: textEdit.DeleteBack()
        textEdit.InsertText(textEdit.CurrentPos, event.GetText()) 
        textEdit.WordRightEnd()
        self.recent = True
        
    #----------------------------------------------------------------------
    def insertSnippet(self, key):
        textEdit = self.stcpage[self.notebook1.GetSelection()]
        index = self.wordUnderCursor()
        for i in index: textEdit.DeleteBack()
        textEdit.InsertText(textEdit.CurrentPos, Snippet[key][1])
        for i in range(Snippet[key][0]): textEdit.CharRight()        
        self.recent = True
        
    #----------------------------------------------------------------------
    def keyEvent(self, event):
        #List of key to ignore

        if event.GetKeyCode() in [wx.WXK_UP,
                                  wx.WXK_DOWN,
                                  wx.WXK_SHIFT,
                                  wx.WXK_ALT,
                                  wx.WXK_RIGHT,
                                  wx.WXK_LEFT,
                                  wx.WXK_ESCAPE, 
                                  wx.WXK_INSERT,
                                  wx.WXK_NUMPAD_INSERT,
                                  wx.WXK_SPACE, 
                                  wx.WXK_BACK]:
            return
        
        if event.GetModifiers() in [wx.MOD_CONTROL,
                                    wx.MOD_ALT,
                                    wx.MOD_ALTGR,
                                    wx.MOD_CMD,
                                    wx.MOD_META,
                                    wx.MOD_SHIFT,
                                    wx.MOD_WIN]:
            return 
        
        
        textEdit = self.stcpage[self.notebook1.GetSelection()]  
        if textEdit.GetCurrentPos() == 0:
            textEdit.AutoCompCancel()
            return   
        index = self.wordUnderCursor()
        completers = self.keywordList + self.reservedword + Dictionary + Snippet.keys()
        completersFilter = []
        for i in completers:
            if i not in completersFilter: completersFilter.append(i)
        completersFilter.sort()
        items = []
        textEdit.AutoCompSetSeparator(ord("|"))
        for word in completersFilter:
            if word.lower().startswith(index.lower()): items.append(word)
        if len(items) > 0 and not self.recent: textEdit.AutoCompShow(0, "|".join(items))
        self.recent = False