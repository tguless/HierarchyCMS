package com.hierarchycm.gxt.client.viewers;

import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.util.Padding;
import com.extjs.gxt.ui.client.widget.Component;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.layout.HBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.HBoxLayoutData;
import com.extjs.gxt.ui.client.widget.layout.HBoxLayout.HBoxLayoutAlign;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class AlbumViewActionPanel  extends LayoutContainer {

	private HBoxLayoutData flex;

	public AlbumViewActionPanel(ObjectTypeTree ott, AlbumViewWrapper albumView,
			ObjectInstanceViewerPanel objectInstanceViewerPanel) {
		
		HBoxLayout layout = new HBoxLayout();  
        layout.setPadding(new Padding(5));  
        layout.setHBoxLayoutAlign(HBoxLayoutAlign.TOP);  
        setLayout(layout);  
        flex = new HBoxLayoutData(new Margins(0, 5, 0, 0));  
        flex.setFlex(1);  
		this.add(new Button("Delete Item"), flex);
		this.add(new Button("Edit Item"), flex);
		// TODO Auto-generated constructor stub
	}

}
