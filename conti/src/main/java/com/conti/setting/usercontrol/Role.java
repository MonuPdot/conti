package com.conti.setting.usercontrol;


import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;

import javax.persistence.Table;

/**
 * @Project_Name conti
 * @Package_Name com.conti.setting.usercontrol
 * @File_name Role.java
 * @author Sankar
 * @Created_date_time Jun 20, 2017 2:21:39 PM
 * @Updated_date_time Jun 20, 2017 2:21:39 PM
 */

@Entity
@Table(name="a_role")
public class Role {
	
	private int Role_Id;
	private String Role_Name,Obsolete,Active;
	
	@Id
	@Column(name = "role_id")
	public int getRole_Id() {
		return Role_Id;
	}
	public void setRole_Id(int role_Id) {
		Role_Id = role_Id;
	}
	@Column(name = "role_name")
	public String getRole_Name() {
		return Role_Name;
	}
	public void setRole_Name(String role_Name) {
		Role_Name = role_Name;
	}
	@Column(name = "obsolete")
	public String getObsolete() {
		return Obsolete;
	}
	public void setObsolete(String obsolete) {
		Obsolete = obsolete;
	}
	@Column(name = "active")
	public String getActive() {
		return Active;
	}
	public void setActive(String active) {
		Active = active;
	}
	
}
