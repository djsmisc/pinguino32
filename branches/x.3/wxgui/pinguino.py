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
# changelog (see also file ChangeLog)
# ------------------------------------------------------------------------------
# x.3 regis blanchot
# TODO: pinguino universal uploader class
# TODO: pinguino debug stream class
#
# x.2 regis blanchot
# multi-architecture support (8 and 32-bit)
# multi-board support
# multi-platform support (GNU/Linux, Win32, MacOSX)
# improved command line execution
# process time calculation
# pinguino check list class (jp.mandon)
# pinguino boards list class
# pinguino version control class

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

pinguino_version="x.3"

# ------------------------------------------------------------------------------
# paths
# ------------------------------------------------------------------------------

HOME_DIR	= sys.path[0]
THEME_DIR	= os.path.join(HOME_DIR, 'theme')
SOURCE_DIR	= os.path.join(HOME_DIR, 'source')
LOCALE_DIR	= os.path.join(HOME_DIR, 'locale')
P32_DIR		= os.path.join(HOME_DIR, 'p32')
P8_DIR		= os.path.join(HOME_DIR, 'p8')
SVN_DIR		= 'http://pinguino32.googlecode.com/svn/trunk/'
APP_CONFIG	= os.path.join(HOME_DIR, '.config')
TEMP_DIR = os.path.join(HOME_DIR, '.temp')
EXAMPLES_DIR = os.path.join(HOME_DIR, 'examples')

# ------------------------------------------------------------------------------
# default
# ------------------------------------------------------------------------------
THEME_DEFAULT = "PinguinoX"
BOARD_DEFAULT = Vasco2550()
gui=False

# ------------------------------------------------------------------------------
# traducciones
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Pinguino Class
# ------------------------------------------------------------------------------

class Pinguino(framePinguinoX, Editor):

    global lang
    global gui

    osdir=""
    sdcc=""
    #gcc=""
    debug_output=0
    debug_handle=False
    debug_thread=False
    debug_flag=False


    noname=0
    keywordList=[]
    reservedword=[]
    libinstructions=[]
    regobject=[]
    rw=[]
    THEME=[]
    KEYWORD=[]


# ------------------------------------------------------------------------------
# init
# ------------------------------------------------------------------------------
    def __initPinguino__(self, parent):
        #self._init_ctrls(parent)
        self.notebookEditor.Hide()
        self.boardlist = boardlist
        self.debugOutMessage = None
        self.closing = False
        self.GetTheme()


        if os.path.isdir(TEMP_DIR) == False: os.mkdir(TEMP_DIR)

        self._mgr = wx.aui.AuiManager(self)

        self.loadSettings()
        self.setOSvariables()
        #self.setLanguage()
        self.buildMenu()
        self.buildOutput()
        self.buildLateralPanel()
        self.buildEditor()
        self.ConnectAll()

        self.trees = []

        #Threads
        EVT_RESULT_REVISION(self, self.setRevision)



        # ------------------------------------------------------------------------------
        # check new release of Pinguino
        # TODO: how to exclude compilers dir. from other OS ?
        # ------------------------------------------------------------------------------

        self.threadRevision = threading.Thread(target=self.getRevision, args=( ))
        self.threadRevision.start()

        self.SetTitle('Pinguino IDE ' + pinguino_version + ' rev. [loading...]')
        self.displaymsg("Welcome to Pinguino IDE (rev. [loading...])\n", 0)     


        self.__initIDE__()

        self.openLast()
        
    #----------------------------------------------------------------------
    def translate(self, str):
        """"""
        return str
        


# ------------------------------------------------------------------------------
# Decorator to debug time
# ------------------------------------------------------------------------------       
    def debugTime(function):
        DEBUG_TIME = True
        def process(*args):
            inicio = time.time()
            retorno = function(*args)
            fin = time.time()
            print function.__name__ + "\tTime: %.7fs" %(fin - inicio)
            return retorno
        if DEBUG_TIME : return process
        else: return function


# ------------------------------------------------------------------------------
# Editor
# ------------------------------------------------------------------------------
    def buildEditor(self):
        self.EditorPanel = self.panelEditor
        #background with pinguino.cc colour and pinguino logo
        self.EditorPanel.SetBackgroundColour(wx.Colour(175, 200, 225))
        self.imageBackground = wx.Bitmap(os.path.join(THEME_DIR, 'logo.png'), wx.BITMAP_TYPE_ANY)
        if sys.platform == 'win32':
            self.imageBackground.SetSize((5000,5000)) # :)
        self.background = wx.StaticBitmap(self.EditorPanel, wx.ID_ANY, self.imageBackground)
        self.background.CentreOnParent(wx.BOTH) 

        # ------------------------------------------------------------------------------
        # add the panes to the manager
        # ------------------------------------------------------------------------------

        self._mgr.AddPane(self.panelOutput, self.PaneOutputInfo, '')
        self.lat = panelLateral(self)
        self._mgr.AddPane(self.lat, self.PaneLateral, '')
        self._mgr.AddPane(self.panelEditor, wx.CENTER , '')
        self._mgr.Update()


