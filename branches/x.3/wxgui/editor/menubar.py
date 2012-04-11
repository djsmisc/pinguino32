#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""-------------------------------------------------------------------------
    General methos to Pinguino IDE.

    author:		Yeison Cardona
    contact:		yeison.eng@gmail.com 
    first release:	02/April/2012
    last release:	03/April/2012
    
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

import codecs, sys


########################################################################
class Menubar:

    #----------------------------------------------------------------------
    def OnNew(self, event):
        self.background.Hide()
        self.New("Newfile" + str(self.noname), self.reservedword, self.rw)
        self.noname+=1
        self.updatenotebook()
        
    #----------------------------------------------------------------------
    def OnOpen(self, event):
        self.background.Hide()
        self.OpenDialog("Pde Files",\
                        "pde",\
                        self.reservedword,\
                        self.rw,\
                        self.filehistory,\
                        self.config)
        self.updatenotebook()
        self.update_dockFiles()
        
            
    #----------------------------------------------------------------------
    def OnSave(self, event=None):
        """ Save file without dialog box """
        if len(self.onglet)>0: 
            path=self.filename[self.notebookEditor.GetSelection()]
            fichier=codecs.open(path,'w','utf8')
            for i in range(0,self.stcpage[self.notebookEditor.GetSelection()].GetLineCount()):
                fichier.writelines(self.stcpage[self.notebookEditor.GetSelection()].GetLine(i))
            fichier.close()
            if self.notebookEditor.GetPageText(self.notebookEditor.GetSelection())[0]=="*":
                chaine=self.notebookEditor.GetPageText(self.notebookEditor.GetSelection())
                chaine=chaine[1:len(chaine)]
                self.notebookEditor.SetPageText(self.notebookEditor.GetSelection(),chaine)
            return
        return
    
    
    
    
    #----------------------------------------------------------------------
    def OnSaveAs(self, event): 
        self.Save("Pde Files","pde")
       
        
    #----------------------------------------------------------------------
    def OnClose(self, event): 
        self.CloseTab()
        self.updatenotebook()
        self.update_dockFiles()
        
    #----------------------------------------------------------------------
    def OnCopy(self, event):
        self.stcpage[self.notebookEditor.GetSelection()].Copy()

    #----------------------------------------------------------------------
    def OnPaste(self, event):
        self.stcpage[self.notebookEditor.GetSelection()].Paste()

    #----------------------------------------------------------------------
    def OnCut(self, event):
        self.stcpage[self.notebookEditor.GetSelection()].Cut()

    #----------------------------------------------------------------------
    def OnClear(self, event):
        self.stcpage[self.notebookEditor.GetSelection()].Clear()

    #----------------------------------------------------------------------
    def OnUndo(self, event):
        self.stcpage[self.notebookEditor.GetSelection()].Undo()

    #----------------------------------------------------------------------
    def OnRedo(self, event):
        self.stcpage[self.notebookEditor.GetSelection()].Redo()

    #----------------------------------------------------------------------
    def OnSelectall(self, event):
        self.stcpage[self.notebookEditor.GetSelection()].SelectAll()
        
    #----------------------------------------------------------------------
    def OnComment(self, event=None):
        textEdit = self.stcpage[self.notebookEditor.GetSelection()]
        lineStart, lineEnd = map(textEdit.LineFromPosition,textEdit.GetSelection())
        countLines = lineEnd - lineStart
        posLineStart, posLineEnd = map(textEdit.PositionFromLine, [lineStart, lineEnd+1])
        textEdit.SetSelection(posLineStart, posLineEnd)
        selected = textEdit.GetSelectedText()
        if selected.startswith("//"): comented = selected.replace("//","")
        else: comented = "//" + selected.replace("\n","\n//", countLines)
        textEdit.Clear()
        textEdit.InsertText(textEdit.CurrentPos, comented)
        textEdit.SetSelection(*map(textEdit.PositionFromLine, [lineStart, lineEnd]))

    #----------------------------------------------------------------------
    def OnExit(self, event):
    
        self.closing = True  #Signal for Threads
        
        try:
            self.pinguino.close()
            fclose(self.debug_handle)
        except: pass
        
        # ---save settings-----------------------------------------------
        #if not self.IsIconized() and not self.IsMaximized():
        w, h = self.GetSize()
        self.config.WriteInt('Window/Width', w)
        self.config.WriteInt('Window/Height', h)
        #self.config.WriteInt("frame/sashposition", self.splitterWindow1.GetSashPosition())
        #x, y = self.GetPosition()
        #self.config.WriteInt('Window/Posx', x)
        #self.config.WriteInt('Window/Posy', y)

        w, h = self.logwindow.GetSize()
        self.config.WriteInt('Output/Width', w)
        self.config.WriteInt('Output/Height', h)

        i = 0
        self.config.WriteInt("LastEdit/count", len(self.filename))
        for file in self.filename:
            self.config.Write("LastEdit/file%d" %i, file)
            i += 1

        #for t in self.themeList:
        #	tid = self.theme_menu.FindItem(t)
        #	if self.theme_menu.IsChecked(tid):
        self.config.Write('Theme/name', self.theme)

        #Save the last files in the editor
        for b in range(len(self.boardlist)):
            bid = self.boardlist[b].id
            if self.board_menu.IsChecked(bid):
                self.config.WriteInt('Board', bid)

        #if DEV:
            #for d in range(self.ID_ENDDEBUG - self.ID_DEBUG - 1):
                #did = self.ID_DEBUG + d + 1
                #if self.menu.menuDebugMode.IsChecked(did):
                    #self.config.WriteInt('Debug', did)

        self.config.Flush()

        # ----------------------------------------------------------------------
        # deinitialize the frame manager
        self._mgr.UnInit()
        # delete the frame
        self.Destroy()
        sys.exit(0)
        
        
    #----------------------------------------------------------------------
    def OnViewTools(self, event):
        if self.menu.menuItemTools.IsChecked():
            self._mgr.AddPane(self.lat, self.PaneLateral, '')
        else:
            self._mgr.DetachPane(self.lat)            
            self.lat.Hide()
        self.updateIDE()
        
    #----------------------------------------------------------------------
    def OnViewOutput(self, event):
        if self.menu.menuItemOutput.IsChecked():
            self._mgr.AddPane(self.panelOutput, self.PaneOutputInfo, '')
        else:
            self._mgr.DetachPane(self.panelOutput)            
            self.panelOutput.Hide()
        self.updateIDE()
        
    #----------------------------------------------------------------------
    def OnViewToolbar(self, event):
        if self.menu.menuItemToolbar.IsChecked():
            self.DrawToolbar()
            #self.toolbar.Show()
        else:
            self.toolbar.Destroy()
        self.updateIDE()