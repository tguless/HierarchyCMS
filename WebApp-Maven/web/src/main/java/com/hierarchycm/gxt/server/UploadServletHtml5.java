package com.hierarchycm.gxt.server;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hierarchycm.gxt.client.model.LoginInfo;
import com.hierarchycm.gxt.client.model.ObjectInstLink;
import com.hierarchycm.gxt.client.model.ObjectLinkType;
import com.hierarchycm.gxt.client.model.ObjectType;

@SuppressWarnings("serial")
public class UploadServletHtml5 extends UploadServletBase {
//HttpServlet {
  private String userLogin;
  private String userId;
  private String personalityId = null;
  private String oltId;
  
  @SuppressWarnings("unchecked")
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
          throws ServletException, IOException {
	  
	String parentInstId = null;
	String childTypeId = null;
	String itemName = null;
	
	this.req = req;
	this.resp = resp;
	
	
    HttpSession session = req.getSession();
   	userLogin = (String)session.getAttribute("login");	 
   	userId = (String)session.getAttribute("loginObjId");
   	//personalityId = (String)session.getAttribute("personalityId");
   
   	LoginInfo li = (LoginInfo)session.getAttribute("sessionInfo");
   	personalityId = li.defaultPersonalityId;
   	
    ServletInputStream inputStream = req.getInputStream();
    try {
        
        /*This sould be in the pageLoaded section */
        java.util.Enumeration <String> elist = req.getHeaderNames();
        String sHeader="";
        while (elist.hasMoreElements())
        {
	        sHeader=(String) elist.nextElement();
	        System.out.println(sHeader+" = "+req.getHeader(sHeader));
	        	        
	        if (sHeader.toLowerCase().equals("parentinstid")) {
	        	parentInstId =req.getHeader(sHeader);	        	
	        } else if (sHeader.toLowerCase().equals("typeidtoadd")) {
	        	childTypeId = req.getHeader(sHeader);
	        } else if (sHeader.toLowerCase().equals("itemname")) {
	        	itemName = req.getHeader(sHeader);	        	
	        } else if (sHeader.toLowerCase().equals("oltid")) {
	        	oltId = req.getHeader(sHeader);	
	        }
        }

        ObjectLinkType olt = new ObjectLinkType();
        olt.childType = new ObjectType();
        olt.childType.typeId = childTypeId;
        olt.linkTypeId = oltId;
        
        createInstance (parentInstId, olt, itemName, inputStream, personalityId);
        
        //resp.getWriter().print(String.format("got %d bytes", total));
    } catch (SQLException e) {
		e.printStackTrace();
	} finally {
        inputStream.close();
    }

  }
  
  

}
