#!/usr/bin/env python
#-*- coding: utf-8 -*-


"""File to test features"""

#from autoCompleter import autoCompleter
##from keywords import functionsHelp
#from debugger import Debugger
#from lateral_dock import File, Documents, Search

import sys, os, zipfile, re, wx

import  wx.lib.mixins.listctrl  as  listmix
from ConfigParser import RawConfigParser

from dic import Dictionary, Snippet


HOME_DIR    = sys.path[0]
APP_CONFIG    = os.path.join(HOME_DIR, '.config')

########################################################################
class Testing():
    """"""
    #----------------------------------------------------------------------
    def loadConfig(self):
        config_file=open(APP_CONFIG,"r")
        self.configIDE=RawConfigParser()
        self.configIDE.readfp(config_file) 
        config_file.close()
        
        
    #----------------------------------------------------------------------
    def setConfig(self,section,opcion,valor):
        #self.loadConfig()
        if not section in self.configIDE.sections():
            self.configIDE.add_section(section)
        
        self.configIDE.set(section,opcion,valor)
        
        
    #----------------------------------------------------------------------
    def saveConfig(self):
        config_file=open(APP_CONFIG,"w")
        self.configIDE.write(config_file)
        config_file.close()
    
    #----------------------------------------------------------------------
    def getConfig(self,section,option):
        value = self.configIDE.get(section,option)
        if value.isdigit(): return int(value)
        elif value.isalpha(): return value
        #elif os.path.isfile(value): return value
        
        else: return value
            
        
            
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    #----------------------------------------------------------------------
    def getPOT(self):
        main = os.path.join(sys.path[0], "wxgui")
        PythonFiles = [os.path.join(sys.path[0], "pinguino.py")]
        exceptions = ["argparse.py"]
        
        def getData(path):
            yy = os.listdir(path)
            for i in yy:
                if os.path.isfile(os.path.join(path, i)) and (i.endswith(".py") or i.endswith(".pyw") and not i.startswith(".")) and not i in exceptions:
                    PythonFiles.append(os.path.join(path, i))
                elif os.path.isdir(os.path.join(path, i)):
                    getData(os.path.join(path, i))
        getData(main)
        
        path = sys.path[0]
        files = " ".join(PythonFiles)
        os.system("xgettext -k_ -kN_ -o pinguino.pot %s" %files)

            

    #----------------------------------------------------------------------
    def OnMarginClick(self, evt):
        if evt.GetMargin() == 3:
            if evt.GetShift() and evt.GetControl():
                self.stcpage[self.notebookEditor.GetSelection()].FoldAll()
            else:
                lineClicked = self.stcpage[self.notebookEditor.GetSelection()].LineFromPosition(evt.GetPosition())
                if self.stcpage[self.notebookEditor.GetSelection()].GetFoldLevel(lineClicked) & wx.stc.STC_FOLDLEVELHEADERFLAG:
                    self.stcpage[self.notebookEditor.GetSelection()].ToggleFold(lineClicked)
                    
        #elif evt.GetMargin() in [1, 2]:
            #textEdit = self.stcpage[self.notebookEditor.GetSelection()]
            #line = textEdit.LineFromPosition(evt.Position)
            #if textEdit.MarkerGet(line) == 0:
                ##textEdit.MarkerDefine (2, wx.stc.STC_MARK_SHORTARROW, "white", "white")
                #textEdit.MarkerAdd(line, 2)
            #if textEdit.MarkerGet(line) == 4:
                ##textEdit.MarkerDefine (2, wx.stc.STC_MARK_SHORTARROW, "white", "white")
                #textEdit.MarkerAdd(line, 0)    
            
            ##print margin
            
        
        
        
        
        
        
        
        
        
        
        
        
#plug-ins ¿?
########################################################################
##                            Plug-Ins                                ##
########################################################################
    ##----------------------------------------------------------------------
    #def OnPlugIn(self, event):
        #self.notebookPlugins.Show()
        #self.notebookEditor.Reparent(self.panelEditorPlug)
        #self.moveNotebookEditor2Plugins()
        ##self.importPlugin()
        
    ##----------------------------------------------------------------------
    #def NoPlugIn(self, event):
        #self.notebookPlugins.Hide()
        #self.notebookEditor.Reparent(self.panelEditor)
        #self.moveNotebookEditor2Normal()
   
    ##----------------------------------------------------------------------
    #def moveNotebookEditor2Normal(self):
        #bSizer3 = wx.BoxSizer( wx.VERTICAL )
        #bSizer3.Add( self.notebookEditor, 1, wx.EXPAND, 5 )
        #self.panelEditor.SetSizer( bSizer3 )
        #bSizer3.Fit( self.panelEditor )
        #self.panelEditor.Fit()
        #self.updateIDE()
        
    ##----------------------------------------------------------------------
    #def moveNotebookEditor2Plugins(self):
        #bSizer2 = wx.BoxSizer( wx.VERTICAL )
        #bSizer2.Add( self.notebookPlugins, 1, wx.EXPAND, 5 )
        #self.panelEditor.SetSizer( bSizer2 )
        #bSizer2.Fit( self.panelEditor )
        #bSizer3 = wx.BoxSizer( wx.VERTICAL )
        #bSizer3.Add( self.notebookEditor, 1, wx.EXPAND, 5 )
        #self.panelEditorPlug.SetSizer( bSizer3 )
        #bSizer3.Fit( self.panelEditorPlug )        
        #self.panelEditorPlug.Fit()
        #self.panelEditor.Fit()
        #self.updateIDE()
        
    ##----------------------------------------------------------------------
    #def importPlugin(self):
        #plugins = self.get_all_modules()
        #for plugin in plugins:
            #page = plugin.PlugIN(self.notebookPlugins)
            #page.__initPlugin__()
            #self.notebookPlugins.AddPage(page, plugin.PlugIN.PluginName)
        
    ##----------------------------------------------------------------------
    #def get_all_modules(self):
        #path= os.path.join(sys.path[0], "plugins")
        #ficheros=os.listdir(path)
        #all_modules=[]
        #for file in ficheros:
            #if file.endswith(".zip"):
                #sys.path.append(os.path.join(path, file))
                #mod = __import__(file[:-4])        
                #all_modules.append(mod)
            
            #elif os.path.isdir(os.path.join(path, file)):
                #sys.path.append(path)
                #mod = __import__(file)
                #all_modules.append(mod)
        #return all_modules     
