package com.hierarchycm.gxt.client;

import java.util.ArrayList;
import java.util.HashMap;
import com.extjs.gxt.ui.client.data.FilterPagingLoadConfig;
import com.extjs.gxt.ui.client.data.PagingLoadResult;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.ObjectModelTreePanel.PopulateTreeCommand;
import com.hierarchycm.gxt.client.commands.CommandWithCallback;
import com.hierarchycm.gxt.client.commands.SimplifiedCommand;
import com.hierarchycm.gxt.client.model.LoginInfo;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectInstLinkModelData;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.client.model.ServerInfo;
import com.hierarchycm.shared.client.GxtException;

public interface DatabaseServiceAsync {
	public void getTopLevelHierarchy(PopulateTreeCommand command, AsyncCallback <ObjectTypeTree> callback);
	
	//public void getAppConfig(AsyncCallback <HashMap <String, String>> callback);
	
	public void createObjectType(String tableName, String schema, String name, AsyncCallback <String> callback);	
	
	public void deleteChild (String parentId,  CommandWithCallback command, AsyncCallback <Void> callback);
	 
	public void updateObjLinkType (String srcObjectTypeKy, String destObjectTypeKy, AsyncCallback <Void> callback);
	
	public void delObjLinkType (String linkTypeKy, AsyncCallback <Void> callback);
	
	public void getObjInstHier (String topObjectTypeId, CommandWithCallback command,  AsyncCallback <ObjectTypeTree> callback);	
	
	public void getTypeSubtypes (String topObjectTypeId, AsyncCallback <HashMap<String, ObjectLinkType>> callback);
	
	public void deleteObjectInstance (String objectKy, String typeId, CommandWithCallback command,  AsyncCallback <Void> callback);
	
	public void deleteObjectInstanceLink (String instanceLinkId, CommandWithCallback command, AsyncCallback <Void> callback);
		
	public   void  getAllObjectTypes (AsyncCallback <HashMap<String,ObjectTypeTree>> callback); 
	
	public void authenticate(String login, String password, AsyncCallback <LoginInfo> callback);
	
	public void performSignup(String username, String password, String email, String firstName, String lastName, String userCaptcha, AsyncCallback <String> callback);

	void getObjInstHier(CommandWithCallback command, AsyncCallback<ObjectTypeTree> callback);

	void getObjLnkTypeByKy(String objectLinkTypeId, CommandWithCallback command, AsyncCallback<ObjectLinkType> callback);
	
	public void testJpa ( AsyncCallback <Void> callback);

	public void getFeed(FilterPagingLoadConfig loadConfig, String feedType,	SimplifiedCommand command, AsyncCallback<PagingLoadResult<ObjectInstLinkModelData>> callback);

	public void createSession(SimplifiedCommand command, AsyncCallback<LoginInfo> callback); 
	
	public void approveLink(String oilId, boolean approve, SimplifiedCommand command, AsyncCallback<Boolean> callback);
	
	public void getServerInfo(AsyncCallback<ServerInfo> callback);

	public void getOiSubtypes(String oiId, SimplifiedCommand getOiSubtypes,	AsyncCallback<HashMap <String, ObjectLinkType>> callback);
	
	public void  getObjInstHierGenericByType(String topObjectId, String typeId, int depth, SimplifiedCommand command, 	AsyncCallback<ObjectTypeTree> callback);
	
	void getTypeInstances(String topObjectTypeId,  SimplifiedCommand command, AsyncCallback<HashMap<String, ObjectTypeTree>> callback);

	void linkInstances(String srcInstancId, String desInstancId, ObjectLinkType olt,  SimplifiedCommand command, AsyncCallback<ObjectTypeTree>  callback);

	public void createObjInst (String parentId, ObjectLinkType olt, String instanceName, SimplifiedCommand command, HashMap<String, Object> props, AsyncCallback<ObjectTypeTree>  callback);
	
	public void getObjInstLnkDetails(String instanceId, SimplifiedCommand getInstanceDetailsCommand, AsyncCallback<ObjectInstLink> callBack);
	
	public void getObjInstHierGeneric (String topObjectTypeId, int depth, SimplifiedCommand command,  AsyncCallback<ObjectTypeTree> callback);
	
	public void upSertChild (ObjectLinkType oma,  SimplifiedCommand command, AsyncCallback <ObjectTypeTree> callback);

	public void logout(AsyncCallback <Boolean> callback);

	public void getObjInstLnkDetailsByInstId(
			String objInstLinkId,
			SimplifiedCommand command,
			AsyncCallback<ObjectInstLink> callback);

}
 