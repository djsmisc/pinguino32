#!/usr/bin/env python
#  -*- coding: UTF-8 -*-

"""-------------------------------------------------------------------------
    pinguino

    (c) 2008-2009-2010-2011 Jean-Pierre MANDON <jp.mandon@gmail.com>

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

# ------------------------------------------------------------------------------
# check dependencies
# ------------------------------------------------------------------------------

from check import *

EVT_RESULT_REVISION_ID = wx.NewId()

def EVT_RESULT_REVISION(win, func):
    win.Connect(-1, -1, EVT_RESULT_REVISION_ID, func)

class ResultEventRevision(wx.PyEvent):
    def __init__(self, data):
        wx.PyEvent.__init__(self)
        self.SetEventType(EVT_RESULT_REVISION_ID)
        self.data = data

# ------------------------------------------------------------------------------
# current version
# ------------------------------------------------------------------------------
pinguino_version = "x.4"


# ------------------------------------------------------------------------------
# default
# ------------------------------------------------------------------------------
THEME_DEFAULT = "PinguinoX"
BOARD_DEFAULT = Pinguino2550()
gui=False

# ------------------------------------------------------------------------------
# traducciones
# ------------------------------------------------------------------------------
from wxgui._trad import _

#Used for Python and Pic32 debug
#os.environ["LD_LIBRARY_PATH"]="/usr/lib32:%s/linux/p32/bin:/usr/lib:/usr/lib64" % HOME_DIR

# ------------------------------------------------------------------------------
# Pinguino Class
# ------------------------------------------------------------------------------

class Pinguino(framePinguinoX, Editor):

    global lang
    global gui

    osdir = ""
    sdcc = ""
    #gcc = ""
    debug_output = 0
    debug_handle = False
    debug_thread = False
    debug_flag = False
    in_verify = 0

    noname = 0
    keywordList = []
    reservedword = []
    libinstructions = []
    regobject = []
    rw = []
    THEME = []
    KEYWORD = []

# ------------------------------------------------------------------------------
# init
# ------------------------------------------------------------------------------
    def __initPinguino__(self, parent):
        sys.setrecursionlimit(1500)
        self.notebookEditor.Hide()
        self.boardlist = boardlist
        self.debugOutMessage = None
        self.closing = False
        self.currentLateralDir = os.path.join(os.getcwd(),"examples")
        self.autoCompleteWords = []
        self.recentsFiles = []
        self.otherWords = []
        self.autocompleteHide = False
        self.extraName = ""
	self.changingBoard = False

        if os.path.isdir(TEMP_DIR) == False: os.mkdir(TEMP_DIR)

        self._mgr = wx.aui.AuiManager(self)

        self.setOSvariables()
        self.configPanes()
        self.buildMenu()
        #self.loadSettings()
        self.morePreferences()
        self.ConnectAll()
        self.trees = []

        self.allVars_back = [] 
        self.allFunc_back = []
        self.allDefi_back = []	

        #Threads
        if DEV:
            EVT_RESULT_REVISION(self, self.setRevision)
            threadRevision = threading.Thread(target=self.getRevision, args=( ))
            threadRevision.start()

            self.SetTitle('Pinguino IDE ' + pinguino_version + " rev. ["+_("loading...")+"]")
            self.displaymsg(_("Welcome to Pinguino IDE")+" (rev. ["+_("loading...")+"])", 1)
        else:
            self.SetTitle("Pinguino IDE")
            self.displaymsg(_("Welcome to Pinguino IDE"), 1)            

        self.loadSettings()
        self.__initIDE__()

        ########################################
        #Auto-complete frame build 
        CharsCount = self.getElse("Completer", "charscount", 1)
        MaxItemsCount = self.getElse("Completer", "MaxItemsCount", 10)
        self.AutoCompleter = AutocompleterIDE(self)
        self.AutoCompleter.__initCompleter__(self, CharsCount, MaxItemsCount)
        self.AutoCompleter.Hide()

        #########################################

            
        self.DrawToolbar()
	
	
    #----------------------------------------------------------------------    
    def getPIC18F(self):
	# get all PIC18F devices supported by SDCC
	proclist = []
	fichier=open(os.path.join(P8_DIR, 'include', 'pic16devices.txt'), 'r')
	for line in fichier:
	    # if line begins with 'name'
	    if line.find('name') == 0:
	        proclist.append(line[line.find('18f'):-1])
	        #print line[line.find('18f'):-1]
	    for i in range(len(proclist)):
	        proclist[i] = proclist[i].strip()
	fichier.close()
	return proclist



    #----------------------------------------------------------------------
    def getfamilies(self, arch, mode):
	#Return a list of available families.
	
	if arch == 8:
	    if mode == "ICSP":
		return 4, ["18fxxx", "18fxxxx", "18fxxjxx", "18fxxkxx"]
	    
	    elif mode == "BOOT":
		return 1, []  #No sort by families
	
	
	elif arch == 32:
	    if mode == "ICSP":
		return 1, []
	    
	    if mode == "BOOT":
		return 1, []  #No sort by families
    
    
    #----------------------------------------------------------------------
    def getDevices(self, arch, mode, family):
	""""""
	
	if arch == 8:
	    if mode == "ICSP":
		devs = self.getPIC18F()
		r_devs = []
		family = family.replace( "x", "[0-9]")
		for dev in devs:
		    reg = re.match("("+family+")", dev)
		    if reg != None:
			if reg.group(1) == dev: r_devs.append(dev)
		return 5, r_devs
	    
	    if mode == "BOOT":
		devs = []
		for board in boardlist:
		    if board.bldr == "noboot": pass
		    elif board.arch == 8: devs.append(board.name)
		return 3, devs  #Columns, List
	    
	    
	
	elif arch == 32:
	    if mode == "ICSP":
		return 0, [] 
	    
	    if mode == "BOOT":
		devs = []
		for board in boardlist:
		    if board.bldr == "noboot": pass
		    elif board.arch == 32: devs.append(board.name)
		return 2, devs



# ----------------------------------------------------------------------
# Get OS name and define some OS dependant variable
# ----------------------------------------------------------------------
    def setOSvariables(self):
        if sys.platform == 'darwin':
            self.osdir = 'macosx'
            self.debug_port = '/dev/tty.usbmodem1912'
            self.c8 = 'sdcc'
            self.u32 = 'mphidflash'
            self.make = 'make'
        elif sys.platform == 'win32':
            self.osdir = 'win32'
            self.debug_port = 15
            self.c8 = 'sdcc.exe'
            self.p8 = 'picpgm.exe'
            self.u32 = 'mphidflash.exe'
            self.make = os.path.join(HOME_DIR, self.osdir, 'p32', 'bin', 'make.exe')
        else:
            self.osdir = 'linux'
            self.debug_port = '/dev/ttyACM0'
            self.c8 = 'sdcc'
            self.p8 = 'picpgm'
            self.u32 = 'ubw32'
            self.make = 'make'


    #----------------------------------------------------------------------
    def setBoard(self, arch, mode, name):
        # clear all the lists before rebuild them
        del self.rw[:]
        del self.regobject[:]
        del self.keywordList[:]
        del self.reservedword[:]
        del self.libinstructions[:]

	if mode == "BOOT":
	    for board in boardlist:
		if name == board.name:
		    self.curBoard = board
	    self.extraName = ""
		    
	else:
	    self.curBoard = boardlist[0]
	    self.curBoard.proc = name
	    self.curBoard.board = "PIC"+name.upper()
	    self.extraName = " [" + self.curBoard.board + "]"
	    
	self.displaymsg(_("Changing board")+"...", 0)
	self.statusBarEditor.SetStatusText(number=2, text=self.curBoard.name+self.extraName+" - "+mode)
	if sys.platform=='darwin':
	    self.readlib(self.curBoard) #So slow
	else:
	    self.Thread_curBoard = threading.Thread(target=self.readlib, args=(self.curBoard, ))
	    self.Thread_curBoard.start()


# ------------------------------------------------------------------------------
# OnAbout:
# ------------------------------------------------------------------------------

    def OnAbout(self, event):
        description = """Pinguino is an Open Software and Open Hardware Arduino-like project. Boards are based on 8 or 32-bit USB built-in Microchip microcontrollers. The main goal is to build a real USB system without USB to serial converter.
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
        #bmp = wx.Icon(os.path.join(THEME_DIR, 'logoX3.png'), wx.BITMAP_TYPE_PNG)
        image = wx.Image(os.path.join(THEME_DIR, 'logo3D.png'), wx.BITMAP_TYPE_PNG)
        image = image.Scale(500, 375, wx.IMAGE_QUALITY_HIGH)
        bmp = wx.BitmapFromImage(image)
        #bmp = image.ConvertToBitmap()
        icon = wx.EmptyIcon()
        icon.CopyFromBitmap(bmp)
        info.SetIcon(icon)
        info.SetName('Pinguino')
        info.SetVersion(pinguino_version)
        #info.SetVersion("rev. " + self.localRev)
        info.SetDescription(description)
        # LGPL compatibility ?
        #info.SetCopyright('2008, 2009, 2010, 2011 jean-pierre mandon')
        info.SetWebSite('http://www.pinguino.cc')
        info.SetLicence(licence)

        info.AddDeveloper('Jean-Pierre Mandon')
        info.AddDeveloper('Régis Blanchot')
        info.AddDeveloper('Marcus Fazzi')
        info.AddDeveloper('Jesus Carmona Esteban')
        info.AddDeveloper('Alfred Broda')
        info.AddDeveloper('Yeison Cardona')
        info.AddDeveloper('Henk Van Beek')
        info.AddDeveloper('Björn Pfeiffer')
        info.AddDeveloper('Alexis Sánchez')     

        info.AddDocWriter('Benoit Espinola')
        info.AddDocWriter('Sebastien Koechlin')
        info.AddDocWriter('Ivan Ricondo')
        info.AddDocWriter('Jesus Carmona Esteban')
        info.AddDocWriter('Marcus Fazzi')
        info.AddDocWriter('Régis Blanchot')

        info.AddArtist('France Cadet')
        info.AddArtist('Laurent Costes')
        info.AddArtist('Daniel Rodrí­guez')

        info.AddTranslator('Joan Espinoza')
        info.AddTranslator('Alexis Sánchez')
        info.AddTranslator('Régis Blanchot')
        info.AddTranslator('Moreno Manzini ')

        wx.AboutBox(info)

