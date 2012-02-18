#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    Recursive wx.TreeCtrl for *.pde files.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	2012-02-02
    last release:	2012-02-03
    
    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-------------------------------------------------------------------------"""

import wx
import sys,os

########################################################################
class treeExamples():
    #----------------------------------------------------------------------
    def __initTree__(self):
        self.tree=self.treeCtrl1
        self.buildTreeExamples()
        self.Bind(wx.EVT_TREE_SEL_CHANGED, self.OnSelChanged, self.tree)
        self.Bind(wx.EVT_TREE_BEGIN_LABEL_EDIT, self.OnBeginEdit, self.tree) # to calcel this event
        self.Bind(wx.EVT_TREE_ITEM_ACTIVATED, self.OnActivate, self.tree)
        self.tree.Expand(self.root)
        
        
    #----------------------------------------------------------------------
    def buildTreeExamples(self):
        isz = (16,16)
        il = wx.ImageList(*isz)
        fldridx     = il.Add(wx.ArtProvider_GetBitmap(wx.ART_FOLDER,      wx.ART_OTHER, isz))
        fldropenidx = il.Add(wx.ArtProvider_GetBitmap(wx.ART_FILE_OPEN,   wx.ART_OTHER, isz))
        fileidx     = il.Add(wx.ArtProvider_GetBitmap(wx.ART_NORMAL_FILE, wx.ART_OTHER, isz))

        self.tree.SetImageList(il)
        self.il = il       
        
        self.root = self.tree.AddRoot("Examples")
        self.tree.SetPyData(self.root, None)
        self.tree.SetItemImage(self.root, fldridx, wx.TreeItemIcon_Normal)
        self.tree.SetItemImage(self.root, fldropenidx, wx.TreeItemIcon_Expanded)                     
                    
        def extraer(path,item):
            if not item: item=self.root
            itemx=os.listdir(path)
            itemx.sort()
            for x in itemx:
                if os.path.isdir(os.path.join(path,x)) and not x.startswith("."):
                    parent = self.tree.AppendItem(item, x)
                    self.tree.SetPyData(parent, None)
                    self.tree.SetItemImage(parent, fldridx, wx.TreeItemIcon_Normal)
                    self.tree.SetItemImage(parent, fldropenidx, wx.TreeItemIcon_Expanded)    
                    nextPath=os.listdir(os.path.join(path,x))
                    nextPath.sort()
                    for dir in nextPath:
                        if os.path.isdir(os.path.join(path,x,dir))  and not dir.startswith("."):
                            folder = self.tree.AppendItem(parent, dir)
                            self.tree.SetPyData(folder, None)
                            self.tree.SetItemImage(folder, fldridx, wx.TreeItemIcon_Normal)
                            self.tree.SetItemImage(folder, fldropenidx, wx.TreeItemIcon_Expanded)     
                            extraer(os.path.join(path,x,dir),folder)
                        else:
                            if dir.endswith(".pde"):
                                filePde = self.tree.AppendItem(parent, dir)
                                self.tree.SetPyData(filePde, None)
                                self.tree.SetItemImage(filePde, fileidx, wx.TreeItemIcon_Normal)
                else:
                    if x.endswith(".pde"):
                        filePde = self.tree.AppendItem(item, x)
                        self.tree.SetPyData(filePde, None)
                        self.tree.SetItemImage(filePde, fileidx, wx.TreeItemIcon_Normal)                       
        path=os.path.join(sys.path[0],"examples")
        extraer(path,None)   
                    
    #--------------------------------------------------------------------------
    def OnBeginEdit(self, event):
        # Disable rename items
        event.Veto()
        
    #--------------------------------------------------------------------------
    def OnSelChanged(self, event):
        self.item = event.GetItem()
        event.Skip()        
        
    #--------------------------------------------------------------------------
    def OnActivate(self, event):
        name=self.tree.GetItemText(self.item)
        path=[]
        if name.endswith(".pde"):
            item=self.item
            path.append(name)
            while item!=self.tree.GetRootItem():
                path.append(self.tree.GetItemText(self.tree.GetItemParent(item)))
                item=self.tree.GetItemParent(item)
            path.reverse()
            path.pop(0)
            path.insert(0,"examples")
            example=""
            for x in path: example=os.path.join(example,x)
            example=os.path.join(sys.path[0],example)
            if os.path.isfile(example):
                try: self.background.Hide()
                except: pass  #self.background not exist
                self.Open(example,
                                 self.reservedword,
                                 self.rw,
                                 self.filehistory,
                                 self.config)
