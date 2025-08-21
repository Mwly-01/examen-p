-- Active: 1755090228603@@127.0.0.1@5433@miscompras@examen

--Ejercicio 1
    SELECT * ,'$' || TO_CHAR(precio_venta, 'FM999G999G999D00') AS precio_formateado
    FROM productos
    WHERE cantidad_stock < 5 

--Ejercicio 2
    SELECT 
        DATE_TRUNC('month', co.fecha) AS mes,
        COUNT(DISTINCT co.id_compra) AS num_compras,
        SUM(cp.total) AS total_ventas
    FROM compras co
    JOIN compras_productos cp USING (id_compra)
    WHERE cp.estado = 1
    GROUP BY DATE_TRUNC('month', co.fecha)
    ORDER BY mes;

--Ejercicio 3
    SELECT 
    c.nombre ||' ' ||  c.apellidos AS nombre_completo_cliente,
    SUM(cp.total) AS gasto_total,
    RANK() OVER (ORDER BY SUM(cp.total) DESC) AS ranking_gasto
FROM clientes c
JOIN compras co USING (id_cliente)
JOIN compras_productos cp USING (id_compra)
WHERE cp.estado = 1
GROUP BY c.id, c.nombre, c.apellidos
ORDER BY gasto_total DESC;

SELECT cl.id, cl.nombre, cl.apellidos, COUNT(c.id_compra) AS cantidad_compras
FROM examen.clientes cl
JOIN examen.compras c ON cl.id = c.id_cliente
GROUP BY cl.id, cl.nombre, cl.apellidos
ORDER BY cantidad_compras DESC
LIMIT 1;

SELECT p.id_producto, p.nombre, SUM(cp.cantidad) AS total_vendido
FROM examen.productos p
JOIN examen.compras_productos cp ON p.id_producto = cp.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY total_vendido DESC;

SELECT c.id_compra, c.fecha, cl.nombre || ' ' || cl.apellidos AS cliente, SUM(cp.total) AS total_compra
FROM examen.compras c
JOIN examen.compras_productos cp ON c.id_compra = cp.id_compra
JOIN examen.clientes cl ON c.id_cliente = cl.id
WHERE c.fecha BETWEEN '2025-07-01' AND '2025-07-31'
GROUP BY c.id_compra, c.fecha, cliente
ORDER BY c.fecha;

SELECT cl.id, cl.nombre, cl.apellidos
FROM examen.clientes cl
LEFT JOIN examen.compras c ON cl.id = c.id_cliente 
    AND c.fecha >= CURRENT_DATE - INTERVAL '6 months'
WHERE c.id_compra IS NULL;