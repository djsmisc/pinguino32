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
        """"""
        
    #----------------------------------------------------------------------
    def inserted(self, event): 
        if event.GetText() in Snippet:
            self.insertSnippet(event.GetText())
            return 
        index = self.wordUnderCursor()
        textEdit = self.editor.stcpage[self.editor.GetSelection()]
        for i in index: textEdit.DeleteBack()  #eliminar indice
        textEdit.InsertText(textEdit.CurrentPos, event.GetText()+" ")  #insertar completado + espacio
        textEdit.WordRightEnd()  #avanza hasta la palabra
        textEdit.CharRight()  #avanza un espacio
        textEdit.AutoCompCancel()  #se oculta ventana de autocompletado
        
    #----------------------------------------------------------------------
    def insertSnippet(self, key):
        textEdit = self.editor.stcpage[self.editor.GetSelection()]
        index = self.wordUnderCursor()
        for i in index: textEdit.DeleteBack()
        textEdit.InsertText(textEdit.CurrentPos, Snippet[key][1])
        for i in range(Snippet[key][0]): textEdit.CharRight()        
        textEdit.AutoCompCancel()
        
    #----------------------------------------------------------------------
    def keyEvent(self, event):
        
        #List of key to ignore
        if event.GetKeyCode() in [wx.WXK_UP,
                                  wx.WXK_DOWN,
                                  wx.WXK_SHIFT,
                                  wx.WXK_ALT,
                                  wx.WXK_RIGHT,
                                  wx.WXK_LEFT,
                                  wx.WXK_ESCAPE]:
            return 
        
        textEdit = self.editor.stcpage[self.editor.GetSelection()]  
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
        if len(items) > 0: textEdit.AutoCompShow(0, "|".join(items))
        