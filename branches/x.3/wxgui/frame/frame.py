#Boa:Frame:framePinguinoX

import wx
from wx.lib.anchors import LayoutAnchors

def create(parent):
    return framePinguinoX(parent)

[wxID_FRAMEPINGUINOX, wxID_FRAMEPINGUINOXPANEL1, wxID_FRAMEPINGUINOXPANEL2, 
 wxID_FRAMEPINGUINOXSPLITTERWINDOW1, wxID_FRAMEPINGUINOXTREECTRL1, 
] = [wx.NewId() for _init_ctrls in range(5)]

class framePinguinoX(wx.Frame):
    def _init_coll_gridSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.splitterWindow1, 0, border=0, flag=wx.EXPAND)

    def _init_coll_gridSizer2_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.panel2, 0, border=0, flag=wx.EXPAND)

    def _init_sizers(self):
        # generated method, don't edit
        self.gridSizer1 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self.gridSizer2 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self._init_coll_gridSizer1_Items(self.gridSizer1)
        self._init_coll_gridSizer2_Items(self.gridSizer2)

        self.panel1.SetSizer(self.gridSizer1)
        self.splitterWindow1.SetSizer(self.gridSizer2)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Frame.__init__(self, id=wxID_FRAMEPINGUINOX, name=u'framePinguinoX',
              parent=prnt, pos=wx.Point(274, 67), size=wx.Size(1141, 551),
              style=wx.DEFAULT_FRAME_STYLE, title=u'Frame1')
        self.SetClientSize(wx.Size(1125, 513))

        self.panel1 = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL1, name='panel1',
              parent=self, pos=wx.Point(0, 0), size=wx.Size(1125, 513),
              style=wx.TAB_TRAVERSAL)

        self.splitterWindow1 = wx.SplitterWindow(id=wxID_FRAMEPINGUINOXSPLITTERWINDOW1,
              name='splitterWindow1', parent=self.panel1, pos=wx.Point(0, 0),
              size=wx.Size(1125, 513), style=wx.SP_3D)
        self.splitterWindow1.SetSashSize(5)

        self.treeCtrl1 = wx.TreeCtrl(id=wxID_FRAMEPINGUINOXTREECTRL1,
              name='treeCtrl1', parent=self.splitterWindow1, pos=wx.Point(0, 0),
              size=wx.Size(150, 513), style=wx.TR_HAS_BUTTONS)
        self.treeCtrl1.SetMinSize(wx.Size(150, 545))
        self.treeCtrl1.SetBackgroundStyle(wx.BG_STYLE_CUSTOM)

        self.panel2 = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL2, name='panel2',
              parent=self.splitterWindow1, pos=wx.Point(155, 0),
              size=wx.Size(970, 513), style=wx.TAB_TRAVERSAL)
        self.panel2.SetBackgroundColour(wx.Colour(175, 200, 225))
        self.panel2.SetMinSize(wx.Size(50, 50))
        self.splitterWindow1.SplitVertically(self.treeCtrl1, self.panel2, 118)

        self._init_sizers()

    def __init__(self, parent):
        self._init_ctrls(parent)
