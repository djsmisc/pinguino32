#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    General methos to Pinguino IDE.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	02/April/2012
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

import wx, re, os, sys, string
import wx.stc as stc
from ConfigParser import RawConfigParser
from dic import Snippet, Autocompleter
from wxgui._trad import _

from variables import *
from frames import *
from wxgui.check import DEV
from wxgui.boards import boardlist

from wxgui.editor.preferences import Preferences
from wxgui.editor.funtions_help import functionsHelp
from wxgui.editor.autocompleter import AutoCompleter
from wxgui.editor.stdout import Stdout
from wxgui.editor.pic_popup import PICpopup
from wxgui.editor.board_selector import BoarSelector


########################################################################
class General:

    #----------------------------------------------------------------------
    def updateStatusBar(self, event=None):
        #self.findIndex = -1
        if len(self.stcpage) > 0:
            textEdit = self.stcpage[self.notebookEditor.GetSelection()]
            fila = str(textEdit.CurrentLine+1).rjust(3, "0")
            columna = str(textEdit.GetColumn(textEdit.CurrentPos)).rjust(3, "0")
            self.statusBarEditor.SetStatusText(number=1, text="Line %s - Col %s" %(fila, columna))
            if event != None:
                event.Skip()


    #----------------------------------------------------------------------
    def loadConfig(self):
        if not os.path.isfile(APP_CONFIG):
            file = open(APP_CONFIG, mode="w")
            file.close()
        config_file=open(APP_CONFIG,"r")
        self.configIDE=RawConfigParser()
        self.configIDE.readfp(config_file) 
        config_file.close()

    #----------------------------------------------------------------------
    def setConfig(self,section,opcion,valor):
        if not section in self.configIDE.sections():
            self.configIDE.add_section(section)
        self.configIDE.set(section,opcion,valor)

    #----------------------------------------------------------------------
    def saveConfig(self):
        config_file=open(APP_CONFIG,"w")
        self.configIDE.write(config_file)
        config_file.close()

    #----------------------------------------------------------------------
    def getConfig(self, section, option):
        value = self.configIDE.get(section,option)
        try:
            if value.isdigit(): return int(value)
            elif value.isalpha(): return value
            else: return value
        except:
            return value

    #----------------------------------------------------------------------
    def getColorConfig(self, section, option, default=[0, 0, 0, 0]):
        try:
            value = self.configIDE.get(section,option)
            value = value[1:-1].split(",")
            value = map(lambda x:int(x), value)
            color = wx.Color()
            color.Set(*value)
            return color
        except:
            color = wx.Color()
            color.Set(*default)
            self.setConfig(section, option, default)
            return color

    #---------------------------------------------------------------------- 
    def getElse(self, section, option, default):
        try: default = self.getConfig(section, option)
        except: self.setConfig(section, option, default)
        return default

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
        self.popupID9 = wx.NewId()
        self.popupID10 = wx.NewId()
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
        self.Bind(wx.EVT_MENU, lambda x:self.OnComment(), id=self.popupID8)
        self.Bind(wx.EVT_MENU, lambda x:self.OnIndent(), id=self.popupID9)
        self.Bind(wx.EVT_MENU, lambda x:self.OnUnIndent(), id=self.popupID10)


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
        menu.Append(self.popupID9, _("Increase Indent"))
        menu.Append(self.popupID10, _("Decrease Indent"))

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
        try: self.AutoCompleter.Hide()
        except: pass
        event.Skip()


    #----------------------------------------------------------------------
    def insertSnippet(self, key):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        index = self.wordUnderCursor()

        line = textEdit.GetCurLineUTF8()[0]

        s = 0
        for i in line:
            if i.isspace(): s += 1
            else: break
        rep = Snippet[key][1].replace("\n", "\n"+" "*s).replace("\t", self.getIndent())

        textEdit.InsertText(textEdit.CurrentPos, rep)
        for i in range(Snippet[key][0][0]-1):
            textEdit.LineDown()
        if type(Snippet[key][0][1]) == type(1):
            for i in range(Snippet[key][0][1]):
                textEdit.CharRight()
        elif  type(Snippet[key][0][1]) == type([]):
            s = len(self.getIndent() * Snippet[key][0][1][0])
            for i in range(Snippet[key][0][1][1]+s):
                textEdit.CharRight()

    #----------------------------------------------------------------------
    def keyEvent(self, event):
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
            enable = self.getElse("Completer", "Enable", "True")
            if enable == "True":
                self.OnAutoCompleter()
                self.recent = False
            self.autocompleteHide = False
        else: self.autocompleteHide = False

    #----------------------------------------------------------------------
    def InsertChar(self, event=None):            
        try: key = chr(event.GetKeyCode())
        except: key = None

        enable = self.getElse("Completer", "insertParentheses", "False")     
        if key == "(" and enable == "True":
            word = self.wordUnderCursor(True)
            textEdit = self.stcpage[self.notebookEditor.GetSelection()]
            if self.addArguments(word): return

        if key in ["[", "\"", "'", "{", "("]:
            textEdit = self.stcpage[self.notebookEditor.GetSelection()]
            cadena = textEdit.GetSelectedText()
            if len(cadena) > 0: textEdit.Clear()              

            if key == "[" and self.getElse("Insert", "brackets", "False") == "True":
                textEdit.InsertText(textEdit.CurrentPos, "["+cadena+"]")
            elif key == '"' and self.getElse("Insert", "doublecuotation", "False") == "True":
                textEdit.InsertText(textEdit.CurrentPos, '"'+cadena+'"')
            elif key == "'" and self.getElse("Insert", "singlecuotation", "False") == "True":
                textEdit.InsertText(textEdit.CurrentPos, "'"+cadena+"'")
            elif key == "{" and self.getElse("Insert", "keys", "False") == "True":
                textEdit.InsertText(textEdit.CurrentPos, "{"+cadena+"}")
            elif key == "(" and self.getElse("Insert", "parentheses", "False") == "True":
                textEdit.InsertText(textEdit.CurrentPos, "("+cadena+")")
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
    def getCompleters(self):
        icons = {}
        def addInDict(icon, list):
            for item in list:
                icons[item] = icon

        varbls = []
        allfunctions = []

        for i in self.allVars:
            icons[i[0][:].replace("*", "")] = i[1][:].split()[-1]
            varbls.append(i[0][:].replace("*", ""))

        for i in self.allFunc:
            icons[i[0][:].replace("*", "")] = "function"
            allfunctions.append(i[0][:].replace("*", ""))

        for i in self.allDefi:
            icons[i[1][:].replace("*", "")] = "directive"
            varbls.append(i[1][:].replace("*", ""))

        autoComp = []
        for key in Autocompleter.keys(): autoComp.extend(Autocompleter[key][:])

        completer = allfunctions + self.keywordList + self.reservedword + Snippet.keys() + varbls[:] + autoComp + self.autoCompleteWords

        completersFilter = []
        for i in completer:
            if i not in completersFilter: completersFilter.append(i)
        completersFilter.sort()

        for i in Autocompleter["reserved"]:
            if i in self.keywordList: self.keywordList.remove(i)

        addInDict("snippet", Snippet.keys())
        addInDict("function", self.keywordList + allfunctions)
        addInDict("reserved", Autocompleter["reserved"])
        addInDict("directive", Autocompleter["directive"])

        return completersFilter + self.otherWords, icons



    #----------------------------------------------------------------------
    def OnMarginClick(self, evt):
        if evt.GetMargin() == 3:
            if evt.GetShift() and evt.GetControl():
                self.stcpage[self.notebookEditor.GetSelection()].FoldAll()
            else:
                lineClicked = self.stcpage[self.notebookEditor.GetSelection()].LineFromPosition(evt.GetPosition())
                if self.stcpage[self.notebookEditor.GetSelection()].GetFoldLevel(lineClicked) & wx.stc.STC_FOLDLEVELHEADERFLAG:
                    self.stcpage[self.notebookEditor.GetSelection()].ToggleFold(lineClicked)



    #----------------------------------------------------------------------
    def OnUpdateUI(self, evt):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
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
            #pt = self.PointFromPosition(braceOpposite)
            #self.Refresh(True, wxRect(pt.x, pt.y, 5,5))
            #print pt
            #self.Refresh(False)
        evt.Skip()


    #----------------------------------------------------------------------
    def addArguments(self, funcionName):
        for func in self.allFunc:
            if func[0] in [funcionName, "*"+funcionName, "* "+funcionName]:
                arg = func[2]
                self.HideNextAutoComplete()
                textEdit = self.stcpage[self.notebookEditor.GetSelection()]
                textEdit.InsertText(textEdit.CurrentPos, "("+arg+")")
                textEdit.SetSelection(textEdit.CurrentPos+1, textEdit.CurrentPos+len(arg)+1)
                return True
        return False

    #----------------------------------------------------------------------
    def HideNextAutoComplete(self):
        self.autocompleteHide = True

    #----------------------------------------------------------------------
    def OnShowCompleter(self, event=None):
        word = self.wordUnderCursor(True)
        if word == " ": word = None
        self.AutoCompleter.ShowCompleter(word, -1)


