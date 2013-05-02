#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    All GUI events of Pinguino IDE

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	21/04/13
    last release:	21/04/13

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
import wx.stc as stc

import codecs
import sys
import os
import webbrowser

from wxgui._trad import _
from constants import TEMP_DIR, THEME_DIR, pinguino_version

from board_selector import ConfigDevice
from preferences import PreferencesIDE
from funtions_help import FunctionsIDE
from stdout import StdoutIDE

########################################################################
class Events:

    #----------------------------------------------------------------------
    def BindEvents(self):
        """"""
        self.Bind(wx.EVT_CLOSE, self.OnExit)
        self.Bind(wx.EVT_SIZE, self.OnResize)


        #file menu
        self.Bind(wx.EVT_MENU, self.OnNew, self.menu.menuItemNew)
        self.Bind(wx.EVT_MENU, self.OnOpen, self.menu.menuItemOpen)
        self.Bind(wx.EVT_MENU, self.OnSave, self.menu.menuItemSave)
        self.Bind(wx.EVT_MENU, self.OnSaveAs, self.menu.menuItemSaveAs)
        self.Bind(wx.EVT_MENU, self.OnCloseTab, self.menu.menuItemClose)
        self.Bind(wx.EVT_MENU, self.OnSaveAll, self.menu.menuItemSaveAll)
        self.Bind(wx.EVT_MENU, self.OnCloseAll, self.menu.menuItemCloseAll)
        self.Bind(wx.EVT_MENU, self.OnExit, self.menu.menuItemExit)

        #edit menu
        self.Bind(wx.EVT_MENU, self.OnCopy, self.menu.menuItemCopy)
        self.Bind(wx.EVT_MENU, self.OnPaste, self.menu.menuItemPaste)
        self.Bind(wx.EVT_MENU, self.OnCut, self.menu.menuItemCut)
        self.Bind(wx.EVT_MENU, self.OnClear, self.menu.menuItemClear)
        self.Bind(wx.EVT_MENU, self.OnUndo, self.menu.menuItemUndo)
        self.Bind(wx.EVT_MENU, self.OnRedo, self.menu.menuItemRedo)
        self.Bind(wx.EVT_MENU, self.OnSelectall, self.menu.menuItemSelectAll)    
        self.Bind(wx.EVT_MENU, self.OnComment, self.menu.menuItemComment_Uncomment)
        self.Bind(wx.EVT_MENU, self.OnIndent, self.menu.menuItemIndent)
        self.Bind(wx.EVT_MENU, self.OnUnIndent, self.menu.menuItemUnIndent)
        self.Bind(wx.EVT_MENU, self.OnPreferences, self.menu.menuItemPreferences)
        self.Bind(wx.EVT_MENU, self.OnShowCompleter, self.menu.menuItemforzecompleter)

        #view menu
        #self.Bind(wx.EVT_MENU, self.OnViewTools, self.menu.menuItemTools)
        #self.Bind(wx.EVT_MENU, self.OnViewOutput, self.menu.menuItemOutput)
        self.Bind(wx.EVT_MENU, self.OnViewToolbar, self.menu.menuItemToolbar)

        #pinguino menu
        self.Bind(wx.EVT_MENU, self.OnViewSelectDevice, self.menu.menuItemSelectDevice)	
        #if os.name == "posix": self.Bind(wx.EVT_MENU, lambda x:self.OnDebugger(mode="CDC"), self.menu.menuItemUSBCDC)
        self.Bind(wx.EVT_MENU, self.OnViewStdout, self.menu.menuItemViewStdout)
        self.Bind(wx.EVT_MENU, self.OnVerify, self.menu.menuItemCompile)
        self.Bind(wx.EVT_MENU, self.OnUpload, self.menu.menuItemUpload)
        self.Bind(wx.EVT_MENU, self.OnVerifyUpload, self.menu.menuItemCompileUpload)

        # help menu
        self.Bind(wx.EVT_TOOL, self.OnKeyword, self.menu.menuItemKeywords)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://www.pinguino.cc"), self.menu.menuItemWebSite)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://blog.pinguino.cc"), self.menu.menuItemBlog)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://forum.pinguino.cc"), self.menu.menuItemForum)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://groups.google.fr/group/pinguinocard?pli=1"), self.menu.menuItemGroup)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://wiki.pinguino.cc"), self.menu.menuItemWiki)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://shop.pinguino.cc"), self.menu.menuItemShop)
        self.Bind(wx.EVT_MENU, self.OnAbout, self.menu.menuItemAbout)    

