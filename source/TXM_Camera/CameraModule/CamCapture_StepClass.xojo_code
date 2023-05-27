#tag Class
Protected Class CamCapture_StepClass
Inherits HMI_Picture_StepClass
Implements UserFunctions
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From HMI_Picture_StepClass
		  // Constructor(ConfigText as String) -- From HMI_StepClass
		  // Constructor(ConfigText as String) -- From StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  Resource = IAS("Resource", "", false)
		  Coordinates.DefaultValue = "0 40 0 200 200"
		  Coordinates.SIAS("0 40 0 200 200")
		  
		  AddUserFunction(TakePhoto, Picture.Name, "Take Photo", 0,UF_RunMode_Direct)
		  
		  NumberOfPictures = IAI("NumberOfPictures", 1, false)
		  TimeStep = IAI("TimeStep", 1, false)
		  TimeFrame = IAI("TimeFrame", 0, false)
		  
		  Shift = IAB("Shift",true,false)
		  Normalize = IAB("Normalize",false,false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case TakePhoto
		      Dim camRes As Cam_ResourceClass = LinkCamResource
		      if camRes <> Nil Then
		        Return camRes.GetTimeouttime
		      End
		    End
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LinkCamResource() As Cam_ResourceClass
		  if App.GlobalResources <> Nil then
		    Dim BS As BasicClass = Nil
		    if RelatedResource <> Nil Then
		      BS = RelatedResource
		    Else
		      BS = App.GlobalResources.FindElement(Resource.GIAS,true)
		    End
		    If BS IsA Cam_ResourceClass Then
		      Return Cam_ResourceClass(BS)
		    End
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case TakePhoto
		      Dim camRes As Cam_ResourceClass = LinkCamResource
		      if camRes <> Nil Then
		        Return camRes.Poll(Result, AttributeLink)
		      End
		    End
		  End
		  Return 3
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceAttribute() As AttributeClass
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case TakePhoto
		      Dim camRes As Cam_ResourceClass = LinkCamResource
		      If camRes <> Nil Then
		        Return camRes.Picture
		      End
		    End
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case TakePhoto
		      Dim camRes As Cam_ResourceClass = LinkCamResource
		      if camRes <> Nil Then
		        Return camRes.Run(Parameter, AttributeLink)
		      End
		    End
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveAdditionalData(folder As FolderItem)
		  Picture.SIAP(Picture.GIAP)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Exit()
		  if mLastCamResource <> Nil then
		    mLastCamResource.CloseCam
		    mLastCamResource = Nil
		  End
		  Super.Step_Exit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  mLastCamResource = LinkCamResource
		  if mLastCamResource <> Nil then
		    mLastCamResource.InitCam
		    mLastCamResource.StartCam
		    mLastCamResource.RestartCorrection
		  End
		  Super.Step_Init
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  if mLastCamResource <> Nil And App.CurrentThread <> Nil Then
		    Picture.DeleteAllValues
		    Dim localNumberOfPictures As Integer = NumberOfPictures.GIAI
		    If (NumberOfPictures.GIAI > 0 And TimeStep.GIAD > 0) Or (NumberOfPictures.GIAI > 0 And TimeFrame.GIAD > 0) Or (TimeStep.GIAD > 0 And TimeFrame.GIAD > 0) Then
		      If localNumberOfPictures <= 0 Then
		        If TimeStep.GIAD > 0 Then
		          Dim temp As Integer = TimeFrame.GIAD / TimeStep.GIAD
		          localNumberOfPictures = temp
		        End
		      ElseIf TimeStep.GIAD > 0 Then
		        Dim temp As Integer = TimeFrame.GIAD / TimeStep.GIAD
		        If temp > 0 And temp < localNumberOfPictures Then
		          localNumberOfPictures = temp
		        End
		      End
		      
		      If localNumberOfPictures > 0 Then
		        Dim localTimeStep As Double = TimeStep.GIAD
		        if localTimeStep <= 0 Then
		          localTimeStep = TimeFrame.GIAD / localNumberOfPictures
		        End
		        
		        For i As Integer = 0 to localNumberOfPictures - 1
		          Picture.AddValue("")
		          Picture.SIAP(mLastCamResource.TakePhoto(Me.Shift.GIAB,Me.Normalize.GIAB), i)
		          App.CurrentThread.Sleep(localTimeStep)
		        Next
		      End
		    End
		    Picture.IsArray = (localNumberOfPictures > 1)
		  End
		  Return Super.Step_Run
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunctionFinished()
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case TakePhoto
		      Dim camRes As Cam_ResourceClass = LinkCamResource
		      if camRes <> Nil Then
		        Picture.SIAP(camRes.Picture.GIAP)
		        camRes.UserFunctionFinished
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WaitBeforeStart() As Integer
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case TakePhoto
		      Dim camRes As Cam_ResourceClass = LinkCamResource
		      if camRes <> Nil Then
		        Return camRes.WaitBeforeStart
		      End
		    End
		  End
		  Return 0
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLastCamResource As Cam_ResourceClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Normalize As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberOfPictures As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Resource As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Shift As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeFrame As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeStep As Integer_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = TakePhoto, Type = String, Dynamic = False, Default = \"takephoto", Scope = Protected
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
