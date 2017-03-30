<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
<title>健康知识库-知识管理</title>

<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<link
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 不更新模态框无法使用 -->
    <link rel="stylesheet" type="text/css" href="../dist/css/wangEditor.min.css">
    <link href="css/datepicker3.css" rel="stylesheet">
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
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background:#30a5ff;height:50px">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<img style="height:80px;padding-bottom:40px;padding-top:10px;" class="navbar-brand" src="http://120.27.141.50:8080/health-knowledge/upload/icon.png" />
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
			<li class="active"><a href="kno-show.jsp"><svg
						class="glyph stroked calendar">
						<use xlink:href="#stroked-calendar"></use></svg> 知识管理</a>
			</li>
			<li><a href="rules-add.jsp"><svg class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg> 新建规则</a>
			</li>
			<li><a href="rules-show.jsp"><svg
						class="glyph stroked dashboard-dial">
						<use xlink:href="#stroked-dashboard-dial"></use></svg> 规则管理</a>
			</li>
			
		</ul>

	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"><!-- offset表示左侧边距（此处可不加） -->
		<!-- <div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><svg class="glyph stroked home">
							<use xlink:href="#stroked-home"></use></svg> </a>
				</li>
				<li class="active">知识一览</li>
			</ol>
		</div> -->
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h3></h3>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body tabs">

						<ul class="nav nav-pills">
							<li class="active"><a href="#pilltab1" data-toggle="tab">高血压</a>
							</li>
							<li><a href="#pilltab2" data-toggle="tab">糖尿病</a>
							</li>
							<li><a href="#pilltab3" data-toggle="tab">高血脂</a>
							</li>
							<li><a href="#pilltab4" data-toggle="tab">冠心病</a>
							</li>
							<li><a href="#pilltab5" data-toggle="tab">脑卒中</a>
							</li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane fade in active" id="pilltab1">
								<div class="panel panel-default">
									<div class="panel-body tabs">
										<ul class="nav nav-tabs">
										       <%
													Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
													/* String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Kno";
													String user = "sa";
													String password = "sa";  */
													String url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB";
													String user = "sa";
													String password = "BiomedIT@ZJU2015";
													int total_size=0;
													int tag_size_for_hypertension=0;
													int size_for_hypertension=0;
													int tag_size_for_diabete=0;
													int size_for_diabete=0;
													int tag_size_for_hyperlipidemia=0;
													int size_for_hyperlipidemia=0;
													int tag_size_for_chd=0;
													int size_for_chd=0;
													int tag_size_for_stroke=0;
													int size_for_stroke=0;
													Connection conn = DriverManager.getConnection(url, user, password);
													Statement stmt_tag_forhypertension = conn.createStatement();
													String sql_tag_forhypertension = "select TagName from Knowledge_Tag where TagType = '高血压'";
													ResultSet rs_tag_forhypertension = stmt_tag_forhypertension.executeQuery(sql_tag_forhypertension);
													while (rs_tag_forhypertension.next()){
													 tag_size_for_hypertension = rs_tag_forhypertension.getRow();
													 //System.out.println(rs_tag_forhypertension);
												%>
											       <li><a href="#tab<%=tag_size_for_hypertension%>" data-toggle="tab"><%=rs_tag_forhypertension.getString("TagName")%></a></li>
											<%
													}
													
													rs_tag_forhypertension.close();
													stmt_tag_forhypertension.close();
												%>
										</ul>
										<div class="tab-content">
										     <%
													Statement stmt_tag_forhypertension_new = conn.createStatement();
													String sql_tag_forhypertension_new = "select TagName from Knowledge_Tag where TagType = '高血压'";
													ResultSet rs_tag_forhypertension_new = stmt_tag_forhypertension_new.executeQuery(sql_tag_forhypertension_new);
													while (rs_tag_forhypertension_new.next()){
													 size_for_hypertension = rs_tag_forhypertension_new.getRow();
												%>
 											 <div class="tab-pane fade" id="tab<%=size_for_hypertension%>">
 											     <%
												    Statement stmt_hypertension_kno = conn.createStatement();
												    String kno_name = rs_tag_forhypertension_new.getString("TagName");
													String sql_hypertension_kno = "select KnoName from Tag_AND_Knowledge where TagName = '"+kno_name+"' and TagType = '高血压'";
													ResultSet rs_hypertension_kno = stmt_hypertension_kno.executeQuery(sql_hypertension_kno);
													
													while (rs_hypertension_kno.next()) {
													    Statement stmt_hypertension_kno_concrete = conn.createStatement();
													    String sql_hypertension_kno_concrete = "select * from Health_Knowledge where KnoName = '"+rs_hypertension_kno.getString("KnoName")+"'";
													    ResultSet rs_hypertension_kno_concrete = stmt_hypertension_kno_concrete.executeQuery(sql_hypertension_kno_concrete);
													    //System.out.println(sql_hypertension_kno_concrete);
											            rs_hypertension_kno_concrete.next();
												%>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
													<div class="panel panel-default">
														<div class="panel-headingnew">
														 <%
														      String name1 = rs_hypertension_kno_concrete.getString("KnoName");
														      String link1 = "http://120.27.141.50:8080/health-knowledge/kno-content.jsp?kno_name=";
														      String kno_content_link1 = link1+name1;%>
															<p class="kno_name" text align="left" style="cursor:pointer"><%=name1%></p>											   
														      <p class="kno_content_link" style="display:none"><%=kno_content_link1%></p>
														</div>
														<div class="panel-body">
														    <p class="kno_time" text align="left" style="height:10px;font-size:10px;margin-bottom:10px"><%=rs_hypertension_kno_concrete.getString("KnoTime").substring(0,16)%></p>
															<img class="kno_pic" src="<%=rs_hypertension_kno_concrete.getString("KnoLink")%>" width="100%" height="150px"/>
															<p class="kno_dis" style="margin-top:10px"><%=rs_hypertension_kno_concrete.getString("KnoDiscription")%></p>
                                                            <div class="content" style="display:none"><%=rs_hypertension_kno_concrete.getString("KnoElaboration")%></div>
                                                            <hr/>
														<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" title="编辑">
														<svg class="glyph stroked pencil"
																style="height:23px;cursor:pointer;color:#006400">
																<use xlink:href="#stroked-pencil"/>
                                                         </div>
                                                          <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" title="删除">
														<svg class="glyph stroked trash"
																style="height:23px;cursor:pointer;color:#ff0000">
																<use xlink:href="#stroked-trash" />
                                                         </div>
														</div>
															 	
													</div>
												</div>
												<% 
												    rs_hypertension_kno_concrete.close();
												    stmt_hypertension_kno_concrete.close();
													}
													rs_hypertension_kno.close();
													stmt_hypertension_kno.close();
													/* conn.close(); */
												%>
											</div>
											<%
													}
													total_size=size_for_hypertension;
													rs_tag_forhypertension_new.close();
													stmt_tag_forhypertension_new.close();
													//conn.close();
												%>	

										</div>
									</div>
								</div>
								<!--/.panel-->
							</div>
							<div class="tab-pane fade" id="pilltab2">
								<div class="panel panel-default">
									<div class="panel-body tabs">
										<ul class="nav nav-tabs">
										       <%
													Statement stmt_tag_fordiabete = conn.createStatement();
													String sql_tag_fordiabete = "select TagName from Knowledge_Tag where TagType = '糖尿病'";
													ResultSet rs_tag_fordiabete = stmt_tag_fordiabete.executeQuery(sql_tag_fordiabete);
													while (rs_tag_fordiabete.next()){
													 tag_size_for_diabete = rs_tag_fordiabete.getRow()+total_size;//tab不能重复。。。。
												%>
											       <li><a href="#tab<%=tag_size_for_diabete%>" data-toggle="tab"><%=rs_tag_fordiabete.getString("TagName")%></a></li>
											<%
													}
													rs_tag_fordiabete.close();
													stmt_tag_fordiabete.close();
												%>
										</ul>
										<div class="tab-content">
										     <%
													Statement stmt_tag_fordiabete_new = conn.createStatement();
													String sql_tag_fordiabete_new = "select TagName from Knowledge_Tag where TagType = '糖尿病'";
													ResultSet rs_tag_fordiabete_new = stmt_tag_fordiabete_new.executeQuery(sql_tag_fordiabete_new);
													while (rs_tag_fordiabete_new.next()){
													 size_for_diabete = rs_tag_fordiabete_new.getRow()+total_size;
												%>
 											 <div class="tab-pane fade" id="tab<%=size_for_diabete%>">
 											     <%
												    Statement stmt_diabete_kno = conn.createStatement();
												    String kno_name = rs_tag_fordiabete_new.getString("TagName");
													String sql_diabete_kno = "select KnoName from Tag_AND_Knowledge where TagName = '"+kno_name+"' and TagType = '糖尿病'";
													ResultSet rs_diabete_kno = stmt_diabete_kno.executeQuery(sql_diabete_kno);
													
													while (rs_diabete_kno.next()) {
													    Statement stmt_diabete_kno_concrete = conn.createStatement();
													    String sql_diabete_kno_concrete = "select * from Health_Knowledge where KnoName = '"+rs_diabete_kno.getString("KnoName")+"'";
													    ResultSet rs_diabete_kno_concrete = stmt_diabete_kno_concrete.executeQuery(sql_diabete_kno_concrete);
													    //System.out.println(sql_diabete_kno_concrete);
											            rs_diabete_kno_concrete.next();
											            System.out.println(rs_diabete_kno_concrete.getString("KnoDiscription"));
												%>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
													<div class="panel panel-default">
														<div class="panel-headingnew">
														 <%
														      String name2 = rs_diabete_kno_concrete.getString("KnoName");
														      String link2 = "http://120.27.141.50:8080/health-knowledge/kno-content.jsp?kno_name=";
														      String kno_content_link2 = link2+name2;%>
															<p class="kno_name" text align="left" style="cursor:pointer"><%=name2%></p>											   
														      <p class="kno_content_link" style="display:none"><%=kno_content_link2%></p>
														</div>
														<div class="panel-body">
														    <p class="kno_time" text align="left" style="height:10px;font-size:10px;margin-bottom:10px"><%=rs_diabete_kno_concrete.getString("KnoTime").substring(0,16)%></p>
															<img class="kno_pic" src="<%=rs_diabete_kno_concrete.getString("KnoLink")%>" width="100%" height="150px"/>
															<p class="kno_dis" style="margin-top:10px"><%=rs_diabete_kno_concrete.getString("KnoDiscription")%></p>
                                                            <div class="content" style="display:none"><%=rs_diabete_kno_concrete.getString("KnoElaboration")%></div>
                                                            <hr/>
														<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" title="编辑">
														<svg class="glyph stroked pencil"
																style="height:23px;cursor:pointer;color:#006400">
																<use xlink:href="#stroked-pencil"/></svg>
                                                         </div>
                                                          <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" title="删除">
														<svg class="glyph stroked trash"
																style="height:23px;cursor:pointer;color:#ff0000">
																<use xlink:href="#stroked-trash" /></svg>
                                                         </div>
														</div>
															 	
													</div>
												</div>
												<% 
												    rs_diabete_kno_concrete.close();
												    stmt_diabete_kno_concrete.close();
													}
													rs_diabete_kno.close();
													stmt_diabete_kno.close();
													/* conn.close(); */
												%>
											</div>
											<%
													}
													total_size=size_for_diabete;
													rs_tag_fordiabete_new.close();
													stmt_tag_fordiabete_new.close();
													//conn.close();
												%>	

										</div>
									</div>
								</div>
								<!--/.panel-->
							</div>
							<div class="tab-pane fade" id="pilltab3">
								<div class="panel panel-default">
									<div class="panel-body tabs">
										<ul class="nav nav-tabs">
										       <%
													Statement stmt_tag_forhyperlipemia = conn.createStatement();
													String sql_tag_forhyperlipemia = "select TagName from Knowledge_Tag where TagType = '高血脂'";
													ResultSet rs_tag_forhyperlipemia = stmt_tag_forhyperlipemia.executeQuery(sql_tag_forhyperlipemia);
													while (rs_tag_forhyperlipemia.next()){
													 tag_size_for_hyperlipidemia = rs_tag_forhyperlipemia.getRow()+total_size;//tab不能重复。。。。
												%>
											       <li><a href="#tab<%=tag_size_for_hyperlipidemia%>" data-toggle="tab"><%=rs_tag_forhyperlipemia.getString("TagName")%></a></li>
											<%
													}
													rs_tag_forhyperlipemia.close();
													stmt_tag_forhyperlipemia.close();
												%>
										</ul>
										<div class="tab-content">
										     <%
													Statement stmt_tag_forhyperlipemia_new = conn.createStatement();
													String sql_tag_forhyperlipemia_new = "select TagName from Knowledge_Tag where TagType = '高血脂'";
													ResultSet rs_tag_forhyperlipemia_new = stmt_tag_forhyperlipemia_new.executeQuery(sql_tag_forhyperlipemia_new);
													while (rs_tag_forhyperlipemia_new.next()){
													 size_for_hyperlipidemia = rs_tag_forhyperlipemia_new.getRow()+total_size;
												%>
 											 <div class="tab-pane fade" id="tab<%=size_for_hyperlipidemia%>">
 											     <%
												    Statement stmt_hyperlipemia_kno = conn.createStatement();
												    String kno_name = rs_tag_forhyperlipemia_new.getString("TagName");
													String sql_hyperlipemia_kno = "select KnoName from Tag_AND_Knowledge where TagName = '"+kno_name+"' and TagType = '高血脂'";
													ResultSet rs_hyperlipemia_kno = stmt_hyperlipemia_kno.executeQuery(sql_hyperlipemia_kno);
													
													while (rs_hyperlipemia_kno.next()) {
													    Statement stmt_hyperlipemia_kno_concrete = conn.createStatement();
													    String sql_hyperlipemia_kno_concrete = "select * from Health_Knowledge where KnoName = '"+rs_hyperlipemia_kno.getString("KnoName")+"'";
													    ResultSet rs_hyperlipemia_kno_concrete = stmt_hyperlipemia_kno_concrete.executeQuery(sql_hyperlipemia_kno_concrete);
													    //System.out.println(sql_hyperlipemia_kno_concrete);
											            rs_hyperlipemia_kno_concrete.next();
												%>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
													<div class="panel panel-default">
														<div class="panel-headingnew">
														 <%
														      String name3 = rs_hyperlipemia_kno_concrete.getString("KnoName");
														      String link3 = "http://120.27.141.50:8080/health-knowledge/kno-content.jsp?kno_name=";
														      String kno_content_link3 = link3+name3;%>
															<p class="kno_name" text align="left" style="cursor:pointer"><%=name3%></p>											   
														      <p class="kno_content_link" style="display:none"><%=kno_content_link3%></p>
														</div>
														<div class="panel-body">
														    <p class="kno_time" text align="left" style="height:10px;font-size:10px;margin-bottom:10px"><%=rs_hyperlipemia_kno_concrete.getString("KnoTime").substring(0,16)%></p>
															<img class="kno_pic" src="<%=rs_hyperlipemia_kno_concrete.getString("KnoLink")%>" width="100%" height="150px"/>
															<p class="kno_dis" style="margin-top:10px"><%=rs_hyperlipemia_kno_concrete.getString("KnoDiscription")%></p>
                                                            <div class="content" style="display:none"><%=rs_hyperlipemia_kno_concrete.getString("KnoElaboration")%></div>
                                                            <hr/>
														<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" title="编辑">
														<svg class="glyph stroked pencil"
																style="height:23px;cursor:pointer;color:#006400">
																<use xlink:href="#stroked-pencil"/>
                                                         </div>
                                                          <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" title="删除">
														<svg class="glyph stroked trash"
																style="height:23px;cursor:pointer;color:#ff0000">
																<use xlink:href="#stroked-trash" />
                                                         </div>
														</div>
															 	
													</div>
												</div>
												<% 
												    rs_hyperlipemia_kno_concrete.close();
												    stmt_hyperlipemia_kno_concrete.close();
													}
													rs_hyperlipemia_kno.close();
													stmt_hyperlipemia_kno.close();
													/* conn.close(); */
												%>
											</div>
											<%
													}
													total_size = size_for_hyperlipidemia;
													rs_tag_forhyperlipemia_new.close();
													stmt_tag_forhyperlipemia_new.close();
													//conn.close();
												%>	

										</div>
									</div>
								</div>
								<!--/.panel-->
							</div>
							
							<div class="tab-pane fade" id="pilltab4">
								<div class="panel panel-default">
									<div class="panel-body tabs">
										<ul class="nav nav-tabs">
										       <%
													Statement stmt_tag_forchd = conn.createStatement();
													String sql_tag_forchd = "select TagName from Knowledge_Tag where TagType = '冠心病'";
													ResultSet rs_tag_forchd = stmt_tag_forchd.executeQuery(sql_tag_forchd);
													while (rs_tag_forchd.next()){
													 tag_size_for_chd = rs_tag_forchd.getRow()+total_size;//tab不能重复。。。。
												%>
											       <li><a href="#tab<%=tag_size_for_chd%>" data-toggle="tab"><%=rs_tag_forchd.getString("TagName")%></a></li>
											<%
													}
													rs_tag_forchd.close();
													stmt_tag_forchd.close();
												%>
										</ul>
										<div class="tab-content">
										     <%
													Statement stmt_tag_forchd_new = conn.createStatement();
													String sql_tag_forchd_new = "select TagName from Knowledge_Tag where TagType = '冠心病'";
													ResultSet rs_tag_forchd_new = stmt_tag_forchd_new.executeQuery(sql_tag_forchd_new);
													while (rs_tag_forchd_new.next()){
													 size_for_chd = rs_tag_forchd_new.getRow()+total_size;
												%>
 											 <div class="tab-pane fade" id="tab<%=size_for_chd%>">
 											     <%
												    Statement stmt_chd_kno = conn.createStatement();
												    String kno_name = rs_tag_forchd_new.getString("TagName");
													String sql_chd_kno = "select KnoName from Tag_AND_Knowledge where TagName = '"+kno_name+"' and TagType = '冠心病'";
													ResultSet rs_chd_kno = stmt_chd_kno.executeQuery(sql_chd_kno);
													
													while (rs_chd_kno.next()) {
													    Statement stmt_chd_kno_concrete = conn.createStatement();
													    String sql_chd_kno_concrete = "select * from Health_Knowledge where KnoName = '"+rs_chd_kno.getString("KnoName")+"'";
													    ResultSet rs_chd_kno_concrete = stmt_chd_kno_concrete.executeQuery(sql_chd_kno_concrete);
													    //System.out.println(sql_chd_kno_concrete);
											            rs_chd_kno_concrete.next();
												%>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
													<div class="panel panel-default">
														<div class="panel-headingnew">
														 <%
														      String name4 = rs_chd_kno_concrete.getString("KnoName");
														      String link4 = "http://120.27.141.50:8080/health-knowledge/kno-content.jsp?kno_name=";
														      String kno_content_link4 = link4+name4;%>
															<p class="kno_name" text align="left" style="cursor:pointer"><%=name4%></p>											   
														      <p class="kno_content_link" style="display:none"><%=kno_content_link4%></p>
														</div>
														<div class="panel-body">
														    <p class="kno_time" text align="left" style="height:10px;font-size:10px;margin-bottom:10px"><%=rs_chd_kno_concrete.getString("KnoTime").substring(0,16)%></p>
															<img class="kno_pic" src="<%=rs_chd_kno_concrete.getString("KnoLink")%>" width="100%" height="150px"/>
															<p class="kno_dis" style="margin-top:10px"><%=rs_chd_kno_concrete.getString("KnoDiscription")%></p>
                                                            <div class="content" style="display:none"><%=rs_chd_kno_concrete.getString("KnoElaboration")%></div>
                                                            <hr/>
														<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" title="编辑">
														<svg class="glyph stroked pencil"
																style="height:23px;cursor:pointer;color:#006400">
																<use xlink:href="#stroked-pencil"/>
                                                         </div>
                                                          <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" title="删除">
														<svg class="glyph stroked trash"
																style="height:23px;cursor:pointer;color:#ff0000">
																<use xlink:href="#stroked-trash" />
                                                         </div>
														</div>
															 	
													</div>
												</div>
												<% 
												    rs_chd_kno_concrete.close();
												    stmt_chd_kno_concrete.close();
													}
													rs_chd_kno.close();
													stmt_chd_kno.close();
													/* conn.close(); */
												%>
											</div>
											<%
													}
													total_size = size_for_chd;
													rs_tag_forchd_new.close();
													stmt_tag_forchd_new.close();
													//conn.close();
												%>	

										</div>
									</div>
								</div>
								<!--/.panel-->
							</div>
							
							<div class="tab-pane fade" id="pilltab5">
								<div class="panel panel-default">
									<div class="panel-body tabs">
										<ul class="nav nav-tabs">
										       <%
													Statement stmt_tag_forstroke = conn.createStatement();
													String sql_tag_forstroke = "select TagName from Knowledge_Tag where TagType = '脑卒中'";
													ResultSet rs_tag_forstroke = stmt_tag_forstroke.executeQuery(sql_tag_forstroke);
													while (rs_tag_forstroke.next()){
													 tag_size_for_stroke = rs_tag_forstroke.getRow()+total_size;//tab不能重复。。。。
												%>
											       <li><a href="#tab<%=tag_size_for_stroke%>" data-toggle="tab"><%=rs_tag_forstroke.getString("TagName")%></a></li>
											<%
													}
													rs_tag_forstroke.close();
													stmt_tag_forstroke.close();
												%>
										</ul>
										<div class="tab-content">
										     <%
													Statement stmt_tag_forstroke_new = conn.createStatement();
													String sql_tag_forstroke_new = "select TagName from Knowledge_Tag where TagType = '脑卒中'";
													ResultSet rs_tag_forstroke_new = stmt_tag_forstroke_new.executeQuery(sql_tag_forstroke_new);
													while (rs_tag_forstroke_new.next()){
													 size_for_stroke = rs_tag_forstroke_new.getRow()+total_size;
												%>
 											 <div class="tab-pane fade" id="tab<%=size_for_stroke%>">
 											     <%
												    Statement stmt_stroke_kno = conn.createStatement();
												    String kno_name = rs_tag_forstroke_new.getString("TagName");
													String sql_stroke_kno = "select KnoName from Tag_AND_Knowledge where TagName = '"+kno_name+"' and TagType = '脑卒中'";
													ResultSet rs_stroke_kno = stmt_stroke_kno.executeQuery(sql_stroke_kno);
													
													while (rs_stroke_kno.next()) {
													    Statement stmt_stroke_kno_concrete = conn.createStatement();
													    String sql_stroke_kno_concrete = "select * from Health_Knowledge where KnoName = '"+rs_stroke_kno.getString("KnoName")+"'";
													    ResultSet rs_stroke_kno_concrete = stmt_stroke_kno_concrete.executeQuery(sql_stroke_kno_concrete);
													    System.out.println(sql_stroke_kno_concrete);
											            rs_stroke_kno_concrete.next();
												%>
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
													<div class="panel panel-default">
														<div class="panel-headingnew">
														 <%
														      String name5 = rs_stroke_kno_concrete.getString("KnoName");
														      String link5 = "http://120.27.141.50:8080/health-knowledge/kno-content.jsp?kno_name=";
														      String kno_content_link5 = link5+name5;%>
															<p class="kno_name" text align="left" style="cursor:pointer"><%=name5%></p>											   
														      <p class="kno_content_link" style="display:none"><%=kno_content_link5%></p>
														</div>
														<div class="panel-body">
														    <p class="kno_time" text align="left" style="height:10px;font-size:10px;margin-bottom:10px"><%=rs_stroke_kno_concrete.getString("KnoTime").substring(0,16)%></p>
															<img class="kno_pic" src="<%=rs_stroke_kno_concrete.getString("KnoLink")%>" width="100%" height="150px"/>
															<p class="kno_dis" style="margin-top:10px"><%=rs_stroke_kno_concrete.getString("KnoDiscription")%></p>
                                                            <div class="content" style="display:none"><%=rs_stroke_kno_concrete.getString("KnoElaboration")%></div>
                                                            <hr/>
														<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" title="编辑">
														<svg class="glyph stroked pencil"
																style="height:23px;cursor:pointer;color:#006400">
																<use xlink:href="#stroked-pencil"/>
                                                         </div>
                                                          <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" title="删除">
														<svg class="glyph stroked trash"
																style="height:23px;cursor:pointer;color:#ff0000">
																<use xlink:href="#stroked-trash" />
                                                         </div>
														</div>
															 	
													</div>
												</div>
												<% 
												    rs_stroke_kno_concrete.close();
												    stmt_stroke_kno_concrete.close();
													}
													rs_stroke_kno.close();
													stmt_stroke_kno.close();
													/* conn.close(); */
												%>
											</div>
											<%
													}
													rs_tag_forstroke_new.close();
													stmt_tag_forstroke_new.close();
													//conn.close();
												%>	

										</div>
									</div>
								</div>
								<!--/.panel-->
							</div>
							
										<div class="modal fade" tabindex="-1" id="myModal"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true"  style="overflow:auto">
												<!-- aria-hidden似乎并无卵用 -->
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header" style="background-color:#ff0000">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true" style="color:white">×</button>
															<h4 class="modal-title"><font color="white">删除知识</font></h4>
														</div>
														<form method="post" action=Delete_kno_Servlet>
															<div class="modal-body">
																<label>知识名称</label><br>
																<p id="name_tobedeleted">未输入内容</p>
																<br> <label>知识描述</label><br>
																<p id="dis_tobedeleted">未输入内容</p>
																<br> <label>录入时间</label><br>
																<p id="time_tobedeleted">未输入内容</p>
																<br> <input type=hidden
																	style="width:1px;height:1px" name="name_deleted"></input>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">关闭</button>
																<button type="submit" class="btn btn-danger" id="delete">
																	删除</input>
															</div>
														</form>
													</div>
												</div>
											</div>

											<div class="modal fade" tabindex="-1" id="myModal1"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true" style="overflow:auto">
												<!-- aria-hidden似乎并无卵用 -->
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header" style="background-color:#91d52b">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true" style="color:white">×</button>
															<h4 class="modal-title"><font color="white">修改知识</font></h4>
														</div>
														<form method="post" action=Update_kno_Servlet>
															<div class="modal-body">
															  <div class="form-group">
																<label>知识名称</label>
																<input class="form-control" style="width:350px"
																	name="name_updated" ></input> 
															  </div>
															  <div class="form-group">
																<label>知识简单描述</label>
																<textarea class="form-control" style="width:350px;height:60px" name="dis_updated"></textarea>
															  </div>
															  <div class="form-group">	
																<label>知识内容</label>
																<textarea id="content_input" class="form-control" style="width:350px;height:300px" name="con_updated"></textarea>
															  </div>
															  <div class="form-group">
																<label>图片链接</label>
																<textarea class="form-control" style="width:350px;height:50px" name="link_updated"></textarea>
															  </div>
															  <input type=hidden
																	style="width:1px;height:1px" name="name_before"></input>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">关闭</button>
																<button type="submit" class="btn btn-success"
																	id="update">
																	提交修改</button>
															</div>
														</form>
													</div>
												</div>
											</div>

											<div class="modal fade" tabindex="-1" id="myModal2"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true"  style="overflow:auto">
												<!-- aria-hidden似乎并无卵用 -->
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header" style="background-color:#2bb3d5">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true" style="color:white">×</button>
															<h4 class="modal-title"><font color="white">知识内容</font></h4>
														</div><br>
														<h3 style="text-align:center;color:#000"id="name_show">知识标题</h3><br>
														<div style="text-align:center">
														<img id="kno_pic" src="" width="70%" />
														</div><br>
														<div class="modal-body">
															<p id="content_show" style="color:#000">未输入内容</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-info"
																data-dismiss="modal">确定</button>
														</div>

													</div>
												</div>
											</div>
						</div>
					</div>
				</div>
				<!--/.panel-->
			</div>
			<!--/.col-->
		</div>
		<!--/.row-->
	</div>
	<!--/.main-->



	<script type="text/javascript" src="dist/js/lib/jquery-2.2.1.js"></script>
	<!-- <script src="js/bootstrap.min.js"></script> -->
	<script
			src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="dist/js/wangEditor.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		var editor = new wangEditor('content_input');
		editor.create();
	</script>
	<script>
		$(function() {
			var btn = $(".trash");//用class最后一个单词就行了？
			btn.click(function() {
				$('#myModal').modal('show');
				var par = $(this).parent().parent();
				var head = par.prev();
				var name = head.children(".kno_name").text();
				var time = par.children(".kno_time").text();
				var dis = par.children(".kno_dis").text();
				$("#time_tobedeleted").text(time);
				$("#name_tobedeleted").text(name);
				$("#dis_tobedeleted").text(dis);
				$("input[name='name_deleted']").val(name);
			});
		});
	</script>

	<script>
		$(function() {
			var btn = $(".pencil");//用class最后一个单词就行了？
			btn.click(function() {
				$('#myModal1').modal('show');
				var par = $(this).parent().parent();
				var head = par.prev();
				var name = head.children(".kno_name").text();
				var link = par.children(".kno_pic").attr("src");
				var seq = head.attr("id");
				var dis = par.children(".kno_dis").text();
				var content = par.children(".content").html();
                editor.$txt.html(content);
				$("textarea[name='dis_updated']").val(dis);
//				$("textarea[name='con_updated']").val(content);
//				editor.$txt.html(content);
				$("textarea[name='link_updated']").val(link);
				$("input[name='name_updated']").val(name);
				$("input[name='name_before']").val(name);
			});
		});
	</script>
    <script>
		$(function() {
			var btn = $(".kno_name");//用class最后一个单词就行了？
			btn.click(function() {
				/* $('#myModal2').modal('show');
				var name = $(this).text();
			    var par = $(this).parent();
				var body = par.next();
				var link = body.children(".kno_pic").attr("src");
				var content = body.children(".kno_content").val();
				var content_show = content.replace(/\n/gi,"<br/>");
				var content_show1 = content_show.replace(/ /gi,"&nbsp;");  
				$("#name_show").text(name);
				$("#content_show").html(content_show1);
				$("#kno_pic").attr("src",link); */
				var link = $(this).next().text();
				window.open(link);
			});
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