#----------------------------------------------------------------------
# Menu file
#----------------------------------------------------------------------

    #----------------------------------------------------------------------
    def OnNew(self, event):
        self.background.Hide()
        
        try: self.intName += 1
        except: self.intName = 0
            
        file = os.path.join(TEMP_DIR, _("Newfile%d") %self.intName)
        while file + ".pde" in self.filename:
            self.intName += 1
            file = os.path.join(TEMP_DIR, _("Newfile%d") %self.intName)
        self.New(file)  #editeur.py
        self.updatenotebook()

    #----------------------------------------------------------------------
    def OnOpen(self, event):
        self.background.Hide()
        wildcard = "Pde files (*.pde)|*.pde|"     \
            "C files (*.c)|*.c|" \
            "C Header files (*.h)|*.h|"    \
            "All files (*.*)|*.*"
        self.OpenDialog(wildcard) #editeur.py
        self.updatenotebook()
        if self.getElse("Main", "tools", "True") and self.getElse("Tools", "files", "True"):
            self.Files.update_dockFiles()

    #----------------------------------------------------------------------
    def OnSave(self, event=None):
        self.Save() #editeur.py
        
    #----------------------------------------------------------------------
    def OnSavepointReached(self,event):
        self.SetModified(False)

    #----------------------------------------------------------------------
    def OnSavepointLeft(self,event):
        self.SetModified(True)

    #----------------------------------------------------------------------
    def OnSaveAs(self, event=None):
        self.SaveAs() #editeur.py

    #----------------------------------------------------------------------
    def OnCloseTab(self, event):
        self.CloseTab()
        self.updatenotebook()
        if self.getElse("Main", "tools", "True") and self.getElse("Tools", "files", "True"):
            self.Files.update_dockFiles()

    #----------------------------------------------------------------------
    def OnSaveAll(self, event=None):
        if len(self.onglet) <= 0: return
        for i in range(len(self.filename)):
            path = self.filename[i]
            fichier=codecs.open(path,'w','utf8')
            for j in range(0,self.stcpage[i].GetLineCount()):
                fichier.writelines(self.stcpage[i].GetLine(j))
            fichier.close()
            if self.notebookEditor.GetPageText(i)[0]=="*":
                chaine=self.notebookEditor.GetPageText(i)
                chaine=chaine[1:len(chaine)]
                self.notebookEditor.SetPageText(i,chaine)
            self.stcpage[i].SetSavePoint()
            self.addFile2Recent(path)

        i = 0
        self.setConfig("Last", "Last_count", len(self.filename))
        for file in self.filename:
            try: file = unicode(file).encode("utf-8")
            except: pass          
            self.setConfig("Last", "Last_%d" %i, file)
            i += 1
        self.saveConfig()

    #----------------------------------------------------------------------
    def OnCloseAll(self, event=None):
        while self.CloseTab():
            self.updatenotebook()
            if self.getElse("Main", "tools", "True") and self.getElse("Tools", "files", "True"):
                self.Files.update_dockFiles()


    #----------------------------------------------------------------------
    def OnExit(self, event):
        self.stopTimers()

        w, h = self.GetSize()
        self.setConfig("IDE", "Window/Width", w)
        self.setConfig("IDE", "Window/Height", h)

        x, y = self.GetPosition()
        self.setConfig("IDE", "Window/Xpos", x)
        self.setConfig("IDE", "Window/Ypos", y)
        
        sashPos = self.splitterCL.GetSashPosition()
        self.setConfig("IDE", "sashPosCL", sashPos)
        
        sashPos = self.splitterCO.GetSashPosition()
        self.setConfig("IDE", "sashPosCO", sashPos)

        maxim = self.IsMaximized()
        self.setConfig("IDE", "Maximized", maxim)

        i = 0
        self.setConfig("Recents", "Recents_count", len(self.recentsFiles))
        for file in self.recentsFiles:
            try: file = unicode(file).encode("utf-8")
            except: pass
            self.setConfig("Recents", "Recents_%d" %i, file)
            i += 1

        i = 0
        self.setConfig("Last", "Last_count", len(self.filename))
        for file in self.filename:
            try: file = unicode(file).encode("utf-8")
            except: pass          
            self.setConfig("Last", "Last_%d" %i, file)
            i += 1
        if self.filename != []:
            name = self.filename[self.notebookEditor.GetSelection()]
            try: name = unicode(name).encode("utf-8")
            except: pass            
            self.setConfig("Last", "Last_Focus", name)

        self.setConfig("IDE", "Theme", self.theme)   

        self.saveConfig()

        sys.exit()



