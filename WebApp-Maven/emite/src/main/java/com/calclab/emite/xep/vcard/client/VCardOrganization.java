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

package com.calclab.emite.xep.vcard.client;

import com.calclab.emite.core.client.packet.IPacket;
import com.calclab.emite.core.client.packet.Packet;

public class VCardOrganization extends VCardData {
	public static enum Data {
		ORGNAME, ORGUNIT
	}

	public VCardOrganization() {
		this(new Packet(VCard.ORG));
	}

	public VCardOrganization(final IPacket packet) {
		super(packet);
	}

	public String getData(final Data data) {
		return getValue(data.toString());
	}

	public void setData(final Data data, final String value) {
		setValue(data.toString(), value);
	}

}
