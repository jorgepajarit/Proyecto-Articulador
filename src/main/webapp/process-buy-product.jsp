<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pedido realizado</title>
<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/proyecto"
    user="dba" password="123456789.eT" />
    
    <!-- Insertar datos para realizar pedido -->
<sql:update dataSource="${dbSource}">
    INSERT INTO pedidos_ (id_pedido, id_producto, nombre_producto, fecha_pedido, total, estado)
    VALUES ('${param.cedula}','${param.descripcion}','${param.precio}','${param.stock}','${param.categoria}','${param.imagen_url}');
</sql:update> 


</head>
<body>

</body>
</html>