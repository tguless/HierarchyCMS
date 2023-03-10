/*
 * ((e)) emite: A pure Google Web Toolkit XMPP library
 * Copyright (c) 2008-2011 The Emite development team
 * 
 * This file is part of Emite.
 *
 * Emite is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3
 * of the License, or (at your option) any later version.
 *
 * Emite is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with Emite.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.calclab.emite.xep.privacylists.client;

import java.util.HashMap;

import com.calclab.emite.core.client.LoginXmpp;
import com.calclab.emite.core.client.LoginXmppMap;
import com.calclab.emite.core.client.MultiInstance;
import com.calclab.emite.core.client.packet.IPacket;
import com.calclab.emite.core.client.xmpp.session.IQResponseHandler;
import com.calclab.emite.core.client.xmpp.session.XmppSession;
import com.calclab.emite.core.client.xmpp.stanzas.IQ;
import com.calclab.emite.core.client.xmpp.stanzas.XmppURI;
import com.google.gwt.user.client.Window;
import com.google.inject.Inject;

/**
 * Will (i hope!) implement http://www.xmpp.org/extensions/xep-0016.html
 */
public class PrivacyListsManager implements MultiInstance {
	private XmppSession session;
	private HashMap<String, LoginXmpp> loginXmppMap;

	@Inject
	public PrivacyListsManager( final @LoginXmppMap  HashMap <String, LoginXmpp> loginXmppMap) {
		//this.session = session;
		
		this.loginXmppMap = loginXmppMap;
	}

	/**
	 * Block incoming messages from other entity based on the entity's JID.
	 * 
	 * @see http://www.xmpp.org/extensions/xep-0016.html#protocol-message
	 * 
	 * @param listName
	 *            is that necessary?
	 * @param uri
	 *            the other entity jid
	 * @param order
	 *            i din't read the spec... is that necessary?
	 */
	public void blockUserBasedOnJID(final String listName, final XmppURI uri, final Integer order) {
		final IQ iq = new IQ(IQ.Type.set);
		final IPacket list = iq.addQuery("jabber:iq:privacy").addChild("list", null);
		list.With("name", listName);
		list.addChild("item", null).With("type", "jid").With("value", uri.getJID().toString()).With("action", "deny").With("order", order.toString());

		session.sendIQ("privacyLists", iq, new IQResponseHandler() {
			@Override
			public void onIQ(final IQ iq) {
				// here you can handle the response... i think in this case is
				// not needed
			}
		});

	}

	public void onlyAllowMessagesFromSubscribedUsers(final String listName,  final Integer order) {
		final IQ iq = new IQ(IQ.Type.set);
		final IPacket list = iq.addQuery("jabber:iq:privacy").addChild("list", null);
		list.With("name", listName);
		list.addChild("item", null).With("type", "subscription").With("value", "both").With("action", "allow").With("order", order.toString());		
		IPacket denyItem = list.addChild("item", null);
		denyItem.With("action", "deny").With("order", new Integer(order+1).toString());
		denyItem.addChild("message");
	
		
		session.sendIQ("privacyLists", iq, new IQResponseHandler() {
			@Override
			public void onIQ(final IQ iq) {
				setActiveList(listName);
				// here you can handle the response... i think in this case is
				// not needed
			}
		});
	}
	
	public void setActiveList(final String listName) {
		final IQ iq = new IQ(IQ.Type.set);
		final IPacket active = iq.addQuery("jabber:iq:privacy").addChild("active", null);
		active.With("name", listName);
		
		session.sendIQ("privacyLists", iq, new IQResponseHandler() {
			@Override
			public void onIQ(final IQ iq) {
				// here you can handle the response... i think in this case is
				// not needed
				setAsDefault(listName);
			}
		});
	}
	
	public void setAsDefault(final String listName) {
		final IQ iq = new IQ(IQ.Type.set);
		final IPacket active = iq.addQuery("jabber:iq:privacy").addChild("default", null);
		active.With("name", listName);
		
		session.sendIQ("privacyLists", iq, new IQResponseHandler() {
			@Override
			public void onIQ(final IQ iq) {
				// here you can handle the response... i think in this case is
				// not needed
				if (iq.isType(IQ.Type.error)) {
					Window.alert("There was an error setting the default privacy list");
				}
			}
		});
	}
	
	@Override
	public void setInstanceId(String instanceId) {		
		this.session =loginXmppMap.get(instanceId).xmppSession; 
		
	}
}
