package com.hierarchycm.gxt.client.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class ServerInfo implements Serializable {
	public String chatServer;	
	public HashMap<String, HashMap<String, ObjectLinkType>> typeSubtypes;
	public String rootTypeId;
	public int defaultPopupHeight;
	public int defaultPopupWidth;
	public HashSet<String> personalityTypes = null;
}
