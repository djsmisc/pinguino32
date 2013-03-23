#!/usr/bin/env python
#  -*- coding: UTF-8 -*-

"""-------------------------------------------------------------------------
 pinguino

             (c) 2008-2009-2010 Jean-Pierre MANDON <jp.mandon@gmail.com> 

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

# $Id: pinguino.py,v beta 2008/09/05 21:36:00 mandon
# ----------------------------------------------------
# $Id: pinguino.py,v beta 1 2008/09/06 15:03:00 mandon
# replaced splittext by split on save in module editeur
# bug 02 replaced sys.path[0] by sys.path[0].replace(" ","\\ ") for path with spaces only for the linker !!
# jean-pierre mandon / guillaume stagnaro
# ----------------------------------------------------
# $Id: pinguino.py,v beta 2 2008/09/19 22:45:00 mandon
# added support of analogRead instruction in ReplaceWord
# ----------------------------------------------------
# $Id: pinguino.py,v beta 3 2008/10/12 22:45:00 mandon
# added support of USB
# modified digitalWrite, digitalRead and pinMode for better compatibility
# ----------------------------------------------------
# $Id: pinguino.py,v beta 3.1 2008/10/17 22:45:00 mandon
# coorected a bug on analogRead for MAC OS X
# ----------------------------------------------------
# $Id: pinguino.py,v beta 4 2008/11/02 21:40:00 mandon
# full support of USB Bulk
# modified buffer for USB up to 2 MBytes/second
# ----------------------------------------------------
# $Id: pinguino.py,v beta 5 2009/03/08 19:41:00 mandon
# full support of User Interrupt
# About dialog modified
# possibility to include libraries #include "mylib.c" work now
# implementation of millis() instruction
# implementation of fast analogWrite on output 11 and 12 ( 3khz PWM ) with 10 bits resolution ( 0..1023 )
# variable initialisation is now possible in the head of the program
# ----------------------------------------------------
# $Id: pinguino.py,v beta 6 2009/08/12 19:41:00 mandon
# full support of UTF8
# I2C functions
# eeprom write and read function
# support of 4800 bauds for serial
# added CTRL-ESC for inline help in editor
# ----------------------------------------------------
# $Id: pinguino.py,v beta 7 2009/08/22 17:01:00 mandon
# full support of 18F4550 with #define PIC18F4550 in source
# ----------------------------------------------------
# pinguino.py,v beta 8 mandon
# #define fixed
# pop up menu can be used in the editor with right click
# added line number to the editor
# Unlimited baud rate for function Serial.begin
# serial rx buffer length can be chosen with directive #RXBUFFERLENGTH, default 128 bytes
# ----------------------------------------------------
# pinguino.py,v beta 9 mandon
# modified GUI for logo, colors and windows (switched to wx.aui)
# fixed and improved the prepocessor, now use regex ( preprocessor function )
# added readlib function for external libraries
# changed the help shortkey in editor to CTRL space

import wx
import wx.aui
import editeur
import os
import re
import shutil
from subprocess import Popen,PIPE,STDOUT
import sys
import gettext          # to activate multi-language support
import locale           # to access system localization functionalities
import webbrowser
import usb

pinguino_version="Beta 9-05"

APP_CONFIG = sys.path[0]+"\\config"
THEME_DIR = sys.path[0]+"\\theme\\"
THEME_DEFAULT = "regino"

gui=False

class Pinguino(wx.Frame):
    
    global lang
    global gui
    
    debug_output=0
    noname=0
    processor="18f2550"
    reservedword=[]
    libinstructions=[]
    rw=[]
    THEME=[]

# ------------------------------------------------------------------------------
# id
# ------------------------------------------------------------------------------

    # id pref menu
    ID_THEME = wx.NewId()
    ID_DEBUG = wx.NewId()
    ID_THEME1 = 1000

    # id debug menu
    ID_USBBULK = wx.NewId()
    ID_CDC = wx.NewId()

    # id help menu
    ID_WEBSITE = wx.NewId()
    ID_BLOG = wx.NewId()
    ID_FORUM = wx.NewId()
    ID_GROUP = wx.NewId()
    ID_WIKI = wx.NewId()
    ID_TUTORIAL = wx.NewId()
    ID_ABOUT=wx.NewId()
    
    # other id
    ID_VERIFY = wx.NewId()
    ID_UPLOAD = wx.NewId()
    ID_TIMER = wx.NewId()        
                 
    def __init__(self, parent, id=-1, title='Pinguino',
                 pos=wx.DefaultPosition ,size=(600, 600),
                 style=wx.DEFAULT_FRAME_STYLE):

            # ----------------------------------------------------------------------
            # load settings from config file
            # ----------------------------------------------------------------------
            self.config = wx.FileConfig(    localFilename = APP_CONFIG,
                                            style = wx.CONFIG_USE_LOCAL_FILE)
            self.filehistory = wx.FileHistory()
            self.filehistory.Load(self.config)
            framesize = (    self.config.ReadInt('Window/Width', -1),
                            self.config.ReadInt('Window/Height', -1))
            framepos = (    self.config.ReadInt('Window/Posx', -1),
                            self.config.ReadInt('Window/Posy', -1))
            outputsize = (    self.config.ReadInt('Output/Width', -1),
                            self.config.ReadInt('Output/Height', -1))
            self.theme =     self.config.Read('Theme/name')
            if self.theme == '':
                self.theme = THEME_DEFAULT
                    
            wx.Frame.__init__(self, parent, id, title, framepos, framesize, style)
    
            loc = locale.getdefaultlocale()[0][0:2]
            self.lang = gettext.translation('pinguino', sys.path[0]+'\\locale', languages=[loc], fallback=True)
            _=self.lang.ugettext
    
            self.SetTitle('Pinguino '+pinguino_version)
            _icon = wx.EmptyIcon()
            _icon.CopyFromBitmap(wx.Bitmap(sys.path[0]+"/logo.png", wx.BITMAP_TYPE_ANY))
            self.SetIcon(_icon)           
    
            self._mgr = wx.aui.AuiManager(self)    
            
            self.menu = wx.MenuBar()
                            
            # file menu
            self.file_menu = wx.Menu()
            self.NEW = wx.MenuItem(self.file_menu, wx.ID_NEW, _("New"), "", wx.ITEM_NORMAL)
            self.file_menu.AppendItem(self.NEW)
            self.OPEN = wx.MenuItem(self.file_menu, wx.ID_OPEN, _("Open"), "", wx.ITEM_NORMAL)
            self.file_menu.AppendItem(self.OPEN)
            self.SAVE = wx.MenuItem(self.file_menu, wx.ID_SAVE, _("Save"), "", wx.ITEM_NORMAL)
            self.file_menu.AppendItem(self.SAVE)
            self.SAVEAS = wx.MenuItem(self.file_menu, wx.ID_SAVEAS, _("Save as"), "", wx.ITEM_NORMAL)
            self.file_menu.AppendItem(self.SAVEAS)
            self.CLOSE = wx.MenuItem(self.file_menu, wx.ID_CLOSE, _("Close"), "", wx.ITEM_NORMAL)
            self.file_menu.AppendItem(self.CLOSE)
            self.EXIT = wx.MenuItem(self.file_menu, wx.ID_EXIT, _("Exit"), "", wx.ITEM_NORMAL)
            self.file_menu.AppendItem(self.EXIT)
            # ---file history-------------------------------------------------------
            self.filehistory.UseMenu(self.file_menu)
            self.filehistory.AddFilesToMenu()            
            self.menu.Append(self.file_menu, _("File"))
            
            # edit menu
            self.edit_menu = wx.Menu()
            self.UNDO = wx.MenuItem(self.edit_menu, wx.ID_UNDO, _("Undo"), "", wx.ITEM_NORMAL)
            self.edit_menu.AppendItem(self.UNDO)
            self.REDO = wx.MenuItem(self.edit_menu, wx.ID_REDO, _("Redo"), "", wx.ITEM_NORMAL)
            self.edit_menu.AppendItem(self.REDO)
            self.edit_menu.AppendSeparator()
            self.FIND = wx.MenuItem(self.edit_menu, wx.ID_FIND, _("Find"), "", wx.ITEM_NORMAL)
            self.edit_menu.AppendItem(self.FIND)        
            self.REPLACE = wx.MenuItem(self.edit_menu, wx.ID_REPLACE, _("Replace"), "", wx.ITEM_NORMAL)
            self.edit_menu.AppendItem(self.REPLACE)
            self.REPLACE.Enable(False)
            self.edit_menu.AppendSeparator()        
            self.CUT = wx.MenuItem(self.edit_menu, wx.ID_CUT, _("Cut"), "", wx.ITEM_NORMAL)
            self.edit_menu.AppendItem(self.CUT)
            self.COPY = wx.MenuItem(self.edit_menu, wx.ID_COPY, _("Copy"), "", wx.ITEM_NORMAL)
            self.edit_menu.AppendItem(self.COPY)
            self.PASTE = wx.MenuItem(self.edit_menu, wx.ID_PASTE, _("Paste"), "", wx.ITEM_NORMAL)
            self.edit_menu.AppendItem(self.PASTE)  
            self.CLEAR = wx.MenuItem(self.edit_menu, wx.ID_CLEAR, _("Clear"), "", wx.ITEM_NORMAL)
            self.edit_menu.AppendItem(self.CLEAR)
            self.SELECTALL = wx.MenuItem(self.edit_menu, wx.ID_SELECTALL, _("Select all"), "", wx.ITEM_NORMAL)
            self.edit_menu.AppendItem(self.SELECTALL)                        
            self.menu.Append(self.edit_menu, _("Edit"))
            
            # preferences menu
            self.pref_menu = wx.Menu()
            # ---theme submenu
            self.theme_menu = wx.Menu()
            self.GetTheme()
            i = 0
            for th in self.themeList:
                self.THEME.append(wx.MenuItem(self.theme_menu, self.ID_THEME1 + i, th, "", wx.ITEM_CHECK))
                self.theme_menu.AppendItem(self.THEME[i])
                i = i + 1
            self.pref_menu.AppendMenu(self.ID_THEME, _("Themes"), self.theme_menu)
            # ---debug submenu
            self.debug_menu = wx.Menu()
            self.USBBULK = wx.MenuItem(self.debug_menu, self.ID_USBBULK, _("USB Bulk"), "", wx.ITEM_CHECK)
            self.debug_menu.AppendItem(self.USBBULK)
            self.USBBULK.Enable(False)
            self.CDC = wx.MenuItem(self.debug_menu, self.ID_CDC, _("CDC"), "", wx.ITEM_CHECK)
            self.debug_menu.AppendItem(self.CDC)
            self.CDC.Enable(False)
            self.pref_menu.AppendMenu(self.ID_DEBUG, _("Debug"), self.debug_menu)
            self.menu.Append(self.pref_menu, _("Preferences"))
            
            
            self.HELP = wx.Menu()
            self.ABOUT = wx.MenuItem(self.HELP, self.ID_WEBSITE, _("Website"), "", wx.ITEM_NORMAL)
            self.HELP.AppendItem(self.ABOUT)
            self.ABOUT = wx.MenuItem(self.HELP, self.ID_BLOG, _("Blog"), "", wx.ITEM_NORMAL)
            self.HELP.AppendItem(self.ABOUT)
            self.ABOUT = wx.MenuItem(self.HELP, self.ID_FORUM, _("Forum"), "", wx.ITEM_NORMAL)
            self.HELP.AppendItem(self.ABOUT)
            self.ABOUT = wx.MenuItem(self.HELP, self.ID_GROUP, _("Group"), "", wx.ITEM_NORMAL)
            self.HELP.AppendItem(self.ABOUT)                                      
            self.ABOUT = wx.MenuItem(self.HELP, self.ID_WIKI, _("Wiki"), "", wx.ITEM_NORMAL)
            self.HELP.AppendItem(self.ABOUT) 
            self.ABOUT = wx.MenuItem(self.HELP, self.ID_TUTORIAL, _("Tutorial"), "", wx.ITEM_NORMAL)
            self.HELP.AppendItem(self.ABOUT)        
            self.ABOUT = wx.MenuItem(self.HELP, self.ID_ABOUT, _("About..."), "", wx.ITEM_NORMAL)
            self.HELP.AppendItem(self.ABOUT)
            self.menu.Append(self.HELP, _("Help"))
            
            self.SetMenuBar(self.menu)

            # ------------------------------------------------------------------------------
            # Load toolbar icons
            # ------------------------------------------------------------------------------

            self.DrawToolbar()
                    
            # define output window
            
            self.logwindow = wx.TextCtrl(self, -1, "",wx.DefaultPosition,wx.Size(400,300), style=wx.TE_MULTILINE|wx.TE_READONLY)
            self.logwindow.SetBackgroundColour(wx.Colour(0, 0, 0))
            self.logwindow.SetForegroundColour(wx.Colour(255, 255, 255))
    
            # create a PaneInfo structure for output window
            
            PaneOutputInfo=wx.aui.AuiPaneInfo()
            PaneOutputInfo.CloseButton(False)
            PaneOutputInfo.MaximizeButton(True)
            PaneOutputInfo.MinimizeButton(True)
            PaneOutputInfo.Caption(_("Output"))
            PaneOutputInfo.Bottom()
    
            # create editor panel
            
            editorsize=self.GetSize()-self.logwindow.GetSize()
            editorsize=(editorsize[0],editorsize[1])
            self.EditorPanel = wx.Panel(self,-1,wx.DefaultPosition,wx.Size(400,100))
            self.pinguinobmp = wx.StaticBitmap(self.EditorPanel, -1, wx.Bitmap(sys.path[0]+"\\theme\\pinguinodesign.png", wx.BITMAP_TYPE_ANY))
            self.pinguinobmp.CentreOnParent(wx.BOTH) 
                    
            # create a PaneInfo structure for editor window 
            # this Paneinfo will be switched when loading a file
            
            self.PaneEditorInfo=wx.aui.AuiPaneInfo()
            self.PaneEditorInfo.CloseButton(False)
            self.PaneEditorInfo.MaximizeButton(True)
            self.PaneEditorInfo.Caption(_("Editor"))
            self.PaneEditorInfo.Top()
    
            # add the panes to the manager
            self._mgr.AddPane(self.toolbar, wx.aui.AuiPaneInfo().
                              Name("toolbar").Caption("Toolbar").
                              ToolbarPane().Top().Row(1).
                              LeftDockable(False).RightDockable(False))        
            self._mgr.AddPane(self.logwindow, PaneOutputInfo, '')
            self._mgr.AddPane(self.EditorPanel, wx.CENTER , '')
            
            self.editor = editeur.editeur(self.EditorPanel, -1,self.EditorPanel.GetSize())
     
            # tell the manager to 'commit' all the changes just made
            self._mgr.Update()        
    
# ------------------------------------------------------------------------------
# Event Management
# ------------------------------------------------------------------------------

            self.Bind(wx.EVT_SIZE, self.OnResize)
            self.Bind(wx.aui.EVT_AUI_RENDER, self.OnRender)
            self.Bind(wx.EVT_CLOSE, self.OnExit)
            # file menu
            self.Bind(wx.EVT_MENU, self.OnNew, self.NEW)
            self.Bind(wx.EVT_MENU, self.OnOpen, self.OPEN)
            self.Bind(wx.EVT_MENU_RANGE, self.OnFileHistory, id=wx.ID_FILE1, id2=wx.ID_FILE9) 
            self.Bind(wx.EVT_MENU, self.OnSave, self.SAVE)
            self.Bind(wx.EVT_MENU, self.OnSaveAs, self.SAVEAS)
            self.Bind(wx.EVT_MENU, self.OnClose, self.CLOSE)
            self.Bind(wx.EVT_MENU, self.OnExit, self.EXIT)
            
            # edit menu
            self.Bind(wx.EVT_MENU, self.editor.copy, self.COPY)
            self.Bind(wx.EVT_MENU, self.editor.paste, self.PASTE)
            self.Bind(wx.EVT_MENU, self.editor.cut, self.CUT)
            self.Bind(wx.EVT_MENU, self.editor.clear, self.CLEAR)       
            self.Bind(wx.EVT_MENU, self.editor.undo, self.UNDO)       
            self.Bind(wx.EVT_MENU, self.editor.redo, self.REDO)
            self.Bind(wx.EVT_MENU, self.OnFind, self.FIND)               
            self.Bind(wx.EVT_MENU, self.editor.selectall, self.SELECTALL)     
    
            # pref menu
            self.Bind(wx.EVT_MENU_RANGE, self.OnTheme, id=self.ID_THEME1, id2=self.ID_THEME1 + self.themeNum) 
    
            # icons bar
            self.Bind(wx.EVT_TOOL, self.OnVerify, id=self.ID_VERIFY)
            self.Bind(wx.EVT_TOOL, self.OnClose, id=wx.ID_CLOSE)
            self.Bind(wx.EVT_TOOL, self.OnNew, id=wx.ID_NEW)
            self.Bind(wx.EVT_TOOL, self.OnSave, id=wx.ID_SAVE)
            self.Bind(wx.EVT_TOOL, self.OnOpen, id=wx.ID_OPEN)
            self.Bind(wx.EVT_TOOL, self.OnUpload, id=self.ID_UPLOAD)
            self.Bind(wx.EVT_TOOL, self.OnFind, id=wx.ID_FIND)
            self.Bind(wx.EVT_TOOL, self.OnExit, id=wx.ID_EXIT)
            self.Bind(wx.EVT_TOOL, self.editor.undo, id=wx.ID_UNDO)
            self.Bind(wx.EVT_TOOL, self.editor.redo, id=wx.ID_REDO)
            self.Bind(wx.EVT_TOOL, self.editor.cut, id=wx.ID_CUT)
            self.Bind(wx.EVT_TOOL, self.editor.copy, id=wx.ID_COPY)
            self.Bind(wx.EVT_TOOL, self.editor.paste, id=wx.ID_PASTE)
            self.Bind(wx.EVT_TOOL, self.editor.clear, id=wx.ID_CLEAR)
            self.Bind(wx.EVT_TOOL, self.editor.selectall, id=wx.ID_SELECTALL)
    
            # help menu
            self.Bind(wx.EVT_TOOL, self.website, id=self.ID_WEBSITE)     # website
            self.Bind(wx.EVT_TOOL, self.website, id=self.ID_BLOG)         # blog   
            self.Bind(wx.EVT_TOOL, self.website, id=self.ID_FORUM)         # forum
            self.Bind(wx.EVT_TOOL, self.website, id=self.ID_GROUP)         # group        
            self.Bind(wx.EVT_TOOL, self.website, id=self.ID_WIKI)         # wiki
            self.Bind(wx.EVT_TOOL, self.website, id=self.ID_TUTORIAL)     # tutorial
            self.Bind(wx.EVT_MENU, self.OnAbout, self.ABOUT)
                   
            # initialize all the lib pdl in /lib folder
            self.readlib()

            self.displaymsg("Welcome to " + pinguino_version + "\n", 0);

            # check current theme in menu
            id = self.theme_menu.FindItem(self.theme)
            self.menu.Check(id, True)

    def OnNew(self, event):
        try:
            self.pinguinobmp.Destroy()
        except:
            pass 
        self.editor.New("NoName"+str(self.noname),self.reservedword,self.rw)
        self.noname+=1

    def OnOpen(self, event):
        try:
            self.pinguinobmp.Destroy()
        except:
            pass 
        self.editor.OpenDialog("Pde Files","pde",self.reservedword,self.rw, self.filehistory, self.config)

# ------------------------------------------------------------------------------
# OnFileHistory : open selected history file
# ------------------------------------------------------------------------------

    def OnFileHistory(self, event):
        fileNum = event.GetId() - wx.ID_FILE1
        path = self.filehistory.GetHistoryFile(fileNum)
        self.filehistory.AddFileToHistory(path)                  # move up the list
        self.editor.Open(path,self.reservedword,self.rw, self.filehistory, self.config)
        # refresh file menu (doesn't seem to work)
        self.file_menu.UpdateUI()
        
# ------------------------------------------------------------------------------
#
# ------------------------------------------------------------------------------

    def OnSave(self, event): 
        self.editor.SaveDirect()

# ------------------------------------------------------------------------------
#
# ------------------------------------------------------------------------------

    def OnSaveAs(self, event): 
        self.editor.Save("Pde Files","pde")

# ------------------------------------------------------------------------------
# Close Editor Window
# ------------------------------------------------------------------------------

    def OnClose(self, event): 
        # close editor
        self.editor.Close()
        
# ------------------------------------------------------------------------------
# Exit Program
# ------------------------------------------------------------------------------

    def OnExit(self, event):
        try:
            self.pinguino.close();
        except:
            pass        
        # ---save settings-----------------------------------------------
        #if not self.IsIconized() and not self.IsMaximized():
        w, h = self.GetSize()
        self.config.WriteInt('Window/Width', w)
        self.config.WriteInt('Window/Height', h)
        x, y = self.GetPosition()
        self.config.WriteInt('Window/Posx', x)
        self.config.WriteInt('Window/Posy', y)
        w, h = self.logwindow.GetSize()
        self.config.WriteInt('Output/Width', w)
        self.config.WriteInt('Output/Height', h)
        self.config.Write('Theme/name', self.theme)
        self.config.Flush()
        # ----------------------------------------------------------------------
        # deinitialize the frame manager
        self._mgr.UnInit()
        # delete the frame
        self.Destroy()
        sys.exit(0)
        
# ------------------------------------------------------------------------------
# GetTheme : get all the theme (directory) name
# ------------------------------------------------------------------------------

    def GetTheme(self):
        self.themeList = [f for f in os.listdir(THEME_DIR)
            if os.path.isdir(os.path.join(THEME_DIR, f))]
        self.themeNum = len(self.themeList)

# ------------------------------------------------------------------------------
# OnTheme : delete current theme and load a new one
# ------------------------------------------------------------------------------

    def OnTheme(self, event):
        # uncheck all
        for f in self.themeList:
            id = self.theme_menu.FindItem(f)
            self.menu.Check(id, False)
        # check selected only
        curid = event.GetId()
        themeNum = curid - self.ID_THEME1
        self.menu.Check(curid, True)
        self.theme = self.themeList[themeNum]
        self.DrawToolbar()

# ------------------------------------------------------------------------------
# Draw toolbar icons
# ------------------------------------------------------------------------------

    def DrawToolbar(self):
        try:
            # Deletes all the tools in the current toolbar
            self.toolbar.ClearTools()    
        except:
            # Create toolbar
            self.toolbar = wx.ToolBar(self, -1, wx.DefaultPosition, wx.DefaultSize, wx.TB_FLAT | wx.TB_NODIVIDER)
            pass 
        # Get size of new theme's icons
        icon = wx.Bitmap(THEME_DIR + self.theme + "/open.png", wx.BITMAP_TYPE_ANY)
        iconSize = icon.GetSize()
        # Update Bitmap size to fit new icons (not sure that it works !)
        self.toolbar.SetToolBitmapSize(iconSize)

        self.toolbar.AddLabelTool(wx.ID_NEW, "&New", wx.Bitmap(THEME_DIR + self.theme + "\\new.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "New File", "")
        self.toolbar.AddLabelTool(wx.ID_OPEN, "&Open", wx.Bitmap(THEME_DIR + self.theme + "\\open.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Open File", "")
        self.toolbar.AddLabelTool(wx.ID_SAVE, "&Save", wx.Bitmap(THEME_DIR + self.theme + "\\save.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Save File", "")
        self.toolbar.AddLabelTool(wx.ID_CLOSE, "&Close", wx.Bitmap(THEME_DIR + self.theme + "\\stop.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Close File", "")
        self.toolbar.AddSeparator()
        self.toolbar.AddLabelTool(wx.ID_UNDO, "&Undo", wx.Bitmap(THEME_DIR + self.theme + "\\undo.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Undo", "")
        self.toolbar.AddLabelTool(wx.ID_REDO, "&Redo", wx.Bitmap(THEME_DIR + self.theme + "\\redo.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Redo", "")
        self.toolbar.AddSeparator()
        self.toolbar.AddLabelTool(wx.ID_CUT, "&Cut", wx.Bitmap(THEME_DIR + self.theme + "\\cut.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Cut", "")
        self.toolbar.AddLabelTool(wx.ID_COPY, "&Copy", wx.Bitmap(THEME_DIR + self.theme + "\\copy.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Copy", "")
        self.toolbar.AddLabelTool(wx.ID_PASTE, "&Paste", wx.Bitmap(THEME_DIR + self.theme + "\\paste.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Paste", "")
        self.toolbar.AddLabelTool(wx.ID_CLEAR, "&Clear", wx.Bitmap(THEME_DIR + self.theme + "\\clear.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Clear", "")
        self.toolbar.AddLabelTool(wx.ID_SELECTALL, "&Select all", wx.Bitmap(THEME_DIR + self.theme + "\\select.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Select all", "")
        self.toolbar.AddSeparator()
        self.toolbar.AddLabelTool(wx.ID_FIND, "&Find", wx.Bitmap(THEME_DIR + self.theme + "\\find.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Search in File", "")
        self.toolbar.AddSeparator()
        self.toolbar.AddLabelTool(self.ID_VERIFY, "&Verify", wx.Bitmap(THEME_DIR + self.theme + "\\runw.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Compile", "")
        self.toolbar.AddLabelTool(self.ID_UPLOAD, "&Upload", wx.Bitmap(THEME_DIR + self.theme + "\\dwn.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Upload to Pinguino", "")                   
        self.toolbar.AddLabelTool(self.ID_USBBULK, "&Debug On/Off", wx.Bitmap(THEME_DIR + self.theme + "\\debug.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_CHECK, "USB Connexion with Pinguino", "")                   
        self.toolbar.AddSeparator()
        self.toolbar.AddLabelTool(wx.ID_EXIT, "&Exit", wx.Bitmap(THEME_DIR + self.theme + "\\exit.png", wx.BITMAP_TYPE_ANY), wx.NullBitmap, wx.ITEM_NORMAL, "Exit Pinguino IDE", "")

        self.toolbar.Realize()
                
    def OnRender(self,event):
        self.OnResize(event)
        #event.Skip()

    def OnResize(self,event):
        try:
            self.pinguinobmp.CentreOnParent(wx.BOTH)
        except:
            pass        
        self.editor.Resize()
        self._mgr.Update       
        event.Skip()

    def OnAbout(self,event):
        description = """Pinguino is an Arduino like built with a Microchip
        18F2550 microcontroller. It is an open software 
        and open hardware project. Its main goal is to build a real USB system without USB to serial 
        converter.
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

        info.SetIcon(wx.Icon(sys.path[0]+'\\theme\\logo.png', wx.BITMAP_TYPE_PNG))
        info.SetName('Pinguino')
        info.SetVersion(pinguino_version)
        info.SetDescription(description)
        info.SetCopyright('2008,2009,2010 jean-pierre mandon')
        info.SetWebSite('http://www.hackinglab.org')
        info.SetLicence(licence)
        info.AddDeveloper('Jean-Pierre Mandon')
        info.AddDeveloper('Regis Blanchot')
        info.AddDeveloper('Ivan Ricondo')
        info.AddDeveloper('Joan Espinoza')
        info.AddDeveloper('Jesús Carmona Esteban')        
        info.AddDeveloper('Marcus Fazzi')        
        info.AddDocWriter('Benoit Espinola')
        info.AddDocWriter('Sebastien Koechlin')
        info.AddDocWriter('Ivan Ricondo')
        info.AddDocWriter('Jesús Carmona Esteban')
        info.AddDocWriter('Marcus Fazzi')
        info.AddArtist('france Cadet')
        info.AddArtist('Laurent Costes')
        info.AddTranslator('Joan Espinoza Spanish, Portuguese')
        info.AddTranslator('Marin Purgar Croatian')
        info.AddTranslator('Wim Heirman German')
        info.AddTranslator('Vasile Guta Ciucur Romanian')
        wx.AboutBox(info)  
        
    def readlib(self):
        # trying to find PDL files to store reserved words
        for i in os.listdir(sys.path[0]+"\\lib\\"):
            filename,extension=os.path.splitext(i)
            if extension==".pdl":
                # check content of the PDL file
                libfile=open(sys.path[0]+"\\lib\\"+i,'r')
                for line in libfile:
                    instruction=line[0:line.find(" ")]
                    cnvinstruction=line[line.find(" ")+1:line.find("#")]
                    libpath=line[line.find("#")+1:len(line)]    
                    self.libinstructions.append([instruction,cnvinstruction,libpath])
                libfile.close()
        if len(self.libinstructions)!=0:
            for i in range(len(self.libinstructions)):
                chaine=self.libinstructions[i][0]
                self.rw.append(chaine)
                if chaine.find(".")!=-1:
                    self.reservedword.append(chaine[0:chaine.find(".")])
                    self.reservedword.append(chaine[chaine.find(".")+1:len(chaine)])
                else:
                    self.reservedword.append(chaine)
            # sort keywords for short key help
            self.rw.sort(key=lambda x: x.lower())
        # adding fixed reserved word
        fixed_rw=("setup","loop","HIGH","LOW","INPUT","OUTPUT","void","FOSC","MIPS","ON","OFF","TRUE","FALSE")
        for i in range(len(fixed_rw)):
            self.reservedword.append(fixed_rw[i])
            
                     
    def OnVerify(self, event):
        if self.editor.GetPath()==-1:
            dlg = wx.MessageDialog(self,
            self.lang.ugettext('Open file first !!'),self.lang.ugettext('Warning'),
            wx.OK | wx.ICON_WARNING
            )
            result=dlg.ShowModal()
            dlg.Destroy()            
            return
        self.displaymsg("",1)
        self.editor.SaveDirect()
        filename=self.editor.GetPath()
        filename,extension=os.path.splitext(filename)
        if os.path.exists(filename+".hex"):
            os.remove(filename+".hex")
        if os.path.exists(sys.path[0]+"\\source\\user.c"):
            os.remove(sys.path[0]+"\\source\\user.c")
        retour=self.preprocess(filename)
        if retour=="error":
            return
        retour=self.compile()
        if retour!=0:
            self.displaymsg(self.lang.ugettext("error while compiling file ")+filename,0)
        else:
            retour=self.assemble()
            retour=self.link()
            if os.path.exists(sys.path[0]+"\\source\\main.hex")!=True:
                self.displaymsg(self.lang.ugettext("error while linking ")+filename+".o",0)
            else:
                self.cp(sys.path[0]+"\\source\\main.hex",filename+".hex")
                self.displaymsg(self.lang.ugettext("compilation done"),0)
                self.getCodeSize(filename)
                os.remove(sys.path[0]+"\\source\\main.hex")
                os.remove(filename+".c")         

    def OnUpload(self, event):
        if self.editor.GetPath()!=-1:
            filename=self.editor.GetPath()
            filename,extension=os.path.splitext(filename)
            if os.path.exists(filename+".hex"):
                self.displaymsg("",1)
                sys.argv=["vascoboot1.3.py",filename+".hex"]
                execfile(sys.path[0]+"\\tools\\bin\\bootloader\\vascoboot1.3.py")
                #filename+".hex"],
            else:
                dlg = wx.MessageDialog(self,
                self.lang.ugettext('File must be compiled first'),self.lang.ugettext('Warning'),
                wx.OK | wx.ICON_INFORMATION
                )
                result=dlg.ShowModal()
                dlg.Destroy()
        else:
            dlg = wx.MessageDialog(self,
            self.lang.ugettext('Nothing to upload !!'),self.lang.ugettext('Warning'),
            wx.OK | wx.ICON_WARNING
            )
            result=dlg.ShowModal()
            dlg.Destroy()            
        event.Skip()

    def OnFind(self,event):
        self.PaneFindInfo=wx.aui.AuiPaneInfo()
        self.PaneFindInfo.CloseButton(False)
        self.PaneFindInfo.MaximizeButton(False)
        self.PaneFindInfo.Caption(self.lang.ugettext("Find"))
        self.PaneFindInfo.CaptionVisible(False)
        self.PaneFindInfo.Dockable(False)
        self.PaneFindInfo.Resizable(False)
        self.PaneFindInfo.Movable(False)
        self.PaneFindInfo.RightDockable(False)
        self.PaneFindInfo.LeftDockable(False)
        self.PaneFindInfo.Top()       
        findpanelsize=(self.GetSize()[0],35)
        self.FindPanel = wx.Panel(self,size=findpanelsize)
        self._mgr.AddPane(self.FindPanel,self.PaneFindInfo)
        self._mgr.Update()
        self.FindText=wx.TextCtrl(self.FindPanel,size=(160,25),pos=(20,4))
        self.FindPrevious=wx.Button(self.FindPanel,size=(90,25),label="Previous",pos=(210,5))
        self.FindNext=wx.Button(self.FindPanel,size=(90,25),label="Next",pos=(320,5))
        self.Bind(wx.EVT_BUTTON, self.findnext, self.FindNext)  
        self.Bind(wx.EVT_BUTTON, self.findprev, self.FindPrevious)               
        self.FindText.SetFocus()       
        self._mgr.Update()        
        event.Skip()

    def findprev(self,event):
        chaine=self.FindText.GetString(0,self.FindText.GetLastPosition())
        trouve=self.editor.find(chaine,0)
        if trouve!=-1:
            self.editor.highlightline(trouve,'yellow')
            self.editor.focus()
        event.Skip()    
        
    def findnext(self,event):
        chaine=self.FindText.GetString(0,self.FindText.GetLastPosition())
        trouve=self.editor.find(chaine,1)
        if trouve!=-1:
            self.editor.highlightline(trouve,'yellow')
            self.editor.focus()
        event.Skip()    

    def website(self,event):
        id=event.GetId()
        if id==33:
            webbrowser.open("http://www.hackinglab.org")
        if id==34:
            webbrowser.open("http://jpmandon.blogspot.com/")
        if id==35:
            webbrowser.open("http://www.italentshare.com/pinguinoforum/")  
        if id==36:
            webbrowser.open("http://groups.google.fr/group/pinguinocard?pli=1")  
        if id==37:
            webbrowser.open("http://pinguino.koocotte.org/index.php/Main_Page")
        if id==38:
            webbrowser.open("http://sites.google.com/site/pinguinotutorial/home")                                         

    def displaymsg(self,message,clearpanel):
        """ display message in the log window """
        global gui
        if gui==True:
            if clearpanel==1:
                self.logwindow.Clear()
            self.logwindow.WriteText(message)
        else:
            if message!="":
                print message
        return    

    def cp(self,file1,file2):
        file1=file1.replace("\\\\","\\")
        file2=file2.replace("\\\\","\\")
        shutil.copyfile(file1,file2)
        return
    
    def preprocess(self,filename):
        defineword={}
        self.processor="18f2550"
        index=0
        fileline={}

        #clear old define.h file
        if os.path.exists(sys.path[0]+"\\tmp\\define.h"):
            os.remove(sys.path[0]+"\\tmp\\define.h")
        # insert standart define for arduino
        self.adddefine("#define INPUT 1")
        self.adddefine("#define OUTPUT 0")
        self.adddefine("#define HIGH 1")
        self.adddefine("#define LOW 0")
        self.adddefine("#define DEC 1")
        self.adddefine("#define BYTE 2")
        self.adddefine("#define HEX 3")
        self.adddefine("#define OCTAL 4") 
        self.adddefine("#define BIN 5")     
        self.adddefine("#define FOSC 48000000") # 48MHz
        self.adddefine("#define MIPS (FOSC/4)") # Million instructions per second
        self.adddefine("#define ON 1")
        self.adddefine("#define OFF 0")
        self.adddefine("#define TRUE 1")
        self.adddefine("#define FALSE 0") 
        self.adddefine("typedef unsigned char byte;")
        self.adddefine("typedef unsigned int  word;")
        self.adddefine("typedef unsigned long dword;") 
                    
        # prepare file      
        path,name=os.path.split(filename)
        self.cp(filename+".pde",sys.path[0]+"\\tmp\\"+name+".c")
        fichier=open(sys.path[0]+"\\tmp\\"+name+".c",'a')
        fichier.writelines("\n")
        fichier.close()
        
        # check #include and #define processor
        fichier=open(sys.path[0]+"\\tmp\\"+name+".c",'r')
        i=0
        for line in fichier:
            if line.find("PIC18F4550")!=-1:
                self.adddefine("#define PIC18F4550")
                self.processor="18f4550"
                fileline[i]="\r\n"
                i=i+1
            elif line.find("#include")!=-1:
                    self.adddefine(line)
                    fileline[i]="\r\n";        
                    i=i+1
            else:
                fileline[i]=line
                i=i+1
        fichier.close()
        
        # rewrite file
        #fichier=open(sys.path[0]+"/tmp/"+name+".c",'w')
        fichier=open(sys.path[0]+"\\tmp\\"+"temp.c",'w')
        for cpt in range(i):
            fichier.write(fileline[cpt])
        fichier.close()
               
        # research and replace arduino keywords in file
        fichier=open(sys.path[0]+"\\tmp\\temp.c",'r')
        nblines=0
        for line in fichier:
            resultline=self.replaceword(line)
            if resultline.find("error")==1:
                line=resultline
                print "error"
                self.displaymsg("error "+resultline,1)
                return "error"
            fileline[nblines]=resultline
            nblines+=1        
        fichier.close()
        # save new tmp file
        fichier=open(sys.path[0]+"\\tmp\\temp.c",'w')
        for i in range(0,nblines):
            fichier.writelines(fileline[i])
        fichier.writelines("\r\n")
        fichier.close()
        #copy tmp file to file directory
        self.cp(sys.path[0]+"\\tmp\\temp.c",filename+".c")
        self.cp(sys.path[0]+"\\tmp\\temp.c",sys.path[0]+"\\source\\user.c")                 
        return
        
    def adddefine(self,chaine):
        """ add #define in define.h file """
        fichier=open(sys.path[0]+"\\tmp\\define.h",'a')
        fichier.writelines(chaine+"\n")
        fichier.close()

    def notindefine(self,chaine):
        """ verify if #define exists in define.h file """
        fichier=open(sys.path[0]+"\\tmp\\define.h",'r') 
        for line in fichier:
            if line.find(chaine)!=-1:
                fichier.close()
                return(0)
        fichier.close()
        return(1)          

    def replaceword(self,ligne):
        """ convert arduino langage in C langage """
        insruction=""
        line=ligne
        # delete space and tabs
        ligne=ligne.replace(" ","")
        ligne=ligne.replace(chr(9),"")
        if ligne[0:2]=="//":
            ligne="//\r\n"
            return ligne
        if ligne.find("//")!=-1:
            ligne=ligne[0:ligne.find("/")]
            ligne=ligne+"\r\n"
        
        for i in range(len(self.libinstructions)):
            pattern="(^|[' ']|['!']|['=']|['{']|[',']|[\t]|['('])"+str(self.libinstructions[i][0])+"[ ]*\("
            if re.search(pattern,line):
                line=line.replace(str(self.libinstructions[i][0]),str(self.libinstructions[i][1]))
                if self.notindefine("#"+str(self.libinstructions[i][2]))==1:
                    self.adddefine("#"+str(self.libinstructions[i][2]))        
        return line

    def compile(self):
        filename = self.editor.GetPath()
        chemin = os.path.dirname(filename)
        fichier = open(sys.path[0]+"\\tmp\\stdout", 'w+')
        sortie=Popen([sys.path[0]+"\\tools\\bin\\sdcc.exe",
            "-mpic16",
            "--denable-peeps",
            "--obanksel=9",
            "--opt-code-size",
            "--optimize-cmp",
            "--optimize-df",
            "-p"+self.processor,
            "-I"+sys.path[0]+"\\include",
            "-I"+chemin,
            "-S",
            "-o"+sys.path[0]+"\\source\\main.asm",
            sys.path[0]+"\\source\\main.c"],
            stdout=fichier,stderr=STDOUT)
        sortie.communicate()
        if sortie.poll()!=0:
            fichier.seek(0)
            self.displaymsg(fichier.read(), 0)
        fichier.seek(0)
        # this code don't work on windows
        # this is a sdcc bug ( return file name with / )
        #if line.find("error")!=-1:
        #    number=line[line.find(":")+1:line.find("error")-2]
        #    self.editor.highlightline(int(number)-1)
        #    self.displaymsg("error line"+" "+number+"\n",1)
        #    self.displaymsg(line[line.find("error")+10:len(line)],0)
        fichier.close()
        return sortie.poll()
        
    def assemble(self):
        fichier = open(sys.path[0]+"\\tmp\\stdout", 'w+')
        sortie=Popen([sys.path[0]+"\\tools\\asm.bat",
                    sys.path[0]+"\\tools\\bin",
                    sys.path[0]+"\\source"],stdout=fichier,stderr=STDOUT)
        sortie.communicate()
        self.displaymsg(fichier.read(),0)
        fichier.seek(0)
        fichier.close()
        return sortie.poll()
    
    def link(self):
        fichier = open(sys.path[0]+"\\tmp\\stdout", 'w+')
        sortie=Popen([sys.path[0]+"\\tools\\link.bat",
                    sys.path[0],self.processor],stdout=fichier,stderr=STDOUT)
        sortie.communicate()
        fichier.seek(0)
        fichier.close()
        return sortie.poll()

    def getCodeSize(self, filename):
        totalspace = 0x7FFF - 0x2000;
        codesize = 0
        fichier = open(filename + ".hex", 'r')
        lines = fichier.readlines()
        for line in lines:
            # count only data record
            if line[7:9:1] == "00":
                byte = "0x" + line[1:3:1]
                codesize = codesize + int(byte, 0)
        fichier.close()
        self.displaymsg("\n" + self.lang.ugettext("code size: ") + str(codesize) + " / " + str(totalspace) + self.lang.ugettext(" bytes") + " (" + str(100*codesize/totalspace) + "% used)", 0)
        print "code size: " + str(codesize) + " / " + str(totalspace) + " bytes (" + str(100*codesize/totalspace) + "% used)"                                        


