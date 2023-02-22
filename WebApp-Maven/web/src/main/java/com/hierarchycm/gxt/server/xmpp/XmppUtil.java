package com.hierarchycm.gxt.server.xmpp;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Registration;
import org.jivesoftware.smackx.packet.VCard;

import com.hierarchycm.mysql.EjabberdDbConnection;
import com.hierarchycm.mysql.Dao.AppConfig;

public class XmppUtil {
    private static String regKey ="";
    private static String xmppServer = AppConfig.getProperty("xmppServer");
    private static String xmppAdminLogin = AppConfig.getProperty("xmppAdminLogin");
    private static String xmppAdminPassword = AppConfig.getProperty("xmppAdminPassword");
    public XMPPConnection connectToXMPP () throws XMPPException {
        return connectToXMPP(xmppAdminLogin, xmppAdminPassword);
    }
    public static String getServerName() {
        return xmppServer;
    }

    public static String createBuddies(String srcId, String destId, String forwardTypeName, String backwardTypeName) throws  SQLException {

        String result = null;

        try {
            java.sql.Connection conn = EjabberdDbConnection.getConn();

            CallableStatement cStmt = conn.prepareCall("{ ? = call createBuddies(?,?,?,?,?)}");

            cStmt.registerOutParameter(1, Types.VARCHAR);
            cStmt.setString(2, srcId);
            cStmt.setString(3, destId);
            cStmt.setString(4, forwardTypeName);
            cStmt.setString(5, backwardTypeName);
            cStmt.setString(6, xmppServer);

            boolean hadResults = cStmt.execute();

            result = cStmt.getString(1);

            conn.close();

        } catch(SQLException e) {
            System.err.println("Mysql Statement Error:  call createBuddies(?)");
            e.printStackTrace();
            throw e;

        }

        return result;

		/*
		XmppUtil xmppUtil = new XmppUtil();
		org.jivesoftware.smack.Connection xmppConnection =  xmppUtil.connectToXMPP();
		Roster roster = xmppConnection.getRoster();
		// jid: String, user: String, groups: String[]
		String [] groups = new String[1];
		groups[0] = linkTypeName;
		roster.createEntry(destId+"@"+xmppServer, srcId, groups);
		roster.createEntry(srcId+"@"+xmppServer, destId, groups);
		xmppConnection.disconnect();
		*/
    }
    public XMPPConnection connectToXMPP (String login, String password) throws XMPPException {
        ConnectionConfiguration config = new ConnectionConfiguration(xmppServer, 5222);
        config.setCompressionEnabled(true);
        config.setSASLAuthenticationEnabled(true);

        XMPPConnection connection = new XMPPConnection(config);
        // Connect to the server
        try {
            connection.login(login, password, "SomeResource");
        } catch (XMPPException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        System.out.println("Connected to XMPP server");

        return connection;
    }

    public void changePubSubNickname(XMPPConnection conn, String newNick) {

        //Connection connection = connectToXMPP(userId, password);
        IQ iq1 = new NickPacket(newNick);
        iq1.setType(IQ.Type.SET);
        conn.sendPacket(iq1);

        //If you also want to update the nick vcard
		/*
		org.jivesoftware.smackx.packet.VCard me = new VCard();
		me.load(connection); // load own VCard
		me.setNickName("Testing Nickname");
		me.save(connection);
		*/

    }

    public void registerUserXmpp(String userId,  String password, String nickname) throws XMPPException {
        XMPPConnection conn = null;
        try {
            createUserRecordXmpp(userId,   password);
            conn = connectToXMPP(userId, password);
            changePubSubNickname(conn,  nickname);
            changeVcardNick(conn, nickname);
        } finally {
            conn.close();
        }
    }

    private void changeVcardNick(XMPPConnection conn, String nickname) throws XMPPException {
        VCard vCard = new VCard();
        vCard.load(conn);
        vCard.setFirstName(nickname);
        vCard.setNickName(nickname);
        vCard.save(conn);
    }

    public void createUserRecordXmpp(String userId,  String password) throws XMPPException {

        XMPPConnection connection = connectToXMPP();

        Registration register = new Registration();
        register.setType(IQ.Type.SET);
        register.setTo(xmppServer);

        Hashtable map = new Hashtable();
        map.put("key", regKey);

		/*
		// set up the various attributes to be sent to the server
		for (int i = 0; i < fieldListNames.size(); i++) {
			String name = (String) fieldListNames.get(i);

			//JTextField field = (JTextField) fieldListFields.get(i);
			//map.put(name, field.getText());
		}
		*/

        map.put("username", userId);
        map.put("password", password);

        // send the packet
        register.setAttributes(map);
        PacketFilter filter = new AndFilter(new PacketIDFilter(
                register.getPacketID()), new PacketTypeFilter(IQ.class));

        PacketCollector collector =connection.createPacketCollector(filter);
        connection.sendPacket(register);

        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // collect the response
        IQ result = (IQ) collector.nextResult(SmackConfiguration
                .getPacketReplyTimeout());

        String errorMessage = "";

        if (result == null) {
            errorMessage = "Got null back for result";
        } else if (result.getType() == IQ.Type.ERROR) {
            errorMessage = result.getError().getMessage();
            if (errorMessage == null)
                errorMessage = "Error message is null";
        }

        System.out.println("Failed creating XMPP User: " + userId + " with password: " + password + " got error" + errorMessage);

        connection.close();
    }

    public IQ getXMPPRegistrationForm () throws XMPPException {
        XMPPConnection connection = connectToXMPP();

        Registration register = new Registration();
        register.setType(IQ.Type.GET);
        register.setTo(xmppServer);
        PacketFilter filter = new AndFilter(new PacketIDFilter(register
                .getPacketID()), new PacketTypeFilter(IQ.class));

        PacketCollector collector = connection.createPacketCollector(filter);

        // send the request
        connection.sendPacket(register);

        // collect the response
        IQ result = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());

        String errorMessage = null;
        if (result == null) {
            System.out.println("No response");
        } else if (result.getType() == IQ.Type.ERROR) {
            errorMessage = result.getError().getMessage();
            if (errorMessage == null)
                errorMessage = "Unknow error";

            System.out.println(errorMessage);
        }

        if (errorMessage == null) {
            register = (Registration) result;

            System.out.println("<html><table width='300' border='0'><tr><td align='center'> "
                    + register.getInstructions()
                    + "</td></tr></table></html>");

            Map map = register.getAttributes();
            if (map != null) {
                Iterator iterator = map.keySet().iterator();

                // we iterate twice to ensure the username goes first
                while (iterator.hasNext()) {
                    String key = (String) iterator.next();

                    // build the registration form
                    String value = (String) map.get(key);
                    if (key.equals("username"))
                        System.out.println("Key:" + key + " Value:" + value);
                    //createInputBox(key, value);
                }

                iterator = map.keySet().iterator();

                while (iterator.hasNext()) {
                    String key = (String) iterator.next();

                    // build the registration form
                    String value = (String) map.get(key);
                    if (key.equals("key")) {
                        regKey = value; // this field does not need to be
                        // displayed

                        System.out.println("Registration key: " + regKey);
                    }
                    else if (!key.equals("instructions")
                            && !key.equals("username")
                            && !key.equals("registered"))
                        System.out.println("Key:" + key + " Value:" + value);
                    //createInputBox(key, value);
                }
            }

        }

        connection.close();

        return result;
    }

    public void changeXmppPassword(String login, String password, String newPassword) throws XMPPException {
        XMPPConnection connection = connectToXMPP(login, password);
        connection.getAccountManager().changePassword(newPassword);
        connection.close();
    }

    public void addBuddy(String login, String password, String groupName,  String buddyAlias, String buddyId) throws XMPPException {
        XMPPConnection connection = connectToXMPP(login,password);
        Roster roster = connection.getRoster();
        roster.createEntry(buddyId, buddyAlias, new String[]{groupName});
        connection.close();
    }

    public void removeBuddy(String login, String password, String buddyId) throws XMPPException {
        XMPPConnection connection = connectToXMPP(login,password);
        Roster roster = connection.getRoster();
        RosterEntry buddy = roster.getEntry(buddyId);
        roster.removeEntry(buddy);
        connection.close();
    }

    public void removeXmppUser(String login, String password) throws XMPPException {
        XMPPConnection connection = connectToXMPP(login,password);
        connection.getAccountManager().deleteAccount();
        connection.close();
    }
}
