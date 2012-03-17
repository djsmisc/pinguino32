#Boa:FramePanel:appearance

import wx

[wxID_APPEARANCE, wxID_APPEARANCECOMBOBOX1_THEME, wxID_APPEARANCEPANEL1, 
 wxID_APPEARANCEPANEL2, wxID_APPEARANCESTATICLINE1, 
 wxID_APPEARANCESTATICTEXT1, wxID_APPEARANCESTATICTEXT2, 
] = [wx.NewId() for _init_ctrls in range(7)]

class appearance(wx.Panel):
    def _init_coll_flexGridSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.staticText2, 0, border=0,
              flag=wx.ALIGN_CENTER_VERTICAL)
        parent.AddWindow(self.comboBox1_theme, 0, border=0, flag=wx.GROW)

    def _init_coll_flexGridSizer1_Growables(self, parent):
        # generated method, don't edit

        parent.AddGrowableCol(1)
        parent.AddGrowableCol(2)
        parent.AddGrowableCol(3)

    def _init_coll_boxSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.staticText1, 0, border=0, flag=wx.EXPAND)
        parent.AddWindow(self.staticLine1, 0, border=0, flag=wx.EXPAND)
        parent.AddWindow(self.panel1, 1, border=0, flag=wx.EXPAND)

    def _init_coll_boxSizer2_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.panel2, 1, border=5, flag=wx.ALL | wx.EXPAND)

    def _init_sizers(self):
        # generated method, don't edit
        self.boxSizer1 = wx.BoxSizer(orient=wx.VERTICAL)

        self.boxSizer2 = wx.BoxSizer(orient=wx.VERTICAL)

        self.flexGridSizer1 = wx.FlexGridSizer(cols=2, hgap=0, rows=2, vgap=0)

        self._init_coll_boxSizer1_Items(self.boxSizer1)
        self._init_coll_boxSizer2_Items(self.boxSizer2)
        self._init_coll_flexGridSizer1_Items(self.flexGridSizer1)
        self._init_coll_flexGridSizer1_Growables(self.flexGridSizer1)

        self.SetSizer(self.boxSizer1)
        self.panel1.SetSizer(self.boxSizer2)
        self.panel2.SetSizer(self.flexGridSizer1)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Panel.__init__(self, id=wxID_APPEARANCE, name=u'appearance',
              parent=prnt, pos=wx.Point(669, 19), size=wx.Size(640, 311),
              style=wx.TAB_TRAVERSAL)
        self.SetClientSize(wx.Size(624, 273))

        self.staticText1 = wx.StaticText(id=wxID_APPEARANCESTATICTEXT1,
              label=u'Appearance', name='staticText1', parent=self,
              pos=wx.Point(0, 0), size=wx.Size(624, 21), style=0)
        self.staticText1.SetFont(wx.Font(13, wx.SWISS, wx.NORMAL, wx.BOLD,
              False, u'MS Shell Dlg 2'))

        self.staticLine1 = wx.StaticLine(id=wxID_APPEARANCESTATICLINE1,
              name='staticLine1', parent=self, pos=wx.Point(0, 21),
              size=wx.Size(624, 2), style=0)

        self.panel1 = wx.Panel(id=wxID_APPEARANCEPANEL1, name='panel1',
              parent=self, pos=wx.Point(0, 23), size=wx.Size(624, 250),
              style=wx.TAB_TRAVERSAL)

        self.panel2 = wx.Panel(id=wxID_APPEARANCEPANEL2, name='panel2',
              parent=self.panel1, pos=wx.Point(5, 5), size=wx.Size(614, 240),
              style=wx.TAB_TRAVERSAL)

        self.staticText2 = wx.StaticText(id=wxID_APPEARANCESTATICTEXT2,
              label=u'Theme', name='staticText2', parent=self.panel2,
              pos=wx.Point(0, 6), size=wx.Size(66, 13), style=0)
        self.staticText2.SetMinSize(wx.Size(66, 13))

        self.comboBox1_theme = wx.ComboBox(choices=[],
              id=wxID_APPEARANCECOMBOBOX1_THEME, name=u'comboBox1_theme',
              parent=self.panel2, pos=wx.Point(66, 0), size=wx.Size(548, 21),
              style=0, value=u'')
        self.comboBox1_theme.SetMinSize(wx.Size(-1, 26))
        self.comboBox1_theme.SetLabel(u'')

        self._init_sizers()

    def __init__(self, parent, id, pos, size, style, name):
        self._init_ctrls(parent)
