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
<title>跟单页面</title>
<link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body>

	<div style="text-align: center;color:red;font-size:25px" id="oo">跟单页面</div>
	<shiro:user>
		<div style="text-align: center;font-size:25px" hidden="hidden" id="customer_user"><shiro:principal/></div>
	</shiro:user>
	<script type="text/html" id="customerlist_toolbar">
		<div>
			<div class="layui-input-inline">
				<input class="layui-input" type="text" id="checktext" placeholder="请输入需要查询的数据"/>
			</div>
			<button class="layui-btn layui-btn-sm" onclick="customer_check()">查询</button>
			<button class="layui-btn layui-btn-sm" onclick="documentary_cancel()">取消跟单</button>
			<button class="layui-btn layui-btn-sm layui-btn-warm" onclick="customer_delete()">删除</button>
		</div>
	</script>
	<script type="text/html" id="operate_toolbar">
		<div>
			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="details">详情</button>
  			<button class="layui-btn layui-btn-xs layui-btn-radius" lay-event="documentary_cancel">取消跟单</button>
  			<button class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm" lay-event="insert_visit">回访</button>
		</div>
	</script>
	<table class="layui-table"
		lay-data="{url:'sys/showCustomer_documentary?customer_user=${username }',toolbar:'#customerlist_toolbar',id:'customerlist',page:true}" lay-filter='customertable'>
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'customer_id',width:30}">ID</th>
				<th lay-data="{field:'customer_name',width:90}">客户名称</th>
				<th lay-data="{field:'customer_man',width:90}">客户经理</th>
				<th lay-data="{field:'customer_tel',width:105}">客户电话</th>
				<th lay-data="{field:'customer_email'}">客户邮箱</th>
				<th lay-data="{field:'customer_addr'}">客户地址</th>
				<th lay-data="{field:'customer_grade',width:90}">客户星级</th>
				<th lay-data="{field:'create_time'}">创建时间</th>
				<th lay-data="{field:'customer_user',width:80}">业务员</th>
				<th lay-data="{templet:$('#operate_toolbar').html()}">操作</th>
			</tr>
		</thead>
	</table>

	
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
				<label class="layui-form-label">客户经理:</label>
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

	<!-- 新增回访弹出层 -->
	<div hidden id="insert_visit" class="layui-form">
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label">回访日期:</label>
		      <div class="layui-input-inline">
		        <input type="text" class="layui-input" id="insert_visit_time" placeholder="yyyy-MM-dd HH:mm:ss">
		      </div>
		    </div>
			<div class="layui-inline">
				<label class="layui-form-label">回访方式:</label>
				<div class="layui-input-inline">
					<select name="visit_pattern" id="visit_pattern">
						<option value="">请选择</option>
						<option value="wx">微信</option>
						<option value="tel">电话</option>
						<option value="QQ">QQ</option>
						<option value="SMS">短信</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">是否下单:</label>
				<div class="layui-input-inline">
					<select name="visit_pay" id="visit_pay" lay-filter="visit_pay">
						<option value="">请选择</option>
						<option value=1>已下单</option>
						<option value=2>考虑中</option>
						<option value=3>拒绝下单</option>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">下单金额:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_visit_money" name="visit_money"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">回访内容:</label>
				<div class="layui-input-block">
				  <textarea placeholder="请输入内容" class="layui-textarea" id="insert_visit_info"></textarea>
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
				url:"sys/getCustomer_documentary?customer_user=${username}",
				where:{
					"checktext":checktext,
				}
			});
		};
	</script>
	<script type="text/javascript">
		var table = layui.table;
		table.on('tool(customertable)',function(obj){
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.customer_id;
			if(layEvent === 'details'){
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
			}else if(layEvent === 'documentary_cancel'){
				layer.confirm('确认要对'+checkdata.customer_name+'进行取消跟单操作吗?',{
					icon:3,
					title:'提示'
				},function(index){
					$.post("sys/documentaryCustomer_cancel",{
						"customer_id":checkid,
					},function(){
						layer.msg("取消跟单成功");
						table.reload("customerlist");
					});
					layer.close(index);
				});
			}else if(layEvent === 'insert_visit'){
				layer.open({
					title:"新增回访",
					type:1,
					content:$("#insert_visit"),
					btn:["保存","关闭"],
					btn1:function(index){
						$.post("sys/addVisit",{"visit_customer_id":checkid,
							"visit_user_id":"${userid }",
							"visit_time":$("#insert_visit_time").val(),
							"visit_info":$("#insert_visit_info").val(),
							"visit_pattern":$("#visit_pattern option:selected").text(),
							"visit_pay":$("#visit_pay option:selected").val(),
							"visit_money":$("#insert_visit_money").val(),
						},function(){
							layer.msg("回访成功");
							table.reload("customerlist");
						});
						layer.close(index);
					},
				});
			};
		})
	</script>
	
	<script type="text/javascript">
	var table = layui.table;
	function documentary_cancel(){
		var checkdata = table.checkStatus("customerlist").data;
		if(checkdata.length > 0){
			layer.confirm('确认要对选中的账号进行取消跟单操作吗?',{
				icon:3,
				title:'提示'
			},function(index){
				for(var i = 0;i<checkdata.length;i++){
					var checkid=checkdata[i].customer_id;
					$.post("sys/documentaryCustomer_cancel",{
						"customer_id":checkid
					},function(){
					});
				}
				layer.msg("取消跟单成功");
				table.reload("customerlist");
				layer.close(index);
			});
		}else{
			layer.msg("请先选中数据!!!");
		};
	}
	</script>
	
	<!-- 下单方式 -->
	<script type="text/javascript">
		var form = layui.form;
		form.on('select(visit_pay)',function(data){
			console.log(data);
			if(data.value!=1){
				$("#insert_visit_money").attr("style","cursor:not-allowed");
				$("#insert_visit_money").attr("disable","");
				$("#insert_visit_money").attr("readonly","");
				$("#insert_visit_money").val("0");
			}else{
				$("#insert_visit_money").removeAttr("disable");
				$("#insert_visit_money").removeAttr("readonly");
				$("#insert_visit_money").removeAttr("style");
			}
		});
	</script>
	
	<!-- 时间选择器 -->
	<script type="text/javascript">
		layui.use('laydate',function(){
			var laydate=layui.laydate;
			laydate.render({
				elem:"#insert_visit_time",
				type:"datetime"
			});
		});
	</script>
	
</body>
</html>