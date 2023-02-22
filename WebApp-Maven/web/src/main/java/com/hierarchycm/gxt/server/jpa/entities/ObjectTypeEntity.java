package com.hierarchycm.gxt.server.jpa.entities;

import java.io.Serializable;
import java.util.HashMap;

public class ObjectTypeEntity implements Serializable, ParentInterface <ObjectTypeEntity> {
	 public String tblName;
	 public String tblSchema;
	 public String typeName;
	 public String typeId;
	 public boolean isImageType;
	 
	 public HashMap<String, ColumnInfo> uniqueFieldSchema;
	 
	 public HashMap<String, ObjectTypeEntity> children;
	 
	 public ObjectLinkTypeEntity parent;

	@Override
	public HashMap <String, ObjectTypeEntity> getChildren() {
		return children;
	}

	@Override
	public void setChildren(HashMap <String, ObjectTypeEntity> children) {
		this.children = children;		
	}
	 
}
