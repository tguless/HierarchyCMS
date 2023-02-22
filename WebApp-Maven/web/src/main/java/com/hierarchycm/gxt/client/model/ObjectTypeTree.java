/*
 * Ext GWT - Ext for GWT
 * Copyright(c) 2007-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */
package com.hierarchycm.gxt.client.model;

import java.io.Serializable;
import java.util.List;

import com.extjs.gxt.ui.client.data.BaseTreeModel;
import com.extjs.gxt.ui.client.data.ModelData;

public class ObjectTypeTree extends BaseTreeModel implements Serializable {

	private ObjectInstance oi = null;
	private ObjectType ot = null;
	  
	public ObjectTypeTree() {
	}

	public ObjectInstance getObjInstance() {
		return oi;
	}

	public ObjectType getObjectType() {
		return ot;
	}

	public ObjectTypeTree(ObjectType ot, BaseTreeModel[] children) {
		this.ot = ot;
		this.set("id", ot.typeId);
		this.set("name", ot.typeName);
		this.set("typeCategory", ot.typeCategory);
		for (int i = 0; i < children.length; i++) {
			add(children[i]);
		}
	}

	public ObjectTypeTree(ObjectType ot) {
		this.ot = ot;
		this.set("id", ot.typeId);
		this.set("name", ot.typeName);
		this.set("typeCategory", ot.typeCategory);
	}

	public ObjectTypeTree(ObjectInstance oi) {
		this.oi = oi;
		this.set("id", oi.instanceId);
		this.set("name", oi.instanceName);
		this.set("friendlyText", NaturalLanguageTranslator.transObjectInstance(oi));
		if (oi.type != null)
			this.set("typeCategory", oi.type.typeCategory);
		this.set("when_updated", oi.when_updated);
	}

	public ObjectTypeTree(ObjectInstance oi, BaseTreeModel[] children) {
		this.oi = oi;
		this.set("id", oi.instanceId);
		this.set("name", oi.instanceName);
		this.set("typeCategory", oi.type.typeCategory);
		for (int i = 0; i < children.length; i++) {
			add(children[i]);
		}
	}
	
	public void fixMissingElements() {
		if (this.getObjInstance().parent != null) {			
			this.getObjInstance().parent.olt.parentType = ((ObjectTypeTree)this.getParent()).getObjInstance().type;
			this.getObjInstance().parent.olt.childType = ((ObjectTypeTree)this).getObjInstance().type;
			this.getObjInstance().parent.parent = ((ObjectTypeTree)this.getParent()).getObjInstance();		
			this.getObjInstance().parent.child = this.getObjInstance();
		}
	}

	
}
