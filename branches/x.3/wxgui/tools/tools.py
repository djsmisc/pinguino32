#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Tools.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	03/February/2012
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

import wx, re, webbrowser, threading, serial, locale
from autoCompleter import autoCompleter
from keywords import functionsHelp
from debugger import Debugger
from lateral_dock import File, Documents, Search


from dic import Dictionary, Snippet

########################################################################
class Tools(Documents, Debugger, File, Search, autoCompleter):
    #----------------------------------------------------------------------
    def initTools(self):
        self.updateIDE()
        self.__initDocuments__()
        self.__initCompleter__()
        self.__initDebugger__()
        self.__initDockFile__()
        self.__initSearch__()
        
        self.lat.notebookLateral.SetSelection(0)   

        if locale.getdefaultlocale()[0][:2] == "es":
            self.wikiDoc = "http://www.pinguino.org.ve/wiki/index.php?title="
        else: self.wikiDoc = "http://wiki.pinguino.cc/index.php/"
        
    
    #----------------------------------------------------------------------
    def contexMenuTools(self, event):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        menu = wx.Menu()
        self._initIDs_(self.stcpage[self.notebookEditor.GetSelection()])

        word=self.wordUnderCursor(True)

        if word in self.keywordList:
            self.Bind(wx.EVT_MENU,
                      lambda x:webbrowser.open(self.wikiDoc+word),
                      id=self.popupIDhelp1)
            self.Bind(wx.EVT_MENU,
                      lambda x:self.OnKeyword(keyword=word),
                      id=self.popupIDhelp2)           

            help = wx.Menu()
            help.Append(self.popupIDhelp1, self.translate("Open wiki page in the web browser"))
            help.Append(self.popupIDhelp2, self.translate("Read description"))

            menu.AppendMenu(self.popupIDhelp0, word, help)          
            menu.AppendSeparator()

        menu.Append(self.popupID8, self.translate("Comment/Uncomment"))
        menu.AppendSeparator()

        menu.Append(self.popupID1, self.translate("Undo"))
        menu.Append(self.popupID2, self.translate("Redo"))
        menu.AppendSeparator()
        menu.Append(self.popupID3, self.translate("Cut"))
        menu.Append(self.popupID4, self.translate("Copy"))
        menu.Append(self.popupID5, self.translate("Paste"))
        menu.Append(self.popupID6, self.translate("Clear"))
        menu.AppendSeparator()
        menu.Append(self.popupID7, self.translate("Clear All"))

        self.PopupMenu(menu)
        menu.Destroy()
        
        

    #----------------------------------------------------------------------
    def wordUnderCursor(self,function=False):

        line,pos=self.stcpage[self.notebookEditor.GetSelection()].CurLine

        so=line.split(" ")
        l=0
        for word in so:
            l+=len(word)+1
            if pos<l: break

        pos=len(word)-l+pos
        if function:
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
        self.popupID8 = wx.NewId()
        self.popupIDhelp0 = wx.NewId()
        self.popupIDhelp1 = wx.NewId()
        self.popupIDhelp2 = wx.NewId()

        self.Bind(wx.EVT_MENU, lambda x:textEdit.Undo(), id=self.popupID1)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Redo(), id=self.popupID2)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Cut(), id=self.popupID3)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Copy(), id=self.popupID4)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Paste(), id=self.popupID5)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.Clear(), id=self.popupID6)
        self.Bind(wx.EVT_MENU, lambda x:textEdit.ClearAll(), id=self.popupID7)
        self.Bind(wx.EVT_MENU, lambda x:self.comentar(), id=self.popupID8)

    #----------------------------------------------------------------------
    def OnKeyword(self, event=None, keyword=None):
        app = wx.PySimpleApp(0)
        wx.InitAllImageHandlers()
        frame_1 = functionsHelp(None)
        frame_1.__initfunctionsHelp__(None, self.keywordList, keyword)
        app.SetTopWindow(frame_1)
        frame_1.CenterOnParent()
        frame_1.Show()
        app.MainLoop()
        self.setNormalCursor()

    #----------------------------------------------------------------------
    def comentar(self, event=None):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        lineStart, lineEnd = map(textEdit.LineFromPosition,textEdit.GetSelection())
        countLines = lineEnd - lineStart
        posLineStart, posLineEnd = map(textEdit.PositionFromLine, [lineStart, lineEnd+1])
        textEdit.SetSelection(posLineStart, posLineEnd)
        selected = textEdit.GetSelectedText()
        if selected.startswith("//"): comented = selected.replace("//","")
        else: comented = "//" + selected.replace("\n","\n//", countLines)
        textEdit.Clear()
        textEdit.InsertText(textEdit.CurrentPos, comented)
        textEdit.SetSelection(*map(textEdit.PositionFromLine, [lineStart, lineEnd]))

    #----------------------------------------------------------------------
    def updateStatusBar(self, event=None):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        fila = str(textEdit.CurrentLine).rjust(3, "0")
        columna = str(textEdit.GetColumn(textEdit.CurrentPos)).rjust(3, "0")
        self.statusBarEditor.SetStatusText(number=1, text="Line %s - Col %s" %(fila, columna))
        event.Skip()

    #----------------------------------------------------------------------
    def updateFuntionsChoice(self, new=False):
        sel = self.notebookEditor.GetSelection()
        
        if sel >= 0:
            try:
                choice = []
                textEdit = self.stcpage[self.notebookEditor.GetSelection()]
    
                funciones = self.readUserFuntions(textEdit.GetText().split("\n"))
                self.sheetFunctions[self.notebookEditor.GetSelection()] = funciones
    
                self.setTreeFunctions(funciones.keys())
                
            except wx._core.PyDeadObjectError: #The page was deleted
                pass
            
        else: self.setTreeFunctions([])
        
            

    #----------------------------------------------------------------------        
    def readUserFuntions(self, text):
        funciones = {}   
        tipos="int|float|char|BOOL|short|long|double|"\
            "byte|word|struct|union|enum|void"           
        for linea in text:
            if re.match("[ ]*//",linea)==None:
                reg=re.match("[ ]*(unsigned)*[ ]*(%s)[*]*[ ]*([^ ]+)[ ]*\(.*\)" %tipos,linea)
                if reg!=None: funciones[str(reg.group(3))] = linea  
        return funciones

        
    ##----------------------------------------------------------------------
    #def OnAutoCompleter(self):
        #print "hola"
        #app = wx.PySimpleApp(0)
        #wx.InitAllImageHandlers()
        #app = wx.PySimpleApp(0)
        #wx.InitAllImageHandlers()
        #self.AutoCompleter = autoCompleter(self)
        #app.SetTopWindow(frame_1)
        #self.AutoCompleter.Hide()
        #app.MainLoop()
        #print "hola"
        
        
    ##----------------------------------------------------------------------
    #def OnAutoCompleter(self, event=None):
        #textEdit = self.stcpage[self.notebookEditor.GetSelection()]
    
        #pos = textEdit.PointFromPosition(textEdit.CurrentPos) + \
              #self.Position + \
              #self.m_panel1.Position + \
              #wx.Point(0, self.toolbar.Size[1]) + \
              #wx.Point(0, self.notebookEditor.Size[1]) - \
              #wx.Point(0, textEdit.Size[1]) + \
              #wx.Point(0, self.MenuBar.Size[1]) + \
              #wx.Point(25, 0)
        
        
        #app = wx.PySimpleApp(0)
        #wx.InitAllImageHandlers()
        #self.AutoCompleter = autoCompleter(self)
        #app.SetTopWindow(self.AutoCompleter)
        #self.AutoCompleter.SetPosition(pos)        
        #self.AutoCompleter.Show()
        #app.MainLoop()
        
        
    #----------------------------------------------------------------------
    def insertSnippet(self, key):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        index = self.wordUnderCursor()
        for i in index: textEdit.DeleteBack()
        textEdit.InsertText(textEdit.CurrentPos, Snippet[key][1])
        for i in range(Snippet[key][0]): textEdit.CharRight()        
        self.recent = True 
        
        
