#tag Window
Begin GraphicalTabContainer StartupTabContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   True
   AllowFocusRing  =   True
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cF5F6F700
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   True
   Height          =   662
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   False
   Visible         =   True
   Width           =   768
   Begin Listbox File_List
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   True
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   50
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   25.0
      FontUnit        =   2
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   453
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Testsequence	Description"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Choose a Testsequence"
      Top             =   189
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   728
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Rectangle File_Warning
      AllowAutoDeactivate=   True
      BorderThickness =   1.0
      BottomRightColor=   &c97AAC400
      Enabled         =   True
      FillColor       =   &c2D313700
      Height          =   64
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   314
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   -191
      TopLeftColor    =   &c97AAC400
      Transparent     =   True
      Visible         =   True
      Width           =   382
   End
   Begin GraphicalButton BB_LoadSequence
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00000000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   ""
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   671598591
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Load Sequence"
      Top             =   113
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
   End
   Begin Label Chosen_File
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   25.0
      FontUnit        =   0
      Height          =   48
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   96
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   True
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Choose Testsequence"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   129
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   542
   End
   Begin PushButton NewProjectButton
      AllowAutoDeactivate=   True
      Bold            =   True
      Cancel          =   False
      Caption         =   "New Testsequence with HMI"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   17.0
      FontUnit        =   0
      Height          =   43
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   258
   End
   Begin Label File_Comment
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   17.0
      FontUnit        =   0
      Height          =   48
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   290
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Or select from the available test sequences\r\nbelow, then press load"
      TextAlignment   =   0
      TextColor       =   &c51515100
      Tooltip         =   ""
      Top             =   17
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   458
   End
   Begin Separator Separator1
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   26
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   37
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   75
      Transparent     =   False
      Visible         =   True
      Width           =   728
   End
   Begin PushButton BtnRefreshList
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Refresh"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   668
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Refreshes the list"
      Top             =   155
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DarkModeTabElements(value as Boolean)
		  If value Then
		    If File_Comment.Text.Contains("Available test sequences") Then
		      File_Warning.FillColor = &c2D3137
		      File_Comment.TextColor = Color.White
		    End If
		    Chosen_File.TextColor = &cF0F0F0
		    self.BackgroundColor = &c2D3137
		  Else
		    If File_Comment.Text.Contains("Available test sequences") Then
		      File_Warning.FillColor = &cF0F0F0
		      File_Comment.TextColor = Color.Black
		    End If
		    Chosen_File.TextColor = &c2D3137
		    self.BackgroundColor = &cF5F6F7
		  End If
		  
		  BB_LoadSequence.darkModeEnabled = value
		  'File_List.darkModeEnabled = value
		  
		  Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Load_File_List("")
		  File_Warning.FillColor = &cF0F0F0
		  File_Comment.TextColor = Color.Black
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CheckReleaseNotes(f as FolderItem) As String
		  If f = Nil Or Not f.Exists Then
		    Return ""
		  End If
		  
		  Var xml As New XmlDocument
		  Try
		    xml.LoadXml(f)
		  Catch e As XmlException
		    System.DebugLog (f.DisplayName + "> XML error: " + e.Message)
		    Return ""
		  End Try
		  
		  If xml.FirstChild = Nil Or Not (xml.FirstChild.LocalName.Lowercase = "testprogram") Then
		    Return ""
		  End If
		  
		  Dim testProgram As XMLNode = xml.FirstChild
		  Dim notes As String = testProgram.GetAttribute("Description").Trim
		  Return notes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return  New StartupTabContainer(Self.mStartupTabClass)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  
		  'Me.Folder=Me.IAFolder("Folder","Testsequences",false)
		  mStartupTabClass = StartupTabClass(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Startup()
		  // this routine initializes all definied and connected IEDs
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load_File_List(vType as string)
		  Dim Row As Integer=0
		  Dim DF,VE as string
		  Dim Vers,NewVers as integer=-1
		  
		  if mStartupTabClass<>nil then
		    DF=mStartupTabClass.Default.GIAS
		  end
		  
		  Dim folder as FolderItem = mStartupTabClass.Folder.GIAF
		  
		  if (folder<>nil) and folder.exists then
		  else
		    folder= GetWorkingFolderItem
		    if CheckFolder(folder) then
		      folder=folder.Child("Testsequences")
		    end
		  end
		  
		  if CheckFolder(folder) then
		    File_List.DeleteAllRows
		    Chosen_File.Value=""
		    Dim count As Integer = folder.Count
		    For i As Integer = 1 to count
		      Dim item As FolderItem = folder.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.DisplayName.Left(1) <> "." Then
		          If item.Directory Then
		          Else
		            if (vType = "") or (item.DisplayName.Instr(1,vType)>0) then
		              File_List.InsertRow(Row, item.DisplayName)
		              File_List.RowTag(row) = item
		              
		              File_List.CellValueAt(Row, 1) = CheckReleaseNotes(item)
		              // now check if it belongs to the default if yes set it into the
		              If item.DisplayName.InStr(1,DF)>0 Then
		                VE=item.DisplayName
		                NewVers=VE.Instr(1," v")
		                if NewVers>0 then
		                  NewVers=NewVers+2
		                  VE=VE.Mid(NewVers,VE.len)
		                  NewVers=VE.Instr(1,".xml")
		                  if NewVers>0 then
		                    VE=VE.Mid(1,VE.len-NewVers)
		                    NewVers=val(VE)
		                    if NewVers>Vers then
		                      Vers=NewVers
		                      Chosen_File.Value=item.DisplayName
		                      if mStartupTabClass<>nil then
		                        mStartupTabClass.ActualTestSequence.SIAS(item.DisplayName)
		                        File_List.ListIndex=Row
		                        FileType_SecurityLevel=5
		                      end
		                    end
		                  end
		                end
		              end
		              Row = Row + 1
		            end
		          end
		        end
		      End
		    next
		  End
		  
		  File_List.ColumnSortDirectionAt(0) = ListBox.SortDirections.Descending
		  File_List.SortingColumn = 0
		  File_List.Sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Search_File(FileList as ListBox, SubFolder as folderItem, SearchText as string)
		  if SubFolder <> nil and SubFolder.exists then
		    Dim count As Integer = SubFolder.Count
		    For i As Integer = 1 to count
		      Dim item As FolderItem = SubFolder.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.DisplayName.Left(1) <> "." Then
		          If item.Directory Then
		            Search_File(FileList, Item, SearchText)
		          Else
		            if (item.DisplayName.Instr(1,SearchText)>0) then
		              FileList.AddRow(item.DisplayName)
		            end
		          end
		        end
		      end
		    next
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		FileType_SecurityLevel As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		mStartupTabClass As StartupTabClass
	#tag EndProperty

	#tag Property, Flags = &h0
		OverallResourceState As Boolean = true
	#tag EndProperty


#tag EndWindowCode

#tag Events File_List
	#tag Event
		Sub Change()
		  // put the selected file into the Chosen text field
		  // color it according the following rule:
		  // bright green if it is the last version of that program
		  // yellow if it is an older version of that file
		  // orange if it contains the Type information eg "600COM03"
		  // red if is another programm
		  
		  // fill the version and revision info
		  ' if mStartupTabClass<>nil then
		  'Label_ReleaseNotes.Text = Label_ReleaseNotes.Text + " v"+ mStartupTabClass.Version.GIAS
		  'ReleaseNotes.Text = mStartupTabClass.ReleaseNotes.GIAS
		  'end
		  
		  If File_List.SelectedRowIndex = -1 Then
		    Chosen_File.Value = ""
		    File_Comment.Text= "Or select from the available test sequences" + chr(13) + "below, then press load"
		    File_Comment.TextColor = &c262626
		    
		    Return
		  End If
		  
		  Dim SF as string
		  
		  SF= File_List.Cell(File_List.ListIndex,0)
		  
		  Chosen_File.Value=SF
		  if mStartupTabClass<>nil then
		    if SF.Instr(1,mStartupTabClass.Default.GIAS)>0 then
		      if mStartupTabClass.ActualTestSequence.GIAS=SF then
		        File_Warning.FillColor= &c2CC990 '&c00DE80 '00FF00 //RGB(0,255,0)
		        'File_Comment.Text="Lastest Test Sequence for this Test Machine"
		        FileType_SecurityLevel=5
		      else
		        File_Warning.FillColor= &cFBF257 'FFD700 'FFFF00 //RGB(255,255,0)
		        'File_Comment.Text="Older Test Sequence for this Test Machine"
		        FileType_SecurityLevel=4
		      end
		    else
		      if SF.Instr(1,mStartupTabClass.Type.GIAS)>0 then
		        File_Warning.FillColor = &cFCB941'&cFF8000 //RGB(255,128,0)
		        'File_Comment.Text="Test Sequence fits Type tested on this Test Machine"
		        FileType_SecurityLevel=3
		      else
		        File_Warning.FillColor= &cFC6042 '&cFF6E6E 'FF0000 //RGB(255,0,0)
		        'File_Comment.Text="Test Sequence does not fit Type, please check before loading"
		        FileType_SecurityLevel=2
		      end
		    end
		    File_Comment.TextColor = &c262626
		  else
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  g.FontSize = 18
		  If row <> me.SelectedRowIndex Then
		    g.DrawingColor = &c262626
		  Elseif row > -1 and row = me.SelectedRowIndex Then
		    g.DrawingColor = Color.Black
		  End If
		  
		  If column = 1 Then
		    g.FontSize = 14
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function HeaderContentPaint(g As Graphics, column As Integer) As Boolean
		  g.Bold = True
		  g.FontSize = 20
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If row <> -1 and row = me.SelectedRowIndex Then
		    g.DrawingColor = &cFFFFFF
		    g.FillRectangle(-1, -1, g.Width + 1, g.Height + 1)
		    
		    g.DrawingColor = &c2589FF80
		    g.FillRectangle(-1, -1, g.Width + 1, g.Height + 1)
		    
		    If column = 0 Then
		      g.DrawingColor = &c2589FF
		      g.FillRectangle(0, 0, 3, g.Height)
		    End If
		    
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  If column <> 0 Then
		    Return False
		  End If
		  
		  If Not (Me.RowTagAt(row1) IsA FolderItem And Me.RowTagAt(row2) IsA FolderItem) Then
		    Return False
		  End If
		  
		  Dim f1 As FolderItem = Me.RowTagAt(row1)
		  Dim f2 As FolderItem = Me.RowTagAt(row2)
		  
		  If f1.ModificationDateTime = Nil Or f2.ModificationDate = Nil Then
		    Return False
		  End If
		  
		  If f1.ModificationDateTime < f2.ModificationDate Then
		    result = -1
		  ElseIf f1.ModificationDateTime > f2.ModificationDate Then
		    result = 1
		  Else
		    result = 0
		  End If
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function SortColumn(column As Integer) As Boolean
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events BB_LoadSequence
	#tag Event
		Sub LeftClick()
		  if mStartupTabClass<>nil then
		    if Chosen_File.Value<>"" then
		      Dim Path as string = GetSequenceFolder
		      #if TargetMacOS
		        Path = Path + "/Testsequences/" + Chosen_File.Value
		        // check if the file is an xml file
		        if Chosen_File.Value.Right(4) <> ".xml" Then
		          Path = Path + ".xml"
		        End If
		      #else
		        Path = Path+PathSeparator+"Testsequences"+PathSeparator+Chosen_File.Value
		      #endif
		      Path=Path.ReplaceAll(PathSeparator+PathSeparator,PathSeparator)
		      Dim fileItem As FolderItem = GetFolderItem(Path)
		      If CheckFile(fileItem) Then
		        if App.Security_Check(FileType_SecurityLevel) then
		          MainWindow.OpenTestSequence(fileItem.NativePath,0)
		        End
		      end
		    End
		  End
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.useBackColor = True
		  Me.BackColor = &c97AAC4
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewProjectButton
	#tag Event
		Sub Action()
		  if App.Security_Check(2) then
		    Dim S as string = "<TESSA Name=" + chr(34) + "TESSA_Testsequence" + chr(34) +" HMI="+ chr(34) + "on" + chr(34) + " Hierarchical_Links="+ chr(34) + "on" + chr(34) +" >"+CR+  "<Teststep Name=" + chr(34) + "Teststep" + chr(34) +  " />" +CR+ "</TESSA>" 
		    if App.ParseTestsequenceFile(S) then
		    end
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BtnRefreshList
	#tag Event
		Sub Action()
		  Load_File_List("")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="darkModeEnabled"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FileType_SecurityLevel"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="OverallResourceState"
		Visible=false
		Group="Behavior"
		InitialValue="true"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
