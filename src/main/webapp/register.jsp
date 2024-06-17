<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
</head>
<body>
    <h2>Registro de Usuario</h2>
    
    <%-- Mostrar un mensaje de error si se recibe el parámetro error=true --%>
    <% if ("true".equals(request.getParameter("error"))) { %>
        <p style="color: red;">Error al registrar usuario. Por favor, inténtelo nuevamente.</p>
    <% } %>
    
   <p>preba de nuevo <a href="login.jsp">Inicia sesión aquí</a></p>
</body>
</html>