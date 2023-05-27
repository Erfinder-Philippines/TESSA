#tag Class
Protected Class TESSA_Program
Inherits Resource_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.Program_Name=Me.IAS("Program_Name","",false)
		  Me.Program_Name_with_Version=Me.IAS("Program_Name_with_Version","",false)
		  Me.Program_Version=Me.IAI("Program_Version",1,false)
		  Me.Folder=Me.IAS("Folder","",false)
		  Me.Autoload=Me.IAB("Autoload",false,false)
		  Me.Autostart=Me.IAB("Autostart",false,false)
		  Me.Versioning=Me.IAB("Versioning",false,false)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Resource()
		  // init element after startup,
		  
		  //if versioning is set then find the correct name
		  Dim S,VS as string
		  Dim i as integer
		  S=Me.Program_Name.GIAS
		  //remove file extention
		  i=S.Instr(1,".xml")
		  if i>0 then
		    S=S.Mid(1,i-1)
		  end
		  //find and remove version number at end of file name
		  i=S.Len
		  while (asc(S.Mid(i,1))>47) and (asc(S.Mid(i,1))<58)
		    i=i-1
		  wend
		  i=i+1
		  if i>S.Len then
		    //there was no predefined version, set it to 1
		    VS="1"
		  else
		    //take predefined version and
		    VS=S.Mid(i,S.Len-i+1)
		    S=S.Mid(1,i-1)
		  end
		  Me.Program_Version.SIAI(val(VS))
		  
		  Dim f1, f2 As FolderItem
		  Dim NameAlreadyUsed as boolean
		  //see if there are newer versions of the definied file
		  
		  if Me.Versioning.GIAB then
		    i=Me.Program_Version.GIAI
		    NameAlreadyUsed=true
		    f1= GetWorkingFolderItem //file type defined in File Type Sets Editor
		    if f1<>nil then
		      f1=f1.Child(Me.Folder.GIAS)
		      if f1<>nil then
		        if f1.exists then
		          while NameAlreadyUsed
		            f2=f1.Child(S+str(i)+".xml")
		            if f2.exists then
		              NameAlreadyUsed=true
		              i=i+1
		            else
		              NameAlreadyUsed=false
		              i=i-1
		            end
		            
		          wend
		          Me.Program_Version.SIAI(i)
		        end
		      end
		    end
		    Me.Program_Name_with_Version.SIAS(S+Me.Program_Version.GIAS+".xml")
		  else
		    Me.Program_Name_with_Version.SIAS(S+".xml")
		  end
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Autoload As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Autostart As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Folder As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Program_Name As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Program_Name_with_Version As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Program_Version As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Versioning As Boolean_AttributeClass = nil
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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
