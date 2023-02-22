package com.hierarchycm.gxt.server;

import java.io.IOException;
import java.io.InputStream;
import java.security.cert.CertStoreParameters;
import java.sql.SQLException;
import java.util.HashMap;

import javax.script.CompiledScript;
import javax.script.ScriptException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import php.java.script.servlet.PhpServletScriptContext;

import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.server.ImageUtil.ImageDims;
import com.hierarchycm.gxt.server.model.SimpleFile;
import com.hierarchycm.mysql.Dao.ObjectInstanceDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class UploadServletBase extends HttpServlet {

	 private static final  CompiledScript script = getScript();
	 HttpServletRequest req;
	 HttpServletResponse resp;
	 
	 
	 private static CompiledScript getScript()  {
		  	CompiledScript script = null;
		   
		    	try {
		    		
		    		String fullPhpScript = 
							  "<?php " +    	
									  "java('java.lang.System')->out->println('Entering PHP Code'); " +
									  "$hashMap = new Java('java.util.HashMap'); " +
									  "java('java.lang.System')->out->println('Entering PHP routine. FFMpeg opening ' . 'http://'.java_context()->get('req_ip').':'.java_context()->get('req_port').'/DisplayBlob?imageId='.java_context()->get('instanceId').'&getOriginalVid=true'); " +
									  "$movie = new ffmpeg_movie('http://'.java_context()->get('req_ip').':'.java_context()->get('req_port').'/DisplayBlob?imageId='.java_context()->get('instanceId').'&getOriginalVid=true', false);" +
									  
									  //"java('java.lang.System')->out->println('Got movie length right at beginning '.$movie->getDuration()); " +
									  
									  "$hashMap->put('duration',  $movie->getDuration()); " +
									  "$hashMap->put('frameCount',  $movie->getFrameCount()); " +
									  "$hashMap->put('frameRate',  $movie->getFrameRate()); " +
									  "$hashMap->put('fileName',  $movie->getFilename()); " +
									  
									  //"java('java.lang.System')->out->println('Got batch 1') ; " +
									  
									  //"These are causing segmentation fault on Ubuntu 12" + 
									  "$hashMap->put('title',  $movie->getTitle()); " +
									  "$hashMap->put('author',  $movie->getAuthor()); " +
									  "$hashMap->put('copyRight',  $movie->getCopyright()); " +
									  "$hashMap->put('artist', $movie->getArtist()); " +
									  "$hashMap->put('genre', $movie->getGenre()); " +
									  "$hashMap->put('trackNumber', $movie->getTrackNumber()); " +
									  "$hashMap->put('year', $movie->getYear()); " +
									  
									  //"java('java.lang.System')->out->println('Got batch 2') ; " +
									  
									  /*
									  "$hashMap->put('title',  ''); " +
									  "$hashMap->put('author',  ''); " +
									  "$hashMap->put('copyRight',  ''); " +
									  "$hashMap->put('artist', ''); " +
									  "$hashMap->put('genre', ''); " +
									  "$hashMap->put('trackNumber', ''); " +
									  "$hashMap->put('year', ''); " +
									  */
									  
									  "$hashMap->put('height', $movie->getFrameHeight()); " +
									  "$hashMap->put('width', $movie->getFrameWidth()); " +
									  "$hashMap->put('pixelFormat', $movie->getPixelFormat()); " +
									  "$hashMap->put('bitRate', $movie->getBitRate()); " +
									  "$hashMap->put('videoBitRate', $movie->getVideoBitRate()); " +
									  "$hashMap->put('audioBitRate', $movie->getAudioBitRate()); " +
									  "$hashMap->put('audioSampleRate', $movie->getAudioSampleRate()); " +
									  
									  //"java('java.lang.System')->out->println('Got batch 3') ;" +
									  
									  "$hashMap->put('videoCodec', $movie->getVideoCodec()); " +
									  "$hashMap->put('audioCodec', $movie->getAudioCodec()); " +
									  "$hashMap->put('audioChannels', $movie->getAudioChannels()); " +
									  "$hashMap->put('hasAudio', $movie->hasAudio()); " +
									  "$hashMap->put('hasVideo', $movie->hasVideo()); " +									 
									  
									  "java('java.lang.System')->out->println('Got movie length '.$movie->getDuration()); " +
									  "java_context()->put('movieProps', $hashMap); " +									  					  
									  "$frame = 73; " +
									  "$ff_frame = $movie->getFrame($frame); " +
									  "$gd_image = $ff_frame->toGDImage(); " +
									  "if ($gd_image) { " +
									  "		imagejpeg($gd_image, java_context()->get('vicPath')); " +		
									  " 	imagedestroy($gd_image);" +
									  "}" +
									  //http://groups.google.com/group/ffmpeg-php/browse_thread/thread/ccfc512b6d63ea0b
									  //http://ffmpeg-php.sourceforge.net/doc/api/ffmpeg_animated_gif.php
									  //"$ff_frame1 = $movie->getFrame(100); " +
									  //"$ff_frame2 = $movie->getFrame(200); " +
									  //"$ff_frame3 = $movie->getFrame(300); " +
									  //"$ff_frame4 = $movie->getFrame(400); " +
									  //"$gif = new ffmpeg_animated_gif(java_context()->get('vicPath'), $movie->getFrameWidth(), $movie->getFrameHeight(), 1, 0);" +
									  //"$gif->addFrame($ff_frame1);" +
									  //"$gif->addFrame($ff_frame1);" +
									  //"$gif->addFrame($ff_frame1);" +
									  //"$gif->addFrame($ff_frame1);" +					  
									  "?>";		    				
		    		//System.out.println(fullPhpScript);
					script =((javax.script.Compilable)(new javax.script.ScriptEngineManager().getEngineByName("php"))).compile(    			  
							fullPhpScript
					);
				} catch (ScriptException e) {
					System.out.println("Error compiling ffmpeg_php php script");
					e.printStackTrace();
				}
		  	
			return script;
	  }
	 
	 
	 protected void createInstance (String parentInstId, ObjectLinkType olt, String itemName, InputStream inputStream, String personalityId) throws SQLException, IOException {
	        String instanceId = ObjectInstanceDAO.createObjInst(parentInstId, olt, itemName, inputStream, personalityId);
	        System.out.println("Created instance " + instanceId);
	  	  
	        if (ImageUtil.getFileType(itemName).equals("video")) {
		          
	        	  HashMap <String, Object> myHm = getMovieProperties(req, resp, instanceId);
		    	  
		          myHm.put("fileName", itemName);
		          myHm.put("status_ky", "P");
		          
		    	  for (Object currKy : myHm.keySet()) {
		    		  System.out.println("Hashmap test: "+ currKy + " : " + myHm.get(currKy));  
		    	  }
		    	  
		    	  ObjectInstanceDAO.updateProps(instanceId, myHm);
		    	  
	        } else  if (ImageUtil.getFileType(itemName).equals("image")) {
	      	  SimpleFile originalImage = ImageUtil.getOriginalImage(instanceId);        	  
	      	  ImageDims dims = ImageUtil.imageToolKit.getDimensions(originalImage.blob);
	      	  
	      	  HashMap <String, Object> myHm = new HashMap<String, Object>();
	      	  
	      	  myHm.put("height", dims.height);
	      	  myHm.put("width", dims.width);
	      	  ObjectInstanceDAO.updateProps(instanceId, myHm);
	        }
	 }
	 
	 protected void updateInstance (String instanceId, String field, String itemName, InputStream inputStream, String personalityId) throws SQLException, IOException {
	        //String instanceId = ObjectInstanceDAO.createObjInst(parentInstId, olt, itemName, inputStream, personalityId);
	        System.out.println("Updating instance " + instanceId);
	  	  
	        //if (ImageUtil.getFileType(itemName).equals("video")) {
	          HashMap <String, Object> myHm = new HashMap<String, Object>();	    	  
	          myHm.put(field, inputStream);
	          myHm.put(field+"_filename", itemName);
	          //myHm.put(field+"_size", itemName);
	          //myHm.put("status_ky", "P");
	          
	    	  for (Object currKy : myHm.keySet()) {
	    		  System.out.println("Hashmap test: "+ currKy + " : " + myHm.get(currKy));  
	    	  }
	    	  
	    	  ObjectInstanceDAO.updateProps(instanceId, myHm);

	 }
	 
	 protected  HashMap <String, Object> getMovieProperties(HttpServletRequest req, HttpServletResponse resp, String instanceId ) throws SQLException, IOException  {
		  CompiledScript instance = (CompiledScript)((CertStoreParameters)script).clone();
		  instance.getEngine().setContext(new PhpServletScriptContext(instance.getEngine().getContext(),this,getServletContext(),req,resp));
		  
	      String req_port = String.valueOf(req.getLocalPort());
	      String req_ip = req.getLocalAddr();
		  String vicPath = ImageUtil.getFilePath() + "vics/" + instanceId +".jpg";     
		  
		  instance.getEngine().put("instanceId", instanceId);
		  instance.getEngine().put("req_ip", req_ip);
		  instance.getEngine().put("req_port", req_port); 
		  instance.getEngine().put("vicPath", vicPath);
		  
		  try {
				instance.eval();
		  } catch (ScriptException e) {
				e.printStackTrace();
		  }

		  ObjectInstanceDAO.setObjectInstBlob(instanceId, vicPath , "vic"); 
		  
		  //System.out.println("And also grabbed the value in java " + instance.getEngine().get("movieLength"));
		  @SuppressWarnings("unchecked")
		  HashMap <String, Object>  myHm = (HashMap <String, Object>) instance.getEngine().get("movieProps");
		  
		  return myHm;
	  }
}
