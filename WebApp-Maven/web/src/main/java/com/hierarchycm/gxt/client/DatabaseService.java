package com.hierarchycm.gxt.client;

import java.util.ArrayList;
import java.util.HashMap;
import com.extjs.gxt.ui.client.data.FilterPagingLoadConfig;
import com.extjs.gxt.ui.client.data.PagingLoadResult;
import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;
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

@RemoteServiceRelativePath("db")
public interface DatabaseService extends RemoteService   {
	public  ObjectTypeTree getTopLevelHierarchy (PopulateTreeCommand command) throws GxtException, SessionTimeoutException ;
	
	public String createObjectType(String tableName, String schema, String name)  throws  GxtException;
	
	//public HashMap <String, String> getAppConfig() throws  GxtException;
	
//	public ObjectTypeTree upSertChild (ObjectLinkType oma) throws GxtException;

	public void deleteChild (String parentId, CommandWithCallback command)  throws  GxtException, SessionTimeoutException;
	
	public void delObjLinkType (String linkTypeKy) throws GxtException;
	
	public ObjectTypeTree getObjInstHier (String topObjectTypeId, CommandWithCallback command) throws GxtException, SessionTimeoutException;

	public ObjectTypeTree getObjInstHier ( CommandWithCallback command) throws GxtException, SessionTimeoutException;
		
	public HashMap<String, ObjectLinkType> getTypeSubtypes (String topObjectTypeId) throws GxtException;
		
	public void deleteObjectInstance (String objectKy, String typeId, CommandWithCallback command) throws GxtException, SessionTimeoutException;
	
	public   HashMap<String,ObjectTypeTree> getAllObjectTypes () throws GxtException ;
	
	public LoginInfo authenticate(String login, String password) throws GxtException;
	
	String performSignup(String username, String password, String email, String firstName, String lastName, String userCaptcha)throws GxtException;

	void updateObjLinkType(String srcObjectTypeKy, String destObjectTypeKy);
	
	public ObjectLinkType getObjLnkTypeByKy (String objectLinkTypeId, CommandWithCallback command)  throws GxtException, SessionTimeoutException;
	
	public PagingLoadResult<ObjectInstLinkModelData> getFeed(FilterPagingLoadConfig loadConfig, String feedType, SimplifiedCommand command) throws GxtException, SessionTimeoutException;

	public LoginInfo createSession(SimplifiedCommand command) throws SessionTimeoutException;
	
	public Boolean approveLink(String oilId, boolean approve, SimplifiedCommand command) throws SessionTimeoutException, GxtException;
	
	public void testJpa() throws GxtException;

	public ServerInfo getServerInfo() throws GxtException;
	
	public HashMap <String, ObjectLinkType> getOiSubtypes(String oiId, SimplifiedCommand getOiSubtypes) throws GxtException, SessionTimeoutException;

	public HashMap<String, ObjectTypeTree> getTypeInstances (String topObjectTypeId,  SimplifiedCommand command) throws GxtException ;
	
	public ObjectTypeTree  linkInstances(String srcInstancId, String desInstancId, ObjectLinkType olt, SimplifiedCommand command) throws GxtException;
	
	public ObjectInstLink getObjInstLnkDetails(String instanceId, SimplifiedCommand command) throws GxtException, SessionTimeoutException;

	public ObjectTypeTree createObjInst (String parentId, ObjectLinkType olt, String instanceName, SimplifiedCommand command, HashMap<String, Object> props) throws GxtException, SessionTimeoutException;

	public ObjectTypeTree getObjInstHierGeneric (String topObjectTypeId, int depth, SimplifiedCommand command) throws GxtException, SessionTimeoutException;
	
	public ObjectTypeTree  upSertChild (ObjectLinkType oma, SimplifiedCommand command) throws GxtException;
	
	public ObjectTypeTree getObjInstHierGenericByType(String topObjectId, String typeId, int depth, SimplifiedCommand command) throws GxtException, SessionTimeoutException;
	
	public void deleteObjectInstanceLink (String instanceLinkId, CommandWithCallback command)   throws GxtException, SessionTimeoutException;

	public Boolean logout();

	public ObjectInstLink getObjInstLnkDetailsByInstId(String objInstLinkId, SimplifiedCommand command) throws GxtException, SessionTimeoutException;
	
}
