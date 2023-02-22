package com.hierarchycm.gxt.client.create;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import com.extjs.gxt.ui.client.Style.HorizontalAlignment;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.event.BaseEvent;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.store.ListStore;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.util.Padding;
import com.extjs.gxt.ui.client.widget.Html;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.form.ComboBox;
import com.extjs.gxt.ui.client.widget.form.DateField;
import com.extjs.gxt.ui.client.widget.form.Field;
import com.extjs.gxt.ui.client.widget.form.FieldSet;
import com.extjs.gxt.ui.client.widget.form.FileUploadField;
import com.extjs.gxt.ui.client.widget.form.FormPanel;
import com.extjs.gxt.ui.client.widget.form.FormPanel.Encoding;
import com.extjs.gxt.ui.client.widget.form.FormPanel.Method;
import com.extjs.gxt.ui.client.widget.form.HiddenField;
import com.extjs.gxt.ui.client.widget.form.HtmlEditor;
import com.extjs.gxt.ui.client.widget.form.Radio;
import com.extjs.gxt.ui.client.widget.form.RadioGroup;
import com.extjs.gxt.ui.client.widget.form.TextField;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.HBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.HBoxLayoutData;
import com.extjs.gxt.ui.client.widget.layout.TableData;
import com.extjs.gxt.ui.client.widget.layout.TableLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayoutData;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout.VBoxLayoutAlign;
import com.google.gwt.user.client.Cookies;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Grid;

import com.hierarchycm.gxt.client.CommonUtil;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.InstanceChangeNotifyable;
import com.hierarchycm.gxt.client.commands.CreateObjInstanceCommand;
import com.hierarchycm.gxt.client.commands.ErrorHandlingAsyncCallback;
import com.hierarchycm.gxt.client.commands.LinkObjInstanceCommand;
import com.hierarchycm.gxt.client.commands.LoadAllObjectCommand;
import com.hierarchycm.gxt.client.commands.SimplifiedCommand;
import com.hierarchycm.gxt.client.fileUpload.FileUpload;
import com.hierarchycm.gxt.client.fileUpload.FileUploadHtmlImpl;
import com.hierarchycm.gxt.client.fileUpload.FileUploadSwfImpl;
import com.hierarchycm.gxt.client.fileUpload.Uploader;
import com.hierarchycm.gxt.client.model.ColumnInfo;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.shared.ProjectConstants;

public class CreateChildInstancePanel extends LayoutContainer  implements Uploader {

	private ListStore<ObjectTypeTree> allObjectTypes = new ListStore<ObjectTypeTree>();	
	com.extjs.gxt.ui.client.widget.Window w = null;
	ObjectTypeTree currentFolder = null;	
	String newOrExistingRbStr = null;	
    
	final ComboBox<ObjectTypeTree> objTypeCombo = new ComboBox<ObjectTypeTree>();	          
    final  TextField<String>  newObjTypeNmField = new  TextField<String>();    
    
    FieldSet childObjCrFieldset = new FieldSet();
    FieldSet childObjUseExistingFieldset = new FieldSet();    
    FieldSet multiFileFieldset = new FieldSet();
    FieldSet childObjUniqueFieldset = new FieldSet();
    
    final RadioGroup radioGroup = new RadioGroup();
    Radio useExistingRb = new Radio();
    Radio useNewRb = new Radio();
    Radio useMultiFileRb = new Radio();    

    private String typeNameToAdd;
	private String typeIdToAdd;
	private Html createNewLabel;
	private Html useExistingLabel;
	private Html nameLabel;
	
	private FormPanel fpanel = new FormPanel();
	HiddenField<String> fpInstanceId = new HiddenField<String>();
	
	HashMap<String, Field> fields = new HashMap<String, Field>();
	
	HashMap <String, Object> props = null;
		
	InstanceChangeNotifyable instanceChangeNotifyListener;
	
	Button okButton;
	Button cancelButton;
	
