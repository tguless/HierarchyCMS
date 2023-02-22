package com.hierarchycm.gxt.client.viewers;

import static com.calclab.emite.core.client.xmpp.stanzas.XmppURI.uri;

import java.util.ArrayList;
import java.util.HashMap;

import com.calclab.emite.core.client.xmpp.stanzas.XmppURI;
import com.extjs.gxt.ui.client.Style.Orientation;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.event.ComponentEvent;
import com.extjs.gxt.ui.client.util.KeyNav;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.FlowLayout;
import com.extjs.gxt.ui.client.widget.layout.RowData;
import com.extjs.gxt.ui.client.widget.layout.RowLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayoutData;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout.VBoxLayoutAlign;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.GlobalRegistry;
import com.hierarchycm.gxt.client.InstanceChangeNotifyable;
import com.hierarchycm.gxt.client.ObjInstanceLinkContainer;
import com.hierarchycm.gxt.client.commands.ErrorHandlingAsyncCallback;
import com.hierarchycm.gxt.client.commands.GetInstanceDetailsCommand;
import com.hierarchycm.gxt.client.commands.GetInstanceDetailsCommandByInstId;
import com.hierarchycm.gxt.client.commands.GetInstanceHierarchyCommand;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectInstance;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.shared.ProjectConstants;

public class ObjectInstanceViewerPanel extends LayoutContainer implements  ObjInstanceLinkContainer, InstanceChangeNotifyable {
	 
	ObjectTypeTree ott;
	ObjectInstLink oil;
	VBoxLayoutData flex;
	InstanceViewPanel viewPanel = null;
	
	ArrayList <ObjectInstanceViewerPanel> childViewerPanels = null; 

	ImageView imageView = null;
	VideoView videoView = null;
	AlbumViewWrapper albumView = null;
	private AlbumViewWrapper parentAlbumView;
	AutoExpandGrid commentView = new AutoExpandGrid();
	PersonalityViewer personalityTabs = null;
	ActionPanel actionPanel;

	static final int  tagsYaxisFudge = 30;
	
	
	private static final int heightComp = 61;
	private static final int widthComp = 16;

	com.extjs.gxt.ui.client.widget.Window parentWindow = null;

	private String filterType;
	private String itemTypeId;
	private String typeCategory;
	private String oilId = null;
	private ObjectTypeTree currentFolder;
	
	AsyncCallback <ObjectTypeTree> instHeirCallback = new ErrorHandlingAsyncCallback<ObjectTypeTree>() {
		@Override
		public void onSuccess(ObjectTypeTree result) {
			
			viewPanel.setObjectTypeTree(result);
			
			ObjectInstanceViewerPanel.this.unmask();
			
			if(parentWindow!=null) {					
				if (parentWindow.isRendered()) {
					parentWindow.center();
					parentWindow.show();
				} else {
					parentWindow.show();
					parentWindow.center();
				}		
			}
			
			if (actionPanel != null) {
				actionPanel.refresh();
			}
			
			layout();
			
		}			
	};
	
	GetInstanceHierarchyCommand instHierCommand = new GetInstanceHierarchyCommand(instHeirCallback);

	AsyncCallback <ObjectInstLink> instDetailsCallback = new ErrorHandlingAsyncCallback<ObjectInstLink>() {
		@Override
		public void onSuccess(ObjectInstLink result) {				
			setObjectInstanceLink(result);		
			
			if (parentWindow != null) {
				parentWindow.setHeading(oil.child.instanceName);
			}
						
			if(oil.olt.childType.typeCategory.toUpperCase().equals("VIDEO") 
			   || oil.olt.childType.typeCategory.toUpperCase().equals("PHOTO")
			) {			
				if (oil.child.uniqueFieldData.get("height")!= null) { 
					
					if (parentWindow!=null) {
						int height = Integer.valueOf(oil.child.uniqueFieldData.get("height"));
						int width = Integer.valueOf(oil.child.uniqueFieldData.get("width"));										
						if (height > 0 && width > 0)  {						
							if (height < 801 && width<801) {
								parentWindow.setHeight(height+heightComp+ObjectInstanceViewerPanel.tagsYaxisFudge);								
								parentWindow.setWidth(width+widthComp);
							} else if (height > width) {
								//reset the height that might have shrunk because of landscape photos
								parentWindow.setHeight(GlobalRegistry.serverInfo.defaultPopupHeight + heightComp);
							} else if (width > height) {
								//reset the width that might have shrunk because of portrait photos								
								parentWindow.setWidth(GlobalRegistry.serverInfo.defaultPopupWidth + widthComp);
							}
						} 						
					}
				}	
				//ObjectInstanceViewerPanel.this.unmask();
			} else if(oil.olt.childType.typeCategory.toUpperCase().equals("ALBUM")						
					  ) {													
				//instHierCommand.execute(oil.child.instanceId, 2, filterType);
			} else if (
						GlobalRegistry.isPersonalityType(oil.olt.childType.typeId) && 
						(filterType == null || filterType.equals(""))  
			          ) 
			{				
				//Do nothing
				//ObjectInstanceViewerPanel.this.unmask();
			} else {
				//instHierCommand.execute(oil.child.instanceId, 2, filterType);
			}
				
			instHierCommand.execute(oil.child.instanceId, 2, filterType);
			ObjectInstanceViewerPanel.this.unmask();
			
			if(parentWindow!=null) {					
				if (parentWindow.isRendered()) {
					parentWindow.center();
					parentWindow.show();
				} else {
					parentWindow.show();
					parentWindow.center();
				}		
			}
		}			
	};
	
