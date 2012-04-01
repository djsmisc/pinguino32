# -*- coding: utf-8 -*- 

###########################################################################
## Python code generated with wxFormBuilder (version Sep  8 2010)
## http://www.wxformbuilder.org/
##
## PLEASE DO "NOT" EDIT THIS FILE!
###########################################################################

import wx

###########################################################################
## Class framePinguinoX
###########################################################################

class framePinguinoX ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = u"Pinguino IDE x.3", pos = wx.DefaultPosition, size = wx.Size( 711,306 ), style = wx.DEFAULT_FRAME_STYLE|wx.TAB_TRAVERSAL, name = u"Pinguino IDE x.3" )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer1 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_panel1 = wx.Panel( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		self.m_panel1.SetBackgroundColour( wx.Colour( 175, 200, 225 ) )
		
		bSizer2 = wx.BoxSizer( wx.VERTICAL )
		
		self.notebookEditor = wx.Notebook( self.m_panel1, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, 0 )
		
		bSizer2.Add( self.notebookEditor, 1, wx.EXPAND, 5 )
		
		self.m_panel1.SetSizer( bSizer2 )
		self.m_panel1.Layout()
		bSizer2.Fit( self.m_panel1 )
		bSizer1.Add( self.m_panel1, 1, wx.EXPAND, 5 )
		
		self.SetSizer( bSizer1 )
		self.Layout()
		self.statusBarEditor = self.CreateStatusBar( 4, wx.ST_SIZEGRIP, wx.ID_ANY )
		
		self.Centre( wx.BOTH )
	
	def __del__( self ):
		pass
	

