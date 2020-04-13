package com.xpd.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.xpd.bean.Role;
import com.xpd.bean.User;

@Repository
public interface UserDao {

	List userList(Map params);
	int getUserCount(Map params);
	User getUser(String username);
	List getPermByUsername(String username);
	
	void addUser(User user);
	void deleteUser(User user);
	void updateUser(User user);
	List checkUser(Map params);
	
	//先删除数据库该userid对应的role_id
	void user_role_transfer1(Map params);
	//再将穿梭框中获得的数据保存在user_role表
	void user_role_transfer2(Map params);
	//修改用户权限穿梭框的回调
	List user_role_callback(User user);
}
