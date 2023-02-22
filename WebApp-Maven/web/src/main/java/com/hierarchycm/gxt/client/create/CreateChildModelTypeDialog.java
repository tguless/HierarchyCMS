package com.hierarchycm.gxt.client.create;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.extjs.gxt.ui.client.Style.HorizontalAlignment;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.Style.VerticalAlignment;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.event.BaseEvent;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.store.ListStore;
import com.extjs.gxt.ui.client.store.TreeStore;
import com.extjs.gxt.ui.client.widget.Html;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.form.CheckBox;
import com.extjs.gxt.ui.client.widget.form.ComboBox;
import com.extjs.gxt.ui.client.widget.form.FieldSet;
import com.extjs.gxt.ui.client.widget.form.FormPanel;
import com.extjs.gxt.ui.client.widget.form.Radio;
import com.extjs.gxt.ui.client.widget.form.RadioGroup;
import com.extjs.gxt.ui.client.widget.form.TextField;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.TableData;
import com.extjs.gxt.ui.client.widget.layout.TableLayout;
import com.extjs.gxt.ui.client.widget.treepanel.TreePanel;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DatabaseServiceAsync;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.ObjectInstanceTreePanel;
import com.hierarchycm.gxt.client.commands.CreateObjInstanceCommand;
import com.hierarchycm.gxt.client.commands.CreateObjLinkType;
import com.hierarchycm.gxt.client.commands.ErrorHandlingAsyncCallback;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.shared.ProjectConstants;
import com.hierarchycm.shared.client.GxtException;

public class CreateChildModelTypeDialog extends com.extjs.gxt.ui.client.widget.Window  {

	 public ObjectInstanceTreePanel objectInstancePanel;
	
	 private ListStore<ObjectTypeTree> allObjectTypes = new ListStore<ObjectTypeTree>();
	 private DatabaseServiceAsync dbService =  DbServiceProvider.getDbService();
	 private HashMap<String, ObjectTypeTree> allObjectTypesTblHm = null;
	 private HashMap<String, ObjectTypeTree> allObjectTypesNmHm = null;
	 public ObjectTypeTree currentFolder;
	 private com.extjs.gxt.ui.client.widget.Window w = null;
 
	 public String activity = "NEW LINK";	 
	 
     final ComboBox<ObjectTypeTree> objTypeCombo = new ComboBox<ObjectTypeTree>();	      
     
     final TextField<String> newObjTypeTblField = new TextField<String>();
     final TextField<String> newObjAssocName = new TextField<String>();
     final TextField<String> newObjAssocCreateText = new TextField<String>();

     Radio rb = new Radio();

     final TextField<String> newObjTypeNmField = new TextField<String>();

     final RadioGroup radioGroup = new RadioGroup();
     final RadioGroup radioGrpChldCreate = new RadioGroup();
     
     Radio mustCreateRb = new Radio();
     Radio mustUseExistingRb = new Radio();
     Radio canDoBothRb = new Radio();

     final CheckBox ownerReadCb = new CheckBox();
     final CheckBox ownerWriteCb = new CheckBox();
     final CheckBox ownerDeleteCb = new CheckBox();

     final CheckBox friendReadCb = new CheckBox();
     final CheckBox friendWriteCb = new CheckBox();
     final CheckBox friendDeleteCb = new CheckBox();

     final CheckBox privFriendReadCb = new CheckBox();
     final CheckBox privFriendWriteCb = new CheckBox();
     final CheckBox privFriendDeleteCb = new CheckBox();
     

     final CheckBox restFriendReadCb = new CheckBox();
     final CheckBox restFriendWriteCb = new CheckBox();
     final CheckBox restFriendDeleteCb = new CheckBox();

     final CheckBox parentsReadCb = new CheckBox();
     final CheckBox parentsWriteCb = new CheckBox();
     final CheckBox parentsDeleteCb = new CheckBox();

