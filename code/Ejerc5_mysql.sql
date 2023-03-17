
SELECT Ventas.dia, Ventas.articulo, Ventas.local, COALESCE(Ventas.unidades_vendidas, 0) AS unidades_vendidas, COALESCE(Stock.unidades_stock, 0) AS unidades_stock
FROM Ventas 
LEFT JOIN Stock ON Ventas.dia = Stock.dia AND Ventas.articulo = Stock.articulo AND Ventas.local = Stock.local
UNION
SELECT Stock.dia, Stock.articulo, Stock.local, COALESCE(Ventas.unidades_vendidas, 0) AS unidades_vendidas, COALESCE(Stock.unidades_stock, 0) AS unidades_stock
FROM Stock 
LEFT JOIN Ventas ON Stock.dia = Ventas.dia AND Stock.articulo = Ventas.articulo AND Stock.local = Ventas.local
WHERE Ventas.dia IS NULL;