# ------------------------------------------------------------------------------
# Lateral
# ------------------------------------------------------------------------------
    def buildLateralPanel(self):
        self.PaneLateral=wx.aui.AuiPaneInfo()
        self.PaneLateral.CloseButton(True)
        #self.PaneLateral.MaximizeButton(True)
        self.PaneLateral.MinimizeButton(True)
        self.PaneLateral.Caption("Tools")
        self.PaneLateral.Right()


# ------------------------------------------------------------------------------
# Event Management
# ------------------------------------------------------------------------------
    def ConnectAll(self):
        """"""
        self.Bind(wx.EVT_CLOSE, self.OnExit)
        self.Bind(wx.EVT_SIZE, self.OnResize)	 

        #file menu
        self.Bind(wx.EVT_MENU, self.OnNew, self.menu.menuItemNew)
        self.Bind(wx.EVT_MENU, self.OnOpen, self.menu.menuItemOpen)
        #self.Bind(wx.EVT_MENU_RANGE, self.menu.menuRecents, id=wx.ID_FILE1, id2=wx.ID_FILE9) 
        self.Bind(wx.EVT_MENU, self.OnSave, self.menu.menuItemSave)
        self.Bind(wx.EVT_MENU, self.OnSaveAs, self.menu.menuItemSaveAs)
        self.Bind(wx.EVT_MENU, self.OnClose, self.menu.menuItemClose)
        self.Bind(wx.EVT_MENU, self.OnExit, self.menu.menuItemExit)

        #edit menu
        self.Bind(wx.EVT_MENU, self.OnCopy, self.menu.menuItemCopy)
        self.Bind(wx.EVT_MENU, self.OnPaste, self.menu.menuItemPaste)
        self.Bind(wx.EVT_MENU, self.OnCut, self.menu.menuItemCut)
        self.Bind(wx.EVT_MENU, self.OnClear, self.menu.menuItemClear)	   
        self.Bind(wx.EVT_MENU, self.OnUndo, self.menu.menuItemUndo)	   
        self.Bind(wx.EVT_MENU, self.OnRedo, self.menu.menuItemRedo)
        self.Bind(wx.EVT_MENU, self.OnFind, self.menu.menuItemFind)
        self.Bind(wx.EVT_MENU, self.OnReplace, self.menu.menuItemReplace)		
        self.Bind(wx.EVT_MENU, self.OnSelectall, self.menu.menuItemSelectAll)
        self.Bind(wx.EVT_MENU, self.OnComment, self.menu.menuItemComment_Uncomment)
        self.Bind(wx.EVT_MENU, self.OnPreferences, self.menu.menuItemPreferences)

        #view menu
        self.Bind(wx.EVT_MENU, self.OnViewTools, self.menu.menuItemTools)
        self.Bind(wx.EVT_MENU, self.OnViewOutput, self.menu.menuItemOutput)
        self.Bind(wx.EVT_MENU, self.OnViewToolbar, self.menu.menuItemToolbar)

        #pinguino menu
        if DEV:
            #self.Bind(wx.EVT_MENU, self.OnDebug, self.menu.menuDebugMode)
            self.Bind(wx.EVT_MENU, self.OnCheck, self.menu.menuItemCheckRev)
            self.Bind(wx.EVT_MENU, self.OnUpgrade, self.menu.menuItemUpgrade)
        for b in range(len(boardlist)):
            self.Bind(wx.EVT_MENU, self.OnBoard, id = boardlist[b].id)

        #self.Bind(wx.EVT_MENU_RANGE, self.OnTheme, id=self.ID_THEME1, id2=self.ID_THEME1 + self.themeNum)
        if DEV:
            self.Bind(wx.EVT_MENU, lambda x:self.setDebugger(mode="CDC"), self.menu.menuItemUSBCDC)
            self.Bind(wx.EVT_MENU, lambda x:self.setDebugger(mode=None), self.menu.menuItemDebugNone)


        ##plugin
        #self.Bind(wx.EVT_TOOL, self.OnPlugIn, id=self.ID_PLUG_ON)
        #self.Bind(wx.EVT_TOOL, self.NoPlugIn, id=self.ID_PLUG_OFF)

        # help menu
        self.Bind(wx.EVT_TOOL, self.OnKeyword, self.menu.menuItemKeywords)
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://www.pinguino.cc"), self.menu.menuItemWebSite)	
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://blog.pinguino.cc"), self.menu.menuItemBlog)		 
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://forum.pinguino.cc"), self.menu.menuItemForum)	   
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://groups.google.fr/group/pinguinocard?pli=1"), self.menu.menuItemGroup)	  		
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://wiki.pinguino.cc"), self.menu.menuItemWiki)		
        self.Bind(wx.EVT_TOOL, lambda x:webbrowser.open("http://shop.pinguino.cc"), self.menu.menuItemShop)		
        self.Bind(wx.EVT_MENU, self.OnAbout, self.menu.menuItemAbout)	


# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------
    def buildOutput(self):
        self.panelOutput = wx.Panel(id=wx.NewId(), name='panel1', parent=self,
                                    pos=wx.Point(0, 0), size=wx.Size(449, 169),
                                    style=wx.TAB_TRAVERSAL)

        self.logwindow = wx.TextCtrl(id=wx.NewId(), name='textCtrl1',
                                     parent=self.panelOutput, pos=wx.Point(0, 0), size=wx.Size(449, 148),
                                     style=wx.TE_READONLY | wx.TE_MULTILINE, value=u'')
        self.logwindow.SetBackgroundColour(wx.Colour(0, 0, 0))
        self.logwindow.SetForegroundColour(wx.Colour(255, 255, 255))
        self.logwindow.SetMinSize((-1, -1))

        self.debuggingLine = wx.TextCtrl(id=wx.NewId(), name='textCtrl2',
                                         parent=self.panelOutput, pos=wx.Point(0, 148), size=wx.Size(449, 21),
                                         style=0, value=u'>>>')
        self.debuggingLine.SetBackgroundColour(wx.Colour(0, 0, 0))
        self.debuggingLine.SetForegroundColour(wx.Colour(255, 255, 255))
        self.debuggingLine.SetInsertionPoint(125)
        self.debuggingLine.Hide()        
        self.debuggingLine.Bind(wx.EVT_KEY_UP, self.sendDebugging)

        self.boxSizer1 = wx.BoxSizer(orient=wx.VERTICAL)
        self.boxSizer1.AddWindow(self.logwindow, 1, border=0, flag=wx.EXPAND)
        self.boxSizer1.AddWindow(self.debuggingLine, 0, border=0, flag=wx.EXPAND) 
        self.panelOutput.SetSizer(self.boxSizer1)


        # create a PaneInfo structure for output window
        self.PaneOutputInfo=wx.aui.AuiPaneInfo()
        self.PaneOutputInfo.CloseButton(False)
        self.PaneOutputInfo.MaximizeButton(True)
        self.PaneOutputInfo.MinimizeButton(True)
        self.PaneOutputInfo.Caption("Output")
        self.PaneOutputInfo.Bottom()


# ----------------------------------------------------------------------
# Menus
# ----------------------------------------------------------------------
    def buildMenu(self):
        self.menu = menubarPinguino()

        #menu Board
        self.board_menu= self.menu.menuBoard
        for b in range(len(boardlist)):
            self.board_menu.AppendRadioItem(boardlist[b].id, boardlist[b].name, "your board")
        bid = self.config.ReadInt('Board', -1)
        minbid = boardlist[0].id
        maxbid = boardlist[len(boardlist)-1].id
        if bid == -1 or bid < minbid or bid > maxbid:
            bid = BOARD_DEFAULT.id
        self.board_menu.Check(bid, True)
        self.OnBoard(wx.Event)

        #menu Recents
        self.filehistory.UseMenu(self.menu.menuRecents)
        self.filehistory.AddFilesToMenu()

        self.SetMenuBar(self.menu)

        self.DrawToolbar()



# ----------------------------------------------------------------------
# load settings from config file
# ----------------------------------------------------------------------
    def loadSettings(self):
        self.config = wx.FileConfig(localFilename = APP_CONFIG, style = wx.CONFIG_USE_LOCAL_FILE)
        self.filehistory = wx.FileHistory()
        self.filehistory.Load(self.config)

        framesize = ( self.config.ReadInt('Window/Width', -1), self.config.ReadInt('Window/Height', -1))
        if framesize == (0, 0): framesize = (400, 400)
        self.SetSize(framesize)

        #framepos = (self.config.ReadInt('Window/Posx', -1), self.config.ReadInt('Window/Posy', -1))

        self.outputsize = (self.config.ReadInt('Output/Width', -1), self.config.ReadInt('Output/Height', -1))
        if self.outputsize == (0, 0): self.outputsize = (400, 250)

        self.debug =   self.config.ReadInt('Debug', -1)
        if self.debug == '': self.debug = ID_NODEBUG

        self.theme =   self.config.Read('Theme/name')
        if self.theme == '': self.theme = THEME_DEFAULT


# ----------------------------------------------------------------------
# window
# ----------------------------------------------------------------------
    def setLanguage(self):
        """"""



        #loc = locale.getdefaultlocale()[0][0:2]

        ## pt_BR Language Check, By Wagner de Queiroz, 2010-Mar,01
        #if loc == "pt":
            #loc = locale.getdefaultlocale()[0][0:5]
        #if loc != "pt_BR":
            #loc = locale.getdefaultlocale()[0][0:2]              

        #self.lang = gettext.translation('pinguino', LOCALE_DIR, languages=[loc], fallback=True)
        #_=self.lang.ugettext

        #_icon = wx.EmptyIcon()
        #_icon.CopyFromBitmap(wx.Bitmap(os.path.join(THEME_DIR, 'logo.png'), wx.BITMAP_TYPE_ANY))
        #self.SetIcon(_icon)

        #return _


# ----------------------------------------------------------------------
# get OS name and define some OS dependant variable
# ----------------------------------------------------------------------
    def setOSvariables(self):
        if sys.platform == 'darwin':
            self.osdir = 'macosx'
            self.debug_port = '/dev/tty.usbmodem1912'
            self.c8 = 'sdcc'
            self.u32 = 'ubw32'
            self.make = 'make'
        elif sys.platform == 'win32':
            self.osdir = 'win32'
            self.debug_port = 15
            self.c8 = 'sdcc.exe'
            self.u32 = 'mphidflash.exe'
            self.make = os.path.join(HOME_DIR, self.osdir, 'p32', 'bin', 'make.exe')
        else:
            self.osdir = 'linux'
            self.debug_port = '/dev/ttyACM0'
            self.c8 = 'sdcc'
            self.u32 = 'ubw32'
            self.make = 'make'       


