#tag Class
Protected Class TableDimension_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.DimensionList=Me.IAS("DimensionList","",true)
		  Me.DimensionList.IsArray = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillRecursiveDimensionLine(LinePart as string, EA as MultipleValuesAttributeClass)
		  Dim n as integer
		  if EA<>nil then
		    for n= 0 to Me.DimensionList.GIAN-1
		      if Me.NextStep=nil then
		        EA.AddValue(LinePart+Me.DimensionList.GIAS(n))
		      else
		        if Me.NextStep isA TableDimension_StepClass then
		          TableDimension_StepClass(Me.NextStep).FillRecursiveDimensionLine(LinePart+Me.DimensionList.GIAS(n)+" ",EA)
		        end
		      end
		    next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetActiveLine(ByRef LocalNumLines as integer, ByRef LocalActiveLine as integer)
		  LocalNumLines=Me.DimensionList.GIEnumCount
		  LocalActiveLine=Me.DimensionList.ActiveValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetActiveLine(ActiveLine as integer)
		  
		  // set the active line of the dimension itself
		  DimensionList.SIAA(ActiveLine)
		  // now set the activeLine of the upper table to the approbriate choice
		  if UpperStep<>nil then
		    if UpperStep isA Table_StepClass then
		      if Table_StepClass(UpperStep).SetDimensionChoice then
		      else
		        AddWarningTextCR("The choice is not an option of the underlying table")
		        'MsgBox("The choice is not an option of the underlying table")
		      end
		    end
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetTableDimension(Line as string) As boolean
		  Dim n,k as integer
		  Dim RV as boolean = false
		  
		  k=Me.DimensionList.GIAN
		  while not(RV) and (n<k)
		    if Line=Me.DimensionList.GIAS(n) then
		      Me.DimensionList.SIAA(n)
		      RV=true
		    else
		      n=n+1
		    end
		  wend
		  
		  return  RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TransferTableToDimensions(EA as AttributeClass, Level as integer)
		  Dim S as string
		  Dim i,k as integer
		  Dim found as boolean
		  Dim NumEntries as integer = 0
		  
		  DimensionList.SIAN(1)                       // set the dimension to the least possible amount
		  DimensionList.SIAS("",0)                    // erase the 0th entry
		  DimensionList.SIAS("",1)                    // erase the 1st entry
		  
		  for i=0 to EA.GIAN
		    S=NthField(EA.GIAS(i)," ",Level)
		    found = false
		    if S<>"" then
		      for k=0 to DimensionList.GIAN-1
		        if S=DimensionList.GIAS(k) then
		          found=true
		        end
		      next
		      if not(found) then
		        DimensionList.SIAN(NumEntries+1)
		        DimensionList.SIAS(S,NumEntries) 
		        NumEntries=NumEntries+1
		      end
		    end
		  next
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DimensionList As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EntryCounter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FirstEntry As string
	#tag EndProperty

	#tag Property, Flags = &h0
		LastEntry As string
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
			Name="EntryCounter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="FirstEntry"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="LastEntry"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
