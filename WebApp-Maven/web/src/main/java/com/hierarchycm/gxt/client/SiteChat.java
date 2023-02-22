package com.hierarchycm.gxt.client;

import static com.calclab.emite.core.client.xmpp.stanzas.XmppURI.uri;


import java.util.HashMap;

import com.calclab.emite.browser.client.PageAssist;
import com.calclab.emite.core.client.LoginXmpp;
import com.calclab.emite.core.client.LoginXmppMap;
import com.calclab.emite.core.client.conn.ConnectionSettings;
import com.calclab.emite.core.client.conn.XmppConnection;
import com.calclab.emite.core.client.xmpp.session.XmppSession;
import com.calclab.emite.core.client.xmpp.stanzas.Message;
import com.calclab.emite.core.client.xmpp.stanzas.Presence;
import com.calclab.hablar.chat.client.HablarChat;
import com.calclab.hablar.client.HablarConfig;
import com.calclab.hablar.client.HablarGinjector;
import com.calclab.hablar.clipboard.client.HablarClipboard;
import com.calclab.hablar.console.client.HablarConsole;
import com.calclab.hablar.core.client.Hablar;
import com.calclab.hablar.core.client.HablarCore;
import com.calclab.hablar.core.client.HablarWidget;
import com.calclab.hablar.core.client.browser.BrowserFocusHandler;
import com.calclab.hablar.core.client.pages.tabs.TabsLayout.TabHeaderSize;
import com.calclab.hablar.dock.client.HablarDock;
import com.calclab.hablar.editbuddy.client.HablarEditBuddy;
import com.calclab.hablar.group.client.HablarGroup;
import com.calclab.hablar.groupchat.client.HablarGroupChat;
import com.calclab.hablar.html.client.HtmlConfig;
import com.calclab.hablar.login.client.HablarLogin;
import com.calclab.hablar.login.client.LoginConfig;
import com.calclab.hablar.openchat.client.HablarOpenChat;
import com.calclab.hablar.rooms.client.HablarRooms;
import com.calclab.hablar.rooms.client.HablarRoomsConfig;
import com.calclab.hablar.roster.client.HablarRoster;
import com.calclab.hablar.roster.client.page.RosterPage;
import com.calclab.hablar.search.client.HablarSearch;
import com.calclab.hablar.signals.client.HablarSignals;
import com.calclab.hablar.signals.client.sound.HablarSoundSignals;
import com.calclab.hablar.signals.client.unattended.UnattendedChatsChangedEvent;
import com.calclab.hablar.signals.client.unattended.UnattendedChatsChangedHandler;
import com.calclab.hablar.user.client.HablarUser;
import com.calclab.hablar.usergroups.client.HablarUserGroups;
import com.calclab.hablar.vcard.client.HablarVCard;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.TabItem;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.logical.shared.CloseEvent;
import com.google.gwt.event.logical.shared.CloseHandler;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.TextArea;
import com.google.inject.Inject;
import com.calclab.emite.core.client.xmpp.session.SessionStates;
import com.calclab.emite.core.client.events.MessageEvent;
import com.calclab.emite.core.client.events.MessageHandler;
import com.calclab.emite.core.client.events.PresenceEvent;
import com.calclab.emite.core.client.events.PresenceHandler;
import com.calclab.emite.core.client.events.StateChangedEvent;
import com.calclab.emite.core.client.events.StateChangedHandler;
import com.calclab.emite.im.client.ImComponents;
import com.calclab.emite.im.client.roster.SubscriptionHandler.Behaviour;
import com.calclab.emite.xep.privacylists.client.PrivacyListsManager;
import com.calclab.hablar.core.client.HablarDisplay;


public class SiteChat extends LayoutContainer {
	private TextArea area; 

	public String chatLog = "";
	public String chatHeight = "400";
	public String chatWidth = "400";

	private String login;
	private String password;
	
