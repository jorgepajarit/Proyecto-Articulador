<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Actualización</title>
</head>
<body>
    <sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/proyecto"
        user="dba" password="123456789.eT" />

    <sql:update dataSource="${dbSource}">
        UPDATE productos 
        SET nombre = '${param.nombre}',
            descripcion = '${param.descripcion}',
            precio = '${param.precio}',
            stock = '${param.stock}',
            id_categoria = '${param.categoria}',
            imagen_url = '${param.imagen_url}'
        WHERE id_producto = ${param.id};
    </sql:update>

    <c:redirect url="controller"/>
</body>
</html>
