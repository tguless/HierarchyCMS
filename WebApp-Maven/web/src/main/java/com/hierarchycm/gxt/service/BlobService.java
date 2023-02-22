package com.hierarchycm.gxt.service;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;

import javax.servlet.ServletOutputStream;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import com.hierarchycm.mysql.Dao.ObjectInstanceDAO;
import com.sun.jersey.api.core.HttpContext;
import com.sun.jersey.api.core.HttpResponseContext;

@Path("/blobs")
public class BlobService {

	@Context HttpContext hc;
	
    @GET
    @Produces({"application/jpg"})
    @Path("/getImage/{imageid}")    
	public void getBlob(@QueryParam("imageid") String imageId) throws Exception {
			
		  HttpResponseContext response = hc.getResponse();
		  OutputStream out = response.getOutputStream();	      
	      Blob blob = ObjectInstanceDAO.getInstanceFile(imageId, "file", "height", "width").blob;
	      InputStream in = blob.getBinaryStream();
	      int length = (int) blob.length();
	      int bufferSize = 1024;
	      byte[] buffer = new byte[bufferSize];
	      while ((length = in.read(buffer)) != -1) {
	        out.write(buffer, 0, length);
	      }
	      in.close();
	      out.flush();		
	}
	
}
