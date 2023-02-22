package com.hierarchycm.gxt.client.model;

import java.io.Serializable;
import java.util.HashMap;

public class ObjectType implements Serializable, ParentInterface <ObjectType> {
	 public String tblName;
	 public String tblSchema;
	 public String typeName;
	 public String typeId;
	 public String typeCategory;
	 
	 @Deprecated
	 public boolean isImageType;
	 
	 public HashMap<String, ColumnInfo> uniqueFieldSchema;
	 
	 public HashMap<String, ObjectType> children;
	 
	 public ObjectLinkType parent;

	@Override
	public HashMap <String, ObjectType> getChildren() {
		return children;
	}

	@Override
	public void setChildren(HashMap <String, ObjectType> children) {
		this.children = children;		
	}
	 
}
