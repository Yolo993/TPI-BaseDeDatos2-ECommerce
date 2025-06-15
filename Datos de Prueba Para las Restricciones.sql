-- PRUEBAS RESTRICCIONES: CORRECTAS PRIMERO

INSERT INTO Categorias (Descripcion)
VALUES ('Electrónica');

INSERT INTO Articulos (IdCategoria, Nombre, Stock, Precio, UrlImagen)
VALUES (1, 'Auriculares Bluetooth', 10, 2500.50, 'https://ejemplo.com/auriculares.jpg');

INSERT INTO Roles (Descripcion)
VALUES ('Cliente');

INSERT INTO Usuario (Nombre, Contraseña, Mail, IDRol)
VALUES ('Leonardo', '123456', 'leo@mail.com', 1);

INSERT INTO FormasDeEntrega (Descripcion)
VALUES ('Envío a domicilio');

INSERT INTO MediosDePago (Descripcion)
VALUES ('Tarjeta de crédito');

INSERT INTO Ventas (IdUsuario, IdFormaDeEntrega, IdMedioDePago, Fecha, MontoTotal)
VALUES (1, 1, 1, '2024-06-15', 2500.50);

INSERT INTO DetalleVenta (IdVenta, IdArticulo, Cantidad, PrecioUnitario)
VALUES (1, 1, 1, 2500.50);

-- PRUEBAS RESTRICCIONES: INCORRECTAS 

INSERT INTO Articulos (IdCategoria, Nombre, Stock, Precio, UrlImagen)
VALUES (1, 'Artículo con stock negativo', -1, 100.00, 'https://ejemplo.com/error.jpg');

INSERT INTO Articulos (IdCategoria, Nombre, Stock, Precio, UrlImagen)
VALUES (1, 'Artículo con precio negativo', 5, -100.00, 'https://ejemplo.com/error.jpg');

INSERT INTO Usuario (Nombre, Contraseña, Mail, IDRol)
VALUES ('Otro Leo', '123456', 'leo@mail.com', 1);

INSERT INTO Ventas (IdUsuario, IdFormaDeEntrega, IdMedioDePago, Fecha, MontoTotal)
VALUES (1, 1, 1, '2024-06-15', -500.00);

INSERT INTO DetalleVenta (IdVenta, IdArticulo, Cantidad, PrecioUnitario)
VALUES (1, 1, 0, 200.00);

INSERT INTO DetalleVenta (IdVenta, IdArticulo, Cantidad, PrecioUnitario)
VALUES (1, 1, 1, -200.00);

