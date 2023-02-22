package com.hierarchycm.gxt.client.commands;

import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class LinkObjInstanceCommand extends SimplifiedCommand<ObjectTypeTree>  {
	
		String parentObjectKy = null;
		String childObjectKy = null;
		private ObjectLinkType olt;
		
		
		public LinkObjInstanceCommand(AsyncCallback<ObjectTypeTree> callback) {
			this.callback=callback;
		}

		public void execute(String parentObjectKy, String childObjectKy, ObjectLinkType olt) {
			this.parentObjectKy = parentObjectKy;
			this.childObjectKy = childObjectKy;	
			this.olt = olt;
			execute();
		}

		public LinkObjInstanceCommand(){}

		public void execute() {
			DbServiceProvider.getDbService().linkInstances(parentObjectKy, childObjectKy, olt, this, callback );
		}
}
