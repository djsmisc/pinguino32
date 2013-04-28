#!/usr/bin/env python
#-*- coding: utf-8 -*-


"""-------------------------------------------------------------------------
    read config file

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

import os
import wx
from ConfigParser import RawConfigParser
from constants import APP_CONFIG

########################################################################
class ReadConfig:
    """"""
    #----------------------------------------------------------------------
    def getConfig(self, section, option):
        value = self.configIDE.get(section,option)
        try:
            if value.isdigit(): return int(value)
            elif value.isalpha(): return value
            else: return value
        except:
            return value
        
    #----------------------------------------------------------------------
    def getColorConfig(self, section, option, default=[0, 0, 0, 0]):
        self.loadConfigFile()
        try:
            value = self.configIDE.get(section,option)
            value = value[1:-1].split(",")
            value = map(lambda x:int(x), value)
            color = wx.Color()
            color.Set(*value)
            return color
        except:
            color = wx.Color()
            color.Set(*default)
            self.setConfig(section, option, default)
            return color
        

    #----------------------------------------------------------------------
    def loadConfigFile(self):
        if not os.path.isfile(APP_CONFIG):
            file = open(APP_CONFIG, mode="w")
            #file = codecs.open(APP_CONFIG, "w",encoding="utf-8")
            file.close()
        config_file=open(APP_CONFIG,"r")
        #config_file=codecs.open(APP_CONFIG,"r",encoding="utf-8")
        self.configIDE=RawConfigParser()
        self.configIDE.readfp(config_file) 
        config_file.close()
        
    #----------------------------------------------------------------------
    def setConfig(self,section,opcion,valor):
        if not section in self.configIDE.sections():
            self.configIDE.add_section(section)
        self.configIDE.set(section,opcion,valor)

    #----------------------------------------------------------------------
    def saveConfig(self):
        config_file=open(APP_CONFIG,"w")
        self.configIDE.write(config_file)
        config_file.close()
        
    #---------------------------------------------------------------------- 
    def getElse(self, section, option, default):
        try: default = self.getConfig(section, option)
        except: self.setConfig(section, option, default)
        if default in ["True", "False"]: return eval(default)
        return default
    
    #----------------------------------------------------------------------
    def loadConfigIDE(self):
        self.loadConfigFile()
        arch = self.getElse("Board", "architecture", 8)
        mode = self.getElse("Board", "mode", "BOOT")
        device = self.getElse("Board", "device", "Pinguino 2550")
        bootloader = self.getElse("Board", "bootloader", "[boot2, 0x2000]")
        if bootloader != "noboot":
            bootloader = bootloader[1:-1].split(",")
            bootloader[0] = bootloader[0].replace("'", "")
            bootloader[1] = eval(bootloader[1])
        self.setBoard(arch, mode, device, bootloader)
        
        w = self.getElse("IDE", "window/width", 1000)
        h = self.getElse("IDE", "window/height", 500)
        self.SetSize((w, h))        
        
        # TODO fix the bug on windows for negative frame position 	    
        try:
            x = self.getElse("IDE", "Window/Xpos", 100)
            y = self.getElse("IDE", "Window/Ypos", 100)
            self.SetPosition((x, y))
        except:
            self.setConfig("IDE", "Window/Xpos", 0)
            self.setConfig("IDE", "Window/Ypos", 0)
            self.SetPosition((0, 0))

        maxim = self.getElse("IDE", "maximized", "False")
        if maxim: self.Maximize()

        self.theme = self.getElse("IDE", "theme", "PinguinoX")   

        try:
            for i in range(self.getConfig("Recents", "Recents_count")):
                file = self.getConfig("Recents", "Recents_%d"%i)
                if os.path.isfile(file):
                    self.addFile2Recent(file)
        except: pass

    
    #----------------------------------------------------------------------
    def setEditorFont(self):
        self.loadConfigFile()
        if self.getElse("Source", "userfontinoutput", "False") == "True":
            if self.getConfig("Source", "fontdefault") == "False":
                FaceNAme = self.getConfig("Source", "font")
                PointSize = self.getConfig("Source", "size")
                font = wx.Font(10, wx.TELETYPE, wx.NORMAL, wx.NORMAL, True)
                font.SetFaceName(FaceNAme)
                font.SetPointSize(PointSize)
                font.SetUnderlined(False)
                self.logwindow.SetFont(font)
            else:
                font = wx.Font(10, wx.TELETYPE, wx.NORMAL, wx.NORMAL, True)
                font.SetUnderlined(False)
                self.logwindow.SetFont(font) 
        else:
            font = wx.Font(10, wx.TELETYPE, wx.NORMAL, wx.NORMAL, True)
            font.SetUnderlined(False)
            self.logwindow.SetFont(font)         
    
    
    