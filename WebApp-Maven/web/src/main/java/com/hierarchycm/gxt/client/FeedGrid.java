package com.hierarchycm.gxt.client;

import static com.calclab.emite.core.client.xmpp.stanzas.XmppURI.uri;

import java.util.ArrayList;  
import java.util.List;  
  

import com.calclab.emite.core.client.xmpp.stanzas.XmppURI;
import com.calclab.emite.im.client.roster.XmppRoster;
import com.extjs.gxt.ui.client.GXT;  
import com.extjs.gxt.ui.client.Registry;  
import com.extjs.gxt.ui.client.Style.HorizontalAlignment;  
import com.extjs.gxt.ui.client.Style.Orientation;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.data.BaseFilterPagingLoadConfig;  
import com.extjs.gxt.ui.client.data.BaseModelData;  
import com.extjs.gxt.ui.client.data.BasePagingLoadConfig;  
import com.extjs.gxt.ui.client.data.BasePagingLoader;  
import com.extjs.gxt.ui.client.data.FilterPagingLoadConfig;  
import com.extjs.gxt.ui.client.data.ModelData;  
import com.extjs.gxt.ui.client.data.PagingLoadResult;  
import com.extjs.gxt.ui.client.data.PagingLoader;  
import com.extjs.gxt.ui.client.data.RpcProxy;  
import com.extjs.gxt.ui.client.event.BaseEvent;  
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.Events;  
import com.extjs.gxt.ui.client.event.Listener;  
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.store.ListStore;  
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.util.Padding;
import com.extjs.gxt.ui.client.widget.ContentPanel;  
import com.extjs.gxt.ui.client.widget.Html;
import com.extjs.gxt.ui.client.widget.LayoutContainer;  
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.grid.ColumnConfig;  
import com.extjs.gxt.ui.client.widget.grid.ColumnData;
//import com.extjs.gxt.ui.client.widget.layout.ColumnData;
import com.extjs.gxt.ui.client.widget.grid.ColumnModel;  
import com.extjs.gxt.ui.client.widget.grid.Grid;  
import com.extjs.gxt.ui.client.widget.grid.GridCellRenderer;  
import com.extjs.gxt.ui.client.widget.grid.filters.BooleanFilter;  
import com.extjs.gxt.ui.client.widget.grid.filters.DateFilter;  
import com.extjs.gxt.ui.client.widget.grid.filters.GridFilters;  
import com.extjs.gxt.ui.client.widget.grid.filters.ListFilter;  
import com.extjs.gxt.ui.client.widget.grid.filters.NumericFilter;  
import com.extjs.gxt.ui.client.widget.grid.filters.StringFilter;  
import com.extjs.gxt.ui.client.widget.layout.ColumnLayout;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;  
import com.extjs.gxt.ui.client.widget.layout.FlowLayout;  
import com.extjs.gxt.ui.client.widget.layout.RowData;
import com.extjs.gxt.ui.client.widget.layout.RowLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout.VBoxLayoutAlign;
import com.extjs.gxt.ui.client.widget.table.NumberCellRenderer;  
import com.extjs.gxt.ui.client.widget.toolbar.PagingToolBar;  
import com.google.gwt.i18n.client.DateTimeFormat;  
import com.google.gwt.i18n.client.NumberFormat;  
import com.google.gwt.user.client.Element;  
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;  
import com.google.gwt.user.client.ui.AbstractImagePrototype;
import com.google.gwt.user.client.ui.Image;
import com.hierarchycm.gxt.client.commands.ApproveOilCommand;
import com.hierarchycm.gxt.client.commands.CommandWithCallback;
import com.hierarchycm.gxt.client.commands.ErrorHandlingAsyncCallback;
import com.hierarchycm.gxt.client.commands.GetFeedCommand;
import com.hierarchycm.gxt.client.commands.SimplifiedCommand;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectInstLinkModelData;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.shared.client.GxtException;
  
public class FeedGrid extends LayoutContainer {  

	Grid<ObjectInstLinkModelData> grid;
	
