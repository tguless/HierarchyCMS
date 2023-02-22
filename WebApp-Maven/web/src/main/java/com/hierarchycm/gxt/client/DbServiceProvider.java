package com.hierarchycm.gxt.client;

import com.google.gwt.core.client.GWT;

public class DbServiceProvider {
	
	private static final DatabaseServiceAsync dbService = GWT.create(DatabaseService.class);
	
	public static DatabaseServiceAsync getDbService() { 
			return dbService;
	};
	
	
}
