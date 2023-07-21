#tag Class
Protected Class GraphicalListbox
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  //Initialize the color scheme
		  dim rowColor_1, rowColor_2, textColor, selectedRowColor as Color
		  Select Case ListboxType
		  Case GraphicalListbox.LboxType.HTL
		    If darkModeEnabled Then
		      rowColor_2 = ColorHTLGreyDark_M
		      selectedRowColor = ColorHTLSelectDark_M
		    Else
		      rowColor_2 = &ce3e4e6 'ColorHTLGreyLight_M
		      selectedRowColor = Color.White
		    End If
		  Case GraphicalListbox.LboxType.ElementList
		    If darkModeEnabled Then
		      rowColor_2 = &c23282D
		      selectedRowColor = ColorHTLSelectDark_M
		    Else
		      rowColor_2 = Color.White
		      selectedRowColor = &c2589ff88
		    End If
		  Case GraphicalListbox.LboxType.AttributesList, GraphicalListbox.LboxType.Generic, _
		    GraphicalListbox.LboxType.TeststepList, GraphicalListbox.LboxType.ResourceList
		    If darkModeEnabled Then
		      rowColor_1 = ColorGrey
		      rowColor_2 = ColorDrkGrey
		      selectedRowColor = ColorSelectBlue
		    Else
		      rowColor_1 = &cFFFFFF
		      rowColor_2 = &cF8F8F8
		      selectedRowColor = ColorSelectBlue
		    End If
		  End Select
		  
		  //To prevent pixel-cracking
		  g.AntiAlias = False
		  
		  If row Mod 2 = 0 And ListboxType <> GraphicalListbox.LboxType.HTL And _
		    ListboxType <> GraphicalListbox.LboxType.ElementList Then
		    //Alternating rows
		    g.DrawingColor = rowColor_1
		    g.FillRectangle(-5, -5, g.Width+10, g.Height+10)
		  Else
		    g.DrawingColor = rowColor_2
		    g.FillRectangle(-5, -5, g.Width+10, g.Height+10)
		  End If
		  
		  //draw right-side column border
		  If column <> LastColumnIndex And ListboxType <> GraphicalListbox.LboxType.HTL And _
		    ListboxType <> GraphicalListbox.LboxType.TeststepList Then
		    g.PenSize = 1
		    g.DrawingColor = ColorLightGrey
		    g.FillRectangle g.Width - 1, -10, g.Width - 1, g.Height + 10
		  End If
		  
		  If ListboxType = GraphicalListbox.LboxType.Generic Then
		    If RowCount > 0 And row < RowCount Then
		      If (Not genericTblHorizontal And RowTagAt(row) <> Nil) Or (column = ActiveColumn And genericTblHorizontal) Then
		        g.DrawingColor = &cA3C7FF
		        g.FillRectangle(-10, -10, g.Width + 10, g.Height + 10)
		      End If
		    End If
		  End If
		  
		  //Selected row, default color
		  If row = Me.SelectedRowIndex And ListboxType <> GraphicalListbox.LboxType.TeststepList _ 
		    And ListboxType <> GraphicalListbox.LboxType.AttributesList Then
		    g.DrawingColor = selectedRowColor
		    g.FillRectangle(0, 0, g.Width, g.Height)
		    If column = 0 Then
		      g.DrawingColor = ColorSelectHTLBlue
		      g.FillRectangle(0, 0, 2, g.Height)
		    End If
		  Elseif row = Me.SelectedRowIndex And ListboxType = GraphicalListbox.LboxType.TeststepList Then
		    If column = 0 Then
		      g.DrawingColor = ColorSelectTSRed
		      g.FillRectangle(0, 0, 2, g.Height)
		    End If
		  End If
		  
		  Select Case(ListboxType)
		  Case GraphicalListbox.LboxType.HTL
		    If (Row < ListCount)  Then
		      Select Case Column
		      Case 0
		        // now colour the different hierarchy levels instead (the indent is stored in CellTag of the 1st. column):
		        'Dim colorFactor As UInt8 = 250 - WorkspaceSettings.MainTreeContrast.GIAD * CellTag(Row, 1)
		        'g.DrawingColor = RGB(colorFactor, colorFactor, colorFactor)
		        'g.FillRect(0, 0, g.Width, g.Height)
		        
		        If Me.CellItalic(Row,Column) Then
		          g.DrawingColor = &cFFA0A0
		          g.FillRect (0, 0, g.width, g.height)
		        End
		        
		        //draw drop rect
		        Select Case CellTag(row, column)
		        Case  1
		          g.DrawingColor = RGB(51,153,255)
		          g.FillRect(0, 0, g.Width, 4)
		        Case  2
		          g.DrawingColor = RGB(51,153,255)
		          g.FillRect(0, g.Height - 4, g.Width, 4)
		        Case 3
		          g.DrawingColor = RGB(51,153,255)
		          g.FillRect(0,0, g.Width, g.Height)
		        End
		        
		        // For CheckValue FAIL
		        Dim BS As BasicClass
		        If RowTagAt(row) <> Nil And App.GlobalTestSequence <> Nil Then
		          BS = App.GlobalTestSequence.FindElementByUniqueID(RowTagAt(row).StringValue)
		          If BS <> Nil And BS IsA CheckValue_StepClass Then
		            If CheckValue_StepClass(BS).ExecuteTest.GIAB _
		              And Not CheckValue_StepClass(BS).Result.GIAB Then
		              g.DrawingColor = ColorSelectTSRed
		              g.FillRectangle(0, 0, 10, g.Height)
		            End If
		          End If
		        End If
		        
		      case 2
		        dim rectW, rectH as Double
		        If g.Height >= g.Width Then
		          rectW = g.Width * .75
		          rectH = rectW
		        Else
		          rectW = g.Height * .75
		          rectH = rectW
		        End If
		        //Center the rect
		        Dim x, y As Integer
		        x = g.Width / 2 - rectW / 2
		        y = g.Height / 2 - rectH / 2
		        g.AntiAliased = True
		        if CellBold(Row,Column) then
		          g.DrawingColor = &cFFA0A0
		          g.FillRoundRectangle(x,y,rectW,rectH,10,10)
		        ElseIf Cell(Row,2).Mid(1,1)="C" Then
		          g.DrawingColor = &cA0FFA0
		          g.FillRoundRectangle(x,y,rectW,rectH,10,10)
		        ElseIf Cell(Row,2).Mid(1,1)="O" Then
		          g.DrawingColor = &cFFCC62
		          If CellTagAt(Row, 2) = "O" Then
		            g.DrawingColor = &cA9A9A9
		          End If
		          g.FillRoundRectangle(x,y,rectW,rectH,10,10)
		        ElseIf Cell(Row,2).Mid(1,1)="X" Then
		          g.DrawingColor = &cFFA0A0
		          g.FillRoundRectangle(x,y,rectW,rectH,10,10)
		        end
		      end
		    End
		  Case GraphicalListbox.LboxType.AttributesList
		    //Special colors for a cell
		    if (Row<Me.ListCount) and (Column<Me.ColumnCount) then
		      if Me.CellTag(Row,Column)=nil then
		        if Me.CellBold(Row,Column) then
		          if Me.CellItalic(Row,Column) then
		            g.DrawingColor=&cA0FFA0
		          else
		            g.DrawingColor=&cFFA0A0
		          end if
		          g.FillRect 0,0,g.width,g.height
		        else
		          // links
		          If column = ActiveColumn And SelectedRowIndex = row  Then
		            g.DrawingColor=&cFFFF99
		            g.FillRectangle(0,0,g.width,g.height)
		            return True
		          End
		        end if
		      else
		        g.DrawingColor=Me.CellTag(Row,Column)
		        g.FillRect(0,0,g.width,g.height)
		      end if
		    End If
		    
		    If row = Me.SelectedRowIndex Then
		      g.DrawingColor = selectedRowColor
		      g.FillRectangle(0, 0, g.Width, g.Height)
		      If column = 0 Then
		        g.DrawingColor = ColorSelectHTLBlue
		        g.FillRectangle(0, 0, 2, g.Height)
		      End If
		    End If
		    
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If x >= 0 And y >= 0 Then
		    g.FontUnit = me.FontUnit
		    g.FontSize = me.FontSize
		    dim textColor,attrNameColor as Color
		    
		    Select Case(ListboxType)
		    Case GraphicalListbox.LboxType.HTL, _
		      GraphicalListbox.LboxType.ElementList
		      If darkModeEnabled Then
		        textColor = Color.White
		      Else
		        textColor = ColorDrkGrey
		      End If
		    Case GraphicalListbox.LboxType.AttributesList, _
		      GraphicalListbox.LboxType.Generic
		      If darkModeEnabled Then
		        TextColor = ColorTxtLightGrey
		        attrNameColor = Color.White
		      Else
		        TextColor = ColorTxtDarkGrey
		        attrNameColor = Color.Black
		      End If
		    Case GraphicalListbox.LboxType.TeststepList
		      If darkModeEnabled Then
		        textColor = ColorLightGrey
		        attrNameColor = Color.White
		      Else
		        textColor = ColorLightGrey
		        attrNameColor = Color.Black
		      End If
		    Case GraphicalListbox.LboxType.ResourceList
		      If darkModeEnabled Then
		        textColor = Color.White
		        attrNameColor = Color.White
		      Else
		        textColor = Color.Black
		        attrNameColor = Color.Black
		      End If
		    End Select
		    
		    g.DrawingColor = textColor
		    
		    If ListboxType = GraphicalListbox.LboxType.AttributesList And column = 0 Then
		      g.DrawingColor = attrNameColor
		    End If
		    
		    If row = SelectedRowIndex And (ListboxType = GraphicalListbox.LboxType.AttributesList _ 
		      OR ListboxType = GraphicalListbox.LboxType.Generic _
		      OR ListboxType = GraphicalListbox.LboxType.ResourceList) Then
		      g.DrawingColor = Color.White
		    End If
		    
		    If column = 0 and ListboxType = GraphicalListbox.LboxType.TeststepList Then
		      g.DrawingColor = attrNameColor
		    ElseIf column = 1 and ListboxType = GraphicalListbox.LboxType.TeststepList Then
		      g.DrawingColor = textColor
		      Select case Cell(Row,Column)
		      case is="Pass"
		        g.DrawingColor=&c00DE80
		      case is="Fail"
		        g.DrawingColor=&cFF6E6E
		      case is="Skipped"
		        g.DrawingColor=&cFFC908
		      case is="InProgress"
		        g.DrawingColor=&c0063E0 '&c4a90e2
		        g.FillRectangle(g.Width - 2,0,g.Width - 2,g.Height)
		      end
		    Elseif(Row < ListCount) and (Column = 1)_
		      And ListboxType = GraphicalListbox.LboxType.ResourceList Then
		      if Cell(row,1)="ok" then
		        g.DrawingColor=&c00DE80 'A0FFA0
		        g.FillRectangle(g.Width - 2,0,g.Width - 2,g.Height)
		      else
		        g.DrawingColor=&cFF6E6E 'FFA0A0
		        g.FillRectangle(g.Width - 2,0,g.Width - 2,g.Height)
		      end if
		    End If
		  End If
		  
		  Select Case(ListboxType)
		  Case GraphicalListbox.LboxType.HTL
		    If column = 0 Then
		      g.FontSize = 14
		    Else
		      g.FontSize = 12
		      Me.CellAlignmentAt(row,column) = ListBox.Alignments.Center
		    End If
		  Case GraphicalListbox.LboxType.AttributesList
		    g.FontSize = 12
		    // links
		    If column = ActiveColumn And SelectedRowIndex = row  Then
		      g.DrawingColor=&c000000
		    End If
		    If Me.CellTag(Row,Column) <> nil Then
		      g.DrawingColor = Color.Black
		      If SelectedRowIndex = row Then
		        g.DrawingColor = Color.White
		      End If
		    End If
		    
		  Case GraphicalListbox.LboxType.Generic
		    If RowCount > 0 And row < RowCount Then
		      If ((Not genericTblHorizontal And RowTagAt(row) <> Nil) _ 
		        Or (column = ActiveColumn And genericTblHorizontal)) _ 
		        And row <> SelectedRowIndex Then
		        g.DrawingColor = Color.Black
		      End If
		    End If
		  End Select
		  
		  Return False
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		ActiveColumn As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		ActiveRow As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdarkModeEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdarkModeEnabled = value
			  Invalidate(False)
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		genericTblHorizontal As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ListboxType As LboxType
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty


	#tag Constant, Name = AttributesList, Type = Double, Dynamic = False, Default = \"1", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"1"
	#tag EndConstant

	#tag Constant, Name = ColorDrkGrey, Type = Color, Dynamic = False, Default = \"&c23272D", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c23272D"
	#tag EndConstant

	#tag Constant, Name = ColorGrey, Type = Color, Dynamic = False, Default = \"&c2D3137", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c2D3137"
	#tag EndConstant

	#tag Constant, Name = ColorHTLGreyDark_M, Type = Color, Dynamic = False, Default = \"&c242B31", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c242B31"
	#tag EndConstant

	#tag Constant, Name = ColorHTLGreyLight_M, Type = Color, Dynamic = False, Default = \"&cF0F0F0", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&cF0F0F0"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"&cEBECEB"
	#tag EndConstant

	#tag Constant, Name = ColorHTLSelectDark_M, Type = Color, Dynamic = False, Default = \"&c4E5964", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c4E5964"
	#tag EndConstant

	#tag Constant, Name = ColorLightGrey, Type = Color, Dynamic = False, Default = \"&c8C8C8C", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c8C8C8C"
	#tag EndConstant

	#tag Constant, Name = ColorSelectBlue, Type = Color, Dynamic = False, Default = \"&c2B69D2", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c2B69D2"
	#tag EndConstant

	#tag Constant, Name = ColorSelectHTLBlue, Type = Color, Dynamic = False, Default = \"&c2589FF", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c2589FF"
	#tag EndConstant

	#tag Constant, Name = ColorSelectTSRed, Type = Color, Dynamic = False, Default = \"&cFC4A34", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&cFC4A34"
	#tag EndConstant

	#tag Constant, Name = ColorTxtDarkGrey, Type = Color, Dynamic = False, Default = \"&c575A5E", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c575A5E"
	#tag EndConstant

	#tag Constant, Name = ColorTxtLightGrey, Type = Color, Dynamic = False, Default = \"&cC1C1C1", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&cC1C1C1"
	#tag EndConstant

	#tag Constant, Name = ElementList, Type = Double, Dynamic = False, Default = \"4", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"5"
	#tag EndConstant

	#tag Constant, Name = Generic, Type = Double, Dynamic = False, Default = \"2", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"2"
	#tag EndConstant

	#tag Constant, Name = HTL, Type = Double, Dynamic = False, Default = \"0", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"0"
	#tag EndConstant

	#tag Constant, Name = ResourceList, Type = Double, Dynamic = False, Default = \"4", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"4"
	#tag EndConstant

	#tag Constant, Name = TeststepList, Type = Double, Dynamic = False, Default = \"3", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"3"
	#tag EndConstant


	#tag Enum, Name = LboxType, Type = Integer, Flags = &h0
		HTL
		  AttributesList
		  Generic
		  TeststepList
		  ResourceList
		ElementList
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
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
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
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
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
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
			Name="InitialValue"
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
			Name="Transparent"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue="False"
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
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
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
			Name="DataField"
			Visible=true
			Group="Database Binding"
			InitialValue=""
			Type="String"
			EditorType="DataField"
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
			Name="RequiresSelection"
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
			Name="ActiveColumn"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
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
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
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
	#tag EndViewBehavior
End Class
#tag EndClass
