package com.hierarchycm.gxt.server;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import nl.captcha.Captcha;
import com.extjs.gxt.ui.client.data.BasePagingLoadResult;
import com.extjs.gxt.ui.client.data.FilterPagingLoadConfig;
import com.extjs.gxt.ui.client.data.PagingLoadResult;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.server.rpc.RemoteServiceServlet;
import com.hierarchycm.gxt.client.DatabaseService;
import com.hierarchycm.gxt.client.GlobalRegistry;
import com.hierarchycm.gxt.client.SessionTimeoutException;
import com.hierarchycm.gxt.client.ObjectModelTreePanel.PopulateTreeCommand;
import com.hierarchycm.gxt.client.commands.CommandWithCallback;
import com.hierarchycm.gxt.client.commands.SimplifiedCommand;
import com.hierarchycm.gxt.client.model.LoginInfo;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectInstLinkModelData;
import com.hierarchycm.gxt.client.model.ObjectInstance;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.client.model.ServerInfo;
import com.hierarchycm.gxt.server.xmpp.XmppUtil;
import com.hierarchycm.mysql.Dao.AppConfig;
import com.hierarchycm.mysql.Dao.Cache;
import com.hierarchycm.mysql.Dao.ObjectInstanceDAO;
import com.hierarchycm.mysql.Dao.ObjectModelDAO;
import com.hierarchycm.mysql.Dao.UserProfile;
import com.hierarchycm.shared.client.GxtException;
import com.hierarchycm.shared.server.Util;


@SuppressWarnings("serial")
public class DatabaseServiceImpl extends RemoteServiceServlet implements DatabaseService {
	
	String userLogin = null; 
	String personalityId = null;
	private String userId;
	
	public ObjectTypeTree getTopLevelHierarchy (PopulateTreeCommand command) throws GxtException, SessionTimeoutException { 
			
	    checkSession(command);
	        
    	try {			
			return ObjectModelDAO.getObjectHierarchy(userId,personalityId);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}		
	}
	
	public String createObjectType(String tableName, String schema, String name) throws GxtException { 
		
		try {
			return ObjectModelDAO.createObjectType(tableName, schema, name);
		} catch (Exception e) {			 
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}		
	}
	

	
	
	public void deleteChild (String parentId, CommandWithCallback command)   throws GxtException, SessionTimeoutException{ 
		System.out.println("The command came in to delete:" + parentId);
		
		checkSession(command);        
		try {
			ObjectModelDAO.deleteObjectType(parentId);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}				
	}
	
	 
	public void deleteObjectInstance (String parentId, String typeId, CommandWithCallback command)   throws GxtException, SessionTimeoutException{ 
		checkSession(command);
		try {
			
			if ( AppConfig.isPersonalityType(typeId)) {	
				HttpServletRequest request = getThreadLocalRequest();	        
		        HttpSession session = request.getSession(true);
		        LoginInfo loginInfo = (LoginInfo)session.getAttribute("sessionInfo");
				loginInfo.personalities.remove(parentId);
			} 
			
			ObjectInstanceDAO.deleteObjectInstance(parentId, userId, personalityId);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}				
	}
	
	public void deleteObjectInstanceLink (String instanceLinkId,  CommandWithCallback command)   throws GxtException, SessionTimeoutException{ 
		checkSession(command);
		try {
			ObjectInstanceDAO.deleteObjectInstanceLink(instanceLinkId, userId, personalityId);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}				
	}
	
	public void delObjLinkType (String linkTypeKy) throws GxtException {
		
		try {
			ObjectModelDAO.delObjLinkType(linkTypeKy);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}	
	} 
	
	public ObjectTypeTree getObjInstHier (String topObjectId, CommandWithCallback command) throws GxtException, SessionTimeoutException { 
		checkSession(command);
		
		try {
			return ObjectInstanceDAO.getObjInstHier(topObjectId, userId, personalityId);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}	
	}


	
	public ObjectTypeTree getObjInstHier ( CommandWithCallback command) throws GxtException, SessionTimeoutException { 
		checkSession(command);
        
		try {
			return ObjectInstanceDAO.getObjInstHier(userId, userId, personalityId);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}	
	}
	
