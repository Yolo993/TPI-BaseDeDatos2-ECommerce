CREATE DATABASE ECOMMERCEgrupo5
Collate Latin1_General_CI_AI
;
GO 
use ECOMMERCEgrupo5
go

-- Tabla: Categorías

CREATE TABLE Categorias (
    IdCategoria INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(100),
);

-- Tabla: MedioDePago

CREATE TABLE MediosDePago (
    IdMedioDePago  INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(100)
);

-- Tabla: Artículos

CREATE TABLE Articulos (
    IdArticulo INT PRIMARY KEY IDENTITY(1,1),
    IdCategoria INT,
    Nombre VARCHAR(150),
    Stock INT,
    Precio DECIMAL(10, 2),
    UrlImagen NVARCHAR(255),
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria),
);

---- Tabla: Formas de entrega

CREATE TABLE FormasDeEntrega (
    IdFormaDeEntrega INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(100)
);

-- Tabla: Roles
CREATE TABLE Roles (
    IDRol INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(100) NOT NULL -- Puede ser 'Cliente' o 'Administrador'
);
-- Tabla: Usuario
CREATE TABLE Usuario (
    IDUsuario INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Contraseña NVARCHAR(100) NOT NULL,
    Mail NVARCHAR(150) NOT NULL UNIQUE,
    IDRol INT NOT NULL,
    FOREIGN KEY (IDRol) REFERENCES Roles(IDRol)
);
-- Tabla: Ventas
CREATE TABLE Ventas (
    IdVenta INT PRIMARY KEY IDENTITY(1,1),
    IdUsuario INT,
    IdFormaDeEntrega INT,
    IdMedioDePago INT,
	Fecha DATE, 
	MontoTotal DECIMAL(10, 2), 
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario),
	FOREIGN KEY (IDFormaDeEntrega) REFERENCES FormasDeEntrega (IDFormaDeEntrega),
	FOREIGN KEY (IdMedioDePago) REFERENCES MediosDePago (IdMedioDePago)
   
);
-- Tabla: DetalleVenta
CREATE TABLE DetalleVenta (
    IdVenta INT ,
    IdArticulo INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
	PRIMARY KEY(IdVenta, IdArticulo),
	FOREIGN KEY (IdVenta) REFERENCES Ventas (IdVenta),
    FOREIGN KEY (IdArticulo) REFERENCES Articulos(IdArticulo)
);

