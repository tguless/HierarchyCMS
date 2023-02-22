package com.hierarchycm.gxt.client.viewers;

import java.util.List;

import com.extjs.gxt.ui.client.data.ModelData;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public interface MultiSelectable {
	public ModelData getSelectedItem();
	public List<ModelData> getSelectedItems();	
	public void removeFromStore(ModelData objToRemove);
	public int getStoreItemCount();
	public void filterStore(String filter); 
}
