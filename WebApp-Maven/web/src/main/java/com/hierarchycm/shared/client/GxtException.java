package com.hierarchycm.shared.client;

import java.io.PrintWriter;
import java.io.Serializable;
import java.io.StringWriter;
import java.io.Writer;

public class GxtException  extends Exception implements Serializable {
	
	private String originalMessage = null;
	
	public String getOriginalMessage() {
		return originalMessage;
	}

	public void setOriginalMessage(String originalMessage) {
		this.originalMessage = originalMessage;
	}

	public GxtException(){
		super();
	}
	
	public GxtException(Exception e) {
		super(e);
		//originalMessage = Util.getStackTrace(e);
	}
	
	
	public GxtException(String message) {
		super (message);
	}
	
}
