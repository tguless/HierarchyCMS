package com.hierarchycm.transcoder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;

import com.hierarchycm.gxt.client.model.ObjectType;
import com.hierarchycm.gxt.server.ImageUtil;
import com.hierarchycm.gxt.server.model.SimpleFile;
import com.hierarchycm.gxt.shared.ProjectConstants;
import com.hierarchycm.mysql.DbConnection;
import com.hierarchycm.mysql.Dao.ObjectInstanceDAO;
import com.hierarchycm.mysql.Dao.ObjectModelDAO;


/*
http://stackoverflow.com/questions/5487085/ffmpeg-covert-html-5-video-not-working
on windows you need the environment variable FFMPEG_DATADIR=C:/utils/ffmpegpresets
On ubuntu the presets are all in /usr/share/ffmpeg					     
*/


public class QueueProcessor {
	
		private static HashMap <String, ArrayList<String>> commandParamsHm = new HashMap<String, ArrayList<String>>();
	
		//Select all object_types that have a object_type_category_ky of video
		public static void main(String[] args)  {
			try {
				ArrayList<ObjectType> objectTypes = ObjectModelDAO.getCategoryTypes(ProjectConstants.videoCategory);
			
				for(ObjectType ot : objectTypes) {
					String nextInLine = ObjectInstanceDAO.getNextPendingInstance(ot);
					while ( nextInLine != null) {					
						try {
							ObjectInstanceDAO.changeStatus(nextInLine, "IP");
							
							transcodeAndWriteToDb(nextInLine);
							
							//notifyOwner
												
							nextInLine = ObjectInstanceDAO.getNextPendingInstance(ot);		
							
						
						} catch (Exception e) {
							e.printStackTrace();
							ObjectInstanceDAO.changeStatus(nextInLine, "ERR");
							nextInLine = ObjectInstanceDAO.getNextPendingInstance(ot);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				
			}
		}
	
		
		public static void transcodeAndWriteToDb (String instanceId) throws IOException, SQLException {
			
			SimpleFile sf = ObjectInstanceDAO.getInstanceFile(instanceId, "file", "height", "width");
			InputStream inFromDB = sf.blob.getBinaryStream();
			String origFile = streamToFile (inFromDB, instanceId);	
			
		    HashMap <String, ArrayList<String>> commandParamsHm =  getCommandParams();

	    	String errTranscodes = "";
	    	String successTranscodes = "";

		    for (String fileExt : commandParamsHm.keySet()) {
		    	try {
				    ArrayList <String> commandParamsOrig = commandParamsHm.get(fileExt);
				    ArrayList <String> myCommandParams = new ArrayList<String>(commandParamsOrig);
				    String fileName = getFileName(fileExt, instanceId);
				    
				    myCommandParams.add(2, origFile);
				    myCommandParams.add(myCommandParams.size(), fileName);			   		
				    
				    System.out.println("Calling ffmpeg for " + fileName + " with parameters " + myCommandParams);
				    
				    int result = executeCommand(myCommandParams);
				    if (result == 0) {			    
				    	ObjectInstanceDAO.setObjectInstBlob(instanceId, fileName, fileExt + "Transcode");
				    	successTranscodes = successTranscodes + " " + fileExt;				    	
				    } else {
				    	errTranscodes = errTranscodes + " " +  fileExt;				    	
				    }				    
				    (new File(fileName)).delete();
		    	} catch (Exception e ) {
		    		e.printStackTrace();
			    	errTranscodes = errTranscodes + " " +  fileExt;			    
		    	} finally {
		    		setStatus(instanceId, errTranscodes, successTranscodes);
		    	}
		    }
				   		    
		    (new File(origFile)).delete();
		}
		
		private static void setStatus (String instanceId, String errTranscodes, String successTranscodes) throws SQLException {
			String result = "";
			
			if (!errTranscodes.equals("")) {
				result = "ERR -" +  errTranscodes;				
			}
			
			if (!successTranscodes.equals("")) {
				if (!errTranscodes.equals("")) {
					result = result + " : ";
				}
				result = result + "C -" +  successTranscodes;
			}
			
			ObjectInstanceDAO.changeStatus(instanceId, result);
		}
		
		private static String getFileName(String fileExt, String nextInLine) {
			String fileName = ImageUtil.getFilePath()+ "ffmpegwork/"+ nextInLine + "." + fileExt;					
			return fileName;
		}
			
		public static HashMap <String, ArrayList<String>> getCommandParams() {
		    
			if (commandParamsHm.size() == 0) {
			    
			    /*
				String [] commandParamsMp4 = new String[] {
						"ffmpeg", "-i", "-y", "-b", "500k", "-vcodec", "libx264", "-vpre", "slow", 
						"-vpre", "baseline", "-g", "30"
				};
			    */
			    String [] commandParamsMp4 = new String[] {
						"ffmpeg", "-i", "-y", "-b", "500k", "-vcodec", "libx264", "-g", "30"
				};
			    
			    ArrayList <String> commandParamsMp4Al = new ArrayList<String>(); 			    
			    Collections.addAll(commandParamsMp4Al, commandParamsMp4);

			    
				String [] commandParamsWebm = new String[] {
						"ffmpeg","-i", "-y", "-threads", "8", "-f", "webm", "-vcodec", "libvpx",
						"-acodec", "libvorbis", "-aq", "90", "-ac", "2"   
				};
				
				ArrayList <String> commandParamsWebmAl = new ArrayList<String>(); 			    
			    Collections.addAll(commandParamsWebmAl, commandParamsWebm);
			    
				commandParamsHm.put("mp4", commandParamsMp4Al);
				commandParamsHm.put("webm", commandParamsWebmAl);
			}
		    
		    return commandParamsHm;
		}
		
		public static int executeCommand(ArrayList <String> commandParams) throws IOException, InterruptedException {
			return executeCommand (commandParams.toArray(new String[commandParams.size()]));
		}
		
		public static int executeCommand(String [] commandParams) throws IOException, InterruptedException {
			System.out.println("Executing " + commandParams);
			
			Process p = Runtime.getRuntime().exec(commandParams);
			InputStream inFromCommand = p.getInputStream();		
			InputStream errInFromCommand = p.getErrorStream();				
			
			startTheReader(errInFromCommand, System.out);
			streamPipe(inFromCommand, System.out);
			p.waitFor();
			return p.exitValue();
		}
	
		public static String streamToFile (InputStream inFromCommand, String instanceId) throws SQLException, IOException {
			SimpleFile sf = ObjectInstanceDAO.getInstanceFile(instanceId, "file", "height", "width");
			String filePath = ImageUtil.getFilePath();
			String fileName = filePath+ "ffmpegwork/"+ instanceId + "-orig-"+ sf.fileName;
		    File              blobFile   = new File(fileName);
		      
		    FileOutputStream  outStream  = new FileOutputStream(blobFile);
		    
		    streamPipe(inFromCommand, outStream);
		    
		    return (fileName);
		}
		
		public static void streamPipe(InputStream in, OutputStream out) throws IOException {
		      
				int bufferSize = 8*1024;
				byte[] buffer = new byte[bufferSize];
				int count;

				try  {
					while ((count = in.read(buffer)) != -1) {
						out.write(buffer, 0, count);				
								
					} 					
				} catch ( IOException e) {
					System.out.println("User broke the connection");
				} finally  {
					try {						
						out.flush();
						in.close();
					} catch (IOException e) {
						System.out.println("Trouble closing stream and flushing");
					}
				}
		      		      
		}
		
		public static void startTheReader(InputStream inFromDB, OutputStream outToCommand) {
	        Runnable task = new ReaderThread(inFromDB, outToCommand);
	        Thread timeoutInterruptThread = new Thread(task);
	        timeoutInterruptThread.setName("CallableStatementInterruptor");
	        timeoutInterruptThread.start();
	    }
		
		private static class ReaderThread implements Runnable {  
	    	
			InputStream inFromDB;
			OutputStream outToCommand;
			
	        public ReaderThread(InputStream inFromDB, OutputStream outToCommand) {
	        	this.inFromDB = inFromDB;
	        	this.outToCommand = outToCommand;
	        }  
	 
	        public void run() {  

	        		 try {
						streamPipe(inFromDB, outToCommand);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

	        }    
	    }  

}
