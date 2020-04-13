package com.xpd.shiro;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xpd.bean.Perm;
import com.xpd.bean.User;
import com.xpd.service.UserService;
import com.xpd.util.Context;

@Component
public class MyRealm extends AuthorizingRealm{

	@Autowired
	UserService userService;
	
	/**
	 * 该方法只有登陆成功才会运行
	 * 每当需要权限认证时,会执行此方法
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println(SecurityUtils.getSubject().getPrincipal());
//		//Perm对象的一个集合
//		List listx = userService.getPermByUsername(username);//Perm对象的一个集合
//		List list = user.getAllPermissions();
//		SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
		//需要一个字符串的集合
//		List<String> str_perm_list = getPermList(listx);
//		sai.addStringPermissions(str_perm_list);
//		return sai;
		Subject sub = SecurityUtils.getSubject();
		User user = (User)sub.getSession().getAttribute(Context.LOGIN_USER);
		List<String> list = user.getPermissionCodes();
		SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
		sai.addStringPermissions(list);
		return sai;
	}
	
	private List<String> getPermList(List list){
		List<Perm> PBlist = (List<Perm>)list;
		List<String> str_perm_list = new ArrayList();
		for(Perm pb : PBlist ) {
			str_perm_list.add(pb.getPerm_code());
		}
		return str_perm_list;
	}

	/**
	 * 登录认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
//		//获得用户名和密码
		String username = token.getPrincipal().toString();
		String password = new String((char[])token.getCredentials());
		//对password进行加密
		SimpleHash sh = new SimpleHash("md5",password);
//		//把password和username一起加密
//		sh = new SimpleHash("md5", password,username);
//		//加密次数--4次
//		sh = new SimpleHash("md5", password,username,4);
		System.out.println(sh.toString());
		//通过用户名查询用户相关数据
		User user = userService.getUser(username);
		String userid = user.getUserid();
		Subject sub = SecurityUtils.getSubject();
		System.out.println(user.getAllPermissions().size());
//		//数据库验证是否正确
//		if(user==null||user.getUsername()==null) {
//			throw new CredentialsException("用户名不匹配");
//		}else 
			if(!sh.toString().equals(user.getpassword())) {
			throw new CredentialsException("密码不正确");
		}
		sub.getSession().setAttribute(Context.LOGIN_USER, user);
		sub.getSession().setAttribute("username", username);
		sub.getSession().setAttribute("userid", userid);
		return new SimpleAuthenticationInfo(username,password,getName());
	}

}
