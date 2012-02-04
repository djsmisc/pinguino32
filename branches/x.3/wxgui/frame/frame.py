#Boa:Frame:framePinguinoX

import wx
from wx.lib.anchors import LayoutAnchors

def create(parent):
    return framePinguinoX(parent)

[wxID_FRAMEPINGUINOX, wxID_FRAMEPINGUINOXFINDNEXT, 
 wxID_FRAMEPINGUINOXFINDPREVIOUS, wxID_FRAMEPINGUINOXFINDTEXT, 
 wxID_FRAMEPINGUINOXPANEL1, wxID_FRAMEPINGUINOXPANEL2, 
 wxID_FRAMEPINGUINOXPANEL_FIND, wxID_FRAMEPINGUINOXPANEL_REPLACE, 
 wxID_FRAMEPINGUINOXREPLACE, wxID_FRAMEPINGUINOXREPLACEALL, 
 wxID_FRAMEPINGUINOXREPLACETEXT, wxID_FRAMEPINGUINOXSPLITTERWINDOW1, 
 wxID_FRAMEPINGUINOXTREECTRL1, 
] = [wx.NewId() for _init_ctrls in range(13)]

class framePinguinoX(wx.Frame):
    def _init_coll_gridSizer2_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.panel2, 0, border=0, flag=wx.EXPAND)

    def _init_coll_boxSizer3_Items(self, parent):
        # generated method, don't edit

        parent.AddSpacer(wx.Size(16, 8), border=0, flag=0)
        parent.AddWindow(self.ReplaceText, 0, border=0,
              flag=wx.ALIGN_CENTER_VERTICAL)
        parent.AddSpacer(wx.Size(16, 8), border=0, flag=0)
        parent.AddWindow(self.Replace, 0, border=0,
              flag=wx.ALIGN_CENTER_VERTICAL)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddWindow(self.ReplaceAll, 0, border=0,
              flag=wx.ALIGN_CENTER_VERTICAL)

    def _init_coll_boxSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.panel_find, 0, border=0, flag=wx.EXPAND | wx.TOP)
        parent.AddWindow(self.panel_replace, 0, border=0,
              flag=wx.EXPAND | wx.TOP)
        parent.AddWindow(self.splitterWindow1, 1, border=0, flag=wx.EXPAND)

    def _init_coll_boxSizer2_Items(self, parent):
        # generated method, don't edit

        parent.AddSpacer(wx.Size(16, 8), border=0, flag=0)
        parent.AddWindow(self.FindText, 0, border=0,
              flag=wx.ALIGN_CENTER_VERTICAL)
        parent.AddSpacer(wx.Size(16, 8), border=0, flag=0)
        parent.AddWindow(self.FindPrevious, 0, border=0,
              flag=wx.ALIGN_CENTER_VERTICAL)
        parent.AddSpacer(wx.Size(8, 8), border=0, flag=0)
        parent.AddWindow(self.FindNext, 0, border=0,
              flag=wx.ALIGN_CENTER_VERTICAL)

    def _init_sizers(self):
        # generated method, don't edit
        self.gridSizer2 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self.boxSizer2 = wx.BoxSizer(orient=wx.HORIZONTAL)

        self.boxSizer1 = wx.BoxSizer(orient=wx.VERTICAL)

        self.boxSizer3 = wx.BoxSizer(orient=wx.HORIZONTAL)
        self.boxSizer3.SetMinSize(wx.Size(250, 25))

        self._init_coll_gridSizer2_Items(self.gridSizer2)
        self._init_coll_boxSizer2_Items(self.boxSizer2)
        self._init_coll_boxSizer1_Items(self.boxSizer1)
        self._init_coll_boxSizer3_Items(self.boxSizer3)

        self.panel1.SetSizer(self.boxSizer1)
        self.panel_find.SetSizer(self.boxSizer2)
        self.splitterWindow1.SetSizer(self.gridSizer2)
        self.panel_replace.SetSizer(self.boxSizer3)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Frame.__init__(self, id=wxID_FRAMEPINGUINOX, name=u'framePinguinoX',
              parent=prnt, pos=wx.Point(197, 125), size=wx.Size(1141, 495),
              style=wx.DEFAULT_FRAME_STYLE, title=u'Frame1')
        self.SetClientSize(wx.Size(1125, 457))

        self.panel1 = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL1, name='panel1',
              parent=self, pos=wx.Point(0, 0), size=wx.Size(1125, 457),
              style=wx.TAB_TRAVERSAL)

        self.splitterWindow1 = wx.SplitterWindow(id=wxID_FRAMEPINGUINOXSPLITTERWINDOW1,
              name='splitterWindow1', parent=self.panel1, pos=wx.Point(0, 70),
              size=wx.Size(1125, 387), style=wx.SP_3D)
        self.splitterWindow1.SetSashSize(5)

        self.treeCtrl1 = wx.TreeCtrl(id=wxID_FRAMEPINGUINOXTREECTRL1,
              name='treeCtrl1', parent=self.splitterWindow1, pos=wx.Point(0, 0),
              size=wx.Size(150, 387), style=wx.TR_HAS_BUTTONS)
        self.treeCtrl1.SetMinSize(wx.Size(150, 545))
        self.treeCtrl1.SetBackgroundStyle(wx.BG_STYLE_CUSTOM)

        self.panel2 = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL2, name='panel2',
              parent=self.splitterWindow1, pos=wx.Point(155, 0),
              size=wx.Size(970, 387), style=wx.TAB_TRAVERSAL)
        self.panel2.SetBackgroundColour(wx.Colour(175, 200, 225))
        self.panel2.SetMinSize(wx.Size(50, 50))
        self.splitterWindow1.SplitVertically(self.treeCtrl1, self.panel2, 118)

        self.panel_find = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL_FIND,
              name=u'panel_find', parent=self.panel1, pos=wx.Point(0, 0),
              size=wx.Size(1125, 35), style=wx.TAB_TRAVERSAL)
        self.panel_find.SetMinSize(wx.Size(1125, 35))

        self.FindText = wx.TextCtrl(id=wxID_FRAMEPINGUINOXFINDTEXT,
              name=u'FindText', parent=self.panel_find, pos=wx.Point(16, 5),
              size=wx.Size(160, 25), style=0, value=u'')

        self.FindPrevious = wx.Button(id=wxID_FRAMEPINGUINOXFINDPREVIOUS,
              label=u'Previous', name=u'FindPrevious', parent=self.panel_find,
              pos=wx.Point(192, 5), size=wx.Size(96, 25), style=0)

        self.FindNext = wx.Button(id=wxID_FRAMEPINGUINOXFINDNEXT, label=u'Next',
              name=u'FindNext', parent=self.panel_find, pos=wx.Point(296, 5),
              size=wx.Size(104, 25), style=0)

        self.panel_replace = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL_REPLACE,
              name=u'panel_replace', parent=self.panel1, pos=wx.Point(0, 35),
              size=wx.Size(1125, 35), style=wx.TAB_TRAVERSAL)
        self.panel_replace.SetMinSize(wx.Size(1125, 35))

        self.ReplaceText = wx.TextCtrl(id=wxID_FRAMEPINGUINOXREPLACETEXT,
              name=u'ReplaceText', parent=self.panel_replace, pos=wx.Point(16,
              5), size=wx.Size(161, 25), style=0, value=u'')

        self.ReplaceAll = wx.Button(id=wxID_FRAMEPINGUINOXREPLACEALL,
              label=u'Replace all', name=u'ReplaceAll',
              parent=self.panel_replace, pos=wx.Point(297, 5), size=wx.Size(103,
              25), style=0)
        self.ReplaceAll.Bind(wx.EVT_BUTTON, self.OnButton1Button,
              id=wxID_FRAMEPINGUINOXREPLACEALL)

        self.Replace = wx.Button(id=wxID_FRAMEPINGUINOXREPLACE,
              label=u'Replace', name=u'Replace', parent=self.panel_replace,
              pos=wx.Point(193, 5), size=wx.Size(96, 25), style=0)
        self.Replace.SetMinSize(wx.Size(96, 25))
        self.Replace.Bind(wx.EVT_BUTTON, self.OnButton2Button,
              id=wxID_FRAMEPINGUINOXREPLACE)

        self._init_sizers()

    def __init__(self, parent):
        self._init_ctrls(parent)

    def OnButton1Button(self, event):
        event.Skip()

    def OnButton2Button(self, event):
        event.Skip()
