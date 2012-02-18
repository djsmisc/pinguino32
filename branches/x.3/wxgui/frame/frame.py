#Boa:Frame:framePinguinoX

import wx
import wx.stc
from wx.lib.anchors import LayoutAnchors

def create(parent):
    return framePinguinoX(parent)

[wxID_FRAMEPINGUINOX, wxID_FRAMEPINGUINOXFINDNEXT, 
 wxID_FRAMEPINGUINOXFINDPREVIOUS, wxID_FRAMEPINGUINOXFINDTEXT, 
 wxID_FRAMEPINGUINOXNOTEBOOK1, wxID_FRAMEPINGUINOXPANEL1, 
 wxID_FRAMEPINGUINOXPANEL2, wxID_FRAMEPINGUINOXPANEL_FIND, 
 wxID_FRAMEPINGUINOXPANEL_REPLACE, wxID_FRAMEPINGUINOXREPLACE, 
 wxID_FRAMEPINGUINOXREPLACEALL, wxID_FRAMEPINGUINOXREPLACETEXT, 
 wxID_FRAMEPINGUINOXSPLITTERWINDOW1, wxID_FRAMEPINGUINOXSTATUSBAR1, 
 wxID_FRAMEPINGUINOXTREECTRL1, 
] = [wx.NewId() for _init_ctrls in range(15)]

