package com.hierarchycm.gxt.client.viewers;

import java.util.List;

import com.extjs.gxt.ui.client.Style.Orientation;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.store.ListStore;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.layout.RowData;
import com.extjs.gxt.ui.client.widget.layout.RowLayout;
import com.extjs.gxt.ui.client.widget.selection.AbstractStoreSelectionModel;
import com.hierarchycm.gxt.client.InstanceChangeNotifyable;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class AlbumViewWrapper extends LayoutContainer implements InstanceViewPanel,  MultiSelectable {
	AlbumView albumView = new AlbumView(this);
	
	AlbumViewWrapper() {	
		setLayout(new RowLayout(Orientation.VERTICAL));				
		add(albumView,  new RowData(.98, -1, new Margins(4)));			
		this.setBorders(false);		
		albumView.setBorders(false);		
		this.setScrollMode(Scroll.AUTOY);		
	}

	@Override
	public ObjectInstLink getObjectInstanceLink() {
		return albumView.getObjectInstanceLink();
		
	}

	@Override
	public void setObjectInstanceLink(ObjectInstLink objectInstanceLink) {
		albumView.setObjectInstanceLink(objectInstanceLink);
		
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree oldParent,
			ObjectTypeTree newParent, boolean purgeChildren) {
		albumView.instanceChangeNotification(oldParent, newParent, purgeChildren);
		
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree itemChanged) {
		albumView.instanceChangeNotification(itemChanged);
		
	}

	@Override
	public boolean moveForward() {
		// TODO Auto-generated method stub
		return albumView.moveForward();		
	}

	@Override
	public boolean moveBackward() {
		// TODO Auto-generated method stub
		return albumView.moveBackward();		
	}

	@Override
	public void setObjectTypeTree(ObjectTypeTree ott) {		
		albumView.setObjectTypeTree(ott);		
	}

	public ObjectTypeTree getObjectTypeTreeAt(int i) {
		return albumView.getObjectTypeTreeAt(i);
	}

	@Override
	public ObjectTypeTree getSelectedItem() {
		return (ObjectTypeTree)albumView.getSelectionModel().getSelectedItem();		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ModelData> getSelectedItems() {
		return albumView.getSelectionModel().getSelectedItems();		
	}

	@Override
	public void removeFromStore(ModelData objToRemove) {
		albumView.getStore().remove(objToRemove);		
	}

	@Override
	public int getStoreItemCount() {
		if (albumView.getStore() == null) return 0;
		else return albumView.getStore().getCount();
	}

	@Override
	public void filterStore(String filter) {
		albumView.getStore().filter("name", filter);		
	}
	
	
}