    Html uploadLabel = (new Html("Upload your file(s):"));
	private boolean swfUploadEnabled = false;
	private boolean gwtupld = false;
	boolean multiUploadEnabled = true;	
	private boolean uploadInProgress = false;	
	HashMap <String, String> uploadPostParams = new HashMap<String, String>();;	
	private FileUpload fileInput;
	private Grid uploadTable; 
		
	
	
	
	final LayoutContainer blc= new LayoutContainer();
	
	ObjectLinkType olt;

	private int initialHeight = 50;
	
    
	public CreateChildInstancePanel(InstanceChangeNotifyable instanceChangeNotifyListener) {
		this.instanceChangeNotifyListener = instanceChangeNotifyListener;			
	}
	
	public CreateChildInstancePanel(InstanceChangeNotifyable instanceChangeNotifyListener, com.extjs.gxt.ui.client.widget.Window w) {
		this.w = w;
		this.instanceChangeNotifyListener = instanceChangeNotifyListener;	
		w.hide();		
	}
	
	 public void createInputWindow () {
		  
		 VBoxLayout vblayout = new VBoxLayout();  
		 vblayout.setVBoxLayoutAlign(VBoxLayoutAlign.STRETCH);
	     this.setLayout(vblayout);    
	 	 VBoxLayoutData flexVb;
	     flexVb = new VBoxLayoutData(new Margins(5,5,5,5));          
	     flexVb.setFlex(1);
		 
	      if (w!=null) {
	    	  w.setHeading("Create a new instance");
	    	  w.setModal(true);      
		      w.setClosable(false);
	      }
	      
	      final LayoutContainer panel = new LayoutContainer();
	      panel.setScrollMode(Scroll.AUTOY);
	      panel.setBorders(false);

	      VBoxLayout panelvblayout = new VBoxLayout();  
	      panelvblayout.setVBoxLayoutAlign(VBoxLayoutAlign.STRETCH);
	      panel.setLayout(panelvblayout);   
		  VBoxLayoutData panelFlexVb;
		  panelFlexVb = new VBoxLayoutData(new Margins(0,0,0,0));          
		  panelFlexVb.setFlex(1);

	      fpInstanceId.setName("NewInstanceId");
	      panel.add(fpInstanceId);
		  
	      TableData td1 = new TableData();
	      td1.setWidth("20px");
	      td1.setHeight("30px");      
	      td1.setHorizontalAlign(HorizontalAlignment.CENTER);
	      
	      TableData td2 = new TableData();
	      td2.setWidth("300px");
	      td2.setHorizontalAlign(HorizontalAlignment.LEFT);
	      
	      TableData td2b = new TableData();
	      td2b.setWidth("200px");
	      td2b.setHorizontalAlign(HorizontalAlignment.RIGHT);
	      
	      TableData td3 = new TableData();
	      td3.setWidth("160px");
	      td3.setHorizontalAlign(HorizontalAlignment.CENTER);
	      
	      TableData td3col = new TableData();
	      td3col.setWidth("160px");
	      td3col.setHorizontalAlign(HorizontalAlignment.CENTER);
	      td3col.setColspan(3);
	      	      
	      objTypeCombo.setEmptyText("Select an object type...");
	      objTypeCombo.setFieldLabel("Object Type: ");
	      objTypeCombo.setStore(allObjectTypes);
	      objTypeCombo.setDisplayField("name");
	      objTypeCombo.setValueField("id");
	      objTypeCombo.setEnabled(false);	            
	      
	      useExistingRb.setData("value", "existing");
	      useExistingLabel = new Html();
	      
	      //Fieldset #1	      
	      TableLayout tableLayout = new TableLayout();
	      tableLayout.setColumns(3);
	      childObjUseExistingFieldset.setBorders(true);
	      childObjUseExistingFieldset.setTitle("Select new model type");
	      childObjUseExistingFieldset.setHeading("Identify child object type to associate to");
	      childObjUseExistingFieldset.setLayout(tableLayout);   
	      childObjUseExistingFieldset.add(useExistingRb, td1);
	      childObjUseExistingFieldset.add(useExistingLabel, td2);
	      childObjUseExistingFieldset.add(objTypeCombo , td3);	    
	      radioGroup.add(useExistingRb);
	      
	      useNewRb.setData("value", "new");
	      createNewLabel = new Html();
	      newObjTypeNmField.setEnabled(false);
	      nameLabel = new Html();
	      panel.add(childObjUseExistingFieldset);
	      

	      if (olt.childType.typeCategory != null && ProjectConstants.uploadableCategories.contains(olt.childType.typeCategory)) {
		      
		      TableLayout tableLayout3 = new TableLayout();
		      tableLayout3.setColumns(3);
		      multiFileFieldset.setScrollMode(Scroll.AUTOY);
		      multiFileFieldset.setBorders(true);
		      multiFileFieldset.setTitle("Multi file upload utility");
		      multiFileFieldset.setHeading("Multi file upload utility");
		      multiFileFieldset.setLayout(tableLayout3);  	 
		      
		      useMultiFileRb.setData("value", "multifile");
			  
		      String url;
		      if (swfUploadEnabled == true) {
		    	  url = CommonUtil.getBaseUrl() + "upload?jsessionid=" + Cookies.getCookie("JSESSIONID");
		    	  fileInput = (FileUpload)new FileUploadSwfImpl(); 		     
	          } else  {
		    	  url = CommonUtil.getBaseUrl() + "html5upload";
		    	  fileInput = (FileUpload)new FileUploadHtmlImpl(); 
		      }
		      uploadTable = new Grid();
		      fileInput.initialize(uploadTable, this, url, true);    	  
	
		      multiFileFieldset.add(useMultiFileRb, td1);
		      multiFileFieldset.add(uploadLabel, td2);
		      multiFileFieldset.add(fileInput.getWidget(), td3);
		      multiFileFieldset.add(uploadTable, td3col);
		      radioGroup.add(useMultiFileRb);
		      panel.add(multiFileFieldset);
	      }

	      
	      if (olt.childType.typeCategory != null && !ProjectConstants.uploadableCategories.contains(olt.childType.typeCategory)) {
		      //Fieldset #2
		      TableLayout tableLayout2 = new TableLayout();
		      tableLayout2.setColumns(3);
		      tableLayout2.setWidth("100%");
		      childObjCrFieldset.setBorders(true);
		      childObjCrFieldset.setTitle("Select new model type");
		      childObjCrFieldset.setHeading("Identify child object type to associate to");
		      childObjCrFieldset.setLayout(tableLayout2);  	    
		      //First row
		      childObjCrFieldset.add(useNewRb,td1);
		      childObjCrFieldset.add(createNewLabel, td2);
		      childObjCrFieldset.add(new Html(""), td3);
		      //Second row
		      childObjCrFieldset.add(new Html(""), td1);
		      childObjCrFieldset.add(nameLabel, td2b);
		      childObjCrFieldset.add(newObjTypeNmField, td3);
		      newObjTypeNmField.setWidth(300);
	      
		      
		      HashSet <String> longBlobFields = getLongBlobTypes(olt.childType.uniqueFieldSchema);
	      
		      
		      if (olt.allowChldCreate && olt.childType.uniqueFieldSchema.keySet().size()>0) {

		    	  childObjCrFieldset.add(childObjUniqueFieldset, td3col);
			      TableLayout tableLayout4 = new TableLayout();
			      tableLayout4.setColumns(3);
			      tableLayout4.setWidth("100%");		      
			      
			      childObjUniqueFieldset.setHeading(olt.childType.typeName + " details:");
			      childObjUniqueFieldset.setLayout(tableLayout4);
		
			      initialHeight = initialHeight + 100;
			      
			      for (String fieldName : olt.childType.uniqueFieldSchema.keySet()) {	    	 
			    	  Field currentField;
			    	  
			    	  boolean isLongBlobDescriptor = false;
			    	  
			    	  int lastUnderscoreLoc = fieldName.lastIndexOf("_");
			    	  if (lastUnderscoreLoc >0) {
			    		  String startingPortion = fieldName.substring(0, lastUnderscoreLoc);			    		  
			    		  if (longBlobFields.contains(startingPortion)) {
			    			  isLongBlobDescriptor = true;
			    		  }
			    	  }
			    	  
			    	  if (!isLongBlobDescriptor) {
				    	  if (olt.childType.uniqueFieldSchema.get(fieldName).type.toUpperCase().equals("LONGTEXT")) {
				    		  currentField = new HtmlEditor();
				    		  currentField.setName(fieldName);
	
				    		  currentField.setWidth("535px");
				    		  childObjUniqueFieldset.add(new Html(""), td1);
				    		  childObjUniqueFieldset.add(new Html(fieldName+":"), td2);
				    		  childObjUniqueFieldset.add(new Html(""), td3);	    		 
				    		  childObjUniqueFieldset.add( currentField, td3col );
				    		  
				    		  initialHeight = initialHeight+310;
				    		  fields.put(fieldName, currentField);
				    		  
				    	  } else if(olt.childType.uniqueFieldSchema.get(fieldName).type.toUpperCase().trim().equals("LONGBLOB")) {
				    		  
				    		  FileUploadField fileUpload = new FileUploadField();  
				    		  fileUpload.setAllowBlank(false);  
				    		  fileUpload.setName(fieldName);  
				    		  fileUpload.setFieldLabel("File");			    		  
				    		  currentField = fileUpload;
				    		  
					    	  childObjUniqueFieldset.add(new Html(""), td1);
					    	  childObjUniqueFieldset.add(new Html(fieldName), td2);
					    	  childObjUniqueFieldset.add(currentField, td3); 

				    	  } else if(olt.childType.uniqueFieldSchema.get(fieldName).type.toUpperCase().trim().equals("DATE")) {
				    		  
				    		    DateField birthday = new DateField();  
				    		    birthday.setFieldLabel("Birthday");
				    		    currentField = birthday;
				    		    
						    	childObjUniqueFieldset.add(new Html(""), td1);
						    	childObjUniqueFieldset.add(new Html(fieldName), td2);
						    	childObjUniqueFieldset.add(currentField, td3); 
						    	fields.put(fieldName, currentField);
				    		    					    	  
				    	  } else {
				    		  
				    		  currentField =  new  TextField<String>();		
				    		  currentField.setName(fieldName);
					    	  childObjUniqueFieldset.add(new Html(""), td1);
					    	  childObjUniqueFieldset.add(new Html(fieldName), td2);
					    	  childObjUniqueFieldset.add(currentField, td3);
					    	  fields.put(fieldName, currentField);
					    	  
				    	  }
			    	  }
			    	  
			    	 
			      }
		      }
		      radioGroup.add(useNewRb);
		      panel.add(childObjCrFieldset);
	      }
	     	      
	      okButton = new Button("Ok", getOkButtonListener());
	      
	      cancelButton = new Button("Cancel", new SelectionListener<ButtonEvent>() {
	          @Override
	          public void componentSelected(ButtonEvent ce) {
	            if (!uploadInProgress) {
	            	if (w!=null) {
	            		w.hide();
	            	} else  {
	            	
	            	}
	            }
	          }
	      });

	      
	      if (w== null) {		     			    
	    		HBoxLayoutData flex;	    	  	  	  	
	    		HBoxLayout hblayout = new HBoxLayout();	
	    		hblayout.setPadding(new Padding(5));    
		        blc.setLayout(hblayout);  
		        flex = new HBoxLayoutData(new Margins(0, 5, 0, 0));  
		        flex.setFlex(1);		        
		        okButton.setText("Save");
		        blc.add(okButton, flex);
		        
		        //blc.add(cancelButton, flex);
		        panel.add(blc);      		        		        
	      } else {
	    	  w.addButton(okButton);
	    	  w.addButton(cancelButton);
	    	  w.show();
	      }
	      
	      fpanel.setLayout(new FitLayout());
	      fpanel.setMethod(Method.POST);	      
		  fpanel.setEncoding(Encoding.MULTIPART);
	      fpanel.setAction("/upload");
	      fpanel.add(panel);
	      
	      add(fpanel, flexVb);
	      blc.layout(true);
	 }
	 
