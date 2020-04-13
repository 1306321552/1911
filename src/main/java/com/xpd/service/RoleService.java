package com.xpd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xpd.bean.Role;
import com.xpd.dao.RoleDao;
import com.xpd.util.Page;

@Service
public class RoleService{
	
	@Autowired
	RoleDao roleDao;

	public void addRole(Role role) {
		roleDao.addRole(role);
	}

	public void updateRole(Role role) {
		roleDao.updateRole(role);
	}

	public void deleteRole(Role role) {
		roleDao.deleteRole(role);
	}

	public List<Role> showRole(Map params) {
		Page.pageParam(params);
		List<Role> list = roleDao.showRole(params);
		return list;
	}
	
	public List<Role> getRole(Map params) {
		Page.pageParam(params);
		List<Role> list = roleDao.getRole(params);
		return list;
	}

	public int getRoleCount(Map params) {
		int count = roleDao.getRoleCount(params);
		return count;
	}

	//保存角色和权限的关联
	public void role_perm2(String role_id, String perms) {
		//1.将perms转为集合
		List list = toList(perms);
		Map map = new HashMap();
		map.put("role_id", role_id);
		map.put("perms", list);
		roleDao.role_perm2(map);
	}
	
	private List toList(String perms) {
		List list = new ArrayList();
		String[] perm_arr = perms.split(",");
		for(String str:perm_arr) {
			if(!str.trim().equals("")) {
				list.add(str);
			}
		}
		return list;
	}
	
	//用户分配角色穿梭框查询所有角色
	public List roleList() {
		List list = roleDao.roleList();
		return list;
	}

}
