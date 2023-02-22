package com.hierarchycm.gxt.server.jpa.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;


@NamedQuery(name="ObjectInstanceEntity.findAll" , query="SELECT O FROM object_instance O")

//hibernate.max_fetch_depth

@Entity(name = "object_instance")
public class ObjectInstanceEntity implements Serializable {

	 @Column(name = "name_nm", nullable = false, length = 255)
	 public String instanceName;
	 
	 @Id
	 @Column(name = "object_ky", nullable = false, length = 10)
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 public String instanceId;
	 
	 @Column(name = "object_type_ky", nullable = false, length = 10)
	 public String typeId;
	 	
	 @OneToMany	 	 
	 public ArrayList <ObjectInstLinkEntity> childrenoil;
	 
}
