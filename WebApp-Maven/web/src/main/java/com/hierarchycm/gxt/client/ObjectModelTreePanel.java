/*
 * Ext GWT - Ext for GWT
 * Copyright(c) 2007-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */
package com.hierarchycm.gxt.client;


import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import com.hierarchycm.gxt.client.Resources;
import com.hierarchycm.gxt.client.commands.CommandWithCallback;
import com.hierarchycm.gxt.client.commands.SimpleCommand;
import com.hierarchycm.gxt.client.create.CreateChildModelTypeDialog;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.shared.client.GxtException;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.event.MenuEvent;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.store.TreeStore;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.layout.ColumnLayout;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.FlowData;
import com.extjs.gxt.ui.client.widget.menu.Menu;
import com.extjs.gxt.ui.client.widget.menu.MenuItem;
import com.extjs.gxt.ui.client.widget.treepanel.TreePanel;
import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.Element;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;

public class ObjectModelTreePanel extends LayoutContainer {
	
  public ObjectInstanceTreePanel objectInstancePanel;
	
  private static ObjectTypeTree model;
  
  private static ObjectTypeTree currentFolder;
    
  private static final DatabaseServiceAsync dbService = DbServiceProvider.getDbService(); 	  

  private static CreateChildModelTypeDialog w = null;

  static final TreeStore<ModelData> store = new TreeStore<ModelData>();
  static final TreePanel<ModelData> tree = new TreePanel<ModelData>(store);
    

  @Override
  protected void onRender(Element parent, int pos) {
    super.onRender(parent, pos);
    
    setLayout(new FitLayout());
    
    getObjectModelTree();
    //getAppConfig();
    add(tree, new FlowData(10));
    //w = new CreateChildModelTypeDialog(tree, store, currentFolder, objectInstancePanel);
    w = new CreateChildModelTypeDialog(tree, store, currentFolder, objectInstancePanel); 
  }
  
  public void destroyWindow () {
	  w.hide();
	  w = null;
  }
  
  public void getObjectModelTree() {
	    
		tree.setDisplayProperty("name");
		tree.getStyle().setNodeCloseIcon(Resources.ICONS.table());
		tree.getStyle().setNodeOpenIcon(Resources.ICONS.table());
		tree.getStyle().setLeafIcon(Resources.ICONS.table());
		//tree.setWidth(250);
		
		Menu contextMenu = new Menu();
		contextMenu.add(getMenuInsertItem());
		contextMenu.add(getMenuRemoveItem());
		contextMenu.add(getMenuRemoveAssoc());
		contextMenu.add(getMenuUpdateAssoc());
		
		tree.setContextMenu(contextMenu);  
				
		new PopulateTreeCommand().execute();
		
  }  
  
  public static class PopulateTreeCommand implements CommandWithCallback, Serializable
  {      
      transient AsyncCallback <ObjectTypeTree> dbGetTreeCallback = new AsyncCallback<ObjectTypeTree>() {        
			@Override
			public void onFailure(Throwable caught){
				
			} 

			@Override
			public void onSuccess(ObjectTypeTree result) {
				model = result;							
				store.add(model.getChildren(), true);				
			}
	  }; 
	  
     public void execute() 
      {
    	  dbService.getTopLevelHierarchy(this, dbGetTreeCallback);	
      }

	@Override
	public void setAsyncCallback(AsyncCallback callback) {
		// TODO Auto-generated method stub
		this.dbGetTreeCallback = callback;
		
	}       
  }
    
  public MenuItem getMenuInsertItem() {
	  
	    MenuItem insert = new MenuItem();
	    insert.setText("Create Association");
	    insert.setIcon(Resources.ICONS.add());
	    insert.addSelectionListener(new SelectionListener<MenuEvent>() {
	      public void componentSelected(MenuEvent ce) {
	    	  ObjectTypeTree folder = (ObjectTypeTree)tree.getSelectionModel().getSelectedItem();
	        if (folder != null) {
	          currentFolder = folder;	          
	          w.loadItem(currentFolder, "NEW LINK");
	        }
	      }
	    });
	    
	    return insert;
  }

