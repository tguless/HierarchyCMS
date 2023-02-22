package com.hierarchycm.gxt.client.commands;

import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.rpc.AsyncCallback;

public interface  CommandWithCallback <E>  extends Command {
	public void setAsyncCallback(AsyncCallback<E> callback);
}
