#Boa:Frame:keywordFrame

import wx
import wx.richtext
import wx.html

def create(parent):
    return keywordFrame(parent)

[wxID_KEYWORDFRAME, wxID_KEYWORDFRAMECHECKLISTBOX1, wxID_KEYWORDFRAMELISTBOX1, 
 wxID_KEYWORDFRAMERICHTEXTCTRL1, wxID_KEYWORDFRAMESASHWINDOW1, 
 wxID_KEYWORDFRAMESASHWINDOW2, wxID_KEYWORDFRAMESASHWINDOW3, 
 wxID_KEYWORDFRAMESPLITTERWINDOW1, wxID_KEYWORDFRAMESPLITTERWINDOW2, 
] = [wx.NewId() for _init_ctrls in range(9)]

class keywordFrame(wx.Frame):
    def _init_coll_gridSizer4_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.checkListBox1, 0, border=0, flag=wx.EXPAND)

    def _init_coll_gridSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.splitterWindow1, 0, border=0, flag=wx.EXPAND)

    def _init_coll_gridSizer2_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.richTextCtrl1, 1, border=0, flag=wx.EXPAND)

    def _init_coll_gridSizer3_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.listBox1, 1, border=0, flag=wx.EXPAND)

    def _init_sizers(self):
        # generated method, don't edit
        self.gridSizer1 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self.gridSizer2 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self.gridSizer3 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self.gridSizer4 = wx.GridSizer(cols=0, hgap=0, rows=1, vgap=0)

        self._init_coll_gridSizer1_Items(self.gridSizer1)
        self._init_coll_gridSizer2_Items(self.gridSizer2)
        self._init_coll_gridSizer3_Items(self.gridSizer3)
        self._init_coll_gridSizer4_Items(self.gridSizer4)

        self.SetSizer(self.gridSizer1)
        self.sashWindow1.SetSizer(self.gridSizer4)
        self.sashWindow2.SetSizer(self.gridSizer3)
        self.sashWindow3.SetSizer(self.gridSizer2)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Frame.__init__(self, id=wxID_KEYWORDFRAME, name=u'keywordFrame',
              parent=prnt, pos=wx.Point(348, 77), size=wx.Size(884, 473),
              style=wx.DEFAULT_FRAME_STYLE, title=u'Pinguino Functions')
        self.SetClientSize(wx.Size(868, 435))

        self.splitterWindow1 = wx.SplitterWindow(id=wxID_KEYWORDFRAMESPLITTERWINDOW1,
              name='splitterWindow1', parent=self, pos=wx.Point(0, 0),
              size=wx.Size(868, 435), style=wx.SP_3D)

        self.splitterWindow2 = wx.SplitterWindow(id=wxID_KEYWORDFRAMESPLITTERWINDOW2,
              name='splitterWindow2', parent=self.splitterWindow1,
              pos=wx.Point(14, 0), size=wx.Size(854, 435), style=wx.SP_3D)

        self.sashWindow1 = wx.SashWindow(id=wxID_KEYWORDFRAMESASHWINDOW1,
              name='sashWindow1', parent=self.splitterWindow1, pos=wx.Point(0,
              0), size=wx.Size(10, 435), style=wx.CLIP_CHILDREN | wx.SW_3D)
        self.splitterWindow1.SplitVertically(self.sashWindow1,
              self.splitterWindow2, 200)

        self.sashWindow2 = wx.SashWindow(id=wxID_KEYWORDFRAMESASHWINDOW2,
              name='sashWindow2', parent=self.splitterWindow2, pos=wx.Point(0,
              0), size=wx.Size(10, 435), style=wx.CLIP_CHILDREN | wx.SW_3D)

        self.sashWindow3 = wx.SashWindow(id=wxID_KEYWORDFRAMESASHWINDOW3,
              name='sashWindow3', parent=self.splitterWindow2, pos=wx.Point(14,
              0), size=wx.Size(840, 435), style=wx.CLIP_CHILDREN | wx.SW_3D)
        self.splitterWindow2.SplitVertically(self.sashWindow2, self.sashWindow3,
              200)

        self.listBox1 = wx.ListBox(choices=[], id=wxID_KEYWORDFRAMELISTBOX1,
              name='listBox1', parent=self.sashWindow2, pos=wx.Point(0, 0),
              size=wx.Size(10, 435), style=wx.VSCROLL)
        self.listBox1.SetMinSize(wx.Size(-1, -1))

        self.richTextCtrl1 = wx.richtext.RichTextCtrl(id=wxID_KEYWORDFRAMERICHTEXTCTRL1,
              parent=self.sashWindow3, pos=wx.Point(0, 0), size=wx.Size(840,
              435), style=wx.HSCROLL | wx.VSCROLL | wx.richtext.RE_MULTILINE,
              value=u' ')
        self.richTextCtrl1.SetMinSize(wx.Size(-1, -1))
        self.richTextCtrl1.SetLabel(u'richText')
        self.richTextCtrl1.SetEditable(False)

        self.checkListBox1 = wx.CheckListBox(choices=[ ],
              id=wxID_KEYWORDFRAMECHECKLISTBOX1, name='checkListBox1',
              parent=self.sashWindow1, pos=wx.Point(0, 0), size=wx.Size(10,
              435), style=0)
        self.checkListBox1.SetMinSize(wx.Size(-1, -1))
        self.checkListBox1.SetHelpText(u'')
        self.checkListBox1.SetWindowVariant(wx.WINDOW_VARIANT_NORMAL)
        self.checkListBox1.SetToolTipString(u'checkListBox1')

        self._init_sizers()

    def __init__(self, parent):
        self._init_ctrls(parent)
