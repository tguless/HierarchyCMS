package com.hierarchycm.gxt.server.jpa.entities;

import java.io.Serializable;

public class ObjectLinkTypePermissions implements Serializable {
	//Priv = Privilaged
	//Rest = Restricted
	//Chld = Child
	//Prnt = Parent
	//Frnd = Frnd
	//Rec  = Rec
	//Crt  = Crt
	//Rd   = Read
	//Wr   = Write
	//Del  = Delete
	
	public boolean  chldCrtRd = false;
	public boolean  childCrtWr = false;
	public boolean  childCrtDel = false;

	public boolean  frndOfChldCrtRd = false;
	public boolean  frndOfChldCrtWr = false;
	public boolean  frndOfChldCrtDel = false;

	public boolean  privFrndOfChldCrtRd = false;
	public boolean  privFrndOfChldCrtWr = false;
	public boolean  privFrndOfChldCrtDel = false;
	
	public boolean  restFrndOfChldCrtRd = false; 
	public boolean  restFrndOfChldCrtWr = false;
	public boolean  restFrndOfChldCrtDel = false;
	
	public boolean parentsOfChldRecRd = false;
	public boolean parentsOfChldRecWr = false;
	public boolean parentsOfChldRecDel = false;
	
	public boolean frndOfPrntsOfChldRecRd = false;
	public boolean frndOfPrntsOfChldRecWr = false;
	public boolean frndOfPrntsOfChldRecDel = false;

	public boolean privFrndOfPrntsOfChldRecRd = false;
	public boolean privFrndOfPrntsOfChldRecWr = false;	
	public boolean privFrndOfPrntsOfChldRecDel = false;
	
	public boolean restFrndOfPrntsOfChldRecRd = false;
	public boolean restFrndOfPrntsOfChldRecWr = false;	
	public boolean restFrndOfPrntsOfChldRecDel = false;
	
	public boolean allowChldCreate;
	public boolean allowChldLink;
	
	public boolean forceSingleChild;
}
