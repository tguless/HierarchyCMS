package com.hierarchycm.gxt.client.viewers;

import com.extjs.gxt.ui.client.Style.SortDir;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.event.BaseEvent;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.store.ListStore;
import com.extjs.gxt.ui.client.widget.ListView;
import com.hierarchycm.gxt.client.InstanceChangeNotifyable;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class AlbumView  extends  ListView <ModelData> implements InstanceViewPanel {
	 
	ObjectInstLink oil;
	private ObjectTypeTree ott;	
	AlbumViewWrapper avw = null;
		
	public static native String getLocalTemplate() /*-{  
    return ['<tpl for=".">',  
    '<div class="thumb-wrap" style="display:table;border: 1px solid #DDDDDD;float:left;margin:4px 0 4px  4px; padding:2px;width:100px;height:150px;">', 
    '<div style="align:center;display:table-cell;vertical-align:middle;color:black;padding-bottom:2px;"><center><img src="/DisplayBlob?imageId={id}&imageType=smallpic" /><br>{name}</center></div>',  
    '</div>',  
    '</tpl>',  
    ''].join("");       
	}-*/;  
		
	public AlbumView(AlbumViewWrapper avw) {
		   this.avw = avw;
		   initialize();		   
	}

	private void initialize() {
		//setLayout(new FitLayout());
		setTemplate(AlbumView.getLocalTemplate());
		setItemSelector("div.thumb-wrap");
		addListener(Events.OnDoubleClick, new Listener<BaseEvent>() {
				public void handleEvent(final BaseEvent bee) {
				ObjectTypeTree folder = (ObjectTypeTree) getSelectionModel().getSelectedItem();	
				folder.set("itemPosition", store.indexOf(folder));
				folder.set("maxPosition", store.getCount());								
				new ObjectInstanceViewerWindow().loadAlbumItem(folder, avw);
			}
		});		
	}
	
	public ObjectTypeTree getObjectTypeTreeAt(int index) {
		ObjectTypeTree result = (ObjectTypeTree)store.getAt(index);
		result.set("itemPosition", index);
		result.set("maxPosition", store.getCount());
		return result;
	}
	
	public int getLastPosition(int index) {
		return store.getCount();
	}
	
	@Override
	public ObjectInstLink getObjectInstanceLink() {
		return oil;
	}

	@Override
	public void setObjectInstanceLink(ObjectInstLink objectInstanceLink) {
		this.oil = objectInstanceLink;
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree oldParent, ObjectTypeTree newParent, boolean purgeChildren) {		    
		if (getStore()!= null) {
			if (purgeChildren == true) {
				getStore().removeAll();
			}
		    getStore().add(newParent.getChildren()); 	
		    getStore().sort("name", SortDir.ASC);
	    }		    
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree itemChanged) {
	
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
	
		ListStore<ModelData> childInstList = new ListStore<ModelData>(); 			
		
	 	if (ott.getChild(0) != null){
	 		 childInstList.add(((ObjectTypeTree)ott.getChild(0)).getChildren());
	 	}
		setStore(childInstList); 			
	}
	

}
