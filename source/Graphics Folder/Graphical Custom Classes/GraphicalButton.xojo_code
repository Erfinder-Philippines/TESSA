#tag Class
Protected Class GraphicalButton
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if not IsContextualClick then
		    Clicked = True
		    Self.Invalidate(False)
		    RaiseEvent LeftClick
		  end if
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  mouseHover = True
		  Self.Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  mouseHover = False
		  Self.Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Clicked = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If Me.Width <= 10 Or Me.height <= 10 Then Return
		  
		  dim pic as Picture = icon
		  dim captionColor as Color
		  
		  If darkModeEnabled Then
		    captionColor = Color.White
		  else
		    captionColor = &c494949
		  End If
		  
		  g.PenSize = 2
		  If useBackColor And Not mouseHover Then
		    g.DrawingColor = modifyColorAlpha(BackColor)
		    g.FillRectangle(0,0,me.Width, me.Height)
		    g.DrawingColor = BackColor
		    g.DrawRoundRectangle(0,0,me.Width, me.Height,5,5)
		  ElseIf mouseHover then
		    g.ForeColor = HoverHighlight
		    g.FillRectangle(0,0,me.Width, me.Height)
		    If Clicked Then
		      g.DrawingColor = &c494949
		      g.FillRectangle(0,0, g.Width, g.Height)
		      captionColor = color.White
		    Elseif Not Clicked Then
		      g.DrawingColor = &c2589FF
		      drawBorders(g,False)
		    End If
		  End If
		  
		  If Selected Then
		    g.DrawingColor = &c00DE80
		    drawBorders(g,True)
		  End If
		  
		  
		  dim w,h as Double
		  If pic <> nil Then
		    dim iconSize as Double = g.height * .60 
		    dim iconPadding as Integer = 10
		    If Caption.IsEmpty or IconAlignment <> -1 Then
		      //Use all the space of the canvas since there's no caption
		      iconSize = Me.Height
		    End If
		    dim ratio as Double = min( (iconSize - iconPadding) / pic.Height, _
		    (Me.Width - iconPadding) / pic.Width)
		    //maintain aspect ratio to fit in the canvas
		    w = pic.Width * ratio
		    h = pic.Height * ratio
		    //Center the image
		    Dim x, y As Double
		    x = Me.Width / 2 - w / 2
		    y = (iconSize / 2 - h / 2) + padding
		    If Caption.IsEmpty or IconAlignment <> -1 Then
		      //No top padding if no Caption
		      y = iconSize / 2 - h / 2
		    End If
		    Select Case IconAlignment
		    Case 0 //left align
		      x = 0 + padding
		    Case 1 //right align
		      x = Me.Width - w - padding
		    End Select
		    g.DrawPicture(pic, x, y, w, h, 0, 0, pic.Width, pic.Height)
		  End If
		  
		  g.FontUnit = FontUnits.Point
		  g.FontSize = 16
		  dim captionMargin as Integer = 0
		  If Not Caption.IsEmpty Then
		    captionMargin = me.Height * .15
		  End If
		  
		  If Not Caption.IsEmpty Then
		    dim maxCaptionWidth as Double = Me.width * .9
		    Select Case IconAlignment
		    Case 0, 1
		      maxCaptionWidth = (Me.width - w) * .9
		    End Select
		    While g.TextWidth(Caption) >= maxCaptionWidth
		      g.FontSize = g.FontSize - 1
		      if g.FontSize = 0 then return
		    Wend
		    //Position of the Caption
		    dim caption_w as Double = g.TextWidth(Caption)
		    dim caption_x as Double = g.Width/2 - caption_w/2
		    dim caption_y as Double = g.Height - (g.Height * .1)
		    If pic = nil or IconAlignment <> -1 Then
		      //Vertical Center the Caption
		      dim txtPadding as Double = g.TextHeight(Caption,maxCaptionWidth) /4
		      caption_y = ((g.Height + g.TextHeight(Caption,maxCaptionWidth))/2) - txtPadding
		      caption_x = g.Width/2 - caption_w/2
		      Select Case IconAlignment
		      Case 0
		        caption_x = (g.Width + w)/2 - caption_w/2
		      Case 1 
		        caption_x = (g.Width - w)/2 - caption_w/2
		      End Select
		    End If
		    g.DrawingColor = captionColor
		    g.DrawText(Caption,caption_x,caption_y)
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub drawBorders(g as Graphics, isRounded as Boolean)
		  Dim w As Double = g.Width - g.PenSize
		  Dim h As Double = g.Height - g.PenSize
		  Const arcRadius = 5
		  Dim x As Double = (g.Width - w) / 2
		  Dim y As Double = (g.Height - h) / 2
		  If isRounded Then
		    g.DrawRoundRectangle(x,y,w,h,arcRadius,arcRadius)
		  Else
		    g.DrawRectangle(x,y,w,h)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function modifyColorAlpha(currentC as Color) As Color
		  Var cAlpha as Integer = 200
		  Var hexColor as String = Str(currentC)
		  Var modifiedHex as String = hexColor.Middle(4)
		  //format of hex is &hAARRGGBB
		  //color format is &cRRGGBBAA
		  Var sliderAlphaHex as String = Hex(cAlpha)
		  modifiedHex = "&h" + sliderAlphaHex + modifiedHex
		  Var newColorInt As UInt32 = modifiedHex.Val
		  Var newColor As Color = Color(newColorInt)
		  Return newColor
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event LeftClick()
	#tag EndHook


	#tag Property, Flags = &h0
		BackColor As Color = &c000000
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Top + Height
			End Get
		#tag EndGetter
		Bottom As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCaption
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCaption = value
			End Set
		#tag EndSetter
		Caption As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Clicked As Boolean
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
			  Self.Invalidate(False)
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		icon As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Horizontal alignment
			// 0 = Left align
			// 1 = right align
			// - 1 = default center
		#tag EndNote
		IconAlignment As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaption As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mouseHover As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelected As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Left + Width
			End Get
		#tag EndGetter
		Right As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSelected
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelected = value
			  Self.Invalidate(False)
			End Set
		#tag EndSetter
		Selected As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		useBackColor As Boolean = False
	#tag EndProperty


	#tag Constant, Name = HoverHighlight, Type = Color, Dynamic = False, Default = \"&cFFFFFF7F", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&cFFFFFF7F"
	#tag EndConstant

	#tag Constant, Name = padding, Type = Double, Dynamic = False, Default = \"5", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"5"
	#tag EndConstant


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
			Name="icon"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Bottom"
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
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selected"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconAlignment"
			Visible=true
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"-1 - Center"
				"0 - Left"
				"1 - Right"
			#tag EndEnumValues
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
		#tag ViewProperty
			Name="BackColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="useBackColor"
			Visible=false
			Group="Behavior"
			InitialValue="False"
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
	#tag EndViewBehavior
End Class
#tag EndClass
