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
   Begin GraphicalListbox File_List
      ActiveColumn    =   -1
      ActiveRow       =   -1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      darkModeEnabled =   False
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   50
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   24.0
      FontUnit        =   2
      genericTblHorizontal=   False
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   0
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   457
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   290
      ListboxType     =   5
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
      Top             =   162
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   458
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
      Left            =   290
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   24
      TopLeftColor    =   &c97AAC400
      Transparent     =   True
      Visible         =   True
      Width           =   382
      Begin Label File_Comment
         AllowAutoDeactivate=   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   16.0
         FontUnit        =   0
         Height          =   44
         Index           =   -2147483648
         InitialParent   =   "File_Warning"
         Italic          =   False
         Left            =   298
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Available test sequences\r\nplease choose one, then press load"
         TextAlignment   =   0
         TextColor       =   &c51515100
         Tooltip         =   ""
         Top             =   38
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   365
      End
   End
   Begin GraphicalListbox ResourceList
      ActiveColumn    =   -1
      ActiveRow       =   -1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   ",30"
      darkModeEnabled =   False
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   0
      genericTblHorizontal=   False
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   3
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   297
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      ListboxType     =   4
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   100
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   258
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label ReleaseNotes
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   197
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   422
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   250
   End
   Begin Label Label_ReleaseNotes
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Release notes"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   401
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin GraphicalButton CheckResources
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Resources OK"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   755492059
      IconAlignment   =   0
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
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   24
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   258
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
      Left            =   684
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Load Sequence"
      Top             =   24
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
      FontSize        =   36.0
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
      Top             =   100
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   458
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
		    Label_ReleaseNotes.TextColor = Color.White
		    ReleaseNotes.TextColor = Color.White
		    Chosen_File.TextColor = &cF0F0F0
		    self.BackgroundColor = &c2D3137
		  Else
		    If File_Comment.Text.Contains("Available test sequences") Then
		      File_Warning.FillColor = &cF0F0F0
		      File_Comment.TextColor = Color.Black
		    End If
		    Label_ReleaseNotes.TextColor = Color.Black
		    ReleaseNotes.TextColor = Color.Black
		    Chosen_File.TextColor = &c2D3137
		    self.BackgroundColor = &cF5F6F7
		  End If
		  
		  BB_LoadSequence.darkModeEnabled = value
		  CheckResources.darkModeEnabled = value
		  File_List.darkModeEnabled = value
		  ResourceList.darkModeEnabled = value
		  
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
		Function CheckResource(FS as BasicClass) As boolean
		  Dim RV as boolean = true
		  
		  if FS isA ResourceClass then
		    if ResourceClass(FS).CheckAfterStart.GIAB then
		      ResourceList.AddRow(FS.Name.GIAS)
		      if  not(ResourceClass(FS).Connected.GIAB) then
		        RV=false
		        ResourceList.Cell(ResourceList.ListCount-1,1)="off"
		      else
		        ResourceList.Cell(ResourceList.ListCount-1,1)="ok"
		      end
		    end
		  end
		  
		  Dim BS as BasicClass = FS.FirstSubStep
		  while BS<>nil
		    if not(CheckResource(BS)) then
		      RV=false
		    end
		    BS=BS.NextStep
		  wend
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckResourceStates()
		  Dim BS as BasicClass
		  
		  OverallResourceState=true
		  ResourceList.DeleteAllRows
		  if App.GlobalResources<>nil then
		    OverallResourceState=CheckResource(App.GlobalResources)
		  end
		  
		  if OverallResourceState then
		    CheckResources.Caption = "Resources OK"
		    CheckResources.BackColor = &c00DE80
		    CheckResources.Icon = Icon_Pass
		  else
		    CheckResources.Caption = "Resources not ready!"
		    CheckResources.BackColor = &cFF6E6E
		    CheckResources.Icon = Icon_Fail
		  end
		  
		  
		End Sub
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
		  Dim Row as integer=0
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
		              // now check if it belongs to the default if yes set it into the
		              if item.DisplayName.Instr(1,DF)>0 then
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
		      end
		    next
		  end
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
		    File_Comment.Text="Available test sequences" + chr(13) + "please choose one, then press load"
		    File_Comment.TextColor = &c262626
		    If Me.darkModeEnabled Then
		      File_Warning.FillColor= &c2CC990
		    Else
		      File_Warning.FillColor = &cF0F0F0
		    End If
		    Return
		  End If
		  
		  Dim SF as string
		  
		  SF= File_List.Cell(File_List.ListIndex,0)
		  
		  Chosen_File.Value=SF
		  if mStartupTabClass<>nil then
		    if SF.Instr(1,mStartupTabClass.Default.GIAS)>0 then
		      if mStartupTabClass.ActualTestSequence.GIAS=SF then
		        File_Warning.FillColor= &c2CC990 '&c00DE80 '00FF00 //RGB(0,255,0)
		        File_Comment.Text="Lastest Test Sequence for this Test Machine"
		        FileType_SecurityLevel=5
		      else
		        File_Warning.FillColor= &cFBF257 'FFD700 'FFFF00 //RGB(255,255,0)
		        File_Comment.Text="Older Test Sequence for this Test Machine"
		        FileType_SecurityLevel=4
		      end
		    else
		      if SF.Instr(1,mStartupTabClass.Type.GIAS)>0 then
		        File_Warning.FillColor = &cFCB941'&cFF8000 //RGB(255,128,0)
		        File_Comment.Text="Test Sequence fits Type tested on this Test Machine"
		        FileType_SecurityLevel=3
		      else
		        File_Warning.FillColor= &cFC6042 '&cFF6E6E 'FF0000 //RGB(255,0,0)
		        File_Comment.Text="Test Sequence does not fit Type, please check before loading"
		        FileType_SecurityLevel=2
		      end
		    end
		    File_Comment.TextColor = &c262626
		  else
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckResources
	#tag Event
		Sub LeftClick()
		  CheckResourceStates
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.useBackColor = True
		End Sub
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
#tag ViewBehavior
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
