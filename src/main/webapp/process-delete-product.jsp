<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DELETE PRODUCT</title>
</head>
<body>
<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/proyecto"
    user="dba" password="123456789.eT" />

<!-- Borrar usuarios del crud, recibe un parametro enviado desde controller -->
<sql:update dataSource="${dbSource}">
    DELETE FROM productos WHERE id_producto = ${param.id};
</sql:update>
<c:redirect url="controller"/>
</body>
</html>
