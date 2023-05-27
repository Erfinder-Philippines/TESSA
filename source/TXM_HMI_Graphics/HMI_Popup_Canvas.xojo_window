#tag Window
Begin ContainerControl HMI_Popup_Canvas Implements HMICanvasInterface
   AllowAutoDeactivate=   True
   AllowFocus      =   True
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   28
   InitialParent   =   ""
   Left            =   31
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   29
   Transparent     =   True
   Visible         =   True
   Width           =   200
   Begin TouchScreenPopupMenu HMI_Popup
      AllowAutoDeactivate=   True
      Bold            =   False
      CurrentItemIndex=   0
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "1\r2\r3\r"
      Italic          =   False
      Left            =   2
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      mCurrentItemIndex=   -1
      OldItemIndex    =   0
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   2
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   191
   End
   Begin ResizeContainer Resizer
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackgroundColor=   False
      Height          =   28
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   200
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  if mPopupStep <> Nil then
		    mPopupStep.Paint(g, 1)
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CanvasRect() As REALbasic.Rect
		  // Part of the HMICanvasInterface interface.
		  Return Me.Bounds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetUI()
		  // Part of the HMICanvasInterface interface.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCoordinates(X as integer, Offset as integer, Y as integer, W as integer, H as integer)
		  // Part of the HMICanvasInterface interface.
		  // the new position is relative to the first (0,0) position
		  Me.Left = X - HMI_StepClass.cCanvasMargin
		  Me.Top = Y - HMI_StepClass.cCanvasMargin
		  
		  Me.Width = W + Offset + 2 * HMI_StepClass.cCanvasMargin
		  Me.Height= H + 2 * HMI_StepClass.cCanvasMargin
		  
		  HMI_Popup.Left = Offset
		  HMI_Popup.Top = HMI_StepClass.cCanvasMargin
		  HMI_Popup.Height = H
		  HMI_Popup.Width = W
		  if TargetWin32 Then
		    Me.Refresh
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditMode(type As Boolean)
		  // Part of the HMICanvasInterface interface.
		  Resizer.SetEditMode(type)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHMIClass(HMIClass As HMI_StepClass)
		  // Part of the HMICanvasInterface interface.
		  mPopupStep = HMI_Popup_StepClass(HMIClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, SetValue as string)
		  // virtual method, has to be overridden if implemented in the class
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisible(value As Boolean)
		  // Part of the HMICanvasInterface interface.
		  Me.Visible = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvas(mode As Integer)
		  // Part of the HMICanvasInterface interface.
		  If App.HMI_Active And mPopupStep <> Nil then
		    If mode  = 0 then // => init update
		      HMI_Popup.DeleteAllRows
		      Dim S, vS as string
		      //fill the popup menu with the values and set it to the right index
		      if mPopupStep.Control_Input.GIAS = "" then
		        vS = mPopupStep.Value.GIAS
		      else
		        vS = mPopupStep.Control_Input.GIAS
		      end
		      Dim n,i as integer
		      if mPopupStep.ValueType.GIAI = 0 then
		        // fill enum values into popup
		        for n=1 to mPopupStep.Value.GIEnumCount
		          S = mPopupStep.Value.GIAS(n-1)
		          HMI_Popup.AddRow(s)
		          if S = vS then
		            i = n - 1
		          end
		        next
		      else
		        if mPopupStep.Value.GetLinkAsAttributeClass<>nil then
		          mPopupStep.Value.IsArray=false
		        end
		        // fill string array values into popup
		        i = 0
		        Dim k As Integer = mPopupStep.Value.GIAN - 1
		        for n=0 to k
		          S = mPopupStep.Value.GIAS(n)
		          HMI_Popup.AddRow(S)
		          if S = vS and S <> "" then
		            i = n
		          end
		        next
		      end
		      if vS="" then
		        n = mPopupStep.Value.GIAA
		        HMI_Popup.ListIndex = n
		      else
		        HMI_Popup.ListIndex = i
		        LastControl_Input = vS
		      end
		    ElseIf mode = 1 Then                                   // update popup active value IF NOT NIL
		      //if mPopupStep.Control_Input.Link <> Nil then
		      Dim SetString as string = mPopupStep.Control_Input.GIAS
		      if SetString <> "" then
		        if SetString <> Me.LastControl_Input then
		          Dim S As String
		          Dim i As Integer
		          if mPopupStep.ValueType.GIAI = 0 then
		            // set the appropriate enum value
		            For n As Integer = 1 to mPopupStep.Value.GIEnumCount
		              S = mPopupStep.Value.GIAS(n - 1)
		              if S = SetString and S <> "" then
		                i = n - 1
		              end
		            next
		            mPopupStep.Value.SIAI(i)
		          Else
		            // set the appropriate active value
		            i = 0
		            for n As Integer = 0 to mPopupStep.Value.GIAN - 1
		              S = mPopupStep.Value.GIAS(n)
		              if S = SetString and S <> "" then
		                i = n
		              end
		            next
		            mPopupStep.Value.SIAA(i)
		          end
		          
		          HMI_Popup.ListIndex = i
		          LastControl_Input = SetString
		        end
		      else
		        Dim n as integer = mPopupStep.Value.GIAA
		        HMI_Popup.ListIndex = n
		      End
		    else
		    end
		    //End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private LastControl_Input As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPopupStep As HMI_Popup_StepClass = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events HMI_Popup
	#tag Event
		Sub ChangeItem()
		  if mPopupStep <> nil then
		    if mPopupStep.ValueType.GIAI = 0 Then
		      // set the appropriate enum value
		      mPopupStep.Value.SIAI(Me.ListIndex)
		    else
		      // set the appropriate active value
		      mPopupStep.Value.SIAA(Me.ListIndex)
		      if mPopupStep.TableSync.GIAB Then
		        //find the table
		        Dim LS as BasicClass = mPopupStep.Value.Get_Connected_Step
		        if LS IsA Table_StepClass Then
		          Table_StepClass(LS).SetTableRow(Me.ListIndex)
		        elseif LS IsA TableDimension_StepClass Then  // adjust the choice for multi dimensional tables
		          TableDimension_StepClass(LS).SetActiveLine(Me.ListIndex)
		        end
		      end
		    end
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Resizer
	#tag Event
		Sub Resize(X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  if mPopupStep <> Nil then
		    mPopupStep.Resize_HMI_Element(X, Y, Width, Height)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
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
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
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
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
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
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
