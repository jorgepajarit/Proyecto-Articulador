<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix = "sql"%>

<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/proyecto"
                   user="root" password="Juanfelipe9902*"/>

<sql:query dataSource="${dbSource}" var="result">
    SELECT * FROM productos;
</sql:query>          
      
<sql:query dataSource="${dbSource}" var="carritotemp">
    SELECT * FROM carritotemp;
</sql:query>               

<sql:query dataSource="${dbSource}" var="countCarritoTemp">
    SELECT COUNT(*) AS total FROM carritotemp;
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/styleProducts.css" />
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
    <title>Tienda</title>
</head>

<body>
    <%@ include file ="header.jsp"  %>
    <h1>Tienda de Productos</h1>

    <div class="container-list">
        <ul class="title-list">
            <li><a id="ferrari" href="">Ferrari</a></li>
            <li><a id="mercedes" href="">Mercedes-AMG</a></li>
            <li><a id="redbull" href="">RedBull Racing</a></li>
            <li><a id="williams" href="">Williams Racing</a></li>
            <li><a id="hass" href="">Haas F1</a></li>
            <li><a id="stake" href="">Stake</a></li>
        </ul>
    </div>
    
    <form action="addToCarrito" method="post">
        <div class="container-icon">
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="icon-cart">
        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z"/>
    </svg>
    <!-- contador de productos -->
    <div class="count-products">
        <span id="cont-products">${countCarritoTemp.rows[0].total}</span>
    </div>

    <div class="container-cart-products hidden-cart">
        <c:forEach var="producto" items="${carritotemp.rows}">
            <div class="cart-product">
                <div class="info-cart-product">
                    <span class="cant-prod-cart">${loop.index}</span> <!-- ETIQUETA -->
                    <p class="title-product-cart">${producto.nombre}</p>
                    <span class="price-product-cart">${producto.valor}</span>
                </div>
                <a href="deleteToCarrito?id=${producto.id_select}"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="icon-close">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/>
                </svg></a>
            </div>
        </c:forEach>
        <div class="cart-total">
            <h3>Total</h3>
            <c:set var="total" value="0" />
            <c:forEach var="producto" items="${carritotemp.rows}">
                <c:set var="total" value="${total + producto.valor}" />
            </c:forEach>
            <span class="total">${total}</span> 
            <a href=""><span class="total">Comprar</span></a>
        </div>
    </div>
	</div>

        <div class="container-items">
            <c:forEach var="producto" items="${result.rows}">
                <div class="item">
                    <figure>
                        <img src="${producto.imagen_url}" alt="${producto.nombre}" />
                    </figure>
                    <div class="info-product">
                        <hr>
                        <h2>${producto.nombre}</h2>
                        <p class="price">Precio: ${producto.precio} Cop</p>
                        <button type="submit" name="item" value="${producto.id_producto}">Añadir al carro</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </form>
    
    <%@ include file ="footer.jsp"  %>
    <script src="js/products.js"></script>
</body>
</html>
