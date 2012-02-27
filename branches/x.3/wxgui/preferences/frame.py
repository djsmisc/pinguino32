#Boa:Frame:Frame1

import wx

def create(parent):
    return Frame1(parent)

[wxID_FRAME1, wxID_FRAME1BUTTON1, wxID_FRAME1CHOICEBOOK1, wxID_FRAME1LISTBOX1, 
 wxID_FRAME1PANEL1, wxID_FRAME1RADIOBUTTON1, wxID_FRAME1RADIOBUTTON2, 
 wxID_FRAME1SASHWINDOW1, wxID_FRAME1SPINCTRL1, wxID_FRAME1STATICTEXT1, 
 wxID_FRAME1TEXTCTRL1, 
] = [wx.NewId() for _init_ctrls in range(11)]

class Frame1(wx.Frame):
    def _init_coll_boxSizer1_Items(self, parent):
        # generated method, don't edit

        parent.AddWindow(self.listBox1, 0, border=0, flag=wx.EXPAND)
        parent.AddWindow(self.sashWindow1, 1, border=0, flag=wx.EXPAND)

    def _init_coll_choicebook1_Pages(self, parent):
        # generated method, don't edit

        parent.AddPage(imageId=-1, page=self.panel1, select=True,
              text=u'Source code Font/Size')

    def _init_sizers(self):
        # generated method, don't edit
        self.boxSizer1 = wx.BoxSizer(orient=wx.HORIZONTAL)

        self._init_coll_boxSizer1_Items(self.boxSizer1)

        self.SetSizer(self.boxSizer1)

    def _init_ctrls(self, prnt):
        # generated method, don't edit
        wx.Frame.__init__(self, id=wxID_FRAME1, name='', parent=prnt,
              pos=wx.Point(234, 145), size=wx.Size(733, 378),
              style=wx.DEFAULT_FRAME_STYLE, title='Frame1')
        self.SetClientSize(wx.Size(717, 340))

        self.listBox1 = wx.ListBox(choices=["Source code Font/Size"],
              id=wxID_FRAME1LISTBOX1, name='listBox1', parent=self,
              pos=wx.Point(0, 0), size=wx.Size(175, 340), style=0)
        self.listBox1.SetMinSize(wx.Size(175, 63))

        self.sashWindow1 = wx.SashWindow(id=wxID_FRAME1SASHWINDOW1,
              name='sashWindow1', parent=self, pos=wx.Point(175, 0),
              size=wx.Size(542, 340),
              style=wx.NO_3D | wx.CLIP_CHILDREN | wx.SW_3D)

        self.choicebook1 = wx.Choicebook(id=wxID_FRAME1CHOICEBOOK1,
              name='choicebook1', parent=self.sashWindow1, pos=wx.Point(0, 0),
              size=wx.Size(542, 340), style=0)

        self.panel1 = wx.Panel(id=wxID_FRAME1PANEL1, name='panel1',
              parent=self.choicebook1, pos=wx.Point(0, 0), size=wx.Size(542,
              314), style=wx.TAB_TRAVERSAL)
        self.panel1.SetWindowVariant(wx.WINDOW_VARIANT_NORMAL)

        self.radioButton1 = wx.RadioButton(id=wxID_FRAME1RADIOBUTTON1,
              label='radioButton1', name='radioButton1', parent=self.panel1,
              pos=wx.Point(40, 48), size=wx.Size(120, 24), style=0)

        self.radioButton2 = wx.RadioButton(id=wxID_FRAME1RADIOBUTTON2,
              label='radioButton2', name='radioButton2', parent=self.panel1,
              pos=wx.Point(40, 80), size=wx.Size(120, 24), style=0)

        self.textCtrl1 = wx.TextCtrl(id=wxID_FRAME1TEXTCTRL1, name='textCtrl1',
              parent=self.panel1, pos=wx.Point(168, 80), size=wx.Size(168, 24),
              style=0, value='textCtrl1')

        self.staticText1 = wx.StaticText(id=wxID_FRAME1STATICTEXT1,
              label=u'Tab size', name='staticText1', parent=self.panel1,
              pos=wx.Point(48, 160), size=wx.Size(72, 13), style=0)

        self.spinCtrl1 = wx.SpinCtrl(id=wxID_FRAME1SPINCTRL1, initial=0,
              max=100, min=0, name='spinCtrl1', parent=self.panel1,
              pos=wx.Point(168, 152), size=wx.Size(190, 24),
              style=wx.SP_ARROW_KEYS)

        self.button1 = wx.Button(id=wxID_FRAME1BUTTON1, label='button1',
              name='button1', parent=self.panel1, pos=wx.Point(360, 72),
              size=wx.Size(80, 31), style=0)

        self._init_coll_choicebook1_Pages(self.choicebook1)

        self._init_sizers()

    def __init__(self, parent):
        self._init_ctrls(parent)

    def OnListBox1Listbox(self, event):
        event.Skip()
