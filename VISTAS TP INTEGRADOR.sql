USE ECOMMERCEgrupo5;
GO

CREATE VIEW UnidadesVendidasArticuloMes AS
SELECT A.Nombre, SUM(DV.Cantidad) AS [Cantidad vendida]  FROM Articulos A
INNER JOIN DetalleVenta DV ON DV.IdArticulo = A.IdArticulo
INNER JOIN Ventas V ON DV.IdVenta = V.IdVenta
WHERE MONTH(V.Fecha) = MONTH(GETDATE()) AND YEAR(V.Fecha) = YEAR(GETDATE())
GROUP BY A.Nombre;
GO

CREATE VIEW FacturacionPorMedioPago AS
SELECT MP.Descripcion as [Medio de Pago] , SUM(V.MontoTotal) as [Total Facturado] FROM Ventas V
INNER JOIN MediosDePago MP ON V.IdMedioDePago = MP.IdMedioDePago
WHERE MONTH(V.Fecha) = 2 AND YEAR(V.Fecha) = YEAR(GETDATE())
GROUP BY MP.Descripcion; 
GO

CREATE VIEW FacturacionArticuloMes AS
SELECT A.Nombre, SUM(DV.Cantidad * DV.PrecioUnitario) AS [Total Facturado]  FROM Articulos A
INNER JOIN DetalleVenta DV ON DV.IdArticulo = A.IdArticulo
INNER JOIN Ventas V ON DV.IdVenta = V.IdVenta
WHERE MONTH(V.Fecha) = MONTH(GETDATE()) AND YEAR(V.Fecha) = YEAR(GETDATE())
GROUP BY A.Nombre;
GO 

CREATE VIEW ConsumoPorCliente AS 
SELECT CONCAT(U.Apellido, ' ',U.Nombre) as 'Cliente', SUM(DV.Cantidad) AS [Cantidad de Articulos Comprados], SUM(V.MontoTotal) as [Monto Total] FROM Usuario U
INNER JOIN Ventas V ON U.IDUsuario = V.IdUsuario
INNER JOIN DetalleVenta DV ON V.IdVenta = DV.IdVenta
WHERE U.IDRol = 2 -- Solo usuarios con rol Cliente
GROUP BY CONCAT(U.Apellido, ' ',U.Nombre)
GO


SELECT * FROM UnidadesVendidasArticuloMes vista
ORDER BY vista.[Cantidad vendida] DESC 

SELECT * FROM FacturacionPorMedioPago vista
ORDER BY vista.[Total Facturado] DESC

SELECT * FROM FacturacionArticuloMes vista
ORDER BY vista.[Total Facturado] DESC

SELECT * FROM ConsumoPorCliente vista
ORDER BY vista.[Cantidad de Articulos Comprados] ASC