	private HashSet<String> getLongBlobTypes(HashMap<String, ColumnInfo> uniqueFieldSchema) {
		
		 HashSet <String>result = new HashSet<String>(); 
		
		 for(String key : uniqueFieldSchema.keySet()) {
			 ColumnInfo info = uniqueFieldSchema.get(key);
			 if (info.type.toUpperCase().equals("LONGBLOB")) {
				 result.add(info.field);
			 }
		 }
		 
		return result;
	}

	private void radioGroupProcess() {
		if(radioGroup.getValue()!=null) {
    	    newOrExistingRbStr = (String)radioGroup.getValue().getData("value");
    	  	if (newOrExistingRbStr.equals("existing")) {
    	  		objTypeCombo .setEnabled(true);
    	  		newObjTypeNmField.setEnabled(false);    	  		
   	  			fileInput.setDisabled(true);
    	  	} else if (newOrExistingRbStr.equals("new")) {
    	  		objTypeCombo .setEnabled(false);       	  		
    	  		newObjTypeNmField.setEnabled(true);
   	  			fileInput.setDisabled(true);
    	  	} else if (newOrExistingRbStr.equals("multifile")) {
    	  		objTypeCombo .setEnabled(false);        	  		
    	  		newObjTypeNmField.setEnabled(false);
   	  			fileInput.setDisabled(false);
    	  	}
	    }
	}
	
