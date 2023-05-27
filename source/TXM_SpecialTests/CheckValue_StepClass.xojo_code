#tag Class
Protected Class CheckValue_StepClass
Inherits ReportStepClass
	#tag Method, Flags = &h0
		Sub CalcError()
		  
		  Dim TNA, UNT, DESC, REFS as string
		  Dim i, EndNum as integer = 0
		  Dim LR,OverAllResult as boolean = true
		  
		  TNA=TestName.GIAS
		  if TNA="" then
		    TNA=Name.GIAS
		  end
		  
		  if (Suffix.GIAS<>"") or (Index.GIAS<>"") then
		    TNA=TNA+" "+Suffix.GIAS+Index.GIAS
		  end
		  
		  UNT=Units.GIAS
		  if UNT<>"" then
		    UNT=" ["+UNT+"]"
		  end
		  
		  if ArrayMode.GIAI=0 then
		    OverAllResult=CheckSingleValue(-1)  // -1 will be repplaced by the active value for each attribute
		    Result.SIAB(OverAllResult)
		  else
		    Select case ArrayMode.GIAI
		    case 0 // singel point see above
		    case 1 // check values until ActiveValue-1
		      EndNum=Input.GIAA-1
		    case 2 // check values until ActiveValue
		      EndNum=Input.GIAA
		    case 3 // check values until AllValues
		      EndNum=Input.GIAN-1
		    end
		    
		    for i=0 to EndNum
		      LR=CheckSingleValue(i)
		      Result.SIAB(LR,i)
		      if not(LR) then
		        OverAllResult=false
		      end
		    next
		  end
		  
		  DESC=TestDescription.GIAS
		  
		  if TestMode.GIAI<4 then
		    if DESC="" then DESC="Check if value is within limits"
		    REFS=LowerLimit.GIAS+"/"+UpperLimit.GIAS
		    TestCriteria.SIAS(REFS)
		  else
		    Select case TestMode.GIAI
		    case 4,5
		      if DESC="" then DESC="Check if filtered value is greater zero"
		      REFS="Mask:"+Me.Reference.GIAS
		      TestCriteria.SIAS(REFS)
		    case 6
		      if DESC="" then DESC="Check if value equal to reference"
		      REFS=Reference.GIAS
		    case 7,8
		      if DESC="" then DESC="Check if reference contains the value"
		      REFS=Reference.GIAS
		    case 9
		      if DESC="" then DESC="Check if reference doesn't contain the value"
		      REFS=Reference.GIAS
		    end
		  end
		  if OverAllResult then
		    Me.SetErrorMessage(Index.GIAI,ErrorCode_Pass,TNA,"",DESC,REFS,Input.GIAS+UNT)
		  else
		    Me.SetErrorMessage(Index.GIAI,ErrorCode_Fail,TNA,"",DESC,REFS,Input.GIAS+UNT)
		  end
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckSingleValue(Num as integer) As boolean
		  
		  Dim DESC, REFS as string
		  Dim RV as boolean = false
		  
		  Select case TestMode.GIAI
		  case 0 //absolut fixed error limit
		    ErrorOutput.SIAD(Input.GIAD(Num)-Reference.GIAD(Num),Num)
		    RV=((Input.GIAD(Num)<=UpperLimit.GIAD(Num)) and (Input.GIAD(Num)>=LowerLimit.GIAD(Num)))
		    'AddDebugTextCR("CheckValue num:"+str(Num)+", mode:"+TestMode.GIAS+", input:"+str(Input.GIAD(Num))+", reference "+str(Reference.GIAD)+", Error:"+str(ErrorOutput.GIAD))
		  case 1 //absolut error limit
		    LowerLimit.SIAD(Reference.GIAD(Num)-ErrorLimit.GIAD(Num),Num)
		    UpperLimit.SIAD(Reference.GIAD(Num)+ErrorLimit.GIAD(Num),Num)
		    ErrorOutput.SIAD(Input.GIAD(Num)-Reference.GIAD(Num),Num)
		    RV=((Input.GIAD(Num)<=UpperLimit.GIAD(Num)) and (Input.GIAD(Num)>=LowerLimit.GIAD(Num)))
		  case 2 //relative based on reference
		    LowerLimit.SIAD(Reference.GIAD(Num)*(100-ErrorLimit.GIAD(Num))/100,Num)
		    UpperLimit.SIAD(Reference.GIAD(Num)*(100+ErrorLimit.GIAD(Num))/100,Num)
		    ErrorOutput.SIAD(100*(Input.GIAD(Num)-Reference.GIAD(Num))/Reference.GIAD(Num),Num)
		    RV=((Input.GIAD(Num)<=UpperLimit.GIAD(Num)) and (Input.GIAD(Num)>=LowerLimit.GIAD(Num)))
		  case 3 //relative based on range
		    LowerLimit.SIAD(Range.GIAD(Num)*(100-ErrorLimit.GIAD(Num))/100,Num)
		    UpperLimit.SIAD(Range.GIAD(Num)*(100+ErrorLimit.GIAD(Num))/100,Num)
		    ErrorOutput.SIAD(100*(Input.GIAD(Num)-Reference.GIAD(Num))/Range.GIAD(Num),Num)
		    RV=((Input.GIAD(Num)<=UpperLimit.GIAD(Num)) and (Input.GIAD(Num)>=LowerLimit.GIAD(Num)))
		  case 4 // digital add input with reference as mask, compare with 0, if bigger => true
		    RV=Bitwise.BitAnd(Input.GIAI(Num), Reference.GIAI(Num))>0
		    ErrorOutput.SIAB(RV,Num)
		    'AddDebugTextCR("CheckValue num:"+str(Num)+", mode:"+TestMode.GIAS+", input:"+str(Input.GIAI(Num))+", reference "+str(Reference.GIAI)+", Error:"+str(ErrorOutput.GIAB))
		  case 5 // digital add input with reference as mask, compare with 0, if 0 => true
		    RV=Bitwise.BitAnd(Input.GIAI(Num),Reference.GIAI(Num))=0
		    ErrorOutput.SIAB(RV,Num)
		    'AddDebugTextCR("CheckValue num:"+str(Num)+", mode:"+TestMode.GIAS+", input:"+str(Input.GIAI(Num))+", reference "+str(Reference.GIAI)+", Error:"+str(ErrorOutput.GIAB))
		  case 6 // compares the two values => must be equal
		    RV=Input.GIAS(Num)=Reference.GIAS(Num)
		    ErrorOutput.SIAB(RV,Num)
		    AddDebugTextCR("CheckValue num:"+str(Num)+", mode:"+TestMode.GIAS+", input:"+Input.GIAS(Num)+", reference "+Reference.GIAS(num)+", Error:"+str(ErrorOutput.GIAB))
		  case 7 // input must contain reference => ok
		    RV=Input.GIAS(Num).Instr(1, Reference.GIAS(Num))>0
		    ErrorOutput.SIAB(RV,Num)
		  case 8 // input must contain reference or viasversa
		    if (Input.GIAS(Num)="") or (Reference.GIAS(Num)="") then
		      RV=false
		      ErrorOutput.SIAB(false,Num)
		    else
		      RV=(Reference.GIAS(Num).Instr(1, Input.GIAS(Num))>0) or (Input.GIAS(Num).Instr(1, Reference.GIAS(Num))>0)
		      Me.ErrorOutput.SIAB(RV,Num)
		    end
		  case 9 // does not contain
		    RV=(not(Input.GIAS(Num).Instr(1, Reference.GIAS(Num))>0))
		    ErrorOutput.SIAB(RV,Num)
		  end
		  
		  
		  return RV
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Input=IAS("Input","0",False) //iad
		  Range=IAD("Range",0,False)
		  Reference=IAS("Reference","0",False) //iad
		  LowerLimit=IAD("LowerLimit",-10,False)
		  UpperLimit=IAD("UpperLimit",10,False)
		  ErrorLimit=IAD("ErrorLimit",1,False)
		  
		  TestMode=IAE("TestMode","0 absolute-fixed absolute relative range-relativ digital inverted-digital equal contains compare not-contains",False)
		  ArrayMode=IAE("ArrayMode","0 Off ActiveValue-1 ActiveValue AllValues",false)
		  TestName=IAS("TestName","",false)
		  Units=IAS("Units","",false)
		  
		  ErrorOutput=IAD("ErrorOutput",0,False)
		  Result=IAB("Result",false,False)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  
		  Me.CalcError
		  
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ArrayMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorLimit As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorOutput As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LowerLimit As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Range As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Reference As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Result As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestName As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Units As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		UpperLimit As Double_AttributeClass = nil
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
