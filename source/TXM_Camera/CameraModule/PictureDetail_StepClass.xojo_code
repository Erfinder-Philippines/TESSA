#tag Class
Protected Class PictureDetail_StepClass
Inherits ReportStepClass
Implements UserFunctions
	#tag Method, Flags = &h21
		Private Function AverageBrightnessOfDiffPicture(pictureIndex As Integer, RefPictureIndex As Integer) As Double
		  Dim TNA as string =Me.Name.GIAS
		  if (Me.Suffix.GIAS<>"") or (Me.Index.GIAS<>"") then
		    TNA=TNA+" "+Me.Suffix.GIAS+Me.Index.GIAS
		  end
		  
		  Dim refPic As Picture = ReferencePicture.GIAP(RefPictureIndex)
		  If refPic <> Nil Then
		    Dim pic As Picture =  SourcePicture.GIAP(pictureIndex)
		    
		    pic = DiffPicture(pic,refPic,DiffMethod.GIAI)
		    
		    DebugPicture.SIAP(pic, RefPictureIndex)
		    
		    if pic <> Nil Then
		      Return AverageBrightness(pic)
		    else
		      Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Fail, TNA, "There is no Picture","Compare to Reference Picture",_
		      Me.EvaluationCriteria.GIAS, Me.TestMeasurement.GIAS)
		    End
		  else
		    Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Fail, TNA, "There is no ReferencePicture", "Compare to Reference Picture",_
		    Me.EvaluationCriteria.GIAS, Me.TestMeasurement.GIAS)
		  End
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ComparePictures()
		  
		  Dim measurement As Double = 0
		  Dim EvalResults as string = " "
		  
		  Dim TNA as string =Me.Name.GIAS
		  if (Me.Suffix.GIAS<>"") or (Me.Index.GIAS<>"") then
		    TNA=TNA+" "+Me.Suffix.GIAS+Me.Index.GIAS
		  end
		  
		  Select Case Mode.GIAI
		  Case 0 // Single_Source/Single_Reference
		    measurement = AverageBrightnessOfDiffPicture(SourcePicture.ActiveValue, SourcePicture.ActiveValue)
		    SourceMeasurement.SIAD(measurement)
		    EvalResults=str(measurement)
		    ReferenceMeasurement.SIAD(measurement)
		    If measurement >= 0 And measurement <= EvaluationCriteria.GIAD Then
		      SourceEvaluationResult.SIAD(1)
		      Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Pass, TNA,"picture ok","Compare to one Reference Picture", "0/"+Me.EvaluationCriteria.GIAS,EvalResults)
		    else
		      SourceEvaluationResult.SIAD(0)
		      Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Fail, TNA,"picture not passed","Compare to one Reference Picture", "0/"+Me.EvaluationCriteria.GIAS, EvalResults)
		    End
		    
		  Case 1 // Single_Source/Array_Reference
		    Dim closestAverage As Double = 1
		    Dim closestIndex As Integer = -1
		    Dim summaryBrightness As Double = 0
		    For i As Integer = 0 to ReferencePicture.GIAN - 1
		      Dim averageBrightness As Double = AverageBrightnessOfDiffPicture(SourcePicture.ActiveValue, i)
		      If averageBrightness >= 0 And averageBrightness < closestAverage Then
		        closestAverage = averageBrightness
		        closestIndex = i
		        EvalResults=EvalResults+"("+str(i)+","+format(averageBrightness,"#.##")+")"
		      else
		        EvalResults=EvalResults+"("+str(i)+","+format(averageBrightness,"#.##")+")"
		      End
		      ReferenceMeasurement.SIAD(averageBrightness, i)
		      If averageBrightness > 0 Then
		        summaryBrightness = summaryBrightness + averageBrightness
		      End
		    Next
		    SourceMeasurement.SIAD(summaryBrightness / ReferencePicture.GIAN)
		    SourceEvaluationResult.SIAD(closestIndex)
		    EvalResults=str(closestIndex)+EvalResults
		    If (closestIndex >= TestLowerLimit.GIAD) And (closestIndex <= TestUpperLimit.GIAD) Then
		      Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Pass, TNA,"picture ok","Compare and select from "+str(ReferencePicture.GIAN)+" Reference Pictures", TestLowerLimit.GIAS+"/"+TestUpperLimit.GIAS, EvalResults)
		    else
		      Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Fail, TNA,"picture not passed","Compare and select from "+str(ReferencePicture.GIAN)+" Reference Pictures", TestLowerLimit.GIAS+"/"+TestUpperLimit.GIAS, EvalResults)
		    End
		    
		  Case 2 // Array_Source/Single_Reference
		    Dim meanValue As Double = 0
		    For i As Integer = 0 to SourcePicture.GIAN - 1
		      Dim averageBrightness As Double = AverageBrightnessOfDiffPicture(i, ReferencePicture.ActiveValue)
		      SourceEvaluationResult.SIAD(0, i)
		      If averageBrightness >= 0 Then
		        measurement = measurement + averageBrightness
		        SourceMeasurement.SIAD(measurement, i)
		        If averageBrightness >= 0 And averageBrightness <= EvaluationCriteria.GIAD Then
		          SourceEvaluationResult.SIAD(1, i)
		          meanValue = meanValue + 1
		          EvalResults=EvalResults+"("+str(i)+","+str(averageBrightness)+")"
		        else
		          EvalResults=EvalResults+"("+str(i)+","+str(averageBrightness)+")"
		        End
		      Else
		        SourceMeasurement.SIAD(-1, i)
		      End
		    Next
		    measurement = measurement / SourcePicture.GIAN
		    ReferenceMeasurement.SIAD(measurement)
		    measurement=meanValue / SourcePicture.GIAN
		    EvalResults=str(measurement)+EvalResults
		    If (measurement >= TestLowerLimit.GIAD) And (measurement <= TestUpperLimit.GIAD) Then
		      Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Pass, TNA,"pictures ok","Compare "+str(SourcePicture.GIAN)+" pictures to a single reference picture", TestLowerLimit.GIAS+"/"+TestUpperLimit.GIAS, EvalResults)
		    else
		      Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Fail, TNA,"pictures not passed","Compare "+str(SourcePicture.GIAN)+" pictures to a single reference picture", TestLowerLimit.GIAS+"/"+TestUpperLimit.GIAS, EvalResults)
		    End
		    
		  Case 3 // Array_Source/Array_Reference
		    Dim summaryResult As Double = 0
		    For i As Integer = 0 to SourcePicture.GIAN - 1
		      Dim closestAverage As Double = 1
		      Dim closestIndex As Integer = -1
		      For j As Integer = 0 to ReferencePicture.GIAN - 1
		        Dim averageBrightness As Double = AverageBrightnessOfDiffPicture(i, j)
		        If averageBrightness >= 0 And averageBrightness < closestAverage Then
		          closestAverage = averageBrightness
		          closestIndex = j
		          EvalResults=EvalResults+"("+str(i)+","+str(averageBrightness)+")"
		        else
		          EvalResults=EvalResults+"("+str(i)+","+str(averageBrightness)+")"
		        End
		        If averageBrightness < 0 Then
		          averageBrightness = 0
		        End
		        SourceMeasurement.SIAD(SourceMeasurement.GIAD(i) + averageBrightness,i)
		        ReferenceMeasurement.SIAD(ReferenceMeasurement.GIAD(j) + averageBrightness, j)
		      Next
		      SourceMeasurement.SIAD(SourceMeasurement.GIAD(i) / ReferencePicture.GIAN, i)
		      SourceEvaluationResult.SIAD(closestIndex, i)
		      summaryResult = summaryResult + closestIndex
		    Next
		    For i As Integer = 0 to ReferencePicture.GIAN - 1
		      ReferenceMeasurement.SIAD(ReferenceMeasurement.GIAD(i) / SourcePicture.GIAN, i)
		    Next
		    measurement = summaryResult / SourcePicture.GIAN
		    EvalResults=str(measurement)+EvalResults
		    If (measurement >= TestLowerLimit.GIAD) And (measurement <= TestUpperLimit.GIAD) Then
		      Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Pass, TNA,"pictures ok","Compare and select "+str(SourcePicture.GIAN)+" pictures from "+str(ReferencePicture.GIAN)+" reference Pictures", TestLowerLimit.GIAS+"/"+TestUpperLimit.GIAS, EvalResults)
		    else
		      Me.SetErrorMessage(Me.Index.GIAI, ErrorCode_Fail, TNA,"pictures not passed","Compare and select "+str(SourcePicture.GIAN)+" pictures from "+str(ReferencePicture.GIAN)+" reference Pictures", TestLowerLimit.GIAS+"/"+TestUpperLimit.GIAS, EvalResults)
		    End
		  End
		  
		  
		End Sub
	#tag EndMethod

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
		  
		  Mode = IAE("Mode", "0 Single_Source/Single_Reference Single_Source/Array_Reference Array_Source/Single_Reference Array_Source/Array_Reference", false)
		  EvaluationCriteria = IAD("EvaluationCriteria", 0.25, false)
		  ReferenceMeasurement = IAD("ReferenceMeasurement", 0, False)
		  SourceMeasurement = IAD("SourceMeasurement", 0, False)
		  
		  SourceEvaluationResult = IAI("SourceEvaluationResult", 0, false)
		  
		  TestUpperLimit = IAD("TestUpperLimit", 1.5, False)
		  TestLowerLimit = IAD("TestLowerLimit", 0.5, False)
		  
		  SourcePicture = IAP("SourcePicture", "", false)
		  ReferencePicture = IAP("ReferencePicture", "", false)
		  
		  Coordinates.EnableOffset = False
		  Coordinates.DefaultValue = "0 0 0 100 100"
		  Coordinates.SIAS("0 0 0 100 100")
		  
		  TextColor.DefaultValue = "&cff0000"
		  TextColor.SIAS("&cff0000")
		  
		  AddUserFunction(TakeRefPhoto, ReferencePicture.Name, "Take Reference Photo", 0,UF_RunMode_Direct)
		  AddUserFunction(TakePhoto, SourcePicture.Name, "Take Photo", 0,UF_RunMode_Direct,true)
		  
		  DebugPicture = IAP("DebugPicture", "", false)
		  DiffMethod = IAE("DiffMethod", "0 Normal SquareMode ABSmode" , False)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return new HMI_Detail_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DiffPicture(byref pict as picture, refPict as picture, Diff_Mode as integer) As picture
		  if (pict <> nil) and (refPict <> nil) then
		    Select Case Diff_Mode
		    Case 0
		      pict = DiffPicturesMBS(pict, refPict, False)
		    Case 1
		      pict = DiffPicturesMBS(pict, refPict, True)
		    Case 2
		      Dim surf1 As RGBSurface = pict.RGBSurface
		      Dim surf2 As RGBSurface = refPict.RGBSurface
		      
		      Dim lastX As Integer = pict.Width - 1
		      Dim lastY As Integer = pict.Height - 1
		      Dim cg,cr,cb as integer
		      
		      Dim temp1, temp2 As Color
		      For y As Integer = 0 To lastY
		        For x As Integer = 0 To lastX
		          temp1 = surf1.Pixel(x, y)
		          temp2 = surf2.Pixel(x, y)
		          temp1 = surf1.Pixel(x, y)
		          cg=min(max(abs(temp1.Green-temp2.Green),0),255)
		          cr=min(max(abs(temp1.Red-temp2.red),0),255)
		          cb=min(max(abs(temp1.Blue-temp2.blue),0),255)
		          surf1.Pixel(x,y)=RGB(cr,cg,cb)
		        Next
		      Next
		    End
		  End
		  Return pict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetCamResource() As Cam_ResourceClass
		  if Self.UpperStep IsA CamCapture_StepClass Then
		    Return CamCapture_StepClass(Self.UpperStep).LinkCamResource
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case TakeRefPhoto, TakePhoto
		      Dim camRes As Cam_ResourceClass = GetCamResource
		      if camRes <> Nil Then
		        Return camRes.GetTimeouttime
		      End
		    End
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HMI_Constructor()
		  if Self.UpperStep IsA CamCapture_StepClass Then
		    Dim PC As CamCapture_StepClass = CamCapture_StepClass(Self.UpperStep)
		    If PC <> Nil Then
		      Dim HC As ContainerControl = CreateCanvas
		      Dim parentCanvas As ContainerControl = PC.StepCanvas
		      If HC <> Nil And parentCanvas IsA HMI_Picture_Canvas then
		        HC.EmbedWithin(HMI_Picture_Canvas(parentCanvas).HMI_Picture, 0, 0)
		      End
		      HMI_Constructor(HC)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsArray() As Boolean
		  if Me.UpperStep IsA CamCapture_StepClass Then
		    Return CamCapture_StepClass(UpperStep).Picture.IsArray
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub NormalizePicture(byref pict as picture, refPict as picture)
		  
		  if (pict<>nil) and (refPict<>nil) then
		    Dim AVGreen1, AVRed1, AVBlue1,AVGreen2, AVRed2, AVBlue2, CorrGreen, CorrRed, CorrBlue  As Double = 0
		    Dim count As Integer = 0
		    
		    Dim surf1 As RGBSurface = pict.RGBSurface
		    Dim surf2 As RGBSurface = refPict.RGBSurface
		    
		    Dim lastX As Integer = pict.Width - 1
		    Dim lastY As Integer = pict.Height - 1
		    
		    count = lastX * lastY
		    Dim temp1, temp2 As Color
		    For y As Integer = 0 To lastY
		      For x As Integer = 0 To lastX
		        temp1 = surf1.Pixel(x, y)
		        temp2 = surf2.Pixel(x, y)
		        AVGreen1=AVGreen1+temp1.Green
		        AVRed1=AVRed1+temp1.Red
		        AVBlue1=AVBlue1+temp1.Blue
		        AVGreen2=AVGreen2+temp2.Green
		        AVRed2=AVRed2+temp2.Red
		        AVBlue2=AVBlue2+temp2.Blue
		      Next
		    Next
		    
		    If count > 0 Then
		      AVGreen1 = AVGreen1 / count
		      AVRed1 = AVRed1 / count
		      AVBlue1 = AVBlue1/ count
		      AVGreen2 = AVGreen2 / count
		      AVRed2 = AVRed2 / count
		      AVBlue2 = AVBlue2/ count
		    End
		    CorrGreen=AVGreen2/AVGreen1
		    CorrRed=AVRed2/AVRed1
		    CorrBlue=AVBlue2/AVBlue1
		    
		    Dim cg,cr,cb as integer
		    
		    For y As Integer = 0 To lastY
		      For x As Integer = 0 To lastX
		        temp1 = surf1.Pixel(x, y)
		        cg=min(max(temp1.Green*CorrGreen,0),255)
		        cr=min(max(temp1.Red*CorrRed,0),255)
		        cb=min(max(temp1.Blue*CorrBlue,0),255)
		        surf1.Pixel(x,y)=RGB(cr,cg,cb)
		      Next
		    Next
		  else
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  Super.Paint(g, mode)
		  DrawString(g, Title.GIAS, 8, 18)
		  g.DrawRect(6, 20, Coordinates.Width, Coordinates.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case TakeRefPhoto, TakePhoto
		      Dim camRes As Cam_ResourceClass = GetCamResource
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
		    Case TakeRefPhoto, TakePhoto
		      Dim camRes As Cam_ResourceClass = GetCamResource
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
		    Case TakeRefPhoto, TakePhoto
		      Dim camRes As Cam_ResourceClass = GetCamResource
		      if camRes <> Nil Then
		        Return camRes.Run(Parameter, AttributeLink)
		      End
		    End
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetResizible(X As Integer, Y As Integer, ByRef isOneSelected As Boolean) As Boolean
		  if Self.UpperStep IsA CamCapture_StepClass Then
		    Dim PC As CamCapture_StepClass = CamCapture_StepClass(Self.UpperStep)
		    If PC <> Nil Then
		      X = X - PC.Coordinates.X - PC.Coordinates.Offset
		      Y = Y - PC.Coordinates.Y
		    End
		  End
		  Return Super.SetResizible(X, Y, isOneSelected)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  
		  if Me.ExecuteTest.GIAB then
		    ComparePictures
		  end
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As Boolean
		  
		  if Me.ExecuteTest.GIAB then
		    Me.TestResult.SIAI(ErrorCode_InProgress)
		  else
		    Me.TestResult.SIAI(ErrorCode_Off)
		  end
		  
		  If IsArray Then
		    SourcePicture.DeleteAllValues
		  Else
		    SourcePicture.SIAS("")
		  End
		  
		  if Me.UpperStep IsA CamCapture_StepClass Then
		    SourcePicture.IsArray = IsArray
		    if IsArray Then
		      For i As Integer = 0 to CamCapture_StepClass(UpperStep).Picture.GIAN - 1
		        SourcePicture.AddValue("")
		        SourcePicture.SIAP(TakeDetailPicture(CamCapture_StepClass(Me.UpperStep).GetPicture(i)), i)
		      Next
		    Else
		      SourcePicture.SIAP(TakeDetailPicture(CamCapture_StepClass(Me.UpperStep).GetPicture))
		    End
		  End
		  
		  ReferenceMeasurement.SIAS("")
		  SourceMeasurement.SIAS("")
		  SourceEvaluationResult.SIAS("")
		  
		  Select case Mode.GIAI
		  case 0 // single source/single reference
		    SourceMeasurement.IsArray = False
		    ReferenceMeasurement.IsArray = False
		    SourceEvaluationResult.IsArray = False
		  case 1 // single source / array reference
		    SourceMeasurement.IsArray = False
		    ReferenceMeasurement.IsArray = ReferencePicture.IsArray
		    if ReferencePicture.IsArray Then
		      ReferenceMeasurement.DeleteAllValues
		      For i As Integer = 0 to ReferencePicture.GIAN - 1
		        ReferenceMeasurement.AddValue("")
		      Next
		    End
		  case 2 // array source / single reference
		    SourceMeasurement.DeleteAllValues
		    SourceEvaluationResult.DeleteAllValues
		    For i As Integer = 0 to SourcePicture.GIAN - 1
		      SourceMeasurement.AddValue("")
		      SourceEvaluationResult.AddValue("")
		    Next
		  case 3 // array source / array reference
		    SourceMeasurement.DeleteAllValues
		    SourceEvaluationResult.DeleteAllValues
		    For i As Integer = 0 to SourcePicture.GIAN - 1
		      SourceMeasurement.AddValue("")
		      SourceEvaluationResult.AddValue("")
		    Next
		    ReferenceMeasurement.IsArray = ReferencePicture.IsArray
		    if ReferencePicture.IsArray Then
		      ReferenceMeasurement.DeleteAllValues
		      For i As Integer = 0 to ReferencePicture.GIAN - 1
		        ReferenceMeasurement.AddValue("")
		      Next
		    End
		  else
		    SourceMeasurement.IsArray = False
		    ReferenceMeasurement.IsArray = False
		    SourceEvaluationResult.IsArray = False
		  end
		  
		  
		  DebugPicture.IsArray = ReferencePicture.IsArray
		  if ReferencePicture.IsArray Then
		    DebugPicture.DeleteAllValues
		    For i As Integer = 0 to ReferencePicture.GIAN - 1
		      DebugPicture.AddValue("")
		    Next
		  Else
		    DebugPicture.SIAS("")
		  End
		  
		  Return Super.Step_Start
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TakeDetailPicture(parentPicture As Picture) As Picture
		  if parentPicture <> Nil Then
		    Dim newPic As new Picture(Coordinates.Width, Coordinates.Height, 32)
		    if PictureCopyPixelFastMBS(newPic, parentPicture, 0, 0, Coordinates.X, Coordinates.Y, Coordinates.Width, Coordinates.Height) Then
		      Return newPic
		    End
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunctionFinished()
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select Case mCurrentUserFunction.FunctionName
		    Case TakeRefPhoto
		      if Me.UpperStep IsA CamCapture_StepClass Then
		        ReferencePicture.SIAP(TakeDetailPicture(CamCapture_StepClass(Me.UpperStep).GetPicture))
		      End
		      
		      Dim camRes As Cam_ResourceClass = GetCamResource
		      if camRes <> Nil Then
		        camRes.UserFunctionFinished
		      End
		      
		    Case TakePhoto
		      if Me.UpperStep IsA CamCapture_StepClass Then
		        SourcePicture.SIAP(TakeDetailPicture(CamCapture_StepClass(Me.UpperStep).GetPicture))
		      End
		      Dim camRes As Cam_ResourceClass = GetCamResource
		      if camRes <> Nil Then
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
		    Case TakeRefPhoto, TakePhoto
		      Dim camRes As Cam_ResourceClass = GetCamResource
		      if camRes <> Nil Then
		        Return camRes.WaitBeforeStart
		      End
		    End
		  End
		  Return 0
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		DebugPicture As Picture_Attribute = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DiffMethod As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EvaluationCriteria As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReferenceMeasurement As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReferencePicture As Picture_Attribute = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceEvaluationResult As Integer_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceMeasurement As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SourcePicture As Picture_Attribute = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestLowerLimit As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestUpperLimit As Double_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = TakePhoto, Type = String, Dynamic = False, Default = \"takephoto", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TakeRefPhoto, Type = String, Dynamic = False, Default = \"takerefphoto", Scope = Protected
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
