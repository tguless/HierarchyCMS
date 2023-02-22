package com.hierarchycm.gxt.server.xmpp;

import org.jivesoftware.smack.packet.IQ;

public class NickPacket extends IQ {

	String newNickname;
	NickPacket(String newNickname) {
		this.newNickname = newNickname;
	}
	 
	@Override
	public String getChildElementXML() {
	      return "<pubsub xmlns=\"http://jabber.org/protocol/pubsub\">" +
   		 "<publish node=\"http://jabber.org/protocol/nick\"> " +
   		 "<item>" +
   		 "<nick xmlns=\"http://jabber.org/protocol/nick\">"+newNickname+"</nick>" +
   		 "</item>" +
   	     "</publish>" +
   	     "</pubsub>";
	}

}