# ------------------------------------------------------------------------------
# Decorator to debug time
# ------------------------------------------------------------------------------
    def debugTime(function):
        DEBUG_TIME = True
        def process(*args):
            inicio = time.time()
            retorno = function(*args)
            fin = time.time()
            print function.__name__ + "\tTime: %.7fs" %(fin - inicio)
            return retorno
        if DEBUG_TIME : return process
        else: return function


# ------------------------------------------------------------------------------
# Editor
# ------------------------------------------------------------------------------
    def buildEditor(self):
        self.EditorPanel = self.panelEditor
        #background with pinguino.cc colour and pinguino logo
        self.EditorPanel.SetBackgroundColour(wx.Colour(175, 200, 225))
        self.imageBackground = wx.Bitmap(os.path.join(THEME_DIR, 'logo.png'), wx.BITMAP_TYPE_ANY)
        if sys.platform == 'win32':
            self.imageBackground.SetSize((5000,5000)) # :)
        self.background = wx.StaticBitmap(self.EditorPanel, wx.ID_ANY, self.imageBackground)
        self.background.CentreOnParent(wx.BOTH)

        self.notebookEditor.SetMinSize((50, 100))

# ------------------------------------------------------------------------------
# Configure Panes (???)
# ------------------------------------------------------------------------------
    def configPanes(self):
        self.buildOutput()
        self.buildLateralPanel()
        self.buildEditor()
        self.addPanes()


# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------
    def buildOutput(self):
        self.panelOutput = panelOutput(self)
        self.debuggingLine = self.panelOutput.debuggingLine
        self.buttonSendDebug = self.panelOutput.buttonSendDebug
        self.logwindow = self.panelOutput.logwindow

        self.choicePort = self.panelOutput.choicePort
        self.choicePort.Hide()

        self.choicePort.Bind(wx.EVT_CHOICE, self.changeCDCPort)

        self.debuggingLine.SetInsertionPoint(125)
        self.debuggingLine.Hide()
        self.buttonSendDebug.Hide()

        self.debuggingLine.Bind(wx.EVT_KEY_UP, self.sendDebugging)
        self.buttonSendDebug.Bind(wx.EVT_BUTTON, self.sendLine)

        # create a PaneInfo structure for output window
        self.PaneOutputInfo=wx.aui.AuiPaneInfo()
        self.PaneOutputInfo.CloseButton(False)
        self.PaneOutputInfo.MaximizeButton(True)
        self.PaneOutputInfo.MinimizeButton(True)
        #self.PaneOutputInfo.Bottom()

# ------------------------------------------------------------------------------
# Lateral
# ------------------------------------------------------------------------------
    def buildLateralPanel(self):
        self.PaneLateral=wx.aui.AuiPaneInfo()
        self.PaneLateral.CloseButton(True)
        self.PaneLateral.MinimizeButton(True)
        self.PaneLateral.Right()


# ------------------------------------------------------------------------------
# Add the panes to the manager
# ------------------------------------------------------------------------------
    def addPanes(self):
        self.lat = panelLateral(self)
        self._mgr.AddPane(self.panelOutput, wx.BOTTOM, _("Output"))          
        self._mgr.AddPane(self.lat, wx.RIGHT, _("Tools"))      
        self._mgr.AddPane(self.panelEditor, wx.CENTER)
        self._mgr.Update()

