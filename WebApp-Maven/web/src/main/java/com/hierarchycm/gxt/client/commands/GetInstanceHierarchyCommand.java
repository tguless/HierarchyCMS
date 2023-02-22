package com.hierarchycm.gxt.client.commands;

import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;


public class GetInstanceHierarchyCommand  extends SimplifiedCommand<ObjectTypeTree> {

		public String instanceId;			
		public String filterType;
		public int depth = 0;
		
		public GetInstanceHierarchyCommand(AsyncCallback <ObjectTypeTree> callback) {
			this.callback= callback;
		}
		
		public GetInstanceHierarchyCommand() {}
 
		public void execute() {			
			if ((filterType == null || filterType.equals("")) && (instanceId != null && !instanceId.equals(""))) {
				DbServiceProvider.getDbService().getObjInstHierGeneric(instanceId, depth, this, callback);
			} else if (instanceId != null && !instanceId.equals("")){
				DbServiceProvider.getDbService().getObjInstHierGenericByType(instanceId, filterType, depth, this, callback);
			}
		}	
		
		public void execute(String objInstLinkId) {
			this.instanceId = objInstLinkId;
			this.filterType = "";
			execute();
		}
		
		public void execute(String objInstLinkId, int depth, String filterType) {
			this.instanceId = objInstLinkId;
			this.filterType = filterType;
			this.depth = depth;
			execute();
		}
}
