SELECT 
  día, 
  artículo, 
  local, 
  MAX(fecha_pronóstico) AS fecha_pronóstico
FROM 
  pronósticos_de_ventas 
WHERE 
  fecha_pronóstico <= día
GROUP BY 
  día, 
  artículo, 
  local;