# ------------------------------------------------------------------------------
# Get revision
# ------------------------------------------------------------------------------ 
    def getRevision(self):
        try: sw = SubversionWorkingCopy(HOME_DIR).current_version()
        except: sw = "unknown"
        wx.PostEvent(self, ResultEventRevision(sw))


# ------------------------------------------------------------------------------
# Revision
# ------------------------------------------------------------------------------
    def setRevision(self, event):
        self.localRev = event.data
        self.SetTitle('Pinguino IDE ' + pinguino_version + ' rev. ' + self.localRev)
        self.displaymsg("Welcome to Pinguino IDE (rev. " + self.localRev + ")\n", 1)
        self.statusBarEditor.SetStatusText(number=2, text="Rev. %s" %self.localRev)

# ------------------------------------------------------------------------------
# Update
# ------------------------------------------------------------------------------
    def updateIDE(self):
        self.lat.search.Fit()
        self._mgr.Update()



## ------------------------------------------------------------------------------
## Thread
## ------------------------------------------------------------------------------
    #def dthread(self):
        #while self.debug_flag is True:
            #if self.debug_handle:
                #print ">>>debug:"	
                #print self.debug_handle.readline()
            #time.sleep(0.01)

    ## create the debug thread			
    #if DEV:
        #debug_thread = threading.Thread(target=dthread)

# ------------------------------------------------------------------------------
# OnUpgrade
# ------------------------------------------------------------------------------

    def OnUpgrade(self, event):
        self.displaymsg(self.translate("Upgrading ...\n"), 0)
        try:  self.sr.checkout(HOME_DIR)
        except:
            self.displaymsg(self.translate("Local version is not under revision control.\n"), 0)
            return
        self.displaymsg(self.translate("Done\n"), 0)
        Pinguino.__init__(self, parent)

# ------------------------------------------------------------------------------
# OnCheck
# ------------------------------------------------------------------------------

    def OnCheck(self, event):
        self.displaymsg(self.translate("Checking repository revision number ...\n"), 0)
        try:  self.sr = SubversionRepository(SVN_DIR)
        except:
            self.displaymsg(self.translate("Server temporarily unavailable.\n"), 0)
            return
        self.svnRev = self.sr.current_version()
        if self.svnRev == self.localRev:
            self.UPGRADE.Enable(False)
            self.displaymsg(self.translate("You have the latest version.\n"), 0)
        else:
            self.UPGRADE.Enable(True)
            self.displaymsg(self.translate("Revision ") + self.svnRev + self.translate(" is available.\n"), 0)

## ------------------------------------------------------------------------------
## OnDebug
## ------------------------------------------------------------------------------

    #def OnDebug(self, event):
        #for d in range(self.ID_ENDDEBUG - self.ID_DEBUG - 1):
            #did = self.ID_DEBUG + d + 1
            #if self.menu.menuDebugMode.IsChecked(did):
                #self.debug = did

        ## mode Debug ?
        #"""
                        ## try to open serial port
                        #try:
                                #self.debug_handle = serial.Serial(self.debug_port)
                        #except:
                                #pass
                        ## is a device connected ?
                        #if self.debug_handle:
                                ## let's start our thread
                                #self.debug_flag = True
                                #self.debug_thread.start()
                #else:
                        ## stop the thread
                        #self.debug_flag = False
                        #if self.debug_thread:
                                #self.debug_thread.join()
                        #if self.debug_handle:
                                #self.debug_handle.close()
                #"""



# ------------------------------------------------------------------------------
# OnFileHistory : open selected history file
# ------------------------------------------------------------------------------

    def OnFileHistory(self, event):
        self.background.Hide() 
        fileNum = event.GetId() - wx.ID_FILE1
        path = self.filehistory.GetHistoryFile(fileNum)
        self.filehistory.AddFileToHistory(path)				  # move up the list
        self.Open(path,self.reservedword,self.rw, self.filehistory, self.config)
        # refresh file menu (doesn't seem to work)
        self.file_menu.UpdateUI()
        self.updatenotebook()

# ------------------------------------------------------------------------------
# OnSave : Save current file
# ------------------------------------------------------------------------------

    #def OnSave(self, event): 
        #self.SaveDirect()

# ------------------------------------------------------------------------------
# OnSaveAs : Save current File as ...
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# OnClose : Close Editor Window
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# OnExit : Save Settings and Exit Program
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# GetTheme : get all the theme (directory) name
# ------------------------------------------------------------------------------

    def GetTheme(self):
        self.themeList = [f for f in os.listdir(THEME_DIR)
                          if os.path.isdir(os.path.join(THEME_DIR, f))]
        self.themeNum = len(self.themeList)

