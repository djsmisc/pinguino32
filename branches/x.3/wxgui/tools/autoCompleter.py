#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
	autoCompleter

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

########################################################################
class autoCompleter:
    #----------------------------------------------------------------------
    def __initCompleter__(self):
        """"""
        
    #----------------------------------------------------------------------
    def inserted(self,event): 
        index=self.wordUnderCursor()
        textEdit=self.editor.stcpage[self.editor.GetSelection()]
        for i in index: textEdit.DeleteBack()
        textEdit.AppendText(event.GetText())
        textEdit.AppendText(" ")
        for i in range(4): textEdit.WordRightEnd()
        textEdit.AutoCompCancel()
        
    #----------------------------------------------------------------------
    def keyEvent(self,event):
        textEdit=self.editor.stcpage[self.editor.GetSelection()]  
        if textEdit.GetCurrentPos()==0:
            textEdit.AutoCompCancel()
            return   
        index=self.wordUnderCursor()
        completers=self.keywordList[:]
        completers.sort()
        items=[]
        for word in completers:
            if word.lower().startswith(index.lower()): items.append(word)
        if len(items)>0: textEdit.AutoCompShow(0," ".join(items))
       
             
    #----------------------------------------------------------------------
    def hideCompleter(self):
        """"""
        textEdit=self.editor.stcpage[self.editor.GetSelection()]  
        textEdit.AutoCompCancel()
        