#!/usr/bin/env python
#-*- coding: utf-8 -*-


"""File to test features"""


########################################################################
class Testing():
    """"""
    
    #----------------------------------------------------------------------
    def __initTesting__(self):
        """"""

        
    
        
        
        
        
        
        
        
        
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
        #path= os.path.join(os.getcwd(), "plugins")
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
