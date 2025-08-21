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