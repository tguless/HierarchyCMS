package org.appfuse.client;

import com.google.gwt.core.client.EntryPoint;


/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class Autocomplete implements EntryPoint {

	@Override
    public void onModuleLoad() {
       new AutoSuggestPage();
       
    }
    
}
