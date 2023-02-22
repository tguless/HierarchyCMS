package com.hierarchycm.gxt.client.viewers;

import java.util.ArrayList;
import java.util.List;

import com.extjs.gxt.ui.client.Style.HorizontalAlignment;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.Style.SortDir;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.event.ColumnModelEvent;
import com.extjs.gxt.ui.client.event.ComponentEvent;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.store.ListStore;
import com.extjs.gxt.ui.client.store.Store;
import com.extjs.gxt.ui.client.store.StoreEvent;
import com.extjs.gxt.ui.client.store.StoreFilter;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.ListViewSelectionModel;
import com.extjs.gxt.ui.client.widget.grid.ColumnConfig;
import com.extjs.gxt.ui.client.widget.grid.ColumnData;
import com.extjs.gxt.ui.client.widget.grid.ColumnModel;
import com.extjs.gxt.ui.client.widget.grid.Grid;
import com.extjs.gxt.ui.client.widget.grid.GridCellRenderer;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.RowData;
import com.extjs.gxt.ui.client.widget.layout.RowLayout;
import com.extjs.gxt.ui.client.widget.selection.AbstractStoreSelectionModel;
import com.google.gwt.user.client.Element;
import com.google.gwt.user.client.Window;
import com.hierarchycm.gxt.client.Resources;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectInstLinkModelData;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class AutoExpandGrid extends LayoutContainer  implements InstanceViewPanel, MultiSelectable {
	private ContentPanel cp;
	
	private Grid grid;  
	
	ListStore store = new ListStore();  
	ColumnConfig mainColumn;
	String mainColumnHeader;	
	
	protected void doAutoHeight() {  
		    if (grid!=null && grid.isViewReady()) {  
		      grid.getView().getScroller().setStyleAttribute("overflowY", "hidden");  
		      cp.setHeight((grid.getView().getBody().isScrollableX() ? 19 : 0) + grid.el().getFrameWidth("tb")  
		          + grid.getView().getHeader().getHeight() + cp.getFrameHeight()  
		          + grid.getView().getBody().firstChild().getHeight());  
		    }  
	} 
	
	public void setObjectTypeTree(ObjectTypeTree ott) {
		ObjectTypeTree topNode = (ObjectTypeTree)ott.getChild(0);
		if (topNode != null){	 		
	 		store.insert(topNode.getChildren(), 0);
	 		store.sort("when_updated", SortDir.DESC);
	 		doAutoHeight();
	 		if ((ObjectTypeTree)topNode.getChild(0) != null) {
		 		mainColumnHeader = ((ObjectTypeTree)topNode.getChild(0)).getObjInstance().type.typeName;
		 		
		 		if (mainColumn!=null){	 	
		 			grid.getColumnModel().getColumn(0).setHeader(((ObjectTypeTree)topNode.getChild(0)).getObjInstance().type.typeName); 			
		 			grid.reconfigure(store, grid.getColumnModel());
		 		}
	 		}
	 	} 			
	}
	
	 protected void onRender(Element parent, int index) {  
		super.onRender(parent, index); 

		setLayout(new RowLayout()); //if you don't do this the grid inside is not resizing. 
		this.setScrollMode(Scroll.AUTOY);
		cp = new ContentPanel();  		
	    cp.setHeading("Albumview in a grid");  
	    cp.setFrame(true); 
	    cp.setLayout(new FitLayout());
	    cp.setIcon(Resources.ICONS.table());
	    cp.getHeader().hide();
	    cp.setButtonAlign(HorizontalAlignment.CENTER);
	    	    				 
	    List<ColumnConfig> configs = new ArrayList<ColumnConfig>();  
	    
	    mainColumn = new ColumnConfig();  
	    mainColumn.setId("friendlyText");  
	    if (mainColumnHeader == null) {
	    	mainColumn.setHeader("Place holder");
	    } else {
	    	mainColumn.setHeader(mainColumnHeader);
	    }
	    
	    mainColumn.setRenderer(new GridCellRenderer<ObjectTypeTree>() {
			public Object render(ObjectTypeTree model,
					String property, ColumnData config, int rowIndex,
					int colIndex, ListStore<ObjectTypeTree> store,
					Grid<ObjectTypeTree> grid) {
				return "<div style=\"white-space:normal !important;\">"
						+ model.get("friendlyText") + " </div>";
			}
		});
	    
	    configs.add(mainColumn);
	    
	    ColumnModel cm = new ColumnModel(configs);
	    
	    grid = new Grid<ObjectTypeTree>(store, cm);  
	    grid.setAutoExpandColumn("name");  
		grid.getView().setForceFit(true);
		grid.getView().setAutoFill(true);
	    grid.setBorders(true);
		grid.setStripeRows(true);
		grid.setColumnLines(true);		
		
	    cp.add(grid);  
		 
		grid.addListener(Events.ViewReady, new Listener<ComponentEvent>() {  
		      public void handleEvent(ComponentEvent be) {  
		        grid.getStore().addListener(Store.Add, new Listener<StoreEvent<ObjectTypeTree>>() {  
		          public void handleEvent(StoreEvent<ObjectTypeTree> be) {  
		            doAutoHeight();  
		          }  
		        });  
		        doAutoHeight();  
		      }  
		});  
		 
	    grid.addListener(Events.ColumnResize, new Listener<ComponentEvent>() {  
	      public void handleEvent(ComponentEvent be) {  
	        doAutoHeight();  
	      }  
	    });  
	    
	    grid.getColumnModel().addListener(Events.HiddenChange, new Listener<ColumnModelEvent>() {  
	      public void handleEvent(ColumnModelEvent be) {  
	        doAutoHeight();  
	      }  
	    });  
	    
	    add(cp, new RowData(.98, -1, new Margins(4)));
	 }

	@Override
	public ObjectInstLink getObjectInstanceLink() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setObjectInstanceLink(ObjectInstLink objectInstanceLink) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree oldParent, ObjectTypeTree newParent, boolean purgeChildren) {
		if (grid.getStore()!= null) {
			grid.getStore().add(newParent.getChildren()); 	
	    }	
		doAutoHeight();
		
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree itemChanged) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean moveForward() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean moveBackward() {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public ModelData getSelectedItem() {
		return grid.getSelectionModel().getSelectedItem();
	}

	@Override
	public List<ModelData> getSelectedItems() {
		return grid.getSelectionModel().getSelectedItems();
	}

	@Override
	public void removeFromStore(ModelData objToRemove) {
		store.remove(objToRemove);
		doAutoHeight();
	}

	@Override
	public int getStoreItemCount() {
		return store.getCount();
	}

	@Override
	public void filterStore(String filter) {		
		store.clearFilters();
        StoreFilter<ModelData> numberFilter = new StoreFilter<ModelData>() {
            @Override
            public boolean select(Store<ModelData> store, ModelData parent,
                    ModelData item, String property) {
            		
            		if (property!= null && item.get("friendlyText") !=null) {
            	
	            		if (((String)item.get("friendlyText")).indexOf(property) >=0 ) {
	            			return true;
	            		} else {
	            			return false;
	            		}
            		}
            		return true;

                //return ((Integer)item.get(property)) > 122;
            }
        };
		
		store.addFilter(numberFilter);
		store.filter(filter);
	}
}
