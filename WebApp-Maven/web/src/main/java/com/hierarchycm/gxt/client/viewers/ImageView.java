package com.hierarchycm.gxt.client.viewers;

import java.util.List;

import org.appfuse.client.InputListWidget;

import com.extjs.gxt.ui.client.Style.HorizontalAlignment;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.ComponentEvent;
import com.extjs.gxt.ui.client.event.EventType;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.KeyListener;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.util.KeyNav;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.MessageBox;
//import com.extjs.gxt.ui.client.widget.Window;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.FlowLayout;
import com.extjs.gxt.ui.client.widget.toolbar.ToolBar;
import com.google.gwt.event.dom.client.ErrorEvent;
import com.google.gwt.event.dom.client.ErrorHandler;
import com.google.gwt.event.dom.client.KeyCodes;
import com.google.gwt.event.dom.client.LoadEvent;
import com.google.gwt.event.dom.client.LoadHandler;
import com.google.gwt.user.client.Event;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.Image;
import com.hierarchycm.gxt.client.commands.GetInstanceDetailsCommand;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

public class ImageView extends ContentPanel implements InstanceViewPanel {

	private Image image;
	LayoutContainer container;
	private int originalWidth, originalHeight;
	private static final int INCREMENT = 2;
	private static final int MIN_SIZE = 50;
	
	private static final int yFudge = 61;
	private static final int xFudge = 16;
	
	static final int tagXaxisFudge = 18;//40;//18;
	
	private static final int toolbarFudge = 31;
	
	ObjectInstLink oil;	 
	
	private int mouseX;
	private int mouseY;
	
	private ImageView rp = this;
	
	private String originalImagePath = null;
	private String originalName = null;
	
	private int rotateAmount = 0; 
	
	private ObjectTypeTree ott;
	private ObjectInstanceViewerPanel parentPanel;
	
	private InputListWidget inputListWidget;
	
	com.extjs.gxt.ui.client.util.Scroll scroll = null;
	
	
	private Listener<ComponentEvent> mouseMoveListener = 
		new Listener<ComponentEvent>() {
		public void handleEvent(ComponentEvent ce) {
			ce.stopEvent();
			int x , y;
			
			x = ce.getClientX();
			y = ce.getClientY();
			
			if (ce.within(rp.getElement())) {
				int xDelta = x- mouseX;
				int yDelta = y- mouseY;

				rp.getBody().scrollTo("left", -xDelta);
				rp.getBody().scrollTo("top", -yDelta);

			}
		}
	};
	
	private Listener<ComponentEvent> mouseUpListener = 
		new Listener<ComponentEvent>() {
		public void handleEvent(ComponentEvent ce) {
			rp.getItem(0).removeListener(Events.OnMouseMove, mouseMoveListener);
			rp.getItem(0).removeListener(Events.OnMouseUp, mouseUpListener);
			scroll = rp.getBody().getScroll();
		}
	};
	
	Button zoomIn, zoomOut, zoomFit, zoomOriginal, rotateLeft, rotateRight, previousItem, nextItem;
	
	com.extjs.gxt.ui.client.widget.Window parentWindow = null;
	private AlbumViewWrapper albumView;
	
	public ImageView(com.extjs.gxt.ui.client.widget.Window objectInstanceViewer){
		parentWindow = objectInstanceViewer;		
		initialize();
	}
	
	public ImageView(){
		initialize();
	}
	
	public ImageView(com.extjs.gxt.ui.client.widget.Window parentWindow, AlbumViewWrapper albumView,  ObjectInstanceViewerPanel objectInstanceViewerPanel) {
		this.parentWindow = parentWindow;
		this.albumView = albumView;		
		this.parentPanel = objectInstanceViewerPanel;
		initialize();
		//don't do anything with ott yet, wait till oil record comes in via notification
	}

	private void initialize() {
		setHeaderVisible(false);
		setLayout(new FlowLayout());
		this.setScrollMode(Scroll.AUTO);	
		createButtons();
		ToolBar tool = new ToolBar();
		tool.setAlignment(HorizontalAlignment.RIGHT);
		tool.add(zoomIn);
		tool.add(zoomOut);
		tool.add(zoomFit);
		tool.add(zoomOriginal);
		tool.add(rotateRight);
		tool.add(rotateLeft);
		tool.add(previousItem);
		tool.add(nextItem);
		setTopComponent(tool);	
	}
	
	public void setResource(String path, String name) {
		originalImagePath = path;
		originalName = name;
		
		grabNewImg(path, name);
	}
	
