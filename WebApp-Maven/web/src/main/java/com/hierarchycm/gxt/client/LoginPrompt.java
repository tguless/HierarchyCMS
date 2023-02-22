package com.hierarchycm.gxt.client;

import com.extjs.gxt.ui.client.Style.HorizontalAlignment;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.ComponentEvent;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.FieldEvent;
import com.extjs.gxt.ui.client.event.KeyListener;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.widget.Html;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.form.FieldSet;
import com.extjs.gxt.ui.client.widget.form.FormPanel;
import com.extjs.gxt.ui.client.widget.form.TextField;
import com.extjs.gxt.ui.client.widget.layout.TableData;
import com.extjs.gxt.ui.client.widget.layout.TableLayout;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.KeyCodes;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Image;


public class LoginPrompt extends com.extjs.gxt.ui.client.widget.Window {
	 private static com.extjs.gxt.ui.client.widget.Window w = null;
	 
	 private static final DatabaseServiceAsync dbService = GWT.create(DatabaseService.class);
	 
	 
	 boolean captchaFetched = false;
	 
	 public LoginPrompt(CustomAsyncCallback callBack) {
		 if (w==null) {
			 createInputWindow(callBack);
		 }
	 }
	 
	 public com.extjs.gxt.ui.client.widget.Window createInputWindow (final CustomAsyncCallback callBack) {
		  w = this; 
		  
		  w.setModal(true);
		 
		  w.setClosable(false);
		  
		  w.setWidth(400);
		  
	      FormPanel panel = new FormPanel();
	      panel.setBorders(false);
	      panel.setBodyBorder(false);
	      panel.setLabelWidth(55);
	      panel.setPadding(5);
	      panel.setHeaderVisible(false);
	            
	      TableLayout tableLayout = new TableLayout();
	      tableLayout.setColumns(2);	      
	      
	      TableData td2Col = new TableData();
	      td2Col.setHeight("40px");
	      td2Col.setColspan(2);
	      td2Col.setHorizontalAlign(HorizontalAlignment.CENTER);
	      
	      FieldSet fieldSet = new FieldSet();
	      
	      fieldSet.setTitle("Use an Existing Account");
	      fieldSet.setHeading("Use an Existing Account.");
	      fieldSet.setBorders(true);
	      fieldSet.setLayout(tableLayout);  
	      
	      final TableData td1 = new TableData();
	      td1.setWidth("200px");
	      td1.setHeight("30px");
	      td1.setHorizontalAlign(HorizontalAlignment.LEFT);
	      
	      final TableData td2 = new TableData();
	      td2.setWidth("200px");
	      td2.setHeight("30px");
	      td2.setHorizontalAlign(HorizontalAlignment.LEFT);
	      
	      final TextField<String> login = new TextField<String>();
	      final TextField<String> password = new TextField<String>();
	      password.setPassword(true);
	      
	      //fieldSet.add(rb, td1);
	      fieldSet.add(new Html("Login:"), td1);
	      fieldSet.add(login, td2);
	      
	      fieldSet.add(new Html("Password:"), td1);
	      fieldSet.add(password, td2);
	      
	     
	      
	      //TableLayout tableLayout2 = new TableLayout();
	      //tableLayout2.setColumns(2);	      
	      
	      //FieldSet fieldSet2 = new FieldSet();
	      //fieldSet2.setBorders(false);
	      //fieldSet2.setLayout(tableLayout2);  

	      
	      KeyListener keyListener = new KeyListener() {
	            public void componentKeyDown(ComponentEvent event) {
	                if(event.getKeyCode() == KeyCodes.KEY_ENTER)
	                {
	                	 submitLogin(login, password, callBack);
	                }
	            }
	      };
	        
	      password.addKeyListener(keyListener);
	      login.addKeyListener(keyListener);
	     
	      
	      /*
	      TableData tdB1 = new TableData();
	      tdB1.setWidth("120px");
	      tdB1.setHeight("40px");
	      tdB1.setHorizontalAlign(HorizontalAlignment.CENTER);
	      
	      TableData tdB2 = new TableData();
	      tdB2.setWidth("100px");
	      tdB2.setHeight("40px");
	      tdB2.setHorizontalAlign(HorizontalAlignment.CENTER);
	      	*/
	      
	      
	      Button loginButton = new Button("Login", new SelectionListener<ButtonEvent>() {
	          @Override
	          public void componentSelected(ButtonEvent ce) {
	        	  submitLogin(login, password, callBack);
	          }
	       });

	      /*
	      Button cancelButton = new Button("Cancel", new SelectionListener<ButtonEvent>() {
	          @Override
	          public void componentSelected(ButtonEvent ce) {
	            w.hide();	           
	          }
	       });
	       */
	      	      
	      fieldSet.add(loginButton,td2Col);
	      //fieldSet.add(cancelButton,tdB2);
	      
	      /*
	      
	      
	      fieldSet2.setTitle("Create a new account");
	      fieldSet2.setHeading("Create a new account.");
	      fieldSet2.setBorders(true);
	      fieldSet2.setLayout(tableLayout);  
	      */
	      
	      TableLayout tableLayout2 = new TableLayout();
	      tableLayout2.setColumns(2);	      
	      
	      final FieldSet fieldSet2 = new FieldSet();
	      fieldSet2.setTitle("Create a new account");
	      fieldSet2.setHeading("Create a new account.");
	      fieldSet2.setBorders(true);
	      fieldSet2.setLayout(tableLayout2);  
	      
	      final TextField<String> naLogin = new TextField<String>();
	      
	      final TextField<String> naEmail = new TextField<String>();
	      final TextField<String> naPassword1 = new TextField<String>();      
	      naPassword1.setPassword(true);
	      final TextField<String> naPassword2 = new TextField<String>();
	      naPassword2.setPassword(true);
	      final TextField<String> naFirstName = new TextField<String>();
	      final TextField<String> naLastName = new TextField<String>();

	      fieldSet2.add(new Html("First Name:"), td1);
	      fieldSet2.add(naFirstName, td2);

	      fieldSet2.add(new Html("Last Name:"), td1);
	      fieldSet2.add(naLastName, td2);
	      
	      fieldSet2.add(new Html("Email:"), td1);
	      fieldSet2.add(naEmail, td2);
	      
	      fieldSet2.add(new Html("Login:"), td1);
	      fieldSet2.add(naLogin, td2);
	      
	      fieldSet2.add(new Html("Password:"), td1);
	      fieldSet2.add(naPassword1, td2);	
	      
	      fieldSet2.add(new Html("Re-enter Password:"), td1);
	      fieldSet2.add(naPassword2, td2);
	      
          final TextField<String> naCaptcha = new TextField<String>();
          
          //Label responseLabel = new Label();        
          
	      final TableData td2ColCaptcha = new TableData();
	      td2ColCaptcha.setHeight("70px");
	      td2ColCaptcha.setColspan(2);
	      td2ColCaptcha.setHorizontalAlign(HorizontalAlignment.CENTER);
	      

    	  final Image captchaImage = new Image("./images/SimpleCaptchaBlank.jpg"); 
			fieldSet2.add(captchaImage, td2ColCaptcha);	          
			fieldSet2.add(new Html("Type what you see above:"), td1);
			fieldSet2.add(naCaptcha,td2);
          
			
			 naLogin.addListener(Events.Focus, new Listener<FieldEvent>(){
				 	//this not only reduces server load but also addresses a session issue. 
					@Override
					public void handleEvent(FieldEvent be) {
						if (captchaFetched==false) { 				    	  
								captchaImage.setUrl("./SimpleCaptcha.jpg");
								captchaFetched=true;
					      }						
					}		    	 
		    	});
	      /*
	      Timer t = new Timer() {
	          public void run() {
			      if (captchaFetched==false) { 				    	  
			    	  Cookies.getCookie("JSESSIONID");
			    	  Cookies.setCookie("JSESSIONID", null);
			    	  Image captchaImage = new Image("./SimpleCaptcha.jpg"); 
						fieldSet2.add(captchaImage, td2ColCaptcha);	          
						fieldSet2.add(new Html("Type what you see above:"), td1);
						fieldSet2.add(naCaptcha,td2);
						captchaFetched=true;
			      }
	          }
	       };
	       //t.schedule(5000);
	      */
	      Button caButton = new Button("Create Account", new SelectionListener<ButtonEvent>() {
	          @Override
	          public void componentSelected(ButtonEvent ce) {	        	  
	        	  	        	  
	        		  submitCreateAccount(naLogin, naEmail, naPassword1, naPassword2, naFirstName, naLastName, naCaptcha, callBack);
	          }
	       });
	      
	      fieldSet2.add(caButton, td2Col);
	      
	      panel.add(fieldSet);
	      panel.add(fieldSet2);	      
	      
	      w.add(panel);
		  return w;
	 }
	 
