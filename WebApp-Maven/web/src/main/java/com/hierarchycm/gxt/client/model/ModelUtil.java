package com.hierarchycm.gxt.client.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;


public class ModelUtil {
	public static void convObjectTypeObjTypeTree(ObjectType currentObject, ObjectTypeTree parent ) {
		
		Collection<ObjectType> currentObjectChildren = new ArrayList<ObjectType>(currentObject.children.values());		
				
		parent.set("tableName", currentObject.tblName);
		
		Iterator <ObjectType> iter = currentObjectChildren.iterator();
		
		while (iter.hasNext()) {
			
			ObjectType currObjHierRec = iter.next();
			 
			ObjectTypeTree newChild = new ObjectTypeTree(currObjHierRec);
			parent.add(newChild);
			
			if (currObjHierRec.children != null) {
				convObjectTypeObjTypeTree(currObjHierRec, newChild);			
			} 
		}		
	}
	
	
	public static void convObjectInstanceObjTypeTree(ObjectInstance currentObject, ObjectTypeTree parent ) {
		
		Collection<ObjectInstance> currentObjectChildren = new ArrayList<ObjectInstance>(currentObject.children.values());		
		
		if (currentObject != null && currentObject.type != null && currentObject.type.tblName != null) {
			parent.set("tableName", currentObject.type.tblName);
		}
		
		Iterator <ObjectInstance> iter = currentObjectChildren.iterator();
		
		while (iter.hasNext()) {
			
			ObjectInstance currObjHierRec = iter.next();
			 
			ObjectTypeTree newChild = new ObjectTypeTree(currObjHierRec);
			parent.add(newChild);
			
			if (currObjHierRec.children != null) {
				convObjectInstanceObjTypeTree(currObjHierRec, newChild);			
			} 
		}		
	}
}