	GetInstanceDetailsCommand getInstDetailsCom = new GetInstanceDetailsCommand(instDetailsCallback);
	GetInstanceDetailsCommandByInstId getInstDetailsByInstIdCom =  new GetInstanceDetailsCommandByInstId(instDetailsCallback);
	
	public ObjectInstanceViewerPanel() {			
		doInitialConfig();        
	}

	KeyNav keyNav = new KeyNav<ComponentEvent>(parentWindow)  {			
		@Override public void onLeft(ComponentEvent ce) {				
			viewPanel.moveBackward(); 
		}
		
		@Override public void onRight(ComponentEvent ce) {
			viewPanel.moveForward();				
		}
	};
	
	public void doInitialConfig() {		
		
        VBoxLayout layout = new VBoxLayout();  
        layout.setVBoxLayoutAlign(VBoxLayoutAlign.STRETCH);
        this.setLayout(layout);    
        flex = new VBoxLayoutData(new Margins(0,0,0,0));          
        flex.setFlex(1);
        this.setScrollMode(Scroll.AUTOY);
        
        if (parentWindow != null) {
        	keyNav.bind(parentWindow);
        }
	}
	
	public ObjectInstanceViewerPanel(com.extjs.gxt.ui.client.widget.Window parentWindow) {				 
		this.parentWindow = parentWindow; 
		doInitialConfig();	
	}

	public void loadItem(ObjectTypeTree folder) {
		loadItem (folder, null);		
	}
	
	public void loadItem(ObjectTypeTree ott, String filter) {			
		this.ott = ott;						
		ott.fixMissingElements();
		loadItem(ott.getObjInstance().parent, filter);
	}	
	
	public void loadItem(ObjectInstLink oil, String filter) {
		this.oil = oil;
		this.filterType = filter;
		loadItem();
	}
	