	 private void submitLogin( TextField<String> login, TextField<String> password, final CustomAsyncCallback callBack){
   	  boolean success = true;
   	  login.clearInvalid();
  	  password.clearInvalid();
   	  
  	  if(password.getValue() == null || password.getValue().trim().equals("")) {
	  		password.setEmptyText("Password can't be left blank");
	  		password.forceInvalid("Password can't be left blank");	  		  
	  		success = false;	  		
	  	  }
	  	  
  	  if(login.getValue() == null || login.getValue().trim().equals("")) {
	  		login.setEmptyText("Login can't be left blank");
  		    login.forceInvalid("Login can't be left blank");
	  		success = false;	  		
	  }
  	  
	  if (success) {
		  callBack.authenticate(login.getValue(), password.getValue());
		  w.hide();
	  }
	  	  
	 }
	 
	 private void submitCreateAccount( 
			 final TextField<String> login, 
			 TextField<String> email,
			 final TextField<String> password, 			 
			 TextField<String> password2,
			 TextField<String> firstName, 
			 TextField<String> lastName,
			 TextField<String> captcha, final CustomAsyncCallback callBack){
	   	  
		 
	  	  final AsyncCallback <String> createAccountCallback = new AsyncCallback<String>() {        
	          @Override
	  		  public void onFailure(Throwable caught) {			
	  			  
	  		  }

	  		@Override
	  		public void onSuccess(String result) {
	  			
  				boolean cbSuccess = true;
  				if (result.equals("EMAIL_EXISTS")) {
  					Window.alert("Email account already exists in the system.");
  					cbSuccess = false;
  				} 
  				
  				if (result.equals("CAPTCHA_FAILED")) {
  					Window.alert("Captcha field did not match graphic.");
  					cbSuccess = false;
  				}

  				if (result.equals("USER_EXISTS")) {
  					Window.alert("Username already exists in the system.");
  					cbSuccess = false;
  				}
  				
  				if (cbSuccess) {
  					callBack.authenticate(login.getValue(), password.getValue());
  					w.hide();
  				}
	  		}
	  	  };

	  	  boolean success = true;
	  	  
	  	  email.clearInvalid();
	  	  password.clearInvalid();
	  	  password2.clearInvalid();
	  	  captcha.clearInvalid();
	  	  login.clearInvalid();
	  	  
	  	  
	  	  if(email.getValue() == null || email.getValue().trim().equals("")) {
	  		email.setEmptyText("Email can't be left blank");
	  		email.forceInvalid("Email can't be left blank");	  		  
	  		success = false;	  		
	  	  }
	  	  
	  	  if(login.getValue() == null || login.getValue().trim().equals("")) {
		  		login.setEmptyText("Login can't be left blank");
	  		    login.forceInvalid("Login can't be left blank");
		  		success = false;	  		
		  }

	  	  boolean passwordsOkToCheck = true;
	  	  if(password.getValue() == null || password.getValue().trim().equals("")) {
		  	  password.setEmptyText("Password can't be left blank");		  		
	  		  password.forceInvalid("First password field can't be left blank");
	  		  success = false;
		  		passwordsOkToCheck = false;
		  } 
	  	  
	  	  if(password2.getValue() == null || password2.getValue().trim().equals("")) {
	  		    password2.setEmptyText("Password can't be left blank");	  
	  		    password2.forceInvalid("Second password field can't be left blank");
		  		success = false;	  
		  		passwordsOkToCheck = false;
		  } 
	  	  
	  	  if (passwordsOkToCheck) {
	  		  if (!password.getValue().equals(password2.getValue())) {	  			
	  			  password.forceInvalid("Password fields must match");
	  			  password2.forceInvalid("Password fields must match");
	  			  success = false;
	  		  }
	  	  }
	  	  
	  	  if(captcha.getValue() == null  || captcha.getValue().trim().equals("")) {
	  		    
	  		    captcha.setEmptyText("Captcha field can't be left blank");
	  		    captcha.forceInvalid("Captcha field can't be left blank");
		  		success = false;	  		
		  }
	  	  
	  	  if(success == true) {
	  		  dbService.performSignup(login.getValue(), password.getValue(), email.getValue(), firstName.getValue(), lastName.getValue(), captcha.getValue(), createAccountCallback);
	  	  }
		 
	 }
	 
	 
	 
}
