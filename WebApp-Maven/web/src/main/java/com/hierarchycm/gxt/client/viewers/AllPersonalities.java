package com.hierarchycm.gxt.client.viewers;

import java.util.ArrayList;

import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.util.Padding;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.TabItem;
import com.extjs.gxt.ui.client.widget.TabPanel;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout.VBoxLayoutAlign;
import com.google.gwt.user.client.Element;
import com.hierarchycm.gxt.client.GlobalRegistry;
import com.hierarchycm.gxt.client.InstanceChangeNotifyable;
import com.hierarchycm.gxt.client.create.GenericCreateChild;
import com.hierarchycm.gxt.client.model.LoginInfo;
import com.hierarchycm.gxt.client.model.ObjectInstance;
import com.hierarchycm.gxt.client.model.ObjectType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class AllPersonalities extends LayoutContainer implements InstanceChangeNotifyable {
	
	 TabPanel allPersonalitiesTabs;
	 TabItem createTab;
	 
	 ArrayList <PersonalityContainer> persList = new  ArrayList<PersonalityContainer> () ;
	
	 @Override  
	  protected void onRender(Element parent, int pos) {  
	    super.onRender(parent, pos);  
	    setLayout(new FitLayout());	    
	    this.setBorders(false);
        
	    //LoginInfo li = GlobalRegistry.clientSession;
	    //ObjectTypeTree mainPersonality = li.personalities.get(li.defaultPersonalityId);
	    
	    allPersonalitiesTabs = new TabPanel();  
	    allPersonalitiesTabs.setBorders(false);
	    allPersonalitiesTabs.setBodyBorder(true);
	    allPersonalitiesTabs.setBorderStyle(false);	    

	    for (ObjectTypeTree pers : GlobalRegistry.clientSession.personalities.values()) {
			TabItem newTab = new TabItem(pers.getObjInstance().instanceName);  
			newTab.setBorders(false);
			newTab.setId(pers.getObjInstance().instanceId);
			newTab.setLayout(new FitLayout());
			PersonalityContainer pcInst = new PersonalityContainer(pers);
			persList.add(pcInst);
			newTab.add(pcInst);    	   
			allPersonalitiesTabs.add(newTab);
	 	}
	    
	    GlobalRegistry.allPersonalitiesTabs = allPersonalitiesTabs;
	    
	    createTab = new TabItem("+");	    
	    createTab.setLayout(new FitLayout());
	    
	    createTab.add(new GenericCreateChild(GlobalRegistry.clientSession.getRootOtt(), this));	    
	    allPersonalitiesTabs.add(createTab);	    
	    add(allPersonalitiesTabs);	   
	    
	 }

	@Override
	public void instanceChangeNotification(ObjectTypeTree oldParent, ObjectTypeTree newParent, boolean purgeChildren) {
		ObjectTypeTree newItem = (ObjectTypeTree)newParent.getChild(0);
		TabItem newTab = new TabItem(newItem.getObjInstance().instanceName);  
	    newTab.setBorders(false);
	    newTab.setId(newItem.getObjInstance().instanceId);
	    newTab.setLayout(new FitLayout());	
	    newTab.add(new PersonalityContainer(newItem));
	    GlobalRegistry.clientSession.personalities.put(newItem.getObjInstance().instanceId, newItem);	    
	    allPersonalitiesTabs.insert(newTab, allPersonalitiesTabs.indexOf(createTab));
	    allPersonalitiesTabs.setSelection(newTab);
	    
	    
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree itemChanged) {
		// TODO Auto-generated method stub
		
	}
}
