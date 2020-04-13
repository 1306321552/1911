package com.xpd.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnnoAction {
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "toLogin";
	}

	@RequestMapping("/login_system")
	public String login_system(String username,String password,HttpServletRequest request) {
		//生成安全令牌
		UsernamePasswordToken token = new UsernamePasswordToken(username,password);//使用用户名和密码生成安全令牌
		Subject sub = SecurityUtils.getSubject();//获取当前访问用户的对象
		try {
			sub.login(token);//开始登录---执行realm
//			request.setAttribute("username", username);
//			session.setAttribute("username", username);
		} catch (CredentialsException ce) {
			request.setAttribute("msg", ce.getMessage());
			return "login";
		}
		return "sys/system";
	}
	
	@RequestMapping("/emailfile")
	public String emailFile() {
		return "register";
	}
}
