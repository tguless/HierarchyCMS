package com.hierarchycm.gxt.client.commands;

import com.extjs.gxt.ui.client.data.FilterPagingLoadConfig;
import com.extjs.gxt.ui.client.data.PagingLoadResult;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.DbServiceProvider;
import com.hierarchycm.gxt.client.model.ObjectInstLinkModelData;

public class GetFeedCommand  extends SimplifiedCommand <PagingLoadResult<ObjectInstLinkModelData>>{
	
	FilterPagingLoadConfig loadConfig; 	
	String feedType;

	public GetFeedCommand(FilterPagingLoadConfig loadConfig, String feedType, AsyncCallback <PagingLoadResult<ObjectInstLinkModelData>> ipcallback) {
		 callback = ipcallback;
		 this.loadConfig = loadConfig; 
		 this.feedType = feedType;
	} 
	
	public GetFeedCommand() {};
	
	@Override
	public void execute() {
		 DbServiceProvider.getDbService().getFeed((FilterPagingLoadConfig) loadConfig, feedType, this, callback);
	} 

}
