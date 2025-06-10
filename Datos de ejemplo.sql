USE ECOMMERCEgrupo5;
GO

-- Roles de usuario
INSERT INTO Roles (Descripcion) VALUES 
('Administrador'),
('Cliente')

-- Usuarios de ejemplo
INSERT INTO Usuario (Nombre, Contraseña, Mail, IDRol) VALUES 
-- Administradores
('JuanAdmin', 'admin123', 'juan.admin@gmail.com', 1), 
('LauraAdmin', 'admin993', 'laura.admin@gmail.com', 1),
-- Clientes
('MariaCliente', 'compra123', 'maria.cliente@gmail.com', 2), 
('PedroCliente', 'compra993', 'pedro.cliente@gmail.com', 2);

--Insertar medios de pago
INSERT INTO MediosDePago (Descripcion) VALUES
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Transferencia');

--Insertar categorías de articulos de ejemplo
INSERT INTO Categorias (Descripcion) VALUES
('Electrónica'),
('Ropa'),
('Hogar'),
('Juguetes'),
('Deportes');

-- Insertar formas de entrega
INSERT INTO FormasDeEntrega (Descripcion) VALUES
('Retiro en tienda'),
('Envío a domicilio');

-- Insertar artículos de ejemplo
INSERT INTO Articulos (IdCategoria, Nombre, Stock, Precio, UrlImagen) VALUES
(1, 'Smartphone Samsung Galaxy', 20, 150000.00, 'https://ejemplo.com/img/samsung.jpg'),
(1, 'Notebook HP 15"', 10, 350000.00, 'https://ejemplo.com/img/hp15.jpg'),
(2, 'Remera Deportiva', 50, 8000.00, 'https://ejemplo.com/img/remera.jpg'),
(3, 'Lámpara LED', 30, 3500.00, 'https://ejemplo.com/img/lampara.jpg'),
(4, 'Muñeca Barbie', 40, 12000.00, 'https://ejemplo.com/img/barbie.jpg'),
(5, 'Pelota de fútbol', 25, 9000.00, 'https://ejemplo.com/img/pelota.jpg');

Select * from Usuario; 

-- Insertar ventas de ejemplo
INSERT INTO Ventas (IdUsuario, IdFormaDeEntrega, IdMedioDePago, Fecha, MontoTotal) VALUES
(3, 1, 1, '2024-06-01', 160000.00),
(3, 2, 2, '2024-08-02', 8000.00),
(4, 2, 3, '2025-03-03', 12000.00);

-- Insertar detalles de ventas de ejemplo
INSERT INTO DetalleVenta (IdVenta, IdArticulo, Cantidad, PrecioUnitario) VALUES
(1, 1, 1, 150000.00), -- Venta 1: Smartphone
(1, 3, 1, 8000.00),   -- Venta 1: Remera
(2, 3, 1, 8000.00),   -- Venta 2: Remera
(3, 5, 1, 12000.00);  -- Venta 3: Muñeca Barbie

