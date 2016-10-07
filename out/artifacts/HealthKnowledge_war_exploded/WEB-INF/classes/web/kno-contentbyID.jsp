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

<body>
	<%
		String kno_id = request.getParameter("kno_id");
		byte b_id[] = kno_id.getBytes("ISO-8859-1");
		kno_id = new String(b_id, "UTF-8");
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB";
		String user = "sa";
		String password = "BiomedIT@ZJU2015";
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement stmt = conn.createStatement();
		String sql = "select * from Health_Knowledge where KnoID = '"+kno_id+"'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		String kno_name = rs.getString("KnoName");
		String kno_link = rs.getString("KnoLink");
		String kno_content = rs.getString("KnoElaboration");
		String kno_time = rs.getString("KnoTime");
		int amount = kno_content.length();
		int time = amount/300;
		if(time==0) time++;
	%>
	<h2 style="margin-top:-30px;color:#000;margin-left:5%;margin-right:5%;font-weight:500" id="name_show"><%=kno_name%></h2>
	<h4 style="margin-top:-10px;color:#757575;margin-left:5%;font-weight:500" id="name_show"><%=kno_time.substring(0,10)%> 血压助手</h4>
	<!-- <hr style="margin-left:5%;margin-right:5%;border:0;background-color:#949494;height:1px;"> -->
	<div style="text-align:center">
		<img id="kno_pic" src="<%=kno_link%>" width="90%" />
	</div>
	<p id="content" style="display:none"><%=kno_content%></p>
	<p id="read_time" style="color:#757575;padding-left:5%;padding-right:5%;padding-top:5%;font-size:16px;line-height:18px">阅读本文大概需要<%=time%>分钟。</p>
	<div>
		<p id="content_show" style="color:#000;padding:5%;font-size:18px;line-height:27px"></p>
	</div>
</body>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script
		src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script>
		function content() {
			var content = $("#content").html();
			var content_show = content.replace(/\n/gi,"<br/>");
			var content_show1 = content_show.replace(/ /gi,"&nbsp;"); 
			$("#content_show").html(content_show1);
		}
</script>
<script>
	content();
</script>
</html>
