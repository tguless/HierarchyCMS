package com.hierarchycm.gxt.client.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.extjs.gxt.ui.client.data.ModelData;  

public class ObjectInstLink  implements Serializable {
//, ModelData  {


	public String instanceLinkId;
	 
	public ObjectLinkType olt = new ObjectLinkType();
	 
	public ObjectInstance child = new ObjectInstance(); 
	public ObjectInstance parent = new ObjectInstance(); ;
	 
	public Boolean parentApproved;
	public Boolean childApproved;
	
	static ArrayList<String> properties = new ArrayList<String>();
	
	public Date whenUpdated;
	public Date whenCreated;
	
	public ObjectInstance owner = new ObjectInstance();
	
/*
	
	@Override
	public Object get(String property) {
		if (property.equals("parentApproved")) {
			return parentApproved;
		} else if (property.equals("childApproved")) {
			return childApproved;			
		} else if (property.equals("parent")) {
			return parent;			
		} else if (property.equals("child")) {
			return child;
		} else if (property.equals("olt")) {
			return olt;
		} else if (property.equals("instanceLinkId")) {
			return instanceLinkId;
		}
		
		return null;
	}
	
	@Override
	public Map<String, Object> getProperties() {
		
		Map<String, Object> properties = new HashMap<String, Object>();
		
		properties.put("parentApproved", parentApproved);
		properties.put("childApproved", childApproved);
		properties.put("parent", parent);
		properties.put("child", child);
		properties.put("olt", olt);
		properties.put("instanceLinkId", instanceLinkId);
			
		return properties;
	}
	
	@Override
	public Collection<String> getPropertyNames() {
		if (properties.size() == 0) {
			properties.add("parentApproved");
			properties.add("childApproved");
			properties.add("parent");
			properties.add("child");
			properties.add("olt");
			properties.add("instanceLinkId");			
		}
		return properties;
	}
	
	@Override
	public Object remove(String property) {
		

		return null;
	}
	
	@Override
	public Object set(String property, Object newValue) {
		Object oldValue = get(property);
		
		if (property.equals("parentApproved")) {
			parentApproved = (Boolean) newValue;
		} else if (property.equals("childApproved")) {
			childApproved = (Boolean) newValue;			
		} else if (property.equals("parent")) {
			parent = (ObjectInstance) newValue;			
		} else if (property.equals("child")) {
			child = (ObjectInstance) newValue;
		} else if (property.equals("olt")) {
			olt = (ObjectLinkType) newValue;
		} else if (property.equals("instanceLinkId")) {
			instanceLinkId = (String) newValue;
		}
		

		return oldValue;
	}
*/	 
}
