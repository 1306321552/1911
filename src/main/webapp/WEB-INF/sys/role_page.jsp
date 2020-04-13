<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>角色管理页面</title>
<link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body>

	<div style="text-align: center;color:red;font-size:25px">角色管理页面</div>
	<script type="text/html" id="rolelist_toolbar">
		<div>
			<div class="layui-input-inline">
				<input class="layui-input" type="text" id="checktext" placeholder="请输入需要查询的数据"/>
			</div>
			<button class="layui-btn layui-btn-sm" onclick="role_check()">查询</button>
			<button class="layui-btn layui-btn-sm" onclick="role_insert()">添加</button>
			<button class="layui-btn layui-btn-sm layui-btn-warm" onclick="role_delete()">删除</button>
			<button class="layui-btn layui-btn-sm" lay-event="assign_perm">分配权限</button>
		</div>
	</script>
	<script type="text/html" id="operate_toolbar">
		<div>
			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="details">详情</button>
  			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="update">编辑</button>
  			<button class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm" lay-event="delete">删除</button>
		</div>
	</script>
	<table class="layui-table"
		lay-data="{url:'sys/showRole',toolbar:'#rolelist_toolbar',id:'rolelist',page:true}" lay-filter='roletable'>
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'role_id'}">ID</th>
				<th lay-data="{field:'role_code'}">编号</th>
				<th lay-data="{field:'role_name'}">姓名</th>
				<th lay-data="{templet:$('#operate_toolbar').html()}">操作</th>
			</tr>
		</thead>
	</table>

	<!-- 添加弹出层 -->
	<div hidden id="insert_role_div">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">角色ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_role_id" name="role_id"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">角色名字:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_role_name" name="role_name"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改弹出层 -->
	<div hidden id="update_role_div" class='layui-form'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">角色名字:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_role_name" name="role_name"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 详情弹出层 -->
	<div hidden id="details_role_div">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_role_id" name="role_id" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">姓名:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_role_name" name="role_name" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="./jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="./layui/layui.all.js"></script>
	<script type="text/javascript">
		var table = layui.table;
		/* 点击查询按钮后重载 */
		function role_check(){
			var checktext = $("#checktext").val();
			table.reload("rolelist",{
				url:"sys/getRole",
				where:{
					"checktext":checktext
				}
			});
		};
	</script>
	<script type="text/javascript">
		var table=layui.table;
		function role_insert(){
			layer.open({ 
				title : "添加信息",
				type : 1,
				content : $("#insert_role_div"),
				btn : ["保存","关闭"],
				btn1:function(){
					$.post("sys/addRole",{"role_id":$("#insert_role_id").val(),"role_name":$("#insert_role_name").val()
						},
							function(){
						//关闭窗口
						layer.closeAll();
						//列表刷新
						layer.msg("添加成功")
						table.reload("rolelist");
					});
				}
			});
		}
	</script>
	<script type="text/javascript">
		var table = layui.table;
		table.on('tool(roletable)',function(obj){
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.role_id;
			if(layEvent === 'update'){
				$("#update_role_id").val(checkdata.role_id);
				$("#update_role_name").val(checkdata.role_name);
				layer.open({
					title:"修改信息",
					type:1,
					content:$("#update_role_div"),
					btn:["保存","关闭"],
					btn1:function(){
						$.post("sys/updateRole",{"role_name":$("#update_role_name").val(),
							"role_id":checkid},
								function(){
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("rolelist");
						});
					}
				});
			}else if(layEvent === 'delete'){
				layer.confirm('确认要对'+checkdata.role_name+'进行删除操作吗?',{
					icon:3,
					title:'提示'
				},function(index){
					$.post("sys/deleteRole",{
						"role_id":checkid
					},function(){
						layer.msg("删除成功");
						table.reload("rolelist");
					});
					layer.close(index);
				});
			}else if(layEvent === 'details'){
				$("#details_role_id").val(checkdata.role_id);
				$("#details_role_name").val(checkdata.role_name);
				layer.open({
					title:"角色详情",
					type:1,
					content:$("#details_role_div"),
				});
			};
		})
	</script>
	
	<script type="text/javascript">
	var table = layui.table;
	function role_delete(){
		var checkdata = table.checkStatus("rolelist").data;
		if(checkdata.length > 0){
			layer.confirm('确认要对选中的账号进行删除操作吗?',{
				icon:3,
				title:'提示'
			},function(index){
				for(var i = 0;i<checkdata.length;i++){
					var checkid=checkdata[i].role_id;
					$.post("sys/deleteRole",{
						"role_id":checkid
					},function(){
					});
				}
				layer.msg("删除成功");
				table.reload("rolelist");
				layer.close(index);
			});
		}else{
			layer.msg("请先选中数据!!!");
		};
	}
	</script>
	<script type="text/javascript">
	var table = layui.table;
	function assign_perm(){
		var checkdata = table.checkStatus("rolelist").data;
		if(checkdata.length == 1){
			var url = "http://localhost:8080/index";
			javascript:window.location.href=url;
		}else{
			layer.msg("只能选中一个数据");
		};
	}
	</script>
	<script type="text/javascript">
		var table = layui.table;
		table.on('toolbar(roletable)',function(obj){
			var checkStatus = table.checkStatus(obj.config.id);
			switch(obj.event){
			case 'assign_perm':
				if(checkStatus.data.length==1){
					//获取参数
					location.href="role_perm/"+checkStatus.data[0].role_id;
				}else{
					layer.msg("请选中一个数据")
				}
				break;
			}
		});
	</script>
	
</body>
</html>