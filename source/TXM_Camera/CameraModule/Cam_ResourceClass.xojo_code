#tag Class
Protected Class Cam_ResourceClass
Inherits Resource_StepClass
Implements UserFunctions
	#tag Method, Flags = &h0
		Sub CloseCam()
		  Dim graber As CamGrabber = CamGrabbersManager.instance.GetGrabber(VideoName.GIAS, VideoIndex.GIAI)
		  if graber <> Nil Then
		    graber.CloseGrabber
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  Super.Constructor(ConfigText)
		  
		  VideoName = IAS("VideoDeviceName","",false)
		  VideoInputName = IAS("VideoInputName", "", False)
		  VideoIndex = IAI("VideoInputIndex",0,false)
		  
		  ManualWait = IAI("ManualWait", 800, False)
		  Picture = IAP("Picture", "", false)
		  
		  AutomaticCorection = IAB("AutomaticCorection", False, False)
		  ReferencePicture = IAP("ReferencePicture", "", False)
		  
		  HorizontalMirroring = IAB("HorizontalMirroring", false, false)
		  VerticalMirroring = IAB("VerticalMirroring", false, false)
		  
		  Rotate = IAB("Rotate", False, False)
		  RotateAngle = IAD("RotateAngle", 90, False)
		  
		  VerticalCompensation = IAB("VerticalCompensation", False, False)
		  HorizontalCompensation = IAB("HorizontalCompensation", False, False)
		  FrameCoordinates = IAX("FrameCoordinates", "0 0 0 200 200", false)
		  FrameCoordinates.EnableOffset = False
		  FrameCoordinates.Width = CamGrabber.VIDEO_WIDTH
		  FrameCoordinates.Height = CamGrabber.VIDEO_HEIGHT
		  
		  AddUserFunction(TakePhotoFunction, Picture.Name, "Take Photo", 0,UF_RunMode_Direct)
		  AddUserFunction(TakeRefPhotoFunction, ReferencePicture.Name, "Take Ref Photo", 0,UF_RunMode_Direct)
		  
		  
		  CorectionPoint = IAPoint("CorectionPoint", "0 0", False)
		  AddUserFunction(CorectionFunction, CorectionPoint.Name, "Correct", 0,UF_RunMode_Direct)
		  
		  CorrectionPicture = IAP("CorrectionPicture", "", False)
		  CorrectionPicture.ReadOnly = True
		  
		  VectorsCount = IAI("VectorsCount", 4, False)
		  DiffValue = IAI("DiffValue", 10, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function divSigns(mainSigns() As Integer, signs() As Integer, diff As Integer) As Boolean
		  Dim endFlag As Boolean = True
		  For i As Integer = 0 to mainSigns.Ubound
		    If Abs(mainSigns(i) - signs(i)) > diff Then
		      endFlag = False
		      Exit
		    End
		    App.YieldToNextThread
		  Next
		  Return endFlag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCorrectedPosition(pic As Picture, refPic As Picture, ByRef X As Integer, ByRef Y As Integer, diff As Integer, vecCount As Integer) As Boolean
		  If pic <> Nil Then
		    If refPic <> Nil Then
		      If diff >= 0 Then
		        If vecCount > 0 Then
		          Dim widthSigns As Integer = refPic.Width / vecCount
		          Dim heightSigns As Integer = refPic.Height / vecCount
		          
		          Dim VectosSigns() As Pair
		          For i as Integer = 1 to vecCount - 1
		            For j As Integer = 1 to vecCount - 1
		              VectosSigns.Append(new REALbasic.Point((i - 1) * widthSigns, (j - 1) * heightSigns) : new REALbasic.Point(i * widthSigns, j * heightSigns))
		              VectosSigns.Append(new REALbasic.Point(i * widthSigns, (j - 1) * heightSigns) : new REALbasic.Point(i * widthSigns, j * heightSigns))
		              VectosSigns.Append(new REALbasic.Point((i - 1) * widthSigns, j * heightSigns) : new REALbasic.Point(i * widthSigns, j * heightSigns))
		              App.YieldToNextThread
		            Next
		          Next
		          
		          Dim tempSigns() As Integer = getVectorSingsValues(refPic, VectosSigns)
		          
		          For i as Integer = 0 to pic.Width - refPic.Width - 1
		            For j As Integer = 0 to pic.Height - refPic.Height - 1
		              Dim tempPic As new Picture(refPic.Width , refPic.Height, 32)
		              If PictureCopyPixelFastMBS(tempPic, pic, 0, 0, i, j, refPic.Width, refPic.Height) Then
		                Dim signs() As Integer = getVectorSingsValues(tempPic, VectosSigns)
		                if divSigns(tempSigns, signs, diff) Then
		                  X = i
		                  Y = j
		                  Return True
		                End
		              Else
		                AddDebugTextCR("PictureCopyPixelFastMBS: could not create new picture as part of main picture")
		              End
		              App.YieldToNextThread
		            Next
		          Next
		          AddDebugTextCR("Function could not find correction: VectorCount=" + Str(VectorsCount.GIAI) + " DiffValue=" + Str(DiffValue.GIAI))
		        Else
		          AddDebugTextCR("VecCount is less zero")
		        End
		      Else
		        AddDebugTextCR("Diif value is less or equel zero")
		      End
		    Else
		      AddDebugTextCR("Reference picture is nil")
		    End
		  Else
		    AddDebugTextCR("Main picture is nil")
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDataStartFolderItem() As FolderItem
		  Dim f as FolderItem = App.GetConfigFolderItem(False)
		  If f = Nil Then
		    f = Super.GetDataStartFolderItem
		  End
		  If f <> Nil Then
		    f = f.Child("Cam")
		    If f <> Nil And Not f.Exists Then
		      f.CreateAsFolder
		    End
		  End
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As Integer
		  Return 3000
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getVectorSingsValues(pic As Picture, VectosSigns() As Pair) As Integer()
		  Dim vec() As Integer
		  If pic <> Nil And VectosSigns.Ubound >= 0 then
		    For i As Integer = 0 to VectosSigns.Ubound
		      Dim tmpPair As Pair = VectosSigns(i)
		      Dim fColor As Double = Grayscale(pic.RGBSurface.Pixel(REALbasic.Point(tmpPair.Left).x, REALbasic.Point(tmpPair.Left).y))
		      Dim sColor As Double = Grayscale(pic.RGBSurface.Pixel(REALbasic.Point(tmpPair.Right).x, REALbasic.Point(tmpPair.Right).y))
		      vec.Append(sColor - fColor)
		      App.YieldToNextThread
		    Next
		  End
		  Return vec
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitCam()
		  Dim graber As CamGrabber = CamGrabbersManager.instance.GetGrabber(VideoName.GIAS, VideoIndex.GIAI)
		  If graber <> Nil And Not graber.IsInitialized Then
		    graber.InitGrabber
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  if ImmediateConnection.GIAB then
		    Dim graber As CamGrabber = CamGrabbersManager.instance.GetGrabber(VideoName.GIAS, VideoIndex.GIAI)
		    if graber <> Nil then
		      if not(graber.IsInitialized) Then
		        graber.InitGrabber
		      end
		      if graber.IsInitialized then
		        Connected.SIAB(true)
		        graber.CloseGrabber
		        AddRemarkToComLogCR("Cam "+Name.GIAS+" is connected")
		      else
		        Connected.SIAB(false)
		        AddRemarkToComLogCR("Camgrabber "+Name.GIAS+" not Initialized")
		      end
		    else
		      Connected.SIAB(false)
		      AddRemarkToComLogCR("Cam "+Name.GIAS+" no grabber")
		    End
		    if connected.GIAB then
		      return "ok"
		    else
		      return "no connection"
		    end
		  else
		    return "not yet connected"
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Normalize(byref pict as picture, refPict as picture)
		  
		  
		  if (pict<>nil) and (refPict<>nil) then
		    Dim Green_AV_1, Red_AV_1, Blue_AV_1,Green_AV_2, Red_AV_2, Blue_AV_2 as double = 0
		    Dim Green_a_1, Red_a_1, Blue_a_1,   Green_a_2, Red_a_2, Blue_a_2, Green_b, Red_b, Blue_b   As Double = 0
		    Dim Green_max_1, Red_max_1, Blue_max_1, Green_max_2, Red_max_2, Blue_max_2  as integer = 0
		    Dim Green_min_1, Red_min_1, Blue_min_1, Green_min_2, Red_min_2, Blue_min_2 as integer = 255
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
		        Green_AV_1=Green_AV_1+temp1.Green
		        Red_AV_1=Red_AV_1+temp1.Red
		        Blue_AV_1=Blue_AV_1+temp1.Blue
		        Green_AV_2=Green_AV_2+temp2.Green
		        Red_AV_2=Red_AV_2+temp2.Red
		        Blue_AV_2=Blue_AV_2+temp2.Blue
		        Green_max_1=max(Green_max_1,temp1.Green)
		        Red_max_1=max(Red_max_1,temp1.Red)
		        Blue_max_1=max(Blue_max_1,temp1.Blue)
		        Green_min_1=min(Green_min_1,temp1.Green)
		        Red_min_1=min(Red_min_1,temp1.Red)
		        Blue_min_1=min(Blue_min_1,temp1.Blue)
		        Green_max_2=max(Green_max_2,temp2.Green)
		        Red_max_2=max(Red_max_2,temp2.Red)
		        Blue_max_2=max(Blue_max_2,temp2.Blue)
		        Green_min_2=min(Green_min_2,temp2.Green)
		        Red_min_2=min(Red_min_2,temp2.Red)
		        Blue_min_2=min(Blue_min_2,temp2.Blue)
		      Next
		    next
		    
		    If count > 0 Then
		      Green_AV_1 = Green_AV_1 / count
		      Red_AV_1 = Red_AV_1 / count
		      Blue_AV_1 = Blue_AV_1/ count
		      Green_AV_2 = Green_AV_2 / count
		      Red_AV_2 = Red_AV_2 / count
		      Blue_AV_2 = Blue_AV_2/ count
		    End
		    
		    //for all colors perfrom
		    // b = av2-av1
		    // a1=(max2-b)/max1
		    // a2=(min2-b)/min1
		    // a = (a1+a2)/2
		    
		    Green_b=Green_AV_2-Green_AV_1
		    if Green_max_1>0 then
		      Green_a_1=(Green_max_2-Green_b)/Green_max_1
		      if Green_min_1>0 then
		        Green_a_2=(Green_min_2-Green_b)/Green_min_1
		      else
		        Green_a_2=Green_a_1
		      end
		    else
		      if Green_min_1>0 then
		        Green_a_2=(Green_min_2-Green_b)/Green_min_1
		        Green_a_1=Green_a_2
		      else
		        Green_a_2=1
		        Green_a_1=1
		      end
		    end
		    
		    Red_a_1=(Red_a_1+Red_a_2)/2
		    Red_b=Red_AV_2-Red_AV_1
		    if Red_max_1>0 then
		      Red_a_1=(Red_max_2-Red_b)/Red_max_1
		      if Red_min_1>0 then
		        Red_a_2=(Red_min_2-Red_b)/Red_min_1
		      else
		        Red_a_2=Red_a_1
		      end
		    else
		      if Red_min_1>0 then
		        Red_a_2=(Red_min_2-Red_b)/Red_min_1
		        Red_a_1=Red_a_2
		      else
		        Red_a_2=1
		        Red_a_1=1
		      end
		    end
		    Red_a_1=(Red_a_1+Red_a_2)/2
		    
		    Blue_a_1=(Blue_a_1+Blue_a_2)/2
		    Blue_b=Blue_AV_2-Blue_AV_1
		    if Blue_max_1>0 then
		      Blue_a_1=(Blue_max_2-Blue_b)/Blue_max_1
		      if Blue_min_1>0 then
		        Blue_a_2=(Blue_min_2-Blue_b)/Blue_min_1
		      else
		        Blue_a_2=Blue_a_1
		      end
		    else
		      if Blue_min_1>0 then
		        Blue_a_2=(Blue_min_2-Blue_b)/Blue_min_1
		        Blue_a_1=Blue_a_2
		      else
		        Blue_a_2=1
		        Blue_a_1=1
		      end
		    end
		    Blue_a_1=(Blue_a_1+Blue_a_2)/2
		    
		    Dim cg,cr,cb as integer
		    
		    For y As Integer = 0 To lastY
		      For x As Integer = 0 To lastX
		        temp1 = surf1.Pixel(x, y)
		        cg=min(max(temp1.Green*Green_a_1+Green_b,0),255)
		        cr=min(max(temp1.Red*Red_a_1+Red_b,0),255)
		        cb=min(max(temp1.Blue*Blue_a_1+Blue_b,0),255)
		        surf1.Pixel(x,y)=RGB(cr,cg,cb)
		      Next
		    Next
		  else
		    MsgBox("no picture for normalizing")
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As Integer
		  #Pragma Unused AttributeLink
		  If mCurrentUserFunction <> Nil Then
		    if mCurrentUserFunction.FunctionName = CorectionFunction Then
		      Dim pic As Picture = TakePhoto(False)
		      
		      If pic = Nil Then
		        Return 1
		      ElseIf pic.isBlackMBS Then
		        Return 1
		      End
		      
		      CorrectionPicture.SIAP(pic)
		      Dim X As Integer = 0
		      Dim Y As Integer = 0
		      CorectionPoint.X = 0
		      CorectionPoint.Y = 0
		      If GetCorrectedPosition(pic, ReferencePicture.GIAP, X, Y, DiffValue.GIAI, VectorsCount.GIAI) Then
		        CorectionPoint.X = X - FrameCoordinates.X
		        CorectionPoint.Y = Y - FrameCoordinates.Y
		        
		        FrameCoordinates.X = X
		        FrameCoordinates.Y = Y
		        VerticalCompensation.SIAB(True)
		        HorizontalCompensation.SIAB(True)
		      End
		      
		      Return 2
		    End
		  End
		  
		  Dim graber As CamGrabber = CamGrabbersManager.instance.GetGrabber(VideoName.GIAS, VideoIndex.GIAI)
		  if graber = Nil Then
		    Return 3
		  End
		  
		  Dim pic As Picture = nil
		  if mCurrentUserFunction <> Nil And mCurrentUserFunction.FunctionName = TakeRefPhotoFunction Then
		    pic = TakePhoto
		  ElseIf AutomaticCorection.GIAB Then
		    Dim HC As Boolean = HorizontalCompensation.GIAB
		    DIm VC As Boolean = VerticalCompensation.GIAB
		    
		    VerticalCompensation.SIAB(true)
		    HorizontalCompensation.SIAB(true)
		    FrameCoordinates.X = FrameCoordinates.X + CorectionPoint.X
		    FrameCoordinates.Y = FrameCoordinates.Y + CorectionPoint.Y
		    
		    pic = TakePhoto
		    
		    HorizontalCompensation.SIAB(HC)
		    VerticalCompensation.SIAB(VC)
		    FrameCoordinates.X = FrameCoordinates.X - CorectionPoint.X
		    FrameCoordinates.Y = FrameCoordinates.Y - CorectionPoint.Y
		  Else
		    pic = TakePhoto
		  End
		  
		  If pic = Nil Then
		    Return 1
		  ElseIf pic.isBlackMBS Then
		    Return 1
		  End
		  
		  if mCurrentUserFunction <> Nil Then
		    Select Case mCurrentUserFunction.FunctionName
		    Case TakeRefPhotoFunction
		      ReferencePicture.SIAP(pic)
		      Result = ReferencePicture.GIAS
		      
		      CorectionPoint.X = 0
		      CorectionPoint.Y = 0
		      Return 2
		    End
		  End
		  Picture.SIAP(pic)
		  Result = Picture.GIAS
		  Return 2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceAttribute() As AttributeClass
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case TakePhotoFunction
		      Return Picture
		    Case TakeRefPhotoFunction
		      Return ReferencePicture
		    Case CorectionFunction
		      Return CorectionPoint
		    End
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestartCorrection()
		  If AutomaticCorection.GIAB Then
		    
		    //wait some time before taking photo
		    Dim TimeOutStartTime as double = GetActTime_sec
		    Dim WaitTime As Double = ManualWait.GIAI / 1000
		    While GetActTime_sec < (TimeOutStartTime + WaitTime)
		      App.YieldToNextThread
		    Wend
		    
		    Dim pic As Picture = TakePhoto(False)
		    if pic <> Nil then
		      CorrectionPicture.SIAP(pic)
		      Dim X As Integer = 0
		      Dim Y As Integer = 0
		      CorectionPoint.X = 0
		      CorectionPoint.Y = 0
		      
		      If GetCorrectedPosition(pic, ReferencePicture.GIAP, X, Y, DiffValue.GIAI, VectorsCount.GIAI) Then
		        CorectionPoint.X = X - FrameCoordinates.X
		        CorectionPoint.Y = Y - FrameCoordinates.Y
		        
		        FrameCoordinates.X = X
		        FrameCoordinates.Y = Y
		        VerticalCompensation.SIAB(True)
		        HorizontalCompensation.SIAB(True)
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As Boolean
		  #Pragma Unused Parameter
		  #Pragma Unused AttributeLink
		  
		  Dim graber As CamGrabber = CamGrabbersManager.instance.GetGrabber(VideoName.GIAS, VideoIndex.GIAI)
		  if graber <> Nil Then
		    If not graber.IsInitialized Then
		      graber.InitGrabber
		      if not graber.IsInitialized Then
		        Return False
		      End
		    End
		    If not graber.IsPreviewing Then
		      graber.StartPreview
		    End
		    Return True
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartCam()
		  Dim graber As CamGrabber = CamGrabbersManager.instance.GetGrabber(VideoName.GIAS, VideoIndex.GIAI)
		  if graber <> Nil And graber.IsInitialized And not graber.IsPreviewing Then
		    graber.StartPreview
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TakePhoto(withSifting As Boolean = true, withNormalize as Boolean = false) As Picture
		  Dim graber As CamGrabber = CamGrabbersManager.instance.GetGrabber(VideoName.GIAS, VideoIndex.GIAI)
		  if graber <> Nil Then
		    if graber.IsPreviewing Then
		      Dim pic As Picture = graber.CurrentFrame
		      if pic <> Nil then
		        if pic.isBlackMBS Then
		          Return Nil
		        End
		        Return TransformPicture(pic, withSifting, withNormalize)
		      End
		    End
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TransformPicture(pic As Picture, withShifting As Boolean = True, withNormalize as Boolean = false) As Picture
		  Dim tmp As Picture = pic
		  
		  If tmp <> Nil Then
		    if tmp <> Nil And HorizontalMirroring.GIAB Then
		      tmp = tmp.HMirrorMBS
		    End
		    
		    If tmp <> Nil And VerticalMirroring.GIAB Then
		      tmp = tmp.VMirrorMBS
		    End
		    
		    If tmp <> Nil And Rotate.GIAB Then
		      tmp = tmp.RotateMBS(RotateAngle.GIAD)
		    End
		  End
		  
		  
		  if withShifting Then
		    if tmp <> Nil Then
		      Dim X As Integer = 0
		      Dim Y As Integer = 0
		      Dim W As Integer = tmp.Width
		      Dim H As Integer = tmp.Height
		      if VerticalCompensation.GIAB or HorizontalCompensation.GIAB Then
		        if HorizontalCompensation.GIAB Then
		          X = FrameCoordinates.X
		          W = FrameCoordinates.Width
		        End
		        if VerticalCompensation.GIAB Then
		          Y = FrameCoordinates.Y
		          H = FrameCoordinates.Height
		        End
		      End
		      Dim result As Picture = new Picture(W, H, 32)
		      If PictureCopyPixelFastMBS(result, tmp, 0, 0, X, Y, W, H) Then
		        tmp = result
		      End
		    End
		  End
		  
		  if tmp <> Nil And withNormalize then
		    Me.Normalize(tmp,Me.ReferencePicture.GIAP)
		  end
		  
		  
		  Return tmp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunctionFinished()
		  // Part of the UserFunctions interface.
		  CloseCam
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WaitBeforeStart() As Integer
		  // Part of the UserFunctions interface.
		  Return ManualWait.GIAI
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AutomaticCorection As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CorectionPoint As Point_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CorrectionPicture As Picture_Attribute = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DiffValue As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FrameCoordinates As Coordinates_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		HorizontalCompensation As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		HorizontalMirroring As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ManualWait As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Picture As Picture_Attribute = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReferencePicture As Picture_Attribute = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Rotate As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RotateAngle As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		VectorsCount As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		VerticalCompensation As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		VerticalMirroring As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		VideoIndex As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		VideoInputName As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		VideoName As String_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = CorectionFunction, Type = String, Dynamic = False, Default = \"corectionfunction", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TakePhotoFunction, Type = String, Dynamic = False, Default = \"takephoto", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TakeRefPhotoFunction, Type = String, Dynamic = False, Default = \"takeerfphoto", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = Side, Type = Integer, Flags = &h0
		None
		  Left
		  Top
		  Right
		Bottom
	#tag EndEnum


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
			Name="DataAvailable"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="LastPrmptCheck"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
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
			Name="TimeOutValue"
			Visible=false
			Group="Behavior"
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
	#tag EndViewBehavior
End Class
#tag EndClass
