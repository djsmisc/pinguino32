#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Tools.

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

import wx, re, webbrowser
from treeExamples import treeExamples
from autoCompleter import autoCompleter
from keywords import functionsHelp
#import locale

########################################################################
class Tools(treeExamples, autoCompleter):
    #----------------------------------------------------------------------
    def initTools(self):
        self.panel_find.Hide()
        self.panel_replace.Hide()
        self.updateIDE()
        self.__initTree__()
        self.__initCompleter__()
        self.makeFindText()
        self.makeReplaceText()
        self._init_sizers()

        self.splitterWindow1.SetSashPosition(self.config.ReadInt('frame/sashposition', -1))        

        #TODO: Spanish Doc (PinguinoVE)
        #if locale.getdefaultlocale()[0][:2] == "es":
            #self.wikiDoc = "http://www.pinguino.org.ve/wiki/index.php?title="
        #else: self.wikiDoc = "http://wiki.pinguino.cc/index.php/"

        self.wikiDoc = "http://wiki.pinguino.cc/index.php/"


    ##----------------------------------------------------------------------
    #def centrarFrame(self):
        #screen=wx.ScreenDC().Size
        #size=self.Size
        #self.SetPosition(((screen[0]-size[0])/2,(screen[1]-size[1])/2))

    #----------------------------------------------------------------------
    def contexMenuTools(self, event):
        textEdit = self.stcpage[self.notebook1.GetSelection()]
        menu = wx.Menu()
        self._initIDs_(self.stcpage[self.notebook1.GetSelection()])

        word=self.wordUnderCursor(funtion=True)

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
    def wordUnderCursor(self,funtion=False):

        line,pos=self.stcpage[self.notebook1.GetSelection()].CurLine

        so=line.split(" ")
        l=0
        for word in so:
            l+=len(word)+1
            if pos<l: break

        pos=len(word)-l+pos
        if funtion:
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
    def makeFindText(self):
        self.FindText.Hide()
        self.FindText = wx.SearchCtrl(id=wx.NewId(),
                                      name=u'FindText', parent=self.panel_find, pos=wx.Point(16, 5),
                                      size=wx.Size(160, 25), style=0, value=u'')
        self.FindText.ShowSearchButton(False)
        self.FindText.ShowCancelButton(True)
        self.Bind(wx.EVT_SEARCHCTRL_CANCEL_BTN, self.hideSearchComplete, self.FindText)

    #----------------------------------------------------------------------
    def makeReplaceText(self):
        self.ReplaceText.Hide()
        self.ReplaceText = wx.SearchCtrl(id=wx.NewId(),
                                         name=u'ReplaceText', parent=self.panel_replace, pos=wx.Point(16,
                                                                                                      5), size=wx.Size(161, 25), style=0, value=u'') 
        self.ReplaceText.SetDescriptiveText("Replace")
        self.ReplaceText.ShowSearchButton(False)
        self.ReplaceText.ShowCancelButton(False)

    #----------------------------------------------------------------------
    def hideSearchComplete(self, event=None):
        self.panel_find.Hide()
        self.panel_replace.Hide()
        self.updateIDE()



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
        frame_1 = functionsHelp(None, self.keywordList, keyword)
        app.SetTopWindow(frame_1)
        frame_1.Show()
        app.MainLoop()

    #----------------------------------------------------------------------
    def comentar(self, event=None):
        textEdit = self.stcpage[self.notebook1.GetSelection()]
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
        textEdit = self.stcpage[self.notebook1.GetSelection()]
        fila = str(textEdit.CurrentLine).rjust(3, "0")
        columna = str(textEdit.GetColumn(textEdit.CurrentPos)).rjust(3, "0")
        self.statusBar1.SetStatusText(number=1, text="Line %s - Col %s" %(fila, columna))
        event.Skip()



    #----------------------------------------------------------------------
    def updateFuntionsChoice(self, new=False):
        sel = self.notebook1.GetSelection()
        if sel >= 0:
            choice = self.choiceFunctions[self.notebook1.GetSelection()]
            textEdit = self.stcpage[self.notebook1.GetSelection()]

            funciones = self.readUserFuntions(textEdit.GetText().split("\n"))
            self.sheetFunctions[self.notebook1.GetSelection()] = funciones

            choice.Clear()
            choice.Append("(top)")
            choice.AppendItems(funciones.keys())
            choice.Append("(end)")
            if new: choice.SetSelection(0)


    #----------------------------------------------------------------------
    def moveToFuntion(self, event):
        function = event.GetString()
        textEdit = self.stcpage[self.notebook1.GetSelection()]

        if function == "(top)":
            textEdit.GotoLine(0)  

        elif function == "(end)":
            textEdit.GotoLine(textEdit.GetLineCount())

        else:
            linea = self.sheetFunctions[self.notebook1.GetSelection()][function]
            textEdit.SetCurrentPos(-1)
            #textEdit.SetSelection(0, 0)	
            trouve, position=self.find(linea.replace("\n", ""),1)
            if trouve!=-1:
                self.highlightline(trouve, "#A9D1FF")
                self.focus()

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