  private MenuItem getMenuRemoveItem () {
	    MenuItem remove = new MenuItem();	  
	    remove.setText("Delete Object Type");
	    remove.setIcon(Resources.ICONS.delete());  
	    remove.addSelectionListener(new RemoveItemSelListener());
	    return remove;
  }
    
  private static class RemoveItemSelListener extends SelectionListener<MenuEvent>  {
	  
	  public void componentSelected(MenuEvent ce) {
	        List<ModelData> selected = tree.getSelectionModel().getSelectedItems(); 
	        for (final ModelData sel : selected) {
	          RemoveItemCommand removeItemCommand = new RemoveItemCommand();
	          removeItemCommand.sel = String.valueOf(((ObjectTypeTree)sel).getObjectType().typeId);
	          removeItemCommand.execute();		          
	          store.remove(sel);
	        }
	  }	  
  }
  
  public static class RemoveItemCommand extends SimpleCommand {
	  public String sel;

   	  public void execute() {
   		  dbService.deleteChild(sel, (CommandWithCallback)this ,  simpleVoidCallback);
   	  }	
  }
  
  public MenuItem getMenuUpdateAssoc() {
	  
	    MenuItem update = new MenuItem();
	    update.setText("Edit Association with Parent");
	    update.setIcon(Resources.ICONS.menu_show());
	    update.addSelectionListener(new SelectionListener<MenuEvent>() {
	      public void componentSelected(MenuEvent ce) {
	    	ObjectTypeTree folder = (ObjectTypeTree)tree.getSelectionModel().getSelectedItem();
	        if (folder != null) {
	          currentFolder = folder;
	          
	          new GetObjLnkTypeByKyCommand().execute();
	          	          		
	          w.loadItem(currentFolder, "UPDATE LINK");
       		 	          	          
	        }
	      }
	    });	    
	    return update;
  }
  
  public static class GetObjLnkTypeByKyCommand implements CommandWithCallback, Serializable
  {      
      transient private AsyncCallback <ObjectLinkType> dbGetTreeCallback = new AsyncCallback<ObjectLinkType>() {        
			@Override
			public void onFailure(Throwable caught){
				
			} 

			@Override
			public void onSuccess(ObjectLinkType result) {				
				w.populateFieldsFromOma(result);
			}
	  }; 
	  
     public void execute() 
      {
    	  dbService.getObjLnkTypeByKy( (String)currentFolder.getObjectType().parent.linkTypeId, this, dbGetTreeCallback);	
      }

	@Override
	public void setAsyncCallback(AsyncCallback callback) {
		this.dbGetTreeCallback = callback;
	}       
  }
    
  public MenuItem getMenuRemoveAssoc() {
	  
	  MenuItem removeAssoc = new MenuItem();
	  removeAssoc.setText("Remove Association");
	  removeAssoc.setIcon(Resources.ICONS.delete());
	  removeAssoc.addSelectionListener(new RemoveAssocSelListen());
	  return 	 removeAssoc; 
  }
  
  private class RemoveAssocSelListen extends SelectionListener<MenuEvent> {
	    public void componentSelected(MenuEvent ce) {
		      /*
	    	  List<ModelData> selected = tree.getSelectionModel().getSelectedItems();
		      for (final ModelData sel : selected) {		    	  
		    	  (new RemoveAssocCommand(sel)).execute();		      		    	  		     	  
		          store.remove(sel);
		      }
		      */
	    	
	    	  currentFolder  = (ObjectTypeTree)tree.getSelectionModel().getSelectedItem();
		      if (currentFolder != null) {		          
		    	  (new RemoveAssocCommand()).execute();
		    	  store.remove(currentFolder);
		      }
		     
	    }
  }
  
  private static class RemoveAssocCommand extends SimpleCommand {
	  
	  
	  private ObjectTypeTree sel = null;
	  RemoveAssocCommand() {
			//this.sel =  (ObjectTypeTree) sel;
	  }
	  
   	  public void execute() {
   		  //Window.alert(currentFolder.getObjectType().parent.linkTypeId);
   		  dbService.delObjLinkType((String)currentFolder.getObjectType().parent.linkTypeId , simpleVoidCallback);
   	  }	
  }  
}
