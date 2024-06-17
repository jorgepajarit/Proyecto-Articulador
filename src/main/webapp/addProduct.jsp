<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Producto</title>
    <link rel="stylesheet" href="styles/styleAdd.css">
</head>
<body>
    <div class="container">
    	<a href="controller"><button id="btnVolver">Volver</button></a>
        <h1>Agregar Nuevo Producto</h1>
        <form id="formAgregar" action="process-add-product.jsp" method="post" onsubmit="return confirmSubmit()">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>

            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" name="descripcion" rows="4"></textarea>

            <label for="precio">Precio:</label>
            <input type="number" id="precio" name="precio" step="0.01" min="0" required>

            <label for="stock">Stock:</label>
            <input type="number" id="stock" name="stock" min="0" required>

            <label for="categoria">Categoría:</label>
            <select id="categoria" name="categoria" required>
                <option value="1">Abrigos</option>
                <option value="2">Gorras</option>
                <option value="3">Accesorios</option>
            </select>

            <label for="imagen_url">URL de la Imagen:</label>
            <input type="text" id="imagen_url" name="imagen_url">

            <div class="button-container">
                <input type="submit" value="Agregar Producto" class="btnAgregar">
            </div>
        </form>
    </div>

    <script>
        function confirmSubmit() {
            return confirm("¿Estás seguro de agregar este producto?");
        }
        
    </script>
</body>
</html>
