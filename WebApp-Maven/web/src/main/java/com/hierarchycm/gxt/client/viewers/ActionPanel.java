package com.hierarchycm.gxt.client.viewers;

import static com.calclab.emite.core.client.xmpp.stanzas.XmppURI.uri;

import java.util.List;

import com.calclab.emite.core.client.xmpp.stanzas.XmppURI;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.ComponentEvent;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.FieldEvent;
import com.extjs.gxt.ui.client.event.KeyListener;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.store.ListStore;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.util.Padding;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.ListViewSelectionModel;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.form.TextField;
import com.extjs.gxt.ui.client.widget.layout.HBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.HBoxLayout.HBoxLayoutAlign;
import com.extjs.gxt.ui.client.widget.layout.HBoxLayoutData;
import com.extjs.gxt.ui.client.widget.selection.AbstractSelectionModel;
import com.extjs.gxt.ui.client.widget.selection.SelectionModel;
import com.google.gwt.event.dom.client.KeyCodes;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.KeyboardListener;
import com.hierarchycm.gxt.client.GlobalRegistry;
import com.hierarchycm.gxt.client.InstanceChangeNotifyable;
import com.hierarchycm.gxt.client.commands.DeleteObjectInstanceCommand;
import com.hierarchycm.gxt.client.commands.DeleteObjectInstanceLinkCommand;
import com.hierarchycm.gxt.client.create.CreateChildInstanceDialog;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectInstance;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class ActionPanel extends LayoutContainer {
	
	HBoxLayoutData flex;
	
	MultiSelectable selModel = null;
	
	InstanceChangeNotifyable icNotifyable;
	
	ObjectTypeTree ott;

	private boolean includeEditDelete =false;

	private String filterType;

	private String typeId;

	private Button loadingButton;

	private boolean includeFilter = true;

	ActionPanel(ObjectInstLink oil, String filterType, InstanceChangeNotifyable icNotifyable) {		
		this.icNotifyable = icNotifyable;
		this.typeId = oil.child.type.typeId;
		this.filterType = filterType;		
	}

	public ActionPanel(ObjectTypeTree ott, String filterType, InstanceChangeNotifyable icNotifyable) {
		this.icNotifyable = icNotifyable;
		this.ott = ott;
		this.typeId = ott.getObjInstance().type.typeId;
		this.filterType = filterType;		
	}
	
	public ActionPanel(ObjectTypeTree ott, String filterType, InstanceChangeNotifyable icNotifyable, boolean includeEditDelete, MultiSelectable selModel) {
		this.includeEditDelete = includeEditDelete;
		this.icNotifyable = icNotifyable;
		this.ott = ott;
		this.selModel = selModel;
		this.typeId = ott.getObjInstance().type.typeId;
		this.filterType = filterType;
		
		loadActions();
	}
	
	@Deprecated
	//This is not a true reflection of the actions allowed, using the object type tree constructor gives the correct result
	ActionPanel(String typeId, String filterType) {	 		
		this.typeId = ott.getObjInstance().type.typeId;
		this.filterType = filterType;
		loadActions();
	}
		
		
	public void  loadActions() {
		doInitialConfig();

	}
	
	public void doInitialConfig() {
			
			HBoxLayout layout = new HBoxLayout();  
	        layout.setPadding(new Padding(5));  
	        layout.setHBoxLayoutAlign(HBoxLayoutAlign.TOP);  
	        setLayout(layout);  
	        flex = new HBoxLayoutData(new Margins(0, 5, 0, 0));  
	        flex.setFlex(1);  
	        loadingButton = new Button("Loading");
	        add(loadingButton);
	        //this.setHeight(100);
	        
	}

	public void refresh() {
		remove(loadingButton);
		ObjectLinkType thisolt = null;		
        if (typeId!=null) {
	        for (final ObjectLinkType olt : GlobalRegistry.serverInfo.typeSubtypes.get(typeId).values()) {
	        	Button button = null;
	        	
	        	if (filterType == null || filterType.equals("")) {
	        		button = new Button(olt.linkTypeCreateText);
	        	} else {
	        		if (olt.childType.typeId.equals(filterType)) {
	        			thisolt =olt;
	        			button = new Button(olt.linkTypeCreateText);
	        		}
	        	}
	        	
	        	if (button != null) {	        		
	        		if (this.ott != null && this.icNotifyable != null) {
		        		button.addListener(Events.Select,	new SelectionListener<ButtonEvent>() {
        					@Override
        					public void componentSelected(ButtonEvent ce) {
        						new CreateChildInstanceDialog(icNotifyable).loadItem(ott, olt);		        						
        					}
		        		});
	        		}
	        		add(button, flex);
	        	}
	        } 
	        
	        
	        if (includeEditDelete && selModel.getStoreItemCount() > 0) {
	        	/*
	        	Button editButton = new Button("Edit " + thisolt.childType.typeName );
	        	add(editButton, flex);
	        	*/
	        	Button deleteButton = new Button ("Delete "+thisolt.childType.typeName );
	        	add(deleteButton, flex);
	        	deleteButton.addListener(Events.Select,	new SelectionListener<ButtonEvent>() {
					@Override
					public void componentSelected(ButtonEvent ce) {
						ObjectTypeTree selOtt = (ObjectTypeTree)selModel.getSelectedItem();		
						List<ModelData> selected = selModel.getSelectedItems();
						for (final ModelData sel : selected) {								
							ObjectInstance oi = ((ObjectTypeTree) sel).getObjInstance();
							ObjectInstance oiparent = ((ObjectTypeTree)((ObjectTypeTree)sel).getParent()).getObjInstance();
							
							if (
								GlobalRegistry.isPersonalityType(oi.type.typeId) &&  
								GlobalRegistry.isOidMyPersonality(oiparent.instanceId)
							) {
								XmppURI xmppUri = uri(String.valueOf(oi.instanceId)+"@" + GlobalRegistry.serverInfo.chatServer);
								GlobalRegistry.getLoginXmppMap().get(oiparent.instanceId).xmppRoster.requestRemoveItem(xmppUri);																
							}
								
							
							
							new DeleteObjectInstanceLinkCommand(oi.parent.instanceLinkId).execute();
							new DeleteObjectInstanceCommand(oi.instanceId, oi.type.typeId).execute();
							selModel.removeFromStore(sel);
						}
					}
	        	});
	        	
	        }
	        
	        if (includeFilter && selModel.getStoreItemCount() > 1) {
	        	
	        	final TextField<String> filter = new TextField<String>();
	        	filter.setEmptyText("Type your search filter here");
	        	
	        	//app event
	        	filter.addKeyListener(new KeyListener() {
	                public void componentKeyUp(ComponentEvent event) {
	                	//if(event.getKeyCode() == KeyCodes.KEY_ENTER) {
	                		selModel.filterStore(filter.getValue());
	                		
	                		//Window.alert("Filtering by " + filter.getValue() + "%" );
	                	//}
	                }
	        	}); 
	        	
	        	/*
	        	filter.addListener(Events.Change, new Listener<FieldEvent>() {
	                public void handleEvent(FieldEvent fe) {
	                	Window.alert("Filtering by " + filter.getValue() + "%" );
	                }
	            });
	            */

	        	

	        	
	        	add(filter, flex);
	        }
        }
	}	
	

}