# ------------------------------------------------------------------------------
# OnBoard : load boards specificities
# ------------------------------------------------------------------------------

    def OnBoard(self, event):
        for b in range(len(boardlist)):
            #clef = BOARD_DEFAULT_ID + b
            bid = boardlist[b].id
            if self.board_menu.IsChecked(bid):
                self.curBoard = boardlist[b]
                break
        # clear all the lists before rebuild them
        del self.rw[:]
        del self.regobject[:]
        del self.keywordList[:]
        del self.reservedword[:]
        del self.libinstructions[:]
        self.readlib(self.curBoard)

        self.statusBarEditor.SetStatusText(number=3, text=self.curBoard.name)


# ------------------------------------------------------------------------------
# OnResize:
# ------------------------------------------------------------------------------

    def OnResize(self,event):
        try: self.background.CentreOnParent(wx.BOTH)
        except: pass	
        self._mgr.Update()
        event.Skip()

    #----------------------------------------------------------------------
    def openLast(self):
        for i in range(self.config.ReadInt('LastEdit/count')):
            file = self.config.Read('LastEdit/file%d' %i)
            if os.path.isfile(file):
                self.Open(file, self.reservedword, self.rw, self.filehistory, self.config)		


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
        image = wx.Image(os.path.join(THEME_DIR, 'logoX3.png'), wx.BITMAP_TYPE_PNG)
        image = image.Scale(500, 375, wx.IMAGE_QUALITY_HIGH)
        bmp = wx.BitmapFromImage(image)
        #bmp = image.ConvertToBitmap()
        icon = wx.EmptyIcon()
        icon.CopyFromBitmap(bmp)
        info.SetIcon(icon)
        info.SetName('Pinguino')
        info.SetVersion("rev. " + self.localRev)
        info.SetDescription(description)
        # LGPL compatibility ?
        #info.SetCopyright('2008, 2009, 2010, 2011 jean-pierre mandon')
        info.SetWebSite('http://www.pinguino.cc')
        info.SetLicence(licence)

        info.AddDeveloper('Jean-Pierre Mandon')
        info.AddDeveloper('Régis Blanchot')
        info.AddDeveloper('Marcus Fazzi')
        info.AddDeveloper('Jesús Carmona Esteban')		
        info.AddDeveloper('Ivan Ricondo')
        info.AddDeveloper('Joan Espinoza')
        info.AddDeveloper('Yeison Cardona')									

        info.AddDocWriter('Benoit Espinola')
        info.AddDocWriter('Sebastien Koechlin')
        info.AddDocWriter('Ivan Ricondo')
        info.AddDocWriter('Jesús Carmona Esteban')
        info.AddDocWriter('Marcus Fazzi')
        info.AddDocWriter('Régis Blanchot')

        info.AddArtist('France Cadet')
        info.AddArtist('Laurent Costes')
        info.AddArtist('Daniel Rodríguez')

        info.AddTranslator('Joan Espinoza: Spanish, Portuguese')
        info.AddTranslator('Marin Purgar: Croatian')
        info.AddTranslator('Wim Heirman: Dutch')
        info.AddTranslator('Vasile Guta Ciucur: Romanian')
        info.AddTranslator('Wagner de Queiroz: Brazilian portuguese')

        wx.AboutBox(info)  

# ------------------------------------------------------------------------------
# OnVerify:
# ------------------------------------------------------------------------------

    def OnVerify(self, event):
        global lang
        t0 = time.time()
        if self.GetPath()==-1:
            dlg = wx.MessageDialog(self,
                                   self.translate('Open file first !!'),
                                   self.translate('Warning'),
                                   wx.OK | wx.ICON_WARNING)
            result=dlg.ShowModal()
            dlg.Destroy()		   
            return
        self.displaymsg("Board:\t" + self.curBoard.name + "\n", 1)
        self.displaymsg("Proc: \t" + self.curBoard.proc + "\n", 0)
        self.OnSave()
        filename=self.GetPath()
        filename,extension=os.path.splitext(filename)
        if os.path.exists(filename+".hex"):
            os.remove(filename+".hex")
        if os.path.exists(os.path.join(SOURCE_DIR, "user.c")):
            os.remove(os.path.join(SOURCE_DIR, "user.c"))
        retour=self.preprocess(filename, self.curBoard)
        if retour=="error":
            return
        # compilation
        if self.curBoard.arch == 8:
            MAIN_FILE="main.hex"
        else:
            MAIN_FILE="main32.hex"
        retour=self.compile(filename, self.curBoard)
        if retour!=0:
            self.displaymsg(self.translate("error while compiling file ")+filename,0)
        else:
            retour=self.link(filename, self.curBoard)
            if os.path.exists(os.path.join(SOURCE_DIR, MAIN_FILE))!=True:
                self.displaymsg(self.translate("error while linking")+" "+filename+".o",0)
            else:
                shutil.copy(os.path.join(SOURCE_DIR, MAIN_FILE), filename+".hex")
                self.displaymsg(self.translate("compilation done")+"\n",0)
                self.displaymsg(self.getCodeSize(filename, self.curBoard)+"\n",0)
                self.displaymsg(str(time.time() - t0) + " seconds process time\n",0)
                os.remove(os.path.join(SOURCE_DIR, MAIN_FILE))
                #os.remove(filename+".c")

