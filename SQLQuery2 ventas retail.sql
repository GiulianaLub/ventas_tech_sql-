CREATE DATABASE VENTASRETAIL1;

USE VENTASRETAIL1;

CREATE TABLE Clientes (
IDCliente INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
Nombre varchar(50) NOT NULL,
Email TEXT NOT NULL,
Ciudad varchar(50) NOT  NULL
);

SELECT *FROM Clientes;

CREATE TABLE Productos (
IDProducto INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
Nombre varchar(50) NOT NULL,
Precio DECIMAL(10,2) NOT NULL,
IDCategoria INT NOT  NULL FOREIGN KEY REFERENCES Categorias (IDCategoria)
);

SELECT *FROM Productos;

CREATE TABLE Categorias (
IDCategoria INT PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL,
Descripcion VARCHAR(200)
);

SELECT *FROM Categorias;

CREATE TABLE Ventas (
IDVenta INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
Fecha DATETIME NOT NULL,
IDCliente INT NOT NULL FOREIGN KEY REFERENCES Clientes(IDCliente),
IDProducto INT NOT NULL FOREIGN KEY REFERENCES Productos (IDProducto),
Cantidad INT NOT NULL
);
 
SELECT *FROM Ventas;

INSERT INTO Categorias
(IDCategoria,Nombre,Descripcion)
VALUES
(1, 'Computación', 'Laptops y PCs'),
(2, 'Accesorios', 'Periféricos'),
(3, 'Audio', 'Auriculares y parlantes');

SELECT *FROM Categorias;

INSERT INTO Productos
(Nombre,Precio,IDCategoria)
VALUES 
('Notebook Lenovo', 1200, 1),
('Mouse Logitech', 3000, 2),
('Teclado Mecánico', 8000, 2),
('Auriculares Sony', 15000, 3),
('Monitor Samsung', 35000, 1);

SELECT *FROM Productos;

INSERT INTO CLIENTES
(Nombre,Email,Ciudad)
VALUES
('María López', 'maria@mail.com', 'Buenos Aires'),
('Juan Pérez', 'juan@mail.com', 'Córdoba'),
('Ana Gómez', 'ana@mail.com', 'Rosario');

SELECT *FROM Clientes 

INSERT INTO Ventas 
(Fecha,IDCliente,IDProducto,Cantidad)
VALUES
('2024-06-01', 1, 1, 1),
('2024-06-02', 2, 2, 2),
('2024-06-03', 3, 3, 1),
('2024-06-04', 1, 4, 1),
('2024-06-05', 2, 5, 2),
('2024-06-06', 3, 1, 1),
('2024-06-07', 1, 2, 3),
('2024-06-08', 2, 3, 2),
('2024-06-09', 3, 5, 1),
('2024-06-10', 1, 4, 2);

SELECT *FROM Ventas;







