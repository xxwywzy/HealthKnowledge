<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>健康知识-规则管理</title>

<link
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="images/heart.ico" rel="shortcut icon" />

<!--Icons-->
<script src="js/lumino.glyphs.js"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body style="margin:0 auto;width:1200px">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="background:#30a5ff;height:50px">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<img style="height:80px;padding-bottom:40px;padding-top:10px;"
					class="navbar-brand"
					src="http://120.27.141.50:8080/health-knowledge/upload/icon.png" />
				<a class="navbar-brand" href="#" style="font-size:23px"><span>血压助手·</span>知识管理平台</a>
				<ul class="user-menu">
					<li class="dropdown pull-right"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><svg
								class="glyph stroked male-user">
								<use xlink:href="#stroked-male-user"></use></svg> wzy&nbsp;&nbsp;<span
							class="caret"></span> </a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><svg class="glyph stroked male-user">
										<use xlink:href="#stroked-male-user"></use></svg>信息</a>
							</li>
							<li><a href="#"><svg class="glyph stroked gear">
										<use xlink:href="#stroked-gear"></use></svg>设置</a>
							</li>
							<li><a href="#"><svg class="glyph stroked cancel">
										<use xlink:href="#stroked-cancel"></use></svg>退出</a>
							</li>
						</ul></li>
				</ul>
			</div>

		</div>
		<!-- /.container-fluid -->
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<!-- <form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="在知识库中搜索">
			</div>
		</form> -->
		<ul class="nav menu">
			<li><a href="index.jsp"><svg class="glyph stroked pencil">
						<use xlink:href="#stroked-pencil"></use></svg> 新建知识</a>
			</li>
			<li><a href="kno-show.jsp"><svg
						class="glyph stroked calendar">
						<use xlink:href="#stroked-calendar"></use></svg> 知识管理</a>
			</li>
			<li><a href="rules-add.jsp"><svg class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg> 新建规则</a>
			</li>
			<li class="active"><a href="rules-show.jsp"><svg
						class="glyph stroked dashboard-dial">
						<use xlink:href="#stroked-dashboard-dial"></use></svg> 规则管理</a>
			</li>

		</ul>

	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<!-- <div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home">
							<use xlink:href="#stroked-home"></use></svg> </a></li>
				<li class="active">规则一览</li>
			</ol>
		</div> -->
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h3></h3>
			</div>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">规则列表</div>
					<div class="panel-body">
						<table data-toggle="table" data-show-columns="true"
							data-search="true" data-select-item-name="toolbar1"
							data-pagination="true" data-sort-name="name"
							data-sort-order="desc">
							<thead>
								<tr>
									<th>知识名称</th>
									<th>用户性别</th>
									<th>用户年龄</th>
									<th>体重情况</th>
									<th>疾病类型</th>
								</tr>
							</thead>
							<tbody>
								<%
									Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
									/* String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Kno";
									String user = "sa";
									String password = "sa";  */
									String url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB";
									String user = "sa";
									String password = "BiomedIT@ZJU2015";
									Connection conn = DriverManager.getConnection(url, user, password);
									Statement stmt = conn.createStatement();
									String sql = "select * from Recommend_kno";
									ResultSet rs = stmt.executeQuery(sql);
									while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString("KnoName")%></td>
									<td><%=rs.getString("UserTag1")%></td>
									<td><%=rs.getString("UserTag2")%></td>
									<td><%=rs.getString("UserTag3")%></td>
									<td><%=rs.getString("UserTag4")%><svg
											class="glyph stroked trash"
											style="float:right;height:23px;width:23px;cursor:pointer;color:#ff0000">
									<use xlink:href="#stroked-trash" /></svg></td>

								</tr>
								<%
									}

									rs.close();
									stmt.close();
								%>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
		<!--/.row-->
		<div class="modal fade" tabindex="-1" id="deleteModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="overflow:auto">
			<!-- aria-hidden似乎并无卵用 -->
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="background-color:#ff0000">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true" style="color:white">×</button>
						<h4 class="modal-title" id="myModalLabel">
							<font color="white">删除规则</font>
						</h4>
					</div>
					<form method="post" action=Delete_rule_Servlet>
						<div class="modal-body">
							<label>知识名称</label><br>
							<p id="name_tobedeleted">未输入内容</p>
							<br> <label>用户标签</label><br>
							<div style="width:350px;height:50px">
								<input type="button" class="btn btn-reset" value=""
									name="tag1_to_be_deleted" style="display:none"></input>&nbsp;&nbsp;
								<input type="button" class="btn btn-reset" value=""
									name="tag2_to_be_deleted" style="display:none"></input>&nbsp;&nbsp;
								<input type="button" class="btn btn-reset" value=""
									name="tag3_to_be_deleted" style="display:none"></input>&nbsp;&nbsp;
								<input type="button" class="btn btn-reset" value=""
									name="tag4_to_be_deleted" style="display:none"></input>&nbsp;&nbsp;
							</div>
							<br> <input type=hidden style="width:1px;height:1px"
								name="name_deleted"></input>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-danger" id="delete">
								删除</button>
						</div>
					</form>
				</div>
			</div>
		</div>



	</div>
	<!--/.main-->

	<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
	<script
		src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script>
		$(function() {
			var btn = $(".trash");//用class最后一个单词就行了？
			btn.click(function() {
				$('#deleteModal').modal('show');
				var par = $(this).parent();
				var pre1 = par.prev();
				var pre2 = pre1.prev();
				var pre3 = pre2.prev();
				var pre4 = pre3.prev();
				var name = pre4.text();
				var tag1 = pre3.text();
				var tag2 = pre2.text();
				var tag3 = pre1.text();
				var tag4 = par.text();
				$("#name_tobedeleted").text(name);
				if (!tag1 == "") {
					$("input[name='tag1_to_be_deleted']").show();
					$("input[name='tag1_to_be_deleted']").val(tag1);
				} else {
					$("input[name='tag1_to_be_deleted']").hide();
				}
				if (!tag2 == "") {
					$("input[name='tag2_to_be_deleted']").show();
					$("input[name='tag2_to_be_deleted']").val(tag2);
				} else {
					$("input[name='tag2_to_be_deleted']").hide();
				}
				if (!tag3 == "") {
					$("input[name='tag3_to_be_deleted']").show();
					$("input[name='tag3_to_be_deleted']").val(tag3);
				} else {
					$("input[name='tag3_to_be_deleted']").hide();
				}
				if (!tag4 == "") {
					$("input[name='tag4_to_be_deleted']").show();
					$("input[name='tag4_to_be_deleted']").val(tag4);
				} else {
					$("input[name='tag4_to_be_deleted']").hide();
				}
				$("input[name='name_deleted']").val(name);
			});
		});
	</script>
	<script>
		$('#calendar').datepicker({});

		!function($) {
			$(document)
					.on(
							"click",
							"ul.nav li.parent > a > span.icon",
							function() {
								$(this).find('em:first').toggleClass(
										"glyphicon-minus");
							});
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function() {
			if ($(window).width() > 768)
				$('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function() {
			if ($(window).width() <= 767)
				$('#sidebar-collapse').collapse('hide')
		})
	</script>
	<script>
		$(function() {
			$('#hover, #striped, #condensed').click(function() {
				var classes = 'table';

				if ($('#hover').prop('checked')) {
					classes += ' table-hover';
				}
				if ($('#condensed').prop('checked')) {
					classes += ' table-condensed';
				}
				$('#table-style').bootstrapTable('destroy').bootstrapTable({
					classes : classes,
					striped : $('#striped').prop('checked')
				});
			});
		});

		function rowStyle(row, index) {
			var classes = [ 'active', 'success', 'info', 'warning', 'danger' ];

			if (index % 2 === 0 && index / 2 < classes.length) {
				return {
					classes : classes[index / 2]
				};
			}
			return {};
		}
	</script>

</body>

</html>

