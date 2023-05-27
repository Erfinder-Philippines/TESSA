#tag Class
Protected Class Restfull_Resource
Inherits ResourceClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  '
		  'Select case ChangedAttribute
		  'case Is =State
		  '
		  '
		  'end
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  IP=IAS("IP","192.168.0.189",false)
		  Path=IAS("Path","/rpc/DiffPreasSensor.Read",false)
		  Command=IAS("Command","{""slave"":2,""operation"":3}",false)
		  Reply=IAS("Reply","",false)
		  
		  AddUserFunction("Send", Command.Name, "Send", 0,UF_RunMode_Direct)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReply() As string
		  return Reply.GIAS
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  // Virtual methode at least one has to be overriden
		  
		  return ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewDataAvailable() As boolean
		  return mNewData
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send(CommandString as string, PathString as string)
		  
		  Reply.SIAS("")
		  Command.SIAS(CommandString)
		  Path.SIAS(PathString)
		  SendRPC()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendRPC()
		  
		  Dim sendMethod As Text = "POST"
		  
		  Dim requestContent As text = Command.GIAS.ToText
		  SetNewData(false)
		  If not(requestContent.empty) Then
		    Dim data As Xojo.Core.MemoryBlock
		    data = Xojo.Core.TextEncoding.UTF8.ConvertTextToData(requestContent) 
		    Dim URLField as string = "http://"+IP.GIAS+Path.GIAS
		    MainWindow.SendPOST(self, sendMethod, URLField.ToText, data, "application/x-www-form-urlencoded")
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNewData(State as boolean)
		  mNewData = State
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  Select case FuncName
		  Case is = "Send"
		    SendRPC()
		  case is ="Delete case"
		    
		    
		  case is="Add Else"
		    
		  end
		  
		  MainWindow.HTL.UpdateTree
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Command As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		IP As string_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNewData As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Path As string_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Reply As String_AttributeClass
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="TimeOutValue"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
