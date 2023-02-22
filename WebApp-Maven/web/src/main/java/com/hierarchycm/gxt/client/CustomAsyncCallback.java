package com.hierarchycm.gxt.client;

import java.util.ArrayList;
import java.util.Iterator;

import com.extjs.gxt.ui.client.widget.menu.MenuItem;
import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.Document;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.Cookies;
import com.google.gwt.user.client.History;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.hierarchycm.gxt.client.commands.CommandWithCallback; 
import com.hierarchycm.gxt.client.model.LoginInfo;
import com.hierarchycm.gxt.client.model.ObjectTypeTree;
import com.hierarchycm.shared.client.GxtException;

public class CustomAsyncCallback <T> implements AsyncCallback<T> {

    private final AsyncCallback<T> asyncCallback;
    
    private static ArrayList<Command>  pendingCommands = new ArrayList<Command>();
    
    private static boolean pendingLoginPrompt = false; 
    
    private static LoginPrompt loginPrompt = null;
    
    private final DatabaseServiceAsync dbService = GWT.create(DatabaseService.class);
    
    public CustomAsyncCallback(AsyncCallback<T> asyncCallback) {
        this.asyncCallback = asyncCallback;
    } 

    @Override
    public void onFailure(Throwable caught) {

        if (caught instanceof SessionTimeoutException) {
           
        	//Window.Location.assign("/CaptchaGwtProject.html?gwt.codesvr=127.0.0.1:9997");
        	
        	CommandWithCallback command = ((SessionTimeoutException) caught).command;
        	command.setAsyncCallback(asyncCallback);    
        	pendingCommands.add(((SessionTimeoutException) caught).command);
        	//GlobalRegistry.clientSession.lastCookieDrop = Cookies.getCookie("JSESSIONID");
        	
        	
        	if (!pendingLoginPrompt) {
        		pendingLoginPrompt = true;
        		
        		//Window.alert("Session invalid");
        		if (loginPrompt == null) {
        			loginPrompt = new LoginPrompt(this);
        		}
        		
        		//LoginPrompt loginPrompt = new LoginPrompt(this);
        		loginPrompt.show();
        		
        	}
        	
        	
            return;
        }        
        

		String details = caught.toString();
		if (caught instanceof GxtException) {
	            details = " Original Message: " + ((GxtException)caught).getOriginalMessage() ;
        }
	    Window.alert("Error occurred while communicating with server: " +  details );

        
        asyncCallback.onFailure(caught);
    } 
            

    @Override
    public void onSuccess(T result) {
        asyncCallback.onSuccess(result);
    }
    
	public final void authenticate(String login, String password) {
		final AsyncCallback<LoginInfo> authenticateCallback = new AsyncCallback<LoginInfo>() {
			@Override
			public void onFailure(Throwable caught) {
				String details = caught.toString();

				if (caught instanceof GxtException) {
					details = " Original Message: "
							+ ((GxtException) caught).getOriginalMessage();
				}

				Window.alert("Error occurred while communicating with server: "
						+ details);
			}

			@Override
			public void onSuccess(LoginInfo result) {
				if (result.loginSuccessful) {
					// Window.alert("Login successful");
					pendingLoginPrompt=false;
					GlobalRegistry.clientSession = result;
					for (Command currCom : pendingCommands) {
						//Window.alert("Executing pending command " + pendingCommands.getClass().getName());
						currCom.execute();
					}
					
					pendingCommands.clear();
					
					//History.fireCurrentHistoryState();
				} else {
					Window.alert("Login failed");
					loginPrompt.show();

				}
			}
		};

		dbService.authenticate(login, password, authenticateCallback);
	}
	
}
