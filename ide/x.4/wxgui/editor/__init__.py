#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Define principal methods to build the editor.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	23/04/13
    last release:	23/04/13

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

import sys
import wx
import os
import locale

import subprocess
from subprocess import Popen

from events import Events
from frames import menubarPinguino
from constants import THEME_DIR
from wxgui._trad import _
#from debugger import Debugger
from editeur import Editor
from general import General
from experimental import Testing

########################################################################
class IDE(Editor, General, Testing, Events):

    #----------------------------------------------------------------------
    def initIDEobjects(self):
        """Constructor"""
        
        self.configAui()
        self.buildMenubar()
        self.BindEvents()
        self.loadFeatures()
        self.SetTitle("Pinguino IDE" +  getRevisionNumber())
        if os.name == "posix": self.displaymsg(_("Welcome to Pinguino IDE"), 1)            
        self.buildToolbar()
        self.notebookEditor.Hide()
        
        #self.updateIDE()
        self.__initEditor__()
        #self.__initDebugger__()  #TODO
        self.__initTesting__() #TODO
        self.initTimers()

        #open last sesion
        if self.getElse("Main", "open-save", "True") and self.getElse("Open/Save", "openlast", "False"):
            self.openLast()
            
        #hide lateral tools and output
        if self.notebookEditor.PageCount == 0: self.updatenotebook()
        
        self.saveConfig()


#----------------------------------------------------------------------
# Aui Panels
#----------------------------------------------------------------------

    #----------------------------------------------------------------------
    def configAui(self):
        #self.auiManager = wx.aui.AuiManager(self)
        self.buildOutput()
        self.buildEditor()
        #self.addPanes()

    #----------------------------------------------------------------------      
    def buildOutput(self):
        if sys.platform != "darwin":
            self.logwindow.SetBackgroundColour(wx.Colour(0, 0, 0))
            self.logwindow.SetForegroundColour(wx.Colour(255, 255, 255)) 

    #----------------------------------------------------------------------      
    def buildEditor(self):
        #background with pinguino.cc colour and pinguino logo
        #self.panelCentral.SetBackgroundColour(wx.Colour(175, 200, 225))
        self.imageBackground = wx.Bitmap(os.path.join(THEME_DIR, 'logo.png'), wx.BITMAP_TYPE_ANY)
        if sys.platform == 'win32':
            self.imageBackground.SetSize((5000,5000)) # :)
        self.background = wx.StaticBitmap(self.panelPrincipal, wx.ID_ANY, self.imageBackground)
        self.background.CentreOnParent(wx.BOTH)
        self.notebookEditor.SetMinSize((50, 100))

    ##----------------------------------------------------------------------
    #def addPanes(self):
        #pos = self.getElse("IDE", "posOutput", "Bottom")
        #if pos == "Top": self.auiManager.AddPane(self.panelOutput, wx.aui.AuiPaneInfo().Top().CaptionVisible(False))
        #elif pos == "Bottom": self.auiManager.AddPane(self.panelOutput, wx.aui.AuiPaneInfo().Bottom().CaptionVisible(False))
        #elif pos == "Right": self.auiManager.AddPane(self.panelOutput, wx.aui.AuiPaneInfo().Right().CaptionVisible(False))
        #elif pos == "Left": self.auiManager.AddPane(self.panelOutput, wx.aui.AuiPaneInfo().Left().CaptionVisible(False))
        
        #self.auiManager.AddPane(self.panelEditor, wx.CENTER)   
        #self.auiManager.Update()

