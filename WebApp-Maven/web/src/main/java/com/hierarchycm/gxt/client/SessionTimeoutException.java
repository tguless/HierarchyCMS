package com.hierarchycm.gxt.client;

import java.io.Serializable;

import com.google.gwt.user.client.Command;
import com.hierarchycm.gxt.client.commands.CommandWithCallback;

public class SessionTimeoutException  extends Exception  implements Serializable {

	public CommandWithCallback  command;
	
	public SessionTimeoutException() {		
	}

	public SessionTimeoutException(CommandWithCallback  command) {
		this.command = command;
	}
}
