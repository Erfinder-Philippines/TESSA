#tag Class
Protected Class Manual_OP_Loop
Inherits Thread
	#tag Event
		Sub Run()
		  Dim NotForever as boolean = true
		  Dim NoReply as integer = 1
		  Dim RS,CS as string = ""
		  
		  while NotForever
		    Dim LoopCount as integer = 0
		    Select Case OM_State
		    case om_Waiting
		    case om_ResourceCall
		      if (OM_Attribute=nil) or (OM_Resource=nil) then
		        //MsgBox("Manual Loop cannot be started, as OM_Attribute or OM_Resource are not definied")
		      else
		        if OM_Resource IsA ResourceFunctionClass then
		          Dim tr as double = OM_Resource.GetTimeouttime
		          Dim TimeOutStartTime as double = GetActTime_msec
		          
		          // wait for reply or timeout
		          While  (NoReply < 2)
		            While  (NoReply = 0)
		              NoReply = OM_Resource.Poll(RS,nil)
		              if (GetActTime_msec > (tr + TimeOutStartTime)) then
		                NoReply = 3
		                'tr = GetActTime_msec - TimeOutStartTime
		              end
		              if LoopCount > 1000000 then
		                NoReply = 3
		                'tr = GetActTime_msec-TimeOutStartTime
		              end
		              LoopCount = LoopCount + 1
		              sleep 100
		            wend
		            if NoReply > 0 then
		              LoopCount = 0
		            end
		            if NoReply = 1 then
		              if  OM_Resource.Run(CS,nil) then
		                NoReply=0
		              end
		            else
		              NoReply = 3
		            end
		            
		          wend
		        end
		        // update main window
		        if NoReply = 3 then
		          // an error has occured and needs to be shown!
		          Call mUICaller.PushMethod (AddressOf MainWindow.AttrEditor.SaveEditor, "SaveEditor", true)
		        Else
		          If Me.UpdateAttributeEditor then
		            Call mUICaller.PushMethod (AddressOf MainWindow.AttrEditor.SaveResourceValue, "SaveResourceValue", ResourceFunctionClass(OM_Resource).Value.GIAS)
		          end
		        end
		      end
		    case om_UserFunction
		      if (OM_UFC<>nil) and (OM_UFC.CallingElement<>nil)  then
		        Dim OCE as BasicClass = OM_UFC.CallingElement
		        CS=OM_UFC.FunctionName
		        
		        Call mUICaller.PushMethod (AddressOf MainWindow.SetMouseCursor, "SetMouseCursor", "wait")
		        
		        Dim tr as double =UserFunctions (OCE).GetTimeouttime
		        Dim TimeOutStartTime as double = GetActTime_msec
		        
		        // wait for reply or timeout
		        
		        While  (NoReply < 2)
		          While  (NoReply = 0)
		            NoReply = UserFunctions (OCE).Poll(RS,OM_UFC.Attribute)
		            if NoReply=2 then
		            else
		              if (GetActTime_msec > (tr + TimeOutStartTime)) then
		                NoReply = 3
		                'tr = GetActTime_msec - TimeOutStartTime
		              end
		              if LoopCount > 1000000 then
		                NoReply = 3
		                'tr = GetActTime_msec-TimeOutStartTime
		              end
		              LoopCount = LoopCount + 1
		              sleep 100
		            end
		          wend
		          if NoReply > 0 then
		            LoopCount = 0
		          end
		          if NoReply = 1 then
		            if  UserFunctions(OCE).Run(CS,OM_UFC.Attribute) then
		              if OM_UFC.Polling then
		                NoReply=0
		                sleep 100
		              else
		                NoReply = 2
		              end
		            else
		              NoReply = 3
		            end
		          end
		        wend
		        // update main window
		        'if NoReply =3 then
		        '// an error has occured and needs to be shown!
		        'mUICaller.PushMethod (AddressOf MainWindow.AttrEditor.SaveEditor, "SaveEditor", true)
		        'ElseIf Me.UpdateAttributeEditor then
		        'mUICaller.PushMethod (AddressOf MainWindow.AttrEditor.SaveResourceValue, "SaveResourceValue", ResourceFunctionClass(OM_Resource).Value.GIAS)
		        'end
		      else
		        MsgBox("Manual Loop cannot be started, as OM_UFC is not definied")
		      end
		      
		    end
		    
		    Call mUICaller.PushMethod (AddressOf MainWindow.SetMouseCursor, "SetMouseCursor", "-normal")
		    
		    OM_State=om_Waiting
		    OM_Attribute = nil
		    OM_UFC = nil
		    Me.UpdateAttributeEditor = false
		    NoReply=1
		    Me.Suspend
		  wend
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  mUICaller = new Caller
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartOP(OPA as AttributeClass, UpdateAttrEditor as boolean)
		  if (OPA isA Resource_AttributeClass) or (OPA.MyStep IsA ResourceClass) then
		    Select case Me.State
		    case 0 //running
		      MsgBox("Manual Loop is still in use")
		    case 1 // waiting
		      MsgBox("Manual Loop is still in use")
		    case 2,3 // suspended or sleeping
		      Me.UpdateAttributeEditor=UpdateAttrEditor
		      OM_Attribute=OPA
		      OM_Resource=ResourceClass(OPA.MyStep)
		      OM_UFC=nil
		      OM_State=om_ResourceCall
		      Me.Resume
		    case 4 // sleeping
		      Me.UpdateAttributeEditor=UpdateAttrEditor
		      OM_Attribute=OPA
		      OM_Resource=ResourceClass(OPA.MyStep)
		      OM_UFC=nil
		      OM_State=om_ResourceCall
		      Me.Run
		    end
		  else
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartOP(UFC as UserFunction)
		  if UFC<>nil then
		    Select case Me.State
		    case 0 //running
		      MsgBox("Manual Loop is still in use")
		    case 1 // waiting
		      MsgBox("Manual Loop is still in use")
		    case 2,3 // suspended or sleeping
		      Me.UpdateAttributeEditor=true
		      OM_Attribute=UFC.Attribute
		      OM_Resource=nil
		      OM_UFC=UFC
		      OM_State=om_UserFunction
		      Me.Resume
		    case 4 // not running
		      Me.UpdateAttributeEditor=true
		      OM_Attribute=UFC.Attribute
		      OM_Resource=nil
		      OM_UFC=UFC
		      OM_State=om_UserFunction
		      Me.Run
		    end
		  else
		    
		  end
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mUICaller As Caller = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OM_Attribute As AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OM_Resource As ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OM_State As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		OM_UFC As UserFunction
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UpdateAttributeEditor As boolean = false
	#tag EndProperty


	#tag Constant, Name = om_ResourceCall, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = om_UserFunction, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = om_Waiting, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
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
	#tag EndViewBehavior
End Class
#tag EndClass
