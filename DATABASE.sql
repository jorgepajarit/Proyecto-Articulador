-- Scripts de Mysql para poder correr el proyecto en tu servidor.

-- Creación de base de datos
CREATE DATABASE proyecto;

-- Creación de tabla circuitos
CREATE TABLE circuitos (
  id_circuito int NOT NULL AUTO_INCREMENT,
  nombre_circuito varchar(50) DEFAULT NULL,
  longitud int DEFAULT NULL,
  curvas varchar(100) DEFAULT NULL,
  record varchar(200) DEFAULT NULL,
  ganador varchar(100) DEFAULT NULL,
  pole varchar(100) DEFAULT NULL,
  PRIMARY KEY (id_circuito)
)
-- Creación de tabla de productos utilizada en tienda
CREATE TABLE productos (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10, 2) NOT NULL,
  stock INT NOT NULL,
  id_categoria INT,
  imagen_url VARCHAR(255),
  fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabla categorias para dar una categoria a los productos
CREATE TABLE categorias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT
);

-- Tabla clientes
CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  direccion TEXT,
  telefono VARCHAR(20),
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE pedidos (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total DECIMAL(10, 2) NOT NULL,
  estado ENUM('pendiente', 'procesando', 'enviado', 'completado', 'cancelado') DEFAULT 'pendiente',
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
CREATE TABLE detalle_pedidos (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT,
  id_producto INT,
  cantidad INT NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
CREATE TABLE metodos_pago (
  id_metodo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT
);
CREATE TABLE pagos (
  id_pago INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT,
  id_metodo INT,
  monto DECIMAL(10, 2) NOT NULL,
  fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_metodo) REFERENCES metodos_pago(id_metodo)
);
--LOGIN
CREATE TABLE usuarios (
  id_usuario int NOT NULL AUTO_INCREMENT,
  nombre_usuario varchar(255) NOT NULL,
  contrasena varchar(255) NOT NULL,
  perfil int DEFAULT NULL,
  PRIMARY KEY (id_usuario),
  UNIQUE KEY nombre_usuario (nombre_usuario)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla para carrito
CREATE TABLE carritotemp(
  id_select INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT,
  nombre VARCHAR(255) NOT NULL,
  valor INT
);

-- Inserción de datos para el proyecto.
INSERT INTO categorias (nombre,descripcion) VALUES ('Abrigos','busos,chaquetas,abrigos'),
('Gorras','gorras,gorros,sombreros'),('Accesorios','Relojes,anillos,manillas');

INSERT INTO productos (nombre, descripcion, precio, stock, id_categoria, 
imagen_url) VALUES ('Chaqueta escuderia ferrari', 'Chaqueta ferrari', 
180000,10,1,'assets/img/buso-ferrari.png'),('Buso ferrari negro','Buso ferrari negro',120000,
10,1,'assets/img/buso-ferrari2.jpg'),('Gorra escuderia ferrari','Gorra ferrari',90000,
10,2,'assets/img/gorra-ferrari.jpg'),('Reloj escuderia ferrari','Reloj ferrari',500000,
10,3,'assets/img/reloj-ferrari.jpg'),('Reloj hublot ferrari','Reloj hublot ferrari',700000,
10,3,'assets/img/reloj-hublot-ferrari.jpg'),('Reloj pilota ferrari','Reloj pilota ferrari',600000,
10,3,'assets/img/reloj-pilotta-ferrari.jpg');

-- Tabla para guardar puntaje
CREATE TABLE score (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    usuario VARCHAR(255) NOT NULL,      
    score VARCHAR(255) NOT NULL,       
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP );

