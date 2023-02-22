package com.hierarchycm.gxt.server.jpa.entities;

import java.util.HashMap;

//import com.google.gwt.dev.util.collect.HashMap;

public interface ParentInterface <E>  {
		public HashMap <String, E> getChildren();
		public  void setChildren(HashMap <String, E> children);
}