     final CheckBox parentsFriendsReadCb = new CheckBox();
     final CheckBox parentsFriendsWriteCb = new CheckBox();
     final CheckBox parentsFriendsDeleteCb = new CheckBox();

     final CheckBox parentsPrivFriendsReadCb = new CheckBox();
     final CheckBox parentsPrivFriendsWriteCb = new CheckBox();
     final CheckBox parentsPrivFriendsDeleteCb = new CheckBox();

     final CheckBox parentsRestFriendsReadCb = new CheckBox();
     final CheckBox parentsRestFriendsWriteCb = new CheckBox();
     final CheckBox parentsRestFriendsDeleteCb = new CheckBox();
     
     
     
     final CheckBox reqPrntApprovalCb = new CheckBox();
     final CheckBox reqChldApprovalCb = new CheckBox();
     final CheckBox createRecipCb = new CheckBox();
     
     FieldSet childObjFieldset = new FieldSet();
     
     String newOrExistingRb = null;
     
     final CheckBox forceSingleChldCb = new CheckBox();

	 TreeStore<ModelData> store = null;
 
	 TreePanel<ModelData> tree = null;

	public CreateChildModelTypeDialog(
			TreePanel<ModelData> tree,
			TreeStore<ModelData> store, 
			ObjectTypeTree currentFolder, 
			ObjectInstanceTreePanel objectInstancePanel
	) {		
		  this.store = store;
		  this.tree = tree;
		  this.objectInstancePanel = objectInstancePanel;
		  createInputWindow();			      
		  loadObjTypeDropDown();
		  
	}
	
	
	public void loadObjTypeDropDown(){
		  
		  dbService.getAllObjectTypes(
				new AsyncCallback<HashMap<String, ObjectTypeTree>>() {        
					
					@Override
					public void onFailure(Throwable caught) {	
					}
					
					@Override
					public void onSuccess(HashMap<String, ObjectTypeTree> ipAllObjectTypes) {						
									allObjectTypesTblHm = ipAllObjectTypes;
									
									Iterator <String> iter = ipAllObjectTypes.keySet().iterator();
									allObjectTypesNmHm = new HashMap<String, ObjectTypeTree>();
									while(iter.hasNext()) {
										String currentObjectTypeKy = iter.next();
										ObjectTypeTree currentOtt = ipAllObjectTypes.get(currentObjectTypeKy);
										allObjectTypesNmHm.put(currentOtt.getObjectType().typeName, currentOtt);												
									}									
									allObjectTypes.add(new ArrayList<ObjectTypeTree>(ipAllObjectTypes.values()));
																											
					}
				}
		  );	  
	}

	
	public com.extjs.gxt.ui.client.widget.Window createInputWindow () {

	      //w.setOnEsc(true);
		  w = this; 
	      w.setSize(520, 660);
	      w.setHeading("Create a new association");
	      w.setLayout(new FitLayout());
	      w.setModal(false);      		
	      w.setClosable(false);
	      	            
	      TableLayout tableLayout = new TableLayout();	      
	      tableLayout.setColumns(3);

	      childObjFieldset.setBorders(true);
	      childObjFieldset.setTitle("Select new model type");
	      childObjFieldset.setHeading("Identify child object type to associate to");
	      childObjFieldset.setLayout(tableLayout);            
    
	      TableData td1 = new TableData();
	      td1.setWidth("20px");
	      td1.setHeight("30px");      
	      td1.setHorizontalAlign(HorizontalAlignment.CENTER);
	      
	      TableData td2 = new TableData();
	      td2.setWidth("200px");
	      td2.setHorizontalAlign(HorizontalAlignment.LEFT);
	      
	      TableData td2b = new TableData();
	      td2b.setWidth("200px");
	      td2b.setHorizontalAlign(HorizontalAlignment.RIGHT);
	      
	      TableData td3 = new TableData();
	      td3.setWidth("160px");
	      td3.setHorizontalAlign(HorizontalAlignment.CENTER);
	      
	      objTypeCombo.setEmptyText("Select an object type...");
	      objTypeCombo.setFieldLabel("Object Type: ");
	      objTypeCombo.setDisplayField("name");
	      objTypeCombo.setValueField("id");
	      objTypeCombo.setStore(allObjectTypes);
	      objTypeCombo.setEnabled(false);	            
	      rb.setData("value", "existing");
	      
	      childObjFieldset.add(rb, td1);
	      childObjFieldset.add(new Html("Select an existing object type:"), td2);
	      childObjFieldset.add(objTypeCombo , td3);
	      
	      Radio rb2 = new Radio();
	      rb2.setData("value", "new");
	      	    
	      newObjTypeTblField.setEnabled(false);
	 
	      childObjFieldset.add(rb2,td1);
	      childObjFieldset.add(new Html("Create a new object type:"), td2);
	      childObjFieldset.add(new Html(""), td3);
	      
	      childObjFieldset.add(new Html(""),td1);
	      childObjFieldset.add(new Html("Type Table Name: "), td2b);
	      childObjFieldset.add(newObjTypeTblField, td3);

	      newObjTypeNmField.setEnabled(false);
	      childObjFieldset.add(new Html(""), td1);
	      childObjFieldset.add(new Html("Type Name: "), td2b);
	      childObjFieldset.add(newObjTypeNmField, td3);
     
	      radioGroup.addListener(Events.Change, new Listener<BaseEvent>(){
	          public void handleEvent(BaseEvent be) {
	                 //GWT.log("Service type: " + radioGroup.getValue().getBoxLabel(), null);
	        	  	String currentRb = (String)radioGroup.getValue().getData("value"); 
	        	  	if (currentRb.equals("existing")) {
	        	  		objTypeCombo .setEnabled(true);
	        	  		newObjTypeTblField.setEnabled(false);
	        	  		newObjTypeNmField.setEnabled(false);
	        	  	} else if (currentRb.equals("new")) {
	        	  		objTypeCombo .setEnabled(false);
	        	  		newObjTypeTblField.setEnabled(true);        	  		
	        	  		newObjTypeNmField.setEnabled(true);
	        	  	}
	          }
	      });
	      
	      radioGroup.add(rb);
	      radioGroup.add(rb2);
	      
	      TableLayout permTableLayout = new TableLayout();
	      permTableLayout.setColumns(4);
	      permTableLayout.setBorder(0);
	            
	      TableData tdPermName = new TableData();
	      tdPermName.setWidth("300px");
	      tdPermName.setHorizontalAlign(HorizontalAlignment.LEFT);
	      
	      TableData tdPermCheckBox = new TableData();
	      tdPermCheckBox.setWidth("50px");
	      tdPermCheckBox.setHorizontalAlign(HorizontalAlignment.LEFT);
	      
	      FieldSet assocFieldSet = new FieldSet();
	      TableLayout assocProTblLayout = new TableLayout();	      
	      assocProTblLayout.setColumns(3);
	      
	      assocFieldSet.setBorders(true);
	      assocFieldSet.setTitle("Child association properties");
	      assocFieldSet.setHeading("Child association properties");
	      assocFieldSet.setLayout(assocProTblLayout);        
	      assocFieldSet.add(new Html(""),td1);
	      assocFieldSet.add(new Html("Association Name: "), td2b);	      
	      assocFieldSet.add(newObjAssocName, td3);
	      
	      assocFieldSet.add(new Html(""),td1);
	      assocFieldSet.add(new Html("Association Create Text: "), td2b);
	      assocFieldSet.add(newObjAssocCreateText, td3);
	      
	      FieldSet permFieldSet = new FieldSet();
	      permFieldSet.setBorders(true);
	      permFieldSet.setTitle("Child association permissions");
	      permFieldSet.setLayout(permTableLayout);
	      permFieldSet.setHeading("Child association permissions");
	      
	      permFieldSet.add(new Html("<b>Permission Type:</b>"), tdPermName );
	      permFieldSet.add(new Html("<b>Read</b>"), tdPermCheckBox );
	      permFieldSet.add(new Html("<b>Write</b>"), tdPermCheckBox );
	      permFieldSet.add(new Html("<b>Delete</b>"), tdPermCheckBox );
	      
	      permFieldSet.add(new Html("Child record creator: "), tdPermName );
	      permFieldSet.add(ownerReadCb, tdPermCheckBox );
	      permFieldSet.add(ownerWriteCb, tdPermCheckBox );
	      permFieldSet.add(ownerDeleteCb, tdPermCheckBox );
	      
	      permFieldSet.add(new Html("Friends of child record creator: "), tdPermName );
	      permFieldSet.add(friendReadCb, tdPermCheckBox );
	      permFieldSet.add(friendWriteCb, tdPermCheckBox );
	      permFieldSet.add(friendDeleteCb, tdPermCheckBox );

	      permFieldSet.add(new Html("Privilaged friends of child record creator: "), tdPermName );
	      permFieldSet.add(privFriendReadCb, tdPermCheckBox );
	      permFieldSet.add(privFriendWriteCb, tdPermCheckBox );
	      permFieldSet.add(privFriendDeleteCb, tdPermCheckBox );
	      
	      permFieldSet.add(new Html("Restricted friends of child record creator: "), tdPermName );
	      permFieldSet.add(restFriendReadCb, tdPermCheckBox );
	      permFieldSet.add(restFriendWriteCb, tdPermCheckBox );
	      permFieldSet.add(restFriendDeleteCb, tdPermCheckBox );
	      
	      permFieldSet.add(new Html("Parent record creator: "), tdPermName );
	      permFieldSet.add(parentsReadCb, tdPermCheckBox );
	      permFieldSet.add(parentsWriteCb, tdPermCheckBox );
	      permFieldSet.add(parentsDeleteCb, tdPermCheckBox );
	      
	      permFieldSet.add(new Html("Friends of parent record creator: "), tdPermName );
	      permFieldSet.add(parentsFriendsReadCb, tdPermCheckBox );
	      permFieldSet.add(parentsFriendsWriteCb, tdPermCheckBox );
	      permFieldSet.add(parentsFriendsDeleteCb, tdPermCheckBox );
	      
	      permFieldSet.add(new Html("Privilaged friends of parent record creator: "), tdPermName );
	      permFieldSet.add(parentsPrivFriendsReadCb, tdPermCheckBox );
	      permFieldSet.add(parentsPrivFriendsWriteCb, tdPermCheckBox );
	      permFieldSet.add(parentsPrivFriendsDeleteCb, tdPermCheckBox );
	      
	      permFieldSet.add(new Html("Restricted friends of parent record creator: "), tdPermName );
	      permFieldSet.add(parentsRestFriendsReadCb, tdPermCheckBox );
	      permFieldSet.add(parentsRestFriendsWriteCb, tdPermCheckBox );
	      permFieldSet.add(parentsRestFriendsDeleteCb, tdPermCheckBox );     
	      
	      
	      TableData tdChldCreateRbTd = new TableData();
	      tdChldCreateRbTd.setWidth("20px");
	      tdChldCreateRbTd.setHorizontalAlign(HorizontalAlignment.LEFT);
	      tdChldCreateRbTd.setVerticalAlign(VerticalAlignment.TOP);
	      
	      TableData tdChldCreateDescTd = new TableData();
	      tdChldCreateDescTd.setWidth("550px");
	      tdChldCreateDescTd.setHorizontalAlign(HorizontalAlignment.LEFT);
	      
	      
	      
	      TableLayout approvalTableLayout = new TableLayout();
	      approvalTableLayout.setColumns(2);
	      approvalTableLayout.setBorder(0);
	      
	      FieldSet approvalFieldSet = new FieldSet();	      
	      approvalFieldSet.setHeading("Association approval");
	      approvalFieldSet.setLayout(approvalTableLayout);
	      approvalFieldSet.add(reqChldApprovalCb, tdChldCreateRbTd);	      
	      approvalFieldSet.add(new Html("Requires approval from creator of child record when associating."), tdChldCreateDescTd);
	      approvalFieldSet.add(reqPrntApprovalCb, tdChldCreateRbTd);
	      approvalFieldSet.add(new Html("Requires approval from creator of parent record when creating or associating."), tdChldCreateDescTd);
	      approvalFieldSet.add(createRecipCb, tdChldCreateRbTd);
	      approvalFieldSet.add(new Html("Create a reciprocal relationship upon approval."), tdChldCreateDescTd);
	      
	      
	      TableLayout childCreateTableLayout = new TableLayout();
	      childCreateTableLayout.setColumns(2);
	      childCreateTableLayout.setBorder(0);      
	                  
	      FieldSet chldCreateFieldSet = new FieldSet();
	      chldCreateFieldSet.setBorders(true);	      
	      chldCreateFieldSet.setHeading("Child record creation");
	      chldCreateFieldSet.setLayout(childCreateTableLayout);   
	            
	      mustCreateRb.setData("value", "MustCreate");
	      
	      chldCreateFieldSet.add(mustCreateRb, tdChldCreateRbTd );
	      chldCreateFieldSet.add(new Html("Must create a new instance of the child model type."), tdChldCreateDescTd );
     
	      mustUseExistingRb.setData("value", "MustUseExisting");
	      
	      chldCreateFieldSet.add(mustUseExistingRb, tdChldCreateRbTd );
	      chldCreateFieldSet.add(new Html("Must use an existing instance of the child model type."), tdChldCreateDescTd );
      
	      canDoBothRb.setData("value", "CanDoBoth");
	      
	      chldCreateFieldSet.add(canDoBothRb, tdChldCreateRbTd );
	      chldCreateFieldSet.add(new Html("Can choose to create a new instance or use an existing instance of the child model type."), tdChldCreateDescTd );	            
	      
	      radioGrpChldCreate.add(mustCreateRb);
	      radioGrpChldCreate.add(mustUseExistingRb);
	      radioGrpChldCreate.add(canDoBothRb);
	      
	      TableLayout singleChildTableLayout = new TableLayout();
	      singleChildTableLayout.setColumns(2);
	      singleChildTableLayout.setBorder(0);      
	      
	      TableData tdSingleChldCbTd = new TableData();
	      tdSingleChldCbTd.setWidth("20px");
	      tdSingleChldCbTd.setHorizontalAlign(HorizontalAlignment.LEFT);
	      tdSingleChldCbTd.setVerticalAlign(VerticalAlignment.TOP);
	      
	      TableData tdSingleChldDescTd = new TableData();
	      tdSingleChldDescTd.setWidth("550px");
	      tdSingleChldDescTd.setHorizontalAlign(HorizontalAlignment.LEFT);
	      
	      FieldSet singleChildFieldSet = new FieldSet();
	      singleChildFieldSet.setBorders(true);
	      singleChildFieldSet.setTitle("Force single child");
	      singleChildFieldSet.setLayout(singleChildTableLayout);
	      singleChildFieldSet.setHeading("Force single child");
	      
	      singleChildFieldSet.add(forceSingleChldCb, tdSingleChldCbTd );
	      singleChildFieldSet.add(new Html("Must only allow the creation of a single instance of the child model type."), tdSingleChldDescTd );
	      
	      Button okButton = new Button("Ok", getOkButtonListener());

	      FormPanel panel = new FormPanel();
	      panel.setScrollMode(Scroll.AUTOY);
	      panel.setBorders(false);
	      panel.setBodyBorder(false);
	      panel.setLabelWidth(55);
	      panel.setPadding(5);
	      panel.setHeaderVisible(false);
	      panel.add(childObjFieldset);
	      panel.add(assocFieldSet);	      
	      panel.add(permFieldSet);
	      panel.add(approvalFieldSet);
	      panel.add(chldCreateFieldSet);	      
	      panel.add(singleChildFieldSet);
	      w.add(panel); 
	      
	      w.addButton(okButton);
	      
	      Button cancelButton = new Button("Cancel", new SelectionListener<ButtonEvent>() {
	          @Override
	          public void componentSelected(ButtonEvent ce) {
	            w.hide();	           
	          }
	       });
      
	      w.addButton(cancelButton);
	      
	      return w;
	 }
	 