if __name__ == "__main__":
    app = wx.PySimpleApp(0)
    if "-nogui" in sys.argv:
        print "Pinguino "+pinguino_version
        pobject=Pinguino(None, -1, "")
        if len(sys.argv)<3:
            print "missing filename"
            sys.exit(1)
        if sys.argv[1]=="-nogui":
            filename=sys.argv[2]
        else:
            filename=sys.argv[1]
        name,extension=os.path.splitext(filename)
        if extension!=".pde":
            print "bad file extension, it should be .pde"
            sys.exit(1)
        retour=pobject.preprocess(name)
        if retour=="error":
            print "error while preprocessing "+filename
            sys.exit(1)
        retour=pobject.compile(filename)
        if retour!=0:
            print "error while compiling file "+filename
            sys.exit(1)
        else:
            retour=pobject.link(filename)
            if os.path.exists(sys.path[0]+"\\source\\main.hex")!=True:
                print "error while linking "
                sys.exit(1)
            else:
                pobject.cp(sys.path[0]+"\\source\\main.hex",name+".hex")
                print "compilation done"
                pobject.getCodeSize(filename)
                os.remove(sys.path[0]+"\\source\\main.hex")
                os.remove(name+".c")       
                sys.exit(0)
    wx.InitAllImageHandlers()
    gui=True
    frame_1 = Pinguino(None, -1, "")
    app.SetTopWindow(frame_1)
    frame_1.Show()
    app.MainLoop()