	static boolean oneChatGoing = false;
	
	private final  TabItem liveChatTab;
	
	final HablarGinjector ginjector = GlobalRegistry.hablarInjector;
	
	XmppConnection connection;
	XmppSession session;

	private static HashMap<String, LoginXmpp> loginXmppMap = GlobalRegistry.getLoginXmppMap();
	private LoginXmpp loginXmpp;

	private TabItem personalityTab;
	
	SiteChat(TextArea logArea) {
		area = logArea;
		createHablar();
		liveChatTab = null;
	}
	
	@Inject
	SiteChat(@LoginXmppMap  HashMap <String, LoginXmpp> loginXmppMap) {			
		this.loginXmppMap = loginXmppMap;
		createHablar();
		liveChatTab=null;
	}
	
	
	public SiteChat(String width, String height, String login, String password, TabItem liveChatTab) {
		this.chatWidth = width;
		this.chatHeight = height;
		this.login = login;
		this.password = password;		
		
		this.liveChatTab = liveChatTab;
		
		this.personalityTab = GlobalRegistry.allPersonalitiesTabs.getItemByItemId(login); 
		createHablar();
	}
	
	
	private void createHablar() {
		prepareOnCloseAction();
		loginToJabber();	      						
		
		BrowserFocusHandler.getInstance();
		final HablarConfig config = HablarConfig.getFromMeta();
		final HtmlConfig htmlConfig = HtmlConfig.getFromMeta();
		
				
		config.layout = HablarDisplay.Layout.tabs; 
		config.hasRoster = true;
		config.dockRoster = "left";
		
		config.hasVCard=true;
		config.hasSignals = true;
		config.hasSound = true;
		htmlConfig.hasLogger = false;
		htmlConfig.inline = null; //here is where you can supply div

		
		config.roomsConfig = new HablarRoomsConfig();
		config.roomsConfig.sendButtonVisible = true;
		config.roomsConfig.roomsService = "conference.localhost";
		
		final HablarWidget widget = new HablarWidget(config.layout,TabHeaderSize.DEFAULT_SIZE);
		final Hablar hablar = widget.getHablar();
		
		new HablarCore(hablar);
		new HablarChat(hablar, config.chatConfig, loginXmpp.xmppRoster, loginXmpp.chatManager, loginXmpp.stateManager);
		new HablarRooms(hablar, config.roomsConfig, loginXmpp.xmppSession, loginXmpp.xmppRoster, loginXmpp.roomManager, loginXmpp.roomDiscoveryManager, loginXmpp.mucChatStateManager);
		new HablarGroupChat(hablar, config.roomsConfig, loginXmpp.xmppSession, loginXmpp.xmppRoster, loginXmpp.chatManager, loginXmpp.roomManager);
		new HablarDock(hablar, config.dockConfig);
		new HablarUser(hablar, loginXmpp.xmppSession, loginXmpp.presenceManager, loginXmpp.privateStorageManager);

		RosterPage rosterPage = null;
		HablarRoster hablarRoster = null;
		if (config.hasRoster) {
			hablarRoster = new HablarRoster(hablar, config.rosterConfig, loginXmpp.xmppSession, loginXmpp.xmppRoster, loginXmpp.chatManager, loginXmpp.subscriptionHandler);
			loginXmpp.subscriptionHandler.setBehaviour(Behaviour.refuseAll);
			rosterPage = hablarRoster.getRosterPage();
		}

		if (config.hasVCard) {
			new HablarVCard(hablar, config.vcardConfig, loginXmpp.xmppSession, loginXmpp.xmppRoster, loginXmpp.vCardManager);
		}

		if (config.hasRoster) {
			new HablarOpenChat(hablar, loginXmpp.xmppSession, loginXmpp.xmppRoster, loginXmpp.chatManager);
			new HablarEditBuddy(hablar, loginXmpp.xmppRoster); 
			new HablarUserGroups(rosterPage, hablar, loginXmpp.xmppRoster);
			new HablarGroup(hablar, loginXmpp.xmppSession, loginXmpp.xmppRoster);
			hablarRoster.addLowPriorityActions();
			
		}

		if (config.hasSearch) {
			new HablarSearch(hablar, config.searchConfig, loginXmpp.xmppSession, loginXmpp.xmppRoster, loginXmpp.chatManager, loginXmpp.searchManager);
		}

		if (config.hasSignals) {
			new HablarSignals(hablar, loginXmpp.xmppSession, loginXmpp.privateStorageManager);
		}

		if (config.hasSound) {
			new HablarSoundSignals(hablar);
		}

		if (config.hasCopyToClipboard) {
			new HablarClipboard(hablar);
		}

		if (htmlConfig.hasLogger) {
			new HablarConsole(hablar, loginXmpp.xmppConnection, loginXmpp.xmppSession);
		}

		if (htmlConfig.hasLogin) {
			new HablarLogin(hablar, LoginConfig.getFromMeta(), loginXmpp.xmppSession);
		}
		
    	hablar.getEventBus().addHandler(UnattendedChatsChangedEvent.TYPE, new UnattendedChatsChangedHandler() {
    	    @Override
    	    public void handleUnattendedChatChange(final UnattendedChatsChangedEvent event) {
    	    	liveChatTab.getHeader().setIcon(null);
    	    	personalityTab.getHeader().setIcon(null);
    	    }
    	});
		
		widget.setHeight("100%");
		this.add(widget);
		
	
	}