# ------------------------------------------------------------------------------
# OnVerify:
# ------------------------------------------------------------------------------

    def OnVerify(self, event=None):
	if self.changingBoard:
	    self.displaymsg(_("Please wait a moment.")+"\n", 0)
	    return
	    
        global lang
        self.in_verify=1
        t0 = time.time()
        if self.GetPath()==-1:
            dlg = wx.MessageDialog(self,
                                   _('Open file first !!'),
                                   _('Warning'),
                                   wx.OK | wx.ICON_WARNING)
            result=dlg.ShowModal()
            dlg.Destroy()
            return False
        self.displaymsg(_("Board:")+" " + self.curBoard.name, 1)
        self.displaymsg(_("Proc:")+" " + self.curBoard.proc, 0)
        self.displaymsg(_("File:")+" " + self.GetPath(), 0)
        self.OnSave()
        filename=self.GetPath()
        filename,extension=os.path.splitext(filename)
        if os.path.exists(filename+".hex"):
            os.remove(filename+".hex")
        if os.path.exists(os.path.join(SOURCE_DIR, "user.c")):
            os.remove(os.path.join(SOURCE_DIR, "user.c"))
        retour=self.preprocess(filename, self.curBoard)
        if retour=="error":
            return False
        # compilation
        if self.curBoard.arch == 8:
            MAIN_FILE="main.hex"
        else:
            MAIN_FILE="main32.hex"
        retour=self.compile(filename, self.curBoard)
        if retour!=0:
            self.displaymsg(_("error while compiling"),0)
            self.displaymsg(_("check highlighted lines in your code"),0)
        else:
            retour=self.link(filename, self.curBoard)
            if os.path.exists(os.path.join(SOURCE_DIR, MAIN_FILE))!=True:
                self.displaymsg(_("error while linking")+" "+filename+".o",0)
                return False
            else:
                shutil.copy(os.path.join(SOURCE_DIR, MAIN_FILE), filename+".hex")
                self.displaymsg(_("compilation done"),0)
                self.displaymsg(self.getCodeSize(filename, self.curBoard),0)
                self.displaymsg(str(time.time() - t0) + " "+_("seconds process time"),0)
                os.remove(os.path.join(SOURCE_DIR, MAIN_FILE))
                #os.remove(filename+".c")
                return True
        self.in_verify=0

