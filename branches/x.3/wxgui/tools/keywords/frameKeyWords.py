# -*- coding: utf-8 -*- 

###########################################################################
## Python code generated with wxFormBuilder (version Sep  8 2010)
## http://www.wxformbuilder.org/
##
## PLEASE DO "NOT" EDIT THIS FILE!
###########################################################################

import wx
import wx.richtext

###########################################################################
## Class frameKeyWords
###########################################################################

class frameKeyWords ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = u"Pinguino Functions", pos = wx.DefaultPosition, size = wx.Size( 808,424 ), style = wx.DEFAULT_FRAME_STYLE|wx.TAB_TRAVERSAL, name = u"Pinguino Functions" )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer12 = wx.BoxSizer( wx.HORIZONTAL )
		
		self.m_splitter6 = wx.SplitterWindow( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter6.Bind( wx.EVT_IDLE, self.m_splitter6OnIdle )
		
		self.m_panel14 = wx.Panel( self.m_splitter6, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer16 = wx.BoxSizer( wx.VERTICAL )
		
		checkListKeywordsChoices = [ u" " ];
		self.checkListKeywords = wx.CheckListBox( self.m_panel14, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, checkListKeywordsChoices, 0 )
		bSizer16.Add( self.checkListKeywords, 1, wx.ALL|wx.EXPAND, 5 )
		
		self.m_panel14.SetSizer( bSizer16 )
		self.m_panel14.Layout()
		bSizer16.Fit( self.m_panel14 )
		self.m_panel15 = wx.Panel( self.m_splitter6, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer15 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_splitter8 = wx.SplitterWindow( self.m_panel15, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter8.Bind( wx.EVT_IDLE, self.m_splitter8OnIdle )
		
		self.m_panel16 = wx.Panel( self.m_splitter8, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer17 = wx.BoxSizer( wx.VERTICAL )
		
		listBoxKeywordsChoices = []
		self.listBoxKeywords = wx.ListBox( self.m_panel16, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, listBoxKeywordsChoices, 0 )
		bSizer17.Add( self.listBoxKeywords, 1, wx.ALL|wx.EXPAND, 5 )
		
		self.m_panel16.SetSizer( bSizer17 )
		self.m_panel16.Layout()
		bSizer17.Fit( self.m_panel16 )
		self.m_panel17 = wx.Panel( self.m_splitter8, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer18 = wx.BoxSizer( wx.VERTICAL )
		
		self.richTextKeywords = wx.richtext.RichTextCtrl( self.m_panel17, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.TE_READONLY|wx.ALWAYS_SHOW_SB|wx.HSCROLL|wx.VSCROLL|wx.WANTS_CHARS )
		bSizer18.Add( self.richTextKeywords, 1, wx.EXPAND |wx.ALL, 5 )
		
		self.m_panel17.SetSizer( bSizer18 )
		self.m_panel17.Layout()
		bSizer18.Fit( self.m_panel17 )
		self.m_splitter8.SplitVertically( self.m_panel16, self.m_panel17, 194 )
		bSizer15.Add( self.m_splitter8, 1, wx.EXPAND, 5 )
		
		self.m_panel15.SetSizer( bSizer15 )
		self.m_panel15.Layout()
		bSizer15.Fit( self.m_panel15 )
		self.m_splitter6.SplitVertically( self.m_panel14, self.m_panel15, 204 )
		bSizer12.Add( self.m_splitter6, 1, wx.EXPAND, 5 )
		
		self.SetSizer( bSizer12 )
		self.Layout()
		
		self.Centre( wx.BOTH )
	
	def __del__( self ):
		pass
	
	def m_splitter6OnIdle( self, event ):
		self.m_splitter6.SetSashPosition( 204 )
		self.m_splitter6.Unbind( wx.EVT_IDLE )
	
	def m_splitter8OnIdle( self, event ):
		self.m_splitter8.SetSashPosition( 194 )
		self.m_splitter8.Unbind( wx.EVT_IDLE )
	

