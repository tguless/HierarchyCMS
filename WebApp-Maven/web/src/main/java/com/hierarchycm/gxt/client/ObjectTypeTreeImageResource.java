package com.hierarchycm.gxt.client;

import com.extjs.gxt.ui.client.GXT;
import com.extjs.gxt.ui.client.data.ModelData;
import com.google.gwt.resources.client.ImageResource;
import com.google.gwt.safehtml.shared.SafeUri;
import com.google.gwt.user.client.ui.Image;
import com.hierarchycm.gxt.shared.ProjectConstants;
import com.google.gwt.safehtml.shared.UriUtils;

public class ObjectTypeTreeImageResource implements ImageResource {

	ModelData model; 
	
	Image sampleImage = GXT.IMAGES.tree_folder().createImage();
	
	ObjectTypeTreeImageResource(ModelData model) {
		this.model = model;
	}
	
	@Override
	public int getHeight() {	
		return sampleImage.getHeight();
	}

	@Override
	public int getLeft() {		
		return 0;
	}

	@Override
	public int getTop() {
		return 0;
	}

	@Override
	public String getURL() {
		if (model.get("typeCategory").equals(ProjectConstants.imageCategory) ||
			model.get("typeCategory").equals(ProjectConstants.videoCategory)
			) {
			return "/DisplayBlob?imageType=tinythumb&imageId=" + model.get("id");
		} else {
			return null;
		}
	}

	@Override
	public int getWidth() {
		return sampleImage.getWidth();
	}

	@Override
	public boolean isAnimated() {
		return false;
	}

	@Override
	public String getName() {
		return model.get("name");
	}

	@Override
	public SafeUri getSafeUri() {
		String url = getURL();
		if (url!=null) {
			return UriUtils.fromSafeConstant(url);
		} else {
			return null;
		}		
	}

}
