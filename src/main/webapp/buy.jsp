<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix = "sql"%>

<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/proyecto"
                   user="dba" password="123456789.eT"/>
                   
<!-- Formulario para confirmar compra y pedir los datos al usuario -->
<sql:query dataSource="${dbSource}" var="carritotemp">
    SELECT * FROM carritotemp;
</sql:query>   

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalizar Compra</title>
    <link rel="stylesheet" href="styles/styleBuy.css">
</head>
<body>
    <div class="container">
        <a href="tienda" class="btn-volver">Volver</a>
        <h1>Finalizar Compra</h1>
        <form id="form-compra" action="registerPedido" method="post" onsubmit="return confirmSubmit()">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>

            <label for="cedula">Número de Cédula:</label>
            <input type="text" id="cedula" name="cedula" required>

            <label for="direccion">Dirección de Envío:</label>
            <input type="text" id="direccion" name="direccion" required>

            <label for="codigo-postal">Código Postal:</label>
            <input type="text" id="codigo-postal" name="codigo-postal" required>

            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" required>

            <label for="email">Correo Electrónico:</label>
            <input type="email" id="email" name="email" required>

            <label for="suscripcion">Suscribirse a nuestra página:</label>
            <input type="checkbox" id="suscripcion" name="suscripcion">

            <label for="metodo-pago">Método de Pago:</label>
            <select id="metodo-pago" name="metodo-pago" required>
                <option value="tarjeta">Tarjeta de Crédito</option>
                <option value="paypal">PayPal</option>
                <option value="transferencia">Transferencia Bancaria</option>
                <option value="pse">PSE</option>
            </select>

            <label for="comentarios">Comentarios:</label>
            <textarea id="comentarios" name="comentarios" rows="4"></textarea>

            <hr>
            <h3>Tus productos Seleccionados</h3>
            <ul class="productos-seleccionados">
                <c:forEach var="producto" items="${carritotemp.rows}">
                    <li>${producto.nombre} - ${producto.valor} COP</li>
                </c:forEach>
            </ul>

            <div class="total-container">
                <h3>Total</h3>
                <c:set var="total" value="0" />
                <c:forEach var="producto" items="${carritotemp.rows}">
                    <c:set var="total" value="${total + producto.valor}" />
                </c:forEach>
                <span class="total">${total} COP</span>
            </div>

            <div class="button-container">
                <input type="submit" value="Finalizar Compra" class="btn-finalizar">
            </div>
        </form>
    </div>

    <script>
        function confirmSubmit() {
            return confirm("¿Estás seguro de finalizar la compra?");
        }
    </script>
</body>
</html>
