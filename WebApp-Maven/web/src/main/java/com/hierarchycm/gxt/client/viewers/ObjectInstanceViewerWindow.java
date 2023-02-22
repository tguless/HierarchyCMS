package com.hierarchycm.gxt.client.viewers;


import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.google.gwt.user.client.History;
import com.hierarchycm.gxt.client.GlobalRegistry;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class ObjectInstanceViewerWindow  extends com.extjs.gxt.ui.client.widget.Window  {
	
	ObjectInstanceViewerPanel panel;
	
	public void loadItem(ObjectTypeTree folder) {
		panel.loadItem(folder);
		//this.show();
	}
	
	public ObjectInstanceViewerWindow() {		
		 this.setLayout(new FitLayout());
		 panel = new ObjectInstanceViewerPanel(this);
		 add(panel);
		 setHeight(GlobalRegistry.serverInfo.defaultPopupHeight);
	     setWidth(GlobalRegistry.serverInfo.defaultPopupWidth);	
	}
	

	public void loadAlbumItem(ObjectTypeTree folder, AlbumViewWrapper albumView) {		
		//folder.getObjInstance().instanceId;
		History.newItem(folder.getObjInstance().instanceId);
		panel.loadAlbumItem(folder, albumView);	
		
		loadAlbumItem(folder, albumView, false);
	}
	
	public void loadAlbumItem(ObjectTypeTree folder, AlbumViewWrapper albumView, boolean suppressHistory) {		
		//folder.getObjInstance().instanceId;
		if (!suppressHistory) {
			History.newItem(folder.getObjInstance().instanceId);
		}
		panel.loadAlbumItem(folder, albumView);							
	}
}
