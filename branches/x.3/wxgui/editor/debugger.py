#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    USB debugger output.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	03/March/2012
    last release:	11/March/2012
    
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

import wx, serial, threading, sys

EVT_RESULT_DEBUG_ID = wx.NewId()

def EVT_RESULT_DEBUG(win, func):
    win.Connect(-1, -1, EVT_RESULT_DEBUG_ID, func)

class ResultEventDebug(wx.PyEvent):
    def __init__(self, data):
        wx.PyEvent.__init__(self)
        self.SetEventType(EVT_RESULT_DEBUG_ID)
        self.data = data

########################################################################
class Debugger:
    #----------------------------------------------------------------------
    def __initDebugger__(self):
        
        EVT_RESULT_DEBUG(self, self.updateDebgging)
        self.history = []
        self.historyIndex = 0

        if sys.platform == 'darwin':
            """"""
            #self.CDC_NAME_PORT = "???" 

        elif sys.platform == 'win32':
            self.CDC_NAME_PORT = "COM%d"
        else:
            self.CDC_NAME_PORT = "/dev/ttyACM%d"
        
    #----------------------------------------------------------------------
    def setDebugger(self, event=None, mode=None):
        if mode == None:
            self.debuggingLine.Hide()
            #self.logwindow.Clear()
            self.statusBarEditor.SetStatusText(number=3, text=self.curBoard.name)
            self.updateIDE()
            return 
        
        self.logwindow.Clear()
        self.debuggingLine.Show()
        self.debuggingLine.SetFocus()
        self.debuggingLine.SetSelection(3, 3)
        self.updateIDE()        
        
        debug = threading.Thread(target=self.debuggingThread, args=(mode, ))
        debug.start()
        

    #----------------------------------------------------------------------
    def debuggingThread(self, mode):
        if mode == "CDC": self.debugCDC()
    
    #----------------------------------------------------------------------
    def updateDebgging(self, event):
        if event.data == None:
            self.setDebugger(mode=None)
            return 
        if len(event.data) > 0:
            self.logwindow.SetInsertionPoint(len(self.logwindow.Value))
            if self.logwindow.GetLineText(self.logwindow.NumberOfLines) != "": self.logwindow.WriteText("\n")
            self.logwindow.WriteText("   "+event.data)
        
    #----------------------------------------------------------------------
    def sendDebugging(self, event):
        if event.GetKeyCode() in [wx.WXK_NUMPAD_ENTER,
                                  wx.WXK_RETURN]:
        
            line = str(self.debuggingLine.Value)
            if line.startswith(">>>"): line = line.replace(">>>", "")
            self.debugOutMessage = line
            self.logwindow.SetInsertionPoint(len(self.logwindow.Value))
            if self.logwindow.GetLineText(self.logwindow.NumberOfLines) != "": self.logwindow.WriteText("\n")
            self.logwindow.WriteText(">>>"+line)
            self.debuggingLine.Clear()
            self.debuggingLine.SetValue(">>>")
            self.debuggingLine.SetInsertionPoint(3)
            self.history.append(line)
            self.historyIndex = 0
            

        elif event.GetKeyCode() == wx.WXK_UP:
            self.historyIndex += 1
            if self.historyIndex > len(self.history): self.historyIndex = 0
            self.debuggingLine.Clear()
            self.debuggingLine.SetValue(">>>"+self.history[-self.historyIndex])
            self.debuggingLine.SetInsertionPoint(len(self.debuggingLine.Value))            

        elif event.GetKeyCode() == wx.WXK_DOWN:
            self.historyIndex -= 1
            if self.historyIndex < 0: self.historyIndex = len(self.history)
            self.debuggingLine.Clear()
            self.debuggingLine.SetValue(">>>"+self.history[-self.historyIndex])
            self.debuggingLine.SetInsertionPoint(len(self.debuggingLine.Value)) 
           
        
    #----------------------------------------------------------------------
    def debugCDC(self):
        for i in range(20):
            try:
                pinguino = serial.Serial(self.CDC_NAME_PORT %i, timeout=1)
                self.logwindow.WriteText("Connected: "+self.CDC_NAME_PORT %i+"\n")
                break
            except: pass
            
        while not self.menu.menuItemDebugNone.IsChecked():
            try:
                if self.debugOutMessage != None:
                    pinguino.write(self.debugOutMessage)
                    self.debugOutMessage = None
                else:
                    line = pinguino.readline()
                    wx.PostEvent(self, ResultEventDebug(line)) 
                    
            except UnboundLocalError:
                self.logwindow.WriteText("No device connected!")
                self.menu.menuItemDebugNone.Check()
                wx.PostEvent(self, ResultEventDebug(None)) 
                
            except serial.serialutil.SerialException:
                self.logwindow.WriteText("\ndevice disconnected!")
                self.menu.menuItemDebugNone.Check()
                wx.PostEvent(self, ResultEventDebug(None))            
                
            if self.closing:
                pinguino.close()
                break
            