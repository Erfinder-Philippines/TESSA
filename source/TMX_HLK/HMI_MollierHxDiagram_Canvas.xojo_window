#tag Window
Begin ContainerControl HMI_MollierHxDiagram_Canvas Implements HMICanvasInterface
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   False
   HasBackgroundColor=   False
   Height          =   251
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   32
   Transparent     =   True
   Visible         =   True
   Width           =   342
   Begin ResizeContainer Resizer
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      HasBackgroundColor=   False
      Height          =   251
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   342
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  'Dim c as CDXYChartMBS = mHxDiagramStep.GetGraphChart
		  'If mHxDiagramStep <> Nil and c <> Nil Then
		  'g.DrawPicture (c.makeChartPicture, 0, 0)
		  'End
		  
		  If mHxDiagramStep <> Nil Then
		    mHxDiagramStep.Paint(g, 0)
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
		  #Pragma Unused Offset
		  Left = X
		  Top = Y
		  Me.Width = W + Offset
		  Me.Height = H
		  
		  if TargetWin32 Then
		    Me.Refresh
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditMode(type As Boolean)
		  Resizer.SetEditMode(type)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHMIClass(HMIClass As HMI_StepClass)
		  // Part of the HMICanvasInterface interface.
		  mHxDiagramStep = Mollier_HxDiagram_StepClass(HMIClass)
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
		  #Pragma Unused mode
		  // transfer values from Values Attribute to Histogram
		  'Dim values(-1) as double
		  'Dim i as integer
		  'Dim e as integer = mHistogramStep.Values.GIAN
		  'for i = 0 to e
		  'values.Append(mHistogramStep.Values.GIAD(i))
		  'next
		  'Histo.SetHistogramm(values, mHistogramStep.Num_Steps.GIAI, mHistogramStep.Title.GIAS, mHistogramStep.Subtitle.GIAS, 0)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mHxDiagramStep As Mollier_HxDiagram_StepClass = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events Resizer
	#tag Event
		Sub Resize(X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  If mHxDiagramStep <> Nil Then
		    mHxDiagramStep.Resize_HMI_Element(X, Y, Width, Height)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
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
