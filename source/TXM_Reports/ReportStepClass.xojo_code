#tag Class
Protected Class ReportStepClass
Inherits HMI_StepClass
Implements ReportIF
	#tag Method, Flags = &h0
		Sub Add_TeststepReportList(byref ix as integer)
		  
		  if Me.ExecuteTest.GIAB then
		    if Me.TestReportList<>nil then
		      Me.TestReportList.Refresh_Teststep_ReportList(ix)
		      'new if report true then add teststep record into database
		      'end
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckError(ByRef S as string, ByRef ErrState as integer)
		  Dim LE as integer
		  
		  LE=Me.TestResult.GIAI
		  if Me.ExecuteTest.GIAB then
		    if LE=ErrorCode_Fail then
		      S=S+Me.ErrorMessage.GIAS
		    end
		    if ErrState<LE then
		      ErrState=LE
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckErrorOn() As Boolean
		  return Me.ExecuteTest.GIAB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.ExecuteTest=Me.IAB("ExecuteTest",false,false)
		  Me.ErrorMessage=Me.IAS("ErrorMessage","",false)
		  
		  Me.TestDescription=Me.IAS("TestDescription","",false)
		  Me.TestCriteria=Me.IAS("TestCriteria","",false)
		  Me.TestMeasurement=Me.IAS("TestMeasurement","",false)
		  Me.TestResult=Me.IAE("TestResult",ErrorCodeEnum,false)
		  
		  Me.Index=Me.IAI("Index",0,false)
		  Me.Suffix=Me.IAS("Suffix","",false)
		  
		  Me.TestReportList= new TestReportCollection
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorMessage(ByRef RM as string, ByRef EM as string, ByRef ErrState as integer)
		  
		  // collects error messages from Report Lines stored values
		  if ErrState=ErrorCode_Off then
		  else
		    if ErrState=ErrorCode_Skipped then
		      RM=RM+"Teststep"+chr(9)+Me.Name.GIAS+chr(9)+Me.TestDescription.GIAS+chr(9)+Me.TestCriteria.GIAS+chr(9)+""+chr(9)+"Skipped"+chr(13)
		      EM=EM+"Test step "+Me.Name.GIAS+" has been skipped"+chr(13)
		    else
		      if Me.ExecuteTest.GIAB then
		        if Me.TestReportList<>nil then
		          Me.TestReportList.GetErrorMessage(RM,EM,ErrState)
		          
		          if ErrState<Me.TestResult.GIAI then
		            ErrState=Me.TestResult.GIAI
		          end
		        else
		          
		          Select case Me.TestResult.GIAI
		          case ErrorCode_Pass
		            RM=RM+"Teststep"+chr(9)+Me.Name.GIAS+chr(9)+Me.TestDescription.GIAS+chr(9)+Me.TestCriteria.GIAS+chr(9)+Me.TestMeasurement.GIAS+chr(9)+Me.TestResult.GIAS+chr(13)
		            ErrState=ErrState
		          case ErrorCode_NotDone, ErrorCode_InProgress, ErrorCode_Skipped
		            EM=EM+"Test step "+Me.Name.GIAS+" has been skipped"+chr(13)
		            //Me.ErrorMessage.SIAS(EM)
		          case ErrorCode_Fail
		            RM=RM+"Teststep"+chr(9)+Me.Name.GIAS+chr(9)+Me.TestDescription.GIAS+chr(9)+Me.TestCriteria.GIAS+chr(9)+Me.TestMeasurement.GIAS+chr(9)+Me.TestResult.GIAS+chr(13)
		            Dim ErS as string
		            ErS=Me.ErrorMessage.GIAS+chr(13)
		            if ErS.len>4 then
		              EM=EM+Me.ErrorMessage.GIAS+chr(13)
		              RM=RM+"------------------------------------------"+chr(13)+ErS+"------------------------------------------"+chr(13)
		            end
		          end
		          if ErrState<Me.TestResult.GIAI then
		            ErrState=Me.TestResult.GIAI
		          end
		        end
		      end
		    end
		  end
		  
		  //AddDebugTextCR("GetErrorMessage from "+Me.Name.GIAS+": "+RM+"//"+EM)
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadBasicAttributeDesc()
		  ParseAttributesDescription("%WORKINGFOLDER%" + PathSeparator + "BasicDescription", "Report_StepClass_desc.xml")
		  Super.LoadBasicAttributeDesc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetError(ResetState as integer)
		  
		  if Me.ExecuteTest.GIAB then
		    Me.TestResult.SIAI(ResetState)
		  else
		    Me.TestResult.SIAI(ErrorCode_Off)
		  end
		  
		  if TestReportList<>nil then
		    TestReportList.ClearAll
		  end
		  
		  Me.ErrorMessage.SIAS("")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetErrorMessage(vTestRun as integer, vTestResult as integer, vErrorMessage as string, vTestDescription as string, vTestCriteria as string, vTestMeasurement as string)
		  
		  
		  if vTestDescription<>"" then
		    Me.TestDescription.SIAS(vTestDescription)
		  else
		    if Me.TestDescription.GIAS<>"" then
		      Me.TestDescription.SIAS(Me.Name.GIAS)
		    end
		  end
		  
		  if vTestCriteria<>"" then
		    Me.TestCriteria.SIAS(vTestCriteria)
		  end
		  
		  Me.ErrorMessage.SIAS(vErrorMessage)
		  Me.TestMeasurement.SIAS(vTestMeasurement)
		  Me.TestResult.SIAI(vTestResult)
		  
		  if Me.TestReportList=nil then
		    Me.TestReportList=new TestReportCollection
		  end
		  
		  Me.TestReportList.SetLine(vTestRun,Me.Name.GIAS, Me.TestDescription.GIAS,Me.TestCriteria.GIAS,Me.TestMeasurement.GIAS,Me.ErrorMessage.GIAS,Me.TestResult.GIAI)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetErrorMessage(vTestRun as integer, vTestResult as integer, vName as string, vErrorMessage as string, vTestDescription as string, vTestCriteria as string, vTestMeasurement as string)
		  
		  
		  if vTestDescription<>"" then
		    Me.TestDescription.SIAS(vTestDescription)
		  else
		    if Me.TestDescription.GIAS<>"" then
		      Me.TestDescription.SIAS(Me.Name.GIAS)
		    end
		  end
		  
		  if vTestCriteria<>"" then
		    Me.TestCriteria.SIAS(vTestCriteria)
		  end
		  
		  Me.ErrorMessage.SIAS(vErrorMessage)
		  Me.TestMeasurement.SIAS(vTestMeasurement)
		  Me.TestResult.SIAI(vTestResult)
		  
		  if Me.TestReportList=nil then
		    Me.TestReportList=new TestReportCollection
		  end
		  
		  Me.TestReportList.SetLine(vTestRun,vName, Me.TestDescription.GIAS,Me.TestCriteria.GIAS,Me.TestMeasurement.GIAS,Me.ErrorMessage.GIAS,Me.TestResult.GIAI)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetErrorMessage(vTestResult as integer, vErrorMessage as string, vTestDescription as string, vTestCriteria as string, vTestMeasurement as string)
		  
		  
		  SetErrorMessage(0,vTestResult, vErrorMessage, vTestDescription, vTestCriteria, vTestMeasurement)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetErrorMessage(vTestResult as integer, vName as string, vErrorMessage as string, vTestDescription as string, vTestCriteria as string, vTestMeasurement as string)
		  
		  
		  SetErrorMessage(0,vTestResult, vName, vErrorMessage, vTestDescription, vTestCriteria, vTestMeasurement)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  Me.TestResult.SIAI(ErrorCode_NotDone)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As Boolean
		  'Assign the stepID of substeps of a reportstep class with the next upper teststep class
		  'in order to assign the event records in the database to the corresponding test step
		  
		  Dim a as Boolean
		  a= super.Step_Start
		  
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ErrorMessage As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ExecuteTest As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Index As Integer_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Suffix As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		TestCriteria As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestDescription As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestMeasurement As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestResult As Enum_AttributeClass = nil
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
			InitialValue=""
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
