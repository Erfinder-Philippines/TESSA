#tag Class
Protected Class HMI_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  If ChangedAttribute <> Nil Then
		    if ChangedAttribute = Visible Then
		      mUIUpdater.SetVisible(Visible.GIAB)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CalculateAnchorsCoordinates(x As Integer, y As Integer, width As Integer, height As Integer)
		  If Coordinates <> Nil And Anchors <> Nil Then
		    
		    If mParentRect.Left <> 0 And mParentRect.Width<> 0 And mParentRect.Top <> 0 And mParentRect.Height <> 0 Then
		      if Anchors.LockLeft And Anchors.LockRight Then
		        Coordinates.Width = Coordinates.Width + width - mParentRect.Width
		      ElseIf Anchors.LockRight Then
		        Coordinates.X = Coordinates.X + width - mParentRect.Width
		      End
		      
		      if Anchors.LockTop And Anchors.LockBottom Then
		        Coordinates.Height = Coordinates.Height + height - mParentRect.Height
		      ElseIf Anchors.LockBottom Then
		        Coordinates.Y = Coordinates.Y + height - mParentRect.Height
		      End
		      Set_Koordinates
		    End
		  End
		  
		  mParentRect.Left = x
		  mParentRect.Top = y
		  mParentRect.Width = width
		  mParentRect.Height = height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearReszieRectangle()
		  mUIUpdater.SetEditMode(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as String) -- From StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  Visible = IAB("Visible", True, False, AttributeGroups.Appearance)
		  Coordinates = IAX("Coordinates", "10 100 10 200 30", false, AttributeGroups.Appearance)
		  Anchors = IAA("Anchors", "True True False False", false, AttributeGroups.Appearance)
		  BackgroundColor = IAC("BackgroundColor", "transparent", false, AttributeGroups.Appearance)
		  TextColor = IAC("TextColor", "&c000000", false, AttributeGroups.Appearance)
		  TextSize = IAI("TextSize", 12, false, AttributeGroups.Appearance)
		  Title = IAS("Title", "Title", false, AttributeGroups.Appearance)
		  
		  mUIUpdater = new TestModule.UIUpdater(Self, nil)
		  mParentRect = new REALbasic.Rect(0, 0, 0, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  'virtual method has to be overide in the child classes
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawString(g As Graphics, str As String, x As Integer, y As Integer)
		  If str <> "" Then
		    g.ForeColor = TextColor.GIAC
		    g.TextSize = TextSize.GIAI
		    g.DrawString(str, x , y)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetXValues() As double()
		  //new method for DataPlot AH
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetYValues() As double()
		  //new method for DataPlot AH
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HMICanvasInit()
		  Set_Koordinates
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HMI_Constructor()
		  Dim HC As ContainerControl = CreateCanvas
		  If HC <> Nil then
		    Dim TS as BasicClass = Self.GetUpperTest_Step
		    While TS <> Nil And  Not (TS IsA TESSA_Prog_StepClass) And Not (TS IsA Test_StepClass And Test_StepClass(TS).HMI_Page.GIAI <= 1 Or Test_StepClass(TS).Picture_Canvas <> Nil)
		      TS = TS.UpperStep
		    Wend
		    if TS <> Nil And Not (TS IsA TESSA_Prog_StepClass) And TS IsA Test_StepClass And Test_StepClass(TS).Picture_Canvas <> Nil then
		      HC.EmbedWithin(Test_StepClass(TS).Picture_Canvas, 0, 0)
		    end
		  End
		  HMI_Constructor(HC)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HMI_Constructor(HC as ContainerControl)
		  // initializes a new HMI_Canvas
		  if HC IsA HMICanvasInterface then
		    HC.Visible = True
		    HC.Enabled = true
		    HC.Top = 0
		    HC.Left = 0
		    HMICanvasInterface(HC).SetHMIClass(Self)
		    mUIUpdater.SetHMIInterface(HMICanvasInterface(HC))
		    mUIUpdater.SetVisible(Visible.GIAB)
		    HMICanvasInit
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitAfterLoad()
		  Super.InitAfterLoad
		  RemoveOldAttributes
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Move_HMI_Element(X As Integer, Y As Integer)
		  Dim NewX As Integer = Coordinates.X + X
		  Dim NewY As Integer = Coordinates.Y + Y
		  
		  If NewX >= 0 And NewY >= 0 Then
		    Coordinates.X = NewX
		    Coordinates.Y = NewY
		    Set_Koordinates
		    DoSYNC=true
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  // virtual method used for graphical objects to call outside drawing functions in the AXTDL element (Graph, Histogram, Value)
		  #Pragma Unused g
		  #Pragma Unused mode
		  g.ForeColor = BackgroundColor.GIAC
		  const margin = 5
		  g.FillRect(margin, margin, g.Width - 2 * margin, g.Height - 2 * margin)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParentResized(x As Integer, y As Integer, width As Integer, height As Integer)
		  CalculateAnchorsCoordinates(x, y, width, height)
		  Super.ParentResized(x, y, width, height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveHMI()
		  if mUIUpdater.HMIInterface <> Nil Then
		    mUIUpdater.HMIInterface.Close
		    mUIUpdater.SetHMIInterface(Nil)
		  End
		  mUICaller.ClearAllCallings
		  
		  Dim BS As BasicClass = Me.FirstSubStep
		  While BS <> Nil
		    If BS IsA HMI_StepClass Then
		      HMI_StepClass(BS).RemoveHMI
		    End
		    BS = BS.NextStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub RemoveOldAttributes()
		  If GetAttribute("HMI") <> Nil Then
		    Dim value As String = GIAS("HMI")
		    Coordinates.X = GetStringValueI(value, 0, " ")
		    Coordinates.Y = GetStringValueI(value, 1, " ")
		    Coordinates.Width = GetStringValueI(value, 2, " ")
		    Coordinates.Height = GetStringValueI(value, 3, " ")
		    Call RemoveAttribute("HMI")
		  End
		  If GetAttribute("X1") <> Nil Then
		    Coordinates.X = GIAI("X1")
		    Call RemoveAttribute("X1")
		  End
		  If GetAttribute("X2") <> Nil Then
		    Coordinates.Offset = GIAI("X2")
		    Call RemoveAttribute("X2")
		  End
		  If GetAttribute("Y") <> Nil Then
		    Coordinates.Y = GIAI("Y")
		    Call RemoveAttribute("Y")
		  End
		  If GetAttribute("W") <> Nil Then
		    Coordinates.Width = GIAI("W")
		    Call RemoveAttribute("W")
		  End
		  If GetAttribute("H") <> Nil Then
		    Coordinates.Height = GIAI("H")
		    Call RemoveAttribute("H")
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resize_HMI_Element(X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  Dim NewX, NewOffset, NewY, NewW, NewH As Integer
		  Coordinates.GetAllCoordinateValues(NewX, NewOffset, NewY, NewW, NewH)
		  NewX = NewX + X
		  NewOffset = NewOffset - X
		  NewY = NewY + Y
		  NewW = NewW + Width + X
		  NewH = NewH + Height
		  If NewW >= mMinimalWidth And NewH >= mMinimalHeight And NewX >= 0 And NewY >= 0 Then
		    Coordinates.SetCoordinateValues(NewX, NewOffset, NewY, NewW, NewH)
		    Set_Koordinates
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, SetValue as string)
		  // virtual method, has to be overridden if implemented in the class
		  mUIUpdater.SetProperty(PropertyName,SetValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetResizible(X As Integer, Y As Integer, ByRef isOneSelected As Boolean) As Boolean
		  If Visible.GIAB And mUIUpdater.HMIInterface <> Nil Then
		    Dim rContains As Boolean =  mUIUpdater.HMIInterface.CanvasRect.Contains(New REALbasic.Point(X, Y))
		    mUIUpdater.SetEditMode(rContains And (not isOneSelected))
		    If rContains Then
		      isOneSelected = True
		    End
		    Return rContains
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisible(val As Boolean)
		  mUIUpdater.SetVisible(val)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Set_Koordinates()
		  if App.HMI_Active And mUIUpdater.HMIInterface <> Nil then
		    mUIUpdater.HMIInterface.SetCoordinates(Coordinates.X, Coordinates.Offset, Coordinates.Y, Coordinates.Width, Coordinates.Height)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StepCanvas() As ContainerControl
		  Return ContainerControl(mUIUpdater.HMIInterface)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Step_HMI_Init()
		  // override if you want to init HMI element
		  mUIUpdater.UpdateCanvas(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_HMI_Update(mode As Integer)
		  // virtual method used for graphical objects to update all HMI elements
		  //must be called from child override method
		  'mode - type of updates
		  '0 - initialUpdate
		  '1 - updateAll
		  '2 - updateValue
		  '3 - update coordinates
		  If mode = 3 Then
		    Set_Koordinates
		  Else
		    'SetProperty("TextSize",TextSize.GIAS)
		    'SetProperty("TextColor",TextColor.GIAS)
		    mUIUpdater.UpdateCanvas(mode)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_HMI_UpdateAll(mode As Integer, IsFirst as boolean = true)
		  Dim BS as BasicClass = FirstSubStep
		  While BS<>nil
		    If BS IsA HMI_StepClass Then
		      HMI_StepClass(BS).Step_HMI_Update(mode)
		      HMI_StepClass(BS).Step_HMI_UpdateAll(mode,false)
		    End
		    BS=BS.NextStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_HMI_UpdateAll_xx(mode As Integer)
		  Dim it As BasicIteratorInterface = Me.Iterator
		  While it.HasNext
		    Dim BS as BasicClass = it.NextItem
		    If BS IsA HMI_StepClass Then
		      HMI_StepClass(BS).Step_HMI_Update(mode)
		    End
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  Step_HMI_Init
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Super.Step_Init_AfterLoad
		  Step_HMI_Init
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteToDB() As Boolean
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Anchors As Anchors_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		BackgroundColor As Color_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Coordinates As Coordinates_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mMinimalHeight As Integer = 20
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mMinimalWidth As Integer = 20
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mParentRect As REALbasic.Rect = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mUIUpdater As TestModule.UIUpdater = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TextColor As Color_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TextSize As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Visible As Boolean_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = cCanvasMargin, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="mUpdateCanvasMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BasicTypeName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugOn"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoSYNC"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Expanded"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
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
			Name="Local_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxRetries"
			Visible=false
			Group="Behavior"
			InitialValue="5"
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
			Name="Name_Error"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NextTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Included_Elements"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Links"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWait"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWaitTime"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SAMStepID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendState"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sub_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Untitled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
