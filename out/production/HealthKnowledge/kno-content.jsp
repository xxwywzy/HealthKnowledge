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
		String kno_name = request.getParameter("kno_name");
		//byte b_name[] = kno_name.getBytes("ISO-8859-1");
		//kno_name = new String(b_name, "UTF-8");
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		String url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=HypertensionTest";
        String url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB";
        String user = "sa";
		String password = "BiomedIT@ZJU2015";
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement stmt = conn.createStatement();
		String sql = "select * from HealthKno where KnoName = '"+kno_name+"'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		String kno_link = rs.getString("KnoLink");
		String kno_content = rs.getString("KnoElaboration");
		String kno_time = rs.getString("KnoTime");
		//String html = "<p><font color=\"#000000\" size=\"4\">&nbsp; &nbsp; &nbsp; 秋冬季是心脑血管疾病的高发期，高血压、心梗、心绞痛、心律失常以及脑卒中等疾病的发生率和致死率，常在这个阶段大大增加。心脑血管意外为什么在秋冬季高发？&nbsp;应该如何应对？</font></p><p><font color=\"#000000\" size=\"4\"><b>原因一：气温低</b></font></p><p><font color=\"#000000\" size=\"4\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;寒冷，常会导致心跳加快，血管收缩，从而使血压升高、心脏负荷加大，增加了心绞痛和心梗发生的概率。有研究表明，气温每下降&nbsp;10&nbsp;℃，心脏病发病风险会上升&nbsp;7%。</font></p><p><font color=\"#000000\" size=\"4\"><b>应对策略</b></font></p><p><font color=\"#000000\" size=\"4\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注意保暖，尤其是中老年人，秋衣秋裤，毛衣毛裤，该穿就得穿。当气温很低或阴冷的雨雪天时，要保证合适的室内温度，外出时记得做好保暖防护。</font></p><p><br></p>\n";
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
	<%--<p id="content" style="display:none"><%=kno_content%></p>--%>
	<p id="read_time" style="color:#757575;padding-left:5%;padding-right:5%;padding-top:5%;font-size:16px;line-height:18px">阅读本文大概需要<%=time%>分钟。</p>
    <div id="content" style="padding-left:5%;padding-right:5%;padding-top:5%;display:none"><%=kno_content%></div>
	<div style="padding-left:5%;padding-right:5%;padding-top:5%">
		<p id="content_show" style="color:#000;font-size:18px;line-height:27px"></p>
	</div>
</body>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script
		src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script>
		function content() {
			var content = $("#content").html();
            if(!checkHtml(content)){
                var content_show = content.replace(/\n/gi,"<br/>");
                var content_show1 = content_show.replace(/ /gi,"&nbsp;");
                $("#content_show").html(content_show1);
            }else{
                $("#content").show();
            }
            <%--var content = <%=kno_content%>;--%>

		}
</script>
<script>
    function checkHtml(htmlStr) {
        var  reg = /<[^>]+>/g;
        return reg.test(htmlStr);
    }
</script>
<script>
    window.onload=function(){
        content();
    }
</script>
</html>
