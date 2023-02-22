package com.hierarchycm.gxt.client.commands;

import java.io.Serializable;

import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.Window;
import com.hierarchycm.shared.client.GxtException;

public class SimpleCommand implements CommandWithCallback, Serializable {

	public SimpleCommand() {
	}

	protected transient AsyncCallback<Void> simpleVoidCallback = new AsyncCallback<Void>() {
		@Override
		public void onFailure(Throwable caught) {

			String details = caught.toString();
			if (caught instanceof GxtException) {
				details = " Original Message: "	+ ((GxtException) caught).getOriginalMessage();
			}
			Window.alert("Error occurred while communicating with server: "	+ details);
		}

		@Override
		public void onSuccess(Void result) {
		}
	};

	public void execute() {

	}

	@Override
	public void setAsyncCallback(AsyncCallback callback) {
		this.simpleVoidCallback = callback;
		
	}
}