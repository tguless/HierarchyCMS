package com.hierarchycm.gxt.client.create;

import java.util.ArrayList;
import java.util.HashMap;

import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.FieldEvent;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.event.SelectionChangedEvent;
import com.extjs.gxt.ui.client.event.SelectionChangedListener;
import com.extjs.gxt.ui.client.store.ListStore;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.form.ComboBox;
import com.extjs.gxt.ui.client.widget.form.ComboBox.TriggerAction;
import com.extjs.gxt.ui.client.widget.form.FormPanel;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.FlowLayout;
import com.extjs.gxt.ui.client.widget.layout.FormLayout;
import com.extjs.gxt.ui.client.widget.layout.RowData;
import com.extjs.gxt.ui.client.widget.layout.RowLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayoutData;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout.VBoxLayoutAlign;
import com.google.gwt.user.client.Element;
import com.google.gwt.user.client.Window;
import com.hierarchycm.gxt.client.GlobalRegistry;
import com.hierarchycm.gxt.client.InstanceChangeNotifyable;
import com.hierarchycm.gxt.client.model.ComboBoxNameVal;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class GenericCreateChild extends LayoutContainer implements InstanceChangeNotifyable {
	ObjectTypeTree topOtt = null;
	String topObjectTypeId =null ;
	
	VBoxLayoutData flex;
	FormPanel formPanel;
	
	CreateChildInstancePanel editPanel = null;
	
	InstanceChangeNotifyable parentIcn;
	
		
	final ComboBox<ComboBoxNameVal> objTypeCombo = new ComboBox<ComboBoxNameVal>();
	private ListStore<ComboBoxNameVal> allObjectTypes = new ListStore<ComboBoxNameVal>();
	
	HashMap<String, ObjectLinkType > topTypeSubtypes;
	public GenericCreateChild (ObjectTypeTree ott, InstanceChangeNotifyable icn) {
		topOtt = ott;
		parentIcn = icn;
	}
		
	@Override
	protected void onRender(Element parent, int index) {  		
		super.onRender(parent, index);
		
        VBoxLayout layout = new VBoxLayout();  
        layout.setVBoxLayoutAlign(VBoxLayoutAlign.STRETCH);
        this.setLayout(layout);    
        flex = new VBoxLayoutData(new Margins(0,0,0,0));          
        flex.setFlex(1);
		
		
		if (topOtt != null && topOtt.getObjInstance() != null ) {
			topTypeSubtypes = GlobalRegistry.serverInfo.typeSubtypes.get(topOtt.getObjInstance().type.typeId);
		} else if (topOtt != null &&  topOtt.getObjectType() != null) {
			topTypeSubtypes = GlobalRegistry.serverInfo.typeSubtypes.get(topOtt.getObjectType().typeId);
		} else if (topObjectTypeId!=null) {
			topTypeSubtypes = GlobalRegistry.serverInfo.typeSubtypes.get(topObjectTypeId);
		}
		
		  allObjectTypes.add(getTopTypeSubTypesOtt());	
		  objTypeCombo.setEmptyText("Select a type to create...");		
	      objTypeCombo.setFieldLabel("Object Type: ");
	      objTypeCombo.setStore(allObjectTypes);
	      objTypeCombo.setDisplayField("name");
	      objTypeCombo.setValueField("value");
	      objTypeCombo.setEnabled(true);	  
	      objTypeCombo.setTypeAhead(true);  
	      objTypeCombo.setTriggerAction(TriggerAction.ALL);  
	      
		  formPanel = new FormPanel();
		  formPanel.setBorders(false);
		  formPanel.setBodyBorder(false);
		  formPanel.setLayout(new FormLayout());
		  formPanel.add(objTypeCombo);
		  formPanel.getHeader().hide();
		  add(formPanel);
		  
		  objTypeCombo.addSelectionChangedListener(
			        new SelectionChangedListener<ComboBoxNameVal>() {

						@Override
						public void selectionChanged(
								SelectionChangedEvent<ComboBoxNameVal> se) {
				    		  if (editPanel!= null) {
				    			  GenericCreateChild.this.remove(editPanel);
				    		  }
				    		  
				    		  editPanel = new CreateChildInstancePanel(GenericCreateChild.this);
				    		  editPanel.setLayout(new FitLayout());		    		  
				    		  editPanel.loadItem(topOtt, (ObjectLinkType)objTypeCombo.getValue().get("olt"));   		  
				    		  GenericCreateChild.this.add(editPanel, flex);
				    		  GenericCreateChild.this.layout();								
						}
		  });
	}
	
	public ArrayList<ComboBoxNameVal> getTopTypeSubTypesOtt() {
		
		ArrayList<ComboBoxNameVal> result = new ArrayList<ComboBoxNameVal>();
		
		for (ObjectLinkType olt : topTypeSubtypes.values()) {
			ComboBoxNameVal bean = new ComboBoxNameVal(olt.childType.typeName, olt.linkTypeId);
			bean.set("olt", olt);
			result.add(bean);
		}
		
		return result;
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree oldParent, ObjectTypeTree newParent, boolean purgeChildren) {
		parentIcn.instanceChangeNotification(oldParent, newParent, purgeChildren);
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree itemChanged) {
		parentIcn.instanceChangeNotification(itemChanged);		
	}
}
