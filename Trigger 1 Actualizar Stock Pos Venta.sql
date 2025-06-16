CREATE TRIGGER TRG_ActualizarStock_PosVenta
ON DetalleVenta
AFTER INSERT
AS
BEGIN
    UPDATE A
    SET A.Stock = A.Stock - I.Cantidad
    FROM Articulos A
    INNER JOIN INSERTED I ON A.IdArticulo = I.IdArticulo
END;
