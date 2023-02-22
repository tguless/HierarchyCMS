package com.hierarchycm.gxt.client.fileUpload;

import java.util.HashMap;

import org.swfupload.client.File;
import org.swfupload.client.SWFUpload;
import org.swfupload.client.UploadBuilder;
import org.swfupload.client.SWFUpload.ButtonAction;
import org.swfupload.client.SWFUpload.ButtonCursor;
import org.swfupload.client.event.FileDialogStartHandler;
import org.swfupload.client.event.FileDialogCompleteHandler;
import org.swfupload.client.event.FileQueuedHandler;
import org.swfupload.client.event.UploadCompleteHandler;
import org.swfupload.client.event.UploadErrorHandler;
import org.swfupload.client.event.UploadProgressHandler;
import org.swfupload.client.event.UploadSuccessHandler;
import com.google.gwt.user.client.ui.Grid;

public class SwfUploadUtil {
	
	HashMap<String, Integer> filenameRowHm = new HashMap<String, Integer>(); 
	
	private boolean resetIssued;
	
	SWFUpload swfUpload = null;
	private HashMap <String, File> files = new HashMap<String, File>();  	
	int tableRow = 5;	
	Uploader uploader = null;
	private Grid updateTable;
	private String divName;
	private String url;
	
	synchronized private void removeFile(String id) {
		files.remove(id);
	}		
	
	public SwfUploadUtil(Uploader uploader, Grid updateTable,  String divName, String url){
		reset();
		this.uploader = uploader;
		this.updateTable = updateTable;
		this.divName = divName;
		this.url = url;
		
		this.swfUpload = loadSWFUpload();
		updateTable.resize(5, 5);
		updateTable.setText(2, 0, "Upload URL:" );
		updateTable.setText(2, 1, url );		
		updateTable.setText(4, 0, "File Name" );
		updateTable.setText(4, 1, "Bytes In");
		updateTable.setText(4, 2, "Status");
		updateTable.setText(4, 3, "File Size" );
		updateTable.setText(4, 4, "Server response" );
		
	}
	
	
	public SWFUpload loadSWFUpload() {
		
		this.updateTable = updateTable;
		
	    if (swfUpload == null) {	    
			final UploadBuilder builder1 = new UploadBuilder();
			builder1.setHTTPSuccessCodes(200, 201);
			builder1.setFileTypes("*.webm;*.asf;*.wma;*.wmv;*.avi;*.flv;*.swf;*.mpg;*.mpeg;*.mp4;*.mov;*.m4v;*.aac;*.mp3;*.wav;*.png;*.jpg;*.jpeg;*.gif");
			builder1.setFileTypesDescription("Images, Video & Sound");

			builder1.setButtonPlaceholderID(divName);
			builder1.setButtonImageURL("./images/XPButtonUploadText_61x22.png");
			builder1.setButtonCursor(ButtonCursor.HAND);
			builder1.setButtonWidth(61);
			builder1.setButtonHeight(22);
			builder1.setButtonAction(ButtonAction.SELECT_FILES);

			builder1.setUploadProgressHandler(new UploadProgressHandler() {

				public void onUploadProgress(UploadProgressEvent e) {
										
					File f = e.getFile();					
					updateTable.setText(getFilenameRow(f), 2, String.valueOf(e.getBytesComplete()));

				}
			});
			
			builder1.setUploadSuccessHandler(new UploadSuccessHandler() {
				public void onUploadSuccess(UploadSuccessEvent e) {
					File f = e.getFile();
					updateTable.setText(getFilenameRow(f), 4, e.getServerData());
				}
			}); 

			builder1.setUploadErrorHandler(new UploadErrorHandler() {
				public void onUploadError(UploadErrorEvent e) {
					File ff = e.getFile(); 
					String message = e.getMessage(); 
					if (message == null || message.trim().length() == 0) {
						message = "upload failed"; 
					}				
					updateTable.setText(getFilenameRow(ff), 2, String.valueOf(message));
					
					removeFile(ff.getId()); 
					if (files.values().size() > 0) {
						ff = files.values().iterator().next(); 
						updateTable.setText(getFilenameRow(ff), 2, "Started");
						swfUpload.startUpload(ff.getId()); 						
					}
				}
			}); 

			builder1.setUploadURL(url);

			builder1.setFileDialogStartHandler(new FileDialogStartHandler() {
			   @Override
			   public void onFileDialogStart(FileDialogStartEvent e) {
				   if(resetIssued == true) {
					   filenameRowHm.clear();
					   resetIssued = false;
				   }
			   }
			}
			);

			builder1.setUploadCompleteHandler(new UploadCompleteHandler() {
				public void onUploadComplete(UploadCompleteEvent e) {
					File f = e.getFile(); 
					
					updateTable.setText(getFilenameRow(f), 2, "Done");
					
					removeFile(f.getId()); 
					if (files.values().size() > 0) {
						File ff = files.values().iterator().next(); 
						
						updateTable.setText(getFilenameRow(ff), 2, "Started");
						swfUpload.startUpload(ff.getId()); 
					} else {					
						uploader.uploadDoneEventHandler();
					}
				}
			});

			builder1.setFileQueuedHandler(new FileQueuedHandler() {
				public void onFileQueued(FileQueuedEvent event) {
					
					File f = event.getFile();					
					updateTable.setText(getFilenameRow(f), 2, "Queued");					
					files.put(f.getId(), f); 
				}
			});

			builder1.setFileDialogCompleteHandler(new FileDialogCompleteHandler() {
				public void onFileDialogComplete(FileDialogCompleteEvent e) {													
					
					
					
					updateTable.setText(2, 0, "Number of files");
					updateTable.setText(2, 1, String.valueOf(files.values().size()));
					
					for(File f : files.values()) {
						getFilenameRow(f);
					}
					
					if (files.values().size() > 0) {
	
						for (String paramName : uploader.getPostParams().keySet()) {
							swfUpload.addPostParam(paramName,uploader.getPostParams().get(paramName));							
						}	
					}
				}
			});
			swfUpload = builder1.build();

	    }
	    
	    return swfUpload;
	   	 
	}
	
	public int getFilenameRow (File f) {
		Integer filenamerow = filenameRowHm.get(f.getId());
		
		if (filenamerow == null) {
			updateTable.resize(tableRow+1, 5);
			filenamerow = new Integer(tableRow++);
			updateTable.setText(filenamerow.intValue(), 0, f.getName());
			updateTable.setText(filenamerow.intValue(), 3, String.valueOf(f.getSize()));
			//updateTable.setText(filenamerow.intValue(), 3, String.valueOf(f));
			filenameRowHm.put(f.getId(), filenamerow);
		}
		
		return filenamerow.intValue();
	}
	
	public void startUpload() {
		uploader.uploadStartedEventHandler();
		swfUpload.startUpload();
	}
	
	public void setDisabled(boolean disabled) {
		swfUpload.setButtonDisabled(disabled);
		
	
	}
	
	public void reset() {
		// TODO Auto-generated method stub
		resetIssued = true;
	}
}
