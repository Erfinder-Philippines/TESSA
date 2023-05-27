#tag Class
Protected Class DynamicLibrary_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  Super.AttributeChanged(ChangedAttribute)
		  
		  If ChangedAttribute = Nil Then
		    Return
		  End If
		  
		  If ChangedAttribute Is Source Then
		    Step_Init
		  End If
		  
		  MainWindow.RedrawAttributeList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as String) -- From StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  Source = IAPath("Source", "", False, False)
		  Source.SIAS(GetAppFolder)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFunctionList() As String()
		  Dim lines() As String
		  If mDll <> Nil Then
		    lines  = mDll.SymbolNames
		  Else
		    // "Library does not exist or does not contain function"
		  End If
		  Return lines
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub initLibrary()
		  If SetFilePath(Source.GIAS) Then
		    mDll = New DeclareLibraryMBS(mFilePath)
		    Loaded = True
		    Return
		  End If
		  
		  Loaded = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibraryInstance() As DeclareLibraryMBS
		  Return mDll
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetFilePath(path as FolderItem) As Boolean
		  If path <> Nil Then
		    If path.Exists Then
		      // More checks here if it's a DLL/Dylib
		      
		      Dim strPath As String = path.NativePath
		      
		      If strPath.Mid(strPath.Len-2,3)="dll" Then
		        mFilePath = path
		        Return True
		      End If
		      
		    End If
		    
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetFilePath(path as String) As Boolean
		  If Not path.IsEmpty Then
		    
		    // More checks here if it's a DLL/Dylib
		    If path.Mid(path.Length-2,3)="dll" Then
		      mFilePath = New FolderItem(path, FolderItem.PathModes.Native)
		      Return True
		    End If
		    
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  initLibrary
		  Super.Step_Init
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  initLibrary
		  Super.Step_Init_AfterLoad
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  initLibrary
		  
		  Return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Loaded As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDll As DeclareLibraryMBS = Nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFilePath As FolderItem = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Source As Path_AttributeClass = nil
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
			Name="Untitled"
			Visible=false
			Group="Behavior"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
			Name="Loaded"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
