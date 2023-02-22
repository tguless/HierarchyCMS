package com.hierarchycm.gxt.client.commands;

import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.shared.client.GxtException;

public abstract class ErrorHandlingAsyncCallback <T> implements AsyncCallback <T> {
	@Override
	public void onFailure(Throwable caught) {
		String details = stackTraceToString(caught);
		if (caught instanceof GxtException) {
			details = " Original Message: "	+ ((GxtException) caught).getOriginalMessage();
		}
		Window.alert("Error occurred while communicating with server: "	+ details);
	}
	
	public String stackTraceToString(Throwable e) {
	    StringBuilder sb = new StringBuilder();
	    sb.append(e.toString());
	    sb.append("\n");
	    for (StackTraceElement element : e.getStackTrace()) {
	        sb.append(element.toString());
	        sb.append("\n");
	    }
	    return sb.toString();
	}
}
