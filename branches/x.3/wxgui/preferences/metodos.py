#!/usr/bin/env python
#-*- coding: utf-8 -*-

from framePreferences import FramePreferences
import sys, os
import wx

HOME_DIR	= sys.path[0]
THEME_DIR	= os.path.join(HOME_DIR, 'theme')

########################################################################
class Metodos(FramePreferences):

    #----------------------------------------------------------------------
    def __initAppearance__(self):
        Appearance = self.allPanels["Appearance"]
        self.themeList = [f for f in os.listdir(THEME_DIR)
                          if os.path.isdir(os.path.join(THEME_DIR, f))
                          and not f.startswith(".")]   
        Appearance.comboBox1_theme.AppendItems(self.themeList)
        Appearance.comboBox1_theme.SetStringSelection(self.IDE.theme)
        self.Bind(wx.EVT_COMBOBOX,  self.SetTheme, Appearance.comboBox1_theme)
    
    #---------------------------------------------------------------------- 
    def SetTheme(self, event):
        tid = event.GetInt()
        self.IDE.theme = self.themeList[tid]
    