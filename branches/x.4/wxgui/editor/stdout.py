#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Stdout file view.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	26/July/2012
    last release:	26/July/2012

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
import os, codecs
from wxgui._trad import _

STDOUT_FILE = os.path.join(os.getcwd(), 'source', "stdout")

class Stdout():

    #----------------------------------------------------------------------
    def __initStdout__(self, parent):
        self.IDE = parent
        self.loadStdout()
        self.m_sdbSizer1OK.SetDefault()
        self.SetTitle("stdout: %s" %STDOUT_FILE)
        
        self.Bind(wx.EVT_BUTTON, lambda x:self.Close(), self.m_sdbSizer1OK)
        
    
    #----------------------------------------------------------------------
    def loadStdout(self):
        try:
            file = codecs.open(STDOUT_FILE, "r", "utf8")
            lines = "\n".join(file.readlines())
            file.close()
        except:
            lines = _("No utf8 file!\n%s") % STDOUT_FILE
        if lines == "": lines = _("Empty file...")
        self.m_richText2.AppendText(lines)
        