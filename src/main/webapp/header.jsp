<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles/headerStyles.css">
</head>
<body>
  <section id="inicio">
    <header class="header">
      <div class="logo">
        <img src="assets/logo.png" alt="Logo formula 1">
      </div>
      <nav>
        <ul class="nav-links">
          <li><a href="home">Inicio</a></li>
          <li><a href="tienda">Productos</a></li>
          <li><a href="circuitos">Circuitos</a></li>
          <li><a href="escuderias">Escuderias</a></li>
        </ul>
      </nav>
          <div class="btn">
        <%-- Verificar si hay una sesión activa y mostrar el nombre de usuario y el botón de sesión --%>
        <% String nombreUsuario = (String) session.getAttribute("nombreUsuario"); %>
        <% if (nombreUsuario != null && !nombreUsuario.isEmpty()) { %>
          <div class="dropdown">
            <button onclick="toggleDropdown()" class="dropbtn"> <%= nombreUsuario %></button>
            <div id="myDropdown" class="dropdown-content">
              <a href="login.jsp">Cerrar sesión</a>
            </div>
          </div>
        <% } else { %>
          <a href="login.jsp"><button>Ingresar</button></a>
        <% } %>
      </div>
      
      
      
    </header>
  </section>
  <script>
    // Función para mostrar u ocultar el menú desplegable de sesión
    function toggleDropdown() {
      document.getElementById("myDropdown").classList.toggle("show");
    }

    // Cerrar el menú desplegable si se hace clic fuera de él
    window.onclick = function(event) {
      if (!event.target.matches('.dropbtn')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (var i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains('show')) {
            openDropdown.classList.remove('show');
          }
        }
      }
    }
  </script>
</body>
</html>