# ------------------------------------------------------------------------------
# Event Management
# ------------------------------------------------------------------------------
    def ConnectAll(self):
        """"""
        self.Bind(wx.EVT_CLOSE, self.OnExit)
        self.Bind(wx.EVT_SIZE, self.OnResize)

        #file menu
        self.Bind(wx.EVT_MENU, self.OnNew, self.menu.menuItemNew)
        self.Bind(wx.EVT_MENU, self.OnOpen, self.menu.menuItemOpen)
        #self.Bind(wx.EVT_MENU_RANGE, self.menu.menuRecents, id=wx.ID_FILE1, id2=wx.ID_FILE9)
        self.Bind(wx.EVT_MENU, self.OnSave, self.menu.menuItemSave)
        self.Bind(wx.EVT_MENU, self.OnSaveAs, self.menu.menuItemSaveAs)
        self.Bind(wx.EVT_MENU, self.OnClose, self.menu.menuItemClose)
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
        self.Bind(wx.EVT_MENU, self.OnFind, self.menu.menuItemFind)
        self.Bind(wx.EVT_MENU, self.OnReplace, self.menu.menuItemReplace)
        self.Bind(wx.EVT_MENU, self.OnSelectall, self.menu.menuItemSelectAll)
        self.Bind(wx.EVT_MENU, self.OnComment, self.menu.menuItemComment_Uncomment)
        self.Bind(wx.EVT_MENU, self.OnIndent, self.menu.menuItemIndent)
        self.Bind(wx.EVT_MENU, self.OnUnIndent, self.menu.menuItemUnIndent)
        self.Bind(wx.EVT_MENU, self.OnPreferences, self.menu.menuItemPreferences)
        self.Bind(wx.EVT_MENU, self.OnShowCompleter, self.menu.menuItemforzecompleter)

        #view menu
        self.Bind(wx.EVT_MENU, self.OnViewTools, self.menu.menuItemTools)
        self.Bind(wx.EVT_MENU, self.OnViewOutput, self.menu.menuItemOutput)
        self.Bind(wx.EVT_MENU, self.OnViewToolbar, self.menu.menuItemToolbar)

        #pinguino menu


        self.Bind(wx.EVT_MENU, self.OnViewSelectDevice, self.menu.menuItemSelectDevice)	

        if DEV:
            #self.Bind(wx.EVT_MENU, self.OnDebug, self.menu.menuDebugMode)
            self.Bind(wx.EVT_MENU, self.OnCheck, self.menu.menuItemCheckRev)
            #self.Bind(wx.EVT_MENU, self.OnUpgrade, self.menu.menuItemUpgrade)
        #for b in range(len(boardlist)):
            #self.Bind(wx.EVT_MENU, self.OnBoard, id = boardlist[b].id)

        #self.Bind(wx.EVT_MENU_RANGE, self.OnTheme, id=self.ID_THEME1, id2=self.ID_THEME1 + self.themeNum)
        if DEV:
            self.Bind(wx.EVT_MENU, lambda x:self.setDebugger(mode="CDC"), self.menu.menuItemUSBCDC)
            self.Bind(wx.EVT_MENU, lambda x:self.setDebugger(mode=None), self.menu.menuItemDebugNone)

        self.Bind(wx.EVT_MENU, self.OnViewStdout, self.menu.menuItemViewStdout)

        self.displaymsg(_("Please wait a moment.")+"\n", 0)
        
        self.Bind(wx.EVT_MENU, self.OnVerify, self.menu.menuItemCompile)
        self.Bind(wx.EVT_MENU, self.OnUpload, self.menu.menuItemUpload)
        self.Bind(wx.EVT_MENU, self.OnVerifyUpload, self.menu.menuItemCompileUpload)

        ##plugin
        #self.Bind(wx.EVT_TOOL, self.OnPlugIn, id=self.ID_PLUG_ON)
        #self.Bind(wx.EVT_TOOL, self.NoPlugIn, id=self.ID_PLUG_OFF)

        # help menu
        self.Bind(wx.EVT_TOOL, self.OnKeyword, self.menu.menuItemKeywords)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://www.pinguino.cc"), self.menu.menuItemWebSite)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://blog.pinguino.cc"), self.menu.menuItemBlog)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://forum.pinguino.cc"), self.menu.menuItemForum)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://groups.google.fr/group/pinguinocard?pli=1"), self.menu.menuItemGroup)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://wiki.pinguino.cc"), self.menu.menuItemWiki)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://shop.pinguino.cc"), self.menu.menuItemShop)
        self.Bind(wx.EVT_MENU, self.OnAbout, self.menu.menuItemAbout)

        self.Bind(wx.aui.EVT_AUI_PANE_CLOSE, self.OnPaneClose )


