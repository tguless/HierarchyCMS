package com.hierarchycm.gxt.server;

//import java.awt.Graphics;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import magick.MagickException;

import com.hierarchycm.gxt.server.ImageUtil.BufferImgPkg;
import com.hierarchycm.gxt.server.model.DimensionedSimpleFile;
import com.hierarchycm.gxt.server.model.SimpleFile;
import com.hierarchycm.gxt.shared.ProjectConstants;
import com.hierarchycm.mysql.Dao.AppConfig;
import com.hierarchycm.mysql.Dao.ObjectInstanceDAO;
import com.hierarchycm.mysql.Dao.ObjectModelDAO;
import com.hierarchycm.shared.server.OsValidator;

public class ImageUtil {
	
		public static final Map <String, ImageDims> imgDimsHm = createMap();
		private static final ArrayList <String> imgExtensions = createImgExtArr();
		
		private static final String IMGTYPE_TINYTHUMB = "tinythumb";
		private static final String IMGTYPE_SMALLPIC = "smallpic";
		private static final String IMGTYPE_WINDOWPIC = "windowpic";
		
		private static final String path = getFilePath();
		
		private static final boolean jniInitialized = initializeLibrary();
		public static final ImageToolkit imageToolKit = getImgManip();
		
		private static boolean initializeLibrary()  {
			if (!OsValidator.isWindows()) {
			
				try {
					//http://blog.cedarsoft.com/2010/11/setting-java-library-path-programmatically/
					System.setProperty( "java.library.path", "/usr/lib/jni" );			
					Field fieldSysPath = ClassLoader.class.getDeclaredField( "sys_paths" );
					fieldSysPath.setAccessible( true );
					fieldSysPath.set( null, null );					
					return true;
				} catch(Exception e) {
					e.printStackTrace();
					return false;
				}
			} else {
				return false;
			}
		}
		
		private static final ImageToolkit getImgManip () {
			
			if (OsValidator.isWindows() || jniInitialized == false) { 
				System.out.println("Using awt calls for image manipulation");
				return (ImageToolkit)new ImageManipAwt();		
			} else {
				return (ImageToolkit)new ImageManipMajick();
			}
		}
		
		private static Map<String, ImageDims> createMap() {
	    	HashMap<String, ImageDims> result = new HashMap<String, ImageDims>();
	        result.put(IMGTYPE_TINYTHUMB, new ImageDims(16,16));
	        result.put( IMGTYPE_SMALLPIC, new ImageDims(100,100));
	        result.put( IMGTYPE_WINDOWPIC, new ImageDims(Integer.valueOf(AppConfig.getProperty("DEFAULT_POPUP_HEIGHT")),Integer.valueOf(AppConfig.getProperty("DEFAULT_POPUP_WIDTH"))));
	        return Collections.unmodifiableMap(result);
	    }
		
		public static String getFilePath() {		
			String path; 
			if (OsValidator.isWindows()) { 
				path = "c:\\wscache\\";			
			} else {
				path = "/var/lib/hierarchycms/";
			}
			return path;
		}

		private static ArrayList<String> createImgExtArr() {
			ArrayList <String>result = new ArrayList<String>();
			result.add("jpeg");
			result.add("jpg");
			result.add("gif");
			result.add("png");
			return result;
		}

		
		public static class ImageDims {
			public int height = -1;
			public int width = -1;
			
			ImageDims(int height, int width) {
				this.height = height;
				this.width = width;
			}
			
			ImageDims() {
			}
			
			ImageDims(int width) {			
				this.width = width;
			}
		}
		
		public static String getFileMimeType (String fileName) {
			String ext = fileName.substring(fileName.lastIndexOf(".")+1);
			
			String mime = "unknown";
	        if (ext.toLowerCase().equals("jpg") || ext.toLowerCase().equals("jpeg"))
	            mime = "image/jpeg";
	        else if (ext.toLowerCase().equals("png"))
	            mime = "image/png";
	        else if (ext.toLowerCase().equals("gif"))
	            mime = "image/gif";
	        else if (ext.toLowerCase().equals("webm"))
	            mime = "video/webm";
	        else if (ext.toLowerCase().equals("mp4"))
	            mime = "video/mp4";
	        else if (ext.toLowerCase().equals("ogv"))
	            mime = "video/ogg";
	        
	        return mime;
		}
		