# ------------------------------------------------------------------------------
# OnUpload:
# ------------------------------------------------------------------------------

    def OnUpload(self, event=None):
        if self.GetPath() != -1:
            filename = self.GetPath()
            filename, extension = os.path.splitext(filename)
            if os.path.exists(filename + '.hex'):
                if self.curBoard.arch == 8:
		    try:
			u = Uploader(self.logwindow, filename, self.curBoard)
		    except usb.USBError:  #No device
			self.displaymsg("No device",0)
			return
			
                else:
                    fichier = open(os.path.join(SOURCE_DIR, 'stdout'), 'w+')
                    sortie=Popen([os.path.join(HOME_DIR, self.osdir, 'p32', 'bin', self.u32),
                                  "-w",
                                  filename+".hex",
                                  "-r",
                                  "-n"],
                                 stdout=fichier, stderr=STDOUT)
                    sortie.communicate()
                    fichier.seek(0)
                    self.displaymsg(fichier.read(),0)
                    fichier.close()
            else:# no file
                dlg = wx.MessageDialog(self,
                                       _('File must be verified/compiled before upload'),
                                       _('Warning!'),
                                       wx.OK | wx.ICON_WARNING)
                result=dlg.ShowModal()
                dlg.Destroy()
        else:# not saved
            dlg = wx.MessageDialog(self,
                                   _('File must be saved before upload'),
                                   _('Warning!'),
                                   wx.OK | wx.ICON_WARNING)
            result=dlg.ShowModal()
            dlg.Destroy()
        if event != None: event.Skip()


    #----------------------------------------------------------------------
    def OnVerifyUpload(self, even=None):
	if self.changingBoard:
	    self.displaymsg(_("Please wait a moment.")+"\n", 0)
	    return
        if self.OnVerify(): self.OnUpload()


