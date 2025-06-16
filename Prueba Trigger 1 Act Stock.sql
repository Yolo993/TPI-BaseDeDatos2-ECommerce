INSERT INTO Categorias (Descripcion)
VALUES ('Tecnología');

INSERT INTO Articulos (IdCategoria, Nombre, Stock, Precio, UrlImagen)
VALUES (1, 'Mouse Gamer', 10, 5000.00, 'https://ejemplo.com/mouse.jpg');

INSERT INTO Roles (Descripcion)
VALUES ('Cliente');

INSERT INTO Usuario (Nombre, Contraseña, Mail, IDRol)
VALUES ('PruebaUser', 'clave123', 'prueba@mail.com', 1);

INSERT INTO FormasDeEntrega (Descripcion)
VALUES ('Retiro en tienda');

INSERT INTO MediosDePago (Descripcion)
VALUES ('Efectivo');

INSERT INTO Ventas (IdUsuario, IdFormaDeEntrega, IdMedioDePago, Fecha, MontoTotal)
VALUES (1, 1, 1, GETDATE(), 5000.00);

INSERT INTO DetalleVenta (IdVenta, IdArticulo, Cantidad, PrecioUnitario)
VALUES (1, 1, 2, 5000.00);

SELECT Nombre, Stock
FROM Articulos
WHERE IdArticulo = 1;
