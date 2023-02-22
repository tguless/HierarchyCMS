package com.hierarchycm.gxt.client.commands;

import java.io.Serializable;
import java.util.HashMap;

import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class CreateObjInstanceCommand extends SimplifiedCommand<ObjectTypeTree>  {
	
		String parentObjectKy = null;
		String newInstanceName = null;
		private HashMap<String, Object> props;
		private ObjectLinkType olt;
		
		public CreateObjInstanceCommand(AsyncCallback<ObjectTypeTree> cb) {
			this.callback = cb;
		}

		public void execute(String parentObjectKy, ObjectLinkType olt, String newInstanceName, HashMap<String, Object> props) {
			this.parentObjectKy = parentObjectKy;
			this.newInstanceName = newInstanceName;
			this.props = props;
			this.olt = olt;
			execute();
		}

		public CreateObjInstanceCommand(){}

		public void execute() {
			DbServiceProvider.getDbService().createObjInst(parentObjectKy, olt, newInstanceName, this, props, callback);
		}
}
