package com.hierarchycm.gxt.client.viewers;


import com.extjs.gxt.ui.client.widget.LayoutContainer;  
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.google.gwt.user.client.Element;  
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
 

public class PersonalityContainer extends LayoutContainer {

	private ObjectTypeTree personality;
	ObjectInstanceViewerPanel oivp = null;

	PersonalityContainer(final ObjectTypeTree personality) {
		this.personality = personality;
	}

	@Override
	protected void onRender(Element parent, int pos) {

		super.onRender(parent, pos);
		setLayout(new FitLayout());
		setBorders(false);

		oivp = new ObjectInstanceViewerPanel();
		oivp.setBorders(false);
		//oivp.loadItem(personality.oilId, "default",	personality.persoanlityType, "");
		oivp.loadItem(personality);
		add(oivp);
	}

}