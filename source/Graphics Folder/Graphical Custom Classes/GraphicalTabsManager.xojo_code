#tag Class
Protected Class GraphicalTabsManager
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If not IsContextualClick then
		    
		    For each tab as GraphicalTab in Tabs
		      If tab.WithinCursorArea(x,y) Then
		        deselectTabs
		        SelectTab(tab.tabIndex)
		        Exit
		      End If
		    Next
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  For each tab as GraphicalTab in Tabs
		    tab.isMouseHovered = False
		    Self.Invalidate(False)
		  Next
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  For each tab as GraphicalTab in Tabs
		    If tab.WithinCursorArea(x,y) Then
		      tab.isMouseHovered = True
		    Else
		      tab.isMouseHovered = False
		    End If
		    Self.Invalidate(False)
		  Next
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  ResizeNow
		  
		  If Not darkModeEnabled Then
		    g.DrawingColor = &ce3e4e6
		    g.FillRectangle 0,0,g.Width, g.Height
		  End If
		  
		  Dim textColor, textColorSelected as Color
		  g.DrawPicture(drawTabs, 0, 0)
		  If darkModeEnabled Then
		    textColor = &c8C8C8C '&cF5F6F7
		    textColorSelected = Color.White
		  Else
		    textColor = &c575A5E
		    textColorSelected = Color.Black
		  End If
		  
		  //Drawing the labels in the paint event, instead in
		  //the "drawThisTab" as picture. This way produces
		  //better graphics
		  const iconMarginRight = 20
		  For each tab as GraphicalTab in Tabs
		    g.FontUnit = FontUnits.Point
		    g.DrawingColor = textColor
		    If tab.isSelected Then
		      g.DrawingColor = textColorSelected
		    End If
		    g.FontSize = 16
		    
		    //Font size adjustment
		    dim maxCaptionWidth as Double = tab.Width - iconMarginRight
		    While g.TextWidth(tab.tabLabel) >= maxCaptionWidth
		      g.FontSize = g.FontSize - 1
		      if g.FontSize = 0 then return
		    Wend
		    // Vertical center the Label
		    dim txtPadding as Double = g.TextHeight(tab.tabLabel,maxCaptionWidth) /4
		    dim label_y as Double
		    label_y = ((tab.Height + g.TextHeight(tab.tabLabel,maxCaptionWidth))/2) - txtPadding
		    g.DrawText(tab.tabLabel, tab.Left + iconMarginRight, label_y)
		    
		    //draw it as vector. But as I observed it doesn't
		    //have much difference how it looks
		    'Var s As New TextShape
		    's.FontSize = 15
		    's.FillColor = Color.Black
		    's.HorizontalAlignment = TextShape.Alignment.Left
		    's.Value = tab.tabLabel
		    's.FontName = "Helvetica"
		    's.X = tab.Left + 50
		    's.Y = 27
		    'g.DrawObject(s)
		  Next
		  
		  'g.DrawingColor = color.Red
		  'g.DrawRectangle(0,0,g.width,g.Height)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddTab(tab as GraphicalTab)
		  If NumberOfTabs > -1 Then
		    tab.tabIndex = NumberOfTabs + 1
		  Else
		    tab.tabIndex = 0
		  End If
		  Tabs.AddRow(tab)
		  Self.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub checkSelectedTab()
		  For Each tab As GraphicalTab In Tabs
		    If tab.isSelected Then
		      selectedTabIndex = tab.tabIndex
		      Return
		    End If
		  Next
		  Self.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DarkModeTabs()
		  For each tab as GraphicalTab in Tabs
		    tab.darkModeEnabled = darkModeEnabled
		  Next
		  Self.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deselectTabs()
		  For each tab as GraphicalTab in Tabs
		    tab.isSelected = False
		  Next
		  selectedTabIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function drawTabs() As Picture
		  dim pic as New Picture(me.Width, me.Height)
		  dim g as Graphics = pic.Graphics
		  dim posX as Double = 0
		  dim posY as Double = 0
		  
		  For each tab as GraphicalTab in Tabs
		    tab.darkModeEnabled = darkModeEnabled
		    tab.Left = posX
		    tab.Top = posY
		    tab.drawThisTab
		    If tab.Right > self.Width Then
		      ResizeTabs
		    End If
		    g.DrawPicture(tab.getTabPicture, posX, posY)
		    posX = posX + tab.Width
		  Next
		  
		  return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfTabs() As Integer
		  return Tabs.LastRowIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllTabs()
		  If Tabs.LastRowIndex > -1 Then
		    Tabs.RemoveAllRows
		  End If
		  Self.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveTab()
		  If Tabs.LastRowIndex > -1 Then
		    //If the selected tab is removed, new selected tab
		    //is the adjacent tab
		    If selectedTabIndex = Tabs.LastRowIndex and selectedTabIndex <> 0 Then
		      deselectTabs
		      SelectTab(Tabs.LastRowIndex - 1)
		    End If
		    
		    Tabs.RemoveRowAt(Tabs.LastRowIndex)
		  End If
		  Self.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeNow()
		  //Resize the tabs properly if a tab is removed
		  
		  If Tabs.LastRowIndex <> -1 Then
		    If Tabs(0).Width <> Tabs(0).defaultTabWidth Then
		      If Tabs(0).defaultTabWidth * Tabs.Count < Self.Width Then
		        //use the default tab width if everything can fit inside
		        ResizeTabs(Tabs(0).defaultTabWidth)
		      Else
		        //divide the tab widths equally so everything can fit inside
		        ResizeTabs
		      End If
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeTabs()
		  If Tabs.LastRowIndex = -1 Then
		    Return
		  End If
		  
		  dim newTabWidth as Double = self.Width / Tabs.Count
		  
		  For each tab as GraphicalTab in Tabs
		    tab.ResizeTab(newTabWidth)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeTabs(newTabWidth as Double)
		  If Tabs.LastRowIndex = -1 Then
		    Return
		  End If
		  
		  For each tab as GraphicalTab in Tabs
		    tab.ResizeTab(newTabWidth)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectTab(tabIndex as Integer)
		  If tabIndex <= NumberOfTabs And tabIndex > -1 Then
		    deselectTabs
		    Tabs(tabIndex).isSelected = True
		    selectedTabIndex = tabIndex
		    RaiseEvent TabChanged(selectedTabIndex)
		  End If
		  Self.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectTab(tabIndex as Integer, forceChange as Boolean)
		  If tabIndex <= NumberOfTabs And tabIndex > -1 Then
		    deselectTabs
		    Tabs(tabIndex).isSelected = True
		    selectedTabIndex = tabIndex
		    If forceChange Then
		      RaiseEvent TabChanged(selectedTabIndex)
		    End If
		  End If
		  Self.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TabAt(index as Integer) As GraphicalTab
		  Return Tabs(index)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event TabChanged(index as Integer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdarkModeEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdarkModeEnabled = value
			  DarkModeTabs
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedTabIndex As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		Tabs() As GraphicalTab
	#tag EndProperty


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
			InitialValue="False"
			Type="Boolean"
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
			Name="selectedTabIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
