#!/usr/bin/env python
#-*- coding: utf-8 -*-


"""File to test features"""
import tarfile, wx, os
from wxgui._trad import _


########################################################################
class Testing():
    """"""
    
    #----------------------------------------------------------------------
    def __initTesting__(self):
        """"""
        










########################################################################
##                     Install Library                                ##
########################################################################
    ##----------------------------------------------------------------------
    #def installLibrary(self, *event):
        
        #def newFile(origen, destino):
            #Pfile = open(os.path.join(os.getcwd(), destino), "w")
            #Pfile.writelines(origen.readlines())
            #Pfile.close()          
        
        #wildcard = "tar.gz files (*.tar.gz)|*.tar.gz|"     \
                   #"All files (*.*)|*.*"

        #opendlg = wx.FileDialog(self,
                                #message=_("Choose a file"),
                                #defaultDir=os.getcwd(), 
                                #defaultFile="",
                                #wildcard=wildcard,
                                #style=wx.OPEN)
        
        #if opendlg.ShowModal() == wx.ID_OK:
            #librerias = opendlg.GetPaths()
        #else: return
            
        #self.displaymsg(_("Installing libraries...\n"), True)
        
        #for libreria in librerias:
            #tar = tarfile.open(libreria)
            #members = tar.getmembers()
            
            #for i in members:
                #print i.name
            
            
            #self.displaymsg(_("Installing:")+" "+libreria+"\n", False)
                
            #for member in members:
                #for dir1 in ["p8", "p32"]:
                    #for dir2 in ["core", "libraries"]:
                        #if member.name.startswith("%s/%s/" %(dir1, dir2)):
                            #file = member.name.replace("%s/%s/" %(dir1, dir2), "")
                            #fileObject = tar.extractfile(member)
                            #path = "%s/include/pinguino/%s/%s" %(dir1, dir2, file)
                            #newFile(fileObject, path)
                            #if os.path.isfile(os.path.join(os.getcwd(), path)) or os.path.isdir(os.path.join(os.getcwd(), path)):
                                #self.displaymsg(_("overwriting file"+"...\n  "), False)                            
                            #self.displaymsg(_("Installed:")+" "+os.path.split(path)[-1]+" in "+path+"\n", False)
                    
                #if member.name.startswith("p32/pdl/"):
                    #tar.extract(member)
                    #if os.path.isfile(os.path.join(os.getcwd(), member.name)) or os.path.isdir(os.path.join(os.getcwd(), member.name)):
                        #self.displaymsg(_("overwriting file"+"...\n  "), False)                    
                    #self.displaymsg(_("Installed:")+" "+os.path.split(member.name)[-1]+" in "+member.name+"\n", False)
                    
                #if member.name.startswith("p8/pdl/"):
                    #tar.extract(member)
                    #if os.path.isfile(os.path.join(os.getcwd(), member.name)) or os.path.isdir(os.path.join(os.getcwd(), member.name)):
                        #self.displaymsg(_("overwriting file"+"...\n  "), False)                     
                    #self.displaymsg(_("Installed:")+" "+os.path.split(member.name)[-1]+" in "+member.name+"\n", False)
            
            
        
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
