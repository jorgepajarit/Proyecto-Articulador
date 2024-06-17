<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*"%>
<%@ page import = "ejbs.Scores"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix = "sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Guarda el score nuevo</title>
</head>
<body>
<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/proyecto"
                   user="root" password="Juanfelipe9902*"/>
                   <sql:update dataSource="${dbSource}">
                    INSERT INTO score (usuario, score ) 
    VALUES ('${param.usuario}','${param.puntaje}');
                   </sql:update>
                  <c:redirect url="/circuitos"/>  
</body>
</html>