	public void grabNewImg(String path, String name) {
		removeAll();
					
		image = new Image(path);
				
		image.setTitle(name);
		image.addLoadHandler(new LoadHandler() {
			@Override
			public void onLoad(LoadEvent event) {
				originalWidth = image.getWidth();			
				originalHeight = image.getHeight();							
				fitToContainer();
				unmask();
			}
		});
		image.addErrorHandler(new ErrorHandler() {
			@Override
			public void onError(ErrorEvent event) {
				MessageBox.alert("error", "error", null);
			}
		});
		//image.setWidth("100%");
		

		add(image);
		
		
		this.getItem(0).addListener(Events.OnMouseDown, 
				new Listener<ComponentEvent>() {
					public void handleEvent(ComponentEvent ce) {
						ce.stopEvent();
						rp.getItem(0).addListener(Events.OnMouseMove, mouseMoveListener);
						rp.getItem(0).addListener(Events.OnMouseUp, mouseUpListener);
						
						if (scroll == null ) {
							rp.mouseX = ce.getClientX();
							rp.mouseY = ce.getClientY();						
						} else {
							rp.mouseX = ce.getClientX() + scroll.getScrollLeft();
							rp.mouseY = ce.getClientY() + scroll.getScrollTop();
						}						
					}
				}
			);
		
		this.mask("loading...");
		image.setVisible(false);		

		layout();
		add(getInputListWidget());
		
	}
	
	private void fitToContainer(boolean resizeParent) {

		int bW = getBody().getWidth(true);
		int bH = getBody().getHeight(true) - ObjectInstanceViewerPanel.tagsYaxisFudge;

		//if it's smaller let's make it greater
		if (bW != 0 && bH != 0 && originalWidth != 0 && originalHeight !=0 ) {
			//image original size
			int w = originalWidth;
			int h = originalHeight;
			
			while(w < bW && h < bH) {
				w *= INCREMENT;
				h *= INCREMENT;
			}		
		
			if(w > bW) {
				double ratio = (double)w / (double)bW;
				w = bW;
				h = (int)(h / ratio);
			}				
			
			if(h > bH) {
				double ratio = (double)h / (double)bH;
				h = bH;
				w = (int)(w / ratio);
			}
		
			image.setSize(w + "px", h + "px");
			image.setVisible(true);	
			
			resizeInputListWidget();
			
			if(parentWindow!= null && resizeParent) {
				parentWindow.setHeight(h + yFudge +ObjectInstanceViewerPanel.tagsYaxisFudge);
				parentWindow.setWidth(w+xFudge);
				parentWindow.center();
			}
		}
	}
	
	private void positionImage() {
		int newX, newY;
		int bW = getBody().getWidth(true);
		int bH = getBody().getHeight(true);
		if(image.getWidth() > bW) newX = 0;
		else {
			newX = (bW / 2 - image.getWidth() / 2);
		}
		if(image.getHeight() > bH) newY = 0;
		else {
			newY = (bH / 2 - image.getHeight() / 2);
		}
	}
	
