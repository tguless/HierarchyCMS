package com.hierarchycm.gxt.client.model;

import java.text.DateFormat;
import java.util.Locale;

import com.hierarchycm.gxt.client.GlobalRegistry;
import com.hierarchycm.gxt.shared.ProjectConstants;

public class NaturalLanguageTranslator {
	public static String transObjectInstanceLink (ObjectInstLink oil) {
		String friendlyText;
		
		friendlyText = "<img src='/DisplayBlob?imageId=" + oil.owner.instanceId + "&imageType=smallpic'/ align=left height=50>";
		
		if (oil.owner.instanceId.equals(oil.child.owner.instanceId)) {
			friendlyText= friendlyText +
				oil.owner.instanceName +
				" created the record " + oil.child.instanceName +
				" of type " +
				oil.child.type.typeName +
				" under an existing record ";
			
		} else {
			friendlyText= friendlyText + 
			oil.owner.instanceName +
			" added the record " + oil.child.instanceName +
			" of type " +
			oil.child.type.typeName +
			" which was originally created by " +
			oil.child.owner.instanceName +
			" under an existing record ";
		}
		
		friendlyText = friendlyText +
			oil.parent.instanceName +
			" of type " +
			oil.parent.type.typeName +
			" created by " + 
			oil.parent.owner.instanceName +
			" residing under the profiles of";

		for (ObjectInstance profile : oil.parent.profilesHoldingInstance) {
			friendlyText = friendlyText +  " " + profile.instanceName ;
		}
		
		if (!oil.parentApproved ||  !oil.childApproved) {
			friendlyText = friendlyText + " but "; 
		}
		
		if (!oil.parentApproved  ) {
			friendlyText = friendlyText + oil.parent.owner.instanceName + " still needs to approve it"; 
		}
		
		if (!oil.parentApproved && !oil.childApproved) {
			friendlyText = friendlyText + " and ";
		}
		
		if (!oil.childApproved) {
			friendlyText = friendlyText + oil.child.owner.instanceName + " still needs to approve it";
		}
		
		return friendlyText;

	}
	
	public static String transObjectInstance (ObjectInstance oi) { 
		String friendlyText = "";
		if (oi.owner!=null) {
			friendlyText = friendlyText + "<img src='/DisplayBlob?imageId=" + oi.owner.instanceId + "&imageType=smallpic'/ align=left height=50>";		
			
			if (oi.when_updated != null) {
				friendlyText = friendlyText + " Posted on " + oi.when_updated + " by ";
			}
			friendlyText = friendlyText + oi.owner.instanceName + " : ";			
		}

		
		friendlyText = friendlyText + "<b>" +  oi.instanceName + "</b><br> ";
		if (oi.type != null) {
			if(oi.type.typeCategory!=null && oi.type.typeCategory.equals(ProjectConstants.commentCategory)) {
				friendlyText = friendlyText + oi.uniqueFieldData.get("comment_text");
			}
		}
		return friendlyText;
	}
	
}
