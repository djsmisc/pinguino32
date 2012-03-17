#!/usr/bin/env python
#-*- coding: utf-8 -*-

import wx
from metodos import Metodos
from pages import pages

########################################################################
class Preferences(Metodos):
    #----------------------------------------------------------------------
    def __init__(self, parent):
        self._init_ctrls(parent)
        self.Bind(wx.EVT_LISTBOX, self.setPage, self.listBox1)
        self.Bind(wx.EVT_BUTTON, self.setDefaultConfig, self.Button_default)
        self.Bind(wx.EVT_BUTTON, self.writeConfig, self.Button_apply)
        self.Bind(wx.EVT_BUTTON, lambda x:self.Close(), self.Button_close)
        
        self.Bind(wx.EVT_SPLITTER_SASH_POS_CHANGED,  self.OnResize, self.splitterWindow1)
        self.Bind(wx.EVT_SIZE, self.OnResize)
        
        self.allPanels = {}
        
        for page in pages.keys():            
            self.listBox1.Append(page)
            self.allPanels[page] = self.getPanel(pages[page])
        
        panel = self.getPanel(pages['Appearance'])
        panel.Show()
        self.currentPanel = {"name" : 'Appearance',
                             "panel": panel}
        self.setPage("Appearance")
            
        self.IDE = parent
        self.__initAppearance__()
            
            
    #----------------------------------------------------------------------
    def getPanel(self, panel):
        panel = panel(parent=self.sashWindow1,
                     id=wx.NewId(),
                     pos=(0, 0),
                     size=self.sashWindow1.Size,
                     style=wx.TAB_TRAVERSAL,
                     name="page")
        self.sashWindow1.Fit()
        panel.Hide()
        return panel
        
    #----------------------------------------------------------------------
    def setPage(self, event):
        
        if type(event) == type(""): string = event
        else: string = event.GetString()
        
        self.currentPanel["panel"].Hide()
        panel = self.allPanels[string]
        panel.Show()
        self.currentPanel = {"name" : string,
                             "panel" : panel}
        
        panel.SetPosition((0, 0))        
        panel.SetExtraStyle(wx.TAB_TRAVERSAL )
        panel.SetMinSize((-1, -1))
        panel.SetMaxSize((-1, -1))
        panel.SetSize(self.sashWindow1.Size)
        
        self.boxSizer3 = wx.BoxSizer(orient=wx.VERTICAL)
        self.boxSizer3.AddWindow(panel, 1, border=0, flag=wx.EXPAND)
        self.sashWindow1.SetSizer(self.boxSizer3)           
                
    #----------------------------------------------------------------------
    def OnResize(self, event):
        self.currentPanel["panel"].SetSize(self.sashWindow1.Size)
        event.Skip()        
        
    #----------------------------------------------------------------------
    def readConfig(self, event=None):
        print "Loading Config"
        
    #----------------------------------------------------------------------
    def writeConfig(self, event=None):
        self.IDE.appyPreferences()
        
    #----------------------------------------------------------------------
    def setDefaultConfig(self, event=None):
        print "Restaurando Config"
        


if __name__=='__main__':
    app=wx.PySimpleApp()
    frame=perro(parent=None)
    frame.Show()
    app.MainLoop()

