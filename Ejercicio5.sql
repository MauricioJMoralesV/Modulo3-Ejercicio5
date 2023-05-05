/*
- ¿Qué DDL?
R: DDL significa Data Definition Language y se refiere a un conjunto de comandos en SQL utilizados para definir 
y modificar la estructura de una base de datos. 
Algunos ejemplos de comandos DDL en MySQL son CREATE, ALTER y DROP.

- ¿Cuándo se puede anular una acción DDL?
R: En general, las acciones DDL (Data Definition Language) en MySQL no se pueden deshacer una vez que se han 
ejecutado, lo que significa que no se pueden anular. Esto se debe a que las acciones DDL cambian la estructura 
de la base de datos y no solo los datos en sí. Por lo tanto, es importante tener precaución al ejecutar 
comandos DDL y realizar copias de seguridad de la base de datos antes de realizar cualquier cambio importante.

- ¿Cuando se utilizan comillas dobles en la creación de una tabla?
R: En la creación de una tabla en MySQL, las comillas dobles se pueden utilizar para definir nombres de campos 
y tablas que incluyan espacios o caracteres especiales. 
Sin embargo, no es una práctica común en MySQL y se recomienda utilizar en su lugar comillas simples o 
evitar caracteres especiales en los nombres de los campos y tablas.
*/

-- Crear una base de datos
create database Ejercicio5;
use Ejercicio5;

-- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON Ejercicio4.* TO 'admin'@'localhost';

-- Primera tabla
CREATE TABLE usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  zona_horaria VARCHAR(50) DEFAULT 'UTC-3',
  genero ENUM('M', 'F', 'O') NOT NULL,
  telefono VARCHAR(20) NOT NULL
);

-- Segunda tabla
CREATE TABLE ingresos (
  id_ingreso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tercera tabla
CREATE TABLE visitas (
  id_visita INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha DATE NOT NULL,
  cantidad_visitas INT NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Para cada tabla cree 8 registros.
INSERT INTO usuarios (nombre, apellido, contrasena, genero, telefono) VALUES
('Juan', 'Pérez', '123456', 'M', '98765432'),
('María', 'González', 'abcdef', 'F', '876543210'),
('Pedro', 'Martínez', 'qwerty', 'M', '765432109'),
('Ana', 'García', 'zxcvbn', 'F', '654321098'),
('Luis', 'Rodríguez', 'poiuyt', 'M', '543210987'),
('Lucía', 'Fernández', 'lkjhgf', 'F', '890765432'),
('Carlos', 'Sánchez', 'mnbvcx', 'M', '879687898'),
('Marta', 'López', 'asdfgh', 'F', '987698756');

INSERT INTO ingresos (id_usuario, fecha_hora) VALUES
(1, '2023-05-04 10:00:00'),
(2, '2023-05-04 11:00:00'),
(1, '2023-05-05 09:30:00'),
(3, '2023-05-05 12:15:00'),
(4, '2023-05-05 15:20:00'),
(2, '2023-05-06 08:00:00'),
(5, '2023-05-06 14:00:00'),
(1, '2023-05-07 11:30:00');

INSERT INTO visitas (id_usuario, fecha, cantidad_visitas) VALUES
(1, '2023-05-01', 5),
(2, '2023-05-01', 3),
(3, '2023-05-01', 7),
(4, '2023-05-02', 2),
(5, '2023-05-02', 8),
(6, '2023-05-02', 4),
(7, '2023-05-03', 6),
(8, '2023-05-03', 1);

-- Elimine una de las tablas creadas.
drop table visitas;


