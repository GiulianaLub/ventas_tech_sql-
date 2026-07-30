--Consulta1-vista base del proyecto (INNER JOIN)
SELECT
    v.fecha_venta AS fecha,
    c.nombre_cliente AS nombre_del_Cliente,
    c.segmento AS segmento,
    t.region AS region,
    p.nombre_producto AS nombre_del_producto,
    p.categoria AS categoria,
    v.cantidad AS cantidad,
    v.precio_unitario AS precio_unitario,
    v.total_venta AS total_de_venta,
    v.canal AS canal
FROM dbo.ventas AS v
INNER JOIN dbo.clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN dbo.productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN dbo.territorio AS t
    ON c.id_territorio = t.id_territorio;

--Consulta 2 clientes sin ventas (LEFT JOIN) 
SELECT 
c.nombre_cliente,
c.email,
c.fecha_registro
FROM dbo.clientes AS c
LEFT JOIN dbo.ventas AS v 
ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;

--Consulta 3 — Productos sin ventas (LEFT JOIN) 
SELECT
p.nombre_producto,
p.categoria,
p.precio
FROM dbo.productos AS p
LEFT JOIN dbo.ventas AS v
ON p.id_producto = v.id_producto
WHERE v.id_producto IS NULL;

--Consulta 4 — Consolidado por canal (UNION ALL)
SELECT
canal,
SUM(total_venta) AS total_por_canal
FROM
(
  SELECT
   total_venta,
   'Online' AS canal
    FROM ventas
    WHERE canal = 'Online'

    UNION ALL

   SELECT
    total_venta,
    'Presencial' AS canal
    FROM ventas
    WHERE canal = 'Presencial'
) AS Consolidado
GROUP BY canal;