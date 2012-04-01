# -*- coding: utf-8 -*- 

###########################################################################
## Python code generated with wxFormBuilder (version Sep  8 2010)
## http://www.wxformbuilder.org/
##
## PLEASE DO "NOT" EDIT THIS FILE!
###########################################################################

import wx
import wx.aui

###########################################################################
## Class framePreferences
###########################################################################

class framePreferences ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = u"Preferences - These features are NOT programmed", pos = wx.DefaultPosition, size = wx.Size( 752,360 ), style = wx.DEFAULT_FRAME_STYLE|wx.TAB_TRAVERSAL )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer19 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_splitter9 = wx.SplitterWindow( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter9.Bind( wx.EVT_IDLE, self.m_splitter9OnIdle )
		
		self.m_panel24 = wx.Panel( self.m_splitter9, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer20 = wx.BoxSizer( wx.VERTICAL )
		
		listBoxPreferencesChoices = [ u"Appearance", u"Source Code Font/Size", u"Auto-completion", u"Auto-insert", u"Open/Save files", u"Highligh" ]
		self.listBoxPreferences = wx.ListBox( self.m_panel24, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, listBoxPreferencesChoices, 0 )
		bSizer20.Add( self.listBoxPreferences, 1, wx.ALL|wx.EXPAND, 5 )
		
		self.m_panel24.SetSizer( bSizer20 )
		self.m_panel24.Layout()
		bSizer20.Fit( self.m_panel24 )
		self.m_panel25 = wx.Panel( self.m_splitter9, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer21 = wx.BoxSizer( wx.VERTICAL )
		
		self.staticTextPage = wx.StaticText( self.m_panel25, wx.ID_ANY, u"Appearance", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.staticTextPage.Wrap( -1 )
		self.staticTextPage.SetFont( wx.Font( 12, 70, 90, 92, False, wx.EmptyString ) )
		
		bSizer21.Add( self.staticTextPage, 0, wx.TOP|wx.RIGHT|wx.LEFT, 5 )
		
		self.auinotebookPreferences = wx.aui.AuiNotebook( self.m_panel25, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, 0|wx.NO_BORDER )
		self.appearance = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer3 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer3.AddGrowableCol( 1 )
		fgSizer3.AddGrowableRow( 1 )
		fgSizer3.SetFlexibleDirection( wx.BOTH )
		fgSizer3.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_staticText6 = wx.StaticText( self.appearance, wx.ID_ANY, u"Theme", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText6.Wrap( -1 )
		fgSizer3.Add( self.m_staticText6, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		choiceThemeChoices = []
		self.choiceTheme = wx.Choice( self.appearance, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, choiceThemeChoices, 0 )
		self.choiceTheme.SetSelection( 0 )
		fgSizer3.Add( self.choiceTheme, 0, wx.ALL|wx.EXPAND, 5 )
		
		
		fgSizer3.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.appearance.SetSizer( fgSizer3 )
		self.appearance.Layout()
		fgSizer3.Fit( self.appearance )
		self.auinotebookPreferences.AddPage( self.appearance, u"appearance", False, wx.NullBitmap )
		self.souce_code_font_size = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer4 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer4.AddGrowableCol( 1 )
		fgSizer4.AddGrowableRow( 2 )
		fgSizer4.AddGrowableRow( 4 )
		fgSizer4.SetFlexibleDirection( wx.BOTH )
		fgSizer4.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.radioBtnSourcedefault = wx.RadioButton( self.souce_code_font_size, wx.ID_ANY, u"Use default", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.radioBtnSourcedefault, 0, wx.ALL, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.radioBtnSourceselected = wx.RadioButton( self.souce_code_font_size, wx.ID_ANY, u"Use selected", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.radioBtnSourceselected, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.fontPickerSource = wx.FontPickerCtrl( self.souce_code_font_size, wx.ID_ANY, wx.Font( 12, 70, 90, 90, False, "Ubuntu Mono" ), wx.DefaultPosition, wx.DefaultSize, wx.FNTP_DEFAULT_STYLE )
		self.fontPickerSource.SetMaxPointSize( 100 ) 
		fgSizer4.Add( self.fontPickerSource, 0, wx.ALL|wx.EXPAND, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_staticText8 = wx.StaticText( self.souce_code_font_size, wx.ID_ANY, u"Tab size", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText8.Wrap( -1 )
		fgSizer4.Add( self.m_staticText8, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.spinCtrlSource = wx.SpinCtrl( self.souce_code_font_size, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.SP_ARROW_KEYS, 0, 10, 4 )
		fgSizer4.Add( self.spinCtrlSource, 0, wx.ALL|wx.EXPAND, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.souce_code_font_size.SetSizer( fgSizer4 )
		self.souce_code_font_size.Layout()
		fgSizer4.Fit( self.souce_code_font_size )
		self.auinotebookPreferences.AddPage( self.souce_code_font_size, u"souce_code_font_size", False, wx.NullBitmap )
		self.auto_completion = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer5 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer5.AddGrowableCol( 1 )
		fgSizer5.SetFlexibleDirection( wx.BOTH )
		fgSizer5.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_staticText19 = wx.StaticText( self.auto_completion, wx.ID_ANY, u"Source completion", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText19.Wrap( -1 )
		self.m_staticText19.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		fgSizer5.Add( self.m_staticText19, 0, wx.ALL, 5 )
		
		
		fgSizer5.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_radioBtn3 = wx.RadioButton( self.auto_completion, wx.ID_ANY, u"After characters", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer5.Add( self.m_radioBtn3, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.m_spinCtrl2 = wx.SpinCtrl( self.auto_completion, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.SP_ARROW_KEYS, 0, 10, 2 )
		fgSizer5.Add( self.m_spinCtrl2, 0, wx.ALL|wx.EXPAND|wx.LEFT, 5 )
		
		self.m_radioBtn4 = wx.RadioButton( self.auto_completion, wx.ID_ANY, u"No show auto-completer", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer5.Add( self.m_radioBtn4, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		
		fgSizer5.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_staticText12 = wx.StaticText( self.auto_completion, wx.ID_ANY, u"Items count", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText12.Wrap( -1 )
		fgSizer5.Add( self.m_staticText12, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.m_spinCtrl3 = wx.SpinCtrl( self.auto_completion, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.SP_ARROW_KEYS, 5, 30, 15 )
		fgSizer5.Add( self.m_spinCtrl3, 0, wx.ALL|wx.EXPAND, 5 )
		
		self.m_checkBox11 = wx.CheckBox( self.auto_completion, wx.ID_ANY, u"Insert \"()\" in the functions.", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_checkBox11.SetValue(True) 
		fgSizer5.Add( self.m_checkBox11, 0, wx.ALL, 5 )
		
		self.auto_completion.SetSizer( fgSizer5 )
		self.auto_completion.Layout()
		fgSizer5.Fit( self.auto_completion )
		self.auinotebookPreferences.AddPage( self.auto_completion, u"autocompletion", True, wx.NullBitmap )
		self.auto_insert = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer6 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer6.AddGrowableCol( 1 )
		fgSizer6.SetFlexibleDirection( wx.BOTH )
		fgSizer6.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_staticText15 = wx.StaticText( self.auto_insert, wx.ID_ANY, u"Auto-close", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText15.Wrap( -1 )
		self.m_staticText15.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		fgSizer6.Add( self.m_staticText15, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.m_checkBox6 = wx.CheckBox( self.auto_insert, wx.ID_ANY, u"Brackets: []", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.m_checkBox6, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		
		fgSizer6.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_checkBox7 = wx.CheckBox( self.auto_insert, wx.ID_ANY, u"Double quotes: \"\"", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.m_checkBox7, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		
		fgSizer6.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_checkBox8 = wx.CheckBox( self.auto_insert, wx.ID_ANY, u"Keys: {}", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.m_checkBox8, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		
		fgSizer6.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_checkBox9 = wx.CheckBox( self.auto_insert, wx.ID_ANY, u"Parentheses: ()", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.m_checkBox9, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		
		fgSizer6.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_checkBox10 = wx.CheckBox( self.auto_insert, wx.ID_ANY, u"Single quotes: ''", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.m_checkBox10, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		self.auto_insert.SetSizer( fgSizer6 )
		self.auto_insert.Layout()
		fgSizer6.Fit( self.auto_insert )
		self.auinotebookPreferences.AddPage( self.auto_insert, u"auto_insert", False, wx.NullBitmap )
		self.open_save_files = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		gSizer1 = wx.GridSizer( 2, 2, 0, 0 )
		
		sbSizer5 = wx.StaticBoxSizer( wx.StaticBox( self.open_save_files, wx.ID_ANY, u"New file" ), wx.VERTICAL )
		
		self.m_panel36 = wx.Panel( self.open_save_files, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer28 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_radioBtn9 = wx.RadioButton( self.m_panel36, wx.ID_ANY, u"With template", wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer28.Add( self.m_radioBtn9, 0, wx.ALL, 5 )
		
		self.m_radioBtn10 = wx.RadioButton( self.m_panel36, wx.ID_ANY, u"Empty", wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer28.Add( self.m_radioBtn10, 0, wx.ALL, 5 )
		
		self.m_panel36.SetSizer( bSizer28 )
		self.m_panel36.Layout()
		bSizer28.Fit( self.m_panel36 )
		sbSizer5.Add( self.m_panel36, 1, wx.EXPAND, 5 )
		
		gSizer1.Add( sbSizer5, 1, wx.EXPAND|wx.ALL, 5 )
		
		sbSizer6 = wx.StaticBoxSizer( wx.StaticBox( self.open_save_files, wx.ID_ANY, u"Auto-save" ), wx.VERTICAL )
		
		self.m_panel37 = wx.Panel( self.open_save_files, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer8 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer8.SetFlexibleDirection( wx.BOTH )
		fgSizer8.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_radioBtn15 = wx.RadioButton( self.m_panel37, wx.ID_ANY, u"Each (sec)", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer8.Add( self.m_radioBtn15, 0, wx.ALL, 5 )
		
		self.m_spinCtrl5 = wx.SpinCtrl( self.m_panel37, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.SP_ARROW_KEYS, 10, 500, 10 )
		fgSizer8.Add( self.m_spinCtrl5, 0, wx.ALL, 5 )
		
		self.m_radioBtn16 = wx.RadioButton( self.m_panel37, wx.ID_ANY, u"Never", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer8.Add( self.m_radioBtn16, 0, wx.ALL, 5 )
		
		self.m_panel37.SetSizer( fgSizer8 )
		self.m_panel37.Layout()
		fgSizer8.Fit( self.m_panel37 )
		sbSizer6.Add( self.m_panel37, 1, wx.EXPAND, 5 )
		
		gSizer1.Add( sbSizer6, 1, wx.EXPAND|wx.ALL, 5 )
		
		sbSizer8 = wx.StaticBoxSizer( wx.StaticBox( self.open_save_files, wx.ID_ANY, u"Open last files" ), wx.VERTICAL )
		
		self.m_panel38 = wx.Panel( self.open_save_files, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer30 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_radioBtn13 = wx.RadioButton( self.m_panel38, wx.ID_ANY, u"All exist files", wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer30.Add( self.m_radioBtn13, 0, wx.ALL, 5 )
		
		self.m_radioBtn14 = wx.RadioButton( self.m_panel38, wx.ID_ANY, u"Never", wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer30.Add( self.m_radioBtn14, 0, wx.ALL, 5 )
		
		self.m_panel38.SetSizer( bSizer30 )
		self.m_panel38.Layout()
		bSizer30.Fit( self.m_panel38 )
		sbSizer8.Add( self.m_panel38, 1, wx.EXPAND, 5 )
		
		gSizer1.Add( sbSizer8, 1, wx.EXPAND|wx.ALL, 5 )
		
		self.open_save_files.SetSizer( gSizer1 )
		self.open_save_files.Layout()
		gSizer1.Fit( self.open_save_files )
		self.auinotebookPreferences.AddPage( self.open_save_files, u"open_save_files", False, wx.NullBitmap )
		self.highligh = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer7 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer7.AddGrowableCol( 0 )
		fgSizer7.SetFlexibleDirection( wx.BOTH )
		fgSizer7.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_textCtrl2 = wx.TextCtrl( self.highligh, wx.ID_ANY, u"Search and Replace", wx.DefaultPosition, wx.Size( -1,-1 ), 0 )
		self.m_textCtrl2.SetBackgroundColour( wx.Colour( 251, 251, 104 ) )
		
		fgSizer7.Add( self.m_textCtrl2, 0, wx.ALL|wx.EXPAND|wx.ALIGN_CENTER_VERTICAL, 10 )
		
		self.m_colourPicker1 = wx.ColourPickerCtrl( self.highligh, wx.ID_ANY, wx.Colour( 251, 251, 104 ), wx.DefaultPosition, wx.DefaultSize, wx.CLRP_DEFAULT_STYLE )
		fgSizer7.Add( self.m_colourPicker1, 0, wx.ALL, 5 )
		
		self.m_textCtrl4 = wx.TextCtrl( self.highligh, wx.ID_ANY, u"Functions search", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_textCtrl4.SetBackgroundColour( wx.Colour( 130, 184, 226 ) )
		
		fgSizer7.Add( self.m_textCtrl4, 0, wx.ALL|wx.EXPAND|wx.ALIGN_CENTER_VERTICAL, 10 )
		
		self.m_colourPicker3 = wx.ColourPickerCtrl( self.highligh, wx.ID_ANY, wx.Colour( 130, 184, 226 ), wx.DefaultPosition, wx.DefaultSize, wx.CLRP_DEFAULT_STYLE )
		fgSizer7.Add( self.m_colourPicker3, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.m_textCtrl3 = wx.TextCtrl( self.highligh, wx.ID_ANY, u"User", wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_textCtrl3.SetBackgroundColour( wx.Colour( 149, 249, 149 ) )
		
		fgSizer7.Add( self.m_textCtrl3, 0, wx.ALL|wx.EXPAND|wx.ALIGN_CENTER_VERTICAL, 10 )
		
		self.m_colourPicker2 = wx.ColourPickerCtrl( self.highligh, wx.ID_ANY, wx.Colour( 149, 249, 149 ), wx.DefaultPosition, wx.DefaultSize, wx.CLRP_DEFAULT_STYLE )
		fgSizer7.Add( self.m_colourPicker2, 0, wx.ALL, 5 )
		
		self.highligh.SetSizer( fgSizer7 )
		self.highligh.Layout()
		fgSizer7.Fit( self.highligh )
		self.auinotebookPreferences.AddPage( self.highligh, u"highligh", False, wx.NullBitmap )
		
		bSizer21.Add( self.auinotebookPreferences, 1, wx.EXPAND |wx.ALL, 5 )
		
		self.m_panel25.SetSizer( bSizer21 )
		self.m_panel25.Layout()
		bSizer21.Fit( self.m_panel25 )
		self.m_splitter9.SplitVertically( self.m_panel24, self.m_panel25, 203 )
		bSizer19.Add( self.m_splitter9, 1, wx.EXPAND, 5 )
		
		self.m_panel29 = wx.Panel( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer2 = wx.FlexGridSizer( 1, 4, 0, 0 )
		fgSizer2.AddGrowableCol( 1 )
		fgSizer2.SetFlexibleDirection( wx.BOTH )
		fgSizer2.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.buttonRestore = wx.Button( self.m_panel29, wx.ID_ANY, u"Restore Defaults", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer2.Add( self.buttonRestore, 0, wx.ALL, 5 )
		
		
		fgSizer2.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.buttonApply = wx.Button( self.m_panel29, wx.ID_ANY, u"Apply", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer2.Add( self.buttonApply, 0, wx.ALL, 5 )
		
		self.buttonCancel = wx.Button( self.m_panel29, wx.ID_ANY, u"Cancel", wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer2.Add( self.buttonCancel, 0, wx.ALL, 5 )
		
		self.m_panel29.SetSizer( fgSizer2 )
		self.m_panel29.Layout()
		fgSizer2.Fit( self.m_panel29 )
		bSizer19.Add( self.m_panel29, 0, wx.EXPAND, 5 )
		
		self.SetSizer( bSizer19 )
		self.Layout()
		
		self.Centre( wx.BOTH )
	
	def __del__( self ):
		pass
	
	def m_splitter9OnIdle( self, event ):
		self.m_splitter9.SetSashPosition( 203 )
		self.m_splitter9.Unbind( wx.EVT_IDLE )
	



