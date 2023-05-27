#tag Class
Protected Class Network_ResourceClass
Inherits Resource_StepClass
	#tag Method, Flags = &h0
		Sub Connect()
		  Dim i as integer
		  Dim net as NetworkInterface
		  Dim S as string = ""
		  
		  for i=0 to System.NetworkInterfaceCount-1
		    net=System.GetNetworkInterface(i)
		    if net<>nil then
		      AddRemarkToComLogCR("Try net "+str(i)+":  "+net.IPAddress)
		      if net.IPAddress=Me.IP_Address.GIAS then
		        connected.SIAB(true)
		        NetworkCardID.SIAI(i)
		        MAC_Address.SIAS(net.MACAddress)
		        SubnetMask.SIAS(net.SubnetMask)
		      end
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  
		  Super.Constructor(ConfigText)
		  
		  
		  Me.NetworkCardID=Me.IAI("NetworkCardID",0,false)
		  Me.IP_Address=Me.IAS("IP_Address","0.0.0.0",false)
		  Me.Mac_Address=Me.IAS("Mac_Address","",false)
		  Me.SubnetMask=Me.IAS("Subnet_Mask","",false)
		  
		  Me.RemoteServer=Me.IAB("RemoteServer",false,false)
		  Me.RemotePort=Me.IAI("RemotePort",0,false)
		  Me.RemoteConnections=Me.IAI("RemoteConnections",0,false)
		  
		  AddUserFunction("Connect", Connected.Name, "Connect", 0,UF_RunMode_Direct)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  // connect to ethernet
		  if ImmediateConnection.GIAB then
		    Me.Connect
		    if connected.GIAB then
		      return IP_Address.GIAS+" ok"
		    else
		      return IP_Address.GIAS+" no connection"
		    end
		  else
		    return IP_Address.GIAS+" not yet connected"
		  end
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  case is = "Connect"
		    Connect
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		IP_Address As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MAC_Address As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NetworkCardID As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RemoteConnectionList() As ClientSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		RemoteConnections As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RemotePort As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RemoteServer As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SubnetMask As String_AttributeClass = nil
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
			InitialValue=""
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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
