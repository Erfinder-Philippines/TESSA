#tag Class
Protected Class BasicTreeListBox
Inherits GraphicalListBox
	#tag Event
		Sub Change()
		  If Me.ListIndex >= 0 And mBasicClass <> Nil Then
		    mActiveUserStep = mBasicClass.FindElementByUniqueID(Me.RowTag(Me.ListIndex))
		    RaiseEvent StepSelected(mActiveUserStep)
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub CollapseRow(row As Integer)
		  //handle collapsing rows
		  If Not Expanded(row) And mBasicClass <> Nil Then
		    Dim S as string =RowTag(row)
		    Dim LS as BasicClass = mBasicClass.FindElementByUniqueID(S)
		    if (LS <> nil) then
		      LS.Expanded = false
		    end
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub ExpandRow(row As Integer)
		  //handle expanding rows
		  if Expanded(row) And mBasicClass <> Nil then
		    //find step belonging to that name
		    Dim BS as BasicClass = mBasicClass.FindElementByUniqueID(RowTag(row).StringValue)
		    if BS <> Nil then
		      Dim i As Integer = 0
		      BS.Get_Num_Incl_Elements(i)
		      row = row + 1
		      BS.Expanded = True
		      InsertExpandedRows(BS.FirstSubstep, row)
		    End
		  End
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Hierarchical = True
		  HasHeading = True
		  EnableDrag = True
		  TreeOpened
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ColappsAll()
		  Dim i As Integer = 0
		  While i < ListCount
		    Expanded(i) = False
		    i = i + 1
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExpandBasic(BS As BasicClass)
		  While (BS <> Nil) And (mBasicClass.GetUniqueID <> BS.GetUniqueID)
		    Dim row As Integer = GetRowByBasicClass(BS)
		    If row >= 0 Then
		      Expanded(row) = True
		    End
		    
		    BS = BS.UpperStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExpandedAll(StartStep As BasicClass)
		  If StartStep = Nil Then
		    StartStep = mBasicClass
		  End
		  Dim i As Integer = GetRowByBasicClass(StartStep)
		  If i >= 0 Then
		    While i < ListCount
		      Expanded(i) = True
		      i = i + 1
		    Wend
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExpandedTop()
		  Dim i As Integer = GetRowByBasicClass(mBasicClass)
		  If i >= 0 Then
		    Expanded(i) = True
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillTreeRow(LocRow As Integer, BS As BasicClass)
		  //virtual method need to be overidden
		  #Pragma Unused LocRow
		  #Pragma Unused BS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetActiveStep() As BasicClass
		  Return mActiveUserStep
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBasicClass() As BasicClass
		  Return mBasicClass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRowByBasicClass(BS As BasicClass) As Integer
		  If BS <> Nil Then
		    For i As Integer = 0 to ListCount - 1
		      If Me.RowTag(i) = BS.GetUniqueID Then
		        Return i
		      End
		    Next
		  End
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Highlight(LocalStep as BasicClass)
		  //virtual method
		  #Pragma Unused LocalStep
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InsertExpandedRows(FS as BasicClass, ByRef RowN as integer)
		  While FS <> Nil
		    
		    // Don't display the Tabs in the HTL
		    If FS IsA TabClass Then
		      FS = FS.NextStep
		      Continue
		    End If
		    
		    Dim LocRow As Integer = RowN
		    If FS = mActiveUserStep Then
		      ListIndex = RowN
		    End
		    If FS.FirstSubStep = Nil Then
		      InsertRow(RowN, FS.Name.GIAS, FS.Indent(mBasicClass))
		      // ANR: storing the indent in the CellTag of 1st column so the "Hierarchy Tree" can be colored depending on the indent 
		      CellTag(RowN,1)=FS.Indent(mBasicClass)
		      RowN = RowN + 1
		    Else
		      InsertFolder(RowN, FS.Name.GIAS, FS.Indent(mBasicClass))
		      // ANR: storing the indent in the CellTag of 1st column so the "Hierarchy Tree" can be colored depending on the indent 
		      CellTag(RowN,1)=FS.Indent(mBasicClass)
		      Expanded(RowN) = FS.Expanded
		      RowN = RowN + 1
		      If FS.Expanded Then
		        InsertExpandedRows(FS.FirstSubStep, RowN)
		      End
		    End
		    FillTreeRow(LocRow, FS)
		    
		    If FS.GetUniqueID <> mBasicClass.GetUniqueID Then
		      FS = FS.NextStep
		    Else
		      Return
		    End
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBasicClass(BS As BasicClass)
		  mBasicClass = BS
		  UpdateTree
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetScrollClass(BS As BasicClass)
		  If BS <> Nil Then
		    ExpandBasic(BS.UpperStep)
		  End
		  Dim position As Integer = GetRowByBasicClass(BS)
		  If position >= 0 Then
		    ScrollPosition = position
		    Selected(position) = True
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TreeOpened()
		  //vitual method
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateBasicStep(BS As BasicClass)
		  If BS <> Nil Then
		    Dim i As Integer = 0
		    BS.Get_Num_Incl_Elements(i)
		    FillTreeRow(GetRowByBasicClass(BS), BS)
		    Me.Refresh
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateTree()
		  If mBasicClass <> Nil Then
		    Dim r As integer
		    mBasicClass.Get_Num_Incl_Elements(r)
		    DeleteAllRows
		    r = 0
		    InsertExpandedRows(mBasicClass, r)
		  End
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event StepSelected(BS As BasicClass)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected mActiveUserStep As BasicClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mBasicClass As BasicClass = nil
	#tag EndProperty


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
	#tag EndViewBehavior
End Class
#tag EndClass
