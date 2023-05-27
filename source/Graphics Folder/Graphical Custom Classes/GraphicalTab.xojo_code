#tag Class
Protected Class GraphicalTab
	#tag Method, Flags = &h0
		Sub Constructor(label as String, icon as Picture)
		  TabPicture = New Picture(defaultTabWidth, defaultTabHeight, 16)
		  Width = defaultTabWidth
		  Height = defaultTabHeight
		  tabLabel = label
		  tabIcon = icon
		  drawThisTab
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawThisTab()
		  setTabColors
		  dim g as Graphics = TabPicture.Graphics
		  g.ClearRect(0, 0, g.Width, g.Height)
		  g.DrawingColor = tabColor
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  //Draw the label
		  'If isLabelVector Then
		  'Var s As New TextShape
		  's.FontSize = 20
		  's.FillColor = TextColor
		  's.HorizontalAlignment = TextShape.Alignment.Left
		  's.Value = tabLabel
		  's.FontName = "Helvetica"
		  's.X = 50
		  's.Y = 27
		  'g.DrawObject(s)
		  'Else
		  'g.FontUnit = FontUnits.Point
		  'g.DrawingColor = TextColor
		  'g.FontName = "Helvetica"
		  'g.FontSize = 20
		  'g.DrawText(tabLabel, 50, 27)
		  'End If
		  
		  If tabIcon <> Nil Then
		    //Draw the icon
		    'dim ratio as Double = min( defaultIconHeight / tabIcon.Height, defaultIconWidth / tabIcon.Width)
		    'dim w,h as Integer
		    'w = tabIcon.Width * ratio
		    'h = tabIcon.Height * ratio
		    'Dim x, y As Integer
		    'x = (defaultIconWidth / 2 - w / 2) + iconMarginLeft
		    'y = (defaultIconHeight / 2 - h / 2) + iconMarginTop
		    'g.DrawPicture(tabIcon, iconMarginLeft, y, w, h, 0, 0, tabIcon.Width, tabIcon.Height)
		  End If
		  
		  //Draw Tab line design
		  'g.PenSize = 2
		  If isSelected Then
		    g.DrawingColor = tabLineColor
		    'g.DrawLine(0,0,g.Width,0)
		    g.DrawRectangle(0,0,g.Width,2)
		  ElseIf isMouseHovered Then
		    g.DrawingColor = tabLineColor
		    'g.DrawLine(0,0,g.Width,0)
		    g.DrawRectangle(0,0,g.Width,2)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getTabPicture() As Picture
		  Return TabPicture
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeTab(new_width as Integer)
		  TabPicture = New Picture(new_width,self.Height)
		  Width = new_width
		  drawThisTab
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTabColors()
		  If isSelected Then
		    tabColor = selectedTabColor
		    tabLineColor = selectedTabLineColor
		    If darkModeEnabled Then
		      tabColor = darkModeSelected
		    End If
		  ElseIf isMouseHovered Then
		    tabColor = hoveredTabColor
		    tabLineColor = hoveredTabLineColor
		    If darkModeEnabled Then
		      tabColor = darkModeSelected
		    End If
		  Else
		    tabColor = defaultTabColor
		    If darkModeEnabled Then
		      tabColor = darkModeDefault
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WithinCursorArea(x as Integer, y as Integer) As Boolean
		  'If x >= Left And x <= Right And _
		  'y >= Top And y <= Bottom Then
		  'Return True
		  'End If
		  'Return False
		  Return (x >= Left And x <= Right And _
		  y >= Top And y <= Bottom)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Top + Height
			End Get
		#tag EndGetter
		Bottom As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdarkModeEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdarkModeEnabled = value
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Height As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		isMouseHovered As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		isSelected As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		isVectorString As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Left As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Left + Width
			End Get
		#tag EndGetter
		Right As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		tabColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		tabIcon As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		tabIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		tabLabel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		tabLineColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		TabPicture As Picture = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Top As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Width As Double
	#tag EndProperty


	#tag Constant, Name = darkModeDefault, Type = Color, Dynamic = False, Default = \"&c000000", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c23282D"
	#tag EndConstant

	#tag Constant, Name = darkModeSelected, Type = Color, Dynamic = False, Default = \"&c000000", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c2D3137"
	#tag EndConstant

	#tag Constant, Name = defaultIconHeight, Type = Double, Dynamic = False, Default = \"25", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"25"
	#tag EndConstant

	#tag Constant, Name = defaultIconWidth, Type = Double, Dynamic = False, Default = \"25", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"25"
	#tag EndConstant

	#tag Constant, Name = defaultTabColor, Type = Color, Dynamic = False, Default = \"&cE3E4E6", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&cE3E4E6"
	#tag EndConstant

	#tag Constant, Name = defaultTabHeight, Type = Double, Dynamic = False, Default = \"40", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"40"
	#tag EndConstant

	#tag Constant, Name = defaultTabWidth, Type = Double, Dynamic = False, Default = \"120", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"120"
	#tag EndConstant

	#tag Constant, Name = hoveredTabColor, Type = Color, Dynamic = False, Default = \"&cCCCDCF", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&cCCCDCF"
	#tag EndConstant

	#tag Constant, Name = hoveredTabLineColor, Type = Color, Dynamic = False, Default = \"&cA3A4A6", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&cA3A4A6"
	#tag EndConstant

	#tag Constant, Name = iconMarginLeft, Type = Double, Dynamic = False, Default = \"10", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"10"
	#tag EndConstant

	#tag Constant, Name = iconMarginTop, Type = Double, Dynamic = False, Default = \"8", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"8"
	#tag EndConstant

	#tag Constant, Name = selectedTabColor, Type = Color, Dynamic = False, Default = \"&cF5F6F7", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&cF5F6F7"
	#tag EndConstant

	#tag Constant, Name = selectedTabLineColor, Type = Color, Dynamic = False, Default = \"&c0A84FF", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c0A84FF"
	#tag EndConstant

	#tag Constant, Name = TextColor, Type = Color, Dynamic = False, Default = \"&c303030", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c303030"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Height"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Right"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bottom"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabLabel"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabIcon"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isSelected"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tabLineColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isMouseHovered"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isVectorString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="darkModeEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPicture"
			Visible=false
			Group="Behavior"
			InitialValue="Nil"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
