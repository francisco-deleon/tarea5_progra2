-- Crear nuevo usuario 'usr_empresa' contraseña 'Empresa@123-2025'
CREATE USER 'usr_empresa'@'localhost' IDENTIFIED BY 'Empresa@123-2025';

-- Asignar los permisos necesarios al nuevo usuario 'usr_empresa' en la base de datos 'db_empresa'
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE, SHOW VIEW ON db_empresa.* TO 'usr_empresa'@'localhost';

-- Recargar la tabla de permisos
FLUSH PRIVILEGES;

-- Crear base de datos 'db_empresa'
CREATE DATABASE IF NOT EXISTS db_empresa;

-- Seleccionar la BD 'db_empresa'
USE db_empresa;

-- Crear tabla 'clientes'
CREATE TABLE clientes(
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) DEFAULT NULL,
    telefono VARCHAR(15) DEFAULT NULL,
    fechaNacimiento DATE DEFAULT NULL
);

-- Insertar registros de prueba en la tabla 'clientes'
INSERT INTO clientes(nombres, apellidos, direccion, telefono, fechaNacimiento) VALUES
    ('Francisco', 'De Leon', 'Guatemala', '46553526', '1990-05-22'),
    ('Jose', 'Lopez', 'Guatemala', '12345678', '1992-01-01'),
    ('Jorge', 'Guzman', 'Guatemala', '78654321', '2000-10-01'),
    ('Andrea', 'Morales', 'Guatemala', '18273645', '1987-02-21'),
    ('Melissa', 'Palacios', 'Guatemala', '11223344', '1995-07-09');