	private void createButtons() {
		zoomIn = new Button();
		zoomIn.setIconStyle("icon-zoom-in");
		zoomIn.setToolTip("zoom in");
		zoomIn.addSelectionListener(new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				int newW = image.getWidth() * INCREMENT;
				int newH = image.getHeight() * INCREMENT;
				image.setSize(newW + "px", newH + "px");
				positionImage();
			}
		});
		zoomOut = new Button();
		zoomOut.setIconStyle("icon-zoom-out");
		zoomOut.setToolTip("zoom out");
		zoomOut.addSelectionListener(new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				if(image.getWidth() < MIN_SIZE || image.getHeight() < MIN_SIZE) return;
				int newW = image.getWidth() / INCREMENT;
				int newH = image.getHeight() / INCREMENT;
				image.setSize(newW + "px", newH + "px");
				positionImage();
			}			
		});
		zoomFit = new Button();
		zoomFit.setIconStyle("icon-fit-to-panel");
		zoomFit.setToolTip("fit to container");
		zoomFit.addSelectionListener(new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				fitToContainer();
			}
		});
		zoomOriginal = new Button();
		zoomOriginal.setIconStyle("icon-actual-size");
		zoomOriginal.setToolTip("Original size");
		zoomOriginal.addSelectionListener(new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				image.setSize(originalWidth + "px", originalHeight + "px");
				
			}
		});
		
		rotateLeft = new Button();
		rotateLeft.setIconStyle("icon-rotate-left");
		rotateLeft.setToolTip("Rotate left");
		rotateLeft.addSelectionListener(new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				rotateAmount = rotateAmount - 90;
				grabNewImg(originalImagePath+"&rotateDegrees="+rotateAmount, originalName);
			}
		});
		
		rotateRight = new Button();
		rotateRight.setIconStyle("icon-rotate-right");
		rotateRight.setToolTip("Rotate right");
		rotateRight.addSelectionListener(new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				rotateAmount = rotateAmount + 90;
				grabNewImg(originalImagePath+"&rotateDegrees=" + rotateAmount, originalName); 
			}
		});
		
		previousItem = new Button();
		previousItem.setIconStyle("icon-backward");
		previousItem.setToolTip("Previous Item");
		previousItem.addSelectionListener(new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				moveBackward();
			}
		});
		
		nextItem = new Button();
		nextItem.setIconStyle("icon-forward");
		nextItem.setToolTip("Next Item");
		nextItem.addSelectionListener(new SelectionListener<ButtonEvent>() {
			@Override
			public void componentSelected(ButtonEvent ce) {
				moveForward();
			}
		});
		
		KeyNav kn = new KeyNav<ComponentEvent>()  {			
			@Override public void onLeft(ComponentEvent ce) {				
				moveBackward(); 
			}
			
			@Override public void onRight(ComponentEvent ce) {
				moveForward();				
			}
		};
		
		kn.bind(this);
		kn.bind(getTopComponent());		
		kn.bind(previousItem);
		
	}
	
	boolean processingKeyPress = false;
	private List<ModelData> children;
	private boolean tagsEnabled = false;
	//private int tagsFudge = 50;
	
    public void toggleProcessing () {
   	 if (processingKeyPress) {
   		 processingKeyPress = false;
   	 } else  {
   		 processingKeyPress = true;
   	 }
    }
	
	public void fitToContainer() {
		fitToContainer(true);
	}
	
	
	@Override
	protected void onResize(int width, int height) {
		super.onResize(width, height);	
		fitToContainer(false);

		if (parentWindow!=null && (parentWindow.getHeight() - height != toolbarFudge)) {		
			setHeight(parentWindow.getHeight()-toolbarFudge);			
		}
		
		
		
		//resizeInputListWidget();
		
		scroll = null;		
	}
	
	
	@Override
	public ObjectInstLink getObjectInstanceLink() {
		return oil;
	}

	@Override
	public void setObjectInstanceLink(ObjectInstLink objectInstanceLink) {
		this.oil = objectInstanceLink;		
		originalWidth=0;
		originalHeight=0;
		if (Integer.valueOf(oil.child.uniqueFieldData.get("width"))<800) {		
			setResource("/DisplayBlob?imageId="+objectInstanceLink.child.instanceId, objectInstanceLink.child.instanceName);
		} else {		
			setResource("/DisplayBlob?imageId="+objectInstanceLink.child.instanceId + "&imageType=windowpic", objectInstanceLink.child.instanceName);
		}		
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree oldParent,
			ObjectTypeTree newParent, boolean purgeChildren) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void instanceChangeNotification(ObjectTypeTree itemChanged) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean moveForward() {
		Integer itemPos = ott.get("itemPosition");	
		Integer maxPos = ott.get("maxPosition");
		if (itemPos < maxPos -1) {
			ObjectTypeTree nextItem = albumView.getObjectTypeTreeAt(itemPos +1);					
			//parentWindow.hide();					
			//parentWindow.setSize(800, 800);
			parentPanel.loadAlbumItem(nextItem, albumView);
			return true;
		}  else {
			return false;
		}
		
	}

	@Override
	public boolean moveBackward() {
		Integer itemPos = ott.get("itemPosition");				
		
		if (itemPos > 0) {
			ObjectTypeTree previousItem = albumView.getObjectTypeTreeAt(itemPos -1);								
			//parentWindow.hide();					
			//parentWindow.setSize(800, 800);
			parentPanel.loadAlbumItem(previousItem, albumView);
			return true;
		} else  {
			return false;
		}
		
	}

	
	
	@Override
	public void setObjectTypeTree(ObjectTypeTree ott) {
		this.ott = ott;		
		if (ott.getChildren()!=null &&
		    ott.getChild(0)!=null) {
			List <ModelData> children = ((ObjectTypeTree)ott.getChild(0)).getChildren();
			this.children = children;
		
			tagsEnabled=true;							
			
		}				
	} 
	
	
	private InputListWidget getInputListWidget() {
		if (inputListWidget==null) {
			if (parentWindow.getWidth()-tagXaxisFudge > 0) {				
				inputListWidget = new InputListWidget(parentWindow.getWidth()-tagXaxisFudge);
			} else {
				inputListWidget = new InputListWidget(50);
			}
		} 			
		return inputListWidget;		
	}
	
	private void resizeInputListWidget() {
		if (parentWindow.getWidth()-tagXaxisFudge > 0) {				
			 getInputListWidget().setWidth(parentWindow.getWidth()-tagXaxisFudge);
		} else {
			 getInputListWidget().setWidth(50);
		}

	}
}
