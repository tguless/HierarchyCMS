package com.hierarchycm.gxt.server.jpa.entities;

import java.io.Serializable;

public class ObjectLinkTypeEntity  extends ObjectLinkTypePermissions  implements Serializable{
	
	 public ObjectTypeEntity parentType = new ObjectTypeEntity();
	 public ObjectTypeEntity childType = new ObjectTypeEntity();
	
	 public String linkTblName;
	 public String linkTblSchema;
	 public String linkTypeName;
	 public String linkTypeId;
	 
}
