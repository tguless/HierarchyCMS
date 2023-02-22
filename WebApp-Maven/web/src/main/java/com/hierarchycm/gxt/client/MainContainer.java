package com.hierarchycm.gxt.client;

import java.util.HashMap;

import com.calclab.emite.core.client.LoginXmpp;
import com.calclab.emite.core.client.LoginXmppMap;
import com.calclab.hablar.client.HablarGinjector;
import com.extjs.gxt.ui.client.Style.LayoutRegion;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.event.BaseEvent;
import com.extjs.gxt.ui.client.event.ComponentEvent;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.Html;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.TabItem;
import com.extjs.gxt.ui.client.widget.TabPanel;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.layout.BorderLayout;
import com.extjs.gxt.ui.client.widget.layout.BorderLayoutData;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.Element;  
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Image;
import com.google.gwt.user.client.ui.RootPanel;
import com.hierarchycm.gxt.client.commands.ErrorHandlingAsyncCallback;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.client.viewers.AllPersonalities;

public class MainContainer extends LayoutContainer {
	
	  static final Html mainLogo = new Html("<table width='100%'><tr><td><img src='/images/mainLogo.gif'/></td><td align=right valign=top><a href='#' class='logoutcl'>Logout</a></td></tr></table>");	
	  
	  MainContainer() {
			    mainLogo.addListener(Events.OnClick, new Listener<BaseEvent>() {	
					public void handleEvent(BaseEvent be) {					
						ComponentEvent ce = (ComponentEvent) be;					
						if (ce.getTarget(".logoutcl",1)!= null) {
							DbServiceProvider.getDbService().logout(logoutCallback);
							HashMap<String, LoginXmpp> loginXmppMap = GlobalRegistry.getLoginXmppMap();
							for(LoginXmpp loginXmpp : loginXmppMap.values()) {								
								loginXmpp.xmppSession.logout();																
							}
							loginXmppMap.clear();
						}
						mainLogo.removeAllListeners();
					}
				});
	  }
	  
	  final  ErrorHandlingAsyncCallback <Boolean> logoutCallback = new ErrorHandlingAsyncCallback<Boolean> () {
			@Override
			public void onSuccess(Boolean result) {
				RootPanel.get("feedContainer").clear();				
				GlobalRegistry.clientSession = null;
				//Window.alert("Calling create session from logout");
				GlobalRegistry.createSession();
			}		    	
	  };	  
	  
	  protected void onRender(Element target, int index) {  
		    super.onRender(target, index);  
		    
		    final BorderLayout layout = new BorderLayout();  
		    setLayout(layout);  
		    setStyleAttribute("padding", "10px");  
		    this.setBorders(false);
		    
		    /*		    
		    BorderLayoutData westData = new BorderLayoutData(LayoutRegion.WEST, 150);  
		    westData.setSplit(true);  
		    westData.setCollapsible(true);  
		    westData.setMargins(new Margins(0,5,0,0));  
		    
		    BorderLayoutData eastData = new BorderLayoutData(LayoutRegion.EAST, 150);  
		    eastData.setSplit(true);  
		    eastData.setCollapsible(true);  
		    eastData.setMargins(new Margins(0,0,0,5));  
		  
		    BorderLayoutData southData = new BorderLayoutData(LayoutRegion.SOUTH, 100);  
		    southData.setSplit(true);  
		    southData.setCollapsible(true);  
		    southData.setFloatable(true);  
		    southData.setMargins(new Margins(5, 0, 0, 0));
		    ContentPanel west = new ContentPanel();  
		    ContentPanel east = new ContentPanel();
		    ContentPanel south = new ContentPanel();  		    
		    */
		    
		    final BorderLayoutData northData = new BorderLayoutData(LayoutRegion.NORTH, 60);
		    northData.setCollapsible(false);  
		    northData.setFloatable(false);  
		    northData.setHideCollapseTool(true);  
		    northData.setSplit(false);  
		    northData.setMargins(new Margins(0, 0, 0, 0));
		    
		    final BorderLayoutData centerData = new BorderLayoutData(LayoutRegion.CENTER);  		    
		    centerData.setMargins(new Margins(0,0,0,0)); 
		    
		    final LayoutContainer north = new LayoutContainer();	
		    north.add(mainLogo);
		    
		    //add(mainLogo);
		    add(mainLogo, northData);

		    //add(new AllPersonalities());		    
		    
		    LayoutContainer lc = new LayoutContainer();
		    lc.setLayout(new FitLayout());
		    //lc.add(new Button());				    
		    /*
		    TabPanel tp = new TabPanel();
		    tp.setBodyBorder(false);
		    tp.setBorders(false);
		    tp.setBorderStyle(false);
		    lc.add(tp);
		    add(lc, centerData);
		    TabItem feed = new TabItem("Feed");  	
		    feed.setLayout(new FitLayout());
		    tp.add(feed);
		    */
		    add(new AllPersonalities(), centerData);	

		    
		    
		    //add(west, westData);  		    
		    //add(east, eastData);  
		    //add(south, southData);  	
	  }
}
