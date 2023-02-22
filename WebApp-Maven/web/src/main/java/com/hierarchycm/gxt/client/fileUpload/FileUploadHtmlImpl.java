package com.hierarchycm.gxt.client.fileUpload;

import com.google.gwt.core.client.JsArray;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.http.client.RequestException;
import com.google.gwt.http.client.Response;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.Grid;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.Widget;
import com.gwtpro.html5.fileapi.client.FileApiSupport;
import com.gwtpro.html5.fileapi.client.drop.DropHandler;
import com.gwtpro.html5.fileapi.client.file.File;
import com.gwtpro.html5.fileapi.client.file.FileEvent;
import com.gwtpro.html5.fileapi.client.file.FileEvent.FileEventHandler;
import com.gwtpro.html5.fileapi.client.ui.FileInput;
import com.gwtpro.html5.fileapi.client.upload.UploadRequest;
import com.gwtpro.html5.fileapi.client.upload.UploadRequestBuilder;
import com.gwtpro.html5.fileapi.client.upload.UploadRequestCallback;

public class FileUploadHtmlImpl extends FileInput implements FileUpload {

	private Grid uploadTable;	
	int currentFile =0;
	String url;
	File[] files;	
	UploadRequestBuilder fileUploader;
	Uploader uploader;
	
	public FileUploadHtmlImpl() {
		
	}
	
	FileUploadHtmlImpl(Grid updateTable, Uploader uploader, String url) {
		this(updateTable, uploader, url, true);
	}
	
	FileUploadHtmlImpl(Grid updateTable, Uploader uploader, String url, boolean createDropHandler) {
		initialize(updateTable, uploader, url, createDropHandler);
		//this.setCallback(getMyCallback());
	}
		
	public void initialize(Grid updateTable, Uploader uploader, String url, boolean createDropHandler){
		this.url = url;
		this.uploadTable = updateTable;
		this.uploader = uploader;
		this.setAllowMultipleFiles(true);
  	  	this.addChangeHandler(new ChangeHandler() {
				@Override
				public void onChange(ChangeEvent event) {
					addFiles(FileUploadHtmlImpl.this.getFiles());	
					uploadFiles();
				}
		  });
  	  	
  	  	if (createDropHandler) {
  	  		createDropHandler();
  	  	}
	}
	
	 private File[] jsArrToArr (JsArray<File> ipFiles) { 
			
		 File [] result = new File [ipFiles.length()];		 
		 for (int i = 0; i < ipFiles.length(); ++i) {
			 result[i] = ipFiles.get(i);
		 }
		 return result;
	 }
	
	private UploadRequestCallback getMyCallback() {
		return new UploadRequestCallback() {

            @Override
            public void onError(UploadRequest request, Throwable exception) {
            	uploadTable.setText(currentFile + 1, 2, "failed: " + exception.getMessage());
                uploadNextFile(currentFile + 1);
            }

            @Override
            public void onResponseReceived(UploadRequest request, Response response) {
            	uploadTable.setText(currentFile + 1, 2, "success: " + response.getText());
                uploadNextFile(currentFile + 1);
                
                //If we just finished uploading  do your thing
                if (currentFile == files.length) {
                	setDisabled(false);
	    	    	uploader.uploadDoneEventHandler();
                }
            }

            @Override
            public void onUploadProgress(UploadRequest request, int bytesUploaded) {
            	uploadTable.setText(currentFile + 1, 2, bytesUploaded + "");
            }
        };
	}
	
	public void createDropHandler() {
	      RootPanel rootPanel = RootPanel.get();
	      DropHandler dropHandler = new DropHandler(rootPanel);
	        this.fileUploader = new UploadRequestBuilder(url);
	        this.fileUploader.setCallback(getMyCallback());
	        dropHandler.addFileEventHandler(new FileEventHandler() {

	            @Override
	            public void onFiles(FileEvent event) {
	            	addFiles(jsArrToArr(event.getFiles()));
	            	uploadFiles();
	            }
	        });
	}
	
	 private void addFiles (File[] ipFiles) {
	     	files = ipFiles;
	    	uploadTable.clear();
	    	uploadTable.resize(files.length + 1, 3);
	    	uploadTable.setText(0, 0, "File name");
	    	uploadTable.setText(0, 1, "File size");
	    	uploadTable.setText(0, 2, "Progress");
	        for (int i = 0; i < files.length; ++i) {	        	
	        	uploadTable.setText(i + 1, 0, files[i].getFileName());	        		        
	        	uploadTable.setText(i + 1, 1, files[i].getFileSize() + "");
	        	uploadTable.setText(i + 1, 2, "");
	        }
	}
	 
	public void uploadNextFile(int index) {
			for (String paramName : uploader.getPostParams().keySet()) {
				fileUploader.setHeader(paramName, uploader.getPostParams().get(paramName));										
			}
		
			currentFile = index;
	        this.setDisabled(true);
	    	if (index < this.files.length) {
	            try {
	            	this.fileUploader.setHeader("itemName", files[currentFile].getFileName());
	            	this.fileUploader.sendFile(files[currentFile]);
	            } catch (RequestException e) {
	                this.uploadTable.setText(index + 1, 2, "failed: " + e.getMessage());
	                uploadNextFile(index + 1);
	            }
	        }
	    	

	 }
	
	public void uploadFiles() {
		uploadNextFile(0);
	}

	@Override
	public Widget getWidget() {
		return this;
	}

	@Override
	public void readyToPaint() {
		//no need to do anything - already painted for non swf
	}

	@Override
	public void reset() {
		// TODO Auto-generated method stub
		
	}
	
    private void showCapabilities() {
        RootPanel
                .get("status")
                .getElement()
                .setInnerHTML(
                        "Drag and Drop Support: "
                                + (FileApiSupport.isDragDropSupported() ? "Yes"
                                        : "No")
                                + "<br/>HTTPXmlRequest Level 2: "
                                + (FileApiSupport.isHttpXmlRequestLevel2() ? "Yes"
                                        : "No")
                                + "<br/>File input supports multiple files: "
                                + (FileApiSupport
                                        .isMultipleFileInputSupported() ? "Yes"
                                        : "No")+"<br/><br/>");
    }

}
