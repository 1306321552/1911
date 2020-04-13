package com.xpd.bean;

import java.util.ArrayList;
import java.util.List;

public class User {

	private String userid;
	private String username;
	private String password;
	private String sex;
	private String tel;
	private List<Role> roles;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getpassword() {
		return password;
	}
	public void setpassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	/**
	 * 获得用户的所有权限
	 * @return
	 */
	public List getAllPermissions() {
		List list = new ArrayList();
		for(int i = 0;i<roles.size();i++) {
			Role role = (Role)roles.get(i);
			list.addAll(role.getPermissions());
		}
		return list;
	}
	
	public List<String> getPermissionCodes(){
		List<Perm> list = getAllPermissions();
		List<String> list_code = new ArrayList();
		for(Perm p : list) {
			list_code.add(p.getPerm_code());
		}
		return list_code;
	}
}
