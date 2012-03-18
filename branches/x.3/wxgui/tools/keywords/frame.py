#Boa:Frame:keywordFrame

import wx
import wx.richtext
import wx.html

def create(parent):
    return keywordFrame(parent)

[wxID_KEYWORDFRAME, wxID_KEYWORDFRAMECHECKLISTBOX1, wxID_KEYWORDFRAMELISTBOX1, 
 wxID_KEYWORDFRAMEPANEL1, wxID_KEYWORDFRAMEPANEL2, 
 wxID_KEYWORDFRAMERICHTEXTCTRL1, wxID_KEYWORDFRAMESASHWINDOW1, 
 wxID_KEYWORDFRAMESASHWINDOW2, wxID_KEYWORDFRAMESASHWINDOW3, 
 wxID_KEYWORDFRAMESPLITTERWINDOW1, wxID_KEYWORDFRAMESPLITTERWINDOW2, 
] = [wx.NewId() for _init_ctrls in range(11)]

class keywordFrame(wx.Frame):
    def _init_coll_boxSizer3_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.panel1, 1, border=0, flag=wx.EXPAND)

    def _init_coll_boxSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.panel2, 1, border=5, flag=wx.ALL | wx.EXPAND)

    def _init_coll_boxSizer2_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.splitterWindow1, 1, border=0, flag=wx.EXPAND)

    def _init_sizers(self):
        # generated method, don't edit
        self.boxSizer1 = wx.BoxSizer(orient=wx.VERTICAL)

        self.boxSizer2 = wx.BoxSizer(orient=wx.VERTICAL)

        self.boxSizer3 = wx.BoxSizer(orient=wx.VERTICAL)

        self._init_coll_boxSizer1_Items(self.boxSizer1)
        self._init_coll_boxSizer2_Items(self.boxSizer2)
        self._init_coll_boxSizer3_Items(self.boxSizer3)

        self.SetSizer(self.boxSizer3)
        self.panel1.SetSizer(self.boxSizer1)
        self.panel2.SetSizer(self.boxSizer2)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Frame.__init__(self, id=wxID_KEYWORDFRAME, name=u'keywordFrame',
              parent=prnt, pos=wx.Point(243, 131), size=wx.Size(781, 375),
              style=wx.DEFAULT_FRAME_STYLE, title=u'Pinguino Functions')
        self.SetClientSize(wx.Size(765, 337))

        self.panel1 = wx.Panel(id=wxID_KEYWORDFRAMEPANEL1, name='panel1',
              parent=self, pos=wx.Point(0, 0), size=wx.Size(765, 337),
              style=wx.TAB_TRAVERSAL)

        self.panel2 = wx.Panel(id=wxID_KEYWORDFRAMEPANEL2, name='panel2',
              parent=self.panel1, pos=wx.Point(5, 5), size=wx.Size(755, 327),
              style=wx.TAB_TRAVERSAL)

        self.splitterWindow1 = wx.SplitterWindow(id=wxID_KEYWORDFRAMESPLITTERWINDOW1,
              name='splitterWindow1', parent=self.panel2, pos=wx.Point(0, 0),
              size=wx.Size(755, 327), style=wx.SP_3D)

        self.sashWindow1 = wx.SashWindow(id=wxID_KEYWORDFRAMESASHWINDOW1,
              name='sashWindow1', parent=self.splitterWindow1, pos=wx.Point(0,
              0), size=wx.Size(155, 327), style=wx.CLIP_CHILDREN | wx.SW_3D)

        self.splitterWindow2 = wx.SplitterWindow(id=wxID_KEYWORDFRAMESPLITTERWINDOW2,
              name='splitterWindow2', parent=self.splitterWindow1,
              pos=wx.Point(159, 0), size=wx.Size(596, 327), style=wx.SP_3D)
        self.splitterWindow1.SplitVertically(self.sashWindow1,
              self.splitterWindow2, 200)

        self.sashWindow2 = wx.SashWindow(id=wxID_KEYWORDFRAMESASHWINDOW2,
              name='sashWindow2', parent=self.splitterWindow2, pos=wx.Point(0,
              0), size=wx.Size(196, 327), style=wx.CLIP_CHILDREN | wx.SW_3D)

        self.sashWindow3 = wx.SashWindow(id=wxID_KEYWORDFRAMESASHWINDOW3,
              name='sashWindow3', parent=self.splitterWindow2, pos=wx.Point(200,
              0), size=wx.Size(396, 327), style=wx.CLIP_CHILDREN | wx.SW_3D)
        self.splitterWindow2.SplitVertically(self.sashWindow2, self.sashWindow3,
              200)

        self.checkListBox1 = wx.CheckListBox(choices=[],
              id=wxID_KEYWORDFRAMECHECKLISTBOX1, name='checkListBox1',
              parent=self.sashWindow1, pos=wx.Point(0, 0), size=wx.Size(155,
              327), style=0)
        self.checkListBox1.SetMinSize(wx.Size(-1, -1))

        self.listBox1 = wx.ListBox(choices=[], id=wxID_KEYWORDFRAMELISTBOX1,
              name='listBox1', parent=self.sashWindow2, pos=wx.Point(0, 0),
              size=wx.Size(196, 327), style=0)

        self.richTextCtrl1 = wx.richtext.RichTextCtrl(id=wxID_KEYWORDFRAMERICHTEXTCTRL1,
              parent=self.sashWindow3, pos=wx.Point(0, 0), size=wx.Size(396,
              327), style=wx.richtext.RE_MULTILINE, value=u'')
        self.richTextCtrl1.SetLabel(u'richText')
        self.richTextCtrl1.SetMinSize(wx.Size(-1, -1))

        self._init_sizers()

    def __init__(self, parent):
        self._init_ctrls(parent)
