<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>管理员登录</title>
		<link rel="icon" href="img/admin_log/管理员标题.png" />
		<link rel="stylesheet" type="text/css" href="css/admin_log.css"/>
		<style>
			#text_log_on_block1{
				animation: mymove 3s;
			}
			#text_log_on_block2{
				animation: mymove 3s;
			}
			@keyframes mymove{
				from{opacity: 0;}
				to{opacity: 100%;}
			}
		</style>
	</head>
	<body>
		<div class="page_top">
			<a href="index.html">
				<div class="page_top_img"><img src="img/admin_log/管理员标题.png" ></div>
				<div class="page_top_words">
					<div class="page_top_xmsc">管理员登录</div>
					<div class="page_top_subtext">让每个人都能享受管理的乐趣</div>
				</div>
			</a>
		</div>
		<div class="text_div">
			<a href="#">
				<img src="img/admin_log/管理员登录界面背景.jpg" >
			</a>
		</div>
		<div class="text_log_on">
			<div class="text_log_on1">
				<a id="text_log_on1_left" onmousedown="click_accounts()">帐号登录</a>
				<span></span>
				<a id="text_log_on1_right" onmousedown="click_QR()">扫码登录</a>
			</div>
			<div id="text_log_on_block1" class="text_log_on_block1">
				${msg}
				<form action="login_system" method="post">
				<div class="text_log_on2">
					<input placeholder="管理员账号" type="text" id="username" name="username"/>
					<input placeholder="密码" type="password" id="password" name="password"/>
				</div>
				<div class="text_log_on3">
					<input type="submit" value="登录"></input>
				</div>
				</form>
				<div class="text_log_on4">
					<div>
						<a href="#">手机短信登录/注册</a>
						<div>
							<a href="http://localhost/emailfile" target="_blank">立即注册</a>
							<span>|</span>
							<a href="#">忘记密码?</a>
						</div>
					</div>
				</div>
				<div class="text_log_on5">
					<span class="text_log_on5_line"></span>
					<span class="text_log_on5_text">其他方式登录</span>
					<span class="text_log_on5_line"></span>
				</div>
				<div class="text_log_on6">
					<div class="text_log_on6_content">
						<div class="text_log_on6_content_qq">
							<a href="#" title="QQ登录">
								<img src="img/admin_log/qq_32px_1164430_easyicon.net.ico" >
							</a>
						</div>
						<div class="text_log_on6_content_wb">
							<a href="#" title="微博登录">
								<img src="img/admin_log/weibo_32px_1114573_easyicon.net.ico" >
							</a>
						</div>
						<div class="text_log_on6_content_wx">
							<a href="#" title="微信登录">
								<img src="img/admin_log/Wechat_32px_1230528_easyicon.net.ico" >
							</a>
						</div>
						<div class="text_log_on6_content_zfb">
							<a href="#" title="管理员app登录">
								<img src="img/admin_log/管理员标题.png" >
							</a>
						</div>
					</div>
				</div>
			</div>
			<div id="text_log_on_block2" class="text_log_on_block2">
				<div class="text_log_on_block2_QR">
					<img src="img/admin_log/二维码.png" >
				</div>
				<div class="text_log_on_block2_2">
					<div class="text_log_on_block2_21">使用</div>
					<div class="text_log_on_block2_22">管理员APP</div>
					<div class="text_log_on_block2_23">扫一扫</div>
				</div>
				<div class="text_log_on_block2_3">
					管理员打开「管理」>「管理账号」扫码登录
				</div>
			</div>
		</div>
		<div class="page_down">
			<div class="page_down1">
				<a href="#" class="page_down1_1">简体</a>
				<span class="page_down1_line">|</span>
				<a href="#" class="page_down1_1">繁体</a>
				<span class="page_down1_line">|</span>
				<a href="#" class="page_down1_1">English</a>
				<span class="page_down1_line">|</span>
				<a href="#" class="page_down1_1">常见问题</a>
				<span class="page_down1_line">|</span>
				<a href="#" class="page_down1_1">隐私政策</a>
			</div>
			<div class="page_down2">
				<div class="page_down21">小米公司版权所有-京ICP备10046444-</div>
				<div class="page_down21">
					<a href="#">
					<img src="img/admin_log/京公安网安备图片.png" >京公安网安备11010802020134号
					</a>
				</div>
				<div class="page_down21">-京ICP证110507号</div>
			</div>
		</div>
		
		<script src="js/admin_log.js"></script>
	</body>
	
</html>
