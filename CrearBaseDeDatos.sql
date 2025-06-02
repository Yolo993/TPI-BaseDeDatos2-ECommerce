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

-- Tabla: Clientes

CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Mail NVARCHAR(150),
    FechaNacimiento DATE
);

-- Tabla: MedioDePago

CREATE TABLE MediosDePago (
    IdMedioDePago  INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(100)
);

-- Tabla: Imágenes
CREATE TABLE Imagenes (
    IdImagen INT PRIMARY KEY IDENTITY(1,1),
    UrlImagen VARCHAR(max),
);

-- Tabla: Artículos

CREATE TABLE Articulos (
    IdArticulo INT PRIMARY KEY IDENTITY(1,1),
    IdCategoria INT,
    IdImagen INT,
    Nombre VARCHAR(150),
    Stock INT,
    Precio DECIMAL(10, 2),
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria),
    FOREIGN KEY (IdImagen) REFERENCES Imagenes(IdImagen)
);

---- Tabla: Formas de entrega

CREATE TABLE FormasDeEntrega (
    IdFormaDeEntrega INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(100)
);

-- Tabla: Ventas
CREATE TABLE Ventas (
    IdVenta INT PRIMARY KEY IDENTITY(1,1),
    IdCliente INT,
    IdFormaDeEntrega INT,
    IdMedioDePago INT,
	Fecha DATE, 
	MontoTotal DECIMAL(10, 2), 
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
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