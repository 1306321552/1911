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
<title>客户管理页面</title>
<link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body>

	<div style="text-align: center;color:red;font-size:25px">客户管理页面</div>
	<script type="text/html" id="customerlist_toolbar">
		<div>
			<div class="layui-input-inline">
				<input class="layui-input" type="text" id="checktext" placeholder="请输入需要查询的数据"/>
			</div>
			<button class="layui-btn layui-btn-sm" onclick="customer_check()">查询</button>
			<button class="layui-btn layui-btn-sm" onclick="customer_insert()">添加</button>
			<button class="layui-btn layui-btn-sm layui-btn-warm" onclick="customer_delete()">删除</button>
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
		lay-data="{url:'sys/showCustomer',toolbar:'#customerlist_toolbar',id:'customerlist',page:true}" lay-filter='customertable'>
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'customer_id',width:30}">ID</th>
				<th lay-data="{field:'customer_name',width:90}">客户名称</th>
				<th lay-data="{field:'customer_man',width:100}">客户经理</th>
				<th lay-data="{field:'customer_tel',width:110}">客户电话</th>
				<th lay-data="{field:'customer_email'}">客户邮箱</th>
				<th lay-data="{field:'customer_addr'}">客户地址</th>
				<th lay-data="{field:'customer_grade',width:90}">客户星级</th>
				<th lay-data="{field:'create_time'}">创建时间</th>
				<th lay-data="{field:'customer_user',width:90}">业务员</th>
				<th lay-data="{templet:$('#operate_toolbar').html()}">操作</th>
			</tr>
		</thead>
	</table>

	<!-- 添加弹出层 -->
	<div hidden id="insert_customer_div">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">客户ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_customer_id" name="customer_id"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户名称:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_customer_name" name="customer_name"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户联系人:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_customer_man" name="customer_man"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户电话:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_customer_tel" name="customer_tel"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户邮箱:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_customer_email" name="customer_email"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户地址:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_customer_addr" name="customer_addr"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户星级:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_customer_grade" name="customer_grade"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">创建时间:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_create_time" name="create_time"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改弹出层 -->
	<div hidden id="update_customer_div" class='layui-form'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">客户名称:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_customer_name" name="customer_name"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户联系人:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_customer_man" name="customer_man"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户电话:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_customer_tel" name="customer_tel"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户邮箱:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_customer_email" name="customer_email"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户地址:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_customer_addr" name="customer_addr"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户星级:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_customer_grade" name="customer_grade"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">创建时间:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_create_time" name="create_time"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 详情弹出层 -->
	<div hidden id="details_customer_div">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_customer_id" name="customer_id readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户名称:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_customer_name" name="customer_name" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户联系人:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_customer_man" name="customer_man" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户电话:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_customer_tel" name="customer_tel" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户邮箱:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_customer_email" name="customer_email" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户地址:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_customer_addr" name="customer_addr" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户星级:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_customer_grade" name="customer_grade" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">创建时间:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_create_time" name="create_time" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">业务员:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_customer_user" name="customer_user" readonly="readonly"
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
		function customer_check(){
			var checktext = $("#checktext").val();
			table.reload("customerlist",{
				url:"sys/getCustomer",
				where:{
					"checktext":checktext
				}
			});
		};
	</script>
	<script type="text/javascript">
		var table=layui.table;
		function customer_insert(){
			layer.open({ 
				title : "添加信息",
				type : 1,
				content : $("#insert_customer_div"),
				btn : ["保存","关闭"],
				btn1:function(){
					$.post("sys/addCustomer",{"customer_id":$("#insert_customer_id").val(),"customer_name":$("#insert_customer_name").val(),
						"customer_man":$("#insert_customer_man").val(),"customer_tel":$("#insert_customer_tel").val(),
						"customer_email":$("#insert_customer_email").val(),"customer_addr":$("#insert_customer_addr").val(),
						"customer_grade":$("#insert_customer_grade").val(),"create_time":$("#insert_create_time").val(),
						},
							function(){
						//关闭窗口
						layer.closeAll();
						//列表刷新
						layer.msg("添加成功")
						table.reload("customerlist");
					});
				}
			});
		}
	</script>
	<script type="text/javascript">
		var table = layui.table;
		table.on('tool(customertable)',function(obj){
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.customer_id;
			if(layEvent === 'update'){
				$("#update_customer_name").val(checkdata.customer_name);
				$("#update_customer_man").val(checkdata.customer_man);
				$("#update_customer_tel").val(checkdata.customer_tel);
				$("#update_customer_email").val(checkdata.customer_email);
				$("#update_customer_addr").val(checkdata.customer_addr);
				$("#update_customer_grade").val(checkdata.customer_grade);
				$("#update_create_time").val(checkdata.create_time);
				layer.open({
					title:"修改信息",
					type:1,
					content:$("#update_customer_div"),
					btn:["保存","关闭"],
					btn1:function(){
						$.post("sys/updateCustomer",{"customer_name":$("#update_customer_name").val(),
							"customer_man":$("#update_customer_man").val(),"customer_tel":$("#update_customer_tel").val(),
							"customer_email":$("#update_customer_email").val(),"customer_addr":$("#update_customer_addr").val(),
							"customer_grade":$("#update_customer_grade").val(),"create_time":$("#update_create_time").val(),
							"customer_id":checkid},
								function(){
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("customerlist");
						});
					}
				});
			}else if(layEvent === 'delete'){
				layer.confirm('确认要对'+checkdata.customer_name+'进行删除操作吗?',{
					icon:3,
					title:'提示'
				},function(index){
					$.post("sys/deleteCustomer",{
						"customer_id":checkid
					},function(){
						layer.msg("删除成功");
						table.reload("customerlist");
					});
					layer.close(index);
				});
			}else if(layEvent === 'details'){
				$("#details_customer_id").val(checkdata.customer_id);
				$("#details_customer_name").val(checkdata.customer_name);
				$("#details_customer_man").val(checkdata.customer_man);
				$("#details_customer_tel").val(checkdata.customer_tel);
				$("#details_customer_email").val(checkdata.customer_email);
				$("#details_customer_addr").val(checkdata.customer_addr);
				$("#details_customer_grade").val(checkdata.customer_grade);
				$("#details_create_time").val(checkdata.create_time);
				$("#details_customer_user").val(checkdata.customer_user);
				layer.open({
					title:"客户详情",
					type:1,
					content:$("#details_customer_div"),
				});
			};
		})
	</script>
	
	<script type="text/javascript">
	var table = layui.table;
	function customer_delete(){
		var checkdata = table.checkStatus("customerlist").data;
		if(checkdata.length > 0){
			layer.confirm('确认要对选中的账号进行删除操作吗?',{
				icon:3,
				title:'提示'
			},function(index){
				for(var i = 0;i<checkdata.length;i++){
					var checkid=checkdata[i].customer_id;
					$.post("sys/deleteCustomer",{
						"customer_id":checkid
					},function(){
					});
				}
				layer.msg("删除成功");
				table.reload("customerlist");
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
		var checkdata = table.checkStatus("customerlist").data;
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
		table.on('toolbar(customertable)',function(obj){
			var checkStatus = table.checkStatus(obj.config.id);
			switch(obj.event){
			case 'assign_perm':
				if(checkStatus.data.length==1){
					//获取参数
					location.href="customer_perm/"+checkStatus.data[0].bmid;
				}else{
					layer.msg("请选中一个数据")
				}
				break;
			}
		});
	</script>
	
</body>
</html>