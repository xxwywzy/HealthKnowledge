<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>  
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
		String update_time = request.getParameter("update_time");
		byte b_time[] = update_time.getBytes("ISO-8859-1");
		update_time = new String(b_time, "UTF-8");
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB";
		String user = "sa";
		String password = "BiomedIT@ZJU2015";
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement stmt = conn.createStatement();
		String sql = "select  * from Health_Knowledge order by KnoTime desc";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		String kno_time = rs.getString("KnoTime");
		boolean needUpdated = true;
		if(kno_time.equals(update_time)){
		   needUpdated = false;
		}
	%>
 
 <c:set var="need_updated" value="<%=needUpdated%>"/>
<c:set var="kno_time" value="<%=kno_time%>"/>
<c:set var="update_time" value="<%=update_time%>"/>

<json:object prettyPrint="true">
  <json:object name="result" prettyPrint="true"> 
       <json:property name="needUpdated" value="${need_updated}"/> 
       <json:property name="kno_time" value="${kno_time}"/> 
       <json:property name="update_time" value="${update_time}"/> 
   </json:object>
 </json:object>  