	public HashMap<String, ObjectLinkType> getTypeSubtypes (String topObjectTypeId) throws GxtException {
		try {
			return ObjectModelDAO.getTypeSubtypes(topObjectTypeId);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}		
	}
	
	

	
	public   HashMap<String,ObjectTypeTree> getAllObjectTypes () throws GxtException {
		try {
			return ObjectModelDAO.getAllObjectTypes();
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}		
	}
	/*
	public HashMap <String, String> getAppConfig() throws  GxtException {
		try {
			return ObjectModelDAO.getAllAppConfig();
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}		
	}
	*/
	public void logOff() {
		
    	HttpServletRequest request = getThreadLocalRequest();	        
        HttpSession session = request.getSession();
        
        session.setAttribute("login", null );
        session.setAttribute("sessionInfo", null);
	}
	

	
	 public LoginInfo authenticate(String login,  String password) throws GxtException
	    {

	    	HttpServletRequest request = getThreadLocalRequest();	        
	        HttpSession session = request.getSession(true);
	        
	        LoginInfo result = null;
	        
			try {
	        
		    	if (login != null && password !=null) {

		    		result = UserProfile.getUserObjectId(login, password);
		    	
			    	if (result != null) {
			    		
			    		session.setAttribute("sessionInfo", result);
			    		
			    		session.setAttribute("login", login );
			    		session.setAttribute("loginObjId", result.loginId);
			    		session.setAttribute("password", password);
			    		
			    		result.loginSuccessful=true;
			    		return result;
			    	} else {
			    		result = new LoginInfo();
			    		result.loginSuccessful =false;
			    		return result;
			    	}
		    	} else {
		    		result = new LoginInfo();
		    		result.loginSuccessful =false;
		    		return result;
		    	}
	    	
			} catch (Exception e) {			
				GxtException le =new GxtException(e); 
				le.setOriginalMessage(Util.getStackTrace(e));
				throw le;   
			}
	    	
	    }
	
	 private LoginInfo checkSession(CommandWithCallback command) throws SessionTimeoutException {
	    	HttpServletRequest request = getThreadLocalRequest();	        
	        HttpSession session = request.getSession();
	        
	        LoginInfo result = (LoginInfo)session.getAttribute("sessionInfo");
	        
	        if(result == null || result.loginId.trim().equals("")) {
	        	System.out.println("Session empty");
	        	throw new SessionTimeoutException(command);
	        } else {
	        	userLogin = result.loginUserNm;	 
	        	userId = result.loginId;
	        	personalityId = result.defaultPersonalityId;
	        }
	        
	        return result;
	 }
	 
	 public ObjectLinkType getObjLnkTypeByKy (String objectLinkTypeId, CommandWithCallback command)  throws GxtException, SessionTimeoutException{
		 checkSession(command);
		 
			try {
				return ObjectModelDAO.getObjLnkTypeByKy(objectLinkTypeId);
			} catch (Exception e) {			
				GxtException le =new GxtException(e); 
				le.setOriginalMessage(Util.getStackTrace(e));
				throw le;   
			}	
	 }
	 
