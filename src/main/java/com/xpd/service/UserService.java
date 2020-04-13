package com.xpd.service;

import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xpd.bean.Role;
import com.xpd.bean.User;
import com.xpd.dao.UserDao;

@Service
public class UserService {

	@Autowired
	UserDao userdao;
	
	public List userList(Map params) {
		List list = userdao.userList(params);
		return list;
	}
	
	public int getUserCount(Map params) {
		int count = userdao.getUserCount(params);
		return count;
	}
	
	public User getUser(String username) {
		return userdao.getUser(username);
	}
	
	public List getPermByUsername(String username) {
		return userdao.getPermByUsername(username);
	}
	
	public void addUser(User user) {
		//将密码通过md5盐值加密
		SimpleHash sh = new SimpleHash("md5", "123456", user.getUserid());
		userdao.addUser(user);
	}
	
	public void deleteUser(User user) {
		userdao.deleteUser(user);
	}
	
	public void updateUser(User user) {
		userdao.updateUser(user);
	}
	
	public List checkUser(Map params) {
		List list = userdao.checkUser(params);
		return list;
	}
	
	//先删除数据库该userid对应的role_id
	public void user_role_transfer1(Map params) {
		userdao.user_role_transfer1(params);
	}
	//再将穿梭框中获得的数据保存在user_role表
	public void user_role_transfer2(Map params) {
		userdao.user_role_transfer2(params);
	}
	
	public List user_role_callback(User user) {
		List list= userdao.user_role_callback(user);
		return list;
	}
}
