<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/styleConf.css">
<title>Formulario de Registro</title>
</head>
<body>

    <div class="container">
      <div class="formulario">
        <h2>¿No estás registrado?</h2>
        <p>¿Te gustaría registrarte para recibir noticias, beneficios exclusivos, promociones y otras cosas de interés?</p>
        <div class="opciones">
          <a href="Login"><button id="btn-si">Sí, registrarme</button></a>
          <button id="btn-no">No, gracias</button>
        </div>
        <form action="addToCarrito" method="post" id="cedula-form">
    		<label for="cedula">Por favor, ingresa tu número de cédula:</label><br>
    		<!-- Mostrar el valor de cedula que se pasó como parámetro -->
    		<input type="text" id="cedula" name="cedula" value="<%= request.getParameter("cedula") %>" required><br><br>
    		<button type="submit">Continuar</button>
		</form>
      </div>
    </div>
  
 
  </body>

  
     <script>
      // JavaScript para manejar la interacción del formulario
      document.getElementById('btn-no').addEventListener('click', function() {
        document.getElementById('cedula-form').style.display = 'block';
      });
    </script>
  </html>