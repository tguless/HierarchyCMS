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

package com.calclab.emite.xep.muc.client;

import java.util.HashMap;

import com.calclab.emite.core.client.LoginXmpp;
import com.calclab.emite.core.client.LoginXmppMap;
import com.calclab.emite.core.client.MultiInstance;
import com.calclab.emite.core.client.xmpp.session.SessionComponentsRegistry;
import com.google.inject.Inject;
import com.google.inject.Provider;

/**
 * Register RoomManager as session component
 * 
 * @see SessionComponentsRegistry
 * 
 */
public class MucComponents implements MultiInstance {

	final Provider<RoomManager> provider;
	private HashMap<String, LoginXmpp> loginXmppMap;

	@Inject
	public MucComponents(final Provider<RoomManager> provider,final @LoginXmppMap  HashMap <String, LoginXmpp> loginXmppMap) {
		this.loginXmppMap = loginXmppMap;
		this.provider = provider;			
	}

	@Override
	public void setInstanceId(String instanceId) {
		LoginXmpp loginXmpp = loginXmppMap.get(instanceId);		
    	loginXmpp.registry.addProvider(provider);		
	}
}
