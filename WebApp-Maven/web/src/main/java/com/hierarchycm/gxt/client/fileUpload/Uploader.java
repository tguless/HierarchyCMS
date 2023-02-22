package com.hierarchycm.gxt.client.fileUpload;

import java.util.HashMap;

public interface Uploader {
	//public String postParamName = new String();
	//public String postParamValue =  new String();
	HashMap <String, String> getPostParams();
	 void uploadDoneEventHandler();
	 void uploadStartedEventHandler();
	 
	//String getPostParamName();
	//String getPostParamValue();
	
}
