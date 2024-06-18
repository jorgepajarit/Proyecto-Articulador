<%-- importacion de prefijos JSTL y Bibliotecas necesarias --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- Coonexion base de datos proyecto usando JSTL --%>
  <sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/proyecto"
                   user="root" password="Juanfelipe9902*"/>
                   
    <%-- creacion de la estructura HTML --%>               
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/styleCircuits.css"> <%-- Llamado/referencia del archivo de esilos ccs --%>
    <title>Circuitos</title>
    <link rel="icon" href="assets/logos.png" type="image/x-icon">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  <%-- instanciamiento delos componentes jquery --%>
</head>
<body>
    <%@ include file="header.jsp" %>  <%-- se incluye el archivo header.jsp que es la barra de navegacion --%>
    
    <div class="circuitos-div">
        <h1>Circuitos más importantes</h1>
        <hr>
        <br>
        <sql:query dataSource="${dbSource}" var="circuitosData">  <%-- instanciamiento del query de SQL --%>
    SELECT  nombre_circuito, longitud, curvas, record, ganador, pole, url_video, id_iframe FROM circuitos;  <%-- Query sql que selecciona los campos de la tabla circuitos de la base de datos proyecto --%>
</sql:query>
        <ul id="circuitos">
        <div class="circuitos-lista">
            <c:forEach var="circuito" items="${circuitosData.rows}">  <%-- Ciclo donde se asigna a un li los resultados de la consulta sql --%>
                  <li>
                   <img src="assets/${circuito.nombre_circuito.toLowerCase().replace(' ', '_')}.jpg" alt="${circuito.nombre_circuito}">  <%-- se ajusta el resultado de la consulta para que el nombre del circuito sea en minuscula y se cambien espacios por _ para incrustar la imagen --%>
                  <c:out value="${circuito.nombre_circuito}" />
                  
                   
                    <div class="circuitos-info">  <%-- asignacion de elemento traido de la base de datos  --%>
                        <div class="info">
                            <b>CIRCUITO:</b> <c:out value="${circuito.nombre_circuito}" /><br>
                            <b>LONGITUD:</b> <c:out value="${circuito.longitud}" /> metros<br>
                            <b>CURVAS:</b> <c:out value="${circuito.curvas}" /><br>
                            <b>RÉCORD:</b> <c:out value="${circuito.record}" /><br>
                            <b>GANADOR 2023:</b> <c:out value="${circuito.ganador}" /><br>
                            <b>POLE 2023:</b> <c:out value="${circuito.pole}" /><br>
                            <br>            
                                <iframe id="<c:out value="${circuito.id_iframe}" />" width="628" height="435" src="<c:out value="${circuito.url_video}" />?enablejsapi=1" title="Vuelta al circuito de ${circuito.nombre_circuito}"
                                  frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen> </iframe>  <%-- insercion del video --%>
                           
                        </div>
                        <span id ="cerrar" class="cerrar"><img src="assets/cerrar.png" alt=""></span>  <%-- boton cerrar --%>
                    </div>
                </li>
            </c:forEach>
            </div>
        </ul>
        <div class="overlay"></div>  <%-- clase overlay que permite oscurecer el fonde y hacerlo unfocuse --%>
    </div>
    <hr>
    <div class="cronometro_div">  <%-- div para el minijuego de los reflejos--%>
        <h3> Mide tus reflejos</h3>       
        <br>
        <div><p id="cronometro"></p></div>
        <br><p>Tiempo transcurrido </p>
        <div class="botones_Cronometro">
  		<button class= "start"onclick="iniciarCronometro()">Start</button> <%-- asignacion de funciones js a los botones--%>
        <button id="stop"class= "parar" onclick="detenerCrono()">Stop</button>
        <button class= "scores" onclick="abrirScores()" >High Scores</button>
 
        </div>
    </div>
    
    <div class="formScore"> <%-- Formulario para guardar el puntaje obtenido en el minijuego--%>
     <span class="cerrar"><img src="assets/cerrar.png" alt=""></span>
    <h2>Guarda tu puntaje</h2>
    <form action="guardarScore.jsp" method="post" class="formScoreform"> 
<input placeholder="Nombre" type="text" name="usuario" required>
<input type="text" name="puntaje" id="id_score"  readonly >
<input type="submit" value="Agregar" class="btn1">
</form>
    </div>

    <div id="visitasContador">
    <h2> Numero de visitas <%= request.getAttribute("visitas") %></h2> <%-- request al servidor por el atributo vistas el cual muestra la cantidad de veces que la pagina ha sido abierta--%>
    </div>
    
    <%@ include file="footer.jsp" %> <%-- inclusion del footer--%>
    <script src="js/circuitos.js"></script> <%--inclusion dl archivo js--%>
    <script src="https://www.youtube.com/iframe_api"></script> <%-- instnaciamiento de la api de youtube--%>

</body>
</html>
