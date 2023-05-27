#tag Class
Protected Class ArrayAppend_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub AddAttr(i as integer)
		  
		  if i=0 then
		    i = (Ubound(AttributeList()) - StartUserAttribute)/2 + 2
		    AddAttribute("Input_"+str(i), "", "", AT_String, 0, 0, AttributeGroups.Parameters,true)
		    AddAttribute("Output_"+str(i), "", "", AT_String, 0, 0, AttributeGroups.Parameters,true)
		    i=1
		  else
		    Dim k as integer = (Ubound(AttributeList()) - StartUserAttribute)/2 + 1
		    while i>k
		      AddAttribute("Input_"+str(k+1), "", "", AT_String, 0, 0, AttributeGroups.Parameters,true)
		      AddAttribute("Output_"+str(k+1), "", "", AT_String, 0, 0, AttributeGroups.Parameters,true)
		      k=k+1
		    wend
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  
		  if (ChangedAttribute = InputTable) or (ChangedAttribute = OutputTable) then
		    if (InputTable.Link<>nil) and (OutputTable.Link<>nil) then
		      if (InputTable.Link.MyStep<>nil) and (OutputTable.Link.MyStep<>nil) then
		        // both tables are linked
		        if (InputTable.Link.MyStep IsA Table_StepClass) and (OutputTable.Link.MyStep IsA Table_StepClass) then
		          Dim InTable as Table_StepClass = Table_StepClass(InputTable.Link.MyStep)
		          Dim OutTable as Table_StepClass = Table_StepClass(OutputTable.Link.MyStep)
		          
		          // find attributes with the same name in both table and connect those
		          // check the date and time columns first
		          Dim i,ki,ko as integer = 1
		          ki=0
		          if InTable.Date.IsArray and OutTable.Date.IsArray then
		            SetAttrLinks( i,InTable.Date, OutTable.Date)
		          end
		          if InTable.Time.IsArray and OutTable.Time.IsArray then
		            SetAttrLinks( i,InTable.Time, OutTable.Time)
		          end
		          // take one attribute after the other from the input table
		          while (InTable.FirstDynamicAttribute+ki<Ubound(InTable.AttributeList()))
		            // now look for this name in the output table
		            ko=0
		            Dim Na1 as string = InTable.AttributeList(InTable.FirstDynamicAttribute+ki).Name
		            Dim Na2 as string = OutTable.AttributeList(OutTable.FirstDynamicAttribute+ko).Name
		            while (OutTable.FirstDynamicAttribute+ko<Ubound(OutTable.AttributeList())) and (Na1<>Na2)
		              ko=ko+1
		              Na1 = InTable.AttributeList(InTable.FirstDynamicAttribute+ki).Name
		              Na2 = OutTable.AttributeList(OutTable.FirstDynamicAttribute+ko).Name
		            wend
		            
		            if Na1=Na2 then
		              SetAttrLinks(i,InTable.AttributeList(InTable.FirstDynamicAttribute+ki), OutTable.AttributeList(OutTable.FirstDynamicAttribute+ko))
		            end
		            ki=ki+1
		          wend
		          // clean up
		          'i = StartUserAttribute + 2*(i-1)
		          'for ki = i to AttributesUbound-1
		          'if RemoveAttribute(ki) then
		          'end
		          'next
		        end
		      end
		    else
		      if InputTable.Link<>nil then
		        if (InputTable.Link.MyStep <>nil) then
		          // only input table is linked
		          if (InputTable.Link.MyStep IsA Table_StepClass) then
		            Dim InTable as Table_StepClass = Table_StepClass(InputTable.Link.MyStep)
		            
		            // find attributes with the same name in both table and connect those
		            // check the date and time columns first
		            Dim i,ki as integer = 1
		            ki=0
		            if InTable.Date.IsArray then
		              SetAttrLinks( i,InTable.Date, nil)
		            end
		            if InTable.Time.IsArray then
		              SetAttrLinks( i,InTable.Time, nil)
		            end
		            // take one attribute after the other from the input table
		            while (InTable.FirstDynamicAttribute+ki<Ubound(InTable.AttributeList()))
		              SetAttrLinks(i,InTable.AttributeList(InTable.FirstDynamicAttribute+ki), nil )
		              ki=ki+1
		            wend
		            // clean up
		            'i = StartUserAttribute + 2*(i-1)
		            'for ki = i to AttributesUbound-1
		            'if RemoveAttribute(ki) then
		            'end
		            'next
		          end
		        end
		      end
		    end
		  end
		  
		  
		  MainWindow.RedrawAttributeList
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  InputTable=IAS("InputTable", "",false)
		  OutputTable=IAS("OutputTable", "",false)
		  ValueIndex=IAI("ValueIndex", 0,false)
		  CopyMode = IAE("CopyMode","0 Active-1 Active All FromTo",false)
		  FromPosition = IAI("FromPosition",-1,false)
		  ToPosition = IAI("ToPosition",-1,false)
		  Input_1=IAS("Input_1", "",false)
		  Output_1=IAS("Output_1", "",false)
		  
		  StartUserAttribute = Ubound(AttributeList())
		  
		  AddUserFunction("Add Input", Input_1)
		  AddUserFunction("Add Output", Output_1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttrLinks(byref i as integer, AI as AttributeClass, AO as AttributeClass)
		  // add a new pair of Input/Output attributes
		  if (AI<>nil) or (AO<>nil) then
		    AddAttr(i)
		  end
		  // link the input if existent
		  if (AI<>nil) then
		    if AI IsA MultipleValuesAttributeClass then
		      Dim Inp as AttributeClass
		      Inp=AttributeList(2*(i-2)+StartUserAttribute)
		      if (Inp<>nil) then
		        if (Inp IsA AttributeClass) then
		          AttributeClass(Inp).Link=AI
		        end
		      end
		    end
		  end
		  // link the output if existent
		  if (AO<>nil) then
		    if AO IsA MultipleValuesAttributeClass then
		      Dim Outp as AttributeClass
		      Outp=AttributeList(2*(i-2)+1+StartUserAttribute)
		      if (Outp<>nil) then
		        if (Outp IsA AttributeClass) then
		          AttributeClass(Outp).Link=AO
		        end
		      end
		    end
		  end
		  // increase the counter
		  if (AI<>nil) or (AO<>nil) then
		    i=i+1
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  ValueIndex.SIAI(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  
		  Dim i as integer = (Ubound(AttributeList()) - StartUserAttribute)/2
		  Dim k as integer
		  
		  for k=0 to i
		    // copy all values from Input_k to Output_k
		    Dim Inp,Outp as AttributeClass
		    Inp=AttributeList(2*(k-1)+StartUserAttribute)
		    Outp=AttributeList(2*(k-1)+1+StartUserAttribute)
		    if (Inp<>nil) and (Outp<>nil) then
		      if (Inp IsA AttributeClass) and (Outp IsA AttributeClass) then
		        if (AttributeClass(Inp).Link<>nil) and (AttributeClass(Outp).Link<>nil) then
		          if (AttributeClass(Inp).Link IsA MultipleValuesAttributeClass) and (AttributeClass(Outp).Link IsA MultipleValuesAttributeClass) then
		            Dim II,OO as MultipleValuesAttributeClass
		            Dim FromPos, ToPos, NumPos as integer
		            
		            II=MultipleValuesAttributeClass(AttributeClass(Inp).Link)
		            OO=MultipleValuesAttributeClass(AttributeClass(Outp).Link)
		            DIm j,g as integer
		            
		            Select Case CopyMode.GIAI
		            case 0 // Active-1
		              FromPos=0
		              ToPos=II.GIAA-1
		            case 1 // Active
		              FromPos=0
		              ToPos=II.GIAA
		            case 2 // All
		              FromPos=0
		              ToPos=II.GIAN-1
		            case 3 // FromTo
		              FromPos=FromPosition.GIAI
		              if FromPos<0 then
		                FromPos=0
		              end
		              ToPos=ToPosition.GIAI
		              if (ToPos<0) then
		                if ToPos=-1 then
		                  ToPos=II.GIAN-1
		                else
		                  if ToPos=-2 then
		                    ToPos = II.GIAA
		                  else
		                    ToPos = II.GIAA-1
		                  end
		                end
		              else
		                if ToPos>II.GIAN then
		                  ToPos = II.GIAN
		                end
		              end
		            end
		            NumPos=ToPos-FromPos+1
		            g = OO.GIAN
		            if g=1 then
		              g=0
		            end
		            OO.SIAN(g+NumPos)
		            for j=FromPos to ToPos
		              OO.SIAS(II.GIAS(j),g-FromPos+j)
		            next
		          end
		        end
		      end
		    end
		  next
		  
		  ValueIndex.SIAI(ValueIndex.GIAI+1)
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  if (FuncName="Add Input") or (FuncName="Add Output") then
		    AddAttr(0)
		  end
		  
		  MainWindow.RedrawAttributeList
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CopyMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FromPosition As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		InputTable As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input_1 As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		OutputTable As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Output_1 As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartUserAttribute As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ToPosition As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ValueIndex As Integer_AttributeClass = nil
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
			Name="StartUserAttribute"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
