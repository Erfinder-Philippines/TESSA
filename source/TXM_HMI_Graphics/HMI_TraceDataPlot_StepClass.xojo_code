#tag Class
Protected Class HMI_TraceDataPlot_StepClass
Inherits HMI_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.LineStyle=Me.IAE("LineStyle", "0 solid dotted slash-dotted dashed none",false)
		  Me.PenWidth=Me.IAI("PenWidth",1,False)
		  
		  Me.DataPointMarker=Me.IAE("PointType", "0 point circle x plus star square diamond triangle none",false)
		  Me.PointWidth=Me.IAI("PointWidth",8,False)
		  
		  Me.xValues=Me.IAD("xValues", 0,true)
		  Me.yValues=Me.IAD("yValues", 0,true)
		  
		  me.DiscardLastPoint=me.IAB("DiscardLastPoint",true,false)
		  
		  Me.xScalingFactor=Me.IAD("xScalingFactor", 1.0,false)
		  Me.yScalingFactor=Me.IAD("yScalingFactor", 0.00001,false) //to set LE-9-2 to Volt
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetXValues() As double()
		  
		  'Dim xs,xa() as string
		  'Dim xd() as Double
		  'xs = me.xValues.GetAllValues
		  'xa=Split(xs," ")
		  '
		  '
		  '
		  'for i as integer=0 to xa.Ubound
		  'xd.append(val(xa(i)) * me.xScalingFactor.GIAD)
		  'next
		  '
		  'return xd
		  '
		  
		  Dim xd() as Double
		  Dim FA as AttributeClass
		  Dim n, i as integer
		  
		  FA = me.xValues.GIA
		  if FA <> nil then
		    n = FA.GIAN
		    
		    for i=0 to n-1
		      xd.Append(FA.GIAD(i)*me.xScalingFactor.GIAD)
		    next
		  else
		    xd=array(0.0, 1.0)
		  end
		  return xd
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetYValues() As double()
		  'Dim ys,ya() as string
		  'Dim yd() as Double
		  'ys = me.yValues.GetAllValues1
		  'ya=Split(ys," ")
		  '
		  '
		  '
		  '
		  'for i as integer=0 to ya.Ubound
		  'yd.append(val(ya(i)) * me.yScalingFactor.GIAD)
		  'next
		  '
		  'return yd
		  
		  
		  Dim yd() as Double
		  Dim FA as AttributeClass
		  Dim n, i as integer
		  
		  FA = me.yValues.GIA
		  if FA <> nil then
		    n = FA.GIAN
		    
		    for i=0 to n-1
		      yd.Append(FA.GIAD(i)*me.yScalingFactor.GIAD)
		    next
		  else
		    yd=array(0.0, 1.0)
		  end
		  return yd
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		DataPointMarker As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DiscardLastPoint As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LineStyle As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PenWidth As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PointWidth As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		xScalingFactor As Double_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		xValues As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		yScalingFactor As Double_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		yValues As Double_AttributeClass = nil
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
