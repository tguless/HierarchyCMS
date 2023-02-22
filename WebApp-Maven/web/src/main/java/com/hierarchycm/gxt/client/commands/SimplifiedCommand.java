package com.hierarchycm.gxt.client.commands;

import java.io.Serializable;

import com.google.gwt.user.client.rpc.AsyncCallback;

public abstract class SimplifiedCommand <E> implements CommandWithCallback <E>, Serializable {

	protected transient AsyncCallback <E> callback ;
	
	@Override
	public void setAsyncCallback(AsyncCallback <E> callback) {
		this.callback = callback;			
	}
	
	public SimplifiedCommand() {}
	
}
