#tag Class
Protected Class SYNC_Folder
Inherits SyncBasicItem
	#tag Method, Flags = &h0
		Sub ClearCurrentValues()
		  FilesCount.SIAI(0)
		  FoldersCount.SIAI(0)
		  CurrentFile.SIAS("")
		  CurrentFolder.SIAS("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From BasicTransferClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  LocalItem = IAPath("LocalFolder", "", false, True)
		  LocalItem.ReadOnly = false
		  RemoteItem = IAPath("RemoteFolder", "", false, True)
		  IncludeSubFolder = IAB("IncludeSubFolder", True, False)
		  
		  FilesCount = IAI("FilesCount", 0, False, AttributeGroups.System)
		  FoldersCount = IAI("FoldersCount", 0, False, AttributeGroups.System)
		  CurrentFile = IAS("CurrentFile", "", False, AttributeGroups.System)
		  CurrentFolder = IAS("CurrentFolder", "", False, AttributeGroups.System)
		  CurrentProgress = IAD("CurrentProgress", 0.0, False, AttributeGroups.System)
		  
		  FilesCount.ReadOnly = True
		  FoldersCount.ReadOnly = True
		  CurrentFile.ReadOnly = True
		  CurrentFolder.ReadOnly = True
		  CurrentProgress.ReadOnly = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IncrementFiles(inc As Integer)
		  If inc > 0 Then
		    FilesCount.SIAI(FilesCount.GIAI + inc)
		    if mParentLocation <> Nil then
		      mParentLocation.IncrementFiles(inc)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IncrementFolders(inc As Integer)
		  If inc > 0 Then
		    FoldersCount.SIAI(FoldersCount.GIAI + inc)
		    if mParentLocation <> Nil Then
		      mParentLocation.IncrementFolders(inc)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitSYNCItem(location As SYNC_Location)
		  mParentLocation = location
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCurrentFile(Path As String)
		  CurrentFile.SIAS(Path)
		  if mParentLocation <> Nil Then
		    mParentLocation.SetCurrentFile(Path)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCurrentFolder(Path As String)
		  CurrentFolder.SIAS(Path)
		  if mParentLocation <> Nil Then
		    mParentLocation.SetCurrentFolder(Path)
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentFile As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentFolder As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentProgress As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FilesCount As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FoldersCount As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		IncludeSubFolder As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mParentLocation As SYNC_Location = nil
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
	#tag EndViewBehavior
End Class
#tag EndClass