	 private SelectionListener<ButtonEvent> getOkButtonListener() {
		
		final AsyncCallback <ObjectTypeTree> dbCreateChildCallback = new ErrorHandlingAsyncCallback<ObjectTypeTree>() {        			
				@Override
				public void onSuccess(ObjectTypeTree result) {
					objectInstancePanel.refreshObjectType(currentFolder.getObjectType().parent.parentType.typeId);
		        	if (activity.equals("NEW LINK")) {		        		
		        	  store.add(currentFolder, result.getChildren(), true);
			          tree.setExpanded(currentFolder, true);
		        	}
				}
		};
		 
		return new SelectionListener<ButtonEvent>() {
	          @Override
	          public void componentSelected(ButtonEvent ce) {
	            
	        	boolean okToSave = true;  
	        		        	
	        	ObjectLinkType olt = populateObjModelAssoc();
	        	
	        	
	        	if (activity.equals("NEW LINK")) {
		        	if (!newOrExistingRb.equals("existing")) {	            	 
		             	if (allObjectTypesTblHm.get(olt.childType.tblName) != null) {
		                	Window.alert("The table name you specified for this object type already exists in the system.");
		                	okToSave = false;            	
		                }
		                
		                if (allObjectTypesNmHm.get(olt.childType.typeName) != null) {
		                	Window.alert("The object type name you specified already exists in the system.");
		                	okToSave = false;
		                }	            	 
		        	}
	        	}
	        		        	
	            if (okToSave) {  
	            	
	    	    	AsyncCallback<ObjectTypeTree> callback = new ErrorHandlingAsyncCallback<ObjectTypeTree> () {
						@Override
						public void onSuccess(ObjectTypeTree result) {			    			
			    			objectInstancePanel.refreshObjectType(currentFolder.getObjectType().parent.parentType.typeId); // .get("parentid")));
			    	    	if (activity.equals("NEW LINK")) {		        		
			    	    	  store.add(currentFolder, result.getChildren(), true);
			    	          tree.setExpanded(currentFolder, true);
			    	    	}							
						}	    	    		
	    	    	};
	            	
	            	new CreateObjLinkType(callback).execute(olt);
	            	w.hide();
	            }                        
	          }
	    };
	 }
	 