	public static final class GetObjLnkTypeByKy extends SimplifiedCommand<ObjectLinkType>  {
			public String oltId = null;		
			
			public GetObjLnkTypeByKy(AsyncCallback <ObjectLinkType> callback, String oltId) {
				this.callback = callback;
				this.oltId = oltId;
			}
			public GetObjLnkTypeByKy() {};
			
			@Override			
			public void execute() {							
				DbServiceProvider.getDbService().getObjLnkTypeByKy(oltId, this, callback);				
			}			
	}	
	
	public void loadItem(final ObjectTypeTree currentFolder, final ObjectLinkType olt) {
		
		final AsyncCallback<ObjectLinkType>cb = new ErrorHandlingAsyncCallback<ObjectLinkType>() {
			@Override
			public void onSuccess(ObjectLinkType olt) {
				CreateChildInstancePanel.this.olt = olt;
				createItemSetup( currentFolder, olt );				
			}			
		};
		 
		new GetObjLnkTypeByKy(cb, olt.linkTypeId).execute();		
	}
	
	public void createItemSetup(ObjectTypeTree currentFolder, ObjectLinkType olt) {		
		this.olt = olt;
		removeAll();
		createInputWindow();
		
		this.currentFolder = currentFolder;
		this.typeIdToAdd = olt.childType.typeId;
		this.uploadPostParams.put("typeIdToAdd", olt.childType.typeId);
		this.uploadPostParams.put("parentInstId", String.valueOf(currentFolder.getObjInstance().instanceId));
		this.uploadPostParams.put("oltId", olt.linkTypeId);
		this.typeNameToAdd = olt.childType.typeName;
		
		
		AsyncCallback <HashMap<String, ObjectTypeTree>> callback = new ErrorHandlingAsyncCallback <HashMap<String, ObjectTypeTree>> (){
			@Override
			public void onSuccess(HashMap<String, ObjectTypeTree> result) {  
				ListStore<ObjectTypeTree> allObjectTypes = new ListStore<ObjectTypeTree>();
				allObjectTypes.add(new ArrayList<ObjectTypeTree>(result.values()));
				objTypeCombo.setStore(allObjectTypes);								
			}			
		};
		
		new LoadAllObjectCommand(callback).execute(typeIdToAdd); 
		
		childObjCrFieldset.setHeading("Identify new child record to associate to existing parent record " + currentFolder.getObjInstance().instanceName + " of type " + currentFolder.getObjInstance().type.typeName);
		
		childObjUseExistingFieldset.setHeading("Identify existing child record to associate to existing parent record " + currentFolder.getObjInstance().instanceName + " of type " + currentFolder.getObjInstance().type.typeName);
		
		if (w!=null) {
			w.setHeading("Create a new record of type " + typeNameToAdd + " under your existing "  + currentFolder.getObjInstance().instanceName + " " + currentFolder.getObjInstance().type.typeName  + " record." );
		}
		nameLabel.setHtml(typeNameToAdd + " title:");

		toggleChldLnkVisibility(olt.allowChldLink);
		toggleChldCrVisibility(olt.allowChldCreate);
		
		if (olt.childType.typeCategory != null && ProjectConstants.uploadableCategories.contains(olt.childType.typeCategory)) {
			multiUploadEnabled = true;
			toggleUploadVisibility(true);
		} else {
			multiUploadEnabled = false;
			toggleUploadVisibility(false);			
		}
		
		if (w!=null) {
			w.setSize(620, initialHeight);
		}
				
		if (olt.allowChldLink == true && w!= null) {
			w.setHeight(String.valueOf(w.getHeight() + 100));			
		}
		
		if (olt.allowChldCreate == true && w!=null) {
			w.setHeight(String.valueOf(w.getHeight() + 100));
		}
		 		
		if (multiUploadEnabled == true) {
			uploadTable = new Grid();
			uploadLabel.setHtml("Upload your " + typeNameToAdd +"s:");									
			fileInput.readyToPaint();
			if (w!=null) {
				w.setHeight(String.valueOf(w.getHeight() + 100));
			}
		} 
		
		//Can't add this listener until the window is displayed
	    radioGroup.addListener(Events.Change, new Listener<BaseEvent>(){
	          public void handleEvent(BaseEvent be) {        	  	
	        	  	radioGroupProcess();
	          }
	    });
	    
	    if (w!= null) {
	    	w.center();
	    }
		
	    okButton.enable();
	    cancelButton.enable();
	    
	    layout();
		
	}

