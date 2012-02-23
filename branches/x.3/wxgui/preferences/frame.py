#Boa:Frame:preferences

import wx

def create(parent):
    return preferences(parent)

[wxID_PREFERENCES, wxID_PREFERENCESLISTBOOK1, wxID_PREFERENCESSASHWINDOW1, 
 wxID_PREFERENCESSASHWINDOW2, wxID_PREFERENCESSASHWINDOW3, 
 wxID_PREFERENCESSASHWINDOW4, wxID_PREFERENCESSASHWINDOW5, 
 wxID_PREFERENCESSASHWINDOW6, wxID_PREFERENCESSASHWINDOW7, 
] = [wx.NewId() for _init_ctrls in range(9)]

class preferences(wx.Frame):
    def _init_coll_listbook1_Pages(self, parent):
        # generated method, don't edit

        parent.AddPage(imageId=-1, page=self.sashWindow1, select=True,
              text=u'Source code Font/Size')
        parent.AddPage(imageId=-1, page=self.sashWindow2, select=True,
              text=u'Styles and Colors')
        parent.AddPage(imageId=-1, page=self.sashWindow3, select=True,
              text=u'Highligh')
        parent.AddPage(imageId=-1, page=self.sashWindow4, select=True,
              text=u'Auto-completion')
        parent.AddPage(imageId=-1, page=self.sashWindow5, select=True,
              text=u'Auto-insert')
        parent.AddPage(imageId=-1, page=self.sashWindow6, select=True,
              text=u'Open/Save files')
        parent.AddPage(imageId=-1, page=self.sashWindow7, select=True,
              text=u'Themes')

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Frame.__init__(self, id=wxID_PREFERENCES, name=u'preferences',
              parent=prnt, pos=wx.Point(286, 152), size=wx.Size(856, 452),
              style=wx.DEFAULT_FRAME_STYLE, title=u'Preferences')
        self.SetClientSize(wx.Size(840, 414))

        self.listbook1 = wx.Listbook(id=wxID_PREFERENCESLISTBOOK1,
              name='listbook1', parent=self, pos=wx.Point(0, 0),
              size=wx.Size(840, 414),
              style=wx.THICK_FRAME | wx.LB_DEFAULT | wx.ALWAYS_SHOW_SB)
        self.listbook1.SetInternalBorder(5)
        self.listbook1.SetControlMargin(0)

        self.sashWindow1 = wx.SashWindow(id=wxID_PREFERENCESSASHWINDOW1,
              name='sashWindow1', parent=self.listbook1, pos=wx.Point(0, 0),
              size=wx.Size(767, 414), style=wx.CLIP_CHILDREN | wx.SW_3D)
        self.sashWindow1.SetToolTipString(u'sashWindow1')
        self.sashWindow1.SetMinSize(wx.Size(-1, -1))

        self.sashWindow2 = wx.SashWindow(id=wxID_PREFERENCESSASHWINDOW2,
              name='sashWindow2', parent=self.listbook1, pos=wx.Point(0, 0),
              size=wx.Size(767, 414), style=wx.CLIP_CHILDREN | wx.SW_3D)
        self.sashWindow2.SetSashVisible(wx.SASH_BOTTOM, False)
        self.sashWindow2.SetSashVisible(wx.SASH_LEFT, False)
        self.sashWindow2.SetSashVisible(wx.SASH_RIGHT, False)
        self.sashWindow2.SetSashVisible(wx.SASH_TOP, False)

        self.sashWindow3 = wx.SashWindow(id=wxID_PREFERENCESSASHWINDOW3,
              name='sashWindow3', parent=self.listbook1, pos=wx.Point(0, 0),
              size=wx.Size(767, 414), style=wx.CLIP_CHILDREN | wx.SW_3D)

        self.sashWindow4 = wx.SashWindow(id=wxID_PREFERENCESSASHWINDOW4,
              name='sashWindow4', parent=self.listbook1, pos=wx.Point(0, 0),
              size=wx.Size(767, 414), style=wx.CLIP_CHILDREN | wx.SW_3D)

        self.sashWindow5 = wx.SashWindow(id=wxID_PREFERENCESSASHWINDOW5,
              name='sashWindow5', parent=self.listbook1, pos=wx.Point(0, 0),
              size=wx.Size(767, 414), style=wx.CLIP_CHILDREN | wx.SW_3D)
        self.sashWindow5.SetSashVisible(wx.SASH_BOTTOM, True)

        self.sashWindow6 = wx.SashWindow(id=wxID_PREFERENCESSASHWINDOW6,
              name='sashWindow6', parent=self.listbook1, pos=wx.Point(0, 0),
              size=wx.Size(767, 414), style=wx.CLIP_CHILDREN | wx.SW_3D)

        self.sashWindow7 = wx.SashWindow(id=wxID_PREFERENCESSASHWINDOW7,
              name='sashWindow7', parent=self.listbook1, pos=wx.Point(0, 0),
              size=wx.Size(767, 414), style=wx.CLIP_CHILDREN | wx.SW_3D)
        self.sashWindow7.SetSashVisible(wx.SASH_BOTTOM, False)

        self._init_coll_listbook1_Pages(self.listbook1)

    def __init__(self, parent):
        self._init_ctrls(parent)