	 public void populateFieldsFromOma(ObjectLinkType olt) {
		 	    	
	    	ownerReadCb.setValue(olt.chldCrtRd);
	    	ownerWriteCb.setValue(olt.childCrtWr);
	    	ownerDeleteCb.setValue(olt.childCrtDel);

	    	friendReadCb.setValue(olt.frndOfChldCrtRd); 
	    	friendWriteCb.setValue(olt.frndOfChldCrtWr);  
	    	friendDeleteCb.setValue(olt.frndOfChldCrtDel);  

	    	privFriendReadCb.setValue(olt.privFrndOfChldCrtRd);
	    	privFriendWriteCb.setValue(olt.privFrndOfChldCrtWr);
	    	privFriendDeleteCb.setValue(olt.privFrndOfChldCrtDel);

	    	restFriendReadCb.setValue(olt.restFrndOfChldCrtRd); 
	    	restFriendWriteCb.setValue(olt.restFrndOfChldCrtWr);
	    	restFriendDeleteCb.setValue(olt.restFrndOfChldCrtDel); 

	    	parentsReadCb.setValue(olt.parentsOfChldRecRd);
	    	parentsWriteCb.setValue(olt.parentsOfChldRecWr);
	    	parentsDeleteCb.setValue(olt.parentsOfChldRecDel);

	    	parentsFriendsReadCb.setValue(olt.frndOfPrntsOfChldRecRd);
	    	parentsFriendsWriteCb.setValue(olt.frndOfPrntsOfChldRecWr);
	    	parentsFriendsDeleteCb.setValue(olt.frndOfPrntsOfChldRecDel);

	    	parentsPrivFriendsReadCb.setValue(olt.privFrndOfPrntsOfChldRecRd);
	    	parentsPrivFriendsWriteCb.setValue(olt.privFrndOfPrntsOfChldRecWr);
	    	parentsPrivFriendsDeleteCb.setValue(olt.privFrndOfPrntsOfChldRecDel);

	    	parentsRestFriendsReadCb.setValue(olt.restFrndOfPrntsOfChldRecRd);
	    	parentsRestFriendsWriteCb.setValue(olt.restFrndOfPrntsOfChldRecWr);
	    	parentsRestFriendsDeleteCb.setValue(olt.restFrndOfPrntsOfChldRecDel);
	    	
	    	reqPrntApprovalCb.setValue(olt.parentApprovalRequired);
	    	reqChldApprovalCb.setValue(olt.childApprovalRequired);
	    	
	    	createRecipCb.setValue(olt.createRecip);
	    		    	
	    	newObjAssocName.setValue(olt.linkTypeName);
	    	newObjAssocCreateText.setValue(olt.linkTypeCreateText);

	    	if (olt.allowChldCreate == true && olt.allowChldLink == false ) {
	    		mustCreateRb.setValue(true);
	    	} else if(olt.allowChldCreate == false && olt.allowChldLink == true) {
	    		mustUseExistingRb.setValue(true);
	    	} else if (olt.allowChldCreate == true && olt.allowChldLink == true) {
	    		canDoBothRb.setValue(true);
	    	}
	    	
	    	forceSingleChldCb.setValue(olt.forceSingleChild);
			
		}	 
	 
