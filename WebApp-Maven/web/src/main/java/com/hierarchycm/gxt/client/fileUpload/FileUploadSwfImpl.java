package com.hierarchycm.gxt.client.fileUpload;

import com.extjs.gxt.ui.client.widget.Html;
import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.Widget;

public class FileUploadSwfImpl extends Html implements FileUpload {
	
	SwfUploadUtil swfUploadUtil = null;
	private Uploader uploader;
	private String url;
	private boolean createDropHandler;
	private Grid updateTable;
	
	
	
	static int uploadId = 0; 
	static String divTagId;
	
	public FileUploadSwfImpl() {
		divTagId = "swfupload" + uploadId++;
		String divTag = "<div id=\"" + divTagId + "\"></div";
		this.setHtml(divTag);
	}

	@Override
	public void uploadFiles() {
		swfUploadUtil.startUpload();		
	}

	@Override
	public Widget getWidget() {		
		return this;
	}
	
	 public  void readyToPaint() {		
		 
		 swfUploadUtil =  new SwfUploadUtil(uploader, updateTable, divTagId, url);		 
	 }

	@Override
	public void initialize(Grid updateTable, Uploader uploader, String url,	boolean createDropHandler) {
		
		this.uploader = uploader;
		this.url = url;
		this.createDropHandler = createDropHandler;
		this.updateTable = updateTable;
		
	}

	@Override
	public void setDisabled(boolean b) {
		
		swfUploadUtil.setDisabled(b);
		this.disabled = true;
		
	}

	@Override
	public void reset() {
		swfUploadUtil.reset();
		
	}
}
