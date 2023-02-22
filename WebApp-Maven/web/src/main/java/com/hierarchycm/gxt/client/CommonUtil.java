package com.hierarchycm.gxt.client;

import com.google.gwt.core.client.GWT;
import com.hierarchycm.gxt.client.model.ObjectInstance;
import com.hierarchycm.gxt.client.model.ObjectType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class CommonUtil {

	
	public static String getBaseUrl() {
		String moduleBase = GWT.getModuleBaseURL();
		String moduleName = GWT.getModuleName();  
		String baseApp = moduleBase.substring(0, moduleBase.indexOf(moduleName)); 
		return baseApp;
	}
	
	public static ObjectTypeTree getBasicOtt(String typeId, String instanceId) {
		
		ObjectInstance oi = new ObjectInstance();
		oi.instanceId = instanceId; // GlobalRegistry.clientSession.loginId;
		oi.type = new ObjectType();
		oi.type.typeId = typeId; //GlobalRegistry.serverInfo.rootTypeId;
	    ObjectTypeTree result = new ObjectTypeTree(oi);	    
	    
	    return result;
	    
	    
	}
}
