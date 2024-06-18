<%-- importacion de prefijos JSTL y Bibliotecas necesarias --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <%-- creacion de la estructura HTML --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="styles/styleScores.css"> <%-- Llamado/referencia del archivo de esilos ccs --%>
<title>High Scores</title>
</head>
<body>

<h2> Puntajes más altos en nuestro minijuego</h2>


<%-- Coonexion base de datos proyecto usando JSTL --%>
<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/proyecto"
    user="root" password="Juanfelipe9902*" />
    
<sql:query dataSource="${dbSource}" var="result"> <%-- instanciamiento del query de SQL que selecciona los puntajes de menor a mayor --%>
   SELECT * FROM score ORDER BY score DESC;
</sql:query>

<div class="tableScore"> <%-- div para la tabla de los puntajes --%>
<table border="1">
    <tr>
        <th>Puesto</th>
        <th>Nombre</th>
        <th>Puntaje</th>
        <th>Fecha</th>
        
    </tr>
    
     <c:set var="counter" value="1" /> <%-- variable para el puesto de cada puntaje dentro de la tabla --%>
    <c:forEach var="row" items="${result.rows}">   <%-- ciclo para agregar cada resultado de la consulta sql --%>
        <tr>
            <td>${counter}</td>
            <td>${row.usuario}</td>
            <td>${row.score}</td>
             <td>
                    <fmt:parseDate value="${row.fecha}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" /> <%-- definicion del patron/fromato de la fecha hora --%>
                    <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy - HH:mm:ss" /> <%-- cambiodel formato de la fecha y hora --%>
                </td>
        </tr>
        <c:set var="counter" value="${counter + 1}" />  <%-- se va sumando uno a la variable para el puesto --%>
    </c:forEach> 
    
</table>
</div>
</body>
</html>