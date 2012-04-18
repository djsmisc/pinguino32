#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Auto-completer widget with icons suport (specially made for PinguinoIDE).

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	03/April/2012
    last release:	03/April/2012
    
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

import wx, sys, os
from dic import Snippet, Dictionary

ICONS_COMPLETER_DIR = os.path.join(sys.path[0], "theme", "icons_autocompleter")

########################################################################
class AutoCompleter():
    
    #----------------------------------------------------------------------
    def __initCompleter__(self, parent, index):
        self.IDE = parent
        self.index = index
        self.CharsCount = 1
        self.MaxItemsCount = 10
        
        if not len(self.index) > self.CharsCount: self.Close()

        self.listCtrlAutocompleter.InsertColumn(col=0, format=wx.LIST_FORMAT_LEFT, heading='Completers', width=-1)
        self.listCtrlAutocompleter.SetColumnWidth(0, self.Size[0])
        self.il = wx.ImageList(14, 14)
        self.listCtrlAutocompleter.SetImageList(self.il, wx.IMAGE_LIST_SMALL)
        self.listCtrlAutocompleter.SetFocus()
        
            
        self.Bind(wx.EVT_LIST_ITEM_ACTIVATED, self.activated, self.listCtrlAutocompleter)
        self.listCtrlAutocompleter.Bind(wx.EVT_CHAR, self.onCharEvent)      
        self.setItems()
        
        
    #----------------------------------------------------------------------
    def onCharEvent(self, event):
        textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
        
        if event.GetKeyCode() in [wx.WXK_DOWN,
                                  wx.WXK_UP]:
            event.Skip()
            return
            
        
        if event.GetKeyCode() in [wx.WXK_ALT,
                                  #wx.WXK_SHIFT,
                                  #wx.WXK_RIGHT,
                                  #wx.WXK_LEFT,
                                  wx.WXK_ESCAPE, 
                                  wx.WXK_INSERT,
                                  wx.WXK_NUMPAD_INSERT,
                                  wx.WXK_SPACE, 
                                  #wx.WXK_BACK,
                                  wx.WXK_RETURN, 
                                  ]:
            self.Close()
            event.Skip()
            return
      
        if event.KeyCode == wx.WXK_BACK:
            textEdit.DeleteBack()
            self.index = self.index[:-1]
            if len(self.index) > self.CharsCount:
                self.setItems()
            else: self.Close()
            event.Skip()
            return
        
        if event.KeyCode == wx.WXK_RETURN: return        
        
        try:
            if chr(event.GetKeyCode()).isalnum() or chr(event.GetKeyCode()) == ".":
                textEdit.AddText(chr(event.GetKeyCode()))
        except: pass
        
        self.index = self.IDE.wordUnderCursor(True)
        
        if len(self.index) > self.CharsCount:
            self.setItems()
        else: self.Close()
        
        event.Skip()
        

    #----------------------------------------------------------------------
    def addItem(self, name, icon):
        self.listCtrlAutocompleter.InsertImageStringItem(0, name, self.GetIconCompleter(icon))
        self.listCtrlAutocompleter.SetItemData(0, 1)  

    #----------------------------------------------------------------------
    def GetIconCompleter(self, name):
        pn = os.path.normpath(os.path.join(ICONS_COMPLETER_DIR, "%s.png" %name))
        bitmap = wx.Bitmap(pn, wx.BITMAP_TYPE_PNG)        
        return self.il.Add(bitmap)
 
        
    #----------------------------------------------------------------------
    def activated(self, event=None):
        if event.GetText() in Snippet:
            self.IDE.insertSnippet(event.GetText())
            self.Close()
            return 
        index = self.index
        textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
        for i in index: textEdit.DeleteBack()
        textEdit.InsertText(textEdit.CurrentPos, event.GetText())
        
        #Set cursor position at the last word (dot is a word)
        words = 1
        if "." in event.GetText(): words = 3
        for i in range(words): textEdit.WordRightEnd()
        
        #Add "()" to funtions
        if event.GetText() in self.IDE.keywordList:
            textEdit.InsertText(textEdit.CurrentPos, "()")
            textEdit.CharRight()
            
        self.Close()
            
    #----------------------------------------------------------------------
    def setItems(self):  
        index = self.index
        completers, icons = self.IDE.getCompleters()
        #completersFilter = []
        #for i in completers:
            #if i not in completersFilter: completersFilter.append(i)
        #completersFilter.sort()
        items = []
        for word in completers:
            #print word
            if word.lower().startswith(index.lower()): items.append(word)
            
            
        self.SetPosition(self.getPositionCompleter())
        self.listCtrlAutocompleter.DeleteAllItems()
        #print items
        if len(items) > 0:
            for item in items:
                try: icon = icons[item]
                except KeyError: icon = "none"
                self.addItem(item, icon)
            self.listCtrlAutocompleter.Select(0)
            self.setMinimunSize()
            self.Show()
        else: self.Close()
                    
    #----------------------------------------------------------------------
    def getPositionCompleter(self):
        #if os.name == "posix":
        textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
        points = [textEdit.PointFromPosition(textEdit.CurrentPos),
                  self.IDE.Position,
                  self.IDE.panelEditor.Position,
                  #wx.Point(0, self.IDE.notebookEditor.Size[1]),
                  #wx.Point(0, textEdit.Size[1]),
                  wx.Point(25, 30)]
        pos = wx.Point(0, 0)
        for i in points: pos += i
        try: pos = pos + wx.Point(0, self.IDE.toolbar.Size[1])
        except wx._core.PyDeadObjectError: pass
        if os.name == "posix": pos += wx.Point(0, self.IDE.MenuBar.Size[1])
        return pos
    
    #----------------------------------------------------------------------
    def setMinimunSize(self):
        count = self.listCtrlAutocompleter.ItemCount
        if os.name == "posix":
            scrollH = 0
        elif os.name == "nt":
            scrollH = 10
        w, h = self.listCtrlAutocompleter.GetItemSpacing()
        h = (h / 2) + 1   
        if count > self.MaxItemsCount: self.SetSizeWH(-1, self.MaxItemsCount*h)
        else: self.SetSizeWH(-1, count*h + scrollH)
            
            
            
