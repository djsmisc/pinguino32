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
import platform

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
        
        info = {
                "system": platform.system(),
                "dist": "\t" + " ".join(list(platform.dist())),
                "win32_ver": "\t" + " ".join(list(platform.win32_ver())),
                "processor": platform.processor(),
                "release": platform.release(),
                }

        info = map(lambda key: key+": \t"+info[key]+"\n", info.keys())
        self.fichier.writelines(info+["\n\n"])
        

# ------------------------------------------------------------------------------
# check OS and compilers
# ------------------------------------------------------------------------------
        self.fichier.writelines('check OS and compilers\n')
        if sys.platform == 'darwin':
            self.fichier.writelines('\tSystem host is Mac OS X\n')
            
            toCheck["path"] = os.path.join(HOME_DIR, 'macosx', 'p8', 'bin')
            toCheck["ok"] = '8-bit compiler OK.'
            toCheck["fail"] = ['No 8-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/macosx.tar.bz2']
            self.checkFile(toCheck)
            
            toCheck["path"] = os.path.join(HOME_DIR, 'macosx', 'p32', 'bin')
            toCheck["ok"] = '32-bit compiler OK'
            toCheck["fail"] = ['No 32-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/macosx.tar.bz2']
            self.checkFile(toCheck)
            
        elif sys.platform == 'win32':
            self.fichier.writelines('\tSystem host is Windows\n')
            
            toCheck["path"] = os.path.join(HOME_DIR, 'win32', 'p8', 'bin')
            toCheck["ok"] = '8-bit compiler OK.'
            toCheck["fail"] = ['No 8-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/win32.tar.bz2']
            self.checkFile(toCheck)
            
            toCheck["path"] = os.path.join(HOME_DIR, 'win32', 'p32', 'bin')
            toCheck["ok"] = '32-bit compiler OK.'
            toCheck["fail"] = ['No 32-bit compiler for this system.', 'Download it at http://www.pinguino.cc/download/testing/win32.tar.bz2']
            self.checkFile(toCheck)        

        else:
            self.fichier.writelines('\tSystem host is GNU/Linux\n')
            
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
        self.fichier.writelines('\ncheck Pinguino modules\n')
        ##def getFiles(url):
            ##for path in os.listdir(url):
                ##if os.path.isfile(os.path.join(url, path)):
                    ##if path.endswith(".py"): print "\"" + os.path.join(url, path) + "\","
                ##elif os.path.isdir(os.path.join(url, path)):
                    ##getFiles(os.path.join(url, path))
        ##getFiles("wxgui")
        
        dependences = [os.path.join("python_lib", "usb"),
                       os.path.join("python_lib", "importlib"),]
        
        allFiles = [os.path.join("wxgui", "pinguino.py"),
                    os.path.join("wxgui", "uploader", "__init__.py"),
                    os.path.join("wxgui", "uploader", "uploader.py"),
                    os.path.join("wxgui", "uploader", "uploader8.py"),
                    os.path.join("wxgui", "uploader", "uploaderMCC.py"),
                    os.path.join("wxgui", "uploader", "uploaderVSC.py"),
                    os.path.join("wxgui", "uploader", "autodetect.py"),
                    os.path.join("wxgui", "uploader", "uploaderDLN.py"),
                    os.path.join("wxgui", "__init__.py"),
                    os.path.join("wxgui", "_trad.py"),
                    os.path.join("wxgui", "editor", "events.py"),
                    os.path.join("wxgui", "editor", "preferences.py"),
                    os.path.join("wxgui", "editor", "__init__.py"),
                    os.path.join("wxgui", "editor", "constants.py"),
                    os.path.join("wxgui", "editor", "experimental.py"),
                    os.path.join("wxgui", "editor", "editeur.py"),
                    os.path.join("wxgui", "editor", "stdout.py"),
                    os.path.join("wxgui", "editor", "autocompleter.py"),
                    os.path.join("wxgui", "editor", "board_selector.py"),
                    os.path.join("wxgui", "editor", "get_config.py"),
                    os.path.join("wxgui", "editor", "funtions_help.py"),
                    os.path.join("wxgui", "editor", "load_features.py"),
                    os.path.join("wxgui", "editor", "dic.py"),
                    os.path.join("wxgui", "editor", "frames", "__init__.py"),
                    os.path.join("wxgui", "editor", "frames", "framesX4.py"),
                    os.path.join("wxgui", "editor", "frames", "gettext.py"),
                    os.path.join("wxgui", "editor", "lateral_tool_area", "__init__.py"),
                    os.path.join("wxgui", "editor", "lateral_tool_area", "dock_searchReplace.py"),
                    os.path.join("wxgui", "editor", "lateral_tool_area", "dock_documents.py"),
                    os.path.join("wxgui", "editor", "lateral_tool_area", "dock_files.py"),
                    os.path.join("wxgui", "editor", "general.py"),
                    os.path.join("wxgui", "picdevlist.py"),
                    os.path.join("wxgui", "boards.py"),
                    os.path.join("wxgui", "argparse.py"),
                    os.path.join("wxgui", "check.py"),]
        
        for file in allFiles + dependences: self.checkPinguinoFile(file)
            

# ------------------------------------------------------------------------------
# check Python version 
# ------------------------------------------------------------------------------
        self.fichier.writelines('\ncheck Python version \n')
        if sys.version_info[0:2] < (2,5):
            self.fichier.writelines('\tPinguino IDE requires version python 2.5 or greater\n')
            perror()
        else: self.fichier.writelines('\tPython version is OK (>=2.5)\n')
            

# ------------------------------------------------------------------------------
# check Python modules
# ------------------------------------------------------------------------------
        self.fichier.writelines('\ncheck Python modules\n')
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
        if os.path.exists(toCheck["path"]): self.fichier.write("\t"+toCheck["ok"]+"\n")
        else:
            for mess in toCheck["fail"]: self.fichier.write("\t"+mess+"\n")
            
    #----------------------------------------------------------------------
    def checkModule(self, **toCheck):
        toCheck["name"] = toCheck.get("name", toCheck["module"])
        if toCheck["name"] == "Python": toCheck["name"] = toCheck["module"]
            
        try:
            importlib.import_module(toCheck["module"])
            self.fichier.writelines('\t%(name)s successfully loaded\n'%toCheck)
        except:
            toCheck["version"] = toCheck.get("version", "")
            self.fichier.writelines('\t%(module)s failed\n'%toCheck)
            self.fichier.writelines('\tTry to re-install %(name)s %(version)s\n'%toCheck)
            self.perror()
            
    #----------------------------------------------------------------------
    def checkPinguinoModule(self, **toCheck):
        try:
            if toCheck.get("package", ""): importlib.import_module(toCheck["module"], package=toCheck["package"])
            else: importlib.import_module(toCheck["module"])
            self.fichier.writelines('\t%(module)s successfully loaded\n'%toCheck)
        except:
            self.fichier.writelines('\t%(module)s failed\n'%toCheck)
            self.fichier.writelines('\tYou should have %(module)s.py at the %(path)s\n'%toCheck)
            self.perror()
            
    #----------------------------------------------------------------------
    def checkPinguinoFile(self, file_):
        dir, file = os.path.split(file_)
        if os.path.exists(file_): self.fichier.writelines('\t%s found\n'%file_)
        else:
            self.fichier.writelines('\tYou should have %s at the %s\n'%(file, dir))
            self.perror()
            
    #----------------------------------------------------------------------
    def perror(self):
        print "fatal error, see pinguino.log for more details\n"
        self.fichier.close()
        sys.exit()


