package com.hierarchycm.gxt.server.xmpp;

import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.SASLAuthentication;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.junit.Test;

public class XmppUtilTest {
    @Test
    public void connectToXMPP () throws XMPPException {
        String login = "admin";
        String password = "password1234";
        ConnectionConfiguration config = new ConnectionConfiguration("localhost", 5222);
        SASLAuthentication.supportSASLMechanism("PLAIN", 0);
        config.setCompressionEnabled(true);
        config.setSASLAuthenticationEnabled(true);

        XMPPConnection connection = new XMPPConnection(config);
        // Connect to the server
        try {
            connection.connect();
            connection.login(login, password, "SomeResource");
        } catch (XMPPException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        if (connection.isConnected()) {
            System.out.println("Connected to XMPP server");
            //return connection;
        } else {
            //return null;
        }
    }
}