	 public String performSignup(String username, String password, String email, String firstName, String lastName, String userCaptcha) throws GxtException {
	        
	        
	    	try {
		    	HttpServletRequest request = getThreadLocalRequest();		        
		        HttpSession session = request.getSession();
		
		        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
		        
		        boolean captcharesult = captcha.isCorrect(userCaptcha);
		        
		        if (!UserProfile.getUserObjectId(username).equals("0")) { 
		        	return "USER_EXISTS";    
		        }
		        
		        if (!UserProfile.emailExists(email).equals("0")) {
		        	return "EMAIL_EXISTS";
		        }
		        
		        if (captcharesult) {     
		        	String userId = UserProfile.addUser(username, password, email);
		        	String personalityId = UserProfile.addPersonality(userId, firstName,  lastName);
		        	XmppUtil xmpp = new XmppUtil();
					xmpp.registerUserXmpp(personalityId, password, firstName+" "+lastName);		   
					
					
		       		return "CREATE_SUCCESS";        		 	
		        } else {
		        	return "CAPTCHA_FAILED";
		        }
		        
	    	} catch ( Exception e) {
	    		GxtException le =new GxtException(e); 
				le.setOriginalMessage(Util.getStackTrace(e));
				throw le;   
	    	}
	        
	    }

	@Override
	public void updateObjLinkType(String srcObjectTypeKy, String destObjectTypeKy) {
		// TODO Auto-generated method stub
		
	} 

	@Override
	public  ObjectTypeTree  upSertChild (ObjectLinkType oma, SimplifiedCommand command) throws GxtException{ 		 
		try {							
			checkSession(command);     
			return ObjectModelDAO.createChild(oma, userId, personalityId);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}				
	}
	
	@Override
	public ObjectTypeTree getObjInstHierGeneric(
			String topObjectId, int depth, SimplifiedCommand command) throws GxtException, SessionTimeoutException {		
			checkSession(command);		
			try {									
				return ObjectInstanceDAO.getObjInstHier(topObjectId, userId, personalityId);			
			} catch (Exception e) {			
				GxtException le =new GxtException(e);  
				le.setOriginalMessage(Util.getStackTrace(e));
				throw le;   
			}
	}
	
	@Override
	public ObjectTypeTree getObjInstHierGenericByType(String topObjectId, String typeId, int depth, SimplifiedCommand command) throws GxtException, SessionTimeoutException {		
			checkSession(command);		
			try {				
				return ObjectInstanceDAO.getObjInstHier(topObjectId, userId, personalityId, typeId, depth);			
			} catch (Exception e) {			
				GxtException le =new GxtException(e);  
				le.setOriginalMessage(Util.getStackTrace(e));
				throw le;   
			}
	}
	
	@Override
	public ObjectTypeTree createObjInst (String parentId, ObjectLinkType olt, String instanceName, SimplifiedCommand command, HashMap<String, Object> props) throws GxtException, SessionTimeoutException {
		checkSession(command);
		
		try {
			ObjectTypeTree ott = ObjectInstanceDAO.createObjInstHier(parentId, olt, instanceName, userId, personalityId, props); 			
			ObjectTypeTree newInstance = (ObjectTypeTree)ott.getChild(0);
			String typeId = newInstance.getObjInstance().type.typeId;
			if ( AppConfig.isPersonalityType(typeId)) {				
		    	HttpServletRequest request = getThreadLocalRequest();	        
		        HttpSession session = request.getSession(true);
		        LoginInfo loginInfo = (LoginInfo)session.getAttribute("sessionInfo");
				loginInfo.personalities.put(newInstance.getObjInstance().instanceId, newInstance);
			}
			return  ott;
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}		
	}
	
	@Override
	public ObjectTypeTree linkInstances(String srcInstancId, String desInstancId, ObjectLinkType olt, SimplifiedCommand command) throws GxtException {
		try {
			checkSession(command);
			return ObjectInstanceDAO.linkInstancesOtt(srcInstancId, desInstancId, olt,  userId, personalityId); 			
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;    
		}	
	}
	
	@Override
	public HashMap<String, ObjectTypeTree> getTypeInstances (String topObjectTypeId,SimplifiedCommand command) throws GxtException {
		try {
			checkSession(command);			
			return ObjectInstanceDAO.getTypeInstances(topObjectTypeId);
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}			
	}
	
	@Override
	public ObjectInstLink getObjInstLnkDetails(String instanceId, SimplifiedCommand command) throws GxtException, SessionTimeoutException{ 
		
		System.out.println("Got to the backend!");
		
		checkSession(command); 
		try {
			return ObjectInstanceDAO.getObjInstLnkDetails(instanceId);			 
						
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}					
	}
	
