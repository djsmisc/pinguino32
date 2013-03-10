#!/usr/bin/env python
#-*- coding: utf-8 -*-

#from autocompleter import AutoCompleter

import frames, variables

from debugger import Debugger
from editeur import editor
from experimental import Testing
from menubar import Menubar
from general import General

from preferences import Preferences
from funtions_help import functionsHelp
from stdout import Stdout

import locale


########################################################################
class Editor(Debugger, editor, Menubar, General, Testing):

    #----------------------------------------------------------------------
    def __initIDE__(self):
        """Constructor"""

        self.updateIDE()
        self.__initEditor__()
        self.__initDebugger__()
        
        #self.__initDockFile__()
        #self.__initSearch__()
        
        self.__initTesting__()
        self.initTimers()
        
        #self.lat.notebookLateral.SetSelection(0)   

        if locale.getdefaultlocale()[0][:2] == "es":
            self.wikiDoc = "http://www.pinguino.org.ve/wiki/index.php?title="
        else: self.wikiDoc = "http://wiki.pinguino.cc/index.php/"
        
        if self.getElse("Main", "open-save", "True") and self.getElse("Open/Save", "openlast", "False"):
            self.openLast()
        
        self.saveConfig()
        
        if self.notebookEditor.PageCount == 0:
            #self._mgr.GetPane(self.panelOutput).Hide()
            if self.getElse("Main", "Tools", "True"): self._mgr.GetPane(self.lat).Hide()
            self.updateIDE()
          
        
             
      