# ------------------------------------------------------------------------------
# OnUpload:
# ------------------------------------------------------------------------------

    def OnUpload(self, event):
        if self.GetPath() != -1:
            filename = self.GetPath()
            filename, extension = os.path.splitext(filename)
            if os.path.exists(filename + '.hex'):
                if self.curBoard.arch == 8:
                    u = Uploader(self.logwindow, filename, self.curBoard)
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
                                       self.translate('File must be verified/compiled before upload'),
                                       self.translate('Warning!'),
                                       wx.OK | wx.ICON_WARNING)
                result=dlg.ShowModal()
                dlg.Destroy()					 
        else:# not saved
            dlg = wx.MessageDialog(self,
                                   self.translate('File must be saved before upload'),
                                   self.translate('Warning!'),
                                   wx.OK | wx.ICON_WARNING)
            result=dlg.ShowModal()
            dlg.Destroy()		   
        event.Skip()




# ------------------------------------------------------------------------------
# Draw toolbar icons
# ------------------------------------------------------------------------------

    def DrawToolbar(self):
        try: self.toolbar.ClearTools()
        except: self.toolbar = wx.ToolBar(self, -1, wx.DefaultPosition, wx.DefaultSize, wx.TB_FLAT | wx.TB_NODIVIDER)

        # Get size of new theme's icons
        icon = wx.Bitmap(os.path.join(THEME_DIR, self.theme, "new.png"), wx.BITMAP_TYPE_ANY)
        iconSize = icon.GetSize()

        # Update Bitmap size to fit new icons (not sure that it works !)
        self.toolbar.SetToolBitmapSize(iconSize)


        def add2Toolbar(icon, name, function, shdesc="", lngdesc=""):
            if (os.path.exists(os.path.join(THEME_DIR, self.theme, icon+".png"))!=False):
                id = wx.NewId()
                self.toolbar.AddLabelTool(id,
                                          name,
                                          wx.Bitmap(os.path.join(THEME_DIR, self.theme, icon+".png"), wx.BITMAP_TYPE_ANY),
                                          wx.NullBitmap, wx.ITEM_NORMAL,
                                          shdesc,
                                          lngdesc)
                self.Bind(wx.EVT_TOOL, function, id=id)


        add2Toolbar("new", "&New", self.OnNew, "New File")
        add2Toolbar("open", "&Open", self.OnOpen, "Open File")
        add2Toolbar("save", "&Save", self.OnSave, "Save File")
        add2Toolbar("stop", "&Close", self.OnClose, "Close File")  
        self.toolbar.AddSeparator()
        add2Toolbar("undo", "&Undo", self.OnUndo, "Undo")
        add2Toolbar("redo", "&Redo", self.OnRedo, "Redo")   
        self.toolbar.AddSeparator()
        add2Toolbar("cut", "&Cut", self.OnCut, "Cut")
        add2Toolbar("copy", "&Copy", self.OnCopy, "Copy")
        add2Toolbar("paste", "&Paste", self.OnPaste, "Paste")   
        add2Toolbar("clear", "&Clear", self.OnClear, "Clear")   
        add2Toolbar("select", "&Select", self.OnSelectall, "Select")   
        self.toolbar.AddSeparator()
        add2Toolbar("find", "&Fin", self.OnFind, "Search in File")   
        add2Toolbar("replace", "&Replace", self.OnReplace, "Replace in File")   
        self.toolbar.AddSeparator()
        add2Toolbar("runw", "&Verify", self.OnVerify, "Compile") 
        add2Toolbar("dwn", "&Upload", self.OnUpload, "Upload to Pinguino Board") 
        #add2Toolbar("debug", "&Debug On/Off", self.OnDebug, "USB Connexion with Pinguino") 
        add2Toolbar("preferences", "&Preferences", self.OnPreferences, "set preferences of Pinguino IDE") 				   
        self.toolbar.AddSeparator()
        add2Toolbar("exit", "&Exit", self.OnExit, "Exit Pinguino IDE") 
        self.toolbar.Realize()
        self.SetToolBar(self.toolbar)


# ------------------------------------------------------------------------------
# readlib:
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
# displaymsg
# ------------------------------------------------------------------------------

    def displaymsg(self, message, clearpanel):
        """ display message in the log window """
        if gui==True:
            if clearpanel==1:
                self.logwindow.Clear()
            self.logwindow.WriteText(message)
        else:
            if message!="":
                print message
        return  

# ------------------------------------------------------------------------------
# translate
# ------------------------------------------------------------------------------

    def translate(self, message):
        """ translate message using gettext according current OS """
         #Checking if the host platform is a mac
        if sys.platform == 'darwin':
            return message
        else:
            # assume it's a posix or win32 platform
            return message

# ------------------------------------------------------------------------------
# preprocess
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
        #	self.adddefine("#define " + board.board)

        # add #include and #define from user.c to define.h
        fichier = open(os.path.join(SOURCE_DIR, 'user.c'), 'r')
        i=0
        for line in fichier:
            if line.find("#include")!=-1 or line.find("#define")!=-1:
                self.adddefine(line)	# add to define.h
                fileline[i]="\r\n";	# delete from user.c
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
# adddefine
# ------------------------------------------------------------------------------

    def adddefine(self,chaine):
        """ add #define in define.h file """
        fichier = open(os.path.join(SOURCE_DIR, 'define.h'), 'a')
        fichier.writelines(chaine+"\n")
        fichier.close()

