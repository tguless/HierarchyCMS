package com.hierarchycm.gxt.server;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectType;


@SuppressWarnings("serial")
public class UploadServletSwf extends UploadServletBase {
//HttpServlet {

  private long FILE_SIZE_LIMIT = 20 * 1024 * 1024; // 20 MiB
  private final Logger logger = Logger.getLogger("UploadServlet");
  private String userLogin;
  private String userId;
  private String personalityId = null;

  
  private HttpSession getSession(final String sessionId) {
      final ServletContext context = getServletContext();
      final HttpSession session = (HttpSession) context.getAttribute(sessionId);
      return session;
  }

  
  @SuppressWarnings("unchecked")
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
          throws ServletException, IOException {
	  
	String parentInstId = null;
	String childTypeId = null;
	String itemName = null;
	String oltId = null;
	String updateItem = null;
	String fieldName = null;
	
	this.req = req;
	this.resp = resp;
	    
	HttpSession session;
	if (req.getParameter("jsessionid") != null) {
		session =getSession(req.getParameter("jsessionid"));
	} else {
		session = req.getSession();
	}
    
	if (session!= null ) {
		System.out.println(session.getId());
	}
    
    if(session.getAttribute("loginObjId") == null ||  ((String)session.getAttribute("loginObjId")).trim().equals("")) {
    	System.out.println("Session is null, can't record upload");
    	throw new ServletException();
    } else {
    	userLogin = (String)session.getAttribute("login");	 
    	userId = (String)session.getAttribute("loginObjId");
    	personalityId = (String)session.getAttribute("personlityId");
    }

    try {
      ServletFileUpload fileUpload = new ServletFileUpload(new DiskFileItemFactory());
      fileUpload.setSizeMax(FILE_SIZE_LIMIT);

      List<FileItem> items = fileUpload.parseRequest(req);
      
      if(session.getAttribute("login") == null ||  ((String)session.getAttribute("login")).trim().equals("")) {
      	throw new ServletException();
      } else {
      	userLogin = (String)session.getAttribute("login");	 
      	userId = (String)session.getAttribute("loginObjId");
      	personalityId = (String)session.getAttribute("personlityId");
      }
      
      for (FileItem item : items) {
        if (item.isFormField()) {
          logger.log(Level.INFO, "Received form field:");
          logger.log(Level.INFO, "Name: " + item.getFieldName());
          logger.log(Level.INFO, "Value: " + item.getString());
          
          if (item.getFieldName().equals("typeIdToAdd")) {
        	  childTypeId = item.getString();
          } else if (item.getFieldName().equals("oltId")) {
        	  oltId = item.getString();
          } else if (item.getFieldName().equals("parentInstId")) {
        	  parentInstId = item.getString();
          } else if (item.getFieldName().equals("Filename")) {
        	  itemName = item.getString();
          } else if (item.getFieldName().equals("NewInstanceId")) {
        	  updateItem = item.getString(); 
          } 
        } else {
          logger.log(Level.INFO, "Received file:");
          logger.log(Level.INFO, "Name: " + item.getName());
          logger.log(Level.INFO, "Size: " + item.getSize());
          fieldName = item.getFieldName();
        }

        if (!item.isFormField()) {
          if (item.getSize() > FILE_SIZE_LIMIT) {
            resp.sendError(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE,
                    "File size excedes limit");
            return;
          }
          
          ObjectLinkType olt = new ObjectLinkType();
          olt.childType = new ObjectType();
          olt.childType.typeId = childTypeId;
          olt.linkTypeId = oltId;
          
          if (updateItem != null) {   
        	  System.out.println("Updating item with " + item.getName());
        	  updateInstance(updateItem,  item.getFieldName(), item.getName(), item.getInputStream(), personalityId);
          } else {
        	  createInstance(parentInstId, olt, itemName, item.getInputStream(), personalityId);
          }

          if (!item.isInMemory())
            item.delete();
        }
      }
    } catch (Exception e) {
      logger.log(Level.SEVERE,
              "Throwing servlet exception for unhandled exception", e);
      throw new ServletException(e);
    }
  }
  
 

}
