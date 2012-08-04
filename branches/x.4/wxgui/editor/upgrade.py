#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    GUI upgrade.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	01/August/2012
    last release:	01/August/2012

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

import threading, os
import wx
from wxgui._trad import _
from wxgui.version import SubversionRepository

SVN_DIR = "https://pinguino32.googlecode.com/svn/branches/x.4"
HOME_DIR    = os.getcwd()

EVT_RESULT_LAST_REVISION_ID = wx.NewId()

def EVT_RESULT_LAST_REVISION(win, func):
    win.Connect(-1, -1, EVT_RESULT_LAST_REVISION_ID, func)

class ResultEventLastRevision(wx.PyEvent):
    def __init__(self, data):
        wx.PyEvent.__init__(self)
        self.SetEventType(EVT_RESULT_LAST_REVISION_ID)
        self.data = data

########################################################################
class Upgrade:
    """"""

    #----------------------------------------------------------------------
    def __initUpgrade__(self, parent):
        self.IDE = parent
        
        self.Bind(wx.EVT_BUTTON, self.Cancel, self.buttonCancel)
        self.Bind(wx.EVT_BUTTON, self.upgradeIDE, self.buttonUpgrade)
        self.Bind(wx.EVT_BUTTON, lambda x:self.Close(), self.buttonAccept)
        
        self.SetSizeWH(self.GetSize()[0], 150)
        
        self.m_gauge2.Pulse()
        self.Bind(wx.EVT_TIMER, self.TimerHandler)
        self.timer = wx.Timer(self)
        self.timer.Start(100)
        
        
        #EVT_RESULT_LAST_REVISION(self, self.gg)
        #threadRevision = threading.Thread(target=self.CheckRevisionThread, args=( ))
        #threadRevision.start()
        

    #----------------------------------------------------------------------
    def checkUpgrade(self):
        threadRevision = threading.Thread(target=self.CheckRevisionThread, args=( ))
        threadRevision.start()

    #----------------------------------------------------------------------
    def Cancel(self, event=None):
        self.timer.Stop()
        self.Close()
        
    #----------------------------------------------------------------------
    def TimerHandler(self, event):
        self.m_gauge2.Pulse()
        
    #----------------------------------------------------------------------
    def getRepositoryRevision(self):
        self.sr = SubversionRepository(SVN_DIR)
        try:  self.sr = SubversionRepository(SVN_DIR)
        except:
            self.textCtrlUpgrade.AppendText(_("Server temporarily unavailable.")+"\n")
            return False
        return self.sr.current_version()
    
    #----------------------------------------------------------------------
    def prepareUpgrade(self, svn):
        self.svnRev = self.IDE.lastRevision
        self.sr = svn
        self.textCtrlUpgrade.AppendText(_("Update for Pinguino IDE")+"!!\n")
        self.textCtrlUpgrade.AppendText(_("Revision") +" "+ self.svnRev +" "+ _("is available.")+"\n")
        self.textCtrlUpgrade.AppendText(_("Warning: this can be an unstable version.")+"\n")
        self.buttonAccept.Enable(True)
        self.buttonUpgrade.Enable(True)
        self.timer.Stop()
        self.buttonCancel.Enable(False)
        self.m_gauge2.SetValue(0)
        self.m_gauge2.Hide()
        self.Layout()
        self.SetFocus()
        
    
    #----------------------------------------------------------------------
    def CheckRevisionThread(self):
        self.textCtrlUpgrade.AppendText(_("Checking repository revision number")+" ...\n")
        rev = self.getRepositoryRevision()
        if rev == False: return
        try:
            self.svnRev = rev
            if self.svnRev == self.IDE.localRev:
                self.buttonAccept.Enable(True)
                self.buttonAccept.SetDefault()                
                self.textCtrlUpgrade.AppendText(_("You have the latest version.")+"\n")
            else:
                self.buttonAccept.Enable(True)
                self.buttonUpgrade.Enable(True)
                self.textCtrlUpgrade.AppendText(_("Revision") +" "+ self.svnRev +" "+ _("is available.")+"\n")
                self.textCtrlUpgrade.AppendText(_("Warning: this can be an unstable version.")+"\n")
            self.timer.Stop()
            self.buttonCancel.Enable(False)
            self.m_gauge2.SetValue(0)
            self.m_gauge2.Hide()
            self.Layout()
        except:  #aborted
            pass
        
    #----------------------------------------------------------------------
    def upgradeIDE(self, event):
        self.timer.Start()
        threadUpgrade = threading.Thread(target=self.upgradeIDEThread, args=())
        threadUpgrade.start()
        
    #----------------------------------------------------------------------
    def upgradeIDEThread(self):
        self.m_gauge2.Show()
        self.Layout()
        self.textCtrlUpgrade.Clear()
        self.textCtrlUpgrade.AppendText(_("Upgrading ...")+"\n")
        self.sr.checkout(HOME_DIR)
        try:  self.sr.checkout(HOME_DIR)
        except:
            self.textCtrlUpgrade.AppendText(_("Local version is not under revision control.")+"\n")
            return
        self.textCtrlUpgrade.AppendText(_("Done")+"\n")
        self.textCtrlUpgrade.AppendText(_("You now have the rev. %s" %self.svnRev)+"\n")
        self.textCtrlUpgrade.AppendText(_("Pinguino IDE requires a restart to load changes.")+"\n")
        self.buttonAccept.Enable(True)
        self.buttonAccept.SetDefault()
        self.buttonUpgrade.Enable(False)
        self.timer.Stop()
        self.m_gauge2.SetValue(0)
        self.m_gauge2.Hide()
        self.Layout()