	private static final DatabaseServiceAsync dbService = DbServiceProvider
			.getDbService();

	String feedGridType;

	private ObjectTypeTree ott;

	public FeedGrid(String ipFeedGridType, ObjectTypeTree ott) {
		feedGridType = ipFeedGridType;
		this.ott = ott;

	}

	private SelectionListener<ButtonEvent> getOkButtonListener(
			final ObjectInstLinkModelData model, final AsyncCallback<Boolean> callBack) {
		return new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				
				String parentId = model.getObjectInstLink().parent.instanceId;
				String parentTypeId = model.getObjectInstLink().parent.type.typeId;
				String parentName= model.getObjectInstLink().parent.instanceName;
				String childId = model.getObjectInstLink().child.instanceId;
				String childTypeId = model.getObjectInstLink().child.type.typeId;	
				String childName = model.getObjectInstLink().child.instanceName;
				
				

				
				if ((GlobalRegistry.isOidMyPersonality(parentId) &&
					GlobalRegistry.isPersonalityType(childTypeId)) ||
					(GlobalRegistry.isOidMyPersonality(childId) &&
					 GlobalRegistry.isPersonalityType(parentTypeId))
					) {

						String myPersonality = null;
						String otherPersonality = null;
						String otherName = null;
						if (GlobalRegistry.isOidMyPersonality(parentId) ) {
							myPersonality = parentId;
							otherPersonality = childId;
							otherName = childName;
							
						} else if (GlobalRegistry.isOidMyPersonality(childId) ) {
							myPersonality = childId;	
							otherPersonality = parentId;
							otherName = parentName;
						}
						
						XmppURI xmppUri = uri(String.valueOf(otherPersonality)+"@" + GlobalRegistry.serverInfo.chatServer);
						
						XmppRoster xmppRoster = GlobalRegistry.getLoginXmppMap().get(myPersonality).xmppRoster;
						xmppRoster.requestAddItem(xmppUri, otherName);
											
					}
				
				final SimplifiedCommand<Boolean> approveCommand = new ApproveOilCommand(
						model.getObjectInstLink().instanceLinkId, true, callBack);
				approveCommand.execute();
			}
		};
	}
	
	private SelectionListener<ButtonEvent> getDenyButtonListener(
			final String oilId, final AsyncCallback<Boolean> callBack) {
			return new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {

				
				
				final SimplifiedCommand<Boolean> approveCommand = new ApproveOilCommand(
						oilId, false, callBack);
				approveCommand.execute();
			}
		};
	}

	private SelectionListener<ButtonEvent> getLoveItListener(
			final String oilId, final AsyncCallback<Boolean> callBack) {
		return new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				Window.alert("Coming soon");
				/*
				final SimplifiedCommand<Boolean> approveCommand = new ApproveOilCommand(oilId, true, callBack);
				approveCommand.execute();
				*/
			}
		};
	}
	
	private SelectionListener<ButtonEvent> getHateItListener(
			final String oilId, final AsyncCallback<Boolean> callBack) {
		return new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				/*
				final SimplifiedCommand<Boolean> approveCommand = new ApproveOilCommand(oilId, true, callBack);
				approveCommand.execute();
				*/
				Window.alert("Coming soon");
			}
		};
	}
	
	
	@Override
	protected void onRender(Element parent, int index) {
		super.onRender(parent, index);
		
		//this.setHeight(500);
		this.setBorders(false);

		
		/*
        VBoxLayout layout = new VBoxLayout();  
        layout.setPadding(new Padding(5));  
        layout.setVBoxLayoutAlign(VBoxLayoutAlign.STRETCH);
        */
		//setAutoHeight(true);
		//setAutoWidth(true);
        
        //this.setScrollMode(Scroll.ALWAYS);
        setLayout(new FitLayout());
        //setLayout(layout);
		
		getAriaSupport().setPresentation(true);

		// proxy
		RpcProxy<PagingLoadResult<ObjectInstLinkModelData>> proxy = new RpcProxy<PagingLoadResult<ObjectInstLinkModelData>>() {
			@Override
			public void load(
					Object loadConfig,
					AsyncCallback<PagingLoadResult<ObjectInstLinkModelData>> callback) {
				// SimplifiedCommand<PagingLoadResult<ObjectInstLinkModelData>>
				// command;
				GetFeedCommand command = new GetFeedCommand(
						(FilterPagingLoadConfig) loadConfig, feedGridType,
						callback);
				command.execute();
			}
		};

		// loader - based on proxy
		final PagingLoader<PagingLoadResult<ModelData>> loader = new BasePagingLoader<PagingLoadResult<ModelData>>(
				proxy) {
			@Override
			protected Object newLoadConfig() {
				BasePagingLoadConfig config = new BaseFilterPagingLoadConfig();
				return config;
			}
		};

		loader.setRemoteSort(true);

		// store - store based on loader
		ListStore<ObjectInstLinkModelData> store = new ListStore<ObjectInstLinkModelData>(
				loader);

		final NumberFormat currency = NumberFormat.getCurrencyFormat();
		final NumberFormat number = NumberFormat.getFormat("0.00");
		final NumberCellRenderer<Grid<ObjectInstLinkModelData>> numberRenderer = new NumberCellRenderer<Grid<ObjectInstLinkModelData>>(
				currency);

		GXT.isHighContrastMode = false;

		GridCellRenderer<ObjectInstLinkModelData> change = new GridCellRenderer<ObjectInstLinkModelData>() {
			public String render(ObjectInstLinkModelData model,
					String property, ColumnData config, int rowIndex,
					int colIndex, ListStore<ObjectInstLinkModelData> store,
					Grid<ObjectInstLinkModelData> grid) {
				double val = (Double) model.get(property);
				String style = val < 0 ? "red"
						: GXT.isHighContrastMode ? "#00ff5a" : "green";
				return "<span style='font-weight: bold;color:" + style + "'>"
						+ number.format(val) + "</span>";
			}
		};

		GridCellRenderer<ObjectInstLinkModelData> gridNumber = new GridCellRenderer<ObjectInstLinkModelData>() {
			public String render(ObjectInstLinkModelData model,
					String property, ColumnData config, int rowIndex,
					int colIndex, ListStore<ObjectInstLinkModelData> store,
					Grid<ObjectInstLinkModelData> grid) {
				return numberRenderer.render(null, property,
						model.get(property));
			}
		};

		List<ColumnConfig> configs = new ArrayList<ColumnConfig>();

		ColumnConfig column1 = new ColumnConfig();
		
		column1.setId("friendlyText");
		if (feedGridType.equals("requests")) {
			column1.setHeader("Incoming requests:");
		} else {
			column1.setHeader("Incoming feed:");
		}
		//column1.
		column1.setWidth(400);
		// column.setWidth(Integer.valueOf(this.width)-30);
		column1.setRenderer(new GridCellRenderer<ObjectInstLinkModelData>() {
			public Object render(ObjectInstLinkModelData model,
					String property, ColumnData config, int rowIndex,
					int colIndex, ListStore<ObjectInstLinkModelData> store,
					Grid<ObjectInstLinkModelData> grid) {
				return "<div style=\"white-space:normal !important;\">"
						+ model.get("friendlyText") + " </div>";
			}
		});
		
		configs.add(column1);
		ColumnConfig column2;
		if (feedGridType.equals("requests")) {
			column2 = new ColumnConfig();
			column2.setHeader("Approve or Deny");
			column2.setWidth(150);
			column2.setFixed(true);
			
			column2.setRenderer(new GridCellRenderer<ObjectInstLinkModelData>() {
				public Object render(final ObjectInstLinkModelData model,
						String property, ColumnData config, int rowIndex,
						int colIndex, final ListStore<ObjectInstLinkModelData> store,
						Grid<ObjectInstLinkModelData> grid) {

					final ErrorHandlingAsyncCallback<Boolean> approveCommandCallback = new ErrorHandlingAsyncCallback<Boolean>() {
						@Override
						public void onSuccess(Boolean result) {
							store.remove(model);
						}
					};

					Button approveButton = new Button("Approve",
							getOkButtonListener(
									model,
									approveCommandCallback));
					
					approveButton.setIcon(Resources.HCMICONS.checkIcon());
					

					Button denyButton = new Button("Deny", getDenyButtonListener(
							model.getObjectInstLink().instanceLinkId,
							approveCommandCallback));
					
					denyButton.setIcon(Resources.HCMICONS.letterXIcon());

					LayoutContainer lc = new LayoutContainer();
					lc.setHeight(50);
					lc.setLayout(new RowLayout(Orientation.HORIZONTAL));
					lc.add(approveButton , new RowData(.5,1, new Margins(1)));			
					lc.add(denyButton,new RowData(.5,1, new Margins(1)));  
					return lc;
				}
			});
			configs.add(column2);
		} else {
			column2 = new ColumnConfig();
			column2.setHeader("Love it or Hate it");
			column2.setWidth(130);			
			column2.setFixed(true);
			
			column2.setRenderer(new GridCellRenderer<ObjectInstLinkModelData>() {
				public Object render(final ObjectInstLinkModelData model,
						String property, ColumnData config, int rowIndex,
						int colIndex, final ListStore<ObjectInstLinkModelData> store,
						Grid<ObjectInstLinkModelData> grid) {

					final ErrorHandlingAsyncCallback<Boolean> approveCommandCallback = new ErrorHandlingAsyncCallback<Boolean>() {
						@Override
						public void onSuccess(Boolean result) {
							store.remove(model);
						}
					};

					Button loveItButton = new Button("Love it",
							getLoveItListener(
									model.getObjectInstLink().instanceLinkId,
									approveCommandCallback));
					loveItButton.setIcon(Resources.HCMICONS.heartBlue());

					Button hateItButton = new Button("Hate it", getHateItListener(
							model.getObjectInstLink().instanceLinkId,
							approveCommandCallback));
					
					hateItButton.setIcon(Resources.HCMICONS.letterXIcon());
					
					LayoutContainer lc = new LayoutContainer();
					lc.setHeight(50); 
					lc.setLayout(new RowLayout(Orientation.HORIZONTAL));
					lc.add(loveItButton , new RowData(.5,1, new Margins(1)));			
					lc.add(hateItButton,new RowData(.5,1, new Margins(1)));  
					return lc;

				}
			});
			configs.add(column2);

		}

		/*
		 * ColumnConfig column = new ColumnConfig(); column.setId("parentNm");
		 * column.setHeader("Parent Name"); column.setWidth(200);
		 * configs.add(column);
		 * 
		 * column = new ColumnConfig(); column.setId("childNm");
		 * column.setHeader("Child Name"); column.setWidth(100);
		 * configs.add(column);
		 * 
		 * column = new ColumnConfig(); column.setId("linkTypeName");
		 * column.setHeader("Link Type"); column.setWidth(100);
		 * //column.setAlignment(HorizontalAlignment.RIGHT);
		 * //column.setRenderer(gridNumber); configs.add(column);
		 * 
		 * column = new ColumnConfig("dateUpdated", "Last Updated", 120);
		 * column.setAlignment(HorizontalAlignment.RIGHT);
		 * column.setDateTimeFormat(DateTimeFormat.getFormat("MM/dd/yyyy"));
		 * configs.add(column);
		 * 
		 * column = new ColumnConfig("dateCreated", "Date Created", 120);
		 * column.setAlignment(HorizontalAlignment.RIGHT);
		 * column.setDateTimeFormat(DateTimeFormat.getFormat("MM/dd/yyyy"));
		 * configs.add(column);
		 */

		/*
		 * column = new ColumnConfig("change", "Change", 100);
		 * column.setAlignment(HorizontalAlignment.RIGHT);
		 * column.setRenderer(change); configs.add(column);
		 * 
		 * column = new ColumnConfig("split", "Split", 75);
		 * column.setRenderer(new GridCellRenderer<ObjectInstLinkModelData>() {
		 * public Object render(ObjectInstLinkModelData model, String property,
		 * ColumnData config, int rowIndex, int colIndex,
		 * ListStore<ObjectInstLinkModelData> store,
		 * Grid<ObjectInstLinkModelData> grid) { Boolean b =
		 * model.get(property); return b != null && b.booleanValue() ? "Yes" :
		 * "No"; } }); configs.add(column);
		 * 
		 * column = new ColumnConfig("type", "Type", 75); configs.add(column);
		 */

		ColumnModel cm = new ColumnModel(configs);

		/*
		LayoutContainer outerCp = new LayoutContainer();
        VBoxLayout layout = new VBoxLayout();  
        layout.setPadding(new Padding(5));  
        layout.setVBoxLayoutAlign(VBoxLayoutAlign.STRETCH);          
        outerCp.setLayout(layout);
		*/
		
		ContentPanel cp = new ContentPanel();
		cp.getHeader().hide();
		cp.setBodyBorder(false);
		cp.setBorders(false);
		//cp.setStyleAttribute("body", "none");
		
		
		cp.setIcon(Resources.ICONS.table());
		//cp.setHeading("Remote Filter Grid");		
		cp.setButtonAlign(HorizontalAlignment.CENTER);
        cp.setLayout(new FitLayout());
		//cp.setHeight(500);
		//cp.setScrollMode(Scroll.AUTO);
		
		//cp.getHeader().setBorders(false);
		//cp.getBody().setBorders(false);
		//cp.getBottomComponent().setBorders(false);

		/*
		 * 
		 * GridFilters filters = new GridFilters(); NumericFilter last = new
		 * NumericFilter("last"); NumericFilter filter = new
		 * NumericFilter("change"); StringFilter nameFilter = new
		 * StringFilter("name"); DateFilter dateFilter = new DateFilter("date");
		 * BooleanFilter booleanFilter = new BooleanFilter("split");
		 * 
		 * ListStore<ModelData> typeStore = new ListStore<ModelData>();
		 * typeStore.add(type("Auto")); typeStore.add(type("Media"));
		 * typeStore.add(type("Medical")); typeStore.add(type("Tech"));
		 * ListFilter listFilter = new ListFilter("type", typeStore);
		 * listFilter.setDisplayProperty("type");
		 * 
		 * filters.addFilter(last); filters.addFilter(nameFilter);
		 * filters.addFilter(filter); filters.addFilter(dateFilter);
		 * filters.addFilter(booleanFilter); filters.addFilter(listFilter);
		 */

		//Grid<ObjectInstLinkModelData> 
		
		grid = new Grid<ObjectInstLinkModelData>(
				store, cm);

		grid.addListener(Events.Attach, new Listener<BaseEvent>() {
			public void handleEvent(BaseEvent be) {
				loader.load(0, 25);
			}
		});
		grid.setStyleAttribute("x-grid3-cell-inner", "white-space: normal");
		grid.getView().setForceFit(true);
		grid.getView().setAutoFill(true);
		grid.setStyleAttribute("borderTop", "none");
		grid.setAutoExpandColumn(column1.getId());				
		grid.setBorders(false);
		
		
		grid.setStripeRows(true);
		grid.setColumnLines(true);		
		grid.setHeight(500);
		
		// grid.addPlugin(filters);
		cp.add(grid);
		

		final PagingToolBar toolBar = new PagingToolBar(25);
		toolBar.bind(loader);
		toolBar.setBorders(false);
		cp.setBottomComponent(toolBar);
		add(cp);

		/*
		LayoutContainer lc = new LayoutContainer();
		lc.setBorders(false);				
		add(lc);
		*/
		//grid.getView().refresh(true);
		
		//layout();
	}
	


	private ModelData type(String type) {
		ModelData model = new BaseModelData();
		model.set("type", type);
		return model;
	}
}