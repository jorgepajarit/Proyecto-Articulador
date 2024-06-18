<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Fórmula 1</title>
    <link rel="stylesheet" href="styles/stylelogin.css">
    <script>
        function showLoginForm() {
            document.getElementById("loginForm").style.display = "block";
            document.getElementById("registerForm").style.display = "none";
        }

        function showRegisterForm() {
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("registerForm").style.display = "block";
        }
    </script>
</head>
<body>
    <div class="login-container">
        <h1>Iniciar Sesión</h1>
        <form id="loginForm" action="Login" method="post" style="display: block;">
            <div class="form-group">
                <label for="username">Usuario</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Ingresar</button>
            <p>¿No tienes cuenta? <a href="#" onclick="showRegisterForm()">Regístrate aquí</a></p>
        </form>
               <form id="registerForm" action="RegisterServlet" method="post" style="display: none;">
            <h1>Registro de Usuario</h1>
            <div class="form-group">
                <label for="newUsername">Nuevo Usuario</label>
                <input type="text" id="newUsername" name="username" required>
            </div>
            <div class="form-group">
                <label for="newPassword">Nueva Contraseña</label>
                <input type="password" id="newPassword" name="password" required>
            </div>
            <button type="submit">Registrar</button>
            <p>¿Ya tienes cuenta? <a href="#" onclick="showLoginForm()">Inicia sesión aquí</a></p>
        </form>
    </div>
</body>
</html>
    