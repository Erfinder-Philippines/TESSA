#tag Class
Protected Class Statistic_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor(ConfigText)
		  
		  Me.Input=Me.IAD("Input",0,false)
		  INput.IsArray=false
		  Me.Number_of_Values=Me.IAI("Number_of_Values", 0,false)
		  Me.Arithmetic_Mean=Me.IAD("Arithmetic_Mean",0,false)
		  Me.RMS_Mean=Me.IAD("RMS_Mean",0,false)
		  Me.Geometric_Mean=Me.IAD("Geometric_Mean",0,false)
		  Me.Harmonic_Mean=Me.IAD("Harmonic_Mean",0,false)
		  Me.Minimum=Me.IAD("Minimum",0,false)
		  Me.MinimumValueNr=Me.IAI("MinimumValueNr",0,false)
		  Me.Maximum=Me.IAD("Maximum",0,false)
		  Me.MaximumValueNr=Me.IAI("MaximumValueNr",0,false)
		  Me.Sum=Me.IAD("Sum",0,false)
		  Me.Standard_Deviation=Me.IAD("Standard_Deviation",0,false)
		  Me.Mode=Me.IAE("Mode","0 ActiveValue-1 ActiveValue AllValues",false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Dim FA as AttributeClass
		  Dim n,i,mivn,mavn as integer
		  Dim su,v,mi,ma,men, msum,qsum,gsum,hsum as double
		  Dim S as string
		  
		  FA=Input.Link
		  n=0
		  su=0
		  mi=0
		  ma=0
		  mivn=0
		  mavn=0
		  msum=0
		  qsum=0
		  su=0
		  
		  S=""
		  
		  if FA<>nil then
		    Select case Me.Mode.GIAI
		    case 0
		      n=FA.GOAA-1
		    case 1
		      n=FA.GOAA
		    case 2
		      n=FA.GOAN-1
		    else
		      n=0
		    end
		    
		    if n>0 then
		      mi=FA.GOAD(0)
		      ma=FA.GOAD(0)
		      if n>0 then
		        //calc sum and mean
		        for i=0 to n
		          v=FA.GOAD(i)
		          S=S+str(v)+chr(13)
		          su=su+v
		          if v>ma then
		            ma=v
		            mavn=i
		          else
		            if v<mi then
		              mi=v
		              mivn=i
		            end
		          end
		          qsum=qsum+v*v
		          gsum=gsum*v
		          if v<>0 then
		            hsum=hsum+1/v
		          end
		        next
		        //calc standard deviation
		        men=su/(n+1)
		        msum=0
		        for i=0 to n
		          v=FA.GOAD(i)
		          msum=msum+(v-men)^2
		        next
		        qsum=sqrt(qsum/(n+1))
		        gsum=gsum^(1/(n+1))
		        if hsum<>0 then
		          hsum=n/hsum
		        end
		      else
		        
		      end
		    end
		    msum=sqrt(msum/(n+1))
		  else
		    men=0
		    n=-1
		  end
		  
		  Me.Arithmetic_Mean.SIAD(men)
		  Me.RMS_Mean.SIAD(qsum)
		  Me.Geometric_Mean.SIAD(gsum)
		  Me.Harmonic_Mean.SIAD(hsum)
		  Me.Number_of_Values.SIAI(n+1)
		  Me.Minimum.SIAD(mi)
		  Me.MinimumValueNr.SIAI(mivn)
		  Me.Maximum.SIAD(ma)
		  Me.MaximumValueNr.SIAI(mavn)
		  Me.Sum.SIAD(su)
		  me.Standard_Deviation.SIAD(msum)
		  
		  return true
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Arithmetic_Mean As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Geometric_Mean As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Harmonic_Mean As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Maximum As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MaximumValueNr As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Minimum As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MinimumValueNr As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Number_of_Values As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RMS_Mean As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Standard_Deviation As Double_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Sum As Double_AttributeClass = nil
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
