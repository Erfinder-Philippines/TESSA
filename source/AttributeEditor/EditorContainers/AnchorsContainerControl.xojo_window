#tag Window
Begin ContainerControl AnchorsContainerControl Implements AttributeContainerInterface
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   134
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
   Transparent     =   True
   Visible         =   True
   Width           =   184
   Begin Rectangle Rectangle1
      AllowAutoDeactivate=   True
      BorderThickness =   1.0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   93
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   27
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   "True"
      Tooltip         =   ""
      Top             =   21
      TopLeftColor    =   &c00000000
      Transparent     =   True
      Visible         =   True
      Width           =   137
      Begin CheckBox bottomBox
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   86
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   92
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   19
      End
      Begin CheckBox leftBox
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   62
         Transparent     =   True
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   19
      End
      Begin CheckBox rightBox
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   142
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   62
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   19
      End
      Begin CheckBox topBox
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   86
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   23
         Transparent     =   True
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   19
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  ResizeControls
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  ResizeControls
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function currentValue() As Variant
		  // Part of the AttributeContainerInterface interface.
		  Return (str(leftBox.Value) + " " + str(topBox.Value) + " " + str(rightBox.Value) + " " + str(bottomBox.Value))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitContainer(Attr as AttributeClass)
		  // Part of the AttributeContainerInterface interface.
		  If Attr IsA Anchors_AttributeClass Then
		    mCurrentAttribute = Anchors_AttributeClass(attr)
		    mInitValue = mCurrentAttribute.GIAS
		    UpdateValue
		    Me.Visible = True
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEnable() As Boolean
		  // Part of the AttributeContainerInterface interface.
		  Return Me.Enabled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResizeControls()
		  Rectangle1.Left = (Width - Rectangle1.Width) / 2
		  Rectangle1.Top = (Height - Rectangle1.Height) / 2
		  
		  leftBox.Top = (Height - leftBox.Height) / 2
		  rightBox.Top = leftBox.Top
		  
		  topBox.Left = (Width - topBox.Width) / 2
		  bottomBox.Left = topBox.Left
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue()
		  // Part of the AttributeContainerInterface interface.
		  if mCurrentAttribute <> Nil And mCurrentAttribute.GIAS <> currentValue().StringValue Then
		    mCurrentAttribute.SIAS(currentValue().StringValue)
		    mCurrentAttribute.AttributeChanged
		    ValueSaved
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCurrentValue(data As Variant)
		  // Part of the AttributeContainerInterface interface.
		  if currentValue <> data Then
		    if data.Type = Variant.TypeString Then
		      leftBox.Value = (Lowercase(GetStringValue(data.StringValue, 0, " ")) = "true")
		      topBox.Value = (Lowercase(GetStringValue(data.StringValue, 1, " ")) = "true")
		      rightBox.Value = (Lowercase(GetStringValue(data.StringValue, 2, " ")) = "true")
		      bottomBox.Value = (Lowercase(GetStringValue(data.StringValue, 3, " ")) = "true")
		    End
		    mInitValue = data.StringValue
		    UpdateUndoButton(False)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEnable(value As Boolean)
		  // Part of the AttributeContainerInterface interface.
		  Me.Enabled = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UndoValue()
		  // Part of the AttributeContainerInterface interface.
		  If mCurrentAttribute <> Nil Then
		    mCurrentAttribute.SIAS(mInitValue)
		    UpdateValue
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateValue()
		  // Part of the AttributeContainerInterface interface.
		  if mCurrentAttribute <> Nil Then
		    If not mCurrentAttribute.LockLeft And not mCurrentAttribute.LockRight Then
		      mCurrentAttribute.LockLeft = True
		    End
		    If not mCurrentAttribute.LockTop And not mCurrentAttribute.LockBottom Then
		      mCurrentAttribute.LockTop = True
		    End
		    leftBox.Value = mCurrentAttribute.LockLeft
		    topBox.Value = mCurrentAttribute.LockTop
		    rightBox.Value = mCurrentAttribute.LockRight
		    bottomBox.Value = mCurrentAttribute.LockBottom
		  End
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event UpdateUndoButton(needToDisplay As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueSaved()
	#tag EndHook


	#tag Property, Flags = &h21
		Private mCurrentAttribute As Anchors_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitValue As String
	#tag EndProperty


#tag EndWindowCode

#tag Events bottomBox
	#tag Event
		Sub Action()
		  If not Me.Value And not topBox.Value Then
		    topBox.Value = True
		  End
		  SaveValue
		  UpdateUndoButton(currentValue.StringValue <> mInitValue)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events leftBox
	#tag Event
		Sub Action()
		  If not Me.Value And not rightBox.Value Then
		    rightBox.Value = True
		  End
		  SaveValue
		  UpdateUndoButton(currentValue.StringValue <> mInitValue)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rightBox
	#tag Event
		Sub Action()
		  If not Me.Value And not leftBox.Value Then
		    leftBox.Value = True
		  End
		  SaveValue
		  UpdateUndoButton(currentValue.StringValue <> mInitValue)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events topBox
	#tag Event
		Sub Action()
		  If not Me.Value And not bottomBox.Value Then
		    bottomBox.Value = True
		  End
		  SaveValue
		  UpdateUndoButton(currentValue.StringValue <> mInitValue)
		End Sub
	#tag EndEvent
#tag EndEvents
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
