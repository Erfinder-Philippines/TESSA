#tag Class
Protected Class AveragingLoop_StepClass
Inherits Loop_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From Loop_StepClass
		  // Constructor(ConfigText as String) -- From StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  Me.Input1=IAD("Input1",0,false)
		  Me.Average1=IAD("Average1",0,false)
		  Me.Maximum1=IAD("Maximum1",0,false)
		  Me.Minimum1=IAD("Minimum1",0,false)
		  
		  Me.Input2=IAD("Input2",0,false)
		  Me.Average2=IAD("Average2",0,false)
		  Me.Maximum2=IAD("Maximum2",0,false)
		  Me.Minimum2=IAD("Minimum2",0,false)
		  
		  Me.Input3=IAD("Input3",0,false)
		  Me.Average3=IAD("Average3",0,false)
		  Me.Maximum3=IAD("Maximum3",0,false)
		  Me.Minimum3=IAD("Minimum3",0,false)
		  
		  Me.Input4=IAD("Input4",0,false)
		  Me.Average4=IAD("Average4",0,false)
		  Me.Maximum4=IAD("Maximum4",0,false)
		  Me.Minimum4=IAD("Minimum4",0,false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  LC=Me.LoopCounter.GIAI
		  
		  Select case LC
		  case 0
		    Me.Sum1=0
		    Me.Sum2=0
		    Me.Sum3=0
		    Me.Sum4=0
		    Me.Average1.SIAD(0)
		    Me.Average2.SIAD(0)
		    Me.Average3.SIAD(0)
		    Me.Average4.SIAD(0)
		    
		    Me.Maximum1.SIAD(0)
		    Me.Minimum1.SIAD(0)
		    Me.Maximum2.SIAD(0)
		    Me.Minimum2.SIAD(0)
		    Me.Maximum3.SIAD(0)
		    Me.Minimum3.SIAD(0)
		    Me.Maximum4.SIAD(0)
		    Me.Minimum4.SIAD(0)
		  case 1
		    Me.Sum1=Me.Input1.GIAD
		    Me.Sum2=Me.Input2.GIAD
		    Me.Sum3=Me.Input3.GIAD
		    Me.Sum4=Me.Input4.GIAD
		    Me.Average1.SIAD(Input1.GIAD)
		    Me.Average2.SIAD(Input2.GIAD)
		    Me.Average3.SIAD(Input3.GIAD)
		    Me.Average4.SIAD(Input4.GIAD)
		    
		    Me.Maximum1.SIAD(Me.Input1.GIAD)
		    Me.Minimum1.SIAD(Me.Input1.GIAD)
		    Me.Maximum2.SIAD(Me.Input2.GIAD)
		    Me.Minimum2.SIAD(Me.Input2.GIAD)
		    Me.Maximum3.SIAD(Me.Input3.GIAD)
		    Me.Minimum3.SIAD(Me.Input3.GIAD)
		    Me.Maximum4.SIAD(Me.Input4.GIAD)
		    Me.Minimum4.SIAD(Me.Input4.GIAD)
		    
		  else
		    Me.Sum1=Me.Sum1+Me.Input1.GIAD
		    Me.Sum2=Me.Sum2+Me.Input2.GIAD
		    Me.Sum3=Me.Sum3+Me.Input3.GIAD
		    Me.Sum4=Me.Sum4+Me.Input4.GIAD
		    Me.Average1.SIAD(Me.Sum1/LC)
		    Me.Average2.SIAD(Me.Sum2/LC)
		    Me.Average3.SIAD(Me.Sum3/LC)
		    Me.Average4.SIAD(Me.Sum4/LC)
		    
		    Me.Maximum1.SIAD(Max(Me.Input1.GIAD,Me.Maximum1.GIAD))
		    Me.Minimum1.SIAD(Min(Me.Input1.GIAD,Me.Minimum1.GIAD))
		    Me.Maximum2.SIAD(Max(Me.Input2.GIAD,Me.Maximum2.GIAD))
		    Me.Minimum2.SIAD(Min(Me.Input2.GIAD,Me.Minimum2.GIAD))
		    Me.Maximum3.SIAD(Max(Me.Input3.GIAD,Me.Maximum3.GIAD))
		    Me.Minimum3.SIAD(Min(Me.Input3.GIAD,Me.Minimum3.GIAD))
		    Me.Maximum4.SIAD(Max(Me.Input4.GIAD,Me.Maximum4.GIAD))
		    Me.Minimum4.SIAD(Min(Me.Input4.GIAD,Me.Minimum4.GIAD))
		  end
		  
		  return Super.Step_Run
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Average1 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Average2 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Average3 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Average4 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input1 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input2 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input3 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input4 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LC As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Maximum1 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Maximum2 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Maximum3 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Maximum4 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Minimum1 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Minimum2 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Minimum3 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Minimum4 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Sum1 As double
	#tag EndProperty

	#tag Property, Flags = &h0
		Sum2 As double
	#tag EndProperty

	#tag Property, Flags = &h0
		Sum3 As double
	#tag EndProperty

	#tag Property, Flags = &h0
		Sum4 As double
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
			Name="InternalLoopCounter"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalLoopValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LC"
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
			Name="Sum1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sum2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sum3"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sum4"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
