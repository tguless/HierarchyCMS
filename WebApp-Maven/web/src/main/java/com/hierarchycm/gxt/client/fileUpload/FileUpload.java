package com.hierarchycm.gxt.client.fileUpload;

import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.Widget;

public interface FileUpload {
	public void uploadFiles();
	public Widget getWidget();
	public void initialize(Grid updateTable, Uploader uploader, String url, boolean createDropHandler);
	public void setDisabled(boolean b);
	public  void readyToPaint();
	public void reset();

}
