#!/usr/bin/env python
#-*- coding: utf-8 -*-

import os
import sys
import shutil
import traceback

import wxgui

import wx
from wxgui import setGui, getOptions, getVersion, Pinguino, boardlist
from wxgui import SOURCE_DIR
from wxgui import _

#to save trace when pignuino crash
if os.path.isfile("pinguinoPanic"): os.remove("pinguinoPanic")

########################################################################
class MySplashScreen(wx.SplashScreen):
    #----------------------------------------------------------------------
    def __init__(self):
        """"""
        #bmp = wx.Image(os.path.join("theme", "logoX3.png")).ConvertToBitmap()
        image = wx.Image(os.path.join("theme", "logo3D.png"), wx.BITMAP_TYPE_PNG)
        #image = image.Scale(500, 375, wx.IMAGE_QUALITY_HIGH)
        image = image.Scale(400, 300, wx.IMAGE_QUALITY_HIGH)
        bmp = wx.BitmapFromImage(image)
        memDC = wx.MemoryDC()
        memDC.SetFont(wx.Font(10, wx.SWISS, wx.NORMAL, wx.NORMAL, False, u'Arial'))
        memDC.SetTextForeground(wx.BLACK)
        memDC.SelectObject(bmp)
        #memDC.DrawText(getVersion(), 470, 10)
        memDC.DrawText(getVersion(), 370, 10)
        #memDC.DrawText(_("loading..."), 10, 355)
        memDC.DrawText(_("loading..."), 10, 275)
        memDC.SelectObject(wx.NullBitmap)
        
        # TODO : replace wx.BORDER_SIMPLE (windows only)		
        wx.SplashScreen.__init__(self, bmp,
                                 wx.SPLASH_CENTRE_ON_SCREEN | wx.SPLASH_TIMEOUT,
                                 5000, None, -1, style=wx.BORDER_SIMPLE)
        self.Bind(wx.EVT_CLOSE, self.OnCloseSplash)
        self.fc = wx.FutureCall(2000, self.ShowMain)
        
    #----------------------------------------------------------------------
    def OnCloseSplash(self, evt):
        evt.Skip()
        self.Hide()
        if self.fc.IsRunning():
            self.fc.Stop()
            self.ShowMain()

    #----------------------------------------------------------------------
    def ShowMain(self):
        setGui(True)
        frame = Pinguino(None)
        app.SetTopWindow(frame)
        frame.__initPinguino__(None)
        frame.Show()
        if self.fc.IsRunning(): self.Raise()
        
        

########################################################################
class MyApp(wx.App):
    def __init__(self):
        wx.App.__init__(self, redirect=True, filename="pinguinoPanic")
        
    def OnInit(self):
        if sys.platform=='darwin':
            setGui(True)
            frame = Pinguino(None)
            frame.__initPinguino__(None)
            app.SetTopWindow(frame)
            frame.Show()
        else:			
            splash = MySplashScreen()
            splash.Show()
        return True


def show_error():
    message = ''.join(traceback.format_exception(*sys.exc_info()))
    dialog = wx.MessageDialog(None, message, 'Error!', wx.OK|wx.ICON_ERROR)
    dialog.ShowModal()
    

#----------------------------------------------------------------------
def main():
    try:
        app = MyApp()
        app.MainLoop()
    except:
        show_error()



# ------------------------------------------------------------------------------
# MAIN
# ------------------------------------------------------------------------------

if __name__ == "__main__":
    app = wx.PySimpleApp(0)

# ------------------------------------------------------------------------------
# ---Command Line---------------------------------------------------------------
# ------------------------------------------------------------------------------

    options = getOptions()
    

    if options.version == True:
        print "current version is " + getVersion() #pinguino_version
        sys.exit(1)

    if options.author == True:
        print "jean-pierre mandon"
        print "regis blanchot"
        print "yeison cardona"
        sys.exit(1)

    if options.board != False or type(options.board) == type(1):  # False = 0
        curBoard = boardlist[options.board]
        
        boots = {"noboot": 0, "boot2": 0x2000, "boot4": 0x0C00}
        
        if options.bootloader: bootloader = options.bootloader[0]
        else: bootloader = "boot2"  #Por defecto

        curBoard.bldr = bootloader
        curBoard.memstart = boots[bootloader] 
            
        print "Board: " + curBoard.name
        print "Proc.: " + curBoard.proc

        if options.filename == False:
            print "missing filename"
            sys.exit(1)
        filename = options.filename[0]
        fname, extension = os.path.splitext(filename)
        if extension != ".pde":
            print "bad file extension, it should be .pde"
            sys.exit(1)

        print "File : " + filename

        setGui(False)
        pobject=Pinguino(None)
        
        #Initialize vars
        pobject.rw = []
        pobject.regobject = []
        pobject.reservedword = []
        pobject.libinstructions = []
        
        pobject.setOSvariables()
        pobject.readlib(curBoard)
        
        print "preprocessing ..."
        retour=pobject.preprocess(fname, curBoard)
        if retour == "error":
            print "error while preprocessing " + filename
            sys.exit(1)

        print "compiling ..."
        retour = pobject.compile(fname, curBoard)
        if retour != 0:
            print "error while compiling file " + filename
            sys.exit(1)

        print "linking ..."
        retour=pobject.link(filename, curBoard)

        if curBoard.arch == 8:
            MAIN_FILE="main.hex"
        else:
            MAIN_FILE="main32.hex"

        if os.path.exists(os.path.join(SOURCE_DIR, MAIN_FILE))!=True:
            print "error while linking "
            sys.exit(1)

        shutil.copy(os.path.join(SOURCE_DIR, MAIN_FILE), fname + ".hex")
        print "compilation done"
        print pobject.getCodeSize(fname, curBoard)
        
        if options.upload != False:
            print "Uploading..."
            #Very ugly method to upload code
            #------------------------------------------
            pobject.curBoard = curBoard
            pobject.displaymsg = lambda *x: sys.stdout.write(x[0])
            pobject.OnUpload(path=filename)
            #------------------------------------------
        
        print "OK"
        os.remove(os.path.join(SOURCE_DIR, MAIN_FILE))
        #os.remove(fname + ".c")
        
        sys.exit(0)

# ------------------------------------------------------------------------------
# ---Graphic User Interface-----------------------------------------------------
# ------------------------------------------------------------------------------

    main()
