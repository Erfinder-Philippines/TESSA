#tag Class
Protected Class BasicClassFactory
	#tag Method, Flags = &h0
		Sub AddNewElement(Name As String, ConstructorItem As ElementConstructorItem)
		  if ConstructorItem <> Nil Then
		    mDictionary.Value(Name) = ConstructorItem
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddNewElement(Name As String, ClassInfo As Introspection.TypeInfo, vStepName As String, vRunMode As Integer)
		  if ClassInfo <> Nil Then
		    Dim ci() As Introspection.ConstructorInfo = ClassInfo.GetConstructors
		    Dim Count As Integer = UBound(ci)
		    If Count >= 0 Then
		      Dim NewConctructorInfo As new ElementConstructorItem(ci(Count), vStepName, vRunMode)
		      mDictionary.Value(Name) = NewConctructorInfo
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  //need fill mDictionary
		  
		  mDictionary = new Dictionary
		  
		  CommonResources.AddElements(self)
		  TabManager.AddElements(self)
		  
		  #If Include_Standard
		    CommonResources.AddElements(self)
		    BasicClassModule.AddElements(self)
		    DynamicLibraryModule.AddElements(self)
		    SettingModule.AddElements(self)
		    ProgrammSequence.AddElements(self)
		    MathModule.AddElements(self)
		    ReportModule.AddElements(self)
		    HMI_Module.AddElements(Self)
		    SpecialModule.AddElements(self)
		    Special_TestsModule.AddElements(Self)
		    Functional_Testsystems.AddElements(self)
		    Arrays_Tables.AddElements(Self)
		    
		    SYNCModule.AddElements(Self)
		    HLKModule.AddElements(Self)
		    TESSA_DataBase.AddElements(Self)
		  #Endif
		  
		  #If Include_Camera
		    CameraModule.AddElements(self)
		  #EndIf
		  
		  #If Include_EEPROM
		    EEPROM_Module.AddElements(Self)
		  #EndIf
		  
		  #If Include_PIIOX 
		    PIIOX.AddElements(self)
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getInstance() As BasicClassFactory
		  If mInstance Is Nil Then
		    mInstance = new BasicClassFactory
		  End
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseElement(SearchText As String) As BasicClass
		  Dim startP, endP As Integer
		  Dim type_name As String
		  
		  Dim ExistElement as Boolean = False
		  if (len(SearchText) >= 3) Then
		    // get name from "<" to next space
		    startP = InStr(1,searchtext,"<") + 1
		    If startP > 0 Then
		      endP = InStr(startP,searchtext," ") - 1
		      If endP >= 1 Then
		        type_name=Mid(searchtext,startP,endP - startP + 1)
		        ExistElement = True
		      End
		    end
		  end
		  
		  Dim NewMeasStep As BasicClass = Nil
		  If ExistElement Then
		    Dim ClassInfo As ElementConstructorItem = mDictionary.Lookup(type_name, Nil)
		    If ClassInfo > Nil And ClassInfo.GetConstructorInfo <> Nil Then
		      Dim BF As String = GetAppFolder
		      Dim param() As Variant
		      param.Append(BF)
		      NewMeasStep = ClassInfo.GetConstructorInfo.Invoke(param)
		      If NewMeasStep <> Nil Then
		        NewMeasStep = SNMS(NewMeasStep, ClassInfo.GetStepName, ClassInfo.GetRunMode, SearchText)
		        NewMeasStep.LoadBasicAttributeDesc
		      End
		    End
		  else
		    //AddDebugTextCR("No element:"+chr(13)+searchtext)
		  end
		  return NewMeasStep
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDictionary As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mInstance As BasicClassFactory = Nil
	#tag EndProperty


	#tag Constant, Name = Include_Camera, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Include_EEPROM, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Include_PIIOX, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Include_RotaZone, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Include_Standard, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant


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