#----------------------------------------------------------------------
# Menu Edit
#----------------------------------------------------------------------                

    #----------------------------------------------------------------------
    def OnUndo(self, event):
        self.getCurrentPage().Undo()

    #----------------------------------------------------------------------
    def OnRedo(self, event):
        self.getCurrentPage().Redo()

    #----------------------------------------------------------------------
    def OnShowCompleter(self, event=None):
        word = self.wordUnderCursor(True)
        if word == " ": word = None
        self.AutoCompleter.ShowCompleter(word, -1)


    #----------------------------------------------------------------------
    def OnComment(self, event=None):
        textEdit = self.getCurrentPage()
        lineStart, lineEnd = map(textEdit.LineFromPosition,textEdit.GetSelection())
        countLines = lineEnd - lineStart
        posLineStart, posLineEnd = map(textEdit.PositionFromLine, [lineStart, lineEnd+1])
        textEdit.SetSelection(posLineStart, posLineEnd)
        selected = textEdit.GetSelectedText()
        selected = selected.split("\n")

        def getCharPos(cadena):
            pos = 0
            for i in cadena:
                if i.isspace(): pos += 1
                else: break
            return pos

        forComent = False
        for linea in selected:
            if not linea.isspace() and linea != "":
                pos = getCharPos(linea)
                if linea[pos:pos+2] != "//": forComent = True

        comented = []
        if forComent:
            for linea in selected:
                if not linea.isspace() and linea != "":
                    pos = getCharPos(linea)
                    comented.append(linea[:pos]+"//"+linea[pos:])
                else: comented.append(linea)
        else:    
            for linea in selected:
                if not linea.isspace() and linea != "":
                    pos = getCharPos(linea)
                    comented.append(linea[:pos]+linea[pos+2:])
                else: comented.append(linea)

        comented = "\n".join(comented)
        textEdit.Clear()
        textEdit.InsertText(textEdit.CurrentPos, comented)
        textEdit.SetSelection(*map(textEdit.PositionFromLine, [lineStart, lineEnd]))

    #----------------------------------------------------------------------
    def OnIndent(self, event=None):
        textEdit = self.getCurrentPage()
        lineStart, lineEnd = map(textEdit.LineFromPosition,textEdit.GetSelection())
        countLines = lineEnd - lineStart
        posLineStart, posLineEnd = map(textEdit.PositionFromLine, [lineStart, lineEnd+1])
        textEdit.SetSelection(posLineStart, posLineEnd)
        selected = textEdit.GetSelectedText()
        indentSpace = self.getIndent()
        indent = indentSpace + selected.replace("\n","\n"+indentSpace, countLines)
        textEdit.Clear()
        textEdit.InsertText(textEdit.CurrentPos, indent)
        textEdit.SetSelection(*map(textEdit.PositionFromLine, [lineStart, lineEnd]))

    #----------------------------------------------------------------------
    def OnUnIndent(self, event=None):
        textEdit = self.getCurrentPage()
        lineStart, lineEnd = map(textEdit.LineFromPosition,textEdit.GetSelection())
        countLines = lineEnd - lineStart
        posLineStart, posLineEnd = map(textEdit.PositionFromLine, [lineStart, lineEnd+1])
        textEdit.SetSelection(posLineStart, posLineEnd-1)
        selected = textEdit.GetSelectedText()
        indentSpace = self.getIndent()
        if str(selected.split("\n")[0]).startswith(indentSpace):
            indent = selected.replace(indentSpace, "", 1).replace("\n"+indentSpace, "\n", countLines)
            textEdit.Clear()
            textEdit.InsertText(textEdit.CurrentPos, indent)
            textEdit.SetSelection(*map(textEdit.PositionFromLine, [lineStart, lineEnd]))

    ##---------------------------------------------------------------------- 
    #def OnFind(self,event=None):
        #""""""

    ##---------------------------------------------------------------------- 
    #def OnReplace(self,event=None):
        #""""""

    #----------------------------------------------------------------------
    def OnCut(self, event):
        self.getCurrentPage().Cut()

    #----------------------------------------------------------------------
    def OnCopy(self, event):
        self.getCurrentPage().Copy()

    #----------------------------------------------------------------------
    def OnPaste(self, event):
        self.getCurrentPage().Paste()

    #----------------------------------------------------------------------
    def OnClear(self, event):
        self.getCurrentPage().Clear()

    #----------------------------------------------------------------------
    def OnSelectall(self, event):
        self.getCurrentPage().SelectAll()