#----------------------------------------------------------------------
# Toolbar
#----------------------------------------------------------------------

    #----------------------------------------------------------------------
    def buildToolbar(self):
        try: self.toolbar.ClearTools()
        except: self.toolbar = wx.ToolBar(self, -1, wx.DefaultPosition, (wx.DefaultSize), wx.TB_FLAT | wx.TB_NODIVIDER)

        def add2Toolbar(icon, name, function, shdesc="", lngdesc=""):
            if os.path.exists(os.path.join(THEME_DIR, self.theme, icon+".png")):
                BitMap = wx.Bitmap(os.path.join(THEME_DIR, self.theme, icon+".png"), wx.BITMAP_TYPE_ANY)
                #BitMap.SetSize((32, 32)) 
            else: BitMap = None

            if BitMap:
                id = wx.NewId()
                self.toolbar.AddLabelTool(id,
                                          name,
                                          BitMap, 
                                          wx.NullBitmap, wx.ITEM_NORMAL,
                                          shdesc,
                                          lngdesc)
                self.Bind(wx.EVT_TOOL, function, id=id)


        add2Toolbar("new", "New", self.OnNew, _("New File"))
        add2Toolbar("open", "Open", self.OnOpen, _("Open File"))
        add2Toolbar("save", "Save", self.OnSave, _("Save File"))
        add2Toolbar("stop", "Close", self.OnCloseTab, _("Close File"))
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

        if self.getElse("Main", "tools", "True") and self.getElse("Tools", "search", "True"):
            add2Toolbar("find", "Find", self.Search.OnFind, _("Search in File"))
            add2Toolbar("replace", "Replace", self.Search.OnReplace, _("Replace in File"))
            self.toolbar.AddSeparator()

        add2Toolbar("board", "Selector Board", self.OnViewSelectDevice, _("Select a board"))

        add2Toolbar("runw", "Verify", self.OnVerify, _("Compile"))
        add2Toolbar("dwn", "Upload", self.OnUpload, _("Upload to Pinguino Board"))
        add2Toolbar("preferences", "Preferences", self.OnPreferences, _("set preferences of Pinguino IDE"))
        self.toolbar.AddSeparator()
        add2Toolbar("exit", "Exit", self.OnExit, _("Exit Pinguino IDE"))
        self.toolbar.Realize()
        self.SetToolBar(self.toolbar)



#----------------------------------------------------------------------
# Menubar
#----------------------------------------------------------------------

    def buildMenubar(self):
        self.menu = menubarPinguino()  #Frames
        #if os.name != "posix":self.menu.menuPinguino.Remove(self.menu.menuItemUSBCDC.GetId())
        self.SetMenuBar(self.menu)

    #----------------------------------------------------------------------
    def addFile2Recent(self, file):
        menu = self.menu.menuRecents
        for item in menu.GetMenuItems():
            menu.DeleteItem(item)
            
        try: self.recentsFiles
        except: self.recentsFiles = []
            

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


# ------------------------------------------------------------------------------
# Timer Functions
# ------------------------------------------------------------------------------

    #----------------------------------------------------------------------
    def initTimers(self):
        self.KillTimers = False	
        if self.getElse("Main", "tools", "True"):
            self.timer_updates = wx.CallLater(1000, self.updateCodeNavigator) 

        if self.getElse("Open/Save", "autosave", "False"):
            timeSave = self.getElse("Open/Save", "autosavetime", 10) * 1000
            self.timer_autosave = wx.CallLater(timeSave, self.autoSaveFiles)

    #----------------------------------------------------------------------
    def autoSaveFiles(self):
        if self.getElse("Main", "open-save", "True") and self.getElse("Open/Save", "autosave", "False"):
            self.OnSaveAll()
            timeSave = self.getElse("Open/Save", "autosavetime", 10) * 1000	
            if not self.KillTimers: self.timer_autosave.Restart(timeSave)

    #----------------------------------------------------------------------
    def updateCodeNavigator(self):
        if self.getElse("Main", "tools", "True") and self.getElse("Tools", "files", "True"):
            self.Files.update_dockFiles()
            if not self.KillTimers: self.timer_updates.Restart(1000)

    #----------------------------------------------------------------------
    def stopTimers(self):
        self.KillTimers = True

# ------------------------------------------------------------------------------
# Get SVN revision number
# ------------------------------------------------------------------------------
def getRevisionNumber():
    rev =''
    try:
        rev_txt = os.path.join('extra','EasyPack-doc','revision.txt')
        if os.path.exists(rev_txt):
            rev = open(rev_txt).readline()
        elif os.path.exists(os.path.join('..','.svn')):
            p = Popen(['svnversion', '-n'],stdout=subprocess.PIPE)
            rev = p.stdout.readline().split(':')[-1]
            while not rev.isdigit() and len(rev)>0:
                rev = rev[0:-1]
        else:
             raise
        rev = " - Rev" + rev  
    except:
        rev =''
        pass
    return rev
