#tag Window
Begin ContainerControl CustomTextField
   AllowAutoDeactivate=   True
   AllowFocus      =   True
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   40
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   318
   Begin TextField TxtField
      AllowAutoDeactivate=   True
      AllowFocusRing  =   False
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFAFAFA00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   False
      Height          =   25
      Hint            =   "Enter Text Here"
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   -28
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   False
      Width           =   231
   End
   Begin Label TxtLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   15
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   13
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   231
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub GotFocus()
		  TxtField.SetFocus
		  ShowTextField(True)
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  TxtField.SetFocus
		  isFocused = True
		  ShowTextField(True)
		  
		  If WithinIconArea(X,Y) And Not IsContextualClick Then
		    RaiseEvent IconAction
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  Self.MouseCursor = System.Cursors.IBeam
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  Self.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If WithinIconArea(X,Y) Then
		    IconHovered = True
		    Self.MouseCursor = System.Cursors.StandardPointer
		  Else
		    IconHovered = False
		  End If
		  Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If Width < 10 Or Height < 10 Then Return
		  'TxtField.BackgroundColor = baseColor
		  dim outline as Color
		  If isFocused Then
		    outline = outlineColorSelected
		  Else
		    outline = outlineColor
		  End If
		  
		  dim bg, base as Color 
		  If darkModeEnabled Then
		    bg = &c2D3137
		    base = baseColorDark
		  Else
		    bg = &cF5F6F7
		    base = baseColor
		  End If
		  g.DrawingColor = bg
		  g.FillRectangle(0,0,g.Width,g.Height)
		  'g.DrawingColor = color.red
		  'g.FillRectangle(0,0,g.Width,g.Height)
		  //Use n% <> 100% of the canvas
		  roundRectWidth = g.Width * .99
		  roundRectHeight = g.Height * .9
		  dim arcAmount as Double= roundRectHeight
		  //Center the roundRect
		  dim x,y as Double
		  x = g.Width/2 - roundRectWidth/2
		  y = g.Height/2 - roundRectHeight/2
		  
		  //draw the base
		  g.DrawingColor = base
		  g.FillRoundRectangle(x, y, roundRectWidth, roundRectHeight, arcAmount, arcAmount)
		  //draw the outline
		  g.PenSize = 2
		  g.DrawingColor = outline
		  g.DrawRoundRectangle(x, y, roundRectWidth, roundRectHeight, arcAmount, arcAmount)
		  
		  If icon <> nil And Not TxtField.Value.IsEmpty Then
		    // drawing icon / oval
		    dim ovalSize as Double = roundRectHeight * .8
		    dim ovalLeft,ovalTop as Double
		    //                                          padding           padding
		    x = g.Width - ovalSize - (g.Width - roundRectWidth) - 5
		    y = g.Height/2 - ovalSize/2
		    ovalLeft = x
		    ovalTop = y
		    If IconHovered Then
		      g.DrawingColor = &cCCCCCC
		      If darkModeEnabled Then
		        g.DrawingColor = &cFFFFFF
		      End If
		    Else
		      g.DrawingColor = &cDDDDDD71
		      If darkModeEnabled Then
		        g.DrawingColor = &cF5F6F7
		      End If
		    End If
		    g.FillOval (x, y, ovalSize, ovalSize)
		    // then draw the icon inside the oval
		    
		    iconArea.RemoveAllRows
		    dim iconSize as Double = ovalSize * .75 
		    dim iconPadding as Integer = ovalSize*.1
		    dim ratio as Double = min( (iconSize - iconPadding) / icon.Height, _
		    (iconSize - iconPadding) / icon.Width)
		    //maintain aspect ratio to fit in the canvas
		    dim w,h as Double
		    w = icon.Width * ratio
		    h = icon.Height * ratio
		    //Center the image
		    x = ovalLeft + (ovalSize/2 - w/2)
		    y = g.Height/2 - h/2
		    iconArea = Array(ovalLeft,ovalTop,ovalLeft + ovalSize,ovalTop + ovalSize)
		    g.DrawPicture(icon, x, y, w, h, 0, 0, icon.Width, icon.Height)
		    
		    //resize the textfield and label
		    TxtLabel.Width = Self.Width - (ovalSize + g.Width * .15)
		    TxtField.Width = TxtLabel.Width 
		  End If
		  
		  g.FontUnit = TxtField.FontUnit
		  g.FontSize = FontSize
		  dim maxTextWidth as Double = TxtLabel.Width
		  dim maxTextHeight as Double = TxtLabel.Height
		  
		  dim txt as String = TxtLabel.Value
		  
		  //Font size adjustment
		  ResizeFont(txt, g, maxTextWidth)
		  ResizeFont(txt, g, maxTextHeight, maxTextWidth)
		  
		  TxtField.FontSize = g.FontSize
		  TxtLabel.FontSize = g.FontSize
		  
		  If TxtField.Height > 25 Then
		    TxtField.Height = 25
		  Elseif TxtField.Height = 25 Then
		    TxtField.FontSize = 16
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  ShowTextField(False)
		  TxtLabel.Height = self.Height/2
		  TxtField.Height = TxtLabel.Height
		  If TxtField.Height > 25 or TxtField.Height < 25 Then
		    TxtField.Height = 25
		  End If
		  v_centerTextLabel
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ResizeFont(txt as String, g as Graphics, maxVal as Double)
		  While g.TextWidth(txt) >= maxVal
		    //Important check because of FontResizing loops
		    //Else it would freeze and crash
		    if g.FontSize <= 1 then 
		      g.FontSize = 1
		      Exit
		    end if
		    
		    g.FontSize = g.FontSize - 1
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResizeFont(txt as String, g as Graphics, maxVal as Double, maxVal_W as Double)
		  While g.TextHeight(txt,maxVal_W) >= maxVal
		    //Important check because of FontResizing loops
		    //Else it would freeze and crash
		    if g.FontSize <= 1 then 
		      g.FontSize = 1
		      Exit
		    end if
		    
		    g.FontSize = g.FontSize - 1
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowTextField(value as Boolean)
		  TxtLabel.Visible = Not value
		  If value Then
		    TxtField.Visible = value
		    TxtField.SetFocus
		    v_centerTextField
		  Else
		    TxtField.Top = -30
		    TxtField.Visible = value
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TextChange()
		  RaiseEvent TextChanged
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub v_centerTextField()
		  TxtField.Top = Self.Height/2 - TxtField.Height/2
		  Self.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub v_centerTextLabel()
		  TxtLabel.Top = Self.Height/2 - TxtLabel.Height/2
		  Self.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WithinIconArea(x as Integer, y as Integer) As Boolean
		  If iconArea.LastRowIndex = -1 or Icon = nil Then Return False
		  Return (x >= iconArea(0) And y >= iconArea(1) And _ 
		  x <= iconArea(2) And y <= iconArea(3))
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event IconAction()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged()
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
			  
			  If value Then
			    TxtField.TextColor = Color.White
			    TxtField.BackgroundColor = baseColorDark
			    TxtLabel.TextColor = Color.White
			  Else
			    TxtField.TextColor = &c23282D
			    TxtField.BackgroundColor = baseColor
			    TxtLabel.TextColor = &c23282D
			  End If
			  
			  Invalidate(False)
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFontSize = value
			  TxtField.FontSize = value
			End Set
		#tag EndSetter
		FontSize As Single
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Icon As Picture = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iconArea(4) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IconHovered As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private isFocused As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontSize As Single = 20
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTxtHint As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private roundRectHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private roundRectWidth As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return TxtField.Hint
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  TxtField.Hint = value
			  mTxtHint = value
			End Set
		#tag EndSetter
		TextHint As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return TxtField.Value
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  TxtField.Value = value
			End Set
		#tag EndSetter
		TextValue As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private txtHeight As Double
	#tag EndProperty


	#tag Constant, Name = baseColor, Type = Color, Dynamic = False, Default = \"&cfafafa", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&cfafafa"
	#tag EndConstant

	#tag Constant, Name = baseColorDark, Type = Color, Dynamic = False, Default = \"&c242B31", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c242B31"
	#tag EndConstant

	#tag Constant, Name = outlineColor, Type = Color, Dynamic = False, Default = \"&c2589FF", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&cDDDDDD"
	#tag EndConstant

	#tag Constant, Name = outlineColorSelected, Type = Color, Dynamic = False, Default = \"&c2589FF", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c2589FF"
	#tag EndConstant

	#tag Constant, Name = txtColor, Type = Color, Dynamic = False, Default = \"&c2D3137", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c2D3137"
	#tag EndConstant

	#tag Constant, Name = txtColorHint, Type = Color, Dynamic = False, Default = \"&c8C8C8C", Scope = Private
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"&c8C8C8C"
	#tag EndConstant


#tag EndWindowCode

#tag Events TxtField
	#tag Event
		Sub GotFocus()
		  isFocused = True
		  Self.Invalidate(False)
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  isFocused = False
		  ShowTextField(False)
		  Self.Invalidate(False)
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  TxtLabel.Value = Me.value
		  If TxtLabel.Value.IsEmpty Then
		    TxtLabel.Value = TxtField.Hint
		  End If
		  TextChange
		  Invalidate(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TxtLabel
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  ShowTextField(True)
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.FontName = TxtField.FontName
		  Me.FontSize = FontSize
		  Me.FontUnit = TxtField.FontUnit
		  
		  If TxtField.Value.IsEmpty Then
		    Me.Value = TxtField.Hint
		    Me.TextColor = txtColorHint
		  Else
		    Me.Value = TxtField.Hint
		    Me.TextColor = txtColor
		  End If
		  
		  TxtLabel.Height = self.Height/2
		  v_centerTextLabel
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Self.MouseCursor = System.Cursors.IBeam
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Self.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
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
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
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
		InitialValue="False"
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
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
		Name="FontSize"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Single"
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
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextValue"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextHint"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Icon"
		Visible=true
		Group="Behavior"
		InitialValue="nil"
		Type="Picture"
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
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
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
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
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
