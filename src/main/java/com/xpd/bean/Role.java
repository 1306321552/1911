package com.xpd.bean;

import java.util.List;

public class Role {

	private String role_id;
	private String role_code;
	private String role_name;
	private List<Perm> permissions;
	
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_code() {
		return role_code;
	}
	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}
	public List<Perm> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Perm> permissions) {
		this.permissions = permissions;
	}
	
	
}
