package com.hierarchycm.gxt.client.commands;

import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;

public class ApproveOilCommand extends SimplifiedCommand<Boolean> {
	
		String myOilId = null;
		boolean approve = false;
		@Override
		public void execute() {
			DbServiceProvider.getDbService().approveLink(myOilId, approve, this, callback);
		}
		
		public ApproveOilCommand(){}
		
		public ApproveOilCommand(String oilId, boolean approve, AsyncCallback<Boolean> callback) {
			this.myOilId = oilId;
			this.callback = callback;
			this.approve = approve;
		}
	 	
}