	public void loginToJabber() {
		
		initOutput();

		loginXmpp = ginjector.getLoginXmpp();
		loginXmppMap.put(login, loginXmpp);
		loginXmpp.setInstanceId(login);
         
        connection = loginXmpp.xmppConnection;
        connection.setSettings(new ConnectionSettings("mainmodule/proxy", GlobalRegistry.serverInfo.chatServer));
		session = loginXmpp.xmppSession;       
		final PrivacyListsManager plManager = loginXmpp.privacyListsManager;

        GWT.log("Add event handlers");
         
        session.addSessionStateChangedHandler(true, new StateChangedHandler() {
             @Override
             public void onStateChanged(StateChangedEvent event) {
                 if (event.is(SessionStates.loggedIn)) {
                	 print("We are now online");
                	// Window.alert("Hello");
                	plManager.onlyAllowMessagesFromSubscribedUsers("test", 1);
                 } else if (event.is(SessionStates.disconnected)) {
                	 print("We are now offline");
                 } else {
                	 print("Current state: " + event.getState());
                 }
             }
        });       
        
        session.addMessageReceivedHandler(new MessageHandler() {
             @Override
             public void onMessage(MessageEvent event) {
                 Message message = event.getMessage();
                 //Window.alert("Messaged received from " + message.getFrom() + ":" + message.getBody());
                 if (message.getBody()!= null) {
	                	 //liveChat.getHeader().setText("Attention");                	 
	                	 liveChatTab.getHeader().setIcon(Resources.HCMICONS.newChatIcon());
	                	 personalityTab.getHeader().setIcon(Resources.HCMICONS.newNoticeIcon());                	 
                 }
             }
         });

         session.addPresenceReceivedHandler(new PresenceHandler() {
             @Override
             public void onPresence(PresenceEvent event) {
                 Presence presence = event.getPresence();
                 print("Presence received from " + presence.getFrom() + ": " + presence.toString());
             }
         });
         
         session.login(uri(login+"@" + GlobalRegistry.serverInfo.chatServer),password);
         
        
         
	    }

	    private void initOutput() {
			//area = 
	    	if (area!= null) {
				area.setWidth("400");
				area.setHeight("500");
				//RootPanel.get().add(area);
				print("Welcome to emite basics example.");
	    	}
	    }

