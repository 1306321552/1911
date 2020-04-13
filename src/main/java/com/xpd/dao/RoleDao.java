package com.xpd.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xpd.bean.Role;

@Repository
public interface RoleDao {

	void addRole(Role role);
	void updateRole(Role role);
	void deleteRole(Role role);
	
	List showRole(Map params);
	List getRole(Map params);
	int getRoleCount(Map params);
	
	void role_perm2(Map map);
	
	List roleList();
}
