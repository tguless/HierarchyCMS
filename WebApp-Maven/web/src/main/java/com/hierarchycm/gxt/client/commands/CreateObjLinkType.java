package com.hierarchycm.gxt.client.commands;

import java.io.Serializable;

import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class CreateObjLinkType extends SimplifiedCommand<ObjectTypeTree>  {
	
		
		ObjectLinkType olt;
		
		//static final transient GenericAsyncCallback<AsyncCallbackResult<ObjectTypeTree>> callBack = new GenericAsyncCallback<AsyncCallbackResult<ObjectTypeTree>>();
		
		public CreateObjLinkType(AsyncCallback<ObjectTypeTree> callback) {
			this.callback = callback;	
		}

		public void execute(ObjectLinkType olt) {
			this.olt = olt;
			execute();
		}

		public CreateObjLinkType(){}

		public void execute() {

			DbServiceProvider.getDbService().upSertChild(olt, this, callback);
		}
}
