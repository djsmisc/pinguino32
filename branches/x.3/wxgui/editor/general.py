#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    General methos to Pinguino IDE.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	02/April/2012
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

import wx, re
from dic import Snippet, Autocompleter
from wxgui._ import _

########################################################################
class General:

    #----------------------------------------------------------------------
    def insertSnippet(self, key):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        index = self.wordUnderCursor()
        for i in index: textEdit.DeleteBack()
        textEdit.InsertText(textEdit.CurrentPos, Snippet[key][1])
        for i in range(Snippet[key][0]): textEdit.CharRight()        
        self.recent = True
        
    #----------------------------------------------------------------------
    def updateStatusBar(self, event=None):
        self.findIndex = -1
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        fila = str(textEdit.CurrentLine).rjust(3, "0")
        columna = str(textEdit.GetColumn(textEdit.CurrentPos)).rjust(3, "0")
        self.statusBarEditor.SetStatusText(number=1, text="Line %s - Col %s" %(fila, columna))
        event.Skip()

    
    ##----------------------------------------------------------------------        
    #def readUserFuntions(self, text):
        #funciones = {}   
        #tipos="int|float|char|BOOL|short|long|double|"\
            #"byte|word|struct|union|enum|void"           
        #for linea in text:
            #if re.match("[ ]*//",linea)==None:
                #reg=re.match("[ ]*(unsigned)*[ ]*(%s)[*]*[ ]*([^ ]+)[ ]*\(.*\)" %tipos,linea)
                #if reg!=None: funciones[str(reg.group(3))] = linea  
        #return funciones

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
            help.Append(self.popupIDhelp1, _("Open wiki page in the web browser"))
            help.Append(self.popupIDhelp2, _("Read description"))

            menu.AppendMenu(self.popupIDhelp0, word, help)          
            menu.AppendSeparator()

        menu.Append(self.popupID8, _("Comment/Uncomment"))
        menu.AppendSeparator()

        menu.Append(self.popupID1, _("Undo"))
        menu.Append(self.popupID2, _("Redo"))
        menu.AppendSeparator()
        menu.Append(self.popupID3, _("Cut"))
        menu.Append(self.popupID4, _("Copy"))
        menu.Append(self.popupID5, _("Paste"))
        menu.Append(self.popupID6, _("Clear"))
        menu.AppendSeparator()
        menu.Append(self.popupID7, _("Clear All"))

        self.PopupMenu(menu)
        menu.Destroy()
        
        
    ##----------------------------------------------------------------------
    #def updateLateral(self, event=None):
        #self.update_dockFiles()
        
        
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
    def OnLeftCklick(self, event):
        """"""
        try:
            self.AutoCompleter.Close()
        except:
            pass
             
        event.Skip()
        
        

    #----------------------------------------------------------------------
    def insertSnippet(self, key):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        index = self.wordUnderCursor()
        for i in index: textEdit.DeleteBack()
        textEdit.InsertText(textEdit.CurrentPos, Snippet[key][1])
        for i in range(Snippet[key][0]): textEdit.CharRight()
        
        
    #----------------------------------------------------------------------
    def keyEvent(self, event):
        #List of key to ignore
        if event.GetKeyCode() in [wx.WXK_UP,
                                  wx.WXK_DOWN,
                                  #wx.WXK_SHIFT,
                                  wx.WXK_ALT,
                                  wx.WXK_RIGHT,
                                  wx.WXK_LEFT,
                                  wx.WXK_ESCAPE, 
                                  wx.WXK_INSERT,
                                  wx.WXK_NUMPAD_INSERT,
                                  wx.WXK_SPACE, 
                                  wx.WXK_BACK,
                                  wx.WXK_RETURN]:
            return
        
        if event.GetModifiers() in [wx.MOD_CONTROL,
                                    wx.MOD_ALT,
                                    wx.MOD_ALTGR,
                                    wx.MOD_CMD,
                                    wx.MOD_META,
                                    #wx.MOD_SHIFT,
                                    wx.MOD_WIN]:
            return 
        
        self.OnAutoCompleter()
        self.recent = False
        
        
    #----------------------------------------------------------------------
    def getCompleters(self):
        icons = {}
        def addInDict(icon, list):
            for item in list:
                icons[item] = icon
                
        varbls = []
                
        for i in self.allVars:
            icons[i[0][:]] = i[1][:]
            varbls.append(i[0][:])
            
        
        for i in self.allFunc:
            icons[i[0][:]] = "function"
            varbls.append(i[0][:])
        
        for i in self.allDefi:
            icons[i[0][:]] = "directive"
            varbls.append(i[0][:])
            
        autoComp = []
        for key in Autocompleter.keys(): autoComp.extend(Autocompleter[key][:])
        
        completer = self.keywordList + self.reservedword + Snippet.keys() + varbls[:] + autoComp
        
        completersFilter = []
        for i in completer:
            if i not in completersFilter: completersFilter.append(i)
        completersFilter.sort()
        
        addInDict("snippet", Snippet.keys())
        addInDict("function", self.keywordList)
        addInDict("reserved", Autocompleter["reserved"] + self.reservedword)
        addInDict("directive", Autocompleter["directive"])

        return completersFilter, icons