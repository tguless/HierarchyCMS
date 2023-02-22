package com.hierarchycm.gxt.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.FormParam;
import javax.ws.rs.core.Context;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

import com.google.gwt.dev.ModuleTabPanel.Session;

@Path("/authenticate")
public class AuthenticatorService {
	
	@Context HttpServletRequest request;

    @GET
    @Produces({"application/json", "application/xml"})
    @Path("/login")    
    public Result authenticate(@QueryParam("login") String login, @QueryParam("password") String password)
    {
    	HttpSession session = request.getSession();
    	 
    	if (login != null && password !=null) {
    	
	    	if (login.equals("tguless") && password.equals("mysecretpass") ) {
	    		session.setAttribute("isLoggedIn", "Y" );
	    		return new Result("SUCCESS", "Login sucessful.");
	    		//return new Result();
	    		//return "Y";
	    	} else {
	    		return new Result("FAILED", "Login failed.");
	    		//return new Result();
	    		//return "N";
	    	}
    	} else {
    		return new Result("FAILED", "Login failed. Credentials not supplied.");
    		//return new Result();
    		//return "N";
    	}
    	
    }
    
    @GET
    @Produces({"application/json", "application/xml"})
    @Path("/isLoggedIn")    
    public Result checkLogin()
    {
    	HttpSession session = request.getSession();
    	
    	if (session.getAttribute("isLoggedIn") != null && session.getAttribute("isLoggedIn").equals("Y")) {
    		return new Result("AUTHENTICATED", "User is logged in.");
    	} else {
    		return new Result("ANONYMOUS", "User has not authenticated.");
    	}   	
    }
    
    @XmlRootElement
    @XmlType(name = "AuthenticationResult")
    public static class Result {
    
    	private Result() {
    		
    	}
    	
    	private Result(String statusCd, String message ) {
    		this.statusCode  = statusCd;
    		this.message = message;
    	}
    	
    	public String statusCode = "FAILED";
    	public String message = "Login Failed";
    
    }
}
