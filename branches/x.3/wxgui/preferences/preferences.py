#!/usr/bin/env python
#-*- coding: utf-8 -*-

import wx
from frame import Frame1

class Preferences(Frame1):
    #----------------------------------------------------------------------
    def __init__(self, parent):
        self._init_ctrls(parent)
        
        
        
        self.centrarFrame()
        
        
        
        
        
        
        
    #----------------------------------------------------------------------
    def centrarFrame(self):
        screen=wx.ScreenDC().Size
        size=self.Size
        self.SetPosition(((screen[0]-size[0])/2,(screen[1]-size[1])/2))            
        
        
        
        
        
        
