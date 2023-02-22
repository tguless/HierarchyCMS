package com.hierarchycm.gxt.server;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MySessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(final HttpSessionEvent se) {
        
    	final HttpSession session = se.getSession();        
    	final ServletContext context = session.getServletContext();
        context.setAttribute(session.getId(), session);
        
    }

    @Override
    public void sessionDestroyed(final HttpSessionEvent se) {
        final HttpSession session = se.getSession();
        final ServletContext context = session.getServletContext();
        context.removeAttribute(session.getId());
    }

}
