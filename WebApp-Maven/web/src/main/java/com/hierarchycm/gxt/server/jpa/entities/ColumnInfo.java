package com.hierarchycm.gxt.server.jpa.entities;

import java.io.Serializable;

public class ColumnInfo implements Serializable {
	public String field;
	public String type; 
	public String nullable;
	public String key;
	public String defaultval;
	public String extra;
}
