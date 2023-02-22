package com.hierarchycm.gxt.client.create;

import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.hierarchycm.gxt.client.InstanceChangeNotifyable;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class CreateChildInstanceDialog extends com.extjs.gxt.ui.client.widget.Window  {
	
	CreateChildInstancePanel createPanel;
	
	public CreateChildInstanceDialog (InstanceChangeNotifyable instanceChangeNotifyListener) {
		setLayout(new FitLayout());
		createPanel  =new CreateChildInstancePanel (instanceChangeNotifyListener, (com.extjs.gxt.ui.client.widget.Window)this); 
		add(createPanel);
	}

	public void loadItem(ObjectTypeTree currentFolder, ObjectLinkType olt) {
		createPanel.loadItem(currentFolder, olt);
	}
}
