#tag Window
Begin ContainerControl HMI_EEPROM_Canvas Implements HMICanvasInterface
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cE7E7FF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   True
   Height          =   410
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   744
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
      Height          =   411
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
      Width           =   744
   End
   Begin Listbox EPTab
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   17
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   2
      GridLinesVerticalStyle=   3
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   382
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "P	0	1	2	3	4	5	6	7	8	9	a	b	c	d	e	f"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   True
      RowSelectionType=   1
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   744
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label ConnectionLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   412
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Connection"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   326
   End
   Begin Label TitleLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Title"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   305
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  if mEEPROM <> Nil Then
		    mEEPROM.Paint(g, 1)
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CanvasRect() As REALbasic.Rect
		  // Part of the HMICanvasInterface interface.
		  Return Bounds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RedrawEEPROM(CompleteRedraw as Boolean)
		  // refill the table
		  
		  If (mEEPROM <> Nil) and (mEEPROM.EEPROM<>nil) Then
		    Dim vEP as EEPROM_Class = mEEPROM.EEPROM
		    // EEPROM has been selected, set it as Standard EEPROM
		    Dim n As Integer = 0
		    Dim row, column as Integer = 0
		    EPTab.DeleteAllRows
		    
		    TitleLabel.Text=mEEPROM.Name.GIAS
		    ConnectionLabel.Text=mEEPROM.GetConnection
		    
		    For n = 0 to vEP.Size-1
		      Row = n / 16
		      Column = (n mod 16) + 1
		      while  Row >= EPTab.ListCount
		        EPTab.AddRow
		      wend
		      EPTab.Cell(Row, 0) = Hex(Row * 16)
		      EPTab.CellBold(Row, 0) = False
		      EPTab.CellTag(Row, 0) = vEP.EP(n).Format
		      
		      For k As Integer = 0 To 15
		        if vEP.EP(n).Format>0 then
		          EPTab.CellBold(Row, Column) = true
		        else
		          EPTab.CellBold(Row, Column) = False
		        end
		        EPTab.Cell(Row, Column) = vEP.GetFormatedContent(n)
		      next
		    Next
		  Else
		    // no EEPROM has been selected
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetUI()
		  // Part of the HMICanvasInterface interface.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCoordinates(X as integer, Offset as integer, Y as integer, W as integer, H as integer)
		  // Part of the HMICanvasInterface interface.
		  Me.Left = X - HMI_StepClass.cCanvasMargin
		  Me.Top = Y - HMI_StepClass.cCanvasMargin
		  
		  Me.Width = W + Offset + 2 * HMI_StepClass.cCanvasMargin
		  Me.Height= H + 2 * HMI_StepClass.cCanvasMargin
		  
		  EPTab.Left = HMI_StepClass.cCanvasMargin
		  EPTab.Top = HMI_StepClass.cCanvasMargin+20
		  EPTab.Width = W
		  EPTab.Height = H-20
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
		  mEEPROM = EEPROM_Module.HMI_EEPROM_StepClass(HMIClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, SetValue as string)
		  // virtual method, has to be overridden if implemented in the class
		  
		  Select case PropertyName
		  case is = "Com"
		    Dim n as integer = val(SetValue)
		    Dim Row as integer = n/16
		    Dim Column as integer = n mod 16 + 1
		    if Row<EPTab.ListCount then
		      EPTab.CellItalic(Row,Column)=true
		      If (mEEPROM <> Nil) and (mEEPROM.EEPROM<>nil) Then
		        EPTab.Cell(Row, Column) = mEEPROM.EEPROM.GetFormatedContent(n)
		        EPTab.InvalidateCell(Row, Column) 
		      end
		    end
		  end
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
		  if mode = 0 or mode = 1 Then
		    RedrawEEPROM(True)
		  ElseIf mode = 2 Then
		    RedrawEEPROM(False)
		  End
		  Refresh(false)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ChangedColor As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EEPROMHighMark As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EEPROMLowMark As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EEPROMView As string = "HEX"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEEPROM As EEPROM_Module.HMI_EEPROM_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SegmSelect As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Size As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events Resizer
	#tag Event
		Sub Resize(X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  if mEEPROM <> Nil Then
		    mEEPROM.Resize_HMI_Element(X, Y, Width, Height)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EPTab
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If (Row < EPTab.ListCount) And (Column < EPTab.ColumnCount) Then
		    If (mEEPROM <> Nil) and (mEEPROM.EEPROM<>nil) Then
		      Dim vEP as EEPROM_Class = mEEPROM.EEPROM
		      Dim n as integer = 16*row + (column-1)
		      if column=0 then
		        g.foreColor = &cFFFFFF
		      else
		        If Me.CellItalic(Row,Column) Then
		          g.foreColor = &cA0FFA0
		        else
		          if (n>-1) and (n<vEP.Size-1) then
		            g.foreColor = vEP.EP(n).Col
		          else
		            g.foreColor = &cFFFFFF
		          end
		        end
		      end
		    end
		    g.FillRect(0, 0, g.width, g.height)
		    Return True
		  Else
		    Return False
		  End
		End Function
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
