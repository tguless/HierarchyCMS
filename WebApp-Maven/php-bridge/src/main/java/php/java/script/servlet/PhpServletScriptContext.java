package php.java.script.servlet;

/*-*- mode: Java; tab-width:8 -*-*/

import java.io.IOException;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import javax.script.ScriptContext;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import php.java.bridge.http.ContextServer;
import php.java.bridge.http.WriterOutputStream;
import php.java.bridge.util.Logger;
import php.java.bridge.util.NotImplementedException;
import php.java.fastcgi.FCGIProcessException;
import php.java.fastcgi.ConnectionException;
import php.java.fastcgi.Continuation;
import php.java.fastcgi.FCGIHeaderParser;
import php.java.script.IPhpScriptContext;
import php.java.script.PhpScriptContextDecorator;
import php.java.script.PhpScriptLogWriter;
import php.java.script.PhpScriptWriter;
import php.java.servlet.ContextLoaderListener;
import php.java.servlet.ServletUtil;

/*
 * Copyright (C) 2003-2007 Jost Boekemeier
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

/**
 * An example decorator for compiled script engines running in a servlet
 * environment. Use <blockquote> <code>
 * static final CompiledScript script = ((Compilable)(new ScriptEngineManager().getEngineByName("php-invocable"))).compile("<?php ...?>");<br>
 * <br>
 * script.eval(new php.java.script.servlet.PhpHttpScriptContext(script.getEngine().getContext(),this,application,request,response));
 * </code> </blockquote>
 * 
 * @author jostb
 *
 */
public class PhpServletScriptContext extends PhpScriptContextDecorator {

    /**
     * Create a new PhpCompiledScriptContext using an existing PhpScriptContext
     * 
     * @param ctx
     *            the script context to be decorated
     */
    public PhpServletScriptContext(ScriptContext ctx, Servlet servlet,
            ServletContext context, HttpServletRequest request,
            HttpServletResponse response) {
	super((IPhpScriptContext) ctx);
	this.request = request;
	this.response = response;
	this.context = context;
	this.servlet = servlet;
    }

    public void startContinuation() {
	ContextLoaderListener listener = ContextLoaderListener
	        .getContextLoaderListener((ServletContext) getServletContext());
	listener.getThreadPool().start(getContinuation());
    }

    public Continuation createContinuation(String[] args, Map env,
            OutputStream out, OutputStream err, FCGIHeaderParser headerParser)
            throws FCGIProcessException, ConnectionException {
	ContextLoaderListener listener = ContextLoaderListener
	        .getContextLoaderListener((ServletContext) getServletContext());
	
	
	// discard default args for standalone and run with the args from the servlet
	args = null;
	listener.getConnectionPool();
	return listener.createContinuation(args, env, out, err, headerParser);
    }

    @Override
    public void destroy() {
	// ignore
    }

    /** Integer value for the level of SCRIPT_SCOPE */
    public static final int REQUEST_SCOPE = 0;

    /** Integer value for the level of SESSION_SCOPE */
    public static final int SESSION_SCOPE = 150;

    /** Integer value for the level of APPLICATION_SCOPE */
    public static final int APPLICATION_SCOPE = 175;

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected ServletContext context;
    protected Servlet servlet;

    /** {@inheritDoc} */
    public Object getAttribute(String key, int scope) {
	if (scope == REQUEST_SCOPE) {
	    return request.getAttribute(key);
	} else if (scope == SESSION_SCOPE) {
	    return request.getSession().getAttribute(key);
	} else if (scope == APPLICATION_SCOPE) {
	    return context.getAttribute(key);
	} else {
	    return super.getAttribute(key, scope);
	}
    }

    /** {@inheritDoc} */
    public Object getAttribute(String name) throws IllegalArgumentException {
	Object result;
	if (name == null) {
	    throw new IllegalArgumentException("name cannot be null");
	}
	if ((result = super.getAttribute(name)) != null)
	    return result;

	if ((result = request.getAttribute(name)) != null) {
	    return result;
	} else if ((result = request.getSession().getAttribute(name)) != null) {
	    return result;
	} else if ((result = context.getAttribute(name)) != null) {
	    return result;
	}
	return null;
    }

    /** {@inheritDoc} */
    public void setAttribute(String key, Object value, int scope)
            throws IllegalArgumentException {
	if (scope == REQUEST_SCOPE) {
	    request.setAttribute(key, value);
	} else if (scope == SESSION_SCOPE) {
	    request.getSession().setAttribute(key, value);
	} else if (scope == APPLICATION_SCOPE) {
	    context.setAttribute(key, value);
	} else {
	    super.setAttribute(key, value, scope);
	}
    }

    /**
     * Get the servlet response
     * 
     * @return The HttpServletResponse
     */
    public HttpServletResponse getResponse() {
	return response;
    }

    /**
     * Get the HttpServletRequest
     * 
     * @return The HttpServletRequest
     */
    public HttpServletRequest getRequest() {
	return request;
    }

    /**
     * Get the ServletContext
     * 
     * @return The current ServletContext
     */
    public ServletContext getContext() {
	return context;
    }

    protected Writer writer;

    /** {@inheritDoc} */
    public Writer getWriter() {
	if (writer == null) {
	    try {
		setWriter(response.getWriter());
	    } catch (IOException e) {
		Logger.printStackTrace(e);
	    }
	}
	return writer;
    }

    /** {@inheritDoc} */
    public void setWriter(Writer writer) {
	if (!(writer instanceof PhpScriptWriter)) {
	    writer = new PhpScriptWriter(new WriterOutputStream(writer));
	}
	super.setWriter(this.writer = writer);
    }

    protected Writer errorWriter;

    /** {@inheritDoc} */
    public Writer getErrorWriter() {
	if (errorWriter == null) {
	    setErrorWriter(PhpScriptLogWriter.getWriter(Logger.getLogger()));
	}
	return errorWriter;
    }

    /** {@inheritDoc} */
    public void setErrorWriter(Writer errorWriter) {
	if (!(errorWriter instanceof PhpScriptWriter)) {
	    errorWriter = new PhpScriptWriter(
	            new WriterOutputStream(errorWriter));
	}
	super.setErrorWriter(this.errorWriter = errorWriter);
    }

    protected Reader reader;

    /** {@inheritDoc} */
    public Reader getReader() {
	if (reader == null) {
	    try {
		reader = request.getReader();
	    } catch (IOException e) {
		Logger.printStackTrace(e);
	    }
	}
	return reader;
    }

    public void setReader(Reader reader) {
	super.setReader(this.reader = reader);
    }

    /** {@inheritDoc} */
    public Object init(Object callable) throws Exception {
	return php.java.bridge.http.Context.getManageable(callable);
    }

    /** {@inheritDoc} */
    public void onShutdown(Object closeable) {
	php.java.servlet.HttpContext.handleManaged(closeable, context);
    }

    /**
     * Return the http servlet response
     * 
     * @return The http servlet reponse
     */
    public Object getHttpServletResponse() {
	return response;
    }

    /**
     * Return the http servlet request
     * 
     * @return The http servlet request
     */
    public Object getHttpServletRequest() {
	return request;
    }

    /**
     * Return the http servlet
     * 
     * @return The http servlet
     */
    public Object getServlet() {
	return servlet;
    }

    /**
     * Return the servlet config
     * 
     * @return The servlet config
     */
    public Object getServletConfig() {
	return servlet.getServletConfig();
    }

    /**
     * Return the servlet context
     * 
     * @return The servlet context
     */
    public Object getServletContext() {
	return context;
    }

    /** {@inheritDoc} */
    public String getRealPath(String path) {
	return ServletUtil.getRealPath(context, path);
    }

    /** @deprecated */
    public String getRedirectString(String webPath) {
	throw new NotImplementedException();
    }

    /** @deprecated */
    public String getRedirectString() {
	throw new NotImplementedException();
    }

    /** {@inheritDoc} */
    public String getRedirectURL(String webPath) {
	StringBuffer buf = new StringBuffer();
	buf.append(getSocketName());
	buf.append("/");
	buf.append(webPath);
	try {
	    URI uri = new URI(
	            request.isSecure() ? "https:127.0.0.1" : "http:127.0.0.1",
	            buf.toString(), null);
	    return uri.toASCIIString();
	} catch (URISyntaxException e) {
	    Logger.printStackTrace(e);
	    throw new RuntimeException(e);
	}
    }

    /** {@inheritDoc} */
    public String getSocketName() {
	return String.valueOf(ServletUtil.getLocalPort(request));
    }

    /** {@inheritDoc} */
    public ContextServer getContextServer() {
	return ContextLoaderListener.getContextLoaderListener(context)
	        .getContextServer();
    }
}