# ------------------------------------------------------------------------------
# notindefine
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
# replaceword
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
# removecomment
# ------------------------------------------------------------------------------

    def removecomments(self, text):
        def replacer(match):
            s = match.group(0)
            if s.startswith('/'):
                return ""
            else:
                return s
        pattern = re.compile(
            r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
            re.DOTALL | re.MULTILINE
        )
        return re.sub(pattern, replacer, text)

# ------------------------------------------------------------------------------
# compile
# ------------------------------------------------------------------------------

    def compile(self, filename, board):
        if (self.debug_output == 1):
            print("compile " + board.proc)
        else:
            if board.arch == 8:
                fichier = open(os.path.join(SOURCE_DIR, 'stdout'), 'w+')
                if board.bldr == 'vasco':
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
                                    "-I" + os.path.join(P8_DIR, 'include', 'non-free', 'pic16'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                                    "-I" + os.path.dirname(filename),\
                                    "--compile-only",\
                                    "-o" + os.path.join(SOURCE_DIR, 'main.o'),\
                                    os.path.join(SOURCE_DIR, 'main.c')],\
                                   stdout=fichier, stderr=STDOUT)
                else:# if board.bldr == 'diolan'
#							"--extended",\
                    sortie = Popen([os.path.join(HOME_DIR, self.osdir, 'p8', 'bin2', self.c8),\
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
                                    "-I" + os.path.join(P8_DIR, 'include', 'non-free', 'pic16'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                                    "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                                    "-I" + os.path.dirname(filename),\
                                    "--compile-only",\
                                    "-o" + os.path.join(SOURCE_DIR, 'main.o'),\
                                    os.path.join(SOURCE_DIR, 'main.c')],\
                                   stdout=fichier, stderr=STDOUT)
                sortie.communicate()
                if sortie.poll()!=0:
                    fichier.seek(0)
                    for ligne in fichier:
                        if ligne.find('error')!=-1:
                            self.displaymsg(ligne, 0)
                fichier.seek(0)
                line=fichier.readline()
                if line.find("error")!=-1:
                    number=line[line.find(":")+1:line.find("error")-2]
                    #self.highlightline(int(number)-1,'pink')
                    self.displaymsg("error line " + number + "\n", 1)
                    self.displaymsg(line[line.find("error")+7:len(line)],0)
                fichier.close()
                return sortie.poll()
            else:
                return 0

# ------------------------------------------------------------------------------
# link
# ------------------------------------------------------------------------------

    def link(self, filename, board):
        if (self.debug_output == 1):
            print("link " + board.proc)
        else:
            fichier = open(os.path.join(SOURCE_DIR, 'stdout'), 'w+')
            if board.arch == 8:
                if board.bldr == 'vasco':
                    sortie=Popen([os.path.join(HOME_DIR, self.osdir, 'p8', 'bin', self.c8),\
                                  "-o" + os.path.join(SOURCE_DIR, 'main.hex'),\
                                  "--denable-peeps",\
                                  "--obanksel=9",\
                                  "--opt-code-size",\
                                  "--optimize-cmp",\
                                  "--optimize-df",\
                                  "--no-crt",\
                                  "-Wl-s" + os.path.join(P8_DIR, 'lkr', board.bldr + board.proc + '.lkr') + ",-m",\
                                  "-mpic16",\
                                  "-p" + board.proc,\
                                  "-D" + board.bldr,\
                                  "-I" + os.path.join(P8_DIR, 'include'),\
                                  "-I" + os.path.join(P8_DIR, 'include', 'non-free', 'pic16'),\
                                  "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                                  "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                                  "-L" + os.path.join(P8_DIR, 'lib', 'pic16'),\
                                  '-llibio' + board.proc + '.lib',\
                                  '-llibc18f.lib',\
                                  '-llibm18f.lib',\
                                  '-llibsdcc.lib',\
                                  '-llibpuf.lib',\
                                  os.path.join(P8_DIR, 'obj', 'application_iface.o'),\
                                  os.path.join(P8_DIR, 'obj', 'usb_descriptors.o'),\
                                  os.path.join(P8_DIR, 'obj', 'crt0ipinguino.o'),\
                                  os.path.join(SOURCE_DIR, 'main.o')],\
                                 stdout=fichier, stderr=STDOUT)
                else:# if board.bldr == 'diolan'
#							"--extended",\
                    sortie=Popen([os.path.join(HOME_DIR, self.osdir, 'p8', 'bin2', self.c8),\
                                  "-o" + os.path.join(SOURCE_DIR, 'main.hex'),\
                                  "-mpic16",\
                                  "--denable-peeps",\
                                  "--obanksel=9",\
                                  "--opt-code-size",\
                                  "--optimize-cmp",\
                                  "--optimize-df",\
                                  "--no-crt",\
                                  "-Wl-s" + os.path.join(P8_DIR, 'lkr', board.bldr + board.proc + '.lkr') + ",-m",\
                                  "-p" + board.proc,\
                                  "-D" + board.bldr,\
                                  "-I" + os.path.join(P8_DIR, 'include'),\
                                  "-I" + os.path.join(P8_DIR, 'include', 'non-free', 'pic16'),\
                                  "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'core'),\
                                  "-I" + os.path.join(P8_DIR, 'include', 'pinguino', 'libraries'),\
                                  "-L" + os.path.join(P8_DIR, 'lib', 'pic16'),\
                                  '-llibio' + board.proc + '.lib',\
                                  '-llibc18f.lib',\
                                  '-llibm18f.lib',\
                                  '-llibsdcc.lib',\
                                  os.path.join(P8_DIR, 'obj', 'crt0i' + board.proc + '.o'),\
                                  os.path.join(SOURCE_DIR, 'main.o')],\
                                 stdout=fichier, stderr=STDOUT)
            else:
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
                if os.path.exists(os.path.join(SOURCE_DIR,"main32tmp.hex")):
                    fichiersource=open(os.path.join(SOURCE_DIR,"main32tmp.hex"),'r')
                    fichierdest=open(os.path.join(SOURCE_DIR,"main32.hex"),'w+')
                    for line in fichiersource:
                        if line!=":040000059D006000FA\n":
                            fichierdest.writelines(line)
                    fichiersource.close()
                    fichierdest.close()
                    os.remove(os.path.join(SOURCE_DIR,"main32tmp.hex"))
            return sortie.poll()

# ------------------------------------------------------------------------------
# getCodeSize
# ------------------------------------------------------------------------------

    def getCodeSize(self, filename, board):
        codesize = 0
        totalsize = board.memend - board.memstart
        fichier = open(filename + ".hex", 'r')
        lines = fichier.readlines()
        for line in lines:
            # count only data record
            if line[7:9:1] == "00":
                if board.arch == 8:
                    # filter records below 0x2000 (by RASM)
                    #if int(line[3:7:1],16) >= int("2000", 16): 
                    if int(line[3:7:1],16) >= board.memstart:
                        codesize = codesize + int(line[1:3:1], 16)
                else:
                    codesize = codesize + int(line[1:3:1], 16)
        fichier.close()
        return "code size: " + str(codesize) + " / " + str(totalsize) + " bytes" + " (" + str(100*codesize/totalsize) + "% used)"

    #----------------------------------------------------------------------
    def OnPreferences(self, event=None):
        app = wx.PySimpleApp(0)
        wx.InitAllImageHandlers()
        frame_1 = PreferencesIDE(self)
        frame_1.__initPreferences__(self)
        app.SetTopWindow(frame_1)
        frame_1.CenterOnParent()
        frame_1.Show()
        app.MainLoop()


    #----------------------------------------------------------------------
    def OnKeyword(self, event=None, keyword=None):
        app = wx.PySimpleApp(0)
        wx.InitAllImageHandlers()
        frame_1 = FunctionsIDE(None)
        frame_1.__initfunctionsHelp__(None, self.keywordList, keyword)
        app.SetTopWindow(frame_1)
        frame_1.CenterOnParent()
        frame_1.Show()
        app.MainLoop()
        self.setNormalCursor()

    #----------------------------------------------------------------------
    def OnAutoCompleter(self):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        app = wx.PySimpleApp(0)
        wx.InitAllImageHandlers()
        self.AutoCompleter = AutocompleterIDE(self)
        self.AutoCompleter.__initCompleter__(self, self.wordUnderCursor(True))
        app.SetTopWindow(self.AutoCompleter)       
        self.AutoCompleter.Show()
        app.MainLoop()

    #----------------------------------------------------------------------
    def OnDrop(self, event):
        file = event.GetDragText().replace("file://", "").replace("%20", " ")
        paths = file.split("\n")
        for path in paths:
            print path
            if os.path.isfile(path):
                self.Open(path,
                          self.reservedword,
                          self.rw,
                          self.filehistory,
                          self.config)
        event.SetDragText("")


    #----------------------------------------------------------------------
    def appyPreferences(self):
        self.toolbar.Destroy()
        self.DrawToolbar()


########################################################################
class PreferencesIDE(framePreferences, Preferences):
    """"""

########################################################################
class FunctionsIDE(frameKeyWords, functionsHelp):
    """"""

########################################################################
class AutocompleterIDE(frameAutoCompleter, AutoCompleter):
    """"""


# ------------------------------------------------------------------------------
# getOptions
# ------------------------------------------------------------------------------

def getOptions():
    parser = argparse.ArgumentParser(description='*** Pinguino IDE ***')
    parser.add_argument('-v', '--version', dest='version', action='store_true', default=False, help='show Pinguino IDE version and exit')
    parser.add_argument('-a', '--author', dest='author', action='store_true', default=False, help='show authors of this Pinguino IDE version and exit')
    parser.add_argument('-f', '--filename', dest='filename', nargs=1, default=False, help='filename to process')
    for b in range(len(boardlist)):
        parser.add_argument(	boardlist[b].shortarg,
                                    boardlist[b].longarg,
                                    dest='board',
                                    const=b,
                                    action='store_const',
                                    default=False,
                                    help='compile code for ' + boardlist[b].board + ' board')
    return parser.parse_args()

#----------------------------------------------------------------------
def setGui(bool):
    global gui
    gui=bool

