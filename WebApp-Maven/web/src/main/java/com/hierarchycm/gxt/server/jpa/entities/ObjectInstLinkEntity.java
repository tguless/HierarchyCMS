package com.hierarchycm.gxt.server.jpa.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

public class ObjectInstLinkEntity  implements Serializable  {

	 @Id
	 @Column(name = "object_inst_link_ky", nullable = false, length = 10)
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 public String instanceLinkId;	 
	 
	 @Column(name = "src_object_ky", nullable = false, length = 10)	 
	 public String parentId;
	 
	 @Column(name = "dest_object_ky", nullable = false, length = 10)	 
	 public String childId;

	 public ObjectLinkTypeEntity olt = new ObjectLinkTypeEntity();
	 
	 @ManyToOne	 
	 @JoinColumn(name="object_ky")
	 public ObjectInstanceEntity parent = new ObjectInstanceEntity();	 
	 
	 @ManyToOne	 
	 @JoinColumn(name="dest_object_ky")
	 public ObjectInstanceEntity child = new ObjectInstanceEntity(); 

	 
}
