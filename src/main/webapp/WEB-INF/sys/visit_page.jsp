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
<title>回访记录页面</title>
<link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body>

	<div style="text-align: center;color:red;font-size:25px">回访记录页面</div>
	<script type="text/html" id="visitlist_toolbar">
		<div>
			<div class="layui-input-inline">
				<input class="layui-input" type="text" id="checktext" placeholder="请输入需要查询的数据"/>
			</div>
			<button class="layui-btn layui-btn-sm" onclick="visit_check()">查询</button>
			<button class="layui-btn layui-btn-sm" onclick="visit_insert()">添加</button>
			<button class="layui-btn layui-btn-sm layui-btn-warm" onclick="visit_delete()">删除</button>
		</div>
	</script>
	<script type="text/html" id="operate_toolbar">
		<div>
			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="details">详情</button>
  			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="update">编辑</button>
  			<button class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm" lay-event="delete">删除</button>
  			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="annotation">批注</button>
		</div>
	</script>
	<table class="layui-table"
		lay-data="{url:'sys/showVisit',toolbar:'#visitlist_toolbar',id:'visitlist',page:true}" lay-filter='visittable'>
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'visit_id',width:100}">回访记录ID</th>
				<th lay-data="{field:'visit_customer_id',width:90}">客户ID</th>
				<th lay-data="{field:'visit_user_id',width:90}">业务员ID</th>
				<th lay-data="{field:'visit_time'}">回访时间</th>
				<th lay-data="{field:'visit_info'}">回访内容</th>
				<th lay-data="{field:'visit_pattern',width:90}">回访方式</th>
				<th lay-data="{field:'visit_pay',templet:function(d){
				if(d.visit_pay==1){
				return '已付款';
				}else if(d.visit_pay==2){
				return '考虑中';
				}else{
				return '拒绝付款';
				}
				},width:90}">是否付款</th>
				<th lay-data="{field:'visit_money',width:90}">付款金额</th>
				<th lay-data="{templet:$('#operate_toolbar').html()}">操作</th>
			</tr>
		</thead>
	</table>

	<!-- 添加弹出层 -->
	<div hidden id="insert_visit_div">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">回访记录ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_visit_id" name="visit_id"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_visit_customer_id" name="visit_customer_id"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">业务员ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_visit_user_id" name="visit_user_id"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访时间:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_visit_time" name="visit_time"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访批注:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_visit_info" name="visit_info"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访方式:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_visit_pattern" name="visit_pattern"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">是否付款:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_visit_pay" name="visit_pay"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">付款金额:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_visit_money" name="visit_money"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改弹出层 -->
	<div hidden id="update_visit_div" class='layui-form'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">客户ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_visit_customer_id" name="visit_customer_id"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">业务员ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_visit_user_id" name="visit_user_id"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访时间:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_visit_time" name="visit_time"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访批注:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_visit_info" name="visit_info"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访方式:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_visit_pattern" name="visit_pattern"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">是否付款:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_visit_pay" name="visit_pay"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">付款金额:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_visit_money" name="visit_money"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 详情弹出层 -->
	<div hidden id="details_visit_div">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">回访记录ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_visit_id" name="cisit_id" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_visit_customer_id" name="visit_customer_id" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">业务员ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_visit_user_id" name="visit_user_id" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访时间:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_visit_time" name="visit_time" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访批注:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_visit_info" name="visit_info" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访方式:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_visit_pattern" name="visit_pattern" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">是否付款:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_visit_pay" name="visit_pay" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">付款金额:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_visit_money" name="visit_money" readonly="readonly"
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
		function visit_check(){
			var checktext = $("#checktext").val();
			table.reload("visitlist",{
				url:"sys/getVisit",
				where:{
					"checktext":checktext
				}
			});
		};
	</script>
	<script type="text/javascript">
		var table=layui.table;
		function visit_insert(){
			layer.open({ 
				title : "添加信息",
				type : 1,
				content : $("#insert_visit_div"),
				btn : ["保存","关闭"],
				btn1:function(){
					$.post("sys/addVisit",{"visit_id":$("#insert_visit_id").val(),"visit_customer_id":$("#insert_visit_customer_id").val(),
						"visit_user_id":$("#insert_visit_user_id").val(),"visit_time":$("#insert_visit_time").val(),
						"visit_info":$("#insert_visit_info").val(),"visit_pattern":$("#insert_visit_pattern").val(),
						"visit_pay":$("#insert_visit_pay").val(),"visit_money":$("#insert_visit_money").val(),
						},
							function(){
						//关闭窗口
						layer.closeAll();
						//列表刷新
						layer.msg("添加成功")
						table.reload("visitlist");
					});
				}
			});
		}
	</script>
	<script type="text/javascript">
		var table = layui.table;
		table.on('tool(visittable)',function(obj){
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.visit_id;
			if(layEvent === 'update'){
				$("#update_visit_customer_id").val(checkdata.visit_customer_id);
				$("#update_visit_user_id").val(checkdata.visit_user_id);
				$("#update_visit_time").val(checkdata.visit_time);
				$("#update_visit_info").val(checkdata.visit_info);
				$("#update_visit_pattern").val(checkdata.visit_pattern);
				$("#update_visit_pay").val(checkdata.visit_pay);
				$("#update_visit_money").val(checkdata.visit_money);
				layer.open({
					title:"修改信息",
					type:1,
					content:$("#update_visit_div"),
					btn:["保存","关闭"],
					btn1:function(){
						$.post("sys/updateVisit",{"visit_customer_id":$("#update_visit_customer_id").val(),
							"visit_user_id":$("#update_visit_user_id").val(),"visit_time":$("#update_visit_time").val(),
							"visit_info":$("#update_visit_info").val(),"visit_pattern":$("#update_visit_pattern").val(),
							"visit_pay":$("#update_visit_pay").val(),"visit_money":$("#update_visit_money").val(),
							"visit_id":checkid},
								function(){
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("visitlist");
						});
					}
				});
			}else if(layEvent === 'delete'){
				layer.confirm('确认要对'+checkdata.bmname+'进行删除操作吗?',{
					icon:3,
					title:'提示'
				},function(index){
					$.post("sys/deleteVisit",{
						"visit_id":checkid
					},function(){
						layer.msg("删除成功");
						table.reload("visitlist");
					});
					layer.close(index);
				});
			}else if(layEvent === 'details'){
				$("#details_visit_id").val(checkdata.visit_id);
				$("#details_visit_customer_id").val(checkdata.visit_customer_id);
				$("#details_visit_user_id").val(checkdata.visit_user_id);
				$("#details_visit_time").val(checkdata.visit_time);
				$("#details_visit_info").val(checkdata.visit_info);
				$("#details_visit_pattern").val(checkdata.visit_pattern);
				$("#details_visit_pay").val(checkdata.visit_pay);
				$("#details_visit_money").val(checkdata.visit_money);
				layer.open({
					title:"回访记录详情",
					type:1,
					content:$("#details_visit_div"),
				});
			};
		})
	</script>
	
	<script type="text/javascript">
	var table = layui.table;
	function visit_delete(){
		var checkdata = table.checkStatus("visitlist").data;
		if(checkdata.length > 0){
			layer.confirm('确认要对选中的账号进行删除操作吗?',{
				icon:3,
				title:'提示'
			},function(index){
				for(var i = 0;i<checkdata.length;i++){
					var checkid=checkdata[i].bmid;
					$.post("sys/deleteVisit",{
						"bmid":checkid
					},function(){
					});
				}
				layer.msg("删除成功");
				table.reload("visitlist");
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
		var checkdata = table.checkStatus("visitlist").data;
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
		table.on('toolbar(visittable)',function(obj){
			var checkStatus = table.checkStatus(obj.config.id);
			switch(obj.event){
			case 'assign_perm':
				if(checkStatus.data.length==1){
					//获取参数
					location.href="visit_perm/"+checkStatus.data[0].bmid;
				}else{
					layer.msg("请选中一个数据")
				}
				break;
			}
		});
	</script>
	
</body>
</html>