		public static String getFileType (String fileName) {
			String mimeType = getFileMimeType(fileName);
			if (!mimeType.equals("unknown")) {
				String [] mimeTpSplit = getFileMimeType(fileName).split("/");
				return mimeTpSplit[0];
			} else {
				return "unknown";
			}
		}
		
		public static Blob byteArrayToBlob(byte[] myByteArr) throws SerialException, SQLException {
			return new SerialBlob(myByteArr); 
		}
		
		public static byte[] blobToByteArray(Blob blob) throws IOException, SQLException {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] buf = new byte[1024];
			InputStream in = blob.getBinaryStream();
			int n = 0;
			while ((n=in.read(buf))>=0)
			{
				baos.write(buf, 0, n);		 
			}
			return baos.toByteArray();
		}
		
		public static File getCachedFile(String imageId, String objTypeId, String imagetype) {
			String fn ="";
			if (imageId!=null) {
				fn = imageId;
			} else {
				fn = "ot_"+ objTypeId;
			}
			
			for(String imgExt:imgExtensions) { 
				File cachedFile=getExistingBasePlusFile(imagetype+"/"+fn+"."+imgExt);
				if (cachedFile!=null) {
					return cachedFile;
				}
			}
			return null;
		}
		
		public static File getExistingBasePlusFile(String fileNm) {
			File cachedFile = getBasePlusFile(fileNm); 
					
			if (cachedFile.exists()) {
				return cachedFile;
			} else {
				return null;
			}
		}
		
		public static File getBasePlusFile(String fileNm) {
			File cachedFile = null;
			cachedFile = new File(path + fileNm);				
			return cachedFile;
		}

		public static SimpleFile getOriginalImage(String imageId) throws SQLException {
			return ObjectInstanceDAO.getInstanceFile(imageId, "file", "height","width");
		}
		
		public static class BufferImgPkg {
			public String mimeType = null;
			public Blob blob = null;			
		}

		public static Blob rotateImage(Blob blob, double d) {
			return imageToolKit.rotateImage(blob, d);			
		}

		public static BufferImgPkg getImage(String imageId,  String imagetype) throws Exception {
			return getImageGeneric(imageId, null, imagetype);
		}
		
		public static BufferImgPkg getImageGeneric(String imageId, String objTypeId, String imagetype) throws SQLException, IOException {
			File cachedFile = ImageUtil.getCachedFile(imageId, objTypeId, imagetype);
			BufferImgPkg bip;
			
			if (cachedFile != null) {
				bip = new BufferImgPkg();
				bip.blob = imageToolKit.getBlobFromFile(cachedFile);
				bip.mimeType = ImageUtil.getFileMimeType(cachedFile.getName());
			} else {								
				bip = getResizedImageGeneric(imageId, objTypeId, imagetype);	
			}		
			
			return bip;
		}
		public static BufferImgPkg getResizedImage( String imageId, String imagetype) throws SQLException, IOException {
			return getResizedImageGeneric(imageId, null, imagetype);
		}

		public static BufferImgPkg getResizedImageGeneric( String imageId, String typeId, String imagetype) throws SQLException, IOException {

			String instCat = "";
			if (imageId != null) {
				instCat = ObjectInstanceDAO.getObjectInstCategory(imageId);
				System.out.println("Found instance category " + instCat.toUpperCase());
			}

			if (instCat.toUpperCase().equals("VIDEO") || instCat.toUpperCase().equals("PHOTO") || typeId != null || instCat.toUpperCase().equals("PROFILE") ) {
				Blob image;
				Blob smallimage = null;
				
				BufferImgPkg bip = null;

				DimensionedSimpleFile dsf ; 
				
				if (imageId!=null) {
					if (instCat.toUpperCase().equals("PHOTO")) {
						dsf = ObjectInstanceDAO.getInstanceFile(imageId, "file", "height", "width");
					} else if (instCat.toUpperCase().equals("PROFILE")) {
						dsf = ObjectInstanceDAO.getInstanceFile(imageId, "profile_photo", "profile_photo_height", "profile_photo_width");
					} else {
						dsf = ObjectInstanceDAO.getInstanceFile(imageId, "vic", "height", "width");
					}
				} else {
					dsf = ObjectModelDAO.getObjectTypeFile(typeId, "default_icon");
				}
				 
				int dbHeight = dsf.height;		
				int dbWidth = dsf.width;
				
				ImageUtil.ImageDims myDims = ImageUtil.imgDimsHm.get(imagetype);
	
				if (dsf.blob == null ) { 			
					return null;
				} else {
					bip = new BufferImgPkg();
					
					String fileExt;
					if (instCat.toUpperCase().equals("PHOTO") || typeId != null) {
						fileExt = dsf.fileName.substring(dsf.fileName.lastIndexOf(".")+1);
					} else {
						fileExt = ProjectConstants.vicFileExt;
					}
					File cachedFile;
					if (typeId == null) {
						cachedFile = ImageUtil.getBasePlusFile(imagetype+"/"+imageId+"."+fileExt);
					} else {
						cachedFile = ImageUtil.getBasePlusFile(imagetype+"/ot_"+typeId+"."+fileExt);
					}
					image = dsf.blob;
					FileOutputStream fos =  new FileOutputStream(cachedFile);
					
					int type = imageToolKit.getImageType(image);
					
					if (dbWidth > dbHeight) {
							smallimage = imageToolKit.resizeImageByWidth(image, type, myDims.width, fileExt );
					} else  {
							smallimage = imageToolKit.resizeImageByHeight(image, type, myDims.height, fileExt );
					}
	
					/*	
					if (height == -1) {				
					
					} else {
						smallimage = imageToolKit.resizeImage(image, type, width, height);
					}
					*/
					imageToolKit.writeFile(smallimage, fileExt, fos);
					
					fos.flush();			
					fos.close();			
					
					bip.blob = smallimage;
					bip.mimeType = ImageUtil.getFileMimeType(dsf.fileName);
					 
				}		
				
				return bip;
			} else {
				return null;
			}
		}
		
		public static Blob resizeImageByWidth(Blob originalImage, int type, int newwidth, String fileExt) throws MagickException, IOException {		
			
			ImageDims dims = imageToolKit.getDimensions(originalImage);			
			ImageDims newDims = getProportionalDimensionsByWidth(dims, newwidth);
			
			return imageToolKit.resizeImage(originalImage, type, newDims.width, newDims.height, fileExt );
		}
		
		public static Blob resizeImageByHeight(Blob originalImage, int type, int newheight, String fileExt) throws MagickException, IOException {		
			
			ImageDims dims = imageToolKit.getDimensions(originalImage);			
			ImageDims newDims = getProportionalDimensionsByHeight(dims, newheight);
			
			return imageToolKit.resizeImage(originalImage, type, newDims.width, newDims.height, fileExt );
		}
		
		public static ImageDims getProportionalDimensionsByWidth(ImageDims dims, int newwidth) {

			ImageDims newDims = new ImageDims();
			
			float aspectRatio =  (float)dims.height/(float)dims.width;
			
			float newheight= newwidth * aspectRatio;
			
			newDims.height = Math.round(newheight);
			newDims.width = newwidth;
			
			return newDims;

		}
		
		public static ImageDims getProportionalDimensionsByHeight(ImageDims dims, int newheight) {

			ImageDims newDims = new ImageDims();
			
			float aspectRatio =  (float)dims.width/(float)dims.height;
			
			float newwidth= newheight * aspectRatio;
			
			newDims.height = newheight;
			newDims.width =  Math.round(newwidth);
			
			return newDims;

		}

		public static BufferImgPkg getDefaultImage(String imageType, String typeId) throws SQLException, IOException {
			BufferImgPkg bip = getImageByTypeID( imageType , typeId); 
			
			if (bip == null) {
				File cachedFile=new File(AppConfig.getProperty("DEFAULT_IMAGE"));
				bip = new BufferImgPkg();
				bip.blob = imageToolKit.getBlobFromFile(cachedFile);
				bip.mimeType = ImageUtil.getFileMimeType(cachedFile.getName());
			}
			return bip;
			// TODO Auto-generated method stub			
		}

		public static BufferImgPkg getImageByTypeID(String imageType, String typeId) throws SQLException, IOException  {
			return getImageGeneric(null, typeId, imageType);			
		}
		


}
