/*
 * Ext GWT - Ext for GWT
 * Copyright(c) 2007-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */
package com.hierarchycm.gxt.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import com.hierarchycm.shared.client.GxtException;
import com.hierarchycm.gxt.client.Resources;
import com.hierarchycm.gxt.client.commands.DeleteObjectInstanceCommand;
import com.hierarchycm.gxt.client.commands.DeleteObjectInstanceLinkCommand;
import com.hierarchycm.gxt.client.commands.ErrorHandlingAsyncCallback;
import com.hierarchycm.gxt.client.commands.GetInstanceHierarchyCommand;
import com.hierarchycm.gxt.client.commands.SimpleCommand;
import com.hierarchycm.gxt.client.create.CreateChildInstanceDialog;
import com.hierarchycm.gxt.client.model.ObjectInstance;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.client.viewers.ObjectInstanceViewerWindow;
import com.extjs.gxt.ui.client.Style.HorizontalAlignment;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.data.ModelIconProvider;
import com.extjs.gxt.ui.client.event.BaseEvent;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.event.MenuEvent;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.store.TreeStore;
import com.extjs.gxt.ui.client.widget.Component;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.menu.Menu;
import com.extjs.gxt.ui.client.widget.menu.MenuItem;
import com.extjs.gxt.ui.client.widget.toolbar.ToolBar;
import com.extjs.gxt.ui.client.widget.treegrid.TreeGridCellRenderer;
import com.extjs.gxt.ui.client.widget.treepanel.TreePanel;
import com.google.gwt.user.client.Element;
import com.google.gwt.user.client.Event;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;

public class ObjectInstanceTreePanel extends ContentPanel implements  InstanceChangeNotifyable {

	public ObjectModelTreePanel objectTypePanel;	
	private static ObjectTypeTree currentFolder;

	InstanceChangeNotifyable thisPanel = this;
	
	private static final DatabaseServiceAsync dbService =  DbServiceProvider.getDbService();

	final static TreeStore<ModelData> store = new TreeStore<ModelData>();
	final static TreePanel<ModelData> tree = new TreePanel<ModelData>(store);

	final HashMap<String, Menu> typeMenuHm = new HashMap<String, Menu>();


	TreeGridCellRenderer<ObjectTypeTree> tgcr = new TreeGridCellRenderer<ObjectTypeTree>();
	
