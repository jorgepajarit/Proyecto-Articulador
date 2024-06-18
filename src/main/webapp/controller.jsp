<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!-- CRUD DE PRODUCTOS -->
<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/proyecto"
    user="root" password="Juanfelipe9902*" />

<sql:query dataSource="${dbSource}" var="result">
    SELECT * FROM productos;
</sql:query>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla de Productos</title>
    <link rel="stylesheet" href="styles/styleController.css">
</head>
<body>
    <div class="container">
        <h1>Tabla de Productos</h1>
        <a href="tienda"><button id="btnAgregar">Volver</button></a>
        <a href="add"><button id="btnAgregar">Agregar Producto</button></a>
        <table class="product-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>ID Categoría</th>
                    <th>Imagen</th>
                    <th>Fecha Agregado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterar sobre el resultado de la consulta y mostrar cada producto -->
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td>${row.id_producto}</td>
                        <td>${row.nombre}</td>
                        <td>${row.descripcion}</td>
                        <td>${row.precio}</td>
                        <td>${row.stock}</td>
                        <td>
                        <!--Control de productos, si es 1 es abrigos, si es 2 es gorras y si es 3 es accesorios -->
                            <c:choose>
                                <c:when test="${row.id_categoria == 1}">Abrigos</c:when>
                                <c:when test="${row.id_categoria == 2}">Gorras</c:when>
                                <c:when test="${row.id_categoria == 3}">Accesorios</c:when>
                                <c:otherwise>Otro</c:otherwise>
                            </c:choose>
                        </td>
                        <td><img src="${row.imagen_url}" alt="${row.nombre}" style="width: 100px;"></td>
                        <td>${row.fecha_agregado}</td>
                        <td>
                            <a href="update?id=${row.id_producto}">
                            	<button class="btnActualizar">Actualizar</button>
                            </a>
                            <!-- Confirmación para eliminar -->
                            <a href="delete?id=${row.id_producto}" id="deleteLink-${row.id_producto}">
    							<button class="btnEliminar" onclick="return confirmarEliminar(${row.id_producto})">Eliminar</button>
							</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
    function confirmarEliminar(idProducto) {
        return confirm(`¿Estás seguro de eliminar el producto con ID ${idProducto}?`);
    }
	</script>
</body>
</html>
