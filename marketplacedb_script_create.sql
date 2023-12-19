-- Crear la base de datos del marketplace
CREATE DATABASE IF NOT EXISTS marketplace_db;

USE marketplace_db;
 
-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS usuarios
  (
     	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
        tipo_documento VARCHAR(50) NOT NULL,
        dni INT NOT NULL UNIQUE,
        nombre VARCHAR(50) NOT NULL,
     	apellido VARCHAR(255) NOT NULL,
        correo VARCHAR(255) NOT NULL UNIQUE,
     	contrasena VARCHAR(50) NOT NULL,
        telefono VARCHAR(50),
		fecha_nacimiento DATETIME
);

-- Tabla de Historial de compras
CREATE TABLE IF NOT EXISTS historial_compras
  (
     	 	id_historial INT AUTO_INCREMENT PRIMARY KEY,
            fecha DATETIME NOT NULL,
        	estado VARCHAR(255),
            id_usuario INT,
            FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)
  );
  
-- Tabla de Categorias
CREATE TABLE IF NOT EXISTS categorias
  (
			id_categoria INT AUTO_INCREMENT PRIMARY KEY,
            nombre VARCHAR(45) NOT NULL,
        	descripcion  VARCHAR(255),
            fecha_creacion DATETIME
  );
  
-- Tabla de Productos
CREATE TABLE IF NOT EXISTS productos
  (
     	 	id_producto INT AUTO_INCREMENT PRIMARY KEY,
            nombre VARCHAR(255) NOT NULL,
        	description VARCHAR(255),
            price DECIMAL(10, 2) NOT NULL,
		    cantidad INT
  );
  
-- Tabla del Detalle del historial de compras
CREATE TABLE IF NOT EXISTS detalle_historial
  (
     	 	id_detalle_historial INT AUTO_INCREMENT PRIMARY KEY,
			price DECIMAL(10, 2) NOT NULL,
		    cantidad INT NOT NULL,
            comentario VARCHAR(255),
            id_historial INT,
			id_usuario INT,
            id_producto INT,
            id_categoria INT,
			FOREIGN KEY(id_historial) REFERENCES historial_compras(id_historial),
            FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),
            FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria),
            FOREIGN KEY(id_producto) REFERENCES productos(id_producto) 
  ); 

-- Tabla de Proveedores
CREATE TABLE IF NOT EXISTS proveedores
  (
			id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
            nombre VARCHAR(45) NOT NULL,
        	contacto  DECIMAL(10, 2) NOT NULL,
            direccion VARCHAR(90),
		    estado VARCHAR(45),
            info_financiera VARCHAR(255),
			tipo VARCHAR(45) NOT NULL
  );
  
-- Tabla de Promociones
CREATE TABLE IF NOT EXISTS promociones
  (
     	 	id_promocion INT AUTO_INCREMENT PRIMARY KEY,
            nombre VARCHAR(45) NOT NULL,
        	descuento DECIMAL(10, 2) NOT NULL,
            fecha_inicio DATETIME,
		    fecha_fin DATETIME,
            id_producto INT,
            id_categoria INT,
            id_proveedor INT,
            FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
            FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria),
            FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor)
  );
  
-- Tabla de Ordenes
CREATE TABLE IF NOT EXISTS ordenes
  (
			id_orden INT AUTO_INCREMENT PRIMARY KEY,
            fecha DATETIME,
        	estado  VARCHAR(255),
            id_promocion INT,
            FOREIGN KEY(id_promocion) REFERENCES promociones(id_promocion)
  );
  
  
-- Tabla de Envíos
CREATE TABLE IF NOT EXISTS envios
  (
     	id_envio INT AUTO_INCREMENT PRIMARY KEY,
        direccion VARCHAR(50) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        fecha_entrega DATETIME NOT NULL,
        metodo VARCHAR(255) NOT NULL UNIQUE,
     	courrier VARCHAR(50) NOT NULL,
        costo DECIMAL(10, 2) NOT NULL,
		tiempo_entrega DATETIME
);
  
  
-- Tabla Detalle de la Orden
CREATE TABLE IF NOT EXISTS detalle_orden
  (
			id_detalle INT AUTO_INCREMENT PRIMARY KEY,
            cantidad INT,
        	precio_total DECIMAL(10, 2) NOT NULL,
            id_producto INT,
            id_categoria INT,
            id_usuario INT,
            id_envio INT,
            id_orden INT,
            FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
            FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria),
            FOREIGN KEY(id_envio) REFERENCES envios(id_envio),
            FOREIGN KEY(id_orden) REFERENCES ordenes(id_orden)
  );
  
  
-- Tabla de Carrito de compras
CREATE TABLE IF NOT EXISTS carrito
  (
			id_carrito INT AUTO_INCREMENT PRIMARY KEY,
            fecha_creacion DATETIME,
            id_orden INT,
            FOREIGN KEY(id_orden) REFERENCES ordenes(id_orden)        	
  );
  
  
-- Tabla Detalle del carrito de compras
CREATE TABLE IF NOT EXISTS detalle_carrito
  (
			id_detalle_carrito INT AUTO_INCREMENT PRIMARY KEY,
            cantidad INT,
        	precio_total DECIMAL(10, 2) NOT NULL,
            id_carrito INT,
            id_orden INT,
            id_producto INT,
            id_categoria INT,
            id_proveedor INT,
            FOREIGN KEY(id_carrito) REFERENCES carrito(id_carrito),
            FOREIGN KEY(id_orden) REFERENCES ordenes(id_orden),
			FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
            FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria),
            FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor)            
  );
      

-- Tabla de Comentarios
CREATE TABLE IF NOT EXISTS comentarios
  (
     	 	id_comentario INT AUTO_INCREMENT PRIMARY KEY,
            comentario VARCHAR(255) NOT NULL,
        	fecha DATETIME,
            estado VARCHAR(45),
		    calificacion VARCHAR(45),
            id_producto INT,
            id_categoria INT,
			FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
            FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
  );
  

  

  