	private void loadItem() {		
		
		if(oil != null ) {
			oilId = oil.instanceLinkId;
			this.itemTypeId =  oil.child.type.typeId;
			if (oil.child.type != null && oil.child.type.typeCategory != null) {
				this.typeCategory =  oil.child.type.typeCategory;
			} else {
				typeCategory = "default";
			}
		} else {
			typeCategory = ott.getObjInstance().type.typeName;
		}

		 this.removeAll();		 
		 
		 if  (
					GlobalRegistry.isPersonalityType(itemTypeId) && 
					(filterType == null || filterType.equals(""))  
		      ) 
		 {						 
			 personalityTabs = new PersonalityViewer();					
			 viewPanel = (InstanceViewPanel)personalityTabs;
			 add(personalityTabs, flex);
			 if (parentWindow != null) {
				 parentWindow.show();
			 }
			
		 } else if (typeCategory.equals(ProjectConstants.imageCategory)) {		
			 //This container is going to display a photo / image			 
			 if (imageView == null)
				 imageView = new ImageView (parentWindow, parentAlbumView, this);			   			 
			 viewPanel = (InstanceViewPanel)imageView;			
			 add(new ActionPanel(ott, filterType,  this));
			 add(imageView);			 
			 layout();
		 } else if (typeCategory.equals(ProjectConstants.videoCategory)) {
			 //This container is going to display a video
			 if (videoView == null)
				 videoView = new VideoView();		 	
			 viewPanel = (InstanceViewPanel)videoView;
			 add(videoView, flex);			 
		 } else if ( typeCategory.equals(ProjectConstants.albumCategory) && 
					(filterType == null || filterType.equals(""))) {
			//This container is going to display all the subtypes of the photo album
			setLayout(new FitLayout());
			HashMap<String, ObjectLinkType> typeSubtypes =GlobalRegistry.serverInfo.typeSubtypes.get(ott.getObjInstance().type.typeId); 
			LayoutContainer lc1 = new LayoutContainer();
			lc1.setLayout(new RowLayout(Orientation.VERTICAL));
			lc1.setScrollMode(Scroll.ALWAYS);
			
			if (childViewerPanels == null && typeSubtypes !=null && typeSubtypes.size() > 0) {
				childViewerPanels = new ArrayList<ObjectInstanceViewerPanel>();
			}
			
			for (ObjectLinkType lolt : typeSubtypes.values()) {								
				ObjectInstanceViewerPanel oivp = new ObjectInstanceViewerPanel();
				childViewerPanels.add(oivp);
				oivp.setLayout(new RowLayout()); //if we don't do row layout, the component sizes are collapsing			
				oivp.setBorders(false);
				oivp.loadItem(ott, lolt.childType.typeId);
				lc1.add(oivp, new RowData(.98, -1, new Margins(4)));
			}
			add(lc1, flex);
			parentWindow.show();
			
			
		 } else if ( filterType != null && filterType.equals("12")  ) {
			 //This container is going to display a comments section. 			 
			 if (commentView == null)
				 commentView = new AutoExpandGrid(); 
			 viewPanel = (InstanceViewPanel)commentView;
			 actionPanel =new ActionPanel(ott, filterType,  this, true, commentView); 
			 if (getLayout().getClass().getName().equals("com.extjs.gxt.ui.client.widget.layout.VBoxLayout")) {				 
				 add(actionPanel);
				 add(commentView, flex);				 
			 } else{				
				 add(commentView, new RowData(.98, -1, new Margins(4))); 
				 add(actionPanel, new RowData(.98, -1, new Margins(4)));				 
			 }
		 } else {			 			
			 if (albumView == null)
				 albumView = new AlbumViewWrapper(); 
			 
			 viewPanel = (InstanceViewPanel)albumView;
			 actionPanel = new ActionPanel(ott, filterType,  this, true, albumView);
			 if (getLayout().getClass().getName().equals("com.extjs.gxt.ui.client.widget.layout.VBoxLayout")) {	
				 add(actionPanel);				 
				 add(albumView, flex);
			 } else {				 
				 add(albumView, new RowData(.98, -1, new Margins(4)));
				 add(actionPanel, new RowData(.98, -1, new Margins(4)));				
			 }
		 }

		 if (viewPanel != null){
			 this.mask();
			 viewPanel.setObjectTypeTree(ott);
			 if (oilId != null) {
				 getInstDetailsCom.execute(oilId);
			 } else {
				 getInstDetailsByInstIdCom.execute(oil.child.instanceId);
			 }
		 }
		 		 
	 }

	@Override
	public ObjectInstLink getObjectInstanceLink() {
		return oil;
	}

	@Override
	public void setObjectInstanceLink(ObjectInstLink objectInstanceLink) {
		oil = objectInstanceLink;
		if (viewPanel != null) {
			viewPanel.setObjectInstanceLink(oil);
		}
	}

	
	@Override
	public void instanceChangeNotification(ObjectTypeTree itemChanged) {		
		currentFolder = itemChanged;
		
		AsyncCallback <ObjectTypeTree> callback = new ErrorHandlingAsyncCallback <ObjectTypeTree> (){
			@Override
			public void onSuccess(ObjectTypeTree result) {
				instanceChangeNotification(currentFolder, (ObjectTypeTree)result.getChild(0), true);				
			}
		};
		
		GetInstanceHierarchyCommand instHierCommand = new GetInstanceHierarchyCommand(callback);		
		if (filterType == null)
			instHierCommand.execute(itemChanged.getObjInstance().instanceId);
		else 
			instHierCommand.execute(itemChanged.getObjInstance().instanceId, 2, filterType);		
		if (viewPanel!=null) {
			viewPanel.instanceChangeNotification(itemChanged);
		}
	}
	
	@Override
	public void instanceChangeNotification(ObjectTypeTree oldParent, ObjectTypeTree newParent, boolean purgeChildren) {				
		
		
		for (ModelData item : newParent.getChildren() ) {
			ObjectTypeTree lott = (ObjectTypeTree)item;
			ObjectTypeTree lparent = (ObjectTypeTree)lott.getParent();
			if (
					GlobalRegistry.isPersonalityType(lott.getObjInstance().type.typeId) &&  
					GlobalRegistry.isOidMyPersonality(lparent.getObjInstance().instanceId)
				) {
					XmppURI xmppUri = uri(String.valueOf(lott.getObjInstance().instanceId)+"@" + GlobalRegistry.serverInfo.chatServer);
					GlobalRegistry.getLoginXmppMap().get(lparent.getObjInstance().instanceId).xmppRoster.requestAddItem(xmppUri, lott.getObjInstance().instanceName);																
				}

		}
		
		if (viewPanel!=null) {
			viewPanel.instanceChangeNotification(oldParent, newParent, purgeChildren);
		}
	}

	public void loadAlbumItem(ObjectTypeTree folder, AlbumViewWrapper albumView) {
		this.parentAlbumView = albumView;
		loadItem(folder);		
	}


}
