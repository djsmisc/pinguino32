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

########################################################################
class File:
    #----------------------------------------------------------------------
    def __initDockFile__(self):
        self.treeFunctions = self.lat.treeCtrlFunctions
        self.Bind(wx.EVT_TREE_SEL_CHANGED, self.OnSelTreeChanged, self.treeFunctions)
        self.Bind(wx.EVT_TREE_ITEM_ACTIVATED, self.moveToFunction, self.treeFunctions)
        
    #----------------------------------------------------------------------
    def setTreeFunctions(self, functions):
        self.treeFunctions.DeleteAllItems()
        root = self.treeFunctions.AddRoot("User Functions")
        self.treeFunctions.SetPyData(root, None) 
        for func in functions:
            filePde = self.treeFunctions.AppendItem(root, func)
            self.treeFunctions.SetPyData(filePde, None)    
        self.treeFunctions.Expand(root)
        
    #--------------------------------------------------------------------------
    def OnSelTreeChanged(self, event):
        self.item = event.GetItem()
        event.Skip()    
        
    #----------------------------------------------------------------------
    def moveToFunction(self, event):
        function=self.treeFunctions.GetItemText(self.item)
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        if function == "User Functions": return

        if function == "(top)":
            textEdit.GotoLine(0)  

        elif function == "(end)":
            textEdit.GotoLine(textEdit.GetLineCount())

        else:
            linea = self.sheetFunctions[self.notebookEditor.GetSelection()][function]
            trouve = self.getLineOfText(linea.replace("\n", ""))
            self.highlightline(trouve, "#A9D1FF")
            self.focus()
    