	private void toggleChldLnkVisibility(boolean allowChildLinking ) {
		
		if (allowChildLinking) {
			childObjUseExistingFieldset.show();
			useExistingRb.show();
			objTypeCombo.show();
			useExistingLabel.show();
			
			useExistingRb.enable();			
			useExistingRb.setValue(true);			
			objTypeCombo.enable();
			
			useExistingLabel.setHtml("Use an existing record of type " + typeNameToAdd + ":");
		} else {
			
			useExistingRb.setValue(false);
			useExistingRb.disable();
			objTypeCombo.disable();		
			
			useExistingRb.hide();
			objTypeCombo.hide();
			useExistingLabel.hide();	
			childObjUseExistingFieldset.hide();
		}
	}
	
	private void toggleChldCrVisibility(boolean allowChildCreation ) {
		
		if (allowChildCreation) {		
			childObjCrFieldset.show();
			newObjTypeNmField.show();
			createNewLabel.show();
			useNewRb.show();
			
			useNewRb.enable();
			useNewRb.setValue(true);			
			newObjTypeNmField.enable();
			
			createNewLabel.setHtml("Create a new record of type " + typeNameToAdd +":");
		} else {						
			useNewRb.disable();
			newObjTypeNmField.disable();
			useNewRb.setValue(false);
			
			createNewLabel.hide();
			useNewRb.hide();
			newObjTypeNmField.hide();
			childObjCrFieldset.hide();
		}	
	}
	
