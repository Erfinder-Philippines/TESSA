#tag Class
Protected Class Polygon_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Function Calc(X0 as double) As double
		  Dim Y0 as double
		  
		  // find the approriate index
		  if Me.X_Values.GIAD(LastIndex)<Me.X_Values.GIAD(LastIndex+1) then
		    while (X0>Me.X_Values.GIAD(LastIndex+1)) and (LastIndex<(Me.X_Values.GIAN-2))
		      LastIndex=LastIndex+1
		    wend
		    while (X0<Me.X_Values.GIAD(LastIndex)) and (LastIndex>0)
		      LastIndex=LastIndex-1
		    wend
		  else
		    while (X0<Me.X_Values.GIAD(LastIndex+1)) and (LastIndex<(Me.X_Values.GIAN-2))
		      LastIndex=LastIndex+1
		    wend
		    while (X0>Me.X_Values.GIAD(LastIndex)) and (LastIndex>0)
		      LastIndex=LastIndex-1
		    wend
		  end
		  // calc the output
		  if abs(Me.X_Values.GIAD(LastIndex+1)-Me.X_Values.GIAD(LastIndex))>0 then
		    'Y0=X0-Me.X_Values.GIAD(LastIndex)
		    'Y0=Y0*(Me.Y_Values.GIAD(LastIndex+1)-Me.Y_Values.GIAD(LastIndex))/(Me.X_Values.GIAD(LastIndex+1)-Me.X_Values.GIAD(LastIndex))
		    'Y0=Y0+Me.Y_Values.GIAD(LastIndex)
		    Y0=Me.Y_Values.GIAD(LastIndex)+((X0-Me.X_Values.GIAD(LastIndex))*(Me.Y_Values.GIAD(LastIndex+1)-Me.Y_Values.GIAD(LastIndex))/(Me.X_Values.GIAD(LastIndex+1)-Me.X_Values.GIAD(LastIndex)))
		  else
		    Y0=0
		  end
		  //check for the limts
		  if Me.LimitHigh.GIAB then
		    if X0>Me.X_Values.GIAD(LastIndex+1) then
		      Y0=Me.Y_Values.GIAD(LastIndex+1)
		    end
		  end
		  if Me.LimitLow.GIAB then
		    if X0<Me.X_Values.GIAD(LastIndex) then
		      Y0=Me.Y_Values.GIAD(LastIndex)
		    end
		  end
		  
		  return Y0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcInverse(X0 as double) As double
		  Dim Y0 as double
		  
		  // find the approriate index
		  if Me.Y_Values.GIAD(LastIndex)<Me.Y_Values.GIAD(LastIndex+1) then
		    while (X0>Me.Y_Values.GIAD(LastIndex+1)) and (LastIndex<(Me.Y_Values.GIAN-2))
		      LastIndex=LastIndex+1
		    wend
		    while (X0<Me.Y_Values.GIAD(LastIndex)) and (LastIndex>0)
		      LastIndex=LastIndex-1
		    wend
		  else
		    while (X0<Me.Y_Values.GIAD(LastIndex+1)) and (LastIndex<(Me.Y_Values.GIAN-2))
		      LastIndex=LastIndex+1
		    wend
		    while (X0>Me.Y_Values.GIAD(LastIndex)) and (LastIndex>0)
		      LastIndex=LastIndex-1
		    wend
		  end
		  // calc the output
		  if abs(Me.Y_Values.GIAD(LastIndex+1)-Me.Y_Values.GIAD(LastIndex))>0 then
		    Y0=Me.X_Values.GIAD(LastIndex)+((X0-Me.Y_Values.GIAD(LastIndex))*(Me.X_Values.GIAD(LastIndex+1)-Me.X_Values.GIAD(LastIndex))/(Me.Y_Values.GIAD(LastIndex+1)-Me.Y_Values.GIAD(LastIndex)))
		  else
		    Y0=0
		  end
		  
		  return Y0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.Input=Me.IAD("Input",0,false)
		  Me.Output=Me.IAD("Output",0,false, AttributeGroups.System)
		  Me.Output.ReadOnly = True
		  
		  Me.X_Values=Me.IAD("X_Values",0,false)
		  Me.Y_Values=Me.IAD("Y_Values",0,false)
		  
		  Me.LimitLow=Me.IAB("LimitLow",false,false)
		  Me.LimitHigh=Me.IAB("LimitHigh",false,false)
		  
		  Me.Inverse=Me.IAB("Inverse",false,false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  
		  
		  if Me.Inverse.GIAB then
		    Me.Input.SIAD(Me.CalcInverse(Me.Output.GIAD))
		  else
		    Me.Output.SIAD(Me.Calc(Me.Input.GIAD))
		  end
		  
		  Return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Input As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Inverse As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastIndex As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		LimitHigh As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LimitLow As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Output As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		X_Values As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Y_Values As Double_AttributeClass = nil
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
			Name="LastIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
