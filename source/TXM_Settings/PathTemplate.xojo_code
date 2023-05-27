#tag Class
Protected Class PathTemplate
Inherits BasicClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Template = IAS("Template", "", False)
		  PathValue = IAPath("Value", "", False, False)
		  PathValue.SetType(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContextMenuItems1() As MenuItem()
		  if IsSystem Then
		    Dim items(-1) As MenuItem
		    Return items
		  End
		  Return Super.GetContextMenuItems
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetPathTemplates(BC As BasicClass) As PathTemplate()
		  Dim result() As PathTemplate
		  
		  If BC <> Nil Then
		    If BC IsA PathTemplate Then
		      result.Append(PathTemplate(BC))
		    End
		    
		    BC = BC.FirstSubStep
		    While BC <> Nil
		      Dim PathTemplates() As PathTemplate = GetPathTemplates(BC)
		      For Each tmp As PathTemplate in PathTemplates
		        if tmp <> Nil And tmp.Template.GIAS <> "" then
		          result.Append(tmp)
		        End
		      Next
		      BC = BC.NextStep
		    Wend
		  End
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitAfterLoad()
		  If PathValue.OriginalValue.InStr(Template.GIAS) > 0 Then
		    PathValue.SIAS("")
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSystem() As Boolean
		  Return mSystem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSystem(system As Boolean)
		  mSystem = system
		  Name.ReadOnly = mSystem
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSystem As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		PathValue As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Template As String_AttributeClass = nil
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
