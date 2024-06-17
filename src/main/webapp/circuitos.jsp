<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


  <sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/proyecto"
                   user="root" password="Juanfelipe9902*"/>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/styleCircuits.css">
    <title>Circuitos</title>
    <link rel="icon" href="assets/logos.png" type="image/x-icon">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="circuitos-div">
        <h1>Circuitos más importantes</h1>
        <hr>
        <br>
        <sql:query dataSource="${dbSource}" var="circuitosData">
    SELECT  nombre_circuito, longitud, curvas, record, ganador, pole, url_video, id_iframe FROM circuitos;
</sql:query>
        <ul id="circuitos">
        <div class="circuitos-lista">
            <c:forEach var="circuito" items="${circuitosData.rows}">
                  <li>
                   <img src="assets/${circuito.nombre_circuito.toLowerCase().replace(' ', '_')}.jpg" alt="${circuito.nombre_circuito}">
                  <c:out value="${circuito.nombre_circuito}" />
                  
                   
                    <div class="circuitos-info">
                        <div class="info">
                            <b>CIRCUITO:</b> <c:out value="${circuito.nombre_circuito}" /><br>
                            <b>LONGITUD:</b> <c:out value="${circuito.longitud}" /> metros<br>
                            <b>CURVAS:</b> <c:out value="${circuito.curvas}" /><br>
                            <b>RÉCORD:</b> <c:out value="${circuito.record}" /><br>
                            <b>GANADOR 2023:</b> <c:out value="${circuito.ganador}" /><br>
                            <b>POLE 2023:</b> <c:out value="${circuito.pole}" /><br>
                            <br>            
                                <iframe id="<c:out value="${circuito.id_iframe}" />" width="628" height="435" src="<c:out value="${circuito.url_video}" />?enablejsapi=1" title="Vuelta al circuito de ${circuito.nombre_circuito}"
                                  frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen> </iframe>
                           
                        </div>
                        <span id ="cerrar" class="cerrar"><img src="assets/cerrar.png" alt=""></span>
                    </div>
                </li>
            </c:forEach>
            </div>
        </ul>
        <div class="overlay"></div>
    </div>
    <hr>
    <div class="cronometro_div">
        <h3> Mide tus reflejos</h3>
        <script>
            var segundos = 0;
            var miliseg = 0;
            var cronometro;
            function iniciarCronometro(){
                cronometro = setInterval(function(){
                    miliseg++;
                    if(miliseg >= 1000){
                        segundos++;
                    }
                    document.getElementById('cronometro').innerHTML = segundos + "." + miliseg;        
                    document.getElementById('id_score').value  = segundos + "." + miliseg; 
                }, 1);
                
            }

            function detenerCrono(){
                clearInterval(cronometro);
            }
        </script>
        <br>
        <div><p id="cronometro"></p></div>
        <br><p>Tiempo transcurrido </p>
        <div class="botones_Cronometro">
  		<button class= "start"onclick="iniciarCronometro()">Start</button>
        <button id="stop"class= "parar" onclick="detenerCrono()">Stop</button>
        <button class= "scores" onclick="" >High Scores</button>
 
        </div>
    </div>
    
    
    
    <div class="formScore">
     <span class="cerrar"><img src="assets/cerrar.png" alt=""></span>
    <h2>Guarda tu puntaje</h2>
    <form action="guardarScore.jsp" method="post" class="formScoreform"> 
<input placeholder="Nombre" type="text" name="usuario" required>
<input type="text" name="puntaje" id="id_score"  readonly >
<input type="submit" value="Agregar" class="btn1">
</form>
    </div>

    <div id="visitasContador">
    <h2> Numero de visitas <%= request.getAttribute("visitas") %></h2>
    </div>
    
    <%@ include file="footer.jsp" %>
    <script src="js/circuitos.js"></script>
    <script src="https://www.youtube.com/iframe_api"></script>

</body>
</html>
