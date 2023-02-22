package com.hierarchycm.gxt.server;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hierarchycm.gxt.server.ImageUtil.BufferImgPkg;
import com.hierarchycm.gxt.server.model.SimpleFile;
import com.hierarchycm.gxt.server.model.VideoFile;
import com.hierarchycm.gxt.shared.ProjectConstants;
import com.hierarchycm.mysql.Dao.ObjectInstanceDAO;
import com.hierarchycm.mysql.Dao.ObjectModelDAO;

import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;


public class BlobServlet extends HttpServlet {

	private static final long serialVersionUID = -6292452923588313732L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		ServletOutputStream out = response.getOutputStream();
		try {

			String userAgent =  request.getHeader("User-Agent");
			boolean isWebmCapable = false;
			if (userAgent.toUpperCase().contains("CHROME") || userAgent.toUpperCase().contains("FIREFOX")) {
				isWebmCapable = true;
			}
			
			System.out.println("Just got displayBlob request from browser " +userAgent); 
			
			String imageId = request.getParameter("imageId");
			String typeId = request.getParameter("typeId");
			String imageType = request.getParameter("imageType");	
			String rotateDegrees = request.getParameter("rotateDegrees");			
			String rangeHeader = request.getHeader("Range");

			long skipForward = getByteRangeValue(rangeHeader);
			
			System.out.println("Byte range requested is " + rangeHeader);
			
			response.setBufferSize(8*1024);

			if (imageType == null) {
				String instanceCategory = "";
				if(typeId==null) {
					instanceCategory = ObjectInstanceDAO.getObjectInstCategory(imageId);
				}
				SimpleFile sf = null;
				
				System.out.println("Instance category is: " + instanceCategory);
				String getOriginalVid = request.getParameter("getOriginalVid");
				
				if (instanceCategory.toUpperCase().equals("PHOTO") || typeId != null) {
					if (typeId == null) {
						sf = ImageUtil.getOriginalImage(imageId);
					} else {
						sf = ObjectModelDAO.getObjectTypeFile(typeId, "default_icon");
					}
				} else if (instanceCategory.toUpperCase().equals("VIDEO")) {
					
					
					VideoFile vf ;
					if (getOriginalVid!= null && getOriginalVid.equals("true")) {						
						System.out.println("Grabbing file field");
						vf = ObjectInstanceDAO.getInstanceVideo(imageId, "file");
					} else {
						if (isWebmCapable) {
							System.out.println("Grabbing webmTranscode field");
							vf = ObjectInstanceDAO.getInstanceVideo(imageId, "webmTranscode");
						} else {
							System.out.println("Grabbing mp4Transcode field");
							vf = ObjectInstanceDAO.getInstanceVideo(imageId, "mp4Transcode");						
						}
					}
					
					if (vf.contentLength !=null) {
						response.addHeader("X-Content-Duration", vf.contentLength);
					}
					sf = (SimpleFile)vf;
					
				}
				
				if (sf != null) {
					if (instanceCategory.toUpperCase().equals("VIDEO")) {
						if (isWebmCapable && getOriginalVid == null) {
							response.setContentType("video/webm");
						} else {
							response.setContentType("video/mp4");
						}
					} else {
						System.out.println("Setting mime type: " +ImageUtil.getFileMimeType(sf.fileName));
						response.setContentType(ImageUtil.getFileMimeType(sf.fileName));	
					}
					response.addHeader("Accept-Ranges", "bytes");
					response.addHeader("Content-Range", "bytes " + skipForward + "-" + (sf.blob.length()-1) + "/" + (sf.blob.length() - 1));
					//response.addHeader("Cache-Control", "no-transform, max-age=0");
					
					
					if (rangeHeader != null) {
						response.setStatus(206);
					}

					if (rotateDegrees == null) {
						sendBlob(sf.blob, out, skipForward);
					} else {
						sendBlob(ImageUtil.rotateImage(sf.blob, Double.parseDouble(rotateDegrees)), out);
					}
				} else {
					displayNotFoundErr(out);
				}					
			} else {
				BufferImgPkg bip = null;
				if (imageId!=null) {
					bip = ImageUtil.getImage(imageId, imageType);
					if (bip == null) {					
						String instanceTypeId = ObjectInstanceDAO.getObjectInstanceType(imageId);
						bip =  ImageUtil.getDefaultImage(imageType, instanceTypeId);					
					}
				} else {
					bip = ImageUtil.getDefaultImage(imageType, typeId); 						
				}
				
				if (bip!=null) {
					System.out.println("Sending mime type: " +bip.mimeType);
					response.setContentType(bip.mimeType);	
					
					response.addHeader("Accept-Ranges", "bytes");
					response.addHeader("Content-Range", "bytes " + skipForward + "-" + bip.blob.length() + "/" + bip.blob.length());
					//response.setContentType("image/png");
					
					if (rangeHeader != null) {
						response.setStatus(206);
					}
					
					if (bip.blob!= null) {
						if (rotateDegrees == null) {
							sendBlob(bip.blob, out, skipForward);
						} else {
							sendBlob(bip.blob, out, skipForward);
						}
					} else {
						displayNotFoundErr(out);
					}
				}
			} 

		} catch (Exception e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}
	}
	
	
	public static long getByteRangeValue  (String rangeHeader) {
		long skipForward = 0;
		if (rangeHeader!=null && !rangeHeader.equals("")) {
			String[] tempSplit = rangeHeader.split("=");
			
			if (tempSplit[1] != null) {
				String tempSplit2[] = tempSplit[1].split("-");
				if (tempSplit2 != null && tempSplit2[0] != null && !tempSplit2[0].trim().equals(""))
				skipForward = Long.valueOf(tempSplit2[0]);
			}
		}
		return skipForward;
	}
	
	
	public void sendBlob(Blob blob,ServletOutputStream out) throws IOException, SQLException, InterruptedException {
		sendBlob( blob, out, 0);
	}
	
	public void sendBlob(Blob blob,ServletOutputStream out, long skip ) throws  SQLException, InterruptedException {
				
			InputStream in = blob.getBinaryStream();
			int fileLength = 0;
			try {
			//in.skip(skip);
			  fileLength = in.available();
			  System.out.println("fileLength = " + fileLength);
			} catch ( IOException e) {
				System.out.println("Trouble getting file length!");
			}
             
             
			
			try {
			in.skip(skip);
			} catch ( IOException e) {
				System.out.println("Trouble skipping forward!");
			}

			//int bufferSize = 8*1024;
			int bufferSize = 8*512;
			byte[] buffer = new byte[bufferSize];
			int bytesRead =-1;

			try  {
				while ((bytesRead = in.read(buffer)) != -1) {		
					//Thread.sleep(50);
					out.write(buffer, 0, bytesRead);								
				} 
			} catch ( IOException e) {
				System.out.println("User broke the connection");
				//e.printStackTrace();
			} finally  {
				try {
					in.close();
					out.flush();
					out.close();
				} catch (IOException e) {
					System.out.println("Trouble closing stream and flushing");
				}
			}
	}
		
	public void displayNotFoundErr(ServletOutputStream out) throws IOException {
		out.println("<html><head><title>Display Blob Example</title></head>");
		out.println("<body><h4><font color='red'>image not found for given id</font></h4></body></html>");
	}
	
	public void sendBufferedImage(BufferedImage bi, ServletOutputStream out) throws IOException, SQLException {		
	    ImageIO.write(bi, "jpg", out);  
	}

}
