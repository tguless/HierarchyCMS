package com.hierarchycm.gxt.client.viewers;

import com.calclab.emite.core.client.events.MessageEvent;
import com.calclab.emite.core.client.events.MessageHandler;
import com.calclab.emite.core.client.xmpp.stanzas.Message;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.widget.TabItem;
import com.extjs.gxt.ui.client.widget.TabPanel;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.FlowLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayoutData;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout.VBoxLayoutAlign;
import com.hierarchycm.gxt.client.FeedGrid;
import com.hierarchycm.gxt.client.GlobalRegistry;
import com.hierarchycm.gxt.client.ObjectInstanceTreePanel;
import com.hierarchycm.gxt.client.ObjectModelTreePanel;
import com.hierarchycm.gxt.client.SiteChat;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class PersonalityViewer extends TabPanel implements InstanceViewPanel {

    ObjectInstLink oil;
	private String oilId;
	private String itemTypeId;
	private ObjectTypeTree ott;
	
	TabItem liveChat;
	
	PersonalityViewer()
	{
	}
    
    PersonalityViewer(ObjectInstLink oil) {
    	loadItem(oil);
    }
    
    private void loadItem(ObjectInstLink oil) {
    	this.oil = oil;
    	if (oil!=null) {
	    	this.oilId = oil.instanceLinkId;
	    	this.itemTypeId = oil.child.type.typeId;    	
	    	loadItem();
    	}
    }
       
    public void loadItem () {
	    setBorders(false);
	    setBodyBorder(false);
	    setBorderStyle(false);
	    
		for (ObjectLinkType olt : GlobalRegistry.serverInfo.typeSubtypes.get(itemTypeId).values()) {									
			
			TabItem ti = new TabItem(olt.linkTypeName);
			ti.setScrollMode(Scroll.AUTOY);

			ti.setLayout(new FitLayout());				
			ti.setBorders(false);
			ObjectInstanceViewerPanel oivp = new ObjectInstanceViewerPanel();
			oivp.setBorders(false);				
			if (ott!=null){
				oivp.loadItem(ott, olt.childType.typeId);
			} else if (oil!=null){				
				oivp.loadItem(oil, olt.childType.typeId);
			}
			ti.add(oivp);		
			add(ti);									
		}
				
		if (GlobalRegistry.isOilMyPersonality(oilId)) {
		    TabItem feed = new TabItem("Feed");  	
		    
	        VBoxLayout layout = new VBoxLayout();  
	        layout.setVBoxLayoutAlign(VBoxLayoutAlign.STRETCH);
	        feed.setLayout(layout);
	        
		    feed.setScrollMode(Scroll.AUTO);
		    feed.addStyleName("pad-text");
		    
		    FeedGrid feedgrid = new FeedGrid("friendfeed", ott);
	        VBoxLayoutData flex = new VBoxLayoutData(new Margins(0,0,0,0));          
	        flex.setFlex(1); 
	        feed.add(feedgrid, flex);  
		    
		    TabItem requests = new TabItem("Requests");  
		    requests.setLayout(new FitLayout());
		    requests.addStyleName("pad-text");  	    
		    requests.add(new FeedGrid("requests", ott));
		    
		    liveChat = new TabItem("Live Chat");
		    liveChat.setLayout(new FitLayout());
		    liveChat.addStyleName("pad-text");  		    		    
		    
		    TabItem myStuff = new TabItem("My Stuff");
		    myStuff.setLayout(new FitLayout());
		    myStuff.addStyleName("pad-text");  	    
		    myStuff.add(new ObjectInstanceTreePanel());
		    
		    TabItem admin = new TabItem("Admin");
		    admin.setLayout(new FitLayout());
		    admin.addStyleName("pad-text");  	    
		    admin.add(new ObjectModelTreePanel());		    
			
			add(feed);
		    add(requests); 
		    add(liveChat);
		    add(myStuff);
		    add(admin);
		    

		}
				
	    TabItem profile = new TabItem("Profile");	    
	    profile.setLayout(new FitLayout());
	    add(profile);
    }

	@Override
	public ObjectInstLink getObjectInstanceLink() {
		return oil;		
	}

	@Override
	public void setObjectInstanceLink(ObjectInstLink objectInstanceLink) {
		this.oil = objectInstanceLink;
		if (liveChat != null) {
			liveChat.add(new SiteChat(this.width, String.valueOf(500), oil.child.instanceId, GlobalRegistry.clientSession.password, liveChat));
		}
	}


	@Override
	public void instanceChangeNotification(ObjectTypeTree oldParent, ObjectTypeTree newParent, boolean purgeChildren) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree itemChanged) {
		// TODO Auto-generated method stub		
	}

	@Override
	public boolean moveForward() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean moveBackward() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void setObjectTypeTree(ObjectTypeTree ott) {
		this.ott = ott;
		loadItem(ott.getObjInstance().parent);
	}

}
