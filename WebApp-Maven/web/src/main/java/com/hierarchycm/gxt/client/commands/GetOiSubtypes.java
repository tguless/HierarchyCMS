package com.hierarchycm.gxt.client.commands;

import java.util.ArrayList;
import java.util.HashMap;

import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class GetOiSubtypes extends SimplifiedCommand<HashMap <String, ObjectLinkType>> {
	
		String oiId = null;

		@Override
		public void execute() {
			DbServiceProvider.getDbService().getOiSubtypes(oiId, this, callback);
		}
		
		public GetOiSubtypes(){}
		
		public GetOiSubtypes(String oiId, AsyncCallback<HashMap <String, ObjectLinkType>> callback) {
			this.oiId = oiId;
			this.callback = callback;
		}
	 	
}
