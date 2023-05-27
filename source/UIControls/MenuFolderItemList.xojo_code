#tag Class
Protected Class MenuFolderItemList
Inherits MenuItem
	#tag Event
		Sub EnableMenu()
		  BuildMenu
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddItem(Item As FolderItem)
		  if Item <> Nil then
		    for each ListItem As FolderItem in mMenuList
		      if ListItem <> Nil And ListItem.NativePath = Item.NativePath Then
		        Return
		      End
		    Next
		    mMenuList.Append(Item)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItems(items() As FolderItem)
		  For Each Item As FolderItem in items
		    AddItem(Item)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildMenu()
		  While Me.Count > 0
		    Me.Remove(0)
		  Wend
		  if mMenuList.Ubound >= 0 then
		    for Each Item As FolderItem in mMenuList
		      If Item = Nil then
		        Continue
		      End
		      Item.ExtensionVisible = False
		      Dim ListItem As new MenuItem(Item.DisplayName, Item.NativePath)
		      ListItem.Text = Item.DisplayName
		      ListItem.Enabled = True
		      Me.Append(ListItem)
		      AddHandler ListItem.Action, AddressOf itemAction
		    Next
		    if mEnableClearMenu = true then
		      Me.Append(new MenuItem(MenuItem.TextSeparator))
		      Dim ClearMenu As new MenuItem("Clear Menu", "clearmenu")
		      AddHandler ClearMenu.Action, AddressOf itemAction
		      Me.Append(ClearMenu)
		    end
		    me.Enabled = True
		  Else
		    me.Enabled = false
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearList()
		  ReDim mMenuList(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function itemAction(Item As MenuItem) As Boolean
		  if Item <> Nil And Item.Tag <> Nil Then
		    if Item.Tag.StringValue = "clearmenu" then
		      ClearList
		    Else
		      ItemTriggered(Item)
		    End
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Untitled()
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ItemTriggered(Item As MenuItem)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEnableClearMenu
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEnableClearMenu = value
			  BuildMenu
			End Set
		#tag EndSetter
		EnableClearMenu As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mEnableClearMenu As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMenuList(-1) As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastRowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasCheckMark"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Shortcut"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableClearMenu"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
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
		#tag ViewProperty
			Name="Visible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
