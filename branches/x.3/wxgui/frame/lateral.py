# -*- coding: utf-8 -*- 

###########################################################################
## Python code generated with wxFormBuilder (version Sep  8 2010)
## http://www.wxformbuilder.org/
##
## PLEASE DO "NOT" EDIT THIS FILE!
###########################################################################

import wx

###########################################################################
## Class Lateral
###########################################################################

class Lateral ( wx.Panel ):
	
	def __init__( self, parent ):
		wx.Panel.__init__ ( self, parent, id = wx.ID_ANY, pos = wx.DefaultPosition, size = wx.Size( 456,477 ), style = wx.TAB_TRAVERSAL )
		
		bSizer3 = wx.BoxSizer( wx.VERTICAL )
		
		self.notebookLateral = wx.Notebook( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, 0 )
		self.documents = wx.Panel( self.notebookLateral, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer4 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_splitter3 = wx.SplitterWindow( self.documents, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter3.Bind( wx.EVT_IDLE, self.m_splitter3OnIdle )
		
		self.m_panel5 = wx.Panel( self.m_splitter3, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer5 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_staticText1 = wx.StaticText( self.m_panel5, wx.ID_ANY, u"Directories", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText1.Wrap( -1 )
		self.m_staticText1.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		bSizer5.Add( self.m_staticText1, 0, wx.EXPAND, 5 )
		
		comboBoxDirChoices = []
		self.comboBoxDir = wx.ComboBox( self.m_panel5, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, comboBoxDirChoices, 0 )
		bSizer5.Add( self.comboBoxDir, 0, wx.EXPAND, 5 )
		
		self.listCtrlDir = wx.ListCtrl( self.m_panel5, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_ICON|wx.LC_NO_HEADER|wx.LC_REPORT )
		bSizer5.Add( self.listCtrlDir, 1, wx.EXPAND, 5 )
		
		self.m_panel5.SetSizer( bSizer5 )
		self.m_panel5.Layout()
		bSizer5.Fit( self.m_panel5 )
		self.m_panel6 = wx.Panel( self.m_splitter3, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer6 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_staticText2 = wx.StaticText( self.m_panel6, wx.ID_ANY, u"Files", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText2.Wrap( -1 )
		self.m_staticText2.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		bSizer6.Add( self.m_staticText2, 0, wx.EXPAND, 5 )
		
		self.listCtrlFiles = wx.ListCtrl( self.m_panel6, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_ICON|wx.LC_NO_HEADER|wx.LC_REPORT )
		bSizer6.Add( self.listCtrlFiles, 1, wx.EXPAND, 5 )
		
		choiceFileChoices = [ u"*.*", u"*.pde" ]
		self.choiceFile = wx.Choice( self.m_panel6, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, choiceFileChoices, 0 )
		self.choiceFile.SetSelection( 1 )
		bSizer6.Add( self.choiceFile, 0, wx.EXPAND, 5 )
		
		self.m_panel6.SetSizer( bSizer6 )
		self.m_panel6.Layout()
		bSizer6.Fit( self.m_panel6 )
		self.m_splitter3.SplitHorizontally( self.m_panel5, self.m_panel6, 0 )
		bSizer4.Add( self.m_splitter3, 1, wx.EXPAND, 5 )
		
		self.documents.SetSizer( bSizer4 )
		self.documents.Layout()
		bSizer4.Fit( self.documents )
		self.notebookLateral.AddPage( self.documents, u"Documents", True )
		self.file = wx.Panel( self.notebookLateral, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer7 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_splitter4 = wx.SplitterWindow( self.file, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter4.Bind( wx.EVT_IDLE, self.m_splitter4OnIdle )
		
		self.m_panel8 = wx.Panel( self.m_splitter4, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer8 = wx.BoxSizer( wx.VERTICAL )
		
		self.treeCtrlFunctions = wx.TreeCtrl( self.m_panel8, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TR_DEFAULT_STYLE )
		bSizer8.Add( self.treeCtrlFunctions, 1, wx.EXPAND, 5 )
		
		self.m_panel8.SetSizer( bSizer8 )
		self.m_panel8.Layout()
		bSizer8.Fit( self.m_panel8 )
		self.m_panel9 = wx.Panel( self.m_splitter4, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer9 = wx.BoxSizer( wx.VERTICAL )
		
		self.listCtrlVars = wx.ListCtrl( self.m_panel9, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_ICON|wx.LC_REPORT )
		bSizer9.Add( self.listCtrlVars, 1, wx.EXPAND, 5 )
		
		self.m_panel9.SetSizer( bSizer9 )
		self.m_panel9.Layout()
		bSizer9.Fit( self.m_panel9 )
		self.m_splitter4.SplitHorizontally( self.m_panel8, self.m_panel9, 229 )
		bSizer7.Add( self.m_splitter4, 1, wx.EXPAND, 5 )
		
		self.file.SetSizer( bSizer7 )
		self.file.Layout()
		bSizer7.Fit( self.file )
		self.notebookLateral.AddPage( self.file, u"File", False )
		self.search = wx.Panel( self.notebookLateral, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer1 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer1.AddGrowableCol( 1 )
		fgSizer1.SetFlexibleDirection( wx.BOTH )
		fgSizer1.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_staticText3 = wx.StaticText( self.search, wx.ID_ANY, u"Search:", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText3.Wrap( -1 )
		self.m_staticText3.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		fgSizer1.Add( self.m_staticText3, 0, wx.ALIGN_RIGHT|wx.ALL, 5 )
		
		self.searchCtrlSearch = wx.SearchCtrl( self.search, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, 0 )
		self.searchCtrlSearch.ShowSearchButton( True )
		self.searchCtrlSearch.ShowCancelButton( False )
		fgSizer1.Add( self.searchCtrlSearch, 0, wx.EXPAND|wx.ALL, 5 )
		
		self.m_staticText4 = wx.StaticText( self.search, wx.ID_ANY, u"Replace:", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText4.Wrap( -1 )
		self.m_staticText4.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		fgSizer1.Add( self.m_staticText4, 0, wx.ALL|wx.ALIGN_RIGHT, 5 )
		
		self.searchCtrlReplace = wx.SearchCtrl( self.search, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, 0 )
		self.searchCtrlReplace.ShowSearchButton( False )
		self.searchCtrlReplace.ShowCancelButton( False )
		fgSizer1.Add( self.searchCtrlReplace, 0, wx.EXPAND|wx.ALL, 5 )
		
		
		fgSizer1.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		bSizer11 = wx.BoxSizer( wx.HORIZONTAL )
		
		self.buttonPrev = wx.Button( self.search, wx.ID_ANY, u"Previous", wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer11.Add( self.buttonPrev, 0, wx.ALL, 5 )
		
		self.buttonNext = wx.Button( self.search, wx.ID_ANY, u"Next", wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer11.Add( self.buttonNext, 0, wx.ALL, 5 )
		
		fgSizer1.Add( bSizer11, 1, wx.EXPAND, 5 )
		
		
		fgSizer1.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.panelReplace = wx.Panel( self.search, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer111 = wx.BoxSizer( wx.HORIZONTAL )
		
		self.buttonReplace = wx.Button( self.panelReplace, wx.ID_ANY, u"Replace", wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer111.Add( self.buttonReplace, 0, wx.ALL, 5 )
		
		self.buttonReplaceAll = wx.Button( self.panelReplace, wx.ID_ANY, u"Replace all", wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer111.Add( self.buttonReplaceAll, 0, wx.ALL, 5 )
		
		self.panelReplace.SetSizer( bSizer111 )
		self.panelReplace.Layout()
		bSizer111.Fit( self.panelReplace )
		fgSizer1.Add( self.panelReplace, 1, wx.EXPAND, 5 )
		
		
		fgSizer1.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_staticline3 = wx.StaticLine( self.search, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LI_HORIZONTAL )
		fgSizer1.Add( self.m_staticline3, 0, wx.EXPAND |wx.ALL, 5 )
		
		
		fgSizer1.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.searchReplaceInfo = wx.StaticText( self.search, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, 0 )
		self.searchReplaceInfo.Wrap( -1 )
		fgSizer1.Add( self.searchReplaceInfo, 0, wx.EXPAND|wx.ALL, 5 )
		
		self.search.SetSizer( fgSizer1 )
		self.search.Layout()
		fgSizer1.Fit( self.search )
		self.notebookLateral.AddPage( self.search, u"Search", False )
		
		bSizer3.Add( self.notebookLateral, 1, wx.EXPAND, 5 )
		
		self.SetSizer( bSizer3 )
		self.Layout()
	
	def __del__( self ):
		pass
	
	def m_splitter3OnIdle( self, event ):
		self.m_splitter3.SetSashPosition( 0 )
		self.m_splitter3.Unbind( wx.EVT_IDLE )
	
	def m_splitter4OnIdle( self, event ):
		self.m_splitter4.SetSashPosition( 229 )
		self.m_splitter4.Unbind( wx.EVT_IDLE )
	


