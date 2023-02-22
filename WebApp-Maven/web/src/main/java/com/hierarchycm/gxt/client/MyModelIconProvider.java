package com.hierarchycm.gxt.client;

import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.data.ModelIconProvider;
import com.extjs.gxt.ui.client.store.TreeStore;
import com.google.gwt.resources.client.ImageResource;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.AbstractImagePrototype;
import com.hierarchycm.gxt.shared.ProjectConstants;

public class MyModelIconProvider <M extends ModelData>  implements ModelIconProvider <M>{

	@Override
	public AbstractImagePrototype getIcon(ModelData model) {
		// TODO Auto-generated method stub
		//Window.alert("this actually gets called");
		
		if (model.get("typeCategory") != null && 
				(
				 model.get("typeCategory").equals(ProjectConstants.imageCategory) ||
				 model.get("typeCategory").equals(ProjectConstants.videoCategory)
				)
			){
			
			return AbstractImagePrototype.create(new ObjectTypeTreeImageResource(model));
		}
		return null;
	}
}
