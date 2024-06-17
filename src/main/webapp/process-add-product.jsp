<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inserción realizada con exito</title>

<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/proyecto"
    user="dba" password="123456789.eT" />
    
<sql:update dataSource="${dbSource}">
    INSERT INTO productos (nombre, descripcion, precio, stock, id_categoria, imagen_url)
    VALUES ('${param.nombre}','${param.descripcion}','${param.precio}','${param.stock}','${param.categoria}','${param.imagen_url}');
</sql:update>  
<c:redirect url="controller"/>
</head>
<body>

</body>
</html>