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

import wx, re
import sys, os

########################################################################
class File:
    #----------------------------------------------------------------------
    def __initDockFile__(self):
        self.lateralFunc = self.lat.listCtrlFunc
        self.lateralVars = self.lat.listCtrlVars
        self.lateralDefi = self.lat.listCtrlDefi
        
        self.Bind(wx.EVT_LIST_ITEM_ACTIVATED, self.moveToFunc, self.lateralFunc)
        self.Bind(wx.EVT_LIST_ITEM_ACTIVATED, self.moveToVar, self.lateralVars)
        self.Bind(wx.EVT_LIST_ITEM_ACTIVATED, self.moveToDefi, self.lateralDefi)
    
        self.lateralVars.InsertColumn(col=0, format=wx.LIST_FORMAT_LEFT, heading='Name', width=-1)
        self.lateralVars.InsertColumn(col=1, format=wx.LIST_FORMAT_LEFT, heading='Type', width=-1)
        self.lateralVars.InsertColumn(col=2, format=wx.LIST_FORMAT_LEFT, heading='Line', width=40)
        #self.lateralVars.InsertColumn(col=3, format=wx.LIST_FORMAT_LEFT, heading='In function', width=1000)
    
        self.lateralFunc.InsertColumn(col=0, format=wx.LIST_FORMAT_LEFT, heading='Name', width=-1) 
        self.lateralFunc.InsertColumn(col=1, format=wx.LIST_FORMAT_LEFT, heading='Return', width=-1) 
        self.lateralFunc.InsertColumn(col=2, format=wx.LIST_FORMAT_LEFT, heading='Line', width=40)
        self.lateralFunc.InsertColumn(col=3, format=wx.LIST_FORMAT_LEFT, heading='Parameters', width=1000)
        
        self.lateralDefi.InsertColumn(col=0, format=wx.LIST_FORMAT_LEFT, heading='Directive', width=130) 
        self.lateralDefi.InsertColumn(col=1, format=wx.LIST_FORMAT_LEFT, heading='Name', width=130) 
        self.lateralDefi.InsertColumn(col=2, format=wx.LIST_FORMAT_LEFT, heading='Value', width=130) 
        self.lateralDefi.InsertColumn(col=3, format=wx.LIST_FORMAT_LEFT, heading='Line', width=1000)
        

    #----------------------------------------------------------------------
    def moveToVar(self, event=None):
        self.allVars.reverse()
        self.highlightline(int(self.allVars[event.GetIndex()][2])-1, "#A9D1FF")
        self.allVars.reverse()
        self.focus()
        
    #----------------------------------------------------------------------
    def moveToFunc(self, event=None):
        self.allFunc.reverse()
        self.highlightline(int(self.allFunc[event.GetIndex()][2])-1, "#A9D1FF")
        self.allFunc.reverse()
        self.focus()
        
    #----------------------------------------------------------------------
    def moveToDefi(self, event=None):
        self.allDefi.reverse()
        self.highlightline(int(self.allDefi[event.GetIndex()][3])-1, "#A9D1FF")
        self.allDefi.reverse()
        self.focus()    
        
        
    #----------------------------------------------------------------------
    def addVarInListCtrl(self, index, var):
        self.lateralVars.InsertStringItem(0, var[0])        
        self.lateralVars.SetStringItem(0, 1, var[1])         
        self.lateralVars.SetStringItem(0, 2, var[2])         
        #self.lateralVars.SetStringItem(0, 3, var[3])   
        self.lateralVars.SetItemData(0, 1)
        
    #----------------------------------------------------------------------
    def addFuncInListCtrl(self, index, var):
        self.lateralFunc.InsertStringItem(0, var[0])        
        self.lateralFunc.SetStringItem(0, 1, var[1])         
        self.lateralFunc.SetStringItem(0, 2, var[2])         
        self.lateralFunc.SetStringItem(0, 3, var[3])   
        self.lateralFunc.SetItemData(0, 1)
        
    #----------------------------------------------------------------------
    def addDefiInListCtrl(self, index, var):
        self.lateralDefi.InsertStringItem(0, var[0])            
        self.lateralDefi.SetStringItem(0, 1, var[1])         
        self.lateralDefi.SetStringItem(0, 2, var[2])        
        self.lateralDefi.SetStringItem(0, 3, var[3])         
        self.lateralDefi.SetItemData(0, 1)

    #----------------------------------------------------------------------
    def update_dockFiles(self, event=None):
        if len(self.stcpage) < 1:
            self.lateralVars.DeleteAllItems()
            self.lateralFunc.DeleteAllItems()
            if event: event.Skip()
            return 
            
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        text = textEdit.GetText().split("\n")
        
        tipos="int|float|char|BOOL|short|long|double|"\
            "byte|word|struct|union|enum|void|u8"        
        
        ReFunction = "[\s]*(unsigned)*[\s]*(" + tipos + ")[*]*[\s]*([\w]+)[\s]*\((.*)\)"
        ReVariable = "[\s]*(unsigned)*[\s]*(" + tipos + ")[\s]*(.*);"
        ReDefines = "[\s]*#(define|ifndef|endif)[ ]+([\S]*)[ ]+([\S]*)"
        ReInclude = "[\s]*#include[ ]+<[\s]*([\S]*)[\s]*>"

        self.allVars = []
        self.allFunc = []
        self.allDefi = []
        currentFunction = "None"
        
        def getVar(var, tipo):
            if "=" in var: var = var[:var.find("=")]
            if "[" in var:
                var = var[:var.find("[")]
                if tipo != "char": tipo = "vect"
            return var.replace(" ", ""), tipo
        
        def getParam(param):
            param = param.split(",")
            ret = []
            for par in param:
                reg = re.match(ReVariable, par)
                
        count = 1
        for linea in text:
            if "//" in linea:
                linea = linea[:linea.find("//")]
            
            reg1 = re.match(ReFunction, linea)
            if reg1 != None:
                currentFunction = reg1.group(3)
                self.allFunc.append([currentFunction,
                                    reg1.group(2),
                                    str(count),
                                    reg1.group(4)])
                
                                    
            reg2 = re.match(ReVariable, linea)
            if reg2 != None:
                tipo = reg2.group(2)
                cont = reg2.group(3)
                if "{" in cont:
                    a = cont.find("{")
                    cont = cont[:a]
                if "}" in cont:
                    b = cont.find("}")
                    cont = cont+ cont[b:]
                cont = cont.split(",")
                self.allVars.extend([[getVar(var, reg2.group(2))[0],
                                    getVar(var, reg2.group(2))[1],
                                    str(count)] for var in cont])
                
                
            reg3 = re.match(ReDefines, linea)
            if reg3 != None:
                self.allDefi.append([reg3.group(1),
                                     reg3.group(2),
                                     reg3.group(3),
                                     str(count)])
                
            reg4 = re.match(ReInclude, linea)
            if reg4 != None:
                self.allDefi.append(["include",
                                     reg4.group(1),
                                     "",
                                     str(count)])
                
            count += 1
                
        count = 0
        self.allVars.reverse()
        self.lateralVars.DeleteAllItems()
        for var in self.allVars:
            self.addVarInListCtrl(count, var)
            count += 1
            
        count = 0
        self.allFunc.reverse()
        self.lateralFunc.DeleteAllItems()
        for var in self.allFunc:
            self.addFuncInListCtrl(count, var)
            count += 1
            
        count = 0
        self.allDefi.reverse()
        self.lateralDefi.DeleteAllItems()
        for var in self.allDefi:
            self.addDefiInListCtrl(count, var)
            count += 1 
            
        if event: event.Skip()       
    
