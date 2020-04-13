package com.xpd.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xpd.bean.Role;
import com.xpd.bean.User;
import com.xpd.service.UserService;
import com.xpd.util.LayJSON;

@Controller
@RequestMapping("/sys")
public class UserAction {

	@Autowired
	UserService userService;
	
	@RequestMapping("/addUser")
	@ResponseBody
	public void addUser(User user) {
		userService.addUser(user);
	}
	
	@RequestMapping("/deleteUser")
	@ResponseBody
	public void deleteUser(User user) {
		userService.deleteUser(user);
	}
	
	@RequestMapping("/updateUser")
	@ResponseBody
	public void updateUser(User user) {
		userService.updateUser(user);
	}
	
	@RequestMapping("/checkUser")
	@ResponseBody
	public String checkUser(@RequestParam Map params) {
		int count = userService.getUserCount(params);
		System.out.println(count+"---------count");
		List list = userService.checkUser(params);
		System.out.println(list.size()+"----------list");
		LayJSON layjson = new LayJSON(list,count);
		String strjson = JSONObject.toJSONString(layjson);
		layjson.setCount(count);
		return strjson;
	}
	
	@RequestMapping("/user_page")
	public String user_page() {
		return "sys/user_page";
	}
	
	@RequestMapping("/user_list")
	@ResponseBody
	public String user_list(@RequestParam Map params) {
		int count = userService.getUserCount(params);
		List list = userService.userList(params);
		LayJSON layjson = new LayJSON(list,count);
		String strjson = JSONObject.toJSONString(layjson);
		layjson.setCount(count);
		return strjson;
	}

	@RequestMapping("/user_role_transfer")
	public void user_role_transfer(@RequestParam Map params) {
		//先删除数据库该userid对应的role_id
		userService.user_role_transfer1(params);
		//再将穿梭框中获得的数据保存在user_role表
		userService.user_role_transfer2(params);
	}
	
	//修改用户权限穿梭框的回调
	@RequestMapping("/user_role_callback")
	public List user_role_callback(User user) {
	List list = userService.user_role_callback(user);
	System.out.println(list);
	return list;
	}
}
