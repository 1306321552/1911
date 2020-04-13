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
<title>部门管理页面</title>
<link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body>

	<div style="text-align: center;color:red;font-size:25px">部门管理页面</div>
	<script type="text/html" id="bumenlist_toolbar">
		<div>
			<div class="layui-input-inline">
				<input class="layui-input" type="text" id="checktext" placeholder="请输入需要查询的数据"/>
			</div>
			<button class="layui-btn layui-btn-sm" onclick="bumen_check()">查询</button>
			<button class="layui-btn layui-btn-sm" onclick="bumen_insert()">添加</button>
			<button class="layui-btn layui-btn-sm layui-btn-warm" onclick="bumen_delete()">删除</button>
			<button class="layui-btn layui-btn-sm" lay-event="assign_perm">设置经理</button>
			<button class="layui-btn layui-btn-sm" lay-event="assign_perm">修改经理</button>
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
		lay-data="{url:'sys/showBumen',toolbar:'#bumenlist_toolbar',id:'bumenlist',page:true}" lay-filter='bumentable'>
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th lay-data="{field:'bmid'}">ID</th>
				<th lay-data="{field:'bmname'}">部门名称</th>
				<th lay-data="{field:'manager'}">部门经理</th>
				<th lay-data="{templet:$('#operate_toolbar').html()}">操作</th>
			</tr>
		</thead>
	</table>

	<!-- 添加弹出层 -->
	<div hidden id="insert_bumen_div">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">部门ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_bmid" name="bmid"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">部门名称:</label>
				<div class="layui-input-inline">
					<input type="text" id="insert_bmname" name="bmname"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改弹出层 -->
	<div hidden id="update_bumen_div" class='layui-form'>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">部门名字:</label>
				<div class="layui-input-inline">
					<input type="text" id="update_bmname" name="bmname"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 详情弹出层 -->
	<div hidden id="details_bumen_div">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">ID:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_bmid" name="bmid" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">部门名称:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_bmname" name="bmname" readonly="readonly"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">部门经理:</label>
				<div class="layui-input-inline">
					<input type="text" id="details_manager" name="manager" readonly="readonly"
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
		function bumen_check(){
			var checktext = $("#checktext").val();
			table.reload("bumenlist",{
				url:"sys/getBumen",
				where:{
					"checktext":checktext
				}
			});
		};
	</script>
	<script type="text/javascript">
		var table=layui.table;
		function bumen_insert(){
			layer.open({ 
				title : "添加信息",
				type : 1,
				content : $("#insert_bumen_div"),
				btn : ["保存","关闭"],
				btn1:function(){
					$.post("sys/addBumen",{"bmid":$("#insert_bmid").val(),"bmname":$("#insert_bmname").val()
						},
							function(){
						//关闭窗口
						layer.closeAll();
						//列表刷新
						layer.msg("添加成功")
						table.reload("bumenlist");
					});
				}
			});
		}
	</script>
	<script type="text/javascript">
		var table = layui.table;
		table.on('tool(bumentable)',function(obj){
			var checkdata = obj.data;
			var layEvent = obj.event;
			var checkid = checkdata.bmid;
			if(layEvent === 'update'){
				$("#update_bmname").val(checkdata.bmname);
				layer.open({
					title:"修改信息",
					type:1,
					content:$("#update_bumen_div"),
					btn:["保存","关闭"],
					btn1:function(){
						$.post("sys/updateBumen",{"bmname":$("#update_bmname").val(),
							"bmid":checkid},
								function(){
							layer.closeAll();
							layer.msg("修改成功");
							table.reload("bumenlist");
						});
					}
				});
			}else if(layEvent === 'delete'){
				layer.confirm('确认要对'+checkdata.bmname+'进行删除操作吗?',{
					icon:3,
					title:'提示'
				},function(index){
					$.post("sys/deleteBumen",{
						"bmid":checkid
					},function(){
						layer.msg("删除成功");
						table.reload("bumenlist");
					});
					layer.close(index);
				});
			}else if(layEvent === 'details'){
				$("#details_bmid").val(checkdata.bmid);
				$("#details_bmname").val(checkdata.bmname);
				layer.open({
					title:"部门详情",
					type:1,
					content:$("#details_bumen_div"),
				});
			};
		})
	</script>
	
	<script type="text/javascript">
	var table = layui.table;
	function bumen_delete(){
		var checkdata = table.checkStatus("bumenlist").data;
		if(checkdata.length > 0){
			layer.confirm('确认要对选中的账号进行删除操作吗?',{
				icon:3,
				title:'提示'
			},function(index){
				for(var i = 0;i<checkdata.length;i++){
					var checkid=checkdata[i].bmid;
					$.post("sys/deleteBumen",{
						"bmid":checkid
					},function(){
					});
				}
				layer.msg("删除成功");
				table.reload("bumenlist");
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
		var checkdata = table.checkStatus("bumenlist").data;
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
		table.on('toolbar(bumentable)',function(obj){
			var checkStatus = table.checkStatus(obj.config.id);
			switch(obj.event){
			case 'assign_perm':
				if(checkStatus.data.length==1){
					//获取参数
					location.href="bumen_perm/"+checkStatus.data[0].bmid;
				}else{
					layer.msg("请选中一个数据")
				}
				break;
			}
		});
	</script>
	
</body>
</html>