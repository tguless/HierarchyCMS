package com.hierarchycm.gxt.client;

import java.util.HashMap;
import java.util.HashSet;


import com.calclab.emite.core.client.LoginXmpp;
import com.calclab.hablar.client.HablarGinjector;
import com.extjs.gxt.ui.client.widget.TabPanel;
import com.extjs.gxt.ui.client.widget.Viewport;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.History;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.RootPanel;
import com.hierarchycm.gxt.client.commands.ErrorHandlingAsyncCallback;
import com.hierarchycm.gxt.client.commands.SimplifiedCommand;
import com.hierarchycm.gxt.client.model.LoginInfo;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.client.model.ServerInfo;

public class GlobalRegistry  {

	//static ObjectInstanceViewer oiv = null;
	
	static Long notifyableIndex = new Long(0);
	
	public static LoginInfo clientSession;
	public static ServerInfo serverInfo;

	private static HashMap<String, LoginXmpp> loginXmppMap;
	public static final HablarGinjector hablarInjector = GWT.create(HablarGinjector.class);
	
	public static HashMap<String, LoginXmpp> getLoginXmppMap () {		
		if (loginXmppMap == null) {
			loginXmppMap = hablarInjector.getLoginXmppMap();
		}
		
		return loginXmppMap;		
	}

	
	public static boolean isPersonalityType (String typeId) {
		boolean result = false;
		HashMap<String, ObjectLinkType> allTypes =  GlobalRegistry.serverInfo.typeSubtypes.get(GlobalRegistry.serverInfo.rootTypeId);
		for (ObjectLinkType olt : allTypes.values()) {
			if (olt.childType.typeId.equals(typeId)) {
				result = true;
				return true;
			}
		}		
		return result;
	}

	public static HashSet <String> getPersonalityLinkTypes() {
		if (GlobalRegistry.serverInfo.personalityTypes==null) {
			HashSet <String> result = new HashSet<String>();
			
			HashMap<String, ObjectLinkType> allTypes =  GlobalRegistry.serverInfo.typeSubtypes.get(GlobalRegistry.serverInfo.rootTypeId);			
			for (ObjectLinkType olt : allTypes.values()) {
				result.add(olt.linkTypeId);
			}
			
			GlobalRegistry.serverInfo.personalityTypes=result;
			return result;
		} else {
			return GlobalRegistry.serverInfo.personalityTypes;
		}
	}
	
	public static boolean isPersonalityLinkType(String linkTypeId) {
		if (getPersonalityLinkTypes().contains(linkTypeId)) {
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean isOilMyPersonality (String oilId) {
		boolean result = false;		
		for (ObjectTypeTree pers : clientSession.personalities.values()) {
			if(pers.getObjInstance().parent.instanceLinkId.equals(oilId)) { 
				result=true;
				return true;
			}
		}		
		return result;
	}
	
	public static boolean isOidMyPersonality (String oid) {
		boolean result = false;		
		for (ObjectTypeTree pers : clientSession.personalities.values()) {
			if(pers.getObjInstance().instanceId.equals(oid)) { 
				result=true;
				return true;
			}
		}		
		return result;
	}
	
	public static class CreateSessionCommand  extends SimplifiedCommand <LoginInfo>{

		public CreateSessionCommand(AsyncCallback <LoginInfo> ipcallback) {
			 callback = ipcallback;
		} 
		
		public CreateSessionCommand() {};
		
		@Override
		public void execute() {							
			DbServiceProvider.getDbService().createSession(this, callback);
		} 
	}
	
	public static void createSession() {
		
		ErrorHandlingAsyncCallback <LoginInfo> createSessionCallback = new ErrorHandlingAsyncCallback<LoginInfo>() {
			@Override
			public void onSuccess(LoginInfo result) {
				GlobalRegistry.clientSession = result;				
				Viewport vp = getViewport();
				vp.removeAll();				
				vp.setLayout(new FitLayout());
				mc = null;
				mc = new MainContainer();
				vp.add(mc);		
				RootPanel.get("feedContainer").add(vp);
				vp.layout();
				History.fireCurrentHistoryState();
			}
		};
		
		final SimplifiedCommand <LoginInfo> clientInfoCommand = new CreateSessionCommand(createSessionCallback);
		
		ErrorHandlingAsyncCallback <ServerInfo> cb  = new ErrorHandlingAsyncCallback<ServerInfo>() {
			@Override
			public void onSuccess(ServerInfo result) {
				
				GlobalRegistry.serverInfo = result; 
				clientInfoCommand.execute();
			}			
		};
		
		DbServiceProvider.getDbService().getServerInfo(cb);	
	}

	static Viewport vp = null;
	static MainContainer mc = null;

	public static TabPanel allPersonalitiesTabs;

	//public static EmiteSucoGinjector emiteSucoGinjector =	GinjectorHolder.getGinjector();
	
	protected static Viewport getViewport() {
		if (vp==null) {
			vp = new Viewport();
			
		}
		return vp;		
	}



	
}
