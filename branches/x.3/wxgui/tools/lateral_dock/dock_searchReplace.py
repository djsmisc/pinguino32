#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Recursive wx.TreeCtrl for *.pde files.

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

########################################################################
class Search():
    #----------------------------------------------------------------------
    def __initSearch__(self):
        self.FindText = self.lat.searchCtrlSearch
        self.ReplaceText = self.lat.searchCtrlReplace
        self.ReplaceText.SetDescriptiveText("Replace")
        self.OnFind()
        
     #---------------------------------------------------------------------- 
    def OnFind(self,event=None):
        self.lat.notebookLateral.SetSelection(2)
        self.lat.panelReplace.Hide()
        self.lat.m_staticText4.Hide()
        self.lat.searchCtrlReplace.Hide()
        self.Bind(wx.EVT_BUTTON, self.findnext, self.lat.buttonNext)  
        self.Bind(wx.EVT_BUTTON, self.findprev, self.lat.buttonPrev)			   
        self.FindText.SetFocus()
        self.updateIDE()		

    #----------------------------------------------------------------------
    def findprev(self,event):
        chaine=self.FindText.GetString(0,self.FindText.GetLastPosition())
        trouve, position=self.find(chaine,0)
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]		
        if trouve!=-1:
            self.highlightline(trouve,'yellow')
            self.focus()
            textEdit.SetSelectionStart(position)
            textEdit.SetSelectionEnd(position+len(chaine))
            self.lat.buttonReplace.Enable()
            self.lat.buttonReplaceAll.Enable()			

    #----------------------------------------------------------------------
    def findnext(self,event):
        chaine=self.FindText.GetString(0,self.FindText.GetLastPosition())
        trouve, position=self.find(chaine,1)
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        if trouve!=-1:
            self.highlightline(trouve,'yellow')
            self.focus()
            textEdit.SetSelectionStart(position)
            textEdit.SetSelectionEnd(position+len(chaine))
            self.lat.buttonReplace.Enable()
            self.lat.buttonReplaceAll.Enable()	
        return trouve

    #----------------------------------------------------------------------
    def OnReplace(self,event):
        self.lat.notebookLateral.SetSelection(2)        
        self.lat.panelReplace.Show()
        self.lat.m_staticText4.Show()
        self.lat.searchCtrlReplace.Show()        
        self.Bind(wx.EVT_BUTTON, self.findnext, self.lat.buttonNext)  
        self.Bind(wx.EVT_BUTTON, self.findprev, self.lat.buttonPrev)
        self.Bind(wx.EVT_BUTTON, self.replacetext, self.lat.buttonReplace)  
        self.Bind(wx.EVT_BUTTON, self.replacealltext, self.lat.buttonReplaceAll)
        self.FindText.SetFocus()
        self.lat.buttonReplace.Disable()
        self.lat.buttonReplaceAll.Disable()
        self.updateIDE()


    #----------------------------------------------------------------------
    def replacetext(self, event=None):
        word = self.FindText.GetString(0, self.FindText.GetLastPosition())
        wordReplace = self.ReplaceText.GetString(0, self.ReplaceText.GetLastPosition())
        print word, wordReplace
        if word == "": return False
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        textEdit.Clear()
        textEdit.InsertText(textEdit.CurrentPos, wordReplace)
        if self.findnext(event) == -1:
            self.gotostart()
            self.lat.buttonReplace.Disable()
            self.lat.buttonReplaceAll.Disable()
            return False
        return True

    #----------------------------------------------------------------------
    def replacealltext(self, event):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        self.gotostart()
        self.findnext(event)
        cont = 1
        while self.replacetext(): cont += 1
        self.lat.searchReplaceInfo.SetLabel("Replaced %d matches in the file." %cont)
