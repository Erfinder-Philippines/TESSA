#tag Window
Begin ContainerControl StringXYZContainerControl Implements AttributeContainerInterface
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
   Height          =   272
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
   Width           =   250
   Begin NumbericValidator LineField
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
      Height          =   32
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
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
      Scope           =   0
      TabIndex        =   1
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
      Width           =   250
   End
   Begin BevelButton ButtonXYZ
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   4
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   ""
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   240
      Icon            =   1532067839
      IconAlignment   =   1
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   32
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   250
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  base.Append(new MenuItem("Save to Debug", "debug"))
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem <> Nil Then
		    Select Case hitItem.Tag.StringValue
		    Case "debug"
		      Dim txtName As String = "DebugPring_" + mCurrentAttribute.MyStep.Name.GIAS +"_"+ mCurrentAttribute.Name + "_date_index"
		      Dim f As FolderItem = GetFolderItem(GetScreenshotsFolder)
		      If CheckFolder(f) Then
		        f = f.Child("DebugTexts")
		        If f <> Nil Then
		          If Not f.Exists Then
		            f.CreateAsFolder
		          End
		          Dim CurrentDate As new Date
		          f = f.Child(txtName + "-" + Format(CurrentDate.Hour, "0#\.") + Format(CurrentDate.Minute, "0#\.") + Format(CurrentDate.Second, "0#") + ".txt")
		          If f <> Nil Then
		            Call OpenMeasFileForSave(currentValue().StringValue, f)
		          End
		        End
		      End
		    End
		  End
		End Function
	#tag EndEvent

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
		Sub constructor()
		  super.constructor
		  
		  Dim i as integer
		  Redim Values(2)
		  
		  for i=0 to 2
		    Values(i)=new AttrCoordinate
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function currentValue() As Variant
		  // Part of the AttributeContainerInterface interface.
		  Return XYZText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetXValue() As string
		  if X_Block<>"" then
		    return X_Block
		  else
		    return str(X_Value)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitContainer(Attr as AttributeClass)
		  If Attr <> Nil Then
		    mCurrentAttribute = Attr
		    mInitValue = mCurrentAttribute.GIAS
		    
		    LineField.Visible = true
		    
		    LineField.ReadOnly = mCurrentAttribute.ReadOnly
		    
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
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue()
		  // Part of the AttributeContainerInterface interface.
		  if (mCurrentAttribute <> Nil) And not(StrComp(mCurrentAttribute.GIAS,currentValue().StringValue,0)=0) then
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
		    XYZText = data
		    LineField.Text = data
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
		  XYZText = mInitValue
		  LineField.Text = mInitValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateValue()
		  if mCurrentAttribute <> Nil then
		    XYZText = mCurrentAttribute.GIAS
		    for i as integer = 0 to 2
		      Values(i).SetValue(NthField(XYZText,",",i+1))
		    next
		    
		    X_Value=Val(NthField(XYZText,",",1))
		    Y_Value=Val(NthField(XYZText,",",2))
		    Z_Value=Val(NthField(XYZText,",",3))
		    
		    LineField.Text = mCurrentAttribute.GIAS
		  End
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event EditNext()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UpdateSaveButton(needToDisplay As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UpdateUndoButton(needToDisplay As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueSaved()
	#tag EndHook


	#tag Property, Flags = &h21
		Private BigDataBlock As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentAttribute As AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitValue As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Values() As AttrCoordinate
	#tag EndProperty

	#tag Property, Flags = &h0
		XYZText As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private X_Block As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private X_Value As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Y_Block As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Y_Value As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Z_Block As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Z_Value As Double
	#tag EndProperty


#tag EndWindowCode

#tag Events LineField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.StringType)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValidTextChange()
		  If mCurrentAttribute.Name = mCurrentAttribute.MyStep.Name.Name Then
		    Dim pos As Integer = Me.SelStart
		    Me.Text = Me.Text.ReplaceAll(".", "")
		    Me.SelStart = pos
		  End
		  UpdateUndoButton(Me.Text <> mInitValue)
		End Sub
	#tag EndEvent
	#tag Event
		Sub EnterTabPressed()
		  XYZText=LineField.Text
		  X_Value=Val(NthField(XYZText,",",1))
		  Y_Value=Val(NthField(XYZText,",",2))
		  Z_Value=Val(NthField(XYZText,",",3))
		  SaveValue
		  UpdateUndoButton(False)
		  if mCurrentAttribute IsA String_AttributeClass then
		    If String_AttributeClass(mCurrentAttribute).IsArray Then
		      EditNext
		    end
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonXYZ
	#tag Event
		Sub Action()
		  setCurrentValue(XYZText)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  X=X-122
		  Y=Y-132
		  Dim Direction as string
		  Dim W as double = 90+Atan2(Y,X)*180/PI
		  if W<0 then W=360+W
		  Dim Ac as double = sqrt(X^2+Y^2)
		  Dim A as integer = Ac/7.5
		  Dim Ar as double
		  if A<1 then
		    'X_Value=0
		    'Y_Value=0
		    'Z_Value=0
		  else
		    Select case A
		    case 1
		      Ar=0.1
		    case 2
		      Ar=0.2
		    case 3
		      Ar=0.5
		    case 4
		      Ar=1
		    case 5
		      Ar=2
		    case 6
		      Ar=5
		    case 7
		      Ar=10
		    case 8
		      Ar=20
		    case 9
		      Ar=50
		    case 10
		      Ar=100
		    else
		      Ar=200
		    end
		    if W<30 then
		      Direction="Z"
		      Values(2).AddtoValue(Ar)
		      Z_Value=Z_Value+Ar
		    elseif W<90 then
		      Direction="-Y"
		      Values(1).AddtoValue(-Ar)
		      Y_Value=Y_Value+-Ar
		    elseif W<150 then
		      Direction="X"
		      X_Value=X_Value+Ar
		      Values(0).AddtoValue(Ar)
		    elseif W<210 then
		      Direction="-Z"
		      Z_Value=Z_Value+-Ar
		      Values(2).AddtoValue(-Ar)
		    elseif W<270 then
		      Direction="Y"
		      Y_Value=Y_Value+Ar
		      Values(1).AddtoValue(Ar)
		    elseif W<330 then
		      Direction="-X"
		      X_Value=X_Value+-Ar
		      Values(0).AddtoValue(-Ar)
		    else
		      Direction="Z"
		      Z_Value=Z_Value+Ar
		      Values(2).AddtoValue(Ar)
		    end
		  end
		  
		  XYZText = Values(0).GetValue+","+Values(1).GetValue+","+Values(2).GetValue
		  LineField.Text = XYZText
		  SaveValue
		  'AddDebugTextCR("mouse down X="+str(X)+", Y="+str(Y)+", A="+str(Ac)+", angle="+str(W)+", "+Direction)
		  
		End Function
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
	#tag ViewProperty
		Name="XYZText"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