# ----------------------------------------------------------------------
# Menus
# ----------------------------------------------------------------------
    def buildMenu(self):
        self.menu = menubarPinguino()

        if not DEV:  #Can't disable submenu (wx.menu)
            self.menu.menuItemDebugNone.Enable(False)
            self.menu.menuItemUSBCDC.Enable(False)
            self.menu.menuItemUART1.Enable(False)
            self.menu.menuItemCheckRev.Enable(False)	    

        self.SetMenuBar(self.menu)

    #----------------------------------------------------------------------
    def addFile2Recent(self, file):
        menu = self.menu.menuRecents
        for item in menu.GetMenuItems():
            menu.DeleteItem(item)

        if file in self.recentsFiles: self.recentsFiles.remove(file)
        self.recentsFiles.insert(0, file)
        self.recentsFiles = self.recentsFiles[:10]
        for file in range(len(self.recentsFiles)):
            menu_r = wx.MenuItem(menu, wx.NewId(), self.recentsFiles[file], wx.EmptyString, wx.ITEM_NORMAL)
            self.Bind(wx.EVT_MENU, self.open_path(self.recentsFiles[file]), menu_r)
            menu.AppendItem(menu_r)

        self.menu.UpdateMenus()

    #----------------------------------------------------------------------
    def open_path(self,name):
        def path(event=None):
            self.Open(name)
        return path   


# ----------------------------------------------------------------------
# Load settings from config file
# ----------------------------------------------------------------------
    def loadSettings(self):
        self.loadConfig()
        
        arch = self.getElse("Board", "architectute", 8)
        mode = self.getElse("Board", "mode", "BOOT")
        #family = self.IDE.getElse("Board", "family", "18fxxx")
        device = self.getElse("Board", "device", "Pinguino 2550")
        self.setBoard(arch, mode, device)
        

        w = self.getElse("IDE", "window/width", 1000)
        h = self.getElse("IDE", "window/height", 500)
        self.SetSize((w, h))

        # TODO fix the bug on windows for negative frame position 	    
        try:
            x = self.getElse("IDE", "Window/Xpos", 100)
            y = self.getElse("IDE", "Window/Ypos", 100)
            self.SetPosition((x, y))
        except:
            self.setConfig("IDE", "Window/Xpos", 0)
            self.setConfig("IDE", "Window/Ypos", 0)
            self.SetPosition((0, 0))

        maxim = self.getElse("IDE", "Maximized", "False")
        if maxim == "True": self.Maximize()

        self.theme = self.getElse("IDE", "theme", "PinguinoX")   

        try:
            for i in range(self.getConfig("Recents", "Recents_count")):
                file = self.getConfig("Recents", "Recents_%d"%i)
                if os.path.isfile(file):
                    self.addFile2Recent(file)
        except: pass

        panelOutput = "[\S]*dock_size\((\d,\d,\d)\)=([\d]*)[\S]*"
        panelLateral = "[\S]*dock_size\((\d,\d,\d)\)=([\d]*)[\S]*"
        perspectiva = self._mgr.SavePerspective()
        nOutput = int(self.getElse("IDE", "PerspectiveOutput", "119"))
        nLateral = int(self.getElse("IDE", "PerspectiveLateral", "286"))
        nOutputPos = self.getElse("IDE", "PerspectiveOutputPos", "119")
        nLateralPos = self.getElse("IDE", "PerspectiveLateralPos", "286")

        #print nOutputPos

        try:
            oOutput = int(re.match(panelOutput, perspectiva).group(2))   
            oLateral = int(re.match(panelLateral, perspectiva).group(2))
            oOutputPos = re.match(panelOutput, perspectiva).group(1) 
            oLateralPos = re.match(panelLateral, perspectiva).group(1)

            perspectiva = perspectiva.replace("dock_size%s=%d" %(oOutputPos, oOutput), "dock_size%s=%d" %(nOutputPos, nOutput))
            perspectiva = perspectiva.replace("dock_size%s=%d" %(oOutputPos, oLateral), "dock_size%s=%d" %(nOutputPos, nLateral))
            self._mgr.LoadPerspective(perspectiva)
        except:
            print "No perspective"

        lateralPath = self.getElse("IDE", "LateralPath", os.path.join(os.getcwd(),"examples"))
        self.__initDocuments__()
        if os.path.isdir(lateralPath):
            self.buildLateralDir(lateralPath)


