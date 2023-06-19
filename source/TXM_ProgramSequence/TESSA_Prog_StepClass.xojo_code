#tag Class
Protected Class TESSA_Prog_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  If ChangedAttribute <> Nil Then
		    If ChangedAttribute = HMIWindowSize Or ChangedAttribute = HMI_Size Then
		      UpdateHMIWindowGeometry
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Remote=IAB("Remote",false,false)
		  HMI=IAB("HMI",false,false, AttributeGroups.Appearance)
		  Version=IAS("Version","",false)
		  ReleaseNotes=IAS("ReleaseNotes","",true)
		  AutomaticVersionCheck=IAB("AutomaticVersionCheck",false,false)
		  Beep_on_Error = IAB("Beep_on_Error",false,false)
		  TestResult_Halt = IAE("TestResult_Halt","0 never Halt_on_Fail Show_on_Fail Halt+End_on_Fail Direct_End_on_Fail Continue_on_Fail",false)
		  End_Teststep = IAS("End_Teststep","")
		  HMI_Toolbar = IAE("HMI_Toolbar","0 top bottom", False, AttributeGroups.Appearance)
		  HMIWindowSize = IAX("HMI_Window_Size", "100 0 100 1200 800", False, AttributeGroups.Appearance)
		  HMI_Size = IAE("HMI_Size","0 normal minimal maximal", False, AttributeGroups.Appearance)
		  HMIWindowSize.EnableOffset = False
		  HMIPageOffset = IAI("HMIPageOffset", 230, False, AttributeGroups.Appearance)
		  MaxProgTime=IAS("MaxProgTime","00:00",false)
		  AutomaticStartup=IAB("AutomaticStartup",false,false)
		  Hierarchical_Links=IAB("Hierarchical_Links",false,false)
		  Synchronize=IAB("Synchronize",false,false)
		  
		  SystemState = IAS("SystemState", "", False)
		  SystemState.NoSave=true
		  
		  AddUserFunction("Get", SystemState)
		  
		  Include_OS_Information = IAB("Include_OS_Information",true,false)
		  Include_Resource_Info = IAB("Include_Resource_Info",true,false)
		  Include_ComLog_Info = IAB("Include_ComLog_Info",true,false)
		  Include_Debug_Info = IAB("Include_Debug_Info",true,false)
		  Include_Warning_Info = IAB("Include_Warning_Info",true,false)
		  
		  'Tree = new TreeReport(ConfigText) // removed
		  AddUserFunction("Generate Tree Document", Version.Name, "Generate Tree Document", 0,UF_RunMode_Direct)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoCollectSystemState()
		  CollectSystemInformation(SystemState,Include_OS_Information.GIAB,Include_Resource_Info.GIAB,Include_ComLog_Info.GIAB, Include_Debug_Info.GIAB,Include_Warning_Info.GIAB)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContextMenuItems() As MenuItem()
		  Dim items(-1) As MenuItem = Super.GetContextMenuItems
		  For Each item As MenuItem in items
		    If item <> Nil Then
		      If item.Tag.StringValue = CopyMenuItem Or item.Tag.StringValue = CutMenuItem Then
		        item.Visible = False
		      End
		    End
		  Next
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTestReportMatrix() As TestReportMatrix
		  Dim FS,TP as BasicClass = nil
		  
		  FS=Me.FirstSubStep
		  
		  while (FS<>nil) and (TP=nil)
		    if FS IsA TestReport_StepClass then
		      TP=FS
		      FS=nil
		    else
		      FS=FS.NextStep
		    end
		    
		  wend
		  
		  return TestReport_StepClass(TP).CurrentTestreports
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh_Password()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Super.Step_Init_AfterLoad
		  Step_Init
		  
		  UpdateHMIWindowGeometry
		  
		  if Me.AutomaticStartup.GIAB then
		    App.MainLoop("toggle")
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateHMIWindowGeometry()
		  If Me.HMI.GIAB Then
		    Select case HMI_Size.GIAI
		    Case 0
		      HMI_Window.Left = Me.HMIWindowSize.X
		      HMI_Window.Top = Me.HMIWindowSize.Y
		      HMI_Window.Width = Me.HMIWindowSize.Width
		      HMI_Window.Height = Me.HMIWindowSize.Height
		    Case 1
		      HMI_Window.Minimize
		    Case 2
		      'HMI_Window.FullScreen = true
		      HMI_Window.Maximize
		      HMI_Window.Left = 0
		      HMI_Window.Top = 0
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  Select case FuncName
		    
		  case is = "Generate Tree Document"
		    'Tree.start_run(self) // removed feature
		    
		  Case is = "Get"
		    DoCollectSystemState
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ActiveStep As StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AutomaticStartup As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AutomaticVersionCheck As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Beep_on_Error As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		End_Teststep As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Hierarchical_Links As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		HMI As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		HMIPageOffset As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		HMIWindowSize As Coordinates_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		HMI_Size As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		HMI_Toolbar As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Include_ComLog_Info As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Include_Debug_Info As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Include_OS_Information As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Include_Resource_Info As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Include_Warning_Info As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxProgTime As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgFolderItem As FolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReleaseNotes As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Remote As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Synchronize As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SystemState As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestResult_Halt As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Version As String_AttributeClass = nil
	#tag EndProperty


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
			Name="Untitled"
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
	#tag EndViewBehavior
End Class
#tag EndClass
