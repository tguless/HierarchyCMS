package com.hierarchycm.gxt.client.model;

import java.io.Serializable;

import com.extjs.gxt.ui.client.data.BaseModel;

public class ObjectInstLinkModelData extends BaseModel implements Serializable {
	
	ObjectInstLink oil;
	
	ObjectInstLinkModelData(){};
	
	public ObjectInstLinkModelData(ObjectInstLink ipOil) {
		this.oil = ipOil;
		
		this.set("parentNm", ipOil.parent.instanceName);
		this.set("childNm", ipOil.child.instanceName);
		this.set("linkTypeName", ipOil.olt.linkTypeName);
		this.set("dateUpdated",ipOil.whenUpdated);
		this.set("dateCreated",ipOil.whenCreated);
		this.set("friendlyText", NaturalLanguageTranslator.transObjectInstanceLink(ipOil));
		this.set("oilId", ipOil.instanceLinkId);
		
	}
	
	public ObjectInstLink getObjectInstLink() {
		return oil;
	}
}
