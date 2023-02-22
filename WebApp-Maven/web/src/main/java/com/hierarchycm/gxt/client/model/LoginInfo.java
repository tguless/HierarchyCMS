package com.hierarchycm.gxt.client.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import com.hierarchycm.gxt.client.CommonUtil;
import com.hierarchycm.gxt.client.GlobalRegistry;

public class LoginInfo implements Serializable{
	public String loginId;
	public String loginUserNm;
	public String password;
	//public String lastCookieDrop;
	public boolean loginSuccessful = false;	
	public String defaultPersonalityId;
	public HashMap <String, ObjectTypeTree> personalities;
	private ObjectTypeTree rootOtt = null;
		
	
	public ObjectTypeTree getRootOtt() {
	    if (rootOtt==null) {	    	
	    	rootOtt = CommonUtil.getBasicOtt(GlobalRegistry.serverInfo.rootTypeId, GlobalRegistry.clientSession.loginId);	    	
	    }	    
	    return rootOtt;
	}
}
