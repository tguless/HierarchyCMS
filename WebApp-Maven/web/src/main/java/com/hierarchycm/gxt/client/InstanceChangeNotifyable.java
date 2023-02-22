package com.hierarchycm.gxt.client;

import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public interface InstanceChangeNotifyable {
	public void instanceChangeNotification(ObjectTypeTree oldParent, ObjectTypeTree newParent, boolean purgeChildren);	
	public void instanceChangeNotification(ObjectTypeTree itemChanged);
}