	private ObjectLinkType populateObjModelAssoc() {

		ObjectLinkType olt = new ObjectLinkType();
		olt.childType = new ObjectType();
		olt.parentType = new ObjectType();

    	if (activity.equals("NEW LINK")) {
	    	newOrExistingRb = (String)radioGroup.getValue().getData("value");
	    	
	    	if (newOrExistingRb.equals("existing")) {
	    		olt.childType.tblName = objTypeCombo.getValue().getObjectType().tblName;    		
	    		olt.childType.typeName = objTypeCombo.getValue().getObjectType().typeName;
	    		olt.childType.typeId = objTypeCombo.getValue().getObjectType().typeId;
	    		
	    	} else {
	    		olt.childType.tblName = newObjTypeTblField.getValue();
	    		olt.childType.typeName = newObjTypeNmField.getValue();      	    		
	    	}    	
    	}
    	
    	olt.linkTypeName = newObjAssocName.getValue();
    	olt.linkTypeCreateText = newObjAssocCreateText.getValue();
    	
    	String childCreateVal = (String)radioGrpChldCreate.getValue().getData("value"); 
    	
    	if (childCreateVal.equals("MustCreate")) {
    		olt.allowChldCreate = true;
    		olt.allowChldLink = false;
    	} else if (childCreateVal.equals("MustUseExisting")) {
    		olt.allowChldCreate = false;
    		olt.allowChldLink = true;
    	} else if (childCreateVal.equals("CanDoBoth")){
    		olt.allowChldCreate = true;
    		olt.allowChldLink = true;
    	}
    	
    	olt.chldCrtRd = ownerReadCb.getValue();
    	olt.childCrtWr = ownerWriteCb.getValue();
    	olt.childCrtDel = ownerDeleteCb.getValue();

    	olt.frndOfChldCrtRd = friendReadCb.getValue();
    	olt.frndOfChldCrtWr = friendWriteCb.getValue();
    	olt.frndOfChldCrtDel = friendDeleteCb.getValue();

    	olt.privFrndOfChldCrtRd = privFriendReadCb.getValue();
    	olt.privFrndOfChldCrtWr = privFriendWriteCb.getValue();
    	olt.privFrndOfChldCrtDel = privFriendDeleteCb.getValue();

    	olt.restFrndOfChldCrtRd = restFriendReadCb.getValue();
    	olt.restFrndOfChldCrtWr = restFriendWriteCb.getValue();        	
    	olt.restFrndOfChldCrtDel = restFriendDeleteCb.getValue();

    	olt.parentsOfChldRecRd = parentsReadCb.getValue();
    	olt.parentsOfChldRecWr = parentsWriteCb.getValue();
    	olt.parentsOfChldRecDel = parentsDeleteCb.getValue();

    	olt.frndOfPrntsOfChldRecRd = parentsFriendsReadCb.getValue();
    	olt.frndOfPrntsOfChldRecWr = parentsFriendsWriteCb.getValue();
    	olt.frndOfPrntsOfChldRecDel = parentsFriendsDeleteCb.getValue();

    	olt.privFrndOfPrntsOfChldRecRd = parentsPrivFriendsReadCb.getValue();
    	olt.privFrndOfPrntsOfChldRecWr = parentsPrivFriendsWriteCb.getValue();
    	olt.privFrndOfPrntsOfChldRecDel = parentsPrivFriendsDeleteCb.getValue();

    	olt.restFrndOfPrntsOfChldRecRd = parentsRestFriendsReadCb.getValue();
    	olt.restFrndOfPrntsOfChldRecWr = parentsRestFriendsWriteCb.getValue();
    	olt.restFrndOfPrntsOfChldRecDel = parentsRestFriendsDeleteCb.getValue();
    	
    	olt.parentApprovalRequired = reqPrntApprovalCb.getValue();
    	olt.childApprovalRequired = reqChldApprovalCb.getValue();
    	
    	olt.createRecip = createRecipCb.getValue();
    	
    	olt.childType.tblSchema = ProjectConstants.currentSchema;
    	olt.linkTblSchema = ProjectConstants.currentSchema;
    	
    	if (activity.equals("NEW LINK")) {
    		olt.parentType.typeId = String.valueOf(currentFolder.getObjectType().typeId);
    		
    	} else if (activity.equals("UPDATE LINK")) {
    		olt.parentType.typeId = currentFolder.getObjectType().parent.parentType.typeId;    		
    		olt.childType.typeId = currentFolder.getObjectType().typeId;    		
    		olt.linkTypeId = currentFolder.getObjectType().parent.linkTypeId;
    	}
    	
    	//for now no special link tables
    	olt.linkTblName = "";
    	
    	olt.forceSingleChild = forceSingleChldCb.getValue();
		
		return olt;
	}


	public void loadItem(ObjectTypeTree currentFolder, String activity) {
		this.currentFolder = currentFolder;
		this.activity = activity;
        if (activity.equals("NEW LINK")) {        		          
        	this.setHeading("Create a new association");        	
        	this.childObjFieldset.show();
        	w.show();
        	w.setHeight(660);
        } else {	          
        	this.setHeading("Update association of child object type \"" + currentFolder.get("name") + "\" with parent");  
        	this.childObjFieldset.hide();  	          
	        this.show();
	        this.setHeight(500);
        }
		
	}

	
}
