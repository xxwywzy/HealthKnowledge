<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>  
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
  String kno_type = request.getParameter("kno_type");
  byte b_type[] = kno_type.getBytes("ISO-8859-1");
  kno_type = new String(b_type, "UTF-8");
  if(kno_type.equals("001")){
  kno_type="高血压";}
  if(kno_type.equals("002")){
  kno_type="糖尿病";}
  if(kno_type.equals("003")){
  kno_type="高血脂";}
  if(kno_type.equals("004")){
  kno_type="冠心病";}
  if(kno_type.equals("005")){
  kno_type="脑卒中";}
 %>
 
 <c:set var="kno_type" value="<%=kno_type%>"/>
<sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
     url="jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB"
     user="sa"  password="BiomedIT@ZJU2015"/>

<sql:query dataSource="${snapshot}" var="kno_result">
select * from Health_Knowledge where KnoType = ? order by KnoTime asc;
<sql:param value="${kno_type}" />
</sql:query>


<json:object prettyPrint="true">
  <json:object name="result" prettyPrint="true"> 
    <json:array name="knowledge" prettyPrint="true">
      <c:forEach var="kno_row" items="${kno_result.rows}">
      <json:object prettyPrint="true">
       <json:property name="kno_id" value="${kno_row.KnoID}"/> 
       <json:property name="kno_name" value="${kno_row.KnoName}"/>
       <json:property name="kno_dis" value="${kno_row.KnoDiscription}"/>
       <json:property name="kno_time" value="${kno_row.KnoTime}"/>
       <json:property name="kno_link" value="${kno_row.KnoLink}"/>
      </json:object>  
      </c:forEach>
    </json:array>
   </json:object>
 </json:object>  


