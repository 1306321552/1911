<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>小皮蛋CRM管理系统</title>
  <link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">小皮蛋CRM管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          <%-- <shiro:user>
          	<shiro:principal></shiro:principal>
          </shiro:user> --%>
          ${username }
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item"><a href="javascript:;" url="sys/user_page">用户管理</a></li>
        <li class="layui-nav-item"><a href="javascript:;" url="sys/role_page">角色管理</a></li>
        <li class="layui-nav-item"><a href="javascript:;" url="sys/bumen_page">部门管理</a></li>
        <li class="layui-nav-item  layui-nav-itemed">
        	<a href="javascript:;" url="">客户管理</a>
        	<dl class="layui-nav-child">
        		<dd><a href="javascript:;" url="sys/customer_page">所有客户</a></dd>
        		<dd><a href="javascript:;" url="sys/customer_public_page">公海客户</a></dd>
        		<dd><a href="javascript:;" url="sys/customer_documentary_page">跟单客户</a></dd>
        	</dl>
        </li>
        <li class="layui-nav-item"><a href="javascript:;" url="sys/visit_page">回访记录</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body" background-size: 100%">
    <!-- 内容主体区域 -->
    <iframe id="mainIframe" class="layadmin-iframe ifrem_voice" width="100%" height="98%" name="userlist" src=""></iframe>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script src="./layui/layui.all.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
<script type="text/javascript">
var $ = layui.jquery;
$("[url]").click(function(){
	$("#mainIframe").attr("src",$(this).attr('url'));
});
</script>

</body>
</html>