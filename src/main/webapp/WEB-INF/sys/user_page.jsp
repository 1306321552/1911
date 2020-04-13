<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.xpd.bean.Role" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>用户管理页面</title>
<link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body>
	<div style="text-align: center;color:red;font-size:25px">用户管理页面</div>
	<script type="text/html" id="userlist_toolbar">
		<div>
			<div class="layui-input-inline">
				<input class="layui-input" type="text" id="checktext" placeholder="请输入需要查询的数据"/>
			</div>

<shiro:hasPermission name="user_sel">
			<button class="layui-btn layui-btn-sm" onclick="user_check()">查询</button>
</shiro:hasPermission>
<shiro:hasPermission name="user_add">
			<button class="layui-btn layui-btn-sm" onclick="user_insert()">添加</button>
</shiro:hasPermission>
<shiro:hasPermission name="user_del">
			<button class="layui-btn layui-btn-sm layui-btn-warm" onclick="user_delete()">删除</button>
</shiro:hasPermission>
		</div>
	</script>
	<script type="text/html" id="operate_toolbar">
		<div>
			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="details">详情</button>
<shiro:hasPermission name="user_upd">
  			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="update">编辑</button>
</shiro:hasPermission>
<shiro:hasPermission name="user_del">
  			<button class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm" lay-event="delete">删除</button>
