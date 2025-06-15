USE ECOMMERCEgrupo5; 
GO

-- Procedimiento almacenado para agregar un usuario
CREATE PROCEDURE sp_Agregar_Usuario
-- Parametros a ingresar
@Nombre NVARCHAR(100),
@Contraseña NVARCHAR(100),
@Mail NVARCHAR(150),
@IDRol INT 
AS
BEGIN
    BEGIN TRY
        -- Verificar si ya hay un cliente con el mismo correo electrónico
        IF EXISTS (SELECT 1 FROM Usuario WHERE Mail = @Mail AND IDRol = @IDRol)
        BEGIN 
            RAISERROR('Un usuario con el mismo correo electrónico ya existe.',16,1);
        END
        ELSE BEGIN
            INSERT INTO Usuario (Nombre, Contraseña, Mail, IDRol)
            VALUES (@Nombre, @Contraseña, @Mail, @IDRol);
        END
    END TRY
    -- Manejo de errores
    BEGIN CATCH 
        THROW;
    END CATCH
END
GO

-- Procedimiento para obtener un reporte de todas las ventas por mes y año
CREATE PROCEDURE sp_Reporte_Ventas_Por_Mes_y_Anio
-- Parámetros a ingresar
@Anio INT,
@Mes INT
AS
BEGIN 
    BEGIN TRY
        -- Seleccionar todos los datos que vamos a mostrar en el reporte
        -- Uniendo las tablas Ventas, DetalleVenta, Articulos y MediosDePago
            SELECT 
            V.IdVenta,
            U.Mail AS Cliente,
            -- Todos los articulos que se encuentran en los DetalleVenta de la venta, apareceran como Articulos separados por coma
            STRING_AGG(A.Nombre, ', ') AS Articulos,
            MP.Descripcion AS MedioDePago,
            -- Se suma la cada articulo vendido y aparece la cantidad total de articulos vendidos 
            SUM(DV.Cantidad) AS TotalCantidad,
            V.MontoTotal,
            FE.Descripcion AS FormaDeEntrega,
            V.Fecha
            FROM Ventas V
            INNER JOIN DetalleVenta DV ON V.IdVenta = DV.IdVenta
            INNER JOIN FormasDeEntrega FE ON V.IdFormaDeEntrega = FE.IdFormaDeEntrega
            INNER JOIN Articulos A ON DV.IdArticulo = A.IdArticulo
            INNER JOIN MediosDePago MP ON V.IdMedioDePago = MP.IdMedioDePago
            INNER JOIN Usuario U ON V.IdUsuario = U.IDUsuario
            WHERE YEAR(V.Fecha) = @Anio
            AND MONTH(V.Fecha) = @Mes
            GROUP BY V.IdVenta, U.Mail, MP.Descripcion, V.MontoTotal, FE.Descripcion, V.Fecha
            ORDER BY V.Fecha, V.IdVenta;
    END TRY
    -- Manejo de errores
    BEGIN CATCH
        THROW;
    END CATCH
END 

