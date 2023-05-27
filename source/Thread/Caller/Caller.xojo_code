#tag Class
Protected Class Caller
	#tag Method, Flags = &h0
		Sub ClearAllCallings()
		  dim lock as new TemporaryLock (mLock) // this ensures that we unlock if our thread gets killed
		  
		  mTimer.Mode = Timer.ModeOff
		  ReDim mCallMethods(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mLock = New CriticalSection
		  mTimer = New Timer
		  mTimer.Period = 0
		  mTimer.Mode = Timer.ModeOff
		  AddHandler mTimer.Action, WeakAddressOf InternalDispatchMethods
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalDispatchMethods(sender as Timer)
		  #Pragma Unused sender
		  
		  // make a copy of the array that we process next
		  dim lock as new TemporaryLock (mLock)
		  dim emptyMethods() as CallMethod
		  dim methods() as CallMethod = mCallMethods
		  mCallMethods = emptyMethods
		  lock = nil
		  
		  While True
		    Dim currentMethod As CallMethod
		    
		    lock = new TemporaryLock (mLock) // this ensures that we unlock if our thread gets killed
		    
		    If methods.UBound >= 0 Then
		      currentMethod = methods(0)
		      methods.Remove(0)
		    Else
		      mTimer.Mode = Timer.ModeOff
		      Return
		    End If
		    
		    lock = nil
		    
		    InvokeMethod(currentMethod)
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalPushMethod(method As CallMethod)
		  dim lock as new TemporaryLock (mLock) // this ensures that we unlock if our thread gets killed
		  
		  if mCallMethods.Ubound > 20 then
		    // we seem to be overcrowding our queue
		    break
		  end if
		  
		  //  remove all previous calls with the same id so that we have only one of each in the queue
		  for i as Integer = mCallMethods.Ubound downTo 0
		    dim cm as CallMethod = mCallMethods(i)
		    if cm.id = method.id then
		      // remove this duplicate
		      mCallMethods.Remove i
		    end if
		  next
		  
		  mCallMethods.Append(method)
		  
		  If mTimer.Mode <> Timer.ModeSingle Then
		    mTimer.Mode = Timer.ModeSingle
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InvokeMethod(method As CallMethod)
		  If method <> Nil Then
		    dim args() as Variant = method.args
		    dim callback As Object = method.callback
		    // callback is a delegate
		    if callback isA Caller.Proc then
		      Caller.Proc(callback).Invoke ()
		    elseif callback isA Caller.Proc_AttributeClass then
		      Caller.Proc_AttributeClass(callback).Invoke (args(0))
		    elseif callback isA Caller.Proc_Boolean then
		      Caller.Proc_Boolean(callback).Invoke (args(0))
		    elseif callback isA Caller.Proc_Boolean_Integer then
		      Caller.Proc_Boolean_Integer(callback).Invoke (args(0), args(1))
		    elseif callback isA Caller.Proc_Integer then
		      Caller.Proc_Integer(callback).Invoke (args(0))
		    elseif callback isA Caller.Proc_StepClass_Double then
		      Caller.Proc_StepClass_Double(callback).Invoke (args(0), args(1))
		    elseif callback isA Caller.Proc_String then
		      Caller.Proc_String(callback).Invoke (args(0))
		    elseif callback isA Caller.Proc_String_String then
		      Caller.Proc_String_String(callback).Invoke (args(0), args(1))
		    elseif callback isA Caller.Proc_Test_StepClass then
		      Caller.Proc_Test_StepClass(callback).Invoke (args(0))
		    elseif callback isA Caller.Proc_BasicClass then
		      Caller.Proc_BasicClass(callback).Invoke (args(0))
		    else
		      // oops - we are missing a case for this type of delegate
		      break
		    end if
		  End If
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc()
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc_AttributeClass(att as AttributeClass)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc_BasicClass(LS as BasicClass)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc_Boolean(b as Boolean)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc_Boolean_Integer(b as Boolean, i as Integer)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc_Integer(i as Integer)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc_StepClass_Double(SC As StepClass, ActTime As Double)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc_String(s as String)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc_String_String(s as String, s2 as String)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub Proc_Test_StepClass(NewPage as Test_StepClass)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub PushMethod(callback As Object, methodName As String, ParamArray params As Variant)
		  PushMethodWithArrayAsParams (callback, methodName, params)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PushMethodWithArrayAsParams(callback As Object, methodName As String, params() As Variant)
		  If App <> Nil Then
		    dim m as new CallMethod (callback, methodName, params)
		    if App.CurrentThread = Nil Then
		      // call this method without delay
		      InvokeMethod (m)
		    else
		      // add to queue for later processing in main thread
		      InternalPushMethod (m)
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCallMethods() As CallMethod
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLock As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Timer = nil
	#tag EndProperty


	#tag Enum, Name = Errors, Type = Integer, Flags = &h0
		NoError = 0
		  ObjectIsNil
		  MethodNotFound
		  WrongParamsCount
		IntrospectionError
	#tag EndEnum


	#tag ViewBehavior
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
