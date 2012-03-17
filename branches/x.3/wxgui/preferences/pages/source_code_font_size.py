#Boa:FramePanel:PanelSourceCode

import wx

[wxID_PANELSOURCECODE, wxID_PANELSOURCECODEBUTTON_FONT, 
 wxID_PANELSOURCECODEPANEL1, wxID_PANELSOURCECODEPANEL2, 
 wxID_PANELSOURCECODERADIOBUTTON_DEFAULT, 
 wxID_PANELSOURCECODERADIOBUTTON_SELECTED, wxID_PANELSOURCECODESPINCTRL1, 
 wxID_PANELSOURCECODESTATICLINE1, wxID_PANELSOURCECODESTATICTEXT1, 
 wxID_PANELSOURCECODESTATICTEXT2, wxID_PANELSOURCECODETEXTCTRL1, 
] = [wx.NewId() for _init_ctrls in range(11)]

class PanelSourceCode(wx.Panel):
    def _init_coll_flexGridSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddWindow(self.radioButton_default, 1, border=0,
              flag=wx.EXPAND | wx.ALIGN_CENTER_VERTICAL)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddWindow(self.radioButton_selected, 1, border=0,
              flag=wx.EXPAND | wx.ALIGN_CENTER_VERTICAL)
        parent.AddWindow(self.textCtrl1, 0, border=0,
              flag=wx.ALIGN_CENTER_VERTICAL | wx.GROW)
        parent.AddWindow(self.button_font, 0, border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddWindow(self.staticText2, 0, border=0,
              flag=wx.ALIGN_CENTER_VERTICAL)
        parent.AddWindow(self.spinCtrl1, 0, border=0,
              flag=wx.EXPAND | wx.ALIGN_CENTER_VERTICAL | wx.GROW)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)

    def _init_coll_flexGridSizer1_Growables(self, parent):
        # generated method, don't edit

        parent.AddGrowableRow(0)
        parent.AddGrowableRow(4)
        parent.AddGrowableRow(6)
        parent.AddGrowableCol(1)

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

        self.flexGridSizer1 = wx.FlexGridSizer(cols=3, hgap=0, rows=7, vgap=0)

        self._init_coll_boxSizer1_Items(self.boxSizer1)
        self._init_coll_boxSizer2_Items(self.boxSizer2)
        self._init_coll_flexGridSizer1_Items(self.flexGridSizer1)
        self._init_coll_flexGridSizer1_Growables(self.flexGridSizer1)

        self.SetSizer(self.boxSizer1)
        self.panel1.SetSizer(self.boxSizer2)
        self.panel2.SetSizer(self.flexGridSizer1)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Panel.__init__(self, id=wxID_PANELSOURCECODE,
              name=u'PanelSourceCode', parent=prnt, pos=wx.Point(408, 95),
              size=wx.Size(646, 364), style=wx.TAB_TRAVERSAL)
        self.SetClientSize(wx.Size(630, 326))

        self.staticText1 = wx.StaticText(id=wxID_PANELSOURCECODESTATICTEXT1,
              label=u'Source Code Font/Size', name='staticText1', parent=self,
              pos=wx.Point(0, 0), size=wx.Size(630, 21), style=0)
        self.staticText1.SetFont(wx.Font(13, wx.SWISS, wx.NORMAL, wx.BOLD,
              False, u'MS Shell Dlg 2'))

        self.staticLine1 = wx.StaticLine(id=wxID_PANELSOURCECODESTATICLINE1,
              name='staticLine1', parent=self, pos=wx.Point(0, 21),
              size=wx.Size(630, 2), style=0)

        self.panel1 = wx.Panel(id=wxID_PANELSOURCECODEPANEL1, name='panel1',
              parent=self, pos=wx.Point(0, 23), size=wx.Size(630, 303),
              style=wx.TAB_TRAVERSAL)

        self.panel2 = wx.Panel(id=wxID_PANELSOURCECODEPANEL2, name='panel2',
              parent=self.panel1, pos=wx.Point(5, 5), size=wx.Size(620, 293),
              style=wx.TAB_TRAVERSAL)

        self.radioButton_default = wx.RadioButton(id=wxID_PANELSOURCECODERADIOBUTTON_DEFAULT,
              label=u'Use default', name=u'radioButton_default',
              parent=self.panel2, pos=wx.Point(0, 69), size=wx.Size(120, 26),
              style=0)
        self.radioButton_default.SetValue(True)
        self.radioButton_default.SetMinSize(wx.Size(104, 26))

        self.staticText2 = wx.StaticText(id=wxID_PANELSOURCECODESTATICTEXT2,
              label=u'Tab size', name='staticText2', parent=self.panel2,
              pos=wx.Point(0, 202), size=wx.Size(120, 18), style=0)
        self.staticText2.SetMinSize(wx.Size(120, 18))
        self.staticText2.Center(wx.VERTICAL)
        self.staticText2.SetAutoLayout(False)
        self.staticText2.SetHelpText(u'')

        self.spinCtrl1 = wx.SpinCtrl(id=wxID_PANELSOURCECODESPINCTRL1,
              initial=0, max=100, min=0, name='spinCtrl1', parent=self.panel2,
              pos=wx.Point(120, 198), size=wx.Size(460, 26),
              style=wx.SP_ARROW_KEYS)
        self.spinCtrl1.SetMinSize(wx.Size(-1, 26))

        self.radioButton_selected = wx.RadioButton(id=wxID_PANELSOURCECODERADIOBUTTON_SELECTED,
              label=u'Use selected', name=u'radioButton_selected',
              parent=self.panel2, pos=wx.Point(0, 103), size=wx.Size(120, 26),
              style=0)
        self.radioButton_selected.SetValue(False)
        self.radioButton_selected.SetMinSize(wx.Size(80, 26))

        self.textCtrl1 = wx.TextCtrl(id=wxID_PANELSOURCECODETEXTCTRL1,
              name='textCtrl1', parent=self.panel2, pos=wx.Point(120, 103),
              size=wx.Size(460, 26), style=0, value='textCtrl1')
        self.textCtrl1.SetMinSize(wx.Size(-1, 26))

        self.button_font = wx.Button(id=wxID_PANELSOURCECODEBUTTON_FONT,
              label=u'...', name=u'button_font', parent=self.panel2,
              pos=wx.Point(580, 103), size=wx.Size(40, 26), style=0)
        self.button_font.SetMinSize(wx.Size(40, 26))

        self._init_sizers()

    def __init__(self, parent, id, pos, size, style, name):
        self._init_ctrls(parent)
