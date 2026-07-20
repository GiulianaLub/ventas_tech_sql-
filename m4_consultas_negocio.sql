

 --Consulta1-Resumen ejecutivo mensual
SELECT
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
COUNT(*) AS cantidad_pedidos,
AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

--Consulta2- Ranking de productos 
SELECT TOP 5
id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

--Consulta3- Clientes recurrentes
SELECT
id_cliente,
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

--Consulta 4 — Meses por encima/por debajo del promedio
SELECT
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
CASE
WHEN SUM(cantidad * precio_unitario) >
(
SELECT AVG(total_mes)
 FROM
(
SELECT SUM(cantidad * precio_unitario) AS total_mes
FROM ventas
GROUP BY MONTH(fecha_venta)
) AS promedio
)
THEN 'Por encima'
ELSE 'Por debajo'
END AS comparacion
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

--Hallasgos 
--El producto 2 es el producto mas vendido, observandose una clara preferencia por el mismo, que registró mas de tres veces las ventas que el segundo producto mas vendido con 4 unidades 
--El poducto 1 es el que arrojó mas total generado concentrando cerca del 60% de la facturacion total 
--Aunque todos los clientes recurrentes realizaron la misma cantidad ded pedidos (2), el cliente 1 fue el que mas dinero gastó ,alcanzando un total de $2640.