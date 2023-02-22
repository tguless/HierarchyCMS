package com.hierarchycm.gxt.client;



import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.logical.shared.ValueChangeEvent;
import com.google.gwt.event.logical.shared.ValueChangeHandler;
import com.google.gwt.user.client.History;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.commands.ErrorHandlingAsyncCallback;
import com.hierarchycm.gxt.client.commands.GetInstanceHierarchyCommand;
import com.hierarchycm.gxt.client.model.ObjectInstance;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.gxt.client.viewers.ObjectInstanceViewerWindow;

public class MainCmEntryPoint implements EntryPoint {
	
	@Override
	public void onModuleLoad() {
		
		History.addValueChangeHandler(new ValueChangeHandler <String>() {			
			public void onValueChange(ValueChangeEvent <String> event) {
				String selectedInstance = event.getValue();
				
				//ObjectTypeTree folder;
				
				/*
				ObjectInstance oi  = new ObjectInstance();
				oi.instanceId = selectedInstance;				
				 = new ObjectTypeTree(oi);
				*/
				
				
				AsyncCallback <ObjectTypeTree> instHeirCallback = new ErrorHandlingAsyncCallback<ObjectTypeTree>() {
				
					@Override
					public void onSuccess(ObjectTypeTree result) {
						ObjectInstanceViewerWindow window = new ObjectInstanceViewerWindow();
						window.loadAlbumItem((ObjectTypeTree)result.getChildren().get(0), null, true);
						//window.show();
						
						
					}
				};
				
				GetInstanceHierarchyCommand instHierCommand = new GetInstanceHierarchyCommand(instHeirCallback);
				if (selectedInstance != null && selectedInstance !=  "")
					instHierCommand.execute(selectedInstance);
				
				
			}
		});
		
		
		GlobalRegistry.createSession();
		



	}
	
}