# ------------------------------------------------------------------------------
# Load .pdl or .pdl32 files (keywords and libraries)
# ------------------------------------------------------------------------------

    def readlib(self, board):
        # trying to find PDL files to store reserved words
        self.keywordList = []
        if board.arch == 8:
            libext='.pdl'
            libdir=P8_DIR
        else:
            libext='.pdl32'
            libdir=P32_DIR
        #for fichier in os.listdir(os.path.join(libdir, 'lib')):
        for fichier in os.listdir(os.path.join(libdir, 'pdl')):
            filename,extension=os.path.splitext(fichier)
            if extension==libext:
                # check content of the PDL file
                #libfile=open(os.path.join(libdir, 'lib', fichier),'r')
                libfile=open(os.path.join(libdir, 'pdl', fichier),'r')
                for line in libfile:
                    if line!="\n":
                        # arduino's instruction
                        instruction=line[0:line.find(" ")]
                        self.keywordList.append(instruction)
                        # library's instruction
                        cnvinstruction=line[line.find(" ")+1:line.find("#")]
                        # find #include & #define
                        #include=line[line.find("#")+1:len(line)]
                        include=""
                        define=""
                        explode=line.split("#")
                        if len(explode)>=2:
                            include=explode[1]
                        if len(explode)==3:
                            define=explode[2]
                        # append to the list
                        self.libinstructions.append([instruction,cnvinstruction,include,define])
                        #regex = re.compile(r"(^|[' ']|['=']|['{']|[',']|[\t]|['(']|['!'])"+str(instruction))+"[ ]*\(")
                        #regex = re.compile(r"(^|[' ']|['=']|['{']|[',']|[\t]|['(']|['!'])"+str(instruction)+r"([' ']|['=']|['}']|[',']|[';']|[\t]|[')'].*)")
                        #regex = re.compile(r"(^|[' ']|['=']|['{']|[',']|[\t]|['(']|['!'])"+str(instruction)+".*")
                        #regex = re.compile(r'\W%s\W' % re.escape(str(instruction)))
                        regex = re.compile(r"(^|[' ']|['=']|['{']|[',']|[\t]|['(']|['!'])%s\W" % re.escape(str(instruction)))
                        self.regobject.append(regex)
                libfile.close()
        # clean up the keyword list
        self.keywordList.sort()
        self.keywordList = self.ClearRedundancy(self.keywordList)
        self.keywordNum = len(self.keywordList)
        # make reserved words list
        if len(self.libinstructions)!=0:
            for i in range(len(self.libinstructions)):
                chaine=self.libinstructions[i][0]
                self.rw.append(chaine)
                pos = chaine.find(".")
                if pos != -1:
                    self.reservedword.append(chaine[0:pos])
                    self.reservedword.append(chaine[pos+1:len(chaine)])
                else:
                    self.reservedword.append(chaine)
            # sort keywords for short key help
            self.rw.sort(key=lambda x: x.lower())
        # adding fixed reserved word
        fixed_rw=("setup","loop","HIGH","LOW","INPUT","OUTPUT","void","FOSC","MIPS","ON","OFF","TRUE","FALSE")
        for i in range(len(fixed_rw)):
            self.reservedword.append(fixed_rw[i])

        #if gui==True: # or AttributeError: 'Pinguino' object has no attribute 'extraName'
	self.displaymsg(_("Board config")+":\t"+board.name+self.extraName, 0)

	self.changingBoard = False	
	

# ------------------------------------------------------------------------------
# ClearRedundancy:
# ------------------------------------------------------------------------------

    def ClearRedundancy(self, myList):
        seen = set()
        out = []
        for item in myList:
            if item not in seen:
                seen.add(item)
                out.append(item)
        return out