#----------------------------------------------------------------------
# Menu View
#----------------------------------------------------------------------                

    ##----------------------------------------------------------------------
    #def OnViewTools(self, event):
        #pane = self.auiManager.GetPane(self.lat)
        #if self.menu.menuItemTools.IsChecked():
            #pane.Show()
        #else:[Recents]

            #pane.Hide()
        #self.updateIDE()

    ##----------------------------------------------------------------------
    #def OnViewOutput(self, event):
        #pane = self.auiManager.GetPane(self.panelOutput)  
        #if self.menu.menuItemOutput.IsChecked():
            #pane.Show()
        #else:
            #pane.Hide()
        #self.updateIDE()

    #----------------------------------------------------------------------
    def OnViewToolbar(self, event):
        if self.menu.menuItemToolbar.IsChecked():
            self.buildToolbar()
        else:
            self.toolbar.Destroy()	
        self.updateIDE()


#----------------------------------------------------------------------
# Menu Pinguino
#----------------------------------------------------------------------                

    #----------------------------------------------------------------------
    def OnViewSelectDevice(self, event=None):
        try: self.selectDevide.Close()
        except: pass
        self.selectDevide = ConfigDevice(self)
        self.selectDevide.__init_selector__(self)
        self.selectDevide.Show()

    ##----------------------------------------------------------------------
    #def OnDebugger(self, event=None, mode=None):
        #if mode == None:
            #self.debuggingLine.Hide()
            #self.buttonSendDebug.Hide()
            #self.choicePort.Hide()
            #self.updateIDE()
            #return 

        #self.logwindow.Clear()
        #self.choicePort.Show()
        #self.debuggingLine.Show()
        #self.buttonSendDebug.Show()
        #self.debuggingLine.SetFocus()
        #self.debuggingLine.SetSelection(3, 3)
        #self.updateIDE()        

        #try: self.pinguinoCDC.close()
        #except: pass
        #self.debuggingTimer(mode)

    #----------------------------------------------------------------------
    def OnViewStdout(self, event=None):
        try: self.stdout.Hide()
        except: pass
        self.stdout = StdoutIDE(self)
        self.stdout.__initStdout__(self)
        self.stdout.Show()

    ##----------------------------------------------------------------------
    #def OnVerify(self, event=None):
        #""""""

    ##----------------------------------------------------------------------
    #def OnUpload(self, event=None, path=None):
        #""""""

    #----------------------------------------------------------------------
    def OnVerifyUpload(self, even=None):
        if self.changingBoard:
            self.displaymsg(_("Please wait a moment.")+"\n", 0)
            return
        if self.OnVerify(): self.OnUpload()


