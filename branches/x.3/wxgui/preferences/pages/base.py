#Boa:FramePanel:highligh

import wx

[wxID_HIGHLIGH, wxID_HIGHLIGHPANEL1, wxID_HIGHLIGHPANEL2, 
 wxID_HIGHLIGHSTATICLINE1, wxID_HIGHLIGHSTATICTEXT1, 
] = [wx.NewId() for _init_ctrls in range(5)]

class highligh(wx.Panel):
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

        self._init_coll_boxSizer1_Items(self.boxSizer1)
        self._init_coll_boxSizer2_Items(self.boxSizer2)

        self.SetSizer(self.boxSizer1)
        self.panel1.SetSizer(self.boxSizer2)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Panel.__init__(self, id=wxID_HIGHLIGH, name=u'highligh', parent=prnt,
              pos=wx.Point(454, 251), size=wx.Size(639, 311),
              style=wx.TAB_TRAVERSAL)
        self.SetClientSize(wx.Size(623, 273))

        self.staticText1 = wx.StaticText(id=wxID_HIGHLIGHSTATICTEXT1,
              label=u'Base', name='staticText1', parent=self, pos=wx.Point(0,
              0), size=wx.Size(41, 21), style=0)
        self.staticText1.SetFont(wx.Font(13, wx.SWISS, wx.NORMAL, wx.BOLD,
              False, u'MS Shell Dlg 2'))

        self.staticLine1 = wx.StaticLine(id=wxID_HIGHLIGHSTATICLINE1,
              name='staticLine1', parent=self, pos=wx.Point(0, 21),
              size=wx.Size(623, 2), style=0)

        self.panel1 = wx.Panel(id=wxID_HIGHLIGHPANEL1, name='panel1',
              parent=self, pos=wx.Point(0, 23), size=wx.Size(623, 250),
              style=wx.TAB_TRAVERSAL)

        self.panel2 = wx.Panel(id=wxID_HIGHLIGHPANEL2, name='panel2',
              parent=self.panel1, pos=wx.Point(5, 5), size=wx.Size(613, 240),
              style=wx.TAB_TRAVERSAL)

        self._init_sizers()

    def __init__(self, parent, id, pos, size, style, name):
        self._init_ctrls(parent)
