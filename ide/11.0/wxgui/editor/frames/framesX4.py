# -*- coding: utf-8 -*- 

###########################################################################
## Python code generated with wxFormBuilder (version Oct  8 2012)
## http://www.wxformbuilder.org/
##
## PLEASE DO "NOT" EDIT THIS FILE!
###########################################################################

import wx
import wx.xrc
import wx.aui
import wx.richtext

import gettext
_ = gettext.gettext

###########################################################################
## Class menubarPinguino
###########################################################################

class menubarPinguino ( wx.MenuBar ):
	
	def __init__( self ):
		wx.MenuBar.__init__ ( self, style = 0 )
		
		self.menuFile = wx.Menu()
		self.menuItemNew = wx.MenuItem( self.menuFile, wx.ID_ANY, _(u"New")+ u"\t" + u"CTRL+N", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuFile.AppendItem( self.menuItemNew )
		
		self.menuItemOpen = wx.MenuItem( self.menuFile, wx.ID_ANY, _(u"Open")+ u"\t" + u"CTRL+O", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuFile.AppendItem( self.menuItemOpen )
		
		self.menuItemSave = wx.MenuItem( self.menuFile, wx.ID_ANY, _(u"Save")+ u"\t" + u"CTRL+S", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuFile.AppendItem( self.menuItemSave )
		
		self.menuItemSaveAs = wx.MenuItem( self.menuFile, wx.ID_ANY, _(u"Save as")+ u"\t" + u"CTRL+SHIFT+A", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuFile.AppendItem( self.menuItemSaveAs )
		
		self.menuItemClose = wx.MenuItem( self.menuFile, wx.ID_ANY, _(u"Close")+ u"\t" + u"CTRL+W", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuFile.AppendItem( self.menuItemClose )
		
		self.menuFile.AppendSeparator()
		
		self.menuItemSaveAll = wx.MenuItem( self.menuFile, wx.ID_ANY, _(u"Save all")+ u"\t" + u"CTRL+SHIFT+S", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuFile.AppendItem( self.menuItemSaveAll )
		
		self.menuItemCloseAll = wx.MenuItem( self.menuFile, wx.ID_ANY, _(u"Close all")+ u"\t" + u"CTRL+SHIFT+W", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuFile.AppendItem( self.menuItemCloseAll )
		
		self.menuFile.AppendSeparator()
		
		self.menuRecents = wx.Menu()
		self.menuFile.AppendSubMenu( self.menuRecents, _(u"Recents") )
		
		self.menuFile.AppendSeparator()
		
		self.menuItemExit = wx.MenuItem( self.menuFile, wx.ID_ANY, _(u"Exit")+ u"\t" + u"CTRL+Q", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuFile.AppendItem( self.menuItemExit )
		
		self.Append( self.menuFile, _(u"File") ) 
		
		self.menuEdit = wx.Menu()
		self.menuItemUndo = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Undo")+ u"\t" + u"CTRL+Z", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemUndo )
		
		self.menuItemRedo = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Redo")+ u"\t" + u"CTRL+Y", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemRedo )
		
		self.menuEdit.AppendSeparator()
		
		self.menuItemforzecompleter = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Show Auto-completer")+ u"\t" + u"CTRL+Space", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemforzecompleter )
		
		self.menuEdit.AppendSeparator()
		
		self.menuItemComment_Uncomment = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Comment/Uncomment")+ u"\t" + u"CTRL+L", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemComment_Uncomment )
		
		self.menuItemIndent = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Increase Indent")+ u"\t" + u"CTRL+>", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemIndent )
		
		self.menuItemUnIndent = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Decrease Indent")+ u"\t" + u"CTRL+<", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemUnIndent )
		
		self.menuEdit.AppendSeparator()
		
		self.menuItemFind = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Find")+ u"\t" + u"CTRL+F", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemFind )
		
		self.menuItemReplace = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Replace")+ u"\t" + u"CTRL+R", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemReplace )
		
		self.menuEdit.AppendSeparator()
		
		self.menuItemCut = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Cut")+ u"\t" + u"CTRL+X", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemCut )
		
		self.menuItemCopy = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Copy")+ u"\t" + u"CTRL+C", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemCopy )
		
		self.menuItemPaste = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Paste")+ u"\t" + u"CTRL+V", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemPaste )
		
		self.menuItemClear = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Clear"), wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemClear )
		
		self.menuItemSelectAll = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Select all")+ u"\t" + u"CTRL+A", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemSelectAll )
		
		self.menuEdit.AppendSeparator()
		
		self.menuItemPreferences = wx.MenuItem( self.menuEdit, wx.ID_ANY, _(u"Preferences...")+ u"\t" + u"CTRL+P", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuEdit.AppendItem( self.menuItemPreferences )
		
		self.Append( self.menuEdit, _(u"Edit") ) 
		
		self.menuView = wx.Menu()
		self.menuItemToolbar = wx.MenuItem( self.menuView, wx.ID_ANY, _(u"Toolbar")+ u"\t" + u"F3", wx.EmptyString, wx.ITEM_CHECK )
		self.menuView.AppendItem( self.menuItemToolbar )
		self.menuItemToolbar.Check( True )
		
		self.Append( self.menuView, _(u"View") ) 
		
		self.menuPinguino = wx.Menu()
		self.menuItemSelectDevice = wx.MenuItem( self.menuPinguino, wx.ID_ANY, _(u"Selector Board")+ u"\t" + u"F9", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuPinguino.AppendItem( self.menuItemSelectDevice )
		
		self.menuPinguino.AppendSeparator()
		
		self.menuItemViewStdout = wx.MenuItem( self.menuPinguino, wx.ID_ANY, _(u"View stdout")+ u"\t" + u"F8", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuPinguino.AppendItem( self.menuItemViewStdout )
		
		self.menuPinguino.AppendSeparator()
		
		self.menuItemCompile = wx.MenuItem( self.menuPinguino, wx.ID_ANY, _(u"Compile")+ u"\t" + u"F5", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuPinguino.AppendItem( self.menuItemCompile )
		
		self.menuItemUpload = wx.MenuItem( self.menuPinguino, wx.ID_ANY, _(u"Upload")+ u"\t" + u"F6", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuPinguino.AppendItem( self.menuItemUpload )
		
		self.menuItemCompileUpload = wx.MenuItem( self.menuPinguino, wx.ID_ANY, _(u"If Compile then Upload")+ u"\t" + u"F7", wx.EmptyString, wx.ITEM_NORMAL )
		self.menuPinguino.AppendItem( self.menuItemCompileUpload )
		
		self.Append( self.menuPinguino, _(u"Pinguino") ) 
		
		self.menuHelp = wx.Menu()
		self.menuItemKeywords = wx.MenuItem( self.menuHelp, wx.ID_ANY, _(u"Keywords"), wx.EmptyString, wx.ITEM_NORMAL )
		self.menuHelp.AppendItem( self.menuItemKeywords )
		
		self.menuLinks = wx.Menu()
		self.menuItemWebSite = wx.MenuItem( self.menuLinks, wx.ID_ANY, _(u"Website"), wx.EmptyString, wx.ITEM_NORMAL )
		self.menuLinks.AppendItem( self.menuItemWebSite )
		
		self.menuItemWiki = wx.MenuItem( self.menuLinks, wx.ID_ANY, _(u"Wiki"), wx.EmptyString, wx.ITEM_NORMAL )
		self.menuLinks.AppendItem( self.menuItemWiki )
		
		self.menuItemForum = wx.MenuItem( self.menuLinks, wx.ID_ANY, _(u"Forum"), wx.EmptyString, wx.ITEM_NORMAL )
		self.menuLinks.AppendItem( self.menuItemForum )
		
		self.menuItemBlog = wx.MenuItem( self.menuLinks, wx.ID_ANY, _(u"Blog"), wx.EmptyString, wx.ITEM_NORMAL )
		self.menuLinks.AppendItem( self.menuItemBlog )
		
		self.menuItemGroup = wx.MenuItem( self.menuLinks, wx.ID_ANY, _(u"Group"), wx.EmptyString, wx.ITEM_NORMAL )
		self.menuLinks.AppendItem( self.menuItemGroup )
		
		self.menuItemShop = wx.MenuItem( self.menuLinks, wx.ID_ANY, _(u"Shop"), wx.EmptyString, wx.ITEM_NORMAL )
		self.menuLinks.AppendItem( self.menuItemShop )
		
		self.menuHelp.AppendSubMenu( self.menuLinks, _(u"Links") )
		
		self.menuHelp.AppendSeparator()
		
		self.menuItemAbout = wx.MenuItem( self.menuHelp, wx.ID_ANY, _(u"About..."), wx.EmptyString, wx.ITEM_NORMAL )
		self.menuHelp.AppendItem( self.menuItemAbout )
		
		self.Append( self.menuHelp, _(u"Help") ) 
		
	
	def __del__( self ):
		pass
	

###########################################################################
## Class framePreferences
###########################################################################

class framePreferences ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = _(u"Pinguino IDE - Preferences"), pos = wx.DefaultPosition, size = wx.Size( 934,388 ), style = wx.DEFAULT_FRAME_STYLE|wx.FRAME_TOOL_WINDOW|wx.STAY_ON_TOP|wx.TAB_TRAVERSAL )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer19 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_splitter9 = wx.SplitterWindow( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter9.Bind( wx.EVT_IDLE, self.m_splitter9OnIdle )
		
		self.m_panel24 = wx.Panel( self.m_splitter9, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer20 = wx.BoxSizer( wx.VERTICAL )
		
		listBoxPreferencesChoices = [ _(u"Appearance"), _(u"Source Code Font/Size"), _(u"Highlight"), _(u"Others") ]
		self.listBoxPreferences = wx.ListBox( self.m_panel24, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, listBoxPreferencesChoices, 0 )
		bSizer20.Add( self.listBoxPreferences, 1, wx.ALL|wx.EXPAND, 5 )
		
		checkListPreferencesChoices = [_(u"Auto-completion"), _(u"Open/Save files"), _(u"Tools")]
		self.checkListPreferences = wx.CheckListBox( self.m_panel24, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, checkListPreferencesChoices, 0 )
		bSizer20.Add( self.checkListPreferences, 1, wx.ALL|wx.EXPAND, 5 )
		
		
		self.m_panel24.SetSizer( bSizer20 )
		self.m_panel24.Layout()
		bSizer20.Fit( self.m_panel24 )
		self.m_panel25 = wx.Panel( self.m_splitter9, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer21 = wx.BoxSizer( wx.VERTICAL )
		
		self.staticTextPage = wx.StaticText( self.m_panel25, wx.ID_ANY, _(u"Appearance"), wx.DefaultPosition, wx.DefaultSize, 0 )
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
		
		self.m_staticText6 = wx.StaticText( self.appearance, wx.ID_ANY, _(u"Theme"), wx.DefaultPosition, wx.DefaultSize, 0 )
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
		self.auinotebookPreferences.AddPage( self.appearance, _(u"appearance"), False, wx.NullBitmap )
		self.souce_code_font_size = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer4 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer4.AddGrowableCol( 1 )
		fgSizer4.AddGrowableRow( 2 )
		fgSizer4.AddGrowableRow( 5 )
		fgSizer4.SetFlexibleDirection( wx.BOTH )
		fgSizer4.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.radioBtnSourcedefault = wx.RadioButton( self.souce_code_font_size, wx.ID_ANY, _(u"Use default"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.radioBtnSourcedefault, 0, wx.ALL, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.radioBtnSourceselected = wx.RadioButton( self.souce_code_font_size, wx.ID_ANY, _(u"Use selected"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.radioBtnSourceselected, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.fontPickerSource = wx.FontPickerCtrl( self.souce_code_font_size, wx.ID_ANY, wx.Font( 12, 70, 90, 90, False, "Ubuntu Mono" ), wx.DefaultPosition, wx.DefaultSize, wx.FNTP_DEFAULT_STYLE )
		self.fontPickerSource.SetMaxPointSize( 100 ) 
		fgSizer4.Add( self.fontPickerSource, 0, wx.ALL|wx.EXPAND, 5 )
		
		self.checkBoxuseoutput = wx.CheckBox( self.souce_code_font_size, wx.ID_ANY, _(u"Also use in the output"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer4.Add( self.checkBoxuseoutput, 0, wx.ALL, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_staticText8 = wx.StaticText( self.souce_code_font_size, wx.ID_ANY, _(u"Tab size"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText8.Wrap( -1 )
		fgSizer4.Add( self.m_staticText8, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.spinCtrlSource = wx.SpinCtrl( self.souce_code_font_size, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.SP_ARROW_KEYS, 2, 10, 4 )
		fgSizer4.Add( self.spinCtrlSource, 0, wx.ALL|wx.EXPAND, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		
		fgSizer4.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		
		self.souce_code_font_size.SetSizer( fgSizer4 )
		self.souce_code_font_size.Layout()
		fgSizer4.Fit( self.souce_code_font_size )
		self.auinotebookPreferences.AddPage( self.souce_code_font_size, _(u"souce_code_font_size"), False, wx.NullBitmap )
		self.highlight = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer7 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer7.AddGrowableCol( 0 )
		fgSizer7.SetFlexibleDirection( wx.BOTH )
		fgSizer7.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.textCtrlSearch = wx.TextCtrl( self.highlight, wx.ID_ANY, _(u"Search and Replace"), wx.DefaultPosition, wx.Size( -1,-1 ), wx.TE_READONLY )
		self.textCtrlSearch.SetMaxLength( 0 ) 
		self.textCtrlSearch.SetBackgroundColour( wx.Colour( 251, 251, 104 ) )
		
		fgSizer7.Add( self.textCtrlSearch, 0, wx.ALL|wx.EXPAND|wx.ALIGN_CENTER_VERTICAL, 10 )
		
		self.colourPickerSearch = wx.ColourPickerCtrl( self.highlight, wx.ID_ANY, wx.Colour( 251, 251, 104 ), wx.DefaultPosition, wx.DefaultSize, wx.CLRP_DEFAULT_STYLE )
		fgSizer7.Add( self.colourPickerSearch, 0, wx.ALL, 5 )
		
		self.textCtrlCodeNav = wx.TextCtrl( self.highlight, wx.ID_ANY, _(u"Code Navigation"), wx.DefaultPosition, wx.DefaultSize, wx.TE_READONLY )
		self.textCtrlCodeNav.SetMaxLength( 0 ) 
		self.textCtrlCodeNav.SetBackgroundColour( wx.Colour( 130, 184, 226 ) )
		
		fgSizer7.Add( self.textCtrlCodeNav, 0, wx.ALL|wx.EXPAND|wx.ALIGN_CENTER_VERTICAL, 10 )
		
		self.colourPickerCodeNav = wx.ColourPickerCtrl( self.highlight, wx.ID_ANY, wx.Colour( 130, 184, 226 ), wx.DefaultPosition, wx.DefaultSize, wx.CLRP_DEFAULT_STYLE )
		fgSizer7.Add( self.colourPickerCodeNav, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.textCtrlCurrentLine = wx.TextCtrl( self.highlight, wx.ID_ANY, _(u"Selection"), wx.DefaultPosition, wx.DefaultSize, wx.TE_READONLY )
		self.textCtrlCurrentLine.SetMaxLength( 0 ) 
		self.textCtrlCurrentLine.SetBackgroundColour( wx.Colour( 240, 119, 70 ) )
		
		fgSizer7.Add( self.textCtrlCurrentLine, 0, wx.ALIGN_CENTER_VERTICAL|wx.ALL|wx.EXPAND, 10 )
		
		self.colourPickerCurrentLine = wx.ColourPickerCtrl( self.highlight, wx.ID_ANY, wx.Colour( 204, 230, 239 ), wx.DefaultPosition, wx.DefaultSize, wx.CLRP_DEFAULT_STYLE )
		fgSizer7.Add( self.colourPickerCurrentLine, 0, wx.ALL, 5 )
		
		self.textCtrlErrorLine = wx.TextCtrl( self.highlight, wx.ID_ANY, _(u"Error Line"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.textCtrlErrorLine.SetMaxLength( 0 ) 
		self.textCtrlErrorLine.SetBackgroundColour( wx.Colour( 255, 96, 96 ) )
		
		fgSizer7.Add( self.textCtrlErrorLine, 0, wx.ALIGN_CENTER_VERTICAL|wx.ALL|wx.EXPAND, 10 )
		
		self.colourPickerErrorLine = wx.ColourPickerCtrl( self.highlight, wx.ID_ANY, wx.Colour( 255, 96, 96 ), wx.DefaultPosition, wx.DefaultSize, wx.CLRP_DEFAULT_STYLE )
		fgSizer7.Add( self.colourPickerErrorLine, 0, wx.ALL, 5 )
		
		
		self.highlight.SetSizer( fgSizer7 )
		self.highlight.Layout()
		fgSizer7.Fit( self.highlight )
		self.auinotebookPreferences.AddPage( self.highlight, _(u"highligh"), False, wx.NullBitmap )
		self.others = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer10 = wx.FlexGridSizer( 0, 2, 0, 0 )
		fgSizer10.SetFlexibleDirection( wx.BOTH )
		fgSizer10.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_staticText17 = wx.StaticText( self.others, wx.ID_ANY, _(u"Source online doc:"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText17.Wrap( -1 )
		fgSizer10.Add( self.m_staticText17, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		comboBoxSourcedocChoices = [ _(u"Pinguino wiki official"), _(u"PinguinoVE wiki") ]
		self.comboBoxSourcedoc = wx.ComboBox( self.others, wx.ID_ANY, _(u"Pinguino wiki official"), wx.DefaultPosition, wx.DefaultSize, comboBoxSourcedocChoices, 0 )
		fgSizer10.Add( self.comboBoxSourcedoc, 0, wx.ALL, 5 )
		
		
		self.others.SetSizer( fgSizer10 )
		self.others.Layout()
		fgSizer10.Fit( self.others )
		self.auinotebookPreferences.AddPage( self.others, _(u"others"), False, wx.NullBitmap )
		self.auto_completion = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer39 = wx.BoxSizer( wx.HORIZONTAL )
		
		fgSizer12 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer12.AddGrowableCol( 1 )
		fgSizer12.SetFlexibleDirection( wx.BOTH )
		fgSizer12.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_staticText19 = wx.StaticText( self.auto_completion, wx.ID_ANY, _(u"Source completion"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText19.Wrap( -1 )
		self.m_staticText19.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		fgSizer12.Add( self.m_staticText19, 0, wx.ALL|wx.EXPAND, 5 )
		
		
		fgSizer12.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.radioBtnCompleterEn = wx.RadioButton( self.auto_completion, wx.ID_ANY, _(u"After characters"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer12.Add( self.radioBtnCompleterEn, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.spinCtrlCompleterCount = wx.SpinCtrl( self.auto_completion, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.SP_ARROW_KEYS, 0, 10, 1 )
		fgSizer12.Add( self.spinCtrlCompleterCount, 0, wx.ALL|wx.EXPAND|wx.LEFT, 5 )
		
		self.radioBtnCompleterDis = wx.RadioButton( self.auto_completion, wx.ID_ANY, _(u"Disable auto-completer"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer12.Add( self.radioBtnCompleterDis, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		
		fgSizer12.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.m_staticText12 = wx.StaticText( self.auto_completion, wx.ID_ANY, _(u"Items count"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText12.Wrap( -1 )
		fgSizer12.Add( self.m_staticText12, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.spinCtrlItemsCompleterCount = wx.SpinCtrl( self.auto_completion, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.SP_ARROW_KEYS, 5, 30, 14 )
		fgSizer12.Add( self.spinCtrlItemsCompleterCount, 0, wx.ALL|wx.EXPAND, 5 )
		
		self.checkBoxInsertParenthesis = wx.CheckBox( self.auto_completion, wx.ID_ANY, _(u"Insert arguments with \"(\""), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.checkBoxInsertParenthesis.SetValue(True) 
		fgSizer12.Add( self.checkBoxInsertParenthesis, 0, wx.ALL, 5 )
		
		
		bSizer39.Add( fgSizer12, 1, wx.ALL|wx.EXPAND, 5 )
		
		fgSizer6 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer6.AddGrowableCol( 1 )
		fgSizer6.SetFlexibleDirection( wx.BOTH )
		fgSizer6.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_staticText15 = wx.StaticText( self.auto_completion, wx.ID_ANY, _(u"Auto-close"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText15.Wrap( -1 )
		self.m_staticText15.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		fgSizer6.Add( self.m_staticText15, 0, wx.ALL|wx.ALIGN_CENTER_VERTICAL, 5 )
		
		self.checkBoxBrackets = wx.CheckBox( self.auto_completion, wx.ID_ANY, _(u"Brackets: []"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.checkBoxBrackets, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		
		fgSizer6.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.checkBoxKeys = wx.CheckBox( self.auto_completion, wx.ID_ANY, _(u"Keys: {}"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.checkBoxKeys, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		
		fgSizer6.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.checkBoxParentheses = wx.CheckBox( self.auto_completion, wx.ID_ANY, _(u"Parentheses: ()"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.checkBoxParentheses, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		
		fgSizer6.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.checkBoxDoubleCuotes = wx.CheckBox( self.auto_completion, wx.ID_ANY, _(u"Double quotes: \""), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.checkBoxDoubleCuotes, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		
		fgSizer6.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.checkBoxSingleCuotes = wx.CheckBox( self.auto_completion, wx.ID_ANY, _(u"Single quotes: '"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer6.Add( self.checkBoxSingleCuotes, 0, wx.EXPAND|wx.RIGHT|wx.LEFT, 5 )
		
		
		bSizer39.Add( fgSizer6, 1, wx.EXPAND, 5 )
		
		
		self.auto_completion.SetSizer( bSizer39 )
		self.auto_completion.Layout()
		bSizer39.Fit( self.auto_completion )
		self.auinotebookPreferences.AddPage( self.auto_completion, _(u"autocompletion"), False, wx.NullBitmap )
		self.open_save_files = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		gSizer1 = wx.GridSizer( 2, 2, 0, 0 )
		
		sbSizer5 = wx.StaticBoxSizer( wx.StaticBox( self.open_save_files, wx.ID_ANY, _(u"New file") ), wx.VERTICAL )
		
		self.m_panel36 = wx.Panel( self.open_save_files, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer28 = wx.BoxSizer( wx.VERTICAL )
		
		self.radioBtnFileTemplate = wx.RadioButton( self.m_panel36, wx.ID_ANY, _(u"With template"), wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer28.Add( self.radioBtnFileTemplate, 0, wx.ALL, 5 )
		
		self.radioBtnFileEmpty = wx.RadioButton( self.m_panel36, wx.ID_ANY, _(u"Empty"), wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer28.Add( self.radioBtnFileEmpty, 0, wx.ALL, 5 )
		
		
		self.m_panel36.SetSizer( bSizer28 )
		self.m_panel36.Layout()
		bSizer28.Fit( self.m_panel36 )
		sbSizer5.Add( self.m_panel36, 1, wx.EXPAND, 5 )
		
		
		gSizer1.Add( sbSizer5, 1, wx.EXPAND|wx.ALL, 5 )
		
		sbSizer6 = wx.StaticBoxSizer( wx.StaticBox( self.open_save_files, wx.ID_ANY, _(u"Auto-save") ), wx.VERTICAL )
		
		self.m_panel37 = wx.Panel( self.open_save_files, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer8 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer8.SetFlexibleDirection( wx.BOTH )
		fgSizer8.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.radioBtnSaveEach = wx.RadioButton( self.m_panel37, wx.ID_ANY, _(u"Each (sec)"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer8.Add( self.radioBtnSaveEach, 0, wx.ALL, 5 )
		
		self.spinCtrlSaveTime = wx.SpinCtrl( self.m_panel37, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.SP_ARROW_KEYS, 10, 300, 10 )
		fgSizer8.Add( self.spinCtrlSaveTime, 0, wx.ALL, 5 )
		
		self.radioBtnSaveNever = wx.RadioButton( self.m_panel37, wx.ID_ANY, _(u"Never"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer8.Add( self.radioBtnSaveNever, 0, wx.ALL, 5 )
		
		
		self.m_panel37.SetSizer( fgSizer8 )
		self.m_panel37.Layout()
		fgSizer8.Fit( self.m_panel37 )
		sbSizer6.Add( self.m_panel37, 1, wx.EXPAND, 5 )
		
		
		gSizer1.Add( sbSizer6, 1, wx.EXPAND|wx.ALL, 5 )
		
		sbSizer8 = wx.StaticBoxSizer( wx.StaticBox( self.open_save_files, wx.ID_ANY, _(u"Open last files") ), wx.VERTICAL )
		
		self.m_panel38 = wx.Panel( self.open_save_files, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer30 = wx.BoxSizer( wx.VERTICAL )
		
		self.radioBtnOpenAll = wx.RadioButton( self.m_panel38, wx.ID_ANY, _(u"All existing files"), wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer30.Add( self.radioBtnOpenAll, 0, wx.ALL, 5 )
		
		self.radioBtnOpenNever = wx.RadioButton( self.m_panel38, wx.ID_ANY, _(u"Never"), wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer30.Add( self.radioBtnOpenNever, 0, wx.ALL, 5 )
		
		
		self.m_panel38.SetSizer( bSizer30 )
		self.m_panel38.Layout()
		bSizer30.Fit( self.m_panel38 )
		sbSizer8.Add( self.m_panel38, 1, wx.EXPAND, 5 )
		
		
		gSizer1.Add( sbSizer8, 1, wx.EXPAND|wx.ALL, 5 )
		
		
		self.open_save_files.SetSizer( gSizer1 )
		self.open_save_files.Layout()
		gSizer1.Fit( self.open_save_files )
		self.auinotebookPreferences.AddPage( self.open_save_files, _(u"open_save_files"), False, wx.NullBitmap )
		self.tools = wx.Panel( self.auinotebookPreferences, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer9 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer9.AddGrowableCol( 1 )
		fgSizer9.SetFlexibleDirection( wx.BOTH )
		fgSizer9.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_staticText16 = wx.StaticText( self.tools, wx.ID_ANY, _(u"Tools"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText16.Wrap( -1 )
		self.m_staticText16.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		fgSizer9.Add( self.m_staticText16, 0, wx.ALL, 5 )
		
		self.checkBoxFiles = wx.CheckBox( self.tools, wx.ID_ANY, _(u"Files"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer9.Add( self.checkBoxFiles, 0, wx.ALL, 5 )
		
		
		fgSizer9.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.checkBoxDocuments = wx.CheckBox( self.tools, wx.ID_ANY, _(u"Documents"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer9.Add( self.checkBoxDocuments, 0, wx.ALL, 5 )
		
		
		fgSizer9.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.checkBoxSearch = wx.CheckBox( self.tools, wx.ID_ANY, _(u"Search"), wx.DefaultPosition, wx.DefaultSize, 0 )
		fgSizer9.Add( self.checkBoxSearch, 0, wx.ALL, 5 )
		
		
		self.tools.SetSizer( fgSizer9 )
		self.tools.Layout()
		fgSizer9.Fit( self.tools )
		self.auinotebookPreferences.AddPage( self.tools, _(u"a page"), False, wx.NullBitmap )
		
		bSizer21.Add( self.auinotebookPreferences, 1, wx.EXPAND |wx.ALL, 5 )
		
		
		self.m_panel25.SetSizer( bSizer21 )
		self.m_panel25.Layout()
		bSizer21.Fit( self.m_panel25 )
		self.m_splitter9.SplitVertically( self.m_panel24, self.m_panel25, 203 )
		bSizer19.Add( self.m_splitter9, 1, wx.EXPAND, 5 )
		
		self.m_panel29 = wx.Panel( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		self.fgSizer2 = wx.FlexGridSizer( 1, 5, 0, 0 )
		self.fgSizer2.AddGrowableCol( 1 )
		self.fgSizer2.SetFlexibleDirection( wx.BOTH )
		self.fgSizer2.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.buttonRestore = wx.Button( self.m_panel29, wx.ID_ANY, _(u"Restore Defaults"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.fgSizer2.Add( self.buttonRestore, 0, wx.ALL, 5 )
		
		
		self.fgSizer2.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.buttonRestart = wx.Button( self.m_panel29, wx.ID_ANY, _(u"Restart"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.buttonRestart.SetForegroundColour( wx.Colour( 255, 0, 0 ) )
		
		self.fgSizer2.Add( self.buttonRestart, 0, wx.ALL, 5 )
		
		self.buttonApply = wx.Button( self.m_panel29, wx.ID_ANY, _(u"Apply"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.fgSizer2.Add( self.buttonApply, 0, wx.ALL, 5 )
		
		self.buttonCancel = wx.Button( self.m_panel29, wx.ID_ANY, _(u"Ok"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.fgSizer2.Add( self.buttonCancel, 0, wx.ALL, 5 )
		
		
		self.m_panel29.SetSizer( self.fgSizer2 )
		self.m_panel29.Layout()
		self.fgSizer2.Fit( self.m_panel29 )
		bSizer19.Add( self.m_panel29, 0, wx.EXPAND, 5 )
		
		
		self.SetSizer( bSizer19 )
		self.Layout()
		
		self.Centre( wx.BOTH )
	
	def __del__( self ):
		pass
	
	def m_splitter9OnIdle( self, event ):
		self.m_splitter9.SetSashPosition( 203 )
		self.m_splitter9.Unbind( wx.EVT_IDLE )
	

###########################################################################
## Class frameKeyWords
###########################################################################

class frameKeyWords ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = _(u"Pinguino IDE - Online docs"), pos = wx.DefaultPosition, size = wx.Size( 808,424 ), style = wx.DEFAULT_FRAME_STYLE|wx.FRAME_TOOL_WINDOW|wx.TAB_TRAVERSAL, name = u"Pinguino Functions" )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer12 = wx.BoxSizer( wx.HORIZONTAL )
		
		self.m_splitter6 = wx.SplitterWindow( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter6.Bind( wx.EVT_IDLE, self.m_splitter6OnIdle )
		
		self.m_panel14 = wx.Panel( self.m_splitter6, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer16 = wx.BoxSizer( wx.VERTICAL )
		
		checkListKeywordsChoices = [_(u" ")]
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
	

###########################################################################
## Class framePinguinoX
###########################################################################

class framePinguinoX ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = _(u"Pinguino IDE x.4"), pos = wx.DefaultPosition, size = wx.Size( 757,430 ), style = wx.DEFAULT_FRAME_STYLE|wx.TAB_TRAVERSAL, name = u"Pinguino IDE x.3" )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer1 = wx.BoxSizer( wx.VERTICAL )
		
		self.panelPrincipal = wx.Panel( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		self.panelPrincipal.SetBackgroundColour( wx.Colour( 175, 200, 225 ) )
		
		bSizer37 = wx.BoxSizer( wx.VERTICAL )
		
		self.splitterCO = wx.SplitterWindow( self.panelPrincipal, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.splitterCO.SetSashGravity( 0.8 )
		self.splitterCO.Bind( wx.EVT_IDLE, self.splitterCOOnIdle )
		
		self.panelEditor = wx.Panel( self.splitterCO, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		self.panelEditor.SetBackgroundColour( wx.Colour( 175, 200, 225 ) )
		
		bSizer2 = wx.BoxSizer( wx.VERTICAL )
		
		self.splitterCL = wx.SplitterWindow( self.panelEditor, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.splitterCL.SetSashGravity( 0.8 )
		self.splitterCL.Bind( wx.EVT_IDLE, self.splitterCLOnIdle )
		
		self.panelCentral = wx.Panel( self.splitterCL, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.FULL_REPAINT_ON_RESIZE|wx.TAB_TRAVERSAL )
		self.panelCentral.SetBackgroundColour( wx.Colour( 175, 200, 225 ) )
		
		bSizer38 = wx.BoxSizer( wx.VERTICAL )
		
		self.notebookEditor = wx.Notebook( self.panelCentral, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, 0 )
		
		bSizer38.Add( self.notebookEditor, 1, wx.EXPAND, 5 )
		
		
		self.panelCentral.SetSizer( bSizer38 )
		self.panelCentral.Layout()
		bSizer38.Fit( self.panelCentral )
		self.panelLateral = wx.Panel( self.splitterCL, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		self.panelLateral.SetBackgroundColour( wx.Colour( 175, 200, 225 ) )
		
		bSizer3 = wx.BoxSizer( wx.VERTICAL )
		
		self.notebookLateral = wx.Notebook( self.panelLateral, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, 0 )
		self.file = wx.Panel( self.notebookLateral, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer7 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_splitter4 = wx.SplitterWindow( self.file, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter4.Bind( wx.EVT_IDLE, self.m_splitter4OnIdle )
		
		self.m_panel8 = wx.Panel( self.m_splitter4, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer8 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_staticText12 = wx.StaticText( self.m_panel8, wx.ID_ANY, _(u"Functions"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText12.Wrap( -1 )
		self.m_staticText12.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		bSizer8.Add( self.m_staticText12, 0, 0, 5 )
		
		self.listCtrlFunc = wx.ListCtrl( self.m_panel8, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_REPORT|wx.RAISED_BORDER )
		bSizer8.Add( self.listCtrlFunc, 1, wx.EXPAND, 5 )
		
		
		self.m_panel8.SetSizer( bSizer8 )
		self.m_panel8.Layout()
		bSizer8.Fit( self.m_panel8 )
		self.m_panel29 = wx.Panel( self.m_splitter4, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer24 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_splitter81 = wx.SplitterWindow( self.m_panel29, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter81.Bind( wx.EVT_IDLE, self.m_splitter81OnIdle )
		
		self.m_panel30 = wx.Panel( self.m_splitter81, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer25 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_staticText14 = wx.StaticText( self.m_panel30, wx.ID_ANY, _(u"Variables"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText14.Wrap( -1 )
		self.m_staticText14.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		bSizer25.Add( self.m_staticText14, 0, wx.EXPAND, 5 )
		
		self.listCtrlVars = wx.ListCtrl( self.m_panel30, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_REPORT|wx.RAISED_BORDER )
		bSizer25.Add( self.listCtrlVars, 1, wx.EXPAND, 5 )
		
		
		self.m_panel30.SetSizer( bSizer25 )
		self.m_panel30.Layout()
		bSizer25.Fit( self.m_panel30 )
		self.m_panel31 = wx.Panel( self.m_splitter81, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer26 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_staticText15 = wx.StaticText( self.m_panel31, wx.ID_ANY, _(u"Directives"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText15.Wrap( -1 )
		self.m_staticText15.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		bSizer26.Add( self.m_staticText15, 0, wx.EXPAND, 5 )
		
		self.listCtrlDefi = wx.ListCtrl( self.m_panel31, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_REPORT|wx.RAISED_BORDER )
		bSizer26.Add( self.listCtrlDefi, 1, wx.EXPAND, 5 )
		
		
		self.m_panel31.SetSizer( bSizer26 )
		self.m_panel31.Layout()
		bSizer26.Fit( self.m_panel31 )
		self.m_splitter81.SplitHorizontally( self.m_panel30, self.m_panel31, 137 )
		bSizer24.Add( self.m_splitter81, 1, wx.EXPAND, 5 )
		
		
		self.m_panel29.SetSizer( bSizer24 )
		self.m_panel29.Layout()
		bSizer24.Fit( self.m_panel29 )
		self.m_splitter4.SplitHorizontally( self.m_panel8, self.m_panel29, 119 )
		bSizer7.Add( self.m_splitter4, 1, wx.EXPAND, 5 )
		
		
		self.file.SetSizer( bSizer7 )
		self.file.Layout()
		bSizer7.Fit( self.file )
		self.notebookLateral.AddPage( self.file, _(u"Code navigator"), False )
		self.documents = wx.Panel( self.notebookLateral, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer4 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_splitter3 = wx.SplitterWindow( self.documents, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.SP_3D )
		self.m_splitter3.Bind( wx.EVT_IDLE, self.m_splitter3OnIdle )
		
		self.m_panel5 = wx.Panel( self.m_splitter3, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer5 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_staticText1 = wx.StaticText( self.m_panel5, wx.ID_ANY, _(u"Directories"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText1.Wrap( -1 )
		self.m_staticText1.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		bSizer5.Add( self.m_staticText1, 0, wx.EXPAND, 5 )
		
		self.dirPicker = wx.DirPickerCtrl( self.m_panel5, wx.ID_ANY, wx.EmptyString, _(u"Select a folder"), wx.DefaultPosition, wx.DefaultSize, wx.DIRP_DEFAULT_STYLE )
		bSizer5.Add( self.dirPicker, 0, wx.EXPAND, 0 )
		
		self.listCtrlDir = wx.ListCtrl( self.m_panel5, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_NO_HEADER|wx.LC_REPORT|wx.RAISED_BORDER )
		bSizer5.Add( self.listCtrlDir, 1, wx.EXPAND, 5 )
		
		
		self.m_panel5.SetSizer( bSizer5 )
		self.m_panel5.Layout()
		bSizer5.Fit( self.m_panel5 )
		self.m_panel6 = wx.Panel( self.m_splitter3, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer6 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_staticText2 = wx.StaticText( self.m_panel6, wx.ID_ANY, _(u"Files"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText2.Wrap( -1 )
		self.m_staticText2.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		bSizer6.Add( self.m_staticText2, 0, wx.EXPAND, 5 )
		
		self.listCtrlFiles = wx.ListCtrl( self.m_panel6, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_NO_HEADER|wx.LC_REPORT|wx.RAISED_BORDER )
		bSizer6.Add( self.listCtrlFiles, 1, wx.EXPAND, 5 )
		
		choiceFileChoices = [ _(u"*.*"), _(u"*.pde"), _(u"*.c"), _(u"*.h") ]
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
		self.notebookLateral.AddPage( self.documents, _(u"Explore"), True )
		self.search = wx.Panel( self.notebookLateral, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		fgSizer1 = wx.FlexGridSizer( 2, 2, 0, 0 )
		fgSizer1.AddGrowableCol( 1 )
		fgSizer1.SetFlexibleDirection( wx.BOTH )
		fgSizer1.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )
		
		self.m_staticText3 = wx.StaticText( self.search, wx.ID_ANY, _(u"Search:"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText3.Wrap( -1 )
		self.m_staticText3.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		fgSizer1.Add( self.m_staticText3, 0, wx.ALIGN_RIGHT|wx.ALL, 5 )
		
		self.searchCtrlSearch = wx.SearchCtrl( self.search, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.TE_PROCESS_ENTER )
		self.searchCtrlSearch.ShowSearchButton( False )
		self.searchCtrlSearch.ShowCancelButton( False )
		fgSizer1.Add( self.searchCtrlSearch, 0, wx.EXPAND|wx.ALL, 5 )
		
		self.m_staticText4 = wx.StaticText( self.search, wx.ID_ANY, _(u"Replace:"), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.m_staticText4.Wrap( -1 )
		self.m_staticText4.SetFont( wx.Font( wx.NORMAL_FONT.GetPointSize(), 70, 90, 92, False, wx.EmptyString ) )
		
		fgSizer1.Add( self.m_staticText4, 0, wx.ALL|wx.ALIGN_RIGHT, 5 )
		
		self.searchCtrlReplace = wx.SearchCtrl( self.search, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, 0 )
		self.searchCtrlReplace.ShowSearchButton( False )
		self.searchCtrlReplace.ShowCancelButton( False )
		fgSizer1.Add( self.searchCtrlReplace, 0, wx.EXPAND|wx.ALL, 5 )
		
		
		fgSizer1.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		bSizer27 = wx.BoxSizer( wx.HORIZONTAL )
		
		self.checkBox_sensitive = wx.CheckBox( self.search, wx.ID_ANY, _(u"Case sensitive"), wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer27.Add( self.checkBox_sensitive, 0, wx.ALL, 5 )
		
		
		fgSizer1.Add( bSizer27, 1, wx.EXPAND, 5 )
		
		
		fgSizer1.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		bSizer11 = wx.BoxSizer( wx.HORIZONTAL )
		
		self.buttonPrev = wx.Button( self.search, wx.ID_ANY, _(u"Previous"), wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer11.Add( self.buttonPrev, 0, wx.ALL, 5 )
		
		self.buttonNext = wx.Button( self.search, wx.ID_ANY, _(u"Next"), wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer11.Add( self.buttonNext, 0, wx.ALL, 5 )
		
		
		fgSizer1.Add( bSizer11, 1, wx.EXPAND, 5 )
		
		
		fgSizer1.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		self.panelReplace = wx.Panel( self.search, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer111 = wx.BoxSizer( wx.HORIZONTAL )
		
		self.buttonReplace = wx.Button( self.panelReplace, wx.ID_ANY, _(u"Replace"), wx.DefaultPosition, wx.DefaultSize, 0 )
		bSizer111.Add( self.buttonReplace, 0, wx.ALL, 5 )
		
		self.buttonReplaceAll = wx.Button( self.panelReplace, wx.ID_ANY, _(u"Replace all"), wx.DefaultPosition, wx.DefaultSize, 0 )
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
		self.notebookLateral.AddPage( self.search, _(u"Search/Replace"), False )
		
		bSizer3.Add( self.notebookLateral, 1, wx.EXPAND, 5 )
		
		
		self.panelLateral.SetSizer( bSizer3 )
		self.panelLateral.Layout()
		bSizer3.Fit( self.panelLateral )
		self.splitterCL.SplitVertically( self.panelCentral, self.panelLateral, 490 )
		bSizer2.Add( self.splitterCL, 1, wx.EXPAND, 5 )
		
		
		self.panelEditor.SetSizer( bSizer2 )
		self.panelEditor.Layout()
		bSizer2.Fit( self.panelEditor )
		self.panelOutput = wx.Panel( self.splitterCO, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		self.panelOutput.SetBackgroundColour( wx.SystemSettings.GetColour( wx.SYS_COLOUR_GRAYTEXT ) )
		
		bSizer30 = wx.BoxSizer( wx.VERTICAL )
		
		self.logwindow = wx.TextCtrl( self.panelOutput, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.TE_MULTILINE|wx.TE_READONLY )
		bSizer30.Add( self.logwindow, 1, wx.EXPAND, 5 )
		
		
		self.panelOutput.SetSizer( bSizer30 )
		self.panelOutput.Layout()
		bSizer30.Fit( self.panelOutput )
		self.splitterCO.SplitHorizontally( self.panelEditor, self.panelOutput, 0 )
		bSizer37.Add( self.splitterCO, 1, wx.EXPAND, 5 )
		
		
		self.panelPrincipal.SetSizer( bSizer37 )
		self.panelPrincipal.Layout()
		bSizer37.Fit( self.panelPrincipal )
		bSizer1.Add( self.panelPrincipal, 1, wx.EXPAND |wx.ALL, 0 )
		
		
		self.SetSizer( bSizer1 )
		self.Layout()
		self.statusBarEditor = self.CreateStatusBar( 4, wx.ST_SIZEGRIP, wx.ID_ANY )
		
		self.Centre( wx.BOTH )
	
	def __del__( self ):
		pass
	
	def splitterCOOnIdle( self, event ):
		self.splitterCO.SetSashPosition( 0 )
		self.splitterCO.Unbind( wx.EVT_IDLE )
	
	def splitterCLOnIdle( self, event ):
		self.splitterCL.SetSashPosition( 490 )
		self.splitterCL.Unbind( wx.EVT_IDLE )
	
	def m_splitter4OnIdle( self, event ):
		self.m_splitter4.SetSashPosition( 119 )
		self.m_splitter4.Unbind( wx.EVT_IDLE )
	
	def m_splitter81OnIdle( self, event ):
		self.m_splitter81.SetSashPosition( 137 )
		self.m_splitter81.Unbind( wx.EVT_IDLE )
	
	def m_splitter3OnIdle( self, event ):
		self.m_splitter3.SetSashPosition( 0 )
		self.m_splitter3.Unbind( wx.EVT_IDLE )
	

###########################################################################
## Class frameAutoCompleter
###########################################################################

class frameAutoCompleter ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = _(u"Auto-completer"), pos = wx.DefaultPosition, size = wx.Size( 208,335 ), style = wx.FRAME_FLOAT_ON_PARENT|wx.STAY_ON_TOP|wx.TAB_TRAVERSAL )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer28 = wx.BoxSizer( wx.VERTICAL )
		
		self.listCtrlAutocompleter = wx.ListCtrl( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.LC_NO_HEADER|wx.LC_REPORT|wx.NO_BORDER )
		bSizer28.Add( self.listCtrlAutocompleter, 1, wx.ALL|wx.EXPAND, 0 )
		
		
		self.SetSizer( bSizer28 )
		self.Layout()
		
		self.Centre( wx.BOTH )
	
	def __del__( self ):
		pass
	

###########################################################################
## Class frameStdout
###########################################################################

class frameStdout ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = _(u"Pinguino IDE - Stdout"), pos = wx.DefaultPosition, size = wx.Size( 694,337 ), style = wx.DEFAULT_FRAME_STYLE|wx.TAB_TRAVERSAL )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer28 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_panel30 = wx.Panel( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer30 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_richText2 = wx.richtext.RichTextCtrl( self.m_panel30, wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, wx.TE_READONLY|wx.HSCROLL|wx.VSCROLL|wx.WANTS_CHARS )
		bSizer30.Add( self.m_richText2, 1, wx.EXPAND |wx.ALL, 5 )
		
		self.m_panel31 = wx.Panel( self.m_panel30, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer31 = wx.BoxSizer( wx.VERTICAL )
		
		m_sdbSizer1 = wx.StdDialogButtonSizer()
		self.m_sdbSizer1OK = wx.Button( self.m_panel31, wx.ID_OK )
		m_sdbSizer1.AddButton( self.m_sdbSizer1OK )
		m_sdbSizer1.Realize();
		
		bSizer31.Add( m_sdbSizer1, 0, wx.EXPAND, 5 )
		
		
		self.m_panel31.SetSizer( bSizer31 )
		self.m_panel31.Layout()
		bSizer31.Fit( self.m_panel31 )
		bSizer30.Add( self.m_panel31, 0, wx.EXPAND |wx.ALL, 5 )
		
		
		self.m_panel30.SetSizer( bSizer30 )
		self.m_panel30.Layout()
		bSizer30.Fit( self.m_panel30 )
		bSizer28.Add( self.m_panel30, 1, wx.EXPAND |wx.ALL, 0 )
		
		
		self.SetSizer( bSizer28 )
		self.Layout()
		
		self.Centre( wx.BOTH )
	
	def __del__( self ):
		pass
	

###########################################################################
## Class FrameSelectDevice
###########################################################################

class FrameSelectDevice ( wx.Frame ):
	
	def __init__( self, parent ):
		wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = _(u"Pinguino IDE - Board Selector"), pos = wx.DefaultPosition, size = wx.Size( 701,344 ), style = wx.DEFAULT_FRAME_STYLE|wx.FRAME_TOOL_WINDOW|wx.STAY_ON_TOP|wx.TAB_TRAVERSAL )
		
		self.SetSizeHintsSz( wx.DefaultSize, wx.DefaultSize )
		
		bSizer39 = wx.BoxSizer( wx.VERTICAL )
		
		self.m_panel37 = wx.Panel( self, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer40 = wx.BoxSizer( wx.HORIZONTAL )
		
		self.m_panel38 = wx.Panel( self.m_panel37, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.TAB_TRAVERSAL )
		bSizer41 = wx.BoxSizer( wx.VERTICAL )
		
		radioBox_archChoices = [ _(u"8-bit"), _(u"32-bit") ]
		self.radioBox_arch = wx.RadioBox( self.m_panel38, wx.ID_ANY, _(u" Architecture"), wx.DefaultPosition, wx.DefaultSize, radioBox_archChoices, 1, wx.RA_SPECIFY_COLS )
		self.radioBox_arch.SetSelection( 0 )
		bSizer41.Add( self.radioBox_arch, 0, wx.ALL|wx.EXPAND, 5 )
		
		radioBox_modeChoices = [ _(u"ICSP"), _(u"USB Bootloader") ]
		self.radioBox_mode = wx.RadioBox( self.m_panel38, wx.ID_ANY, _(u"Programming Mode"), wx.DefaultPosition, wx.DefaultSize, radioBox_modeChoices, 1, wx.RA_SPECIFY_COLS )
		self.radioBox_mode.SetSelection( 0 )
		bSizer41.Add( self.radioBox_mode, 0, wx.ALL|wx.EXPAND, 5 )
		
		self.staticText_warningICSP = wx.StaticText( self.m_panel38, wx.ID_ANY, _(u"WARNING!! this mode can\noverwrite the bootloader code."), wx.DefaultPosition, wx.DefaultSize, 0 )
		self.staticText_warningICSP.Wrap( -1 )
		self.staticText_warningICSP.SetForegroundColour( wx.Colour( 255, 0, 0 ) )
		
		bSizer41.Add( self.staticText_warningICSP, 0, wx.ALL, 5 )
		
		
		bSizer41.AddSpacer( ( 0, 0), 1, wx.EXPAND, 5 )
		
		buttonBox = wx.StdDialogButtonSizer()
		self.buttonBoxOK = wx.Button( self.m_panel38, wx.ID_OK )
		buttonBox.AddButton( self.buttonBoxOK )
		self.buttonBoxCancel = wx.Button( self.m_panel38, wx.ID_CANCEL )
		buttonBox.AddButton( self.buttonBoxCancel )
		buttonBox.Realize();
		
		bSizer41.Add( buttonBox, 0, wx.ALL, 5 )
		
		
		self.m_panel38.SetSizer( bSizer41 )
		self.m_panel38.Layout()
		bSizer41.Fit( self.m_panel38 )
		bSizer40.Add( self.m_panel38, 0, wx.EXPAND |wx.ALL, 5 )
		
		self.sizer = wx.BoxSizer( wx.VERTICAL )
		
		radioBox_famChoices = [ _(u"XX"), _(u"XX"), _(u"XX"), _(u"XX") ]
		self.radioBox_fam = wx.RadioBox( self.m_panel37, wx.ID_ANY, _(u"Sort"), wx.DefaultPosition, wx.DefaultSize, radioBox_famChoices, 6, wx.RA_SPECIFY_COLS )
		self.radioBox_fam.SetSelection( 3 )
		self.sizer.Add( self.radioBox_fam, 0, wx.ALL|wx.EXPAND, 5 )
		
		self.m_scrolledWindow1 = wx.ScrolledWindow( self.m_panel37, wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, wx.HSCROLL|wx.VSCROLL )
		self.m_scrolledWindow1.SetScrollRate( 5, 5 )
		self.sizer2 = wx.BoxSizer( wx.VERTICAL )
		
		radioBox_devChoices = [ _(u"Device"), _(u"Device"), _(u"Device"), _(u"Device"), _(u"Device"), _(u"Device"), _(u"Device"), _(u"Device"), _(u"Device"), _(u"Device") ]
		self.radioBox_dev = wx.RadioBox( self.m_scrolledWindow1, wx.ID_ANY, _(u"Devices"), wx.DefaultPosition, wx.DefaultSize, radioBox_devChoices, 2, wx.RA_SPECIFY_COLS|wx.RA_SPECIFY_ROWS )
		self.radioBox_dev.SetSelection( 4 )
		self.sizer2.Add( self.radioBox_dev, 1, wx.ALL|wx.EXPAND, 5 )
		
		
		self.m_scrolledWindow1.SetSizer( self.sizer2 )
		self.m_scrolledWindow1.Layout()
		self.sizer2.Fit( self.m_scrolledWindow1 )
		self.sizer.Add( self.m_scrolledWindow1, 1, wx.EXPAND |wx.ALL, 0 )
		
		
		bSizer40.Add( self.sizer, 1, wx.EXPAND, 5 )
		
		
		self.m_panel37.SetSizer( bSizer40 )
		self.m_panel37.Layout()
		bSizer40.Fit( self.m_panel37 )
		bSizer39.Add( self.m_panel37, 1, wx.EXPAND |wx.ALL, 5 )
		
		
		self.SetSizer( bSizer39 )
		self.Layout()
		
		self.Centre( wx.BOTH )
	
	def __del__( self ):
		pass
	

