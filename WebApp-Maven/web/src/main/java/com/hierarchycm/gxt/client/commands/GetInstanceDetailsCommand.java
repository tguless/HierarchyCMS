package com.hierarchycm.gxt.client.commands;

import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.model.ObjectInstLink;

public class GetInstanceDetailsCommand extends SimplifiedCommand<ObjectInstLink>  { 
	
	public String objInstLinkId = null; 	

	public GetInstanceDetailsCommand(AsyncCallback <ObjectInstLink> callback) {

		this.callback = callback;		
	}
	
	public GetInstanceDetailsCommand() {}

	public void execute() {
		DbServiceProvider.getDbService().getObjInstLnkDetails(objInstLinkId, this, callback );	 	
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