	public ObjectInstanceTreePanel() {
		
		maskMessage = "Loading";
		
		Button rotateRight = new Button();
		rotateRight.setIconStyle("icon-refresh");
		rotateRight.setToolTip("Refresh");
		rotateRight.addSelectionListener(new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				//Window.alert("Refresh Clicked");
				
				new PopulateLoginObjectInstanceStoreCommand(ObjectInstanceTreePanel.this).execute();
			}
		});
		
		this.setHeaderVisible(false);
		
		ToolBar tool = new ToolBar();
		tool.add(rotateRight);
		tool.setAlignment(HorizontalAlignment.LEFT);
		setTopComponent(tool);	
	}

	@Override
	protected void onRender(Element parent, int pos) {
		super.onRender(parent, pos);		
		getObjectModelTree();				
		loadAllObjectTypes();
		setLayout(new FitLayout());	
		
		add(tree);

	}
	
	@Override
	public void instanceChangeNotification(ObjectTypeTree oldParent, ObjectTypeTree newParent, boolean purgeChildren) {

		if (purgeChildren) {	
			store.removeAll(oldParent);					
			store.add(oldParent, newParent.getChildren(), true);
			if (tree != null ) {
				tree.setExpanded(oldParent, true);
			}
		} else {
			store.add(oldParent, newParent.getChildren(), true);			
			tree.setExpanded(oldParent, true);					
		}
		
	}
	
	@Override
	public void instanceChangeNotification(ObjectTypeTree itemChanged) {
		//new PopulateCurrentObjectInstanceStoreCommand().execute();
		currentFolder = itemChanged;
		
		AsyncCallback <ObjectTypeTree> callback = new ErrorHandlingAsyncCallback<ObjectTypeTree>() {
			@Override
			public void onSuccess(ObjectTypeTree result) {
				instanceChangeNotification(currentFolder, (ObjectTypeTree)result.getChild(0), true);
			}			
		};
		
		(new GetInstanceHierarchyCommand(callback)).execute(itemChanged.getObjInstance().instanceId);

	}


	public void getObjectModelTree() {
		tree.setIconProvider((ModelIconProvider<ModelData>)(new MyModelIconProvider<ModelData>()));
		tree.setDisplayProperty("name");
		tree.getStyle().setLeafIcon(Resources.ICONS.music());
		//tree.setWidth(250);

		Menu contextMenu = new Menu();
		tree.addListener(Events.ContextMenu, new Listener<BaseEvent>() {
			public void handleEvent(final BaseEvent bee) {
				final ObjectTypeTree folder = (ObjectTypeTree)tree.getSelectionModel().getSelectedItem();
				Menu currentContextMenu = getContextMenuItem(folder.getObjInstance().type.typeId);
				tree.setContextMenu(currentContextMenu);
			}
		}); 
		
		tree.sinkEvents(Event.ONDBLCLICK);
		tree.addListener(Events.OnDoubleClick, new Listener<BaseEvent>() {
			public void handleEvent(final BaseEvent bee) {
				//Window.alert("Hello");
				final ObjectTypeTree folder = (ObjectTypeTree)tree.getSelectionModel().getSelectedItem();		
				
				(new ObjectInstanceViewerWindow()).loadItem(folder);				
			}
		});
 
		tree.setContextMenu(contextMenu);

		new PopulateLoginObjectInstanceStoreCommand(this).execute();
	}
	
	public static class PopulateLoginObjectInstanceStoreCommand extends SimpleCommand {
		
		transient ObjectInstanceTreePanel tpInstance;
		
		final AsyncCallback<ObjectTypeTree> dbGetTreeCallback = new AsyncCallback<ObjectTypeTree>() {

			@Override
			public void onFailure(Throwable caught) {

				String details = caught.toString();
				if (caught instanceof GxtException) {
					details = " Original Message: "	+ ((GxtException) caught).getOriginalMessage();
				}
				tpInstance.unmask();
				Window.alert("Error occurred while communicating with server: "	+ details);
				
			}

			@Override
			public void onSuccess(ObjectTypeTree result) {
				store.removeAll();
				store.add(result.getChildren(), true);
				
				tpInstance.unmask();
				
			}
		};
		
		public PopulateLoginObjectInstanceStoreCommand(){}
		
		PopulateLoginObjectInstanceStoreCommand(ObjectInstanceTreePanel tpInstance) {
			this.tpInstance = tpInstance;
		}

		public void execute() {		
			tpInstance.mask("Loading","x-mask-loading");
			dbService.getObjInstHier(this, dbGetTreeCallback);			
		}
	}
	
	public Menu getContextMenuItem(String typeid) {
		Menu contextMenuResult = null;
		if (typeMenuHm.get(typeid) == null) {
			final Menu contextMenu = new Menu();

			final AsyncCallback<HashMap<String, ObjectLinkType>> getTypeSubtypesCallBack = new AsyncCallback<HashMap<String, ObjectLinkType>>() {
				@Override
				public void onFailure(Throwable caught) {
				}

				@Override
				public void onSuccess(HashMap<String, ObjectLinkType> result) {

					if (result!=null) {
						Iterator<ObjectLinkType> i = result.values().iterator();
	
						while (i.hasNext()) {
							ObjectLinkType olt = i.next();
							contextMenu.add(getMenuInsertItem(tree, store, olt));
							
						}
						contextMenu.add(getMenuRemoveItemLink(tree, store));
						contextMenu.add(getMenuRemoveItem(tree, store));
						contextMenu.add(getMenuViewItem(tree, store));
						contextMenu.enable();
						contextMenu.repaint();
					}
				}
			};

			new GetTypeSubtypes(typeid, getTypeSubtypesCallBack).execute();

			typeMenuHm.put(typeid, contextMenu);

			contextMenu.disable();
			contextMenuResult = contextMenu;
		} else {
			contextMenuResult = typeMenuHm.get(typeid);
		}
		
		for (Component item : contextMenuResult.getItems()) {
			MenuItem menuItem = (MenuItem) item;
			List<ModelData> selected = tree.getSelectionModel().getSelectedItems();
			ObjectTypeTree thisOtt = (ObjectTypeTree)selected.get(0);
			
			if (menuItem.getText().contains("(Link ID:")) {			
				menuItem.setText(menuItem.getText().replaceAll("\\(Link ID: [^\\)]*\\)", "(Link ID: "  + thisOtt.getObjInstance().parent.instanceLinkId + ")") );
			} else {
				if (!menuItem.getText().contains("Type ID")) {
					menuItem.setText(menuItem.getText() +  " (Link ID: "  +  thisOtt.getObjInstance().parent.instanceLinkId + ")");
				}
			}
			
			if (menuItem.getText().contains("(Instance ID:")) {			
				menuItem.setText(menuItem.getText().replaceAll("\\(Instance ID: [^\\)]*\\)", "(Instance ID: "  + thisOtt.getObjInstance().instanceId + ")") );
			} else {
				if (!menuItem.getText().contains("Type ID")) {
					menuItem.setText(menuItem.getText() +  " (Instance ID: "  +  thisOtt.getObjInstance().instanceId + ")");
				}
			}
		}
		
		return contextMenuResult;
	}

	static class GetTypeSubtypes extends SimpleCommand {
		AsyncCallback<HashMap<String, ObjectLinkType>> getTypeSubtypesCallBack;
		String topObjectTypeId;

		GetTypeSubtypes(String topObjectTypeId,
				AsyncCallback<HashMap<String, ObjectLinkType>> getTypeSubtypesCallBack) {
			this.getTypeSubtypesCallBack = getTypeSubtypesCallBack;
			this.topObjectTypeId = topObjectTypeId;
		}

		public void execute() {
			dbService.getTypeSubtypes(topObjectTypeId, getTypeSubtypesCallBack);
		}
	}

	public void refreshAllObjectTypes() {
		typeMenuHm.clear();
		loadAllObjectTypes();
	}
	
	public void refreshObjectType(String id) {
		typeMenuHm.put(id, null);
		getContextMenuItem(id);
		//loadAllObjectTypes();
	}
	
	public void loadAllObjectTypes() {
		dbService.getAllObjectTypes(new AsyncCallback<HashMap<String, ObjectTypeTree>>() {

					@Override
					public void onFailure(Throwable caught) {
					}

					@Override
					public void onSuccess(
							HashMap<String, ObjectTypeTree> ipAllObjectTypes) {

						ArrayList<ObjectTypeTree> alOt = new ArrayList<ObjectTypeTree>(
								ipAllObjectTypes.values());

						for (ObjectTypeTree bean : alOt) {
							getContextMenuItem((String) bean.getObjectType().typeId);
						}
					}
				});
	}

	public MenuItem getMenuInsertItem(final TreePanel<ModelData> tree, final TreeStore<ModelData> store, final ObjectLinkType olt) {
		
		MenuItem insert = new MenuItem();		
		
		insert.setText("Create " + olt.linkTypeName + " (Type ID: " + olt.childType.typeId+ ")");
		insert.setIcon(Resources.ICONS.add());
		insert.addSelectionListener(new SelectionListener<MenuEvent>() {
			public void componentSelected(MenuEvent ce) {
				ObjectTypeTree folder = (ObjectTypeTree)tree.getSelectionModel().getSelectedItem();
				if (folder != null) {				
					currentFolder = folder;
					//Window.alert(String.valueOf(folder.getObjInstance().parent.olt.allowChldCreate));
					new CreateChildInstanceDialog(thisPanel).loadItem(currentFolder, olt);
				}
			}
		});

		return insert;
	}
	
	public MenuItem getMenuRemoveItem(final TreePanel<ModelData> tree, final TreeStore<ModelData> store) {
		MenuItem remove = new MenuItem();
		remove.setText("Remove Selected");
		remove.setIcon(Resources.ICONS.delete());
		remove.addSelectionListener(new RemoveItemSelListener());
		return remove;
	}

	private class RemoveItemSelListener extends SelectionListener<MenuEvent> {
		public void componentSelected(MenuEvent ce) {
			List<ModelData> selected = tree.getSelectionModel().getSelectedItems();
			for (final ModelData sel : selected) {
				ObjectInstance oi = ((ObjectTypeTree) sel).getObjInstance();
				new DeleteObjectInstanceCommand(oi.instanceId, oi.type.typeId).execute();
				store.remove(sel);
			}
		}
	}
	
	public MenuItem getMenuRemoveItemLink(final TreePanel<ModelData> tree, final TreeStore<ModelData> store) {
		MenuItem remove = new MenuItem();
		List<ModelData> selected = tree.getSelectionModel().getSelectedItems();
		remove.setText("Remove Link to Selected");
		remove.setIcon(Resources.ICONS.delete());
		remove.addSelectionListener(new RemoveItemLinkSelListener());
		return remove;
	}

	private class RemoveItemLinkSelListener extends SelectionListener<MenuEvent> {
		public void componentSelected(MenuEvent ce) {
			List<ModelData> selected = tree.getSelectionModel().getSelectedItems();
			for (final ModelData sel : selected) {
				ObjectInstance oi = ((ObjectTypeTree) sel).getObjInstance();
				new DeleteObjectInstanceLinkCommand(oi.parent.instanceLinkId).execute();				
				store.remove(sel);
				//Window.alert("Instance Id: " + oi.instanceId);
				//Window.alert("Instance link Id: " + oi.parent.instanceLinkId);
			}
		}
	}
	
	public MenuItem getMenuViewItem(final TreePanel<ModelData> tree, final TreeStore<ModelData> store) {
		MenuItem remove = new MenuItem();
		remove.setText("View Selected");
		remove.setIcon(Resources.ICONS.delete());
		remove.addSelectionListener(new ViewItemSelListener());
		return remove;
	}
	
	private class ViewItemSelListener extends SelectionListener<MenuEvent> {
		public void componentSelected(MenuEvent ce) {
			ObjectTypeTree folder = (ObjectTypeTree)tree.getSelectionModel().getSelectedItem();					
			(new ObjectInstanceViewerWindow()).loadItem(folder);
		}
	}
}
