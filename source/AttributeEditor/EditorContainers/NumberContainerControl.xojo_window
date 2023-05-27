#tag Window
Begin ContainerControl NumberContainerControl Implements AttributeContainerInterface
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
   Height          =   87
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
   Width           =   290
   Begin NumbericValidator AttributeValue
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   27
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   290
   End
   Begin Label SubLabel1
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
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   30
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   271
   End
   Begin Label SubLabel2
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
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   54
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   271
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function currentValue() As Variant
		  // Part of the AttributeContainerInterface interface.
		  Return AttributeValue.Text
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitContainer(Attr as AttributeClass)
		  // Part of the AttributeContainerInterface interface.
		  if Attr IsA Double_AttributeClass Or Attr IsA Integer_AttributeClass Then
		    AttributeValue.SetType(NumbericValidator.Types.DoubleType)
		    if Attr IsA Integer_AttributeClass Then
		      AttributeValue.SetType(NumbericValidator.Types.IntegerType)
		      Select case Attr.Format
		      case 0 // number
		        SubLabel1.Text="hex: "+StrHex(Integer_AttributeClass(Attr).GIAI,-1)
		        SubLabel2.Text="bin: "+Bin(Integer_AttributeClass(Attr).GIAI)
		      case 1,3 // hex
		        SubLabel1.Text="dec: "+Str(Integer_AttributeClass(Attr).GIAI)
		        SubLabel2.Text="bin: "+Bin(Integer_AttributeClass(Attr).GIAI)
		      case 2 // bin
		        SubLabel2.Text="hex: "+StrHex(Integer_AttributeClass(Attr).GIAI,-1)
		        SubLabel1.Text="dec: "+Str(Integer_AttributeClass(Attr).GIAI)
		      else
		        SubLabel2.Text=""
		        SubLabel1.Text=""
		      end
		    else
		      SubLabel2.Text=""
		      SubLabel1.Text=""
		    End
		    mCurrentAttribute = Attr
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

	#tag Method, Flags = &h0
		Sub SaveValue()
		  // Part of the AttributeContainerInterface interface.
		  if mCurrentAttribute <> Nil And mCurrentAttribute.GIAS <> AttributeValue.Text Then
		    mCurrentAttribute.SIAS(AttributeValue.Text)
		    mCurrentAttribute.AttributeChanged
		    ValueSaved
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCurrentValue(data As Variant)
		  // Part of the AttributeContainerInterface interface.
		  if data.Type = Variant.TypeString And currentValue <> data Then
		    AttributeValue.Text = data.StringValue
		    mInitValue = data
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
		  AttributeValue.Text = mInitValue.StringValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateValue()
		  if mCurrentAttribute <> Nil then
		    Dim S as string = mCurrentAttribute.GIAS
		    AttributeValue.Text = S
		    S=AttributeValue.Text
		    AttributeValue.ReadOnly = mCurrentAttribute.ReadOnly
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
		Private mCurrentAttribute As AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitValue As Variant = 0
	#tag EndProperty


#tag EndWindowCode

#tag Events AttributeValue
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.DoubleType)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValidTextChange()
		  UpdateUndoButton(Me.Text <> mInitValue)
		End Sub
	#tag EndEvent
	#tag Event
		Sub EnterTabPressed()
		  SaveValue
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
