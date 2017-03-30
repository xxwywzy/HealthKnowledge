<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>  
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
     url="jdbc:sqlserver://120.27.141.50:1433;DatabaseName=AuxiliaryDB"
     user="sa"  password="BiomedIT@ZJU2015"/>

<sql:query dataSource="${snapshot}" var="kno_result">
select * from HealthKno order by KnoTime asc;
</sql:query>

<sql:query dataSource="${snapshot}" var="tag_result">
select * from Knowledge_Tag;
</sql:query>

<sql:query dataSource="${snapshot}" var="knoandtag_result">
select * from Tag_AND_Knowledge;
</sql:query>

<json:object prettyPrint="true">
  <json:object name="result" prettyPrint="true">
   <json:property name="kno_amount" value="${kno_result.rowCount}"/> 
   <json:property name="tag_amount" value="${tag_result.rowCount}"/> 
   <json:property name="kno_and_tag_amount" value="${knoandtag_result.rowCount}"/> 
    <json:array name="knowledge" prettyPrint="true">
      <c:forEach var="kno_row" items="${kno_result.rows}">
      <json:object prettyPrint="true"> 
       <json:property name="kno_name" value="${kno_row.KnoName}"/>
       <json:property name="kno_dis" value="${kno_row.KnoDiscription}"/>
       <json:property name="kno_time" value="${kno_row.KnoTime}"/>
       <json:property name="kno_link" value="${kno_row.KnoLink}"/>
      </json:object>  
      </c:forEach>
    </json:array>
        <json:array name="tag" prettyPrint="true">
      <c:forEach var="tag_row" items="${tag_result.rows}">
      <json:object prettyPrint="true"> 
       <json:property name="tag_name" value="${tag_row.TagName}"/>
       <json:property name="tag_type" value="${tag_row.TagType}"/>
      </json:object>  
      </c:forEach>
    </json:array>
        <json:array name="knoandtag" prettyPrint="true">
      <c:forEach var="knoandtag_row" items="${knoandtag_result.rows}">
      <json:object prettyPrint="true"> 
       <json:property name="kno_name" value="${knoandtag_row.KnoName}"/>
       <json:property name="tag_name" value="${knoandtag_row.TagName}"/>
       <json:property name="tag_type" value="${knoandtag_row.TagType}"/>
      </json:object>  
      </c:forEach>
    </json:array>
   </json:object>
 </json:object>  


