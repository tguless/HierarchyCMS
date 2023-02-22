package com.hierarchycm.gxt.client.viewers;

//import pl.rmalinowski.gwt2swf.client.ui.SWFWidget;

import java.util.ArrayList;
import java.util.List;

import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.layout.AnchorData;
import com.extjs.gxt.ui.client.widget.layout.AnchorLayout;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;

import fr.hd3d.html5.video.client.VideoSource;
import fr.hd3d.html5.video.client.VideoWidget;

public class VideoView  extends ContentPanel implements InstanceViewPanel {

	
	AnchorLayout layout;
	
	ObjectInstLink oil;

	private ObjectTypeTree ott;	 
	
	public VideoView() {
		//setData("anchorSpec", new AnchorData("100% 100%"));		
		//layout = new AnchorLayout();		
		setLayout(new FitLayout());
	}
 
	public void setResource(String path, String instanceName) {
		
		//http://code.google.com/p/gwt2swf/
		/*
		SWFWidget swfWidget = new SWFWidget("player/jw.swf",500,300);
        swfWidget.addParam("allowfullscreen","true");
        swfWidget.addParam("allowscriptaccess","always");
        swfWidget.addFlashVar("autostart","false");
        swfWidget.addFlashVar("repeat","true");
        swfWidget.addFlashVar("id", "my_id");
        add(swfWidget);
        */
		//int panelHeight = parentWindow.calcHeight;
		//int panelWidth = parentWindow.calcWidth;
		
		
		//Window.alert("Setting resource to" + path);
		//http://code.google.com/p/gwt-html5-video/
		VideoWidget videoPlayer = new VideoWidget(true, true, "images/movie-reel.jpg");
        List<VideoSource> sources = new ArrayList<VideoSource>();
        //sources.add(new VideoSource(path, VideoType.MP4));
        sources.add(new VideoSource(path));
        //sources.add(new VideoSource("fr_hd3d_html5_video_demo/videos/bbb_trailer_360p.webm", VideoType.WEBM));
        videoPlayer.setSources(sources);
        
        videoPlayer.setWidth("100%");
        videoPlayer.setHeight("100%");
        
        
        /*
        videoPlayer.setWidth(String.valueOf(panelWidth));
        videoPlayer.setHeight(String.valueOf(panelHeight));
        */
        
        //videoPlayer.setPixelSize(panelWidth, panelHeight);
        
        add(videoPlayer);
        //Window.alert("Added video player");
        //RootPanel.get().add(videoPlayer);

        //swfWidget.addFlashVar("file", GWT.getHostPageBaseURL()+ "media/video.flv");
   
	}

	@Override
	public ObjectInstLink getObjectInstanceLink() {
		return oil;
	}

	@Override
	public void setObjectInstanceLink(ObjectInstLink objectInstanceLink) {
		setResource("/DisplayBlob?imageId="+objectInstanceLink.child.instanceId, objectInstanceLink.child.instanceName);
		this.oil = objectInstanceLink;		
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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean moveBackward() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void setObjectTypeTree(ObjectTypeTree ott) {
		this.ott = ott;
		
	} 

}
