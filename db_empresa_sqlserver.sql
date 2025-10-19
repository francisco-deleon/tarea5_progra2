-- Crear la Base de Datos 'db_empresa'
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'db_empresa') BEGIN
	CREATE DATABASE db_empresa;
END
GO

-- Crear el login 'UsuarioAPI'
IF NOT EXISTS (SELECT name FROM sys.server_principals WHERE name = 'UsuarioAPI') BEGIN
	CREATE LOGIN UsuarioAPI WITH
		PASSWORD = 'Zn3xEb5StXKva2M98UrBG4fQe6RH7Ysq',
		DEFAULT_DATABASE = db_empresa,
		CHECK_EXPIRATION = OFF,
		CHECK_POLICY = OFF;
END
GO

-- Cambiar a la Base de Datos por defecto
USE db_empresa;
GO

-- Crear el usuario 'ApiUser', asignar privilegios y vincular al login
IF NOT EXISTS (SELECT name FROM sys.database_principals WHERE name = 'UsuarioAPI') BEGIN
	CREATE USER UsuarioAPI FOR LOGIN UsuarioAPI;
	ALTER ROLE db_owner ADD MEMBER UsuarioAPI;
END
GO

-- Crear la tabla 'clientes'
CREATE TABLE clientes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    fechaNacimiento DATE
);

-- Crear registros de prueba en la tabla 'clientes'
INSERT INTO
	clientes(nombres, apellidos, direccion, telefono, fechaNacimiento)
VALUES
    ('Francisco', 'De Leon', 'Guatemala', '46553526', '1990-05-22'),
	('Jose', 'Lopez', 'Guatemala', '12345678', '1992-01-01'),
	('Jorge', 'Guzman', 'Guatemala', '78654321', '2000-10-01'),
	('Andrea', 'Morales', 'Guatemala', '18273645', '1987-02-21'),
	('Melissa', 'Palacios', 'Guatemala', '11223344', '1995-07-09');