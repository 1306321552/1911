package com.xpd;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.util.Arrays;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mode {
	public static void main(String[] args) throws MessagingException, IOException {
		//设置服务器的属性
		Properties props = new Properties();
		props.setProperty("mail/host", "stmp.qq.com");
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.auth", "true");
		Session session = Session.getInstance(props,new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("1306321552@qq.com", "muarlctqvazkgdcf");
			}
		});
		//开启调试模式
		session.setDebug(true);
		//获得传输者对象
		Transport t = session.getTransport();
		//四个参数--邮箱服务--端口号(默认25)--账号--登录密码
		t.connect("smtp.qq.com",25,"1306321552@qq.com","jysfbRL1996126**");
		//邮件内容
		Message message = new MimeMessage(session);
		//发件人邮箱
		message.setFrom(new InternetAddress("1306321552@qq.com"));
		//收件人邮箱
		message.setRecipient(Message.RecipientType.TO, new InternetAddress("382658397@qq.com"));
		message.setSubject("---标题---");
		String text="";
		URL url = new URL("http://localhost:8080/emailfile");
		InputStream is = url.openStream();
		url.openStream();
		char[] c_arr = new char[1024];
		int l = 0;
		Reader r = new InputStreamReader(is);
		while((l=r.read(c_arr))>0) {
			text += new String(Arrays.copyOf(c_arr, l));
		}
		message.setContent(text,"text/html;charset=UTF-8");
		//发送邮件
		t.sendMessage(message, message.getAllRecipients());
		//关闭传输者流
		t.close();
	}
}