#----------------------------------------------------------------------
# Menu Help
#----------------------------------------------------------------------                

    #----------------------------------------------------------------------
    def OnKeyword(self, event=None, keyword=None):
        wx.InitAllImageHandlers()
        functionsHelp = FunctionsIDE(None)
        functionsHelp.__initfunctionsHelp__(None, self.keywordList, keyword)
        functionsHelp.CenterOnParent()
        functionsHelp.Show()

    #----------------------------------------------------------------------
    def OnAbout(self, event):
        description = """Pinguino is an Open Software and Open Hardware Arduino-like project. Boards are based on 8 or 32-bit USB built-in Microchip microcontrollers. The main goal is to build a real USB system without USB to serial converter.
        """

        licence = """Pinguino is free software; you can redistribute it and/or modify it
        under the terms of the GNU General Public License as published by the Free Software Foundation;
        either version 2 of the License, or (at your option) any later version.

        Pinguino is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
        without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
        See the GNU General Public License for more details. You should have received a copy of
        the GNU General Public License along with File Hunter; if not, write to
        the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA"""


        info = wx.AboutDialogInfo()
        #bmp = wx.Icon(os.path.join(THEME_DIR, 'logoX3.png'), wx.BITMAP_TYPE_PNG)
        image = wx.Image(os.path.join(THEME_DIR, 'logo3D.png'), wx.BITMAP_TYPE_PNG)
        image = image.Scale(400, 300, wx.IMAGE_QUALITY_HIGH)
        bmp = wx.BitmapFromImage(image)
        #bmp = image.ConvertToBitmap()

        icon = wx.EmptyIcon()
        icon.CopyFromBitmap(bmp)
        info.SetIcon(icon)

        info.SetName('Pinguino')
        info.SetVersion(pinguino_version)
        #info.SetVersion("rev. " + self.localRev)
        info.SetDescription(description)
        # LGPL compatibility ?
        #info.SetCopyright('2008, 2009, 2010, 2011 jean-pierre mandon')
        info.SetWebSite('http://www.pinguino.cc')
        info.SetLicence(licence)

        info.AddDeveloper('Jean-Pierre Mandon')
        info.AddDeveloper('Régis Blanchot')
        info.AddDeveloper('Marcus Fazzi')
        info.AddDeveloper('Jesus Carmona Esteban')
        info.AddDeveloper('Alfred Broda')
        info.AddDeveloper('Yeison Cardona')
        info.AddDeveloper('Henk Van Beek')
        info.AddDeveloper('Björn Pfeiffer')
        info.AddDeveloper('Alexis Sánchez')     

        info.AddDocWriter('Benoit Espinola')
        info.AddDocWriter('Sebastien Koechlin')
        info.AddDocWriter('Ivan Ricondo')
        info.AddDocWriter('Jesus Carmona Esteban')
        info.AddDocWriter('Marcus Fazzi')
        info.AddDocWriter('Régis Blanchot')

        info.AddArtist('France Cadet')
        info.AddArtist('Laurent Costes')
        info.AddArtist('Daniel Rodrí­guez')

        info.AddTranslator('Joan Espinoza')
        info.AddTranslator('Alexis Sánchez')
        info.AddTranslator('Régis Blanchot')
        info.AddTranslator('Moreno Manzini ')

        wx.AboutBox(info)        




