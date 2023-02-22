package com.hierarchycm.gxt.client.commands;

import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.model.ObjectInstLink;

public class GetInstanceDetailsCommandByInstId extends SimplifiedCommand<ObjectInstLink>  { 
	
	public String objInstLinkId = null; 	

	public GetInstanceDetailsCommandByInstId(AsyncCallback <ObjectInstLink> callback) {

		this.callback = callback;		
	}
	
	public GetInstanceDetailsCommandByInstId() {}

	public void execute() {
		DbServiceProvider.getDbService().getObjInstLnkDetailsByInstId(objInstLinkId, this, callback );	 	
	}
	
	public void execute(String objInstLinkId) {
		this.objInstLinkId = objInstLinkId;
		if (objInstLinkId == null) {
			Window.alert("Trying to get null instance details");		
		} else {
			execute();
		}
	}
}