	    /**
	     * a helper method to output messages
	     * 
	     * @param message
	     */
	    private void print(final String message) {
	    	if (area == null) {
	    		chatLog = chatLog +"\n"+ message;
	    	} else {
	    		area.setText(area.getText() + "\n" + message);
	    	}
	    }
	    
		private void prepareOnCloseAction() {
			Window.addCloseHandler(new CloseHandler<Window>() {
				@Override
				public void onClose(final CloseEvent<Window> arg0) {						
						for (LoginXmpp loginXmpp : loginXmppMap.values()) {
							PageAssist.closeSession(loginXmpp.xmppSession);
						}
				}
			});
		}
}




	// ******** 1. Session *********
	// Session is the emite component that allows us to login/logout among
	// other things



/*
//final Connection connection = Suco.get(Connection.class);
Connection connection = loginXmpp.connection;

//connection.setSettings(new BoshSettings("proxy", "localhost"));
//connection = ginjector.getXmppConnection();
connection.setSettings(new ConnectionSettings("mainmodule/proxy", GlobalRegistry.serverInfo.chatServer));

//Session chatSession = Suco.get(Session.class);
final Session chatSession = loginXmpp.session;

// Session.onStateChanged allows us to know the state of the session
chatSession.onStateChanged(new Listener<Session>() {
    
	/*
	public void onEvent(Session.State state) {
    	  if (state == Session.State.ready) {
    	       Window.alert("Logged in");
    	       //print("Session state: " + session.getState());
    	  }
    }
    * /

	@Override
	public void onEvent(final Session session) {
        if (session.getState() == Session.State.loggedIn) {
            GWT.log("We are now online", null); 
            //sendHelloWorldMessage(session); 
        } else if (session.getState() == Session.State.disconnected) {

                GWT.log("We are now offline", null); 

         } 
	}
});

// Session.login and Session.logout are our xmpp entrance and exit
//chatSession.login(uri("tguless@test.shareshowandtell.com"), "secret123");
//Window.alert("Logging in with: " +login+"@" + GlobalRegistry.serverInfo.chatServer  + " Password: " + password);		

chatSession.login(uri(login+"@" + GlobalRegistry.serverInfo.chatServer),password);


//ginjector.getLoginXmppMap().put(login, loginXmpp);

// After login, we can send messages ...
//chatSession.send(new Message("Hello", uri("test123@test.shareshowandtell.com")));

/*		
// ... or receive messages ...
chatSession.onMessage(new Listener<Message>() {
    public void onEvent(final Message message) {
	print("Message arrived: " + message.getBody());
    }
});
*/

/*

// ******** 2. ChatManager *********
// ... but probably you prefer to use the a powerful abstraction: Chat
final ChatManager chatManager = Suco.get(ChatManager.class);
final Chat chat = chatManager.open(uri("tguless@test.shareshowandtell.com"));
// with chats you don't have to specify the recipient
chat.send(new Message("Hello test2"));
// and you only receive messages from the entity you specified
chat.onMessageReceived(new Listener<Message>() {
    public void onEvent(final Message message) {
	print("Message from test2 arrived: " + message.getBody());
    }
});
*/

/*
// ******** 3. Roster *********
// As always, Suco is our friend...
final Roster roster = Suco.get(Roster.class);
// ... we're in asynchronous world... use listeners
// onRosterRetrieved is fired when... surprise! the roster is retrieved
roster.onRosterRetrieved(new Listener<Collection<RosterItem>>() {
    public void onEvent(final Collection<RosterItem> items) {
	print("We have the roster");
	for (final RosterItem item : items) {
	    print("Roster item: " + item);
	}
    }
});
*/
/*
// we can track changes in roster items (i.e. roster presence changes)
// using Roster.onItemUpdated
roster.onItemChanged(new Listener<RosterItem>() {
    public void onEvent(final RosterItem item) {
	print("Roster item changed:" + item);
    }
});
*/