#----------------------------------------------------------------------
# Others Events
#----------------------------------------------------------------------                

    #----------------------------------------------------------------------
    def OnLeftCklick(self, event):
        try: self.AutoCompleter.Hide()
        except: pass
        event.Skip()

    #----------------------------------------------------------------------
    def OnDrop(self, event):
        file = event.GetDragText().replace("file://", "").replace("%20", " ")
        paths = file.split("\n")
        for path in paths:
            if os.path.isfile(path):
                self.Open(path,
                          self.reservedword,
                          self.rw,
                          self.filehistory,
                          self.config)
        event.SetDragText("")

    #----------------------------------------------------------------------
    def OnAutoCompleter(self):
        CharsCount = self.getElse("Completer", "charscount", 1)
        word = self.wordUnderCursor(True)
        if  word == "": return
        if len(self.wordUnderCursor(True)) > CharsCount:
            self.AutoCompleter.ShowCompleter(word, CharsCount)

    #----------------------------------------------------------------------
    def OnPreferences(self, event=None):
        wx.InitAllImageHandlers()
        frame_1 = PreferencesIDE(self)
        frame_1.__initPreferences__(self)
        frame_1.CenterOnParent()
        frame_1.Show()

    #----------------------------------------------------------------------
    def OnResize(self, event):
        try: self.background.CentreOnParent(wx.BOTH)
        except: pass
        event.Skip()
        

    #----------------------------------------------------------------------
    def OnInsertChar(self, event=None):            
        try: key = chr(event.GetKeyCode())
        except: key = None
        
        try: self.lastKey
        except: self.lastKey = None
            

        enable = self.getElse("Completer", "insertParentheses", "False")     
        if key == "(" and enable:
            word = self.wordUnderCursor(True)
            textEdit = self.getCurrentPage()
            if self.addArguments(word): return


        if self.lastKey and key == self.lastKey[0]:
            textEdit = self.getCurrentPage()
            if textEdit.CurrentPos == self.lastKey[1] + 1:
                self.lastKey = ""
                return

        if key in ["[", "\"", "'", "{", "("]:
            textEdit = self.getCurrentPage()
            cadena = textEdit.GetSelectedText()
            if len(cadena) > 0: textEdit.Clear()


            if key == "[" and self.getElse("Insert", "brackets", "False"):
                textEdit.InsertText(textEdit.CurrentPos, "["+cadena+"]")
                self.lastKey = "]", textEdit.CurrentPos
            elif key == '"' and self.getElse("Insert", "doublecuotation", "False"):
                textEdit.InsertText(textEdit.CurrentPos, '"'+cadena+'"')
                self.lastKey = '"', textEdit.CurrentPos
            elif key == "'" and self.getElse("Insert", "singlecuotation", "False"):
                textEdit.InsertText(textEdit.CurrentPos, "'"+cadena+"'")
                self.lastKey = "'", textEdit.CurrentPos
            elif key == "{" and self.getElse("Insert", "keys", "False"):
                textEdit.InsertText(textEdit.CurrentPos, "{"+cadena+"}")
                self.lastKey = "}", textEdit.CurrentPos
            elif key == "(" and self.getElse("Insert", "parentheses", "False"):
                textEdit.InsertText(textEdit.CurrentPos, "("+cadena+")")
                self.lastKey = ")", textEdit.CurrentPos
            else:
                textEdit.InsertText(textEdit.CurrentPos, key)
                aj = len(cadena)
                if len(cadena) > 0: aj += 1
                textEdit.GotoPos(textEdit.CurrentPos-aj)

            if cadena == "": textEdit.CharRight()
            else:
                for i in cadena + "12": textEdit.CharRight()           

        else: event.Skip()

    #----------------------------------------------------------------------
    def OnUpdateUI(self, evt):
        textEdit = self.getCurrentPage()
        braceAtCaret = -1
        braceOpposite = -1
        charBefore = None
        caretPos = textEdit.GetCurrentPos()

        if caretPos > 0:
            charBefore = textEdit.GetCharAt(caretPos - 1)
            styleBefore = textEdit.GetStyleAt(caretPos - 1)

        if charBefore and chr(charBefore) in "[]{}()" and styleBefore == stc.STC_P_OPERATOR:
            braceAtCaret = caretPos - 1

        if braceAtCaret < 0:
            charAfter = textEdit.GetCharAt(caretPos)
            styleAfter = textEdit.GetStyleAt(caretPos)

            if charAfter and chr(charAfter) in "[]{}()" and styleAfter == stc.STC_P_OPERATOR:
                braceAtCaret = caretPos

        if braceAtCaret >= 0:
            braceOpposite = textEdit.BraceMatch(braceAtCaret)

        if braceAtCaret != -1  and braceOpposite == -1:
            textEdit.BraceBadLight(braceAtCaret)
        else:
            textEdit.BraceHighlight(braceAtCaret, braceOpposite)
        evt.Skip()


    #----------------------------------------------------------------------
    def OnMarginClick(self, evt):
        if evt.GetMargin() == 3:
            if evt.GetShift() and evt.GetControl():
                self.getCurrentPage().FoldAll()
            else:
                lineClicked = self.getCurrentPage().LineFromPosition(evt.GetPosition())
                if self.getCurrentPage().GetFoldLevel(lineClicked) & wx.stc.STC_FOLDLEVELHEADERFLAG:
                    self.getCurrentPage().ToggleFold(lineClicked)


    #----------------------------------------------------------------------
    def OnKeyDown(self,event):
        """ keydown windows event """
        global rw
        localkw=[]
        k_code = event.GetKeyCode()

        if k_code == wx.WXK_RETURN:
            textEdit = self.getCurrentPage()
            line = textEdit.GetCurLineUTF8()[0]
            s = 0
            for i in line:
                if i.isspace(): s += 1
                else: break
            textEdit.InsertText(textEdit.CurrentPos, "\n"+" "*s)
            for i in range(s+1): textEdit.CharRight()
            return

        elif  k_code == wx.WXK_BACK:
            # El editor inserta espacios en lugar de tabuladores, con este arreglo
            # backSpace elimina espacios y NO tabuladores.
            # El motivo: stc.SetBackSpaceUnIndents(False) NO FUNCIONA!!!
            textEdit = self.getCurrentPage()
            if textEdit.GetSelectedText() == "":
                textEdit.SetSelection(textEdit.CurrentPos-1, textEdit.CurrentPos)
                textEdit.Clear()
                return


        elif  k_code == wx.WXK_TAB:
            textEdit = self.getCurrentPage()
            if textEdit.GetSelectedText() == "":
                textEdit.InsertText(textEdit.CurrentPos, self.getNormIdent())
                for i in self.getNormIdent(): textEdit.CharRight()
                return  


        event.Skip()



    #----------------------------------------------------------------------
    def OnContexMenuTools(self, event):
        menu = wx.Menu()
        self.popupIDhelp0 = wx.NewId()
        self.popupIDhelp1 = wx.NewId()
        self.popupIDhelp2 = wx.NewId()

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

        menu.AppendItem(self.menu.menuItemComment_Uncomment)
        menu.AppendItem(self.menu.menuItemIndent)
        menu.AppendItem(self.menu.menuItemUnIndent)
        menu.AppendSeparator()
        menu.AppendItem(self.menu.menuItemUndo)
        menu.AppendItem(self.menu.menuItemRedo)
        menu.AppendSeparator()
        menu.AppendItem(self.menu.menuItemCut)
        menu.AppendItem(self.menu.menuItemCopy)
        menu.AppendItem(self.menu.menuItemPaste)
        menu.AppendSeparator()
        menu.AppendItem(self.menu.menuItemClear)

        self.PopupMenu(menu)


    #----------------------------------------------------------------------
    def OnKeyEvent(self, event):
        if event.KeyCode in [wx.WXK_ESCAPE,
                             wx.WXK_TAB,
                             wx.WXK_RETURN,
                             wx.WXK_NUMPAD_ENTER,
                             wx.WXK_BACK,
                             wx.WXK_CONTROL, ]:
            event.Skip()
            return

        if event.GetModifiers() in [wx.MOD_CONTROL]:
            return

        try: chr(event.KeyCode)
        except: return        

        if not self.autocompleteHide:
            if self.getElse("Main", "auto-complete", "True") and self.getElse("Completer", "Enable", "True"):
                self.OnAutoCompleter()
                self.recent = False
            self.autocompleteHide = False
        else: self.autocompleteHide = False