class framePinguinoX(wx.Frame):
    def _init_coll_gridSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.notebook1, 0, border=0, flag=wx.EXPAND)

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

    def _init_coll_statusBar1_Fields(self, parent):
        # generated method, don't edit
        parent.SetFieldsCount(4)

        parent.SetStatusText(number=0, text=u'')
        parent.SetStatusText(number=1, text=u'')
        parent.SetStatusText(number=2, text=u'')
        parent.SetStatusText(number=3, text=u'Board')

        parent.SetStatusWidths([-1, -1, -1, -3])

    def _init_sizers(self):
        # generated method, don't edit
        self.boxSizer2 = wx.BoxSizer(orient=wx.HORIZONTAL)

        self.boxSizer1 = wx.BoxSizer(orient=wx.VERTICAL)

        self.boxSizer3 = wx.BoxSizer(orient=wx.HORIZONTAL)
        self.boxSizer3.SetMinSize(wx.Size(360, 25))

        self.gridSizer1 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self._init_coll_boxSizer2_Items(self.boxSizer2)
        self._init_coll_boxSizer1_Items(self.boxSizer1)
        self._init_coll_boxSizer3_Items(self.boxSizer3)
        self._init_coll_gridSizer1_Items(self.gridSizer1)

        self.panel_find.SetSizer(self.boxSizer2)
        self.panel_replace.SetSizer(self.boxSizer3)
        self.panel1.SetSizer(self.boxSizer1)
        self.panel2.SetSizer(self.gridSizer1)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Frame.__init__(self, id=wxID_FRAMEPINGUINOX, name=u'framePinguinoX',
              parent=prnt, pos=wx.Point(328, 76), size=wx.Size(1116, 575),
              style=wx.DEFAULT_FRAME_STYLE, title=u'Frame1')
        self.SetClientSize(wx.Size(1100, 537))
        self.SetStatusBarPane(0)
        self.SetHelpText(u'')

        self.panel1 = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL1, name='panel1',
              parent=self, pos=wx.Point(0, 0), size=wx.Size(1100, 514),
              style=wx.TAB_TRAVERSAL)

        self.splitterWindow1 = wx.SplitterWindow(id=wxID_FRAMEPINGUINOXSPLITTERWINDOW1,
              name='splitterWindow1', parent=self.panel1, pos=wx.Point(0, 70),
              size=wx.Size(1100, 444), style=wx.SP_3D)
        self.splitterWindow1.SetSashSize(5)

        self.treeCtrl1 = wx.TreeCtrl(id=wxID_FRAMEPINGUINOXTREECTRL1,
              name='treeCtrl1', parent=self.splitterWindow1, pos=wx.Point(0, 0),
              size=wx.Size(150, 444), style=wx.TR_HAS_BUTTONS)
        self.treeCtrl1.SetMinSize(wx.Size(150, 545))
        self.treeCtrl1.SetBackgroundStyle(wx.BG_STYLE_CUSTOM)

        self.panel2 = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL2, name='panel2',
              parent=self.splitterWindow1, pos=wx.Point(155, 0),
              size=wx.Size(945, 444), style=wx.TAB_TRAVERSAL)
        self.panel2.SetBackgroundColour(wx.Colour(175, 200, 225))
        self.panel2.SetMinSize(wx.Size(50, 50))
        self.splitterWindow1.SplitVertically(self.treeCtrl1, self.panel2, 118)

        self.panel_find = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL_FIND,
              name=u'panel_find', parent=self.panel1, pos=wx.Point(0, 0),
              size=wx.Size(1100, 35), style=wx.TAB_TRAVERSAL)
        self.panel_find.SetMinSize(wx.Size(1125, 35))

        self.FindPrevious = wx.Button(id=wxID_FRAMEPINGUINOXFINDPREVIOUS,
              label=u'Previous', name=u'FindPrevious', parent=self.panel_find,
              pos=wx.Point(176, 5), size=wx.Size(96, 25), style=0)

        self.FindNext = wx.Button(id=wxID_FRAMEPINGUINOXFINDNEXT, label=u'Next',
              name=u'FindNext', parent=self.panel_find, pos=wx.Point(280, 5),
              size=wx.Size(96, 25), style=0)

        self.panel_replace = wx.Panel(id=wxID_FRAMEPINGUINOXPANEL_REPLACE,
              name=u'panel_replace', parent=self.panel1, pos=wx.Point(0, 35),
              size=wx.Size(1100, 35), style=wx.TAB_TRAVERSAL)
        self.panel_replace.SetMinSize(wx.Size(1125, 35))

        self.ReplaceAll = wx.Button(id=wxID_FRAMEPINGUINOXREPLACEALL,
              label=u'Replace all', name=u'ReplaceAll',
              parent=self.panel_replace, pos=wx.Point(280, 5), size=wx.Size(96,
              25), style=0)
        self.ReplaceAll.Bind(wx.EVT_BUTTON, self.OnButton1Button,
              id=wxID_FRAMEPINGUINOXREPLACEALL)

        self.Replace = wx.Button(id=wxID_FRAMEPINGUINOXREPLACE,
              label=u'Replace', name=u'Replace', parent=self.panel_replace,
              pos=wx.Point(176, 5), size=wx.Size(96, 25), style=0)
        self.Replace.SetMinSize(wx.Size(96, 25))
        self.Replace.Bind(wx.EVT_BUTTON, self.OnButton2Button,
              id=wxID_FRAMEPINGUINOXREPLACE)

        self.FindText = wx.SearchCtrl(id=wxID_FRAMEPINGUINOXFINDTEXT,
              name=u'FindText', parent=self.panel_find, pos=wx.Point(16, 5),
              size=wx.Size(144, 25), style=0, value=u'Search')
        self.FindText.ShowCancelButton(True)
        self.FindText.ShowSearchButton(False)

        self.ReplaceText = wx.SearchCtrl(id=wxID_FRAMEPINGUINOXREPLACETEXT,
              name=u'ReplaceText', parent=self.panel_replace, pos=wx.Point(16,
              5), size=wx.Size(144, 25), style=0, value=u'Replace')
        self.ReplaceText.ShowSearchButton(False)

        self.statusBar1 = wx.StatusBar(id=wxID_FRAMEPINGUINOXSTATUSBAR1,
              name='statusBar1', parent=self, style=wx.RAISED_BORDER)
        self._init_coll_statusBar1_Fields(self.statusBar1)
        self.SetStatusBar(self.statusBar1)

        self.notebook1 = wx.Notebook(id=wxID_FRAMEPINGUINOXNOTEBOOK1,
              name='notebook1', parent=self.panel2, pos=wx.Point(0, 0),
              size=wx.Size(945, 444), style=0)
        self.notebook1.SetMinSize(wx.Size(-1, -1))

        self._init_sizers()

    def __init__(self, parent):
        self._init_ctrls(parent)

    def OnButton1Button(self, event):
        event.Skip()

    def OnButton2Button(self, event):
        event.Skip()
