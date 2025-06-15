USE ECOMMERCEgrupo5;
GO

-- Trigger para actualizar el stock de los articulos cada vez que se hace un insert en DetalleVenta
CREATE TRIGGER tr_Actualizar_Stock_Al_Agregar
ON DetalleVenta
AFTER INSERT
AS
BEGIN
    BEGIN TRY
    -- Cuando se agrega un registro de DetalleVenta, se resta la cantidad asignada en ese registro al stock del artículo correspondiente
        UPDATE A
        SET A.Stock = A.Stock - I.Cantidad
        FROM Articulos A
        -- Se utiliza la tabla inserted que viene implementada en SQL para obtener los datos del registro recién insertado
        INNER JOIN inserted I ON A.IdArticulo = I.IdArticulo;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO


-- Trigger para actualizar el stock de los articulos cada vez que se hace un delete en DetalleVenta
CREATE TRIGGER tr_Actualizar_Stock_Al_Eliminar
ON DetalleVenta
AFTER DELETE
AS
BEGIN
    BEGIN TRY 
    -- Cuando se elimina un registro de DetalleVenta, se suma la cantidad que tenía ese registro al stock del artículo correspondiente
        UPDATE A
        SET A.Stock = A.Stock + D.Cantidad
        FROM Articulos A
        INNER JOIN deleted D ON A.IdArticulo = D.IdArticulo;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO



-- Trigger para actualizar el MontoTotal de la venta al agregar un DetalleVenta
CREATE TRIGGER tr_Actualizar_MontoTotal_Al_Agregar
ON DetalleVenta
AFTER INSERT
AS
BEGIN
    BEGIN TRY
        -- Actualiza el MontoTotal cada vez que se inserta un nuevo detalle de venta
        UPDATE V
        SET V.MontoTotal = (
            SELECT SUM(DV.Cantidad * DV.PrecioUnitario)
            FROM DetalleVenta DV
            WHERE DV.IdVenta = V.IdVenta
        )
        FROM Ventas V
        INNER JOIN inserted I ON V.IdVenta = I.IdVenta;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Trigger para actualizar el MontoTotal de la venta al eliminar un DetalleVenta
CREATE TRIGGER tr_Actualizar_MontoTotal_Al_Eliminar
ON DetalleVenta
AFTER DELETE
AS
BEGIN
    BEGIN TRY
        -- Actualiza el MontoTotal cada vez que se elimina un detalle de venta
        UPDATE V
        SET V.MontoTotal = (
            SELECT SUM(DV.Cantidad * DV.PrecioUnitario)
            FROM DetalleVenta DV
            WHERE DV.IdVenta = V.IdVenta
        )
        FROM Ventas V
        INNER JOIN deleted D ON V.IdVenta = D.IdVenta;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Trigger para actualizar el MontoTotal de la venta al modificar un DetalleVenta
CREATE TRIGGER tr_Actualizar_MontoTotal_Al_Modificar
ON DetalleVenta
AFTER UPDATE
AS
BEGIN
    BEGIN TRY
        -- Actualiza el MontoTotal cada vez que se actualiza un detalle de venta
        UPDATE V
        SET V.MontoTotal = (
            SELECT SUM(DV.Cantidad * DV.PrecioUnitario)
            FROM DetalleVenta DV
            WHERE DV.IdVenta = V.IdVenta
        )
        FROM Ventas V
        INNER JOIN inserted I ON V.IdVenta = I.IdVenta;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END

SELECT * FROM DetalleVenta;

SELECT * FROM Ventas;

UPDATE DetalleVenta SET Cantidad = 3 WHERE IdVenta = 2 AND IdArticulo = 1;