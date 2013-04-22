#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Recursive wx.TreeCtrl for *.pde files.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	31/March/2012
    last release:	09/July/2012
    
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

from wxgui._trad import _

########################################################################
class Search():
    #----------------------------------------------------------------------
    def __initSearch__(self, IDE):
        self.IDE = IDE
        self.FindText = self.IDE.lat.searchCtrlSearch
        self.ReplaceText = self.IDE.lat.searchCtrlReplace
        self.ReplaceText.SetDescriptiveText("Replace")
        self.findIndex = -1
        #self.OnFind()
        
        self.IDE.Bind(wx.EVT_BUTTON, self.findnext, self.IDE.lat.buttonNext)  
        self.IDE.Bind(wx.EVT_BUTTON, self.findprev, self.IDE.lat.buttonPrev)
        self.IDE.Bind(wx.EVT_BUTTON, self.findnext, self.IDE.lat.buttonNext)  
        self.IDE.Bind(wx.EVT_BUTTON, self.findprev, self.IDE.lat.buttonPrev)
        self.IDE.Bind(wx.EVT_BUTTON, self.replacetext, self.IDE.lat.buttonReplace)  
        self.IDE.Bind(wx.EVT_BUTTON, self.replacealltext, self.IDE.lat.buttonReplaceAll)   
        self.IDE.Bind(wx.EVT_TEXT, self.updateFinds, self.FindText)
        
        self.IDE.Bind(wx.EVT_MENU, self.OnFind, self.IDE.menu.menuItemFind)
        self.IDE.Bind(wx.EVT_MENU, self.OnReplace, self.IDE.menu.menuItemReplace)     
        
    #----------------------------------------------------------------------
    def updateFinds(self, event):
        word = self.FindText.GetValue()
        if word != "": self.highLine(word, 0, False)
        
    #---------------------------------------------------------------------- 
    def OnFind(self,event=None):
        print "OK"
        if len(self.IDE.stcpage) > 0:
            textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
            sel = textEdit.GetSelectedText()
            if len(sel) > 0:
                self.FindText.SetFocus()
                self.FindText.SetValue(sel)
                
        self.IDE.lat.notebookLateral.SetSelection(2)
        self.IDE.lat.panelReplace.Hide()
        self.IDE.lat.m_staticText4.Hide()
        self.IDE.lat.searchCtrlReplace.Hide()			   
        self.FindText.SetFocus()
        self.IDE.updateIDE()		

    #----------------------------------------------------------------------
    def findprev(self,event):
        word = str(self.FindText.GetValue())
        result = self.findWord(word)
        
        if word == "" or result["count"] == 0: return False
        
        textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
        self.findIndex -= 1
        if self.findIndex < 0: self.findIndex = result["count"] - 1
        self.highLine(word, self.findIndex)
        
        self.IDE.lat.buttonReplace.Enable()
        self.IDE.lat.buttonReplaceAll.Enable()
        
        return True
		

    #----------------------------------------------------------------------
    def findnext(self,event):
        word = str(self.FindText.GetValue())
        result = self.findWord(word)
        
        if word == "" or result["count"] == 0: return False
        
        textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
        self.findIndex += 1
        if self.findIndex >= result["count"]: self.findIndex = -1
        self.highLine(word, self.findIndex)
        
        self.IDE.lat.buttonReplace.Enable()
        self.IDE.lat.buttonReplaceAll.Enable()
        
        return True

    #----------------------------------------------------------------------
    def OnReplace(self,event):
        if len(self.IDE.stcpage) > 0:
            textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
            sel = textEdit.GetSelectedText()
            if len(sel) > 0:
                self.FindText.SetFocus()
                self.FindText.SetValue(sel)
                self.ReplaceText.SetFocus()
                
        self.IDE.lat.notebookLateral.SetSelection(2)        
        self.IDE.lat.panelReplace.Show()
        self.IDE.lat.m_staticText4.Show()
        self.IDE.lat.searchCtrlReplace.Show()        
        #self.FindText.SetFocus()
        self.IDE.lat.buttonReplace.Disable()
        self.IDE.lat.buttonReplaceAll.Disable()
        #self.updateIDE()

    #----------------------------------------------------------------------
    def replacetext(self, event=None):
        word = str(self.FindText.GetValue())
        wordReplace = str(self.ReplaceText.GetValue())
        if word == "": return False
        textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
        textEdit.Clear()
        textEdit.InsertText(textEdit.CurrentPos, wordReplace)
        #self.findIndex -= 1
        #self.findnext(event)
        if not self.findnext(event):
            self.IDE.lat.buttonReplace.Disable()
            self.IDE.lat.buttonReplaceAll.Disable()
            return False
        return True

    #----------------------------------------------------------------------
    def replacealltext(self, event):
        textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
        word = str(self.FindText.GetValue())
        wordReplace = str(self.ReplaceText.GetValue())
        result = self.findWord(word)
        count = result["count"]
        
        plain = str(textEdit.GetTextUTF8())
        plain = plain.replace(word, wordReplace)
        
        pos = textEdit.CurrentPos
        
        textEdit.ClearAll()
        textEdit.AddText(plain)
        textEdit.GotoPos(pos)
        
        self.IDE.lat.searchReplaceInfo.SetLabel(_("Replaced %d matches in the file.") %count)


    #----------------------------------------------------------------------
    def findWord(self, word):
        if word == "": return 
        
        textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
        if self.IDE.lat.checkBox_sensitive.IsChecked():
            plain = str(textEdit.GetTextUTF8())
            word = str(word)
        else:
            plain = str(textEdit.GetTextUTF8()).lower()
            word = str(word).lower()
    
        count = plain.count(word)
        finds = [plain.find(word)]
        while finds[-1] != -1: finds.append(plain.find(word, finds[-1]+1))
        finds.pop(-1)
        
        
        result = {"word": word,
                  "count": len(finds),
                  "finds": finds,}
        
        self.IDE.lat.searchReplaceInfo.SetLabel(_("Finded %d matches in the file.") %len(finds))
        
        return result
    
    
    #----------------------------------------------------------------------
    def highLine(self, word, findIndex, focus=True):
        textEdit = self.IDE.stcpage[self.IDE.notebookEditor.GetSelection()]
        result = self.findWord(word)
        if result["count"] > 0:
            line = textEdit.LineFromPosition(result["finds"][findIndex])
            color = self.IDE.getColorConfig("Highligh", "searchreplace", [255, 250, 70])   
            self.IDE.highlightline(line, color)
            if focus: self.IDE.focus()
            textEdit.SetSelection(result["finds"][findIndex], result["finds"][findIndex]+len(word))