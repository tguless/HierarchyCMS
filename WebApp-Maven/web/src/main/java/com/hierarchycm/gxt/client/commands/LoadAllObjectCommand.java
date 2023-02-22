package com.hierarchycm.gxt.client.commands;

import java.util.HashMap;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class LoadAllObjectCommand extends SimplifiedCommand<HashMap<String, ObjectTypeTree>>  {	
		String typeId = null;
		
		public LoadAllObjectCommand(AsyncCallback <HashMap<String, ObjectTypeTree>> callback) {
			this.callback = callback;
		}

		public void execute(String typeId) {
			this.typeId = typeId;	
			execute();
		}

		public LoadAllObjectCommand(){}
		public void execute() {
			DbServiceProvider.getDbService().getTypeInstances(typeId, this, callback); 
		}
}
