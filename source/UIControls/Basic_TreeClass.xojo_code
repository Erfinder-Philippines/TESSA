#tag Class
Protected Class Basic_TreeClass
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  //To prevent pixel-cracking
		  g.AntiAlias = False
		  //BG Color of the listbox
		  #If TargetWindows Then
		    g.DrawingColor = Color.RGBA(240,240,240,0)
		  #ElseIf TargetMacOS
		    g.DrawingColor = Color.RGBA(235,236,235,0)
		  #Else
		    g.DrawingColor = Color.RGBA(240,240,240,0)
		  #EndIf
		  //Mouse over effects
		  
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  //Selected row
		  If row = me.SelectedRowIndex Then
		    //BG
		    'g.DrawingColor = Color.RGBA(204,232,255,0)
		    g.DrawingColor = Color.RGBA(255,255,255,0)
		    g.FillRectangle(0, 0, g.Width, g.Height)
		    if column = 0 then
		      g.DrawingColor = &c2589FF
		      g.FillRectangle(0, 0, 2, g.Height)
		    End If
		  End If
		  
		  if row < Me.ListCount and column < Me.ColumnCount then
		    // coloring of the main node object
		    Dim BS As BasicClass = CellTag(row, 0)
		    If BS <> Nil Then
		      if BS IsA Resource_StepClass And Cell(row, 2) = "<" Then
		        g.DrawingColor = &c0000FF
		        g.FillRectangle(0, 0, g.width, g.height)
		      End If
		    End If
		    // coloring of the linked node
		    If Cell(row, 2) = "<" Then
		      g.DrawingColor = &cFFFF99
		      g.FillRectangle(0, 0, g.Width, g.Height)
		    ElseIf Cell(row, 2) = ">" Then
		      g.DrawingColor = &cFF0000
		      g.FillRectangle(0, 0, g.Width, g.Height)
		    End If
		  End If
		  Return True
		  
		  //OLD CODE
		  'if row < Me.ListCount and column < Me.ColumnCount then
		  '// coloring of the main node object
		  'Dim BS As BasicClass = CellTag(row, 0)
		  'If BS <> Nil Then
		  'if BS IsA Resource_StepClass And Cell(row, 2) = "<" Then
		  'g.ForeColor = &c0000FF
		  'g.FillRect(0, 0, g.width, g.height)
		  'Return True
		  'Else
		  'Dim colorFactor As UInt8 = 250 - WorkspaceSettings.MainTreeContrast.GIAD * CellTag(Row, 1)
		  'g.ForeColor = RGB(colorFactor, colorFactor, colorFactor)
		  'g.FillRect(0, 0, g.Width, g.Height)
		  'Return True
		  'End
		  'End
		  '// coloring of the linked node
		  'If Cell(row, 2) = "<" Then
		  'g.ForeColor = &cFFFF99
		  'g.FillRect(0, 0, g.Width, g.Height)
		  'Return True
		  'ElseIf Cell(row, 2) = ">" Then
		  'g.ForeColor = &cFF0000
		  'g.FillRect(0, 0, g.Width, g.Height)
		  'Return True
		  'End If
		  'End
		  'Return False
		End Function
	#tag EndEvent

	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  // we check x and y to avoid warnings :-(
		  If x >= 0 And y >= 0 Then
		    g.FontSize = 10
		    If column = 0 Then
		      g.DrawingColor = &c242424
		    Else
		      g.DrawingColor = &c8C8C8C
		    End If
		    
		    If row = me.SelectedRowIndex Then
		      g.DrawingColor = &c000000
		    End If
		    
		    // coloring of the main node object
		    Dim BS As BasicClass = CellTag(row, 0)
		    If BS <> Nil Then
		      if BS IsA Resource_StepClass And Cell(row, 2) = "<" Then
		        g.DrawingColor = &cFFFFFF
		      End If
		    End If
		    // coloring of the linked node
		    If Cell(row, 2) = "<" Then
		      g.DrawingColor = &c000000
		    ElseIf Cell(row, 2) = ">" Then
		      g.DrawingColor = &cFFFFFF
		    End If
		  End
		  
		  // ask for redraw of the text
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub CollapseRow(row As Integer)
		  If Not Me.Expanded(row) Then
		    Dim tag As Variant = CellTag(row, 0)
		    Dim node As Basic_NodeClass = FindNode(tag)
		    If node <> Nil Then
		      CollapseNode(node)
		      node.AttributesShown = false
		    End
		  End
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  dim row as Integer = Me.RowFromXY(x, y)
		  If row >= 0 Then
		    Dim tag As Variant = CellTag(row, 0)
		    Dim node As Basic_NodeClass = FindNode(tag)
		    If node <> nil Then
		      If node.HasChildren and RowExpandedAt(row) and NOT node.AttributesShown Then
		        dim showAttr As New MenuItem("Show Attributes")
		        showAttr.Tag = row
		        base.AddMenu(showAttr)
		      ElseIf node.HasChildren and RowExpandedAt(row) and node.AttributesShown Then
		        dim hideAttr As New MenuItem("Hide Attributes")
		        hideAttr.Tag = row
		        base.AddMenu(hideAttr)
		      End If
		    End If
		  End If
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Dim row as Integer = hitItem.Tag
		  Dim tag As Variant = CellTag(row, 0)
		  Dim node As Basic_NodeClass = FindNode(tag)
		  If node <> nil Then
		    Select Case hitItem.Value
		    Case "Show Attributes"
		      'me.AddRowAt(row + 1, "Sample", Node.Indent + 1)
		      AddNodeAttrs(node)
		      node.AttributesShown = True
		      UpdateRowNumbers
		    Case "Hide Attributes"
		      For removeFrom as Integer = row + node.AttrCount DownTo row + 1
		        RemoveRowAt(removeFrom)
		      Next
		      node.AttributesShown = False
		      UpdateRowNumbers
		    End Select
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Function DisclosureWidgetPaint(g As Graphics, row As Integer, ByRef x As Integer, ByRef y As Integer, ByRef width As Integer, ByRef height As Integer) As Boolean
		  If me.RowExpandedAt(row) Then
		    g.DrawPicture(icon_disclosure_open, x, y)
		  Else
		    g.DrawPicture(icon_disclosure_closed, x, y)
		  End If
		  
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub ExpandRow(row As Integer)
		  If Me.Expanded(row) Then
		    Dim tag As Variant = CellTag(row, 0)
		    Dim node As Basic_NodeClass = FindNode(tag)
		    If node <> Nil Then
		      node.RowNr=row
		      ExpandNode(node)
		    End
		    UpdateRowNumbers
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddNode(Name As String, Vari As Variant, Pic As Picture, Ind As Integer, Folded As Boolean)
		  Dim Row As Integer = ListCount
		  // add new row
		  If Folded Then
		    InsertFolder(Row, Name, Ind)
		    // ANR: storing the indent in the CellTag of 1st column so the "Hierarchy Tree" can be colored depending on the indent 
		    CellTag(Row,1)=Ind
		  Else
		    InsertRow(Row, Name, Ind)
		    // ANR: storing the indent in the CellTag of 1st column so the "Hierarchy Tree" can be colored depending on the indent 
		    CellTag(Row,1)=Ind
		  End
		  
		  // update cells
		  CellTag(Row, 0) = Vari
		  RowPicture(Row) = Pic
		  Expanded(Row) = false
		  
		  // generate node and add attributes
		  Dim Node As Basic_NodeClass = New Basic_NodeClass
		  Node.SetData(Name, Vari, Pic, Ind, Folded, Row)
		  
		  If SelectedVarlistAttribute <> Nil Then
		    Dim bs As BasicClass = Vari
		    If bs <> Nil Then
		      If TypeDisplayAttr = 3 Then
		        Dim LinkAttr As AttributeClass = Nil
		        If SelectedVarlistAttribute IsA AttributeClass Then
		          LinkAttr = AttributeClass(SelectedVarlistAttribute).Link
		        End
		        If LinkAttr <> Nil Then
		          If LinkAttr.MyStep.GetUniqueID = bs.GetUniqueID Then
		            If Expanded(Row) = False Then
		              AddNodeAttrs(Node)
		            End
		            Expanded(Row) = true
		          End
		        End
		      ElseIf TypeDisplayAttr = 4 Then
		        For i As Integer = 0 To bs.AttributesUbound
		          Dim attr As AttributeClass = AttributeClass(bs.GetAttribute(i))
		          If attr <> Nil And attr.Link <> Nil Then
		            If attr.Link.MyStep.GetUniqueID = SelectedVarlistAttribute.MyStep.GetUniqueID And attr.Link.Name = SelectedVarlistAttribute.Name Then
		              If Expanded(Row) = False Then
		                AddNodeAttrs(Node)
		              End
		              Expanded(Row) = true
		            End
		          End
		        Next
		      ElseIf TypeDisplayAttr = 5 Then
		        UpdateLinkRow(row, bs, Nil, SelectedVarlistAttribute)
		      End
		    End
		  End
		  
		  // insert into the tree
		  If Ind = 0 Then
		    TopLevelNodes.Append(Node)
		  Else
		    Dim cnt As Integer = UBound(TopLevelNodes)
		    If cnt >= 0 Then
		      TopLevelNodes(cnt).AddChild(Node)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddNodeAttrs(Node As Basic_NodeClass)
		  If Node <> Nil Then
		    Dim BS As BasicClass = Node.BasicStep
		    If BS <> Nil Then
		      Dim AttrName As String = ""
		      
		      'If SelectedVarlistAttribute <> Nil Then
		      'If TypeDisplayAttr = 3 Then
		      'Dim LinkAttr As AttributeClass = Nil
		      'If SelectedVarlistAttribute IsA AttributeClass Then
		      'LinkAttr = AttributeClass(SelectedVarlistAttribute).Link
		      'End
		      'If LinkAttr <> Nil and LinkAttr.MyStep.GetUniqueID = BS.GetUniqueID Then
		      'AttrName = LinkAttr.Name
		      'End
		      'ElseIf TypeDisplayAttr = 4 Then
		      'AttrName = SelectedVarlistAttribute.Name
		      'End
		      'End
		      node.AttributesShown = True
		      Dim row As Integer
		      For idx As Integer = 0 To BS.AttributesUbound
		        Dim attr As AttributeClass = BS.GetAttribute(idx)
		        row = Node.RowNr + idx + 1
		        InsertRow(row, attr.Name, Node.Indent + 1)
		        
		        If App.GetTESSAState = 0 Then
		          Cell(row,1)=attr.GIAS
		        Else
		          Cell(row,1)=attr.GIAS
		          'Cell(row,1)=attr.GetAllValues
		        End
		        UpdateLinkRow(row, BS, attr, SelectedVarlistAttribute)
		        
		        Dim Child As Basic_NodeClass = New Basic_NodeClass
		        Child.SetData(attr.Name, Nil, Nil, Node.Indent + 1, False, row)
		      Next
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cleanup()
		  Me.DeleteAllRows
		  While UBound(TopLevelNodes) >= 0
		    Call TopLevelNodes.Pop
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Clear()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearHighlight()
		  For i As Integer = 0 to Me.ListCount - 1
		    If Me.Cell(i, 2) = ">" or Me.Cell(i, 2) = "<" Then
		      Me.Cell(i, 2) = ""
		      InvalidateCell(i, -1)
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CollapseNode(Node As Basic_NodeClass)
		  Dim Child As Basic_NodeClass
		  If Node <> Nil Then
		    For cnt As Integer = 0 To Ubound(Node.Children)
		      Child = Node.Children(cnt)
		      If Child <> Nil And Child.Expanded = True Then
		        Child.Expanded = False
		      End
		      CollapseNode(Child)
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExpandNode(Node As Basic_NodeClass, RootInd As Integer = - 1)
		  If Node <> Nil Then
		    dim attributeRowsCnt as Integer
		    If NOT node.HasChildren Then
		      attributeRowsCnt = Node.AttrCount
		      AddNodeAttrs(node)
		    Else
		      attributeRowsCnt = 0
		    End If
		    'AddNodeAttrs(node)
		    Dim row As Integer = Node.RowNr + attributeRowsCnt '+ Node.AttrCount
		    Dim ind As Integer
		    If RootInd < 0 Then
		      ind = Node.Indent
		    Else
		      ind = RootInd
		    End
		    Dim Child As Basic_NodeClass
		    For cnt As Integer = Ubound(Node.Children) DownTo 0
		      Child = Node.Children(cnt)
		      If Child <> Nil And Child.Expanded = False And Child.Indent > ind Then
		        If Child.Folded Then
		          InsertFolder(row + 1, Child.Name, Child.Indent)
		        Else
		          InsertRow(row + 1, Child.Name, Child.Indent)
		        End
		        CellTag(row + 1, 0) = Child.BasicStep
		        Child.Expanded = false
		        Child.RowNr = row + 1
		        RowPicture(row + 1) = Child.Image
		        // Setting expanded to true generates an invocation of
		        // ExpandRow for the actual node and therefore of this
		        // method. Hence, invoke only for nodes without children
		        If expanded(row + 1) = False And Child.HasChildren Then
		          //This part here opens/expands all the "children with children"
		          Expanded(row + 1)=False 'True
		        Else
		          'ExpandNode(Child, ind)
		        End
		      End
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindNode(BS As BasicClass) As Basic_NodeClass
		  Dim node As Basic_NodeClass = Nil
		  For cnt As Integer = 0 To UBound(TopLevelNodes)
		    node = TopLevelNodes(cnt).FindChild(BS)
		    If node <> Nil then
		      Return node
		    End
		  Next
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateLinkRow(row As Integer, BS As BasicClass, attr As AttributeClass, varlistAttr As AttributeClass)
		  If row >= 0 And row < ListCount Then
		    Dim value As String = ""
		    Select Case TypeDisplayAttr
		    Case 3
		      If varlistAttr IsA AttributeClass ANd BS <> Nil Then
		        Dim LinkAttr As AttributeClass = AttributeClass(varlistAttr).Link
		        If LinkAttr <> Nil and LinkAttr.MyStep.GetUniqueID = BS.GetUniqueID Then
		          Dim AttrName As String = LinkAttr.Name
		          If AttrName <> "" And attr <> Nil And attr.Name = AttrName Then
		            value = "<"
		          End
		        End
		      End
		    Case 4
		      If varlistAttr <> Nil Then
		        Dim AttrName As String = varlistAttr.Name
		        If AttrName <> "" And attr IsA AttributeClass Then
		          Dim linkAttr As AttributeClass = AttributeClass(attr)
		          If linkAttr <> Nil And linkAttr.Link <> Nil And linkAttr.Link.MyStep.GetUniqueID = varlistAttr.MyStep.GetUniqueID And linkAttr.Link.Name = AttrName Then
		            value = ">"
		          End
		        End
		      End
		    Case 5
		      If attr = Nil And BS IsA Resource_StepClass And varlistAttr <> Nil And varlistAttr.MyStep IsA StepClass then
		        Dim RRS As Resource_StepClass = StepClass(varlistAttr.MyStep).RelatedResource
		        If RRS <> Nil And RRS.GetUniqueID = BS.GetUniqueID Then
		          value = "<"
		        End
		      End
		    End
		    Cell(row, 2) = value
		    InvalidateCell(row, -1)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRowNumbers()
		  Dim node As Basic_NodeClass
		  Dim tag As Variant
		  For cnt As Integer = 0 To ListCount-1
		    tag = CellTag(cnt, 0)
		    node = FindNode(tag)
		    if node <> Nil Then
		      node.RowNr = cnt
		    End
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		SelectedVarlistAttribute As AttributeClass = Nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TopLevelNodes(-1) As Basic_NodeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		TypeDisplayAttr As Integer = 0
	#tag EndProperty


	#tag ViewBehavior
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
			Name="TypeDisplayAttr"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