# ------------------------------------------------------------------------------
# Read Pinguino File (.pde) and translate it into C language
# ------------------------------------------------------------------------------

    def preprocess(self, filename, board):
        defineword={}
        index=0
        fileline={}

        # delete old define.h and create a new one
        if os.path.exists(os.path.join(SOURCE_DIR, 'define.h')):
            os.remove(os.path.join(SOURCE_DIR, 'define.h'))
        fichier=open(os.path.join(SOURCE_DIR, 'define.h'), 'a')
        fichier.close()

        # rename .pde in user.c
        path,name = os.path.split(filename)
        shutil.copy(filename + '.pde', os.path.join(SOURCE_DIR, 'user.c'))
        fichier = open(os.path.join(SOURCE_DIR, 'user.c'), 'a')
        #fichier.writelines("\n")
        fichier.close()

        ### debug mode
        ##DEBUG_STR = "NODEBUG"
        ##if self.debug == self.ID_USBCDC:
            ##DEBUG_STR = "USBCDCDEBUG"
        ##if self.debug == self.ID_USBBULK:
            ##DEBUG_STR = "USBBULKDEBUG"
        ##if self.debug == self.ID_USBHID:
            ##DEBUG_STR = "USBHIDDEBUG"
        ##if self.debug == self.ID_USBOTG:
            ##DEBUG_STR = "USBOTGDEBUG"
        ##if self.debug == self.ID_UART1:
            ##DEBUG_STR = "UART1DEBUG"
        ##if self.debug == self.ID_UART2:
            ##DEBUG_STR = "UART2DEBUG"
        ##self.adddefine("#define DEBUG_MODE " + DEBUG_STR)

        # board
        #if board.arch == 8:
        #    self.adddefine("#define " + board.board)

        # add #include and #define from user.c to define.h
        fichier = open(os.path.join(SOURCE_DIR, 'user.c'), 'r')
        i=0
        for line in fichier:
            if line.find("#include")!=-1 or line.find("#define")!=-1:
                self.adddefine(line)    # add to define.h
                fileline[i]="\r\n";    # delete from user.c
                i=i+1
            else:
                fileline[i]=line
                i=i+1
        fichier.close()

        # rewrite file user.c without #include and #define
        fichier = open(os.path.join(SOURCE_DIR, 'user.c'), 'w')
        for cpt in range(i):
            fichier.write(fileline[cpt])
        fichier.close()

        # search and replace arduino keywords in file
        fichier = open(os.path.join(SOURCE_DIR, 'user.c'), 'r')
        content = fichier.read()
        content = self.removecomments(content)
        content = content.split('\n')
        nblines = 0
        for line in content:
            resultline = self.replaceword(line)
            if resultline.find("error")==1:
                line = resultline
                print "error " + resultline
                self.displaymsg("error "+resultline,1)
                return "error"
            fileline[nblines] = resultline
            nblines += 1
        fichier.close()

        # save new tmp file
        fichier = open(os.path.join(SOURCE_DIR, 'user.c'), 'w')
        for i in range(0,nblines):
            fichier.writelines(fileline[i])
        fichier.writelines("\r\n")
        fichier.close()

        # sort define.h
        fichier = open(os.path.join(SOURCE_DIR, 'define.h'), "r")
        lignes = fichier.readlines()
        lignes.sort()
        fichier.close()

        # save sorted lines
        fichier = open(os.path.join(SOURCE_DIR, 'define.h'), "w")
        fichier.writelines(lignes)
        fichier.close()
        return

# ------------------------------------------------------------------------------
# Add #define to define.h
# ------------------------------------------------------------------------------

    def adddefine(self,chaine):
        """ add #define in define.h file """
        fichier = open(os.path.join(SOURCE_DIR, 'define.h'), 'a')
        fichier.writelines(chaine+"\n")
        fichier.close()

# ------------------------------------------------------------------------------
# Check if #define exists in define.h 
# ------------------------------------------------------------------------------

    def notindefine(self,chaine):
        """ verify if #define exists in define.h file """
        fichier = open(os.path.join(SOURCE_DIR, 'define.h'), 'r')
        for line in fichier:
            # chaine has been found ?
            if line.find(chaine)!=-1:
                fichier.close()
                return(0)
        fichier.close()
        return(1)

# ------------------------------------------------------------------------------
# Convert Pinguino language into C language
# ------------------------------------------------------------------------------

    def replaceword(self,line):
        """ convert pinguino language in C language """
        # replace arduino/pinguino language and add #define or #include to define.h
        for i in range(len(self.libinstructions)):
            if re.search(self.regobject[i], line):
                line = line.replace(str(self.libinstructions[i][0]), str(self.libinstructions[i][1]))
                if self.notindefine("#"+str(self.libinstructions[i][2])) == 1:
                    self.adddefine("#"+str(self.libinstructions[i][2]))
                if self.notindefine("#"+str(self.libinstructions[i][3])) == 1:
                    self.adddefine("#"+str(self.libinstructions[i][3]))
        return line+"\n"

