package com.hierarchycm.gxt.client.model;

import java.io.Serializable;
import java.util.Date;

public class ObjectLinkType  extends ObjectLinkTypePermissions  implements Serializable{
	
	 public ObjectType parentType = new ObjectType();
	 public ObjectType childType = new ObjectType();
	
	 public String linkTblName;
	 public String linkTblSchema;
	 public String linkTypeName;
	 public String linkTypeCreateText;
	 public String linkTypeId;
	 
	 Date lastUpdateDt;
	 Date createDt;
	 

	 
}
