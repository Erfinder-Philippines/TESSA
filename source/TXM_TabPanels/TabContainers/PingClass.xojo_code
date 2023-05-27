#tag Class
Protected Class PingClass
Inherits DarwinPingMBS
	#tag Event
		Sub AddressResolved(ip as string)
		  l.AppendText( "Resolved address "+HostToPing+" = "+ip+chr(13))
		End Sub
	#tag EndEvent

	#tag Event
		Sub Finished(NumberPacketsSent as integer, NumberPacketsReceived as integer)
		  l.AppendText  "Finished sent: "+str(NumberPacketsSent)+", received: "+str(NumberPacketsReceived)+", "+Format(NumberPacketsReceived/NumberPacketsSent,"0%"+" "+chr(13))
		  if (NumberPacketsSent>0) and (NumberPacketsSent=NumberPacketsReceived) then
		    DL.AddRow(Me.HostToPing)
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub NextPing(PacketSequenceNumber as integer)
		  l.AppendText ( "Next ping "+str(PacketSequenceNumber)+chr(13))
		End Sub
	#tag EndEvent

	#tag Event
		Sub Response(PacketSequenceNumber as integer, ttl as integer, RoundTripTimeInMS as double)
		  l.AppendText ( "Response "+str(PacketSequenceNumber)+", ttl: "+str(ttl)+", time: "+str(RoundTripTimeInMS)+" ms"+chr(13))
		End Sub
	#tag EndEvent

	#tag Event
		Sub SentError(PacketSequenceNumber as integer)
		  l.AppendText(  "SentError "+str(PacketSequenceNumber)+chr(13))
		End Sub
	#tag EndEvent

	#tag Event
		Sub SentSuccess(PacketSequenceNumber as integer)
		  l.AppendText(  "SentSuccess "+str(PacketSequenceNumber)+chr(13))
		End Sub
	#tag EndEvent

	#tag Event
		Sub Timeout(PacketSequenceNumber as integer)
		  l.AppendText ( "Timeout "+str(PacketSequenceNumber)+chr(13))
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(vL as TextArea, vDL as ListBox)
		  
		  l=vL
		  DL=vDL
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DL As ListBox
	#tag EndProperty

	#tag Property, Flags = &h0
		l As TextArea
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