# ------------------------------------------------------------------------------
# Thread Functions
# ------------------------------------------------------------------------------
    def getRevision(self):
        sw = SubversionWorkingCopy(HOME_DIR).current_version()
        try: sw = SubversionWorkingCopy(HOME_DIR).current_version()
        except: sw = _("unknown")
        wx.PostEvent(self, ResultEventRevision(sw))

        if self.getElse("IDE", "checkupgradeatstart", "False") == "True":
            try:
                svnRev = SubversionRepository(SVN_DIR)
                self.lastRevision = svnRev.current_version()
                #self.lastRevision = "<<TESTING>>" #To force a update at start
                wx.PostEvent(self, ResultEventRevision([svnRev]))
            except: self.lastRevision = False

# ------------------------------------------------------------------------------
# Timer Functions
# ------------------------------------------------------------------------------

    #----------------------------------------------------------------------
    def initTimers(self):
        #Auto=save
        save = self.getElse("Open/Save", "autosave", "False")
        timeSave = self.getElse("Open/Save", "autosavetime", 10) * 1000
        if save == "True":
            self.timer_autosave = wx.CallLater(timeSave, self.autoSaveFiles)
        #Updates
        self.timer_updates = wx.CallLater(1000, self.updates)

    #----------------------------------------------------------------------
    def stopTimers(self):
        self.timer_updates.Stop()

    #----------------------------------------------------------------------
    def autoSaveFiles(self):
        if self.getElse("Open/Save", "autosave", "False") == "True":
            self.OnSaveAll()
        timeSave = self.getElse("Open/Save", "autosavetime", 10) * 1000	
        self.timer_autosave.Restart(timeSave)

    #----------------------------------------------------------------------
    def updates(self):
        self.update_dockFiles()
        self.updateStatusBar()

        self.timer_updates.Restart(1000)

# ------------------------------------------------------------------------------
# Event Threads
# ------------------------------------------------------------------------------
    def setRevision(self, event):
        if type(event.data) == type([]):
            self.OnCheck(event=None, back=True, svn=event.data[0])
            return

        self.localRev = event.data
        if DEV == True: rev = 'rev. ' + self.localRev
        else: rev = ""
        self.SetTitle('Pinguino IDE ' + pinguino_version + " " + rev)
        self.displaymsg(_("Welcome to Pinguino IDE")+" (rev. " + self.localRev + ")", 1)
        self.statusBarEditor.SetStatusText(number=2, text="Rev. %s" %self.localRev)

# ------------------------------------------------------------------------------
# Update
# ------------------------------------------------------------------------------
    def updateIDE(self):
        self.lat.search.Fit()
        self._mgr.Update()

# ------------------------------------------------------------------------------
# OnUpgrade
# ------------------------------------------------------------------------------

    def OnCheck(self, event=None, back=False, svn=None):
        try: self.upgrade.Cancel()
        except: pass
        self.upgrade = UpgradeIDE(self) 
        self.upgrade.__initUpgrade__(self)

        if not back:
            self.upgrade.checkUpgrade()
            self.upgrade.Show()
        else:
            if not (self.lastRevision == self.localRev):
                self.upgrade.Show()
                self.upgrade.prepareUpgrade(svn)
            else: self.upgrade.Cancel()

# ------------------------------------------------------------------------------
# OnFileHistory : open selected history file
# ------------------------------------------------------------------------------

    def OnFileHistory(self, event):
        self.background.Hide()
        fileNum = event.GetId() - wx.ID_FILE1
        path = self.filehistory.GetHistoryFile(fileNum)
        self.filehistory.AddFileToHistory(path)                  # move up the list
        self.Open(path,self.reservedword,self.rw, self.filehistory, self.config)
        # refresh file menu (doesn't seem to work)
        self.file_menu.UpdateUI()
        self.updatenotebook()


