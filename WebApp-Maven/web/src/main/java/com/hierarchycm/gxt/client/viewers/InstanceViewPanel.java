package com.hierarchycm.gxt.client.viewers;

import com.hierarchycm.gxt.client.InstanceChangeNotifyable;
import com.hierarchycm.gxt.client.ObjInstanceLinkContainer;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public interface InstanceViewPanel extends ObjInstanceLinkContainer,  InstanceChangeNotifyable {
	
	public boolean moveForward();
	public boolean moveBackward();
	public void setObjectTypeTree(ObjectTypeTree ott);
		
}
