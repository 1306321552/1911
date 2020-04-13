package com.xpd.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xpd.bean.Role;
import com.xpd.service.RoleService;
import com.xpd.util.LayJSON;
import com.xpd.util.RoleJSON;

@Controller
@RequestMapping("/sys")
public class RoleAction {

	@Autowired
	RoleService roleService;
	
	@RequestMapping("/addRole")
	@ResponseBody
	public void addRole(Role role) {
		roleService.addRole(role);
	}
	
	@RequestMapping("/updateRole")
	@ResponseBody
	public void updateRole(Role role) {
		roleService.updateRole(role);
	}
	
	@RequestMapping("/deleteRole")
	@ResponseBody
	public void deleteRole(Role role) {
		roleService.deleteRole(role);
	}
	
	@RequestMapping("/showRole")
	@ResponseBody
	public String showRole(@RequestParam Map params) {
		int count = roleService.getRoleCount(params);
		List listrole = roleService.showRole(params);
		LayJSON layjson = new LayJSON(listrole,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	@RequestMapping("/getRole")
	@ResponseBody
	public String getRole(@RequestParam Map params) {
		int count = roleService.getRoleCount(params);
		List listrole = roleService.getRole(params);
		LayJSON layjson = new LayJSON(listrole,count);
		String strjson = JSONObject.toJSONString(layjson);
		System.out.println(strjson);
		System.out.println("------------");
		layjson.setCount(count);
		return strjson;
	}
	
	//跳转到角色管理系统
	@RequestMapping("/role_page")
	public String role() {
		return "sys/role_page";
	}
	
	//用户分配角色穿梭框查询所有角色
	@RequestMapping("/roleList")
	@ResponseBody
	public JSON roleList() {
		List listrole = roleService.roleList();
		System.out.println(listrole.size());
		RoleJSON layjson = new RoleJSON(listrole);
		String strjson = JSONObject.toJSONString(layjson);
		JSONObject object = JSONObject.parseObject(strjson);
		JSONArray array = object.getJSONArray("data");
		System.out.println(array);
		System.out.println("------------");
		return array;
		
	}
	
	
}