# ------------------------------------------------------------------------------
# OnPaneClose: wx.aui managed window is about to be closed
# ------------------------------------------------------------------------------

    def OnPaneClose(self,event):
#        print "OnPaneClose", # dir(event)
#        print event.GetPane() == self._mgr.GetPane(self.lat) # ???
        caption = event.GetPane().caption
        if caption == _("Tools"):
            self.menu.menuItemTools.Check(False)

# ------------------------------------------------------------------------------
# OnResize:
# ------------------------------------------------------------------------------

    def OnResize(self,event):
        try: self.background.CentreOnParent(wx.BOTH)
        except: pass
        self._mgr.Update()
        event.Skip()

    #----------------------------------------------------------------------
    def openLast(self):
        try:
            for i in range(self.getConfig("Last", "Last_count")):
                file = self.getConfig("Last", "Last_%d"%i)
                if os.path.isfile(file):
                    self.Open(file)

            name = self.getConfig("Last", "Last_Focus")
            c = 0
            for i in self.filename:
                if i == name: break
                c += 1

            self.notebookEditor.SetSelection(c)

        except: pass



    #----------------------------------------------------------------------
    def DrawToolbar(self):
        try: self.toolbar.ClearTools()
        except:
            self.toolbar = wx.ToolBar(self, -1, wx.DefaultPosition, (wx.DefaultSize), wx.TB_FLAT | wx.TB_NODIVIDER)

        # add2Toolbar is part of DrawToolbar
        def add2Toolbar(icon, name, function, shdesc="", lngdesc=""):
            if (os.path.exists(os.path.join(THEME_DIR, self.theme, icon+".png"))!=False):
                id = wx.NewId()
                self.toolbar.AddLabelTool(id,
                    name,
                    wx.Bitmap(os.path.join(THEME_DIR, self.theme, icon+".png"), wx.BITMAP_TYPE_ANY),
                    wx.NullBitmap, wx.ITEM_NORMAL,
                    shdesc,
                    lngdesc)
                self.Bind(wx.EVT_TOOL, function, id=id)

        add2Toolbar("new", "New", self.OnNew, _("New File"))
        add2Toolbar("open", "Open", self.OnOpen, _("Open File"))
        add2Toolbar("save", "Save", self.OnSave, _("Save File"))
        add2Toolbar("stop", "Close", self.OnClose, _("Close File"))
        self.toolbar.AddSeparator()
        add2Toolbar("undo", "Undo", self.OnUndo, _("Undo"))
        add2Toolbar("redo", "Redo", self.OnRedo, _("Redo"))
        self.toolbar.AddSeparator()
        add2Toolbar("cut", "Cut", self.OnCut, _("Cut"))
        add2Toolbar("copy", "Copy", self.OnCopy, _("Copy"))
        add2Toolbar("paste", "Paste", self.OnPaste, _("Paste"))
        add2Toolbar("clear", "Clear", self.OnClear, _("Clear"))
        add2Toolbar("select", "Select", self.OnSelectall, _("Select"))
        self.toolbar.AddSeparator()
        add2Toolbar("find", "Fin", self.OnFind, _("Search in File"))
        add2Toolbar("replace", "Replace", self.OnReplace, _("Replace in File"))
        self.toolbar.AddSeparator()

        add2Toolbar("board", "Selector Board", self.OnViewSelectDevice, _("Select a board"))

        add2Toolbar("runw", "Verify", self.OnVerify, _("Compile"))
        add2Toolbar("dwn", "Upload", self.OnUpload, _("Upload to Pinguino Board"))
        #add2Toolbar("debug", "&Debug On/Off", self.OnDebug, "USB Connexion with Pinguino")
        add2Toolbar("preferences", "Preferences", self.OnPreferences, _("set preferences of Pinguino IDE"))
        self.toolbar.AddSeparator()
        add2Toolbar("exit", "Exit", self.OnExit, _("Exit Pinguino IDE"))
        self.toolbar.Realize()
        self.SetToolBar(self.toolbar)


