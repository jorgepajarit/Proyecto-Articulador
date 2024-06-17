<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar producto</title>
    <link rel="stylesheet" href="styles/styleAdd.css">
</head>
<body>
<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/proyecto"
    user="dba" password="123456789.eT" />

<sql:query dataSource="${dbSource}" var="result">
    SELECT * FROM productos WHERE id_producto = ${param.id};
</sql:query>

<c:set var="producto" value="${result.rows[0]}" /> <!-- Guardar la primera fila del resultado en la variable 'producto' -->

<div class="container">
    <a href="controller"><button id="btnVolver">Volver</button></a>
    <h1>Actualizar Producto</h1>
    <form id="formAgregar" action="process-update-product.jsp?id=${param.id}" method="post" onsubmit="return confirmSubmit()">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="${producto.nombre}" required>

        <label for="descripcion">Descripción:</label>
        <textarea id="descripcion" name="descripcion" rows="4">${producto.descripcion}</textarea>

        <label for="precio">Precio:</label>
        <input type="number" id="precio" name="precio" step="0.01" min="0" value="${producto.precio}" required>

        <label for="stock">Stock:</label>
        <input type="number" id="stock" name="stock" min="0" value="${producto.stock}" required>

        <label for="categoria">Categoría:</label>
        <select id="categoria" name="categoria" required>
            <option value="1" ${producto.id_categoria == 1 ? 'selected' : ''}>Abrigos</option>
            <option value="2" ${producto.id_categoria == 2 ? 'selected' : ''}>Gorras</option>
            <option value="3" ${producto.id_categoria == 3 ? 'selected' : ''}>Accesorios</option>
        </select>

        <label for="imagen_url">URL de la Imagen:</label>
        <input type="text" id="imagen_url" name="imagen_url" value="${producto.imagen_url}">

        <div class="button-container">
            <input type="submit" value="Actualizar Producto" class="btnAgregar">
        </div>
    </form>
</div>

<script>
    function confirmSubmit() {
        return confirm("¿Estás seguro de actualizar este producto?");
    }
</script>
</body>
</html>
