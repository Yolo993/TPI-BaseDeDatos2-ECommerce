-- Restricciones en las columnas

-- ARTICULOS

ALTER TABLE Articulos
ADD CONSTRAINT CHK_Articulos_Stock CHECK (Stock >= 0);
ALTER TABLE Articulos
ADD CONSTRAINT CHK_Articulos_Precio CHECK (Precio >= 0);

-- USUARIO
ALTER TABLE Usuario
ADD CONSTRAINT UQ_Usuario_Mail UNIQUE (Mail);

-- VENTAS
ALTER TABLE Ventas
ADD CONSTRAINT CHK_Ventas_MontoTotal CHECK (MontoTotal >= 0);

-- DETALLEVENTA
ALTER TABLE DetalleVenta
ADD CONSTRAINT CHK_DetalleVenta_Cantidad CHECK (Cantidad > 0);
ALTER TABLE DetalleVenta
ADD CONSTRAINT CHK_DetalleVenta_PrecioUnitario CHECK (PrecioUnitario >= 0);