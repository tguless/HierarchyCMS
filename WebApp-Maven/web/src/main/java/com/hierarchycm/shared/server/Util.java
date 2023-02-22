package com.hierarchycm.shared.server;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hierarchycm.gxt.client.SessionTimeoutException;
import com.hierarchycm.gxt.client.commands.CommandWithCallback;
import com.hierarchycm.gxt.client.model.LoginInfo;

public class Util {
    public static String getStackTrace(Throwable aThrowable) {
	    final Writer result = new StringWriter();
	    final PrintWriter printWriter = new PrintWriter(result);
	    aThrowable.printStackTrace(printWriter);
	    return result.toString();
    }
    

}