</shiro:hasPermission>
			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="assign_role">分配角色</button>
		</div>
	</script>
	<table class="layui-table"
		lay-data="{url:'sys/user_list',toolbar:'#userlist_toolbar',id:'userlist',page:true}" lay-filter='usertable'>
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'userid'}">ID</th>
				<th lay-data="{field:'username'}">名字</th>
				<th lay-data="{field:'sex'}">性别</th>
				<th lay-data="{field:'tel'}">电话</th>
				<th lay-data="{templet:$('#operate_toolbar').html()}">操作</th>
			</tr>
		</thead>
	</table>

	<!-- 添加弹出层 -->
	<div hidden id="insert_user_div" class="layui-form">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_userid" name="user_id"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">姓名:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_username" name="user_name"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_password" name="password"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">性别:</label>
				<div class="layui-input-block">
					<input type="radio" name="sex" title="男" value="男" />
					<input type="radio" name="sex" title="女" value="女" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">电话:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_tel" name="tel"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改弹出层 -->
	<div hidden id="update_user_div" class='layui-form'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">姓名:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_username" name="username"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">性别:</label>
				<div class="layui-input-block">
					<input type="radio" name="sex" title="男" value="男" />
					<input type="radio" name="sex" title="女" value="女" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">电话:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_tel" name="tel"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 详情弹出层 -->
	<div hidden id="details_user_div">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_userid" name="userid" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">姓名:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_username" name="username" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">性别:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_sex" name="sex" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">电话:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_tel" name="tel" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 分配角色 -->
	<div hidden id="assign_role"></div>

	<script type="text/javascript" src="./jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="./layui/layui.all.js"></script>
	<script type="text/javascript">
		var table = layui.table;
		/* 点击查询按钮后重载 */
		function user_check(){
			var checktext = $("#checktext").val();
			table.reload("userlist",{
				url:"sys/checkUser",
				where:{
					"checktext":checktext
				}
			});
		};
	</script>
	<script type="text/javascript">
		var table=layui.table;
		function user_insert(){
			layer.open({ 
				title : "添加信息",
				type : 1,
				content : $("#insert_user_div"),
				btn : ["保存","关闭"],
				btn1:function(){
					$.post("sys/addUser",{"userid":$("#insert_userid").val(),"username":$("#insert_username").val(),
						"password":$("#insert_password").val(),"sex":$("input[name='sex']:checked").val(),
						"tel":$("#insert_tel").val()
						},
							function(){
						//关闭窗口
						layer.closeAll();
						//列表刷新
						layer.msg("添加成功")
						table.reload("userlist");
					});
				}
			});
		}
	</script>
	<script type="text/javascript">
		var table = layui.table;
		table.on('tool(usertable)',function(obj){
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.userid;
			if(layEvent === 'update'){
				$("#update_userid").val(checkdata.userid);
				$("#update_username").val(checkdata.username);
				$("#update_sex").val(checkdata.sex);
				$("#update_tel").val(checkdata.tel);
				layer.open({
					title:"修改信息",
					type:1,
					content:$("#update_user_div"),
					btn:["保存","关闭"],
					btn1:function(){
						$.post("sys/updateUser",{"username":$("#update_username").val(),"sex":$("input[name='sex']:checked").val(),
							"tel":$("#update_tel").val(),
							"userid":checkid},
								function(){
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("userlist");
						});
					}
				});
			}else if(layEvent === 'delete'){
				layer.confirm('确认要对'+checkdata.username+'进行删除操作吗?',{
					icon:3,
					title:'提示'
				},function(index){
					$.post("sys/deleteUser",{
						"userid":checkid
					},function(){
						layer.msg("删除成功");
						table.reload("userlist");
					});
					layer.close(index);
				});
			}else if(layEvent === 'details'){
				$("#details_userid").val(checkdata.userid);
				$("#details_username").val(checkdata.username);
				$("#details_sex").val(checkdata.sex);
				$("#details_tel").val(checkdata.tel);
				layer.open({
					title:"用户详情",
					type:1,
					content:$("#details_user_div"),
				});
			}else if(layEvent === 'assign_role'){
				var checkname = checkdata.username;
				var transfer = layui.transfer;
				var callback = [callback];
				$.post("sys/roleList",function(result){
					console.log(result);
					layui.use("transfer",function(){
						transfer.render({
							elem:"#assign_role",
							title:["未选角色","已选角色"],
							data:result,
							value:[1001],
							showSearch:true,
							id:'demo1',
							text:{
								none:"暂无角色",
								searchNone:"无匹配角色"
							},
							parseData:function(data){
								return{
									"value":data.role_id,
									"title":data.role_name,
									"disabled":data.disabled,
									"checked":data.checked
								}
							},
						});
					});
				});
				layer.open({
					title:"分配角色:"+checkname,
					type:1,
					area:["500px","400px"],
					content:$("#assign_role"),
					btn:["保存","关闭"],
					/* btn1:function(){
						//获取右侧数据
						var getData = transfer.getData('demo1');
						var ids=new Array();
						//循环取出右侧id
						var value;
						for(var i = 0;i<getData.length;i++){
							value = getData[i].value;
							ids[i]=value;
						}
						console.log(ids.toString());
						for(var i = 0;i<ids.length;i++){
							$.post('sys/user_role_transfer',{
								"userid":checkid,
								"role_id":ids[i]
							});
						};
						layer.closeAll();
						layer.msg("角色分配成功");
						table.reload("userlist");
					} */
					btn1:function(){
						$.ajax({
							type:"post",
							url:"sys/user_role_callback",
							data:{"userid":checkid},
							success:function(data){
								alert(data)
							}
						});
					}
				});
			};
		})
	</script>
	
	<script type="text/javascript">
	var table = layui.table;
	function user_delete(){
		var checkdata = table.checkStatus("userlist").data;
		if(checkdata.length > 0){
			layer.confirm('确认要对选中的账号进行删除操作吗?',{
				icon:3,
				title:'提示'
			},function(index){
				for(var i = 0;i<checkdata.length;i++){
					var checkid=checkdata[i].userid;
					$.post("sys/deleteUser",{
						"userid":checkid
					},function(){
					});
				}
				layer.msg("删除成功");
				table.reload("userlist");
				layer.close(index);
			});
		}else{
			layer.msg("请先选中数据!!!");
		};
	}
	</script>
	
	<script type="text/javascript">
	
	</script>
</body>
</html>