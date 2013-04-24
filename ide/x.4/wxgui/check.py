#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-

"""-------------------------------------------------------------------------
	Pinguino Check List

	(c) 2011 Jean-Pierre Mandon <jp.mandon@gmail.com>
				Regis Blanchot <rblanchot@gmail.com> 

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

import os
import time
import sys

HOME_DIR = os.getcwd()
sys.path.append(os.path.join(HOME_DIR, "python_lib"))
import importlib  #from python_lib

########################################################################
class CheckDependences:
    """ check pinguino dependencies """
    
    #----------------------------------------------------------------------
    def __init__(self):
        """Constructor"""

        toCheck = {}
        self.fichier = open(os.path.join(HOME_DIR, 'pinguino.log'), 'w+') # works with paths with spaces
        self.fichier.writelines('Pinguino started at ' + str(time.asctime(time.localtime(time.time())) + '\n\n' ))
        
# ------------------------------------------------------------------------------
# check OS and compilers
# ------------------------------------------------------------------------------
        if sys.platform == 'darwin':
            self.fichier.writelines('System host is Mac OS X\n')
            
            toCheck["path"] = os.path.join(HOME_DIR, 'macosx', 'p8', 'bin')
            toCheck["ok"] = '8-bit compiler OK.'
            toCheck["fail"] = ['No 8-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/macosx.tar.bz2']
            self.checkFile(toCheck)
            
            toCheck["path"] = os.path.join(HOME_DIR, 'macosx', 'p32', 'bin')
            toCheck["ok"] = '32-bit compiler OK'
            toCheck["fail"] = ['No 32-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/macosx.tar.bz2']
            self.checkFile(toCheck)
            
        elif sys.platform == 'win32':
            self.fichier.writelines('System host is Windows\n')
            
            toCheck["path"] = os.path.join(HOME_DIR, 'win32', 'p8', 'bin')
            toCheck["ok"] = '8-bit compiler OK.'
            toCheck["fail"] = ['No 8-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/win32.tar.bz2']
            self.checkFile(toCheck)
            
            toCheck["path"] = os.path.join(HOME_DIR, 'win32', 'p32', 'bin')
            toCheck["ok"] = '32-bit compiler OK.'
            toCheck["fail"] = ['No 32-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/win32.tar.bz2']
            self.checkFile(toCheck)        

        else:
            self.fichier.writelines('System host is GNU/Linux\n')
            
            toCheck["path"] = os.path.join(HOME_DIR, 'linux', 'p8', 'bin')
            toCheck["ok"] ='8-bit compiler OK.'
            toCheck["fail"] = ['No 8-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/linux.tar.bz2']
            self.checkFile(toCheck)   

            toCheck["path"] = os.path.join(HOME_DIR, 'linux', 'p32', 'bin')
            toCheck["ok"] = '32-bit compiler OK.'
            toCheck["fail"] = ['No 32-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/linux.tar.bz2']
            self.checkFile(toCheck)
            
# ------------------------------------------------------------------------------
# check Pinguino modules
# ------------------------------------------------------------------------------
        ##def getFiles(url):
            ##for path in os.listdir(url):
                ##if os.path.isfile(os.path.join(url, path)):
                    ##if path.endswith(".py"): print "\"" + os.path.join(url, path) + "\","
                ##elif os.path.isdir(os.path.join(url, path)):
                    ##getFiles(os.path.join(url, path))
        ##getFiles("wxgui")
        
        dependences = ["python_lib/usb",
                       "python_lib/importlib"]
        
        allFiles = ["wxgui/pinguino.py",
                    "wxgui/uploader/__init__.py",
                    "wxgui/uploader/uploader.py",
                    "wxgui/uploader/uploader8.py",
                    "wxgui/uploader/uploaderMCC.py",
                    "wxgui/uploader/uploaderVSC.py",
                    "wxgui/uploader/autodetect.py",
                    "wxgui/uploader/uploaderDLN.py",
                    "wxgui/__init__.py",
                    "wxgui/_trad.py",
                    "wxgui/editor/events.py",
                    "wxgui/editor/preferences.py",
                    "wxgui/editor/__init__.py",
                    "wxgui/editor/constants.py",
                    "wxgui/editor/experimental.py",
                    "wxgui/editor/editeur.py",
                    "wxgui/editor/stdout.py",
                    "wxgui/editor/autocompleter.py",
                    "wxgui/editor/board_selector.py",
                    "wxgui/editor/get_config.py",
                    "wxgui/editor/funtions_help.py",
                    "wxgui/editor/load_features.py",
                    "wxgui/editor/dic.py",
                    "wxgui/editor/frames/__init__.py",
                    "wxgui/editor/frames/framesX4.py",
                    "wxgui/editor/frames/gettext.py",
                    "wxgui/editor/lateral_tool_area/__init__.py",
                    "wxgui/editor/lateral_tool_area/dock_searchReplace.py",
                    "wxgui/editor/lateral_tool_area/dock_documents.py",
                    "wxgui/editor/lateral_tool_area/dock_files.py",
                    "wxgui/editor/general.py",
                    "wxgui/picdevlist.py",
                    "wxgui/boards.py",
                    "wxgui/argparse.py",
                    "wxgui/check.py",]
        
        for file in allFiles + dependences: self.checkPinguinoFile(file)
            

# ------------------------------------------------------------------------------
# check Python version 
# ------------------------------------------------------------------------------
        if sys.version_info[0:2] < (2,5):
            self.fichier.writelines('Pinguino IDE requires version python 2.5 or greater\n')
            perror()
        else: self.fichier.writelines('Python version is OK (>=2.5)\n')
            

# ------------------------------------------------------------------------------
# check Python modules
# ------------------------------------------------------------------------------
        self.checkModule(module="wx", name="wxPython", version="2.8")
        self.checkModule(module="shutil", name="PyShutil", version="") 
        self.checkModule(module="subprocess", name="Python", version=">2.5") 
        self.checkModule(module="gettext", name="Python", version=">2.5")    
        self.checkModule(module="locale", name="Python", version=">2.5")    
        self.checkModule(module="webbrowser", name="Python", version=">2.5")  
        self.checkModule(module="threading", name="Python", version=">2.5") 
        #self.checkModule(module="usb", name="PyUSB", version="1.0")   
        #self.checkModule(module="serial", name="PySerial", version="2.5")         


# ------------------------------------------------------------------------------
# All right
# ------------------------------------------------------------------------------
        self.fichier.writelines('\nEverything is OK.\n')
        self.fichier.close()


    #----------------------------------------------------------------------
    def checkFile(self, toCheck):
        #self.fichier.write(toCheck["check"]+"\n")
        if os.path.exists(toCheck["path"]): self.fichier.write(toCheck["ok"]+"\n")
        else:
            for mess in toCheck["fail"]: self.fichier.write(mess+"\n")
            
    #----------------------------------------------------------------------
    def checkModule(self, **toCheck):
        toCheck["name"] = toCheck.get("name", toCheck["module"])
        if toCheck["name"] == "Python": toCheck["name"] = toCheck["module"]
            
        try:
            importlib.import_module(toCheck["module"])
            self.fichier.writelines('%(name)s successfully loaded\n'%toCheck)
        except:
            toCheck["version"] = toCheck.get("version", "")
            self.fichier.writelines('%(module)s failed\n'%toCheck)
            self.fichier.writelines('Try to re-install %(name)s %(version)s\n'%toCheck)
            self.perror()
            
    #----------------------------------------------------------------------
    def checkPinguinoModule(self, **toCheck):
        try:
            if toCheck.get("package", ""): importlib.import_module(toCheck["module"], package=toCheck["package"])
            else: importlib.import_module(toCheck["module"])
            self.fichier.writelines('%(module)s successfully loaded\n'%toCheck)
        except:
            self.fichier.writelines('%(module)s failed\n'%toCheck)
            self.fichier.writelines('You should have %(module)s.py at the %(path)s\n'%toCheck)
            self.perror()
            
    #----------------------------------------------------------------------
    def checkPinguinoFile(self, file_):
        dir, file = os.path.split(file_)
        if os.path.exists(file_): self.fichier.writelines('%s found\n'%file_)
        else:
            self.fichier.writelines('You should have %s at the %s\n'%(file, dir))
            self.perror()
            
    #----------------------------------------------------------------------
    def perror(self):
        print "fatal error, see pinguino.log for more details\n"
        self.fichier.close()
        sys.exit()


