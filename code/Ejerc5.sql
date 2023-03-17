SELECT 
    COALESCE(v.dia, s.dia) AS dia, 
    COALESCE(v.articulo, s.articulo) AS articulo, 
    COALESCE(v.local, s.local) AS local, 
    COALESCE(v.unidades_vendidas, 0) AS unidades_vendidas, 
    COALESCE(s.unidades_stock, 0) AS unidades_stock
FROM 
    Ventas v
    FULL OUTER JOIN Stock s 
        ON v.dia = s.dia 
        AND v.articulo = s.articulo 
        AND v.local = s.local
        ORDER BY dia, articulo, local;