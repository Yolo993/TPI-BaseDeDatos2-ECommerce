
CREATE VIEW UnidadesVendidasArticuloMes AS
SELECT A.Nombre, SUM(DV.Cantidad) AS 'Cantidad vendida'  FROM Articulos A
INNER JOIN DetalleVenta DV ON DV.IdArticulo = A.IdArticulo
INNER JOIN Ventas V ON DV.IdVenta = V.IdVenta
WHERE MONTH(V.Fecha) = MONTH(GETDATE()) AND YEAR(V.Fecha) = YEAR(GETDATE())
GROUP BY A.Nombre;

SELECT * FROM UnidadesVendidasArticuloMes vista
ORDER BY vista.[Cantidad vendida] DESC 

CREATE VIEW FacturacionPorMedioPago AS
SELECT MP.Descripcion as 'Medio de Pago' , SUM(V.MontoTotal) as 'Total Facturado' FROM Ventas V
INNER JOIN MediosDePago MP ON V.IdMedioDePago = MP.IdMedioDePago
WHERE MONTH(V.Fecha) = 2 AND YEAR(V.Fecha) = YEAR(GETDATE())
GROUP BY MP.Descripcion; 

SELECT * FROM FacturacionPorMedioPago vista
ORDER BY vista.[Total Facturado] DESC

CREATE VIEW FacturacionArticuloMes AS
SELECT A.Nombre, SUM(DV.Cantidad * DV.PrecioUnitario) AS 'Total Facturado'  FROM Articulos A
INNER JOIN DetalleVenta DV ON DV.IdArticulo = A.IdArticulo
INNER JOIN Ventas V ON DV.IdVenta = V.IdVenta
WHERE MONTH(V.Fecha) = MONTH(GETDATE()) AND YEAR(V.Fecha) = YEAR(GETDATE())
GROUP BY A.Nombre;

SELECT * FROM FacturacionArticuloMes vista
ORDER BY vista.[Total Facturado] DESC

CREATE VIEW ConsumoPorCliente AS 
SELECT CONCAT(C.Apellido, ' ',C.Nombre) as 'Cliente', SUM(DV.Cantidad) AS ' Cantidad de Articulos Comprados', SUM(V.MontoTotal) as 'Monto Total' FROM Clientes C
INNER JOIN Ventas V ON C.IdCliente = V.IdCliente
INNER JOIN DetalleVenta DV ON V.IdVenta = DV.IdVenta
GROUP BY CONCAT(C.Apellido, ' ',C.Nombre)

SELECT * FROM ConsumoPorCliente vista
ORDER BY vista.[Cantidad de Articulos Comprados] ASC

