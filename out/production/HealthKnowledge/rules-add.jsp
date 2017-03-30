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
<title>健康知识库-新建规则</title>

<!-- <link
	href="http://apps.bdimg.com/li bs/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet"> -->
<!-- <link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet"> -->

<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="images/heart.ico" rel="shortcut icon" />
<link href="css/styles.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap-datetimepicker.min.css">


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
						<use xlink:href="#stroked-pencil"></use></svg> 新建知识</a></li>
			<li><a href="kno-show.jsp"><svg
						class="glyph stroked calendar">
						<use xlink:href="#stroked-calendar"></use></svg> 知识管理</a></li>
			<li class="active"><a href="rules-add.jsp"><svg
						class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg> 新建规则</a></li>
			<li><a href="rules-show.jsp"><svg
						class="glyph stroked dashboard-dial">
						<use xlink:href="#stroked-dashboard-dial"></use></svg> 规则管理</a></li>

		</ul>

	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<!-- <div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home">
							<use xlink:href="#stroked-home"></use></svg> </a>
				</li>
				<li class="active">新建规则</li>
			</ol>
		</div>
		/.row -->

		<div class="row">
			<div class="col-lg-12">
				<h3></h3>
			</div>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">新建规则</div>
					<div class="panel-body">
						<div class="col-md-6">
							<form method="post" action=Push_kno_Servlet>
								<div class="form-group">
									<label>选择知识<svg class="glyph stroked plus sign"
											style="width:50px;height:25px;cursor:pointer;color:#007FFF"
											data-toggle="modal" data-target="#KnoModal">
											<use xlink:href="#stroked-plus-sign" /></svg> </label>
								</div>
								<div class="form-group" style="display:none" id="kno_selected">
									<label>已选知识</label>
									<div class="form-control" style="width:300px;height:320px">
										<div class="panel panel-default">
											<div class="panel-headingnew">
												<p id="kno_selected_name" text align="left"
													style="cursor:pointer">
													<b></b>
												</p>
											</div>
											<div class="panel-body">
												<p id="kno_selected_time" text align="left"
													style="height:10px;font-size:10px;margin-bottom:10px"></p>
												<img id="kno_selected_pic"
													src="http://115.28.42.235:8080/health-knowledge/upload/0.jpg"
													width="100%" height="140px" />
												<p id="kno_selected_dis" style="margin-top:10px"></p>
												<button style="float:right" type="button"
													class="btn btn-danger" id="kno_selected_delete">删除</button>
											</div>
										</div>
									</div>

								</div>
								<div class="form-group">
									<label>选择用户标签<svg class="glyph stroked plus sign"
											style="width:50px;height:25px;cursor:pointer;color:#007FFF"
											data-toggle="modal" data-target="#tagModal">
											<use xlink:href="#stroked-plus-sign" /></svg> </label>

								</div>

								<div class="form-group" id="tag_selected" style="display:none">
									<label>已选标签</label>
									<div class="form-control" style="width:350px;height:50px">
										<input type="button" class="btn btn-reset" value=""
											name="tag1_to_be_send" style="display:none"></input>&nbsp;&nbsp;
										<input type="button" class="btn btn-reset" value=""
											name="tag2_to_be_send" style="display:none"></input>&nbsp;&nbsp;
										<input type="button" class="btn btn-reset" value=""
											name="tag3_to_be_send" style="display:none"></input>&nbsp;&nbsp;
										<input type="button" class="btn btn-reset" value=""
											name="tag4_to_be_send" style="display:none"></input>&nbsp;&nbsp;
									</div>
								</div>
								<div class="form-group">

									<label>选择推送时间</label>
									<div class="form-control" style="width:350px">
										<input type="radio" name="settime" style="cursor:pointer"
											value="now" onclick="time_selected_hide()" checked />&nbsp;即时推送&nbsp;&nbsp;
										<input type="radio" name="settime" style="cursor:pointer"
											value="time" onclick="time_selected_show()" />&nbsp;定时推送<br />
										<br /> <br />
									</div>
								</div>
								<div class="form-group" id="select_time" style="display:none">
									<div class="input-group date form_datetime"
										data-date="2016-05-22T05:25:07Z"
										data-date-format="dd MM yyyy - hh:ii"
										data-link-field="dtp_input1">
										<input class="form-control" size="16" type="text" value=""
											readonly> <span class="input-group-addon"><span
											class="glyphicon glyphicon-remove"></span> </span> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-th"></span> </span>
									</div>
								</div>
								<input type="hidden" style="width:1px;height:1px"
									name="name_saved"></input> <input type="hidden"
									style="width:1px;height:1px" name="tag1_saved"></input> <input
									type="hidden" style="width:1px;height:1px" name="tag2_saved"></input>
								<input type="hidden" style="width:1px;height:1px"
									name="tag3_saved"></input> <input type="hidden"
									style="width:1px;height:1px" name="tag4_saved"></input> <input
									type="submit" value="保存" class="btn btn-primary" id="push"></input>
								<button type="reset" class="btn btn-default"
									onclick="time_selected_hide()">取消</button>
							</form>
						</div>

						<div class="modal fade" id="KnoModal" tabindex="-1"
							style="overflow:auto">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header" style="background-color:#30a5ff">
										<button type="button" class="close" data-dismiss="modal"
											style="color:white">×</button>
										<h4 class="modal-title" id="myModalLabel">
											<font color="white">选择知识</font>
										</h4>
									</div>
									<form method="post" action=Save_kno_Servlet>

										<div class="modal-body">
											<div class="form-group">
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
													String sql = "select * from Health_Knowledge";
													ResultSet rs = stmt.executeQuery(sql);
													while (rs.next()) {
												%>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">

													<div class="panel panel-default">
														<div class="panel-headingnew">
															<p class="kno_name" text align="left"><%=rs.getString("KnoName")%></p>
														</div>
														<div class="panel-body">
															<p class="kno_time" text align="left"
																style="height:10px;font-size:10px;margin-bottom:10px"><%=rs.getString("KnoTime").substring(0, 16)%></p>
															<img class="kno_pic" src="<%=rs.getString("KnoLink")%>"
																width="100%" height="150px" />
															<p class="kno_dis" style="margin-top:10px"><%=rs.getString("KnoDiscription")%></p>
															<button style="float:right" type="button"
																class="btn btn-reset kno-select">选择</button>
														</div>

													</div>
												</div>
												<%
													}
													rs.close();
													stmt.close();
													conn.close();
												%>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">关闭</button>
											<button type="button" class="btn btn-primary"
												data-dismiss="modal">确定</button>
										</div>
									</form>
								</div>
							</div>
						</div>

						<div class="modal fade" id="tagModal" tabindex="-1"
							style="overflow:auto">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header" style="background-color:#30a5ff">
										<button type="button" class="close" data-dismiss="modal"
											style="color:white" onclick="tag_selected_hide()">×</button>
										<h4 class="modal-title" id="myModalLabel">
											<font color="white">标签选择</font>
										</h4>
									</div>
									<form>
										<div class="modal-body">
											<div class="form-group">
												<label>用户性别</label>
												<div class="form-control" style="width:350px;height:50px">
													<input type="button" class="btn btn-reset" value="男性"
														id="male_selected"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="女性"
														id="female_selected"></input>
												</div>
											</div>
											<div class="form-group">
												<label>用户年龄</label>
												<div class="form-control" style="width:350px;height:50px">
													<input type="button" class="btn btn-reset" value="青年"
														id="young_selected"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="中年"
														id="mid-life_selected"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="老年"
														id="old_selected"></input>
												</div>
											</div>
											<div class="form-group">
												<label>体重情况</label>
												<div class="form-control" style="width:350px;height:50px">
													<input type="button" class="btn btn-reset" value="正常"
														id="normal_selected"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="过轻"
														id="light_selected"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="肥胖"
														id="fat_selected"></input>
												</div>
											</div>
											<div class="form-group">
												<label>疾病类型</label>
												<div class="form-control" style="width:420px;height:50px">
													<input type="button" class="btn btn-reset" value="高血压"
														id="hypertension_selected"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="糖尿病"
														id="diabetes_selected"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="高血脂"
														id="hyperlipidemia_selected"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="脑卒中"
														id="stroke_selected"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="冠心病"
														id="chd_selected"></input>&nbsp;&nbsp;
												</div>
											</div>
											<br>
											<div
												class="form-group">
												<label id="tag_amount">已选标签：0/4</label>
												<div class="form-control" style="width:500;height:50px">
													<input type="button" class="btn btn-reset" value="性别：男性"
														id="tag1" style="display:none"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="年龄：中年"
														id="tag2" style="display:none"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="体重：肥胖"
														id="tag3" style="display:none"></input>&nbsp;&nbsp; <input
														type="button" class="btn btn-reset" value="疾病：高血压" id="tag4"
														style="display:none"></input>&nbsp;&nbsp;
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal" onclick="tag_selected_hide()">关闭</button>
											<button type="button" class="btn btn-primary"
												data-dismiss="modal" id="tag_select_complete">确定</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col-->
		</div>
		<!-- /.row -->




	</div>
	<!--/.main-->

	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="js/bootstrap-datetimepicker.js"></script>
	<script src="js/tag.js"></script>
	<script src="js/locales/bootstrap-datetimepicker.fr.js"></script>
	<script type="text/javascript">
		$(".form_datetime").datetimepicker({
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 0
		});
	</script>
	<script>
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
</body>

</html>
