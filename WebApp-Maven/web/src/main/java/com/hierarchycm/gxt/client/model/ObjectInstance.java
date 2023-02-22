package com.hierarchycm.gxt.client.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class ObjectInstance implements Serializable, ParentInterface <ObjectInstance> {
	
	private static final long serialVersionUID = -7026074041303425656L;
	
	public ObjectType type;
	
	public String instanceName;
	public String instanceId;
	
	public ObjectInstance owner;
	
	public Date when_created;
	public Date when_updated;
	
	public ArrayList <ObjectInstance> profilesHoldingInstance;
	 
	public HashMap <String, String> uniqueFieldData = new HashMap <String, String> () ;
	 
	public ObjectInstLink parent = null;
	 
	public HashMap<String, ObjectInstance> children= new HashMap <String, ObjectInstance> ();
	
	@Override
	public HashMap <String, ObjectInstance> getChildren() {
		return children;
	}
	
	@Override
	public void setChildren(HashMap <String, ObjectInstance> children) {
		this.children = children;		
	}
	 
}