	private void toggleUploadVisibility(boolean allowMutiFileUpload ) {
		
		if (allowMutiFileUpload) {	
			multiFileFieldset.show();
			useMultiFileRb.enable();
			//swfUploadUtil.getSwfUpload().setButtonDisabled(false);			
			useMultiFileRb.show();
		} else {						
			useMultiFileRb.disable();
			//swfUploadUtil.getSwfUpload().setButtonDisabled(true);
			useMultiFileRb.setValue(false);
			useMultiFileRb.hide();
			multiFileFieldset.hide();			
		}	
	}
	
	private SelectionListener<ButtonEvent> getOkButtonListener() {

		return new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {

				if (!uploadInProgress) {	
					newOrExistingRbStr = (String)radioGroup.getValue().getData("value");
		        	if (newOrExistingRbStr.equals("new")) {	 
		        				        		
		        		AsyncCallback<ObjectTypeTree> cb = new ErrorHandlingAsyncCallback<ObjectTypeTree> () {
							@Override
							public void onSuccess(ObjectTypeTree result) {	
								int newInstanceId = Integer.valueOf(((ObjectTypeTree)result.getChild(0)).getObjInstance().instanceId);
								fpInstanceId.setValue(String.valueOf(newInstanceId));							
								fpanel.submit();
								result.setParent(currentFolder);		
								result.getObjInstance().parent.parent =currentFolder.getObjInstance(); 
								instanceChangeNotifyListener.instanceChangeNotification(currentFolder, result, false);								
							}		        			
		        		};
		        		
		        		props = fieldToProps(fields);		        		
		        		new CreateObjInstanceCommand(cb).execute( currentFolder.getObjInstance().instanceId,  olt, newObjTypeNmField.getValue(), props);
		        		if (w != null) {
		        			w.hide();
		        		}
		        		
		        	} else 	if (newOrExistingRbStr.equals("existing")) {	   
		        		
		        		AsyncCallback<ObjectTypeTree> callback = new ErrorHandlingAsyncCallback<ObjectTypeTree> () {
							@Override
							public void onSuccess(ObjectTypeTree result) {
								
								for (ModelData md : result.getChildren()) {
									ObjectTypeTree ott = (ObjectTypeTree)md ;
									ott.setParent(currentFolder);
								}
								//result.getObjInstance().parent.parent =currentFolder.getObjInstance(); 
								instanceChangeNotifyListener.instanceChangeNotification(currentFolder, result, false);
							}		        			
		        		};
		        		
		        		new LinkObjInstanceCommand (callback).execute((String) currentFolder.getObjInstance().instanceId, (String) objTypeCombo.getValue().getObjInstance().instanceId, olt);
		        		
		        		if (w != null) {
		        			w.hide();
		        		} else {
		        			Window.alert("Instances linked");
		        		}
		        		
		        	} else 	if (newOrExistingRbStr.equals("multifile")) {	   
		        		if (!uploadInProgress) {
	        				fileInput.uploadFiles();		
		        			okButton.disable();
		        			cancelButton.disable();		        			
		        		}
		        		
		        	}
	        	} else {
	        		Window.alert("Upload in progress, please wait until it completes");
	        	}				
			}


		};
	}

	private HashMap<String, Object> fieldToProps(HashMap<String, Field> fields) {
		HashMap<String, Object> lprops = new HashMap<String, Object>();
		for (String name : fields.keySet()) {
			Field fld = fields.get(name);
			lprops.put(name, fld.getValue());
		}
		return lprops;
	}
	
	@Override
	public HashMap <String, String>  getPostParams() {		
		return uploadPostParams;
	}

	@Override
	public void uploadStartedEventHandler() {
		okButton.setEnabled(false);
		uploadInProgress = true;		
		
	}
	
	@Override
	public void uploadDoneEventHandler() {		
		instanceChangeNotifyListener.instanceChangeNotification(currentFolder);
		uploadInProgress = false;		
		if (w!= null) {
			w.hide();
		}
		okButton.setEnabled(true);
	}

}