# ------------------------------------------------------------------------------
# Display message
# ------------------------------------------------------------------------------

    def displaymsg(self, message, clearpanel):
        """ display message in the log window """
        #if gui==True:
        if clearpanel==1:
            self.logwindow.Clear()
        try:
            self.logwindow.WriteText(message.decode("utf-8", "replace")+"\n")
        except:
            self.logwindow.WriteText(message+"\n")
        #else:
            #if message!="":
                #print message
        #return


    #----------------------------------------------------------------------
    def OnPreferences(self, event=None):
        #app = wx.PySimpleApp(0)
        wx.InitAllImageHandlers()
        frame_1 = PreferencesIDE(self)
        frame_1.__initPreferences__(self)
        #app.SetTopWindow(frame_1)
        if not DEV: frame_1.upgrade.Disable()
        frame_1.CenterOnParent()
        frame_1.Show()
        #app.MainLoop()


    #----------------------------------------------------------------------
    def OnKeyword(self, event=None, keyword=None):
        #app = wx.PySimpleApp(0)
        wx.InitAllImageHandlers()
        frame_1 = FunctionsIDE(None)
        frame_1.__initfunctionsHelp__(None, self.keywordList, keyword)
        #app.SetTopWindow(frame_1)
        frame_1.CenterOnParent()
        frame_1.Show()
        #app.MainLoop()
        #self.setNormalCursor()

    #----------------------------------------------------------------------
    def OnAutoCompleter(self):
        CharsCount = self.getElse("Completer", "charscount", 1)
        word = self.wordUnderCursor(True)
        if  word == "": return
        if len(self.wordUnderCursor(True)) > CharsCount:
            self.AutoCompleter.ShowCompleter(word, CharsCount)

    #----------------------------------------------------------------------
    def OnViewStdout(self, event=None):
        try: self.stdout.Hide()
        except: pass
        self.stdout = StdoutIDE(self)
        self.stdout.__initStdout__(self)
        self.stdout.Show()

    #----------------------------------------------------------------------
    def OnViewSelectDevice(self, event=None):
        try: self.selectDevide.Hide()
        except: pass
        self.selectDevide = ConfigDevice(self)
        #self.selectDevide.__init_devices__(self)
        self.selectDevide.Show()	

    #----------------------------------------------------------------------
    def OnViewSelectDevice(self, event=None):
        try: self.selectDevide.Close()
        except: pass
        self.selectDevide = ConfigDevice(self)
        self.selectDevide.__init_selector__(self)
        self.selectDevide.Show()	


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
    def applyPreferences(self):
        self.Hide()
        self.toolbar.Destroy()
        self.DrawToolbar()

        self.morePreferences()

        self.OnSaveAll()
        self.OnCloseAll()
        self.openLast()
        self.Show()


    #----------------------------------------------------------------------
    def morePreferences(self):
        self.loadConfig()
        if self.getElse("Source", "userfontinoutput", "False") == "True":
            if self.getConfig("Source", "fontdefault") == "False":
                FaceNAme = self.getConfig("Source", "font")
                PointSize = self.getConfig("Source", "size")
                font = wx.Font(10, wx.TELETYPE, wx.NORMAL, wx.NORMAL, True)
                font.SetFaceName(FaceNAme)
                font.SetPointSize(PointSize)
                font.SetUnderlined(False)
                self.logwindow.SetFont(font)
            else:
                font = wx.Font(10, wx.TELETYPE, wx.NORMAL, wx.NORMAL, True)
                font.SetUnderlined(False)
                self.logwindow.SetFont(font) 
        else:
            font = wx.Font(10, wx.TELETYPE, wx.NORMAL, wx.NORMAL, True)
            font.SetUnderlined(False)
            self.logwindow.SetFont(font)            


########################################################################
class PreferencesIDE(framePreferences, Preferences):
    """"""

########################################################################
class FunctionsIDE(frameKeyWords, functionsHelp):
    """"""

#########################################################################
#class AutocompleterIDE(frameAutoCompleter, AutoCompleter):
    #""""""

########################################################################
class StdoutIDE(frameStdout, Stdout):
    """"""

#########################################################################
#class PicListIDE(FrameSelectDevice_, PICpopup):
    #""""""

########################################################################
class ConfigDevice(FrameSelectDevice, BoarSelector):
    """"""