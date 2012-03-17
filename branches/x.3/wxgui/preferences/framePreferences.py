#Boa:Frame:FramePreferences

import wx

def create(parent):
    return FramePreferences(parent)

[wxID_FRAMEPREFERENCES, wxID_FRAMEPREFERENCESBUTTON_APPLY, 
 wxID_FRAMEPREFERENCESBUTTON_CLOSE, wxID_FRAMEPREFERENCESBUTTON_DEFAULT, 
 wxID_FRAMEPREFERENCESLISTBOX1, wxID_FRAMEPREFERENCESPANEL1, 
 wxID_FRAMEPREFERENCESPANEL2, wxID_FRAMEPREFERENCESPANEL3, 
 wxID_FRAMEPREFERENCESPANEL4, wxID_FRAMEPREFERENCESSASHWINDOW1, 
 wxID_FRAMEPREFERENCESSPLITTERWINDOW1, 
] = [wx.NewId() for _init_ctrls in range(11)]

class FramePreferences(wx.Frame):
    def _init_coll_gridSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.Button_default, 0, border=0,
              flag=wx.ALIGN_LEFT | wx.ALIGN_CENTER_VERTICAL)
        parent.AddWindow(self.panel4, 0, border=0,
              flag=wx.ALIGN_RIGHT | wx.ALIGN_CENTER_VERTICAL)

    def _init_coll_gridSizer2_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.Button_apply, 0, border=0,
              flag=wx.ALIGN_RIGHT | wx.ALIGN_CENTER_VERTICAL)
        parent.AddWindow(self.Button_close, 0, border=0,
              flag=wx.ALIGN_RIGHT | wx.ALIGN_CENTER_VERTICAL)

    def _init_coll_boxSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.panel2, 1, border=10, flag=wx.ALL | wx.EXPAND)

    def _init_coll_boxSizer2_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.splitterWindow1, 1, border=0, flag=wx.EXPAND)
        parent.AddWindow(self.panel3, 0, border=0, flag=wx.EXPAND)

    def _init_sizers(self):
        # generated method, don't edit
        self.boxSizer1 = wx.BoxSizer(orient=wx.VERTICAL)

        self.boxSizer2 = wx.BoxSizer(orient=wx.VERTICAL)

        self.gridSizer1 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self.gridSizer2 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self._init_coll_boxSizer1_Items(self.boxSizer1)
        self._init_coll_boxSizer2_Items(self.boxSizer2)
        self._init_coll_gridSizer1_Items(self.gridSizer1)
        self._init_coll_gridSizer2_Items(self.gridSizer2)

        self.panel1.SetSizer(self.boxSizer1)
        self.panel2.SetSizer(self.boxSizer2)
        self.panel3.SetSizer(self.gridSizer1)
        self.panel4.SetSizer(self.gridSizer2)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Frame.__init__(self, id=wxID_FRAMEPREFERENCES,
              name=u'FramePreferences', parent=prnt, pos=wx.Point(450, 64),
              size=wx.Size(682, 352), style=wx.DEFAULT_FRAME_STYLE,
              title=u'Preferences')
        self.SetClientSize(wx.Size(666, 314))

        self.panel1 = wx.Panel(id=wxID_FRAMEPREFERENCESPANEL1, name='panel1',
              parent=self, pos=wx.Point(0, 0), size=wx.Size(666, 314),
              style=wx.TAB_TRAVERSAL)

        self.panel2 = wx.Panel(id=wxID_FRAMEPREFERENCESPANEL2, name='panel2',
              parent=self.panel1, pos=wx.Point(10, 10), size=wx.Size(646, 294),
              style=wx.TAB_TRAVERSAL)
        self.panel2.SetMinSize(wx.Size(-1, -1))

        self.splitterWindow1 = wx.SplitterWindow(id=wxID_FRAMEPREFERENCESSPLITTERWINDOW1,
              name='splitterWindow1', parent=self.panel2, pos=wx.Point(0, 0),
              size=wx.Size(646, 268), style=wx.SP_3D)

        self.sashWindow1 = wx.SashWindow(id=wxID_FRAMEPREFERENCESSASHWINDOW1,
              name='sashWindow1', parent=self.splitterWindow1, pos=wx.Point(14,
              0), size=wx.Size(632, 268), style=wx.CLIP_CHILDREN | wx.SW_3D)
        self.sashWindow1.SetMinSize(wx.Size(1, 1))

        self.listBox1 = wx.ListBox(choices=[], id=wxID_FRAMEPREFERENCESLISTBOX1,
              name='listBox1', parent=self.splitterWindow1, pos=wx.Point(0, 0),
              size=wx.Size(10, 268), style=0)
        self.listBox1.SetMinSize(wx.Size(-1, -1))
        self.splitterWindow1.SplitVertically(self.listBox1, self.sashWindow1,
              165)

        self.panel3 = wx.Panel(id=wxID_FRAMEPREFERENCESPANEL3, name='panel3',
              parent=self.panel2, pos=wx.Point(0, 268), size=wx.Size(646, 26),
              style=wx.TAB_TRAVERSAL)
        self.panel3.SetMaxSize(wx.Size(-1, -1))
        self.panel3.SetMinSize(wx.Size(-1, 26))

        self.panel4 = wx.Panel(id=wxID_FRAMEPREFERENCESPANEL4, name='panel4',
              parent=self.panel3, pos=wx.Point(496, 0), size=wx.Size(150, 26),
              style=wx.TAB_TRAVERSAL)

        self.Button_apply = wx.Button(id=wxID_FRAMEPREFERENCESBUTTON_APPLY,
              label=u'Apply', name=u'Button_apply', parent=self.panel4,
              pos=wx.Point(0, 0), size=wx.Size(75, 26), style=0)

        self.Button_close = wx.Button(id=wxID_FRAMEPREFERENCESBUTTON_CLOSE,
              label=u'Close', name=u'Button_close', parent=self.panel4,
              pos=wx.Point(75, 0), size=wx.Size(75, 26), style=0)

        self.Button_default = wx.Button(id=wxID_FRAMEPREFERENCESBUTTON_DEFAULT,
              label=u'Restore Defaults', name=u'Button_default',
              parent=self.panel3, pos=wx.Point(0, 0), size=wx.Size(136, 27),
              style=0)

        self._init_sizers()

    def __init__(self, parent):
        self._init_ctrls(parent)
