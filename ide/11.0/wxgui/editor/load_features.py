#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    load features

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	09/March/13
    last release:	09/March/13

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
import os

from get_config import ReadConfig
from wxgui._trad import _

########################################################################
class LoadFeatures:
    """"""
    
    #----------------------------------------------------------------------
    def loadFeatures(self):
        """"""
        self.LF_Autocompleter()
        self.LF_Tools()
    
    #----------------------------------------------------------------------
    def LF_Autocompleter(self):
        """"""
        config = ReadConfig()
        config.loadConfigFile()
        if config.getElse("Main", "auto-complete", "True") and config.getElse("Completer", "Enable", "True"):        
            
            from autocompleter import AutoCompleterIDE
            CharsCount = config.getElse("Completer", "charscount", 1)
            MaxItemsCount = config.getElse("Completer", "MaxItemsCount", 10)
            AutoCompleter = AutoCompleterIDE(self)
            AutoCompleter.__initCompleter__(self, CharsCount, MaxItemsCount)
            AutoCompleter.Hide()
            self.AutoCompleter = AutoCompleter
        
        
    #----------------------------------------------------------------------
    def LF_Tools(self):
        """"""
        config = ReadConfig()
        config.loadConfigFile()
        
        files_ = config.getElse("Tools", "files", "True")
        documents_ = config.getElse("Tools", "documents", "True")
        search_ = config.getElse("Tools", "search", "True")
        config.saveConfig()
        
        tools_ = files_ == documents_ == search_ == False
        
        if config.getElse("Main", "tools", "True") and not tools_:
            self.lat = self.panelLateral


            if files_:
                from wxgui.editor.lateral_tool_area import File
                self.Files = File()
                self.Files.__initDockFile__(self)
            else:
                self.lat.re
            
            if documents_:
                from wxgui.editor.lateral_tool_area import Documents
                self.Documents = Documents()
                self.Documents.__initDocuments__(self)
                lateralPath = self.getElse("IDE", "LateralPath", os.path.join(os.getcwd(),"examples"))
                if os.path.isdir(lateralPath): self.Documents.buildLateralDir(lateralPath)
            else: self.documents.Destroy()
               
            if search_:
                from wxgui.editor.lateral_tool_area import Search
                self.Search = Search()
                self.Search.__initSearch__(self)
            else: self.search.Destroy()
                            
                
        else:
            self.splitterCL.Unsplit()

        