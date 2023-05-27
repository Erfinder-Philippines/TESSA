#tag Class
Protected Class HTLListBox
Inherits BasicTreeListBox
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  // check if checkbox has been changed
		  Select case column
		  case 3
		    Dim LS as BasicClass = mBasicClass.FindElementByUniqueID(Me.RowTag(row))
		    if LS <> nil then
		      mActiveUserStep = LS
		      if LS IsA Test_StepClass then
		        Test_StepClass(LS).ExecuteSkip.SIAB(not(CellCheck(row,3)))
		      end
		      //fill in the table with the Attributes
		      RaiseEvent DidUpdate (mActiveUserStep)
		    end
		  case 4
		    Dim LS as BasicClass = mBasicClass.FindElementByUniqueID(Me.RowTag(row))
		    if LS <> nil then
		      mActiveUserStep = LS
		      if LS IsA StepClass then
		        StepClass(LS).DebugOn = CellCheck(row,4)
		      end
		    end
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  If mActiveUserStep <> Nil And y < Me.RowHeight Then
		    Return False
		  End
		  if Me.RowFromXY(x, y) < 0 Then
		    Return False
		  End
		  
		  Dim items(-1) As MenuItem = mActiveUserStep.GetContextMenuItems
		  If items.Ubound < 0 Then
		    Return False
		  End
		  For Each item As MenuItem in items
		    If item <> Nil Then
		      item.Enabled = item.Enabled And (App.GetTESSAState = Thread.NotRunning)
		      base.Append(item)
		      
		      Select Case item.Tag.StringValue
		      Case StepClass.WatchMenuItem
		        If mActiveElementMode = ActiveElementEnum.WatchPermanently Then
		          item.Checked = True
		        End
		      Case StepClass.FollowMenuItem
		        If mActiveElementMode = ActiveElementEnum.FollowExecution Then
		          item.Checked = True
		        End
		      End
		    End
		  Next
		  Return RaiseEvent AddToContextMenu(base, x, y)
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem <> Nil And mActiveUserStep <> Nil Then
		    Select Case hitItem.Tag.StringValue
		    Case StepClass.WatchMenuItem //Watch Element Permanently
		      If mActiveElementMode = ActiveElementEnum.WatchPermanently Then
		        mActiveElementMode = ActiveElementEnum.DoNone
		      Else
		        mActiveElementMode = ActiveElementEnum.WatchPermanently
		      End
		    Case StepClass.FollowMenuItem //Follow Execution
		      If mActiveElementMode = ActiveElementEnum.FollowExecution Then
		        mActiveElementMode = ActiveElementEnum.DoNone
		      Else
		        mActiveElementMode = ActiveElementEnum.FollowExecution
		      End
		      
		    Case BasicClass.DeleteMenuItem
		      DeleteElement(mActiveUserStep)
		      mActiveUserStep = Nil
		    Case BasicClass.PasteMenuItem
		      Call PasteStepFromClipboard
		    Case BasicClass.CutMenuItem
		      Call CutStepToClipboard
		    Else
		      Return AddedContextMenuAction(hitItem)
		    End
		    Return True
		  End
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  #Pragma Unused obj
		  #Pragma Unused action
		  For i As Integer = 0 to Me.ListCount - 1
		    Me.CellTag(i,0) = 0
		  Next
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  #Pragma Unused action
		  //CellTag(row, 0) :
		  //0 - none rect
		  //1- top rect in row
		  //2 - bottom rect in row
		  //3 - fill row
		  If mBasicClass = Nil Then
		    Return True
		  End
		  
		  For i As Integer = 0 to Me.ListCount - 1
		    Me.CellTag(i,0) = 0
		    Me.Selected(i) = false
		  Next
		  
		  Dim ID As String
		  Dim DragStep As BasicClass = Nil
		  // get dragged data
		  
		  If obj.PrivateRawData("tessa.abspath") <> "" Then
		    //drop element from Libaray
		    Dim S as String = OpenMeasFileForLoad(obj.PrivateRawData("tessa.abspath").FixEncoding)
		    DragStep = Parse_Element(S)
		  ElseIf obj.PrivateRawData("tessa.id") <> "" Then
		    ID = obj.PrivateRawData("tessa.id").FixEncoding
		    DragStep = mBasicClass.FindElementByUniqueID(ID)
		  End
		  
		  if mBasicClass IsA SettingsClass and not(DragStep IsA PathTemplate) Then
		    Return True
		  End
		  
		  Dim CurrentRow As Integer = Me.RowFromXY(x, y)
		  If CurrentRow >= 0 And CurrentRow < Me.ListCount Then
		    
		    //check if "Drag" element = Current "Drop" element
		    If (ID <> "" And Me.RowTag(CurrentRow) = ID) Or (DragStep <> Nil And DragStep.FindElementByUniqueID(Me.RowTag(CurrentRow)) <> Nil) Then
		      Return True
		    End
		    
		    Dim RowsHeight As Integer = (CurrentRow - Me.ScrollPosition + 1)* Me.RowHeight
		    if Abs(RowsHeight - y) < 4 Then
		      If CurrentRow > 0 Then
		        
		        If (ID <> "" And Me.RowTag(CurrentRow - 1) = ID) Or (DragStep <> Nil And DragStep.FindElementByUniqueID(Me.RowTag(CurrentRow - 1)) <> Nil) Then
		          Return True
		        End
		        
		        Me.CellTag(CurrentRow,0) = 1
		        Me.CellTag(CurrentRow - 1,0) = 2
		      Else
		        Return True
		      End
		    Else
		      RowsHeight = RowsHeight + Me.RowHeight
		      If Abs(RowsHeight - y) < 4 Then
		        If CurrentRow < (Me.ListCount - 1) Then
		          
		          If (ID <> "" And Me.RowTag(CurrentRow + 1) = ID) Or (DragStep <> Nil And DragStep.FindElementByUniqueID(Me.RowTag(CurrentRow + 1)) <> Nil) Then
		            Return True
		          End
		          
		          Me.CellTag(CurrentRow,0) = 2
		          Me.CellTag(CurrentRow + 1,0) = 1
		        End
		      Else
		        Me.CellTag(CurrentRow, 0 ) = 3
		      End
		    End
		    Me.Refresh
		  Else
		    If ID <>"" And (Me.RowTag(Me.ListCount - 1) = ID Or (DragStep <> Nil And DragStep.NextStep = Nil)) Then
		      Return True
		    End
		  End
		  Return false
		End Function
	#tag EndEvent

	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  If mBasicClass = Nil Then
		    Return False
		  End
		  Dim ID As String = Me.RowTag(row)
		  If ID <> "" Then
		    Dim BS As BasicClass = mBasicClass.FindElementByUniqueID(ID)
		    If BS = Nil Then
		      Return False
		    ElseIf BS.GetUniqueID = mBasicClass.GetUniqueID Then
		      Return False
		    End
		    
		    drag.DragPicture = CreateDragRowImage(Me.RowPicture(row), Me.Cell(row, 0))
		    drag.DropLeft = MouseX
		    drag.DropTop = MouseY
		    drag.DropWidth = drag.DragPicture.Width
		    drag.DropHeight = drag.DragPicture.Height
		    
		    drag.PrivateRawData("tessa.id") = ID
		    Return True
		  End
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If mActiveUserStep <> Nil Then
		    Dim keyDown As String = Uppercase(Key)
		    #If TargetMacOS Then
		      If Keyboard.AsyncCommandKey Then
		        Select Case keyDown
		        Case "C"
		          Return CopyStepToClipborad
		        Case "V"
		          Return PasteStepFromClipboard
		        Case "X"
		          Return CutStepToClipboard
		        End
		      End
		    #Else
		      If Keyboard.AsyncControlKey Then
		        Select Case keyDown
		        Case "C"
		          Return CopyStepToClipborad
		        Case "V"
		          Return PasteStepFromClipboard
		        Case "X"
		          Return CutStepToClipboard
		        End
		      End
		    #Endif
		  End
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  If Asc(Key) = 8 Or Asc(Key) = 127 Then
		    DeleteElement(mActiveUserStep)
		    mActiveUserStep = Nil
		  End
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  If Not IsContextualClick Then
		    mActiveElementMode = ActiveElementEnum.WatchPermanently
		    Invalidate(False)
		  End
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function EditCopy() As Boolean Handles EditCopy.Action
			Return CopyStepToClipborad
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditCut() As Boolean Handles EditCut.Action
			Return CutStepToClipboard
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditPaste() As Boolean Handles EditPaste.Action
			Return PasteStepFromClipboard
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function CopyStepToClipborad() As Boolean
		  If mActiveUserStep <> Nil Then
		    mActiveUserStep.CopyToClipboard
		    Return True
		  end
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CutStepToClipboard() As Boolean
		  If mActiveUserStep <> Nil Then
		    mActiveUserStep.CopyToClipboard
		    DeleteElement(mActiveUserStep)
		    mActiveUserStep = Nil
		    Return True
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillTreeRow(LocRow As Integer, BS As BasicClass)
		  If LocRow >= 0 And LocRow < ListCount And BS <> Nil Then
		    RowTag(LocRow) = BS.GetUniqueID
		    Dim C as string = ""
		    If BS.Num_Included_Elements > 0 Then
		      C = C+Str(BS.Num_Included_Elements)
		    end
		    Cell(LocRow,1) = C
		    
		    C=""
		    if BS IsA Resource_StepClass then
		      if  Resource_StepClass(BS).Connected.GIAB then
		        C="C"
		      else
		        C="O"
		      end
		    end
		    if BS.Num_Links > 0 then
		      C = C+Str(BS.Num_Links)
		    end
		    Cell(LocRow, 2) = C
		    
		    CellItalic(LocRow, 2) = False
		    CellBold(LocRow, 2) = BS.Local_Link_Errors > 0
		    if BS.Local_Link_Errors <= 0 And not(BS.Expanded) And BS.Sub_Link_Errors > 0 then
		      CellItalic(LocRow, 2) = true
		    end
		    CellItalic(LocRow,0) = BS.Name_Error
		    if BS IsA Test_StepClass then
		      CellType( LocRow, 3) = 2
		      CellCheck(LocRow, 3) = not(Test_StepClass(BS).ExecuteSkip.GIAB)
		    else
		      CellType( LocRow, 3) = 0
		    End
		    RowPicture(LocRow) = ElementTypeFactory.instance.getBasicStepIcon(BS)
		    
		    If BS.Name.FirstValue = "TESSA_FrameWork" Then
		      RowPicture(LocRow) = TESSA_icon_16
		    End If
		    
		    if BS IsA StepClass then
		      CellType( LocRow, 4) = 2
		      CellCheck(LocRow, 4) = StepClass(BS).DebugOn
		    end
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Highlight(LocalStep as BasicClass)
		  If LocalStep<>nil Then
		    If mActiveElementMode = ActiveElementEnum.FollowExecution Then
		      SetScrollClass(LocalStep)
		    ElseIf mActiveElementMode = ActiveElementEnum.WatchPermanently Then
		      RaiseEvent DidUpdate (mActiveUserStep)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PasteStepFromClipboard() As Boolean
		  Dim c As new Clipboard
		  If c.RawDataAvailable(ObjectRawData) Then
		    PasteElement(c.RawData(ObjectRawData))
		    Return True
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TreeOpened()
		  AcceptRawDataDrop("tessa.abspath") // for FolderItem.NativePath values
		  AcceptRawDataDrop("tessa.id")
		  
		  For i As Integer = 0 to Me.ColumnCount - 1
		    HeaderType(i) = Listbox.HeaderTypes.NotSortable
		  Next
		  columnWidths="*,30,30,30,0"
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AddedContextMenuAction(hitItem As MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AddToContextMenu(base As MenuItem, x As Integer, y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DeleteElement(BS As BasicClass)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidUpdate(BS As BasicClass)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PasteElement(source As String)
	#tag EndHook


	#tag Property, Flags = &h0
		mActiveElementMode As ActiveElementEnum = ActiveElementEnum.DoNone
	#tag EndProperty

	#tag Property, Flags = &h0
		rowMouseOver As Integer = -1
	#tag EndProperty


	#tag Enum, Name = ActiveElementEnum, Flags = &h0
		DoNone = 0
		  WatchPermanently = 1
		FollowExecution = 2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActiveRow"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="genericTblHorizontal"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ActiveColumn"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListboxType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="LboxType"
			EditorType="Enum"
			#tag EnumValues
				"0 - HTL"
				"1 - AttributesList"
				"2 - Generic"
				"3 - TeststepList"
				"4 - ResourceList"
				"5 - ElementList"
			#tag EndEnumValues
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
			Name="HasBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontalStyle"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Borders"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVerticalStyle"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Borders"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeader"
			Visible=true
			Group="Appearance"
			InitialValue="False"
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
			Name="HasHorizontalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasVerticalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DropIndicatorVisible"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontName"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowResizableColumns"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRowDragging"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRowReordering"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowExpandableRows"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowSelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="RowSelectionTypes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			InitialValue=""
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			InitialValue=""
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
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
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue=""
			Type="Boolean"
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
			Name="mActiveElementMode"
			Visible=false
			Group="Behavior"
			InitialValue="ActiveElementEnum.DoNone"
			Type="ActiveElementEnum"
			EditorType="Enum"
			#tag EnumValues
				"0 - DoNone"
				"1 - WatchPermanently"
				"2 - FollowExecution"
			#tag EndEnumValues
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
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			InitialValue=""
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
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue=""
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
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Visible=false
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Visible=false
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rowMouseOver"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