# ------------------------------------------------------------------------------
# Remove comments
# ------------------------------------------------------------------------------

    def removecomments(self, text):
        def replacer(match):
            s = match.group(0)

            if s.startswith('/'):
                #return "" #bug in line number in error info, multiline comments
                return "" + "\n" * (s.count("\n"))
            
            else:
                return s
            
        pattern = re.compile(
            r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
            re.DOTALL | re.MULTILINE
        )
        return re.sub(pattern, replacer, text)

# ------------------------------------------------------------------------------
# Compile
# ------------------------------------------------------------------------------

    def compile(self, filename, board):
        if (self.debug_output == 1):
            print("compile " + board.proc)
        else:
            
            if board.arch == 8:
                
                fichier = open(os.path.join(SOURCE_DIR, 'stdout'), 'w+')
                
                if board.bldr == 'boot2':
                    sortie = Popen([os.path.join(HOME_DIR, self.osdir, 'p8', 'bin', self.c8),\
                                    "-mpic16",\
                                    "--denable-peeps",\
                                    "--obanksel=9",\
                                    "--opt-code-size",\
                                    "--optimize-cmp",\
                                    "--optimize-df",\
                                    "-p" + board.proc,\
                                    "-D" + board.board,\
                                    "-D" + board.bldr,\
                                    "-I" + os.path.join(P8_DIR, 'include'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'non-free'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                                    "-I" + os.path.dirname(filename),\
                                    "--compile-only",\
                                    "-o" + os.path.join(SOURCE_DIR, 'main.o'),\
                                    os.path.join(SOURCE_DIR, 'main.c')],\
                                   stdout=fichier, stderr=STDOUT)
                                   
                elif board.bldr == 'boot4':
#                                    "--opt-code-size",\
                    sortie = Popen([os.path.join(HOME_DIR, self.osdir, 'p8', 'bin', self.c8),\
                                    "-mpic16",\
                                    "--obanksel=9",\
                                    "--optimize-cmp",\
                                    "--optimize-df",\
                                    "--denable-peeps",\
                                    "--ivt-loc=" + str(board.memstart),\
                                    "-p" + board.proc,\
                                    "-D" + board.board,\
                                    "-D" + board.bldr,\
                                    "-I" + os.path.join(P8_DIR, 'include'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'non-free'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                                    "-I" + os.path.dirname(filename),\
                                    "--compile-only",\
                                    "-o" + os.path.join(SOURCE_DIR, 'main.o'),\
                                    os.path.join(SOURCE_DIR, 'main.c')],\
                                   stdout=fichier, stderr=STDOUT)
                                   
                elif board.bldr == 'noboot':
                    sortie = Popen([os.path.join(HOME_DIR, self.osdir, 'p8', 'bin', self.c8),\
                                    "-mpic16",\
                                    "--obanksel=9",\
                                    "--optimize-cmp",\
                                    "--optimize-df",\
                                    "--denable-peeps",\
                                    "-p" + board.proc,\
                                    "-D" + board.board,\
                                    "-D" + board.bldr,\
                                    "-I" + os.path.join(P8_DIR, 'include'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'non-free'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                                    "-I" + os.path.dirname(filename),\
                                    "--compile-only",\
                                    "-o" + os.path.join(SOURCE_DIR, 'main.o'),\
                                    os.path.join(SOURCE_DIR, 'main.c')],\
                                   stdout=fichier, stderr=STDOUT)
                                   
                sortie.communicate()
                if sortie.poll()!=0:
                    #
                    # Error treatment (RB: fixed 2012-11-15
                    #
                    
                    # set the file pointer to the beginning of stdout
                    fichier.seek(0)
                    # read lines until 'error' or 'Error' is found
                    for ligne in fichier:

                        # C errors
                        error_pos = ligne.find('error')
                        if (error_pos != -1):
                            #error_line_number = ligne[ ligne.find(":") + 1 : error_pos - 2]
                            error_line_number = ligne.split(":")[1]
                            #error_message = ligne[ error_pos + 9 : len(ligne)]
                            error_message = ligne.split(":")[-1]
                            error_color = self.getColorConfig("Highligh", "codeerror", [120, 255, 152])
                            # TODO : highlight more than one line / highlight must remain until line is changed
                            self.highlightline(int(error_line_number)-1, error_color)
                            self.displaymsg("error line " + error_line_number + " " + error_message, 0)
                            
                        # ASM errors
                        error_pos = ligne.find('Error')
                        if (error_pos != -1):
                            # do not display error line number since they are from the ASM file
                            # display error symbol instead
                            error_symbol = ligne[ligne.find("(_") + 2 : ligne.find(").")]
                            textEdit  = self.stcpage[self.notebookEditor.GetSelection()]
                            textPlain = str(textEdit.GetTextUTF8())
                            error_index = textPlain.find(error_symbol)
                            textEdit.SetSelection(error_index, error_index + len(error_symbol))
                            error_line_number = textEdit.LineFromPosition(error_index) + 1
                            error_message = ligne[ error_pos + 13 : ligne.find("(_") - 1]
                            error_color = self.getColorConfig("Highligh", "codeerror", [120, 255, 152])
                            self.highlightline(int(error_line_number)-1, error_color)
                            self.displaymsg("error line " + str(error_line_number) + ": " + error_message.lower() + ": " + error_symbol, 0)
                fichier.close()
                return sortie.poll()
            else:
                return 0

# ------------------------------------------------------------------------------
# Link
# ------------------------------------------------------------------------------

    def link(self, filename, board):
        if (self.debug_output == 1):
            print("link " + board.proc)
        else:
            fichier = open(os.path.join(SOURCE_DIR, 'stdout'), 'w+')
            
            if board.arch == 8:
                
                if board.bldr == 'boot2':
                    sortie=Popen([os.path.join(HOME_DIR, self.osdir, 'p8', 'bin', self.c8),\
                        "-o" + os.path.join(SOURCE_DIR, 'main.hex'),\
                        "--denable-peeps",\
                        "--obanksel=9",\
                        "--opt-code-size",\
                        "--optimize-cmp",\
                        "--optimize-df",\
                        "--no-crt",\
                        "-Wl-s" + os.path.join(P8_DIR, 'lkr', board.bldr + '.' + board.proc + '.lkr') + ",-m",\
                        "-mpic16",\
                        "-p" + board.proc,\
                        "-D" + board.bldr,\
                        "-I" + os.path.join(P8_DIR, 'include'),\
                        "-I" + os.path.join(P8_DIR, 'include', 'non-free'),\
                        "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                        "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                        "-L" + os.path.join(P8_DIR, 'lib'),\
                        "-L" + os.path.join(P8_DIR, 'lib', 'non-free'),\
                        '-llibio' + board.proc + '.lib',\
                        '-llibc18f.lib',\
                        '-llibm18f.lib',\
                        '-llibsdcc.lib',\
                        os.path.join(P8_DIR, 'obj', 'application_iface.o'),\
                        os.path.join(P8_DIR, 'obj', 'boot_iface.o'),\
                        os.path.join(P8_DIR, 'obj', 'usb_descriptors.o'),\
                        os.path.join(P8_DIR, 'obj', 'crt0ipinguino.o'),\
                        os.path.join(SOURCE_DIR, 'main.o')],\
                        stdout=fichier, stderr=STDOUT)
                        
                elif board.bldr == 'boot4':
                    sortie=Popen([os.path.join(HOME_DIR, self.osdir, 'p8', 'bin', self.c8),\
                        "-o" + os.path.join(SOURCE_DIR, 'main.hex'),\
                        "-mpic16",\
                        "--obanksel=9",\
                        "--optimize-cmp",\
                        "--optimize-df",\
                        "--denable-peeps",\
                        "--ivt-loc=" + str(board.memstart),\
                        "--use-crt=" + os.path.join(P8_DIR, 'obj', 'crt0i' + board.proc + '.o'),\
                        "-Wl-s" + os.path.join(P8_DIR, 'lkr', board.bldr + '.' + board.proc + '.lkr') + ",-m",\
                        "-p" + board.proc,\
                        "-D" + board.bldr,\
                        "-I" + os.path.join(P8_DIR, 'include'),\
                        "-I" + os.path.join(P8_DIR, 'include', 'non-free'),\
                        "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                        "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                        "-L" + os.path.join(P8_DIR, 'lib'),\
                        "-L" + os.path.join(P8_DIR, 'lib', 'non-free'),\
                        '-llibio' + board.proc + '.lib',\
                        '-llibc18f.lib',\
                        '-llibm18f.lib',\
                        '-llibsdcc.lib',\
                        os.path.join(SOURCE_DIR, 'main.o')],\
                        stdout=fichier, stderr=STDOUT)
                        
                elif board.bldr == 'noboot':
                    sortie=Popen([os.path.join(HOME_DIR, self.osdir, 'p8', 'bin', self.c8),\
                        "-o" + os.path.join(SOURCE_DIR, 'main.hex'),\
                        "--verbose",\
                        "-mpic16",\
                        "--obanksel=9",\
                        "--optimize-cmp",\
                        "--optimize-df",\
                        "--denable-peeps",\
                        "--no-crt",\
                        "-Wl-s" + os.path.join(P8_DIR, 'lkr', board.proc + '_g.lkr') + ",-m",\
                        "-p" + board.proc,\
                        "-D" + board.bldr,\
                        "-I" + os.path.join(P8_DIR, 'include'),\
                        "-I" + os.path.join(P8_DIR, 'include', 'non-free'),\
                        "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                        "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                        "-L" + os.path.join(P8_DIR, 'lib'),\
                        "-L" + os.path.join(P8_DIR, 'lib', 'non-free'),\
                        '-llibio' + board.proc + '.lib',\
                        '-llibc18f.lib',\
                        '-llibm18f.lib',\
                        '-llibsdcc.lib',\
                        #os.path.join(P8_DIR, 'obj', 'crt0ipinguino.o'),\
                        os.path.join(SOURCE_DIR, 'main.o')],\
                        stdout=fichier, stderr=STDOUT)
                        
            else:#if board.arch == 32:
                # "PDEDIR=" + os.path.dirname(self.GetPath()),\
                # can't be used with Command Line version since editor isn't used
                sortie=Popen([self.make,\
                              "--makefile=" + os.path.join(SOURCE_DIR, 'Makefile32.'+self.osdir),\
                              "HOME=" + HOME_DIR,\
                              "PDEDIR=" + os.path.dirname(filename),\
                              "PROC=" + board.proc,\
                              "BOARD=" + board.board],\
                             stdout=fichier, stderr=STDOUT)
                             
            sortie.communicate()
            fichier.seek(0)
            # Check if child process has terminated
            if sortie.poll()!=0:
                for ligne in fichier:
                    if ligne.find('error')!=-1:
                        self.displaymsg(ligne, 0)
            fichier.close()
            if sys.platform=='win32':
                if board.board in ['PIC32_PINGUINO_220', 'GENERIC32MX250F128', 'GENERIC32MX220F032']:
                    badrecord=":040000059D0040001A\n"
                else:
                    badrecord=":040000059D006000FA\n"                
                if os.path.exists(os.path.join(SOURCE_DIR,"main32tmp.hex")):
                    fichiersource=open(os.path.join(SOURCE_DIR,"main32tmp.hex"),'r')
                    fichierdest=open(os.path.join(SOURCE_DIR,"main32.hex"),'w+')
                    for line in fichiersource:
                        if line!=badrecord:
                            fichierdest.writelines(line)
                    fichiersource.close()
                    fichierdest.close()
                    os.remove(os.path.join(SOURCE_DIR,"main32tmp.hex"))
            return sortie.poll()

# ------------------------------------------------------------------------------
# Get the Code Size
# ------------------------------------------------------------------------------

    def getCodeSize(self, filename, board):
        codesize = 0
        address_Hi = 0
        memfree = board.memend - board.memstart
        fichier = open(filename + ".hex", 'r')
        lines = fichier.readlines()
        for line in lines:
            byte_count = int(line[1:3], 16)
            address_Lo = int(line[3:7], 16)
            record_type= int(line[7:9], 16)
            # extended linear address record
            if record_type == 4:
                address_Hi = int(line[9:13], 16) << 16
                        # address calculation
            address = (address_Hi << 16) + address_Lo
            # code size
            if record_type == 0:
                if address >= board.memstart:
                    codesize = codesize + byte_count
        fichier.close()
        return "code size: " + str(codesize) + " / " + str(memfree) + " bytes" + " (" + str(100*codesize/memfree) + "% used)"



########################################################################
class AutocompleterIDE(frameAutoCompleter, AutoCompleter):
    """"""

if DEV:
    ########################################################################
    class UpgradeIDE(frameUpgrade, Upgrade):
        """"""

# ------------------------------------------------------------------------------
# getOptions
# ------------------------------------------------------------------------------

def getOptions():
    parser = argparse.ArgumentParser(description='*** Pinguino IDE ***')
    parser.add_argument('-v', '--version', dest='version', action='store_true', default=False, help='show Pinguino IDE version and exit')
    parser.add_argument('-a', '--author', dest='author', action='store_true', default=False, help='show authors of this Pinguino IDE version and exit')
    parser.add_argument('-f', '--filename', dest='filename', nargs=1, default=False, help='filename to process')
    parser.add_argument('-d', '--dev', dest='dev', nargs=1, default=False, help='set developer mode')
    
    for b in range(len(boardlist)):
        parser.add_argument(    boardlist[b].shortarg,
                                boardlist[b].longarg,
                                dest='board',
                                const=b,
                                action='store_const',
                                default=False,
                                help='compile code for ' + boardlist[b].board + ' board')
    return parser.parse_args()

# ------------------------------------------------------------------------------
# getVersion
# ------------------------------------------------------------------------------

def getVersion():
    return pinguino_version