	public ObjectInstLink getObjInstLnkDetailsByInstId(
			String instanceId,
			SimplifiedCommand command) throws GxtException, SessionTimeoutException{
		
		System.out.println("Got to the backend!");
		
		checkSession(command); 
		try {
			return ObjectInstanceDAO.getObjInstLnkDetailsByInstId(instanceId, userId, personalityId);			 						
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}					
	}
	


	@Override
	public void testJpa() throws GxtException {
		
		/*
		try {
			//removeXmppUser("tguless", "secret123");

		} catch (XMPPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
    	// Create the configuration for this new connection

    	  


		// TODO Auto-generated method stub
		//ObjectInstanceDAO oiDao = new ObjectInstanceDAO();
		//ObjectInstanceDAO.jpaInsertTest();
		//ObjectInstanceDAO.jpaUpdateTest();
		//ObjectInstanceDAO.jpaDeleteTest();
		//ObjectInstanceDAO.jpaNamedQueryTest();		
		//ObjectInstanceDAO.jpaDynaQueryTest();
		
		
	}

	@Override
	public PagingLoadResult<ObjectInstLinkModelData> getFeed(FilterPagingLoadConfig loadConfig, String feedType, SimplifiedCommand command) throws GxtException, SessionTimeoutException  {
		checkSession(command); 
		 
		try {			
			ArrayList <ObjectInstLinkModelData> result = ObjectInstanceDAO.getFeed(userId, personalityId, loadConfig, feedType );		
			PagingLoadResult <ObjectInstLinkModelData> plr = new BasePagingLoadResult<ObjectInstLinkModelData>(result);
			return plr;
		} catch (Exception e) {			
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le;   
		}		
	}
	
	@Override
	public LoginInfo createSession(SimplifiedCommand command) throws SessionTimeoutException { 
		System.out.println("Creating session");
		return checkSession(command);
	}

	@Override
	public Boolean approveLink(String oilId, boolean approve, SimplifiedCommand command)
			throws SessionTimeoutException, GxtException {
			checkSession(command);
			try {
				ObjectInstanceDAO.approveLink(oilId, approve, userId);
			} catch (SQLException e) {
				GxtException le =new GxtException(e); 
				le.setOriginalMessage(Util.getStackTrace(e));
				throw le; 
			}
		return null;
	}
	
	@Override
	public ServerInfo getServerInfo() throws GxtException {			
		ServerInfo si = new ServerInfo();
		si.chatServer = XmppUtil.getServerName();
		si.typeSubtypes = getAllTypeSubtypes();
		si.rootTypeId = AppConfig.getProperty("IDENTITY_ROOT");
		si.defaultPopupHeight = Integer.valueOf(AppConfig.getProperty("DEFAULT_POPUP_HEIGHT"));
		si.defaultPopupWidth = Integer.valueOf(AppConfig.getProperty("DEFAULT_POPUP_WIDTH"));		
		return si;
	}
	
	
	public HashMap<String, HashMap<String, ObjectLinkType>> getAllTypeSubtypes() throws GxtException {
		try {
			return ObjectModelDAO.getAllTypeSubtypes();
		} catch (SQLException e) {
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le; 
		}
	}

	@Override
	public HashMap<String, ObjectLinkType> getOiSubtypes(String oiId, SimplifiedCommand getOiSubtypes) throws GxtException, SessionTimeoutException {
		checkSession(getOiSubtypes);
		try {
			return ObjectInstanceDAO.getObjectInstanceSubtypes(oiId, userId, personalityId);
		} catch (SQLException e) {
			GxtException le =new GxtException(e); 
			le.setOriginalMessage(Util.getStackTrace(e));
			throw le; 
		}
		
	}

	@Override
	public Boolean logout() {		
		logOff();
		return true;
	}
		
	
}
