Yarith Meliza Ardila Gonzalez
karala441563
En línea

Yarith Meliza Ardila Gonzalez — 4/8/25, 15:38
<?php
$apiUrl = 'http://localhost:8081/caracteristicas_cafe';
$username = "Adrian@gmail.com";
$password = "soylacontra";
$variedades = [];
$error = null;
Expandir
message.txt
48 KB
/* Reset y configuración base */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
Expandir
message.txt
19 KB
Juan David Jaimes Miranda — 5/8/25, 8:09
HOlaa
<?php
require_once 'auth.php';

// Verificar autenticación
if (!isAuthenticated()) {
    header('Location: index.php?error=unauthorized');
Expandir
adminadd.php
32 KB
<?php
require_once 'auth.php';

// Verificar autenticación
if (!isAuthenticated()) {
    header('Location: index.php?error=unauthorized');
Expandir
coneccion.php
32 KB
<?php
session_start();

// Configuración de la base de datos (ajusta según tu configuración)
define('DB_HOST', 'localhost');
define('DB_NAME', 'cafe_catalog');
Expandir
auth.php
12 KB
<?php

// Incluir el sistema de autenticación
require_once 'auth.php';

// Verificar si ya está autenticado y redirigir
Expandir
index.php
22 KB
// Variables globales
const btnEnter = document.getElementById('btnEnter');
const loginOptions = document.getElementById('loginOptions');
const overlay = document.getElementById('overlay');
const cafeCatalog = document.getElementById('cafeCatalog');
const btnBack = document.getElementById('btnBack');
Expandir
pagina_admi.js
40 KB
Juan David Jaimes Miranda — 5/8/25, 8:17
😛
// ===========================================
// SCRIPT PARA GENERAR PDF DEL CATÁLOGO DE CAFÉ
// ===========================================

// Función para generar PDF con todas las variedades de café
function generateCoffeePDF() {
Expandir
message.txt
21 KB
Juan David Jaimes Miranda — 5/8/25, 8:33
😄
// ===========================================
// SCRIPT PARA GENERAR PDF DEL CATÁLOGO DE CAFÉ
// ===========================================

// Función para generar PDF con todas las variedades de café
function generateCoffeePDF() {
Expandir
message.txt
21 KB
Juan David Jaimes Miranda — 5/8/25, 11:20
// Variables globales
const btnEnter = document.getElementById('btnEnter');
const loginOptions = document.getElementById('loginOptions');
const overlay = document.getElementById('overlay');
const cafeCatalog = document.getElementById('cafeCatalog');
const btnBack = document.getElementById('btnBack');
Expandir
message.txt
41 KB
<?php
$apiUrl = 'http://localhost:8081/caracteristicas_cafe';
$username = "Adrian@gmail.com";
$password = "soylacontra";
$variedades = [];
$error = null;... (Tiempo restante: 1 KB)
Expandir
message.txt
51 KB
Yarith Meliza Ardila Gonzalez — 6/8/25, 7:31
oe juan yo estoy aca en los puff si me toca ami me avisas y si no llego a ir perdon estoy peleando con mi mama 
Juan David Jaimes Miranda — 11/8/25, 9:18
<?php

declare(strict_types=1);

namespace App\Application\Dtos\Plant;

use App\Application\Dtos\Contracts\ArraySerializableDto;
use Respect\Validation\Exceptions\NestedValidationException;
use Respect\Validation\Validator as v;

class PlantDto implements ArraySerializableDto
{

    /
     
@param array $args*/
  public function __construct(private readonly array $args){$this->validate();}

    /
     
@throws InvalidArgumentException*/
  private function validate(){
      try {v::stringType()->length(min: 2, max: 50)->setName('nombre')->assert($this->args['nombre']);v::stringType()->length(min: 2, max: 50)->setName('familia')->assert($this->args['familia']);v::stringType()->length(min: 2, max: 50)->setName('categoria')->assert($this->args['categoria']);} catch (NestedValidationException $e) {
          throw new \InvalidArgumentException($e->getFullMessage());}}

    /**
     
@return array*/
  public function toArray(): array{
      return ['nombre' => htmlspecialchars($this->args['nombre']),'familia' => htmlspecialchars($this->args['familia']),'categoria' => htmlspecialchars($this->args['categoria']),];}
}
<?php

declare(strict_types=1);

namespace App\Application\Dtos\Plant;
Expandir
PlantDto.php
2 KB
Juan David Jaimes Miranda — 13/8/25, 8:57
# PostgreSQL con Docker

# Creación del Contenedor

```bash
docker run -d --name=postgres_container -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=campus -p 5433:5432 -v pgdata:/var/lib/postgresql/data --restart=unless-stopped postgres:15
Expandir
PostgreSQL_I.md
1 KB
Yarith Meliza Ardila Gonzalez — 14/8/25, 6:46
oeeeeeeeeeeeeeeee
pasame lo que estamos copiando plis
Juan David Jaimes Miranda — 14/8/25, 6:49
ya va
Yarith Meliza Ardila Gonzalez — 14/8/25, 6:49
okis
Juan David Jaimes Miranda — 14/8/25, 6:50
# PostgreSQL con Docker

# Creación del Contenedor

```bash
docker run -d --name=postgres_container -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=campus -p 5433:5432 -v pgdata:/var/lib/postgresql/data --restart=unless-stopped postgres:15
Expandir
PostgreSQL_I.md
2 KB
Yarith Meliza Ardila Gonzalez — 14/8/25, 7:50
juan me lo podes volver a pasar se me quedo algo mal que ets aarriba me podes pasar todo plis
Yarith Meliza Ardila Gonzalez — 14/8/25, 8:01
.
.
.
.
.
.
.
.
.
.
.
.,
.
.
Juan David Jaimes Miranda — 14/8/25, 8:01
# **PostgreSQL con Docker**

<br>

# **Creación del Contenedor**
Expandir
PostgreSQL_I.md
4 KB
Yarith Meliza Ardila Gonzalez — 14/8/25, 8:01
.grax
Juan David Jaimes Miranda — 14/8/25, 8:01
uyaaaaaaa
Yarith Meliza Ardila Gonzalez — 14/8/25, 8:01
jsjjssssssss
Yarith Meliza Ardila Gonzalez — 15/8/25, 6:38
juannnnnnnnnn
me puedes adelantar se me olvido hacer lo de ayer 
jhsjsjsjjss
Juan David Jaimes Miranda — 15/8/25, 6:56
# **PostgreSQL con Docker**

<br>

# **Creación del Contenedor**
Expandir
PostgreSQL_I.md
5 KB
Juan David Jaimes Miranda — 19/8/25, 6:37
-- Active: 1755602492862@@127.0.0.1@5433@miscompras

-- Database configuration

\l;
Expandir
DDL.sql
3 KB
-- Active: 1755602492862@@127.0.0.1@5433@miscompras

-- Inserts

INSERT INTO clientes(id, nombre, apellidos, celular, direccion, correo_electronico)
VALUES
Expandir
DML.sql
2 KB
Yarith Meliza Ardila Gonzalez — 19/8/25, 7:52
Funciones y Operadores  - SELECT
Top 10 productos màs vendidos (unidades) y su  ingreso total 
SUM()
USING
SELECT p.id_producto, p.nombre,
   SUM(cp.cantidad) AS unidades
   SUM (cp.total) AS ingreso total
FROM miscompras.compras_productos cp 
JOIN miscompras.productos p  USING(id_producto)
GROUP BY p.id_producto, p.nombre
ORDER BY unidades DESC
LIMIT 10;
Venta promedio por compra y mediana aproximada-PERCENTILE_CONT(..) WITH GROUP (ORDER BY ..)-ROUND-USING

    
    SELECT ROUND(AVG(t.total_compra), 2) AS promedio_compra,
    PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY t.total_compra) AS mediana 
    FROM (
        SELECT c.id_compra, SUM(cp.total) as total_compra 
        FROM miscompras.compras c 
        JOIN miscompras.compras_productos cp USING(id_compra)
        GROUP BY c.id_compra 
        )t;
    


compra por cliente y ranking-COUNT-SUM-RANK() OVER(ORDER BY... ASC/DESC) ASC/DESC

    
    SELECT cl.id, cl.nombre || ' ' || cl.apellidos AS cliente,
           COUNT(DISTINCT c.id_compra) AS compras,
           SUM(cp.total) AS gasto_total,
           RANK() OVER(ORDER BY SUM(cp.total) DESC) AS ranking_gasto
    FROM miscompras.clientes cl
    JOIN miscompras.compras c ON cl.id = c.id_cliente
    JOIN miscompras.compras_productos cp USING(id_compra)
    GROUP BY cl.id, cliente
    ORDER BY ranking_gasto;
    
Yarith Meliza Ardila Gonzalez — 6:17
-- 1. Obtén el “Top 10” de productos por unidades vendidas y su ingreso total, usando `JOIN ... USING`, agregación con `SUM()`, agrupación con `GROUP BY`, ordenamiento descendente con `ORDER BY` y paginado con `LIMIT`.

SELECT 
    p.nombre,
    SUM(cp.cantidad) AS unidades_vendidas,
    SUM(cp.total) AS ingreso_total
FROM productos p
JOIN compras_productos cp USING (id_producto)
WHERE cp.estado = 1
GROUP BY p.id_producto, p.nombre
ORDER BY unidades_vendidas DESC
LIMIT 10;

-- 2. Calcula el total pagado promedio por compra y la mediana aproximada usando una subconsulta agregada y la función de ventana ordenada `PERCENTILE_CONT(...) WITHIN GROUP`, además de `AVG()` y `ROUND()` para formateo.

SELECT 
    ROUND(AVG(total_compra), 2) AS promedio_por_compra,
    ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_compra), 2) AS mediana_por_compra
FROM (
    SELECT 
        id_compra,
        SUM(total) AS total_compra
    FROM compras_productos
    WHERE estado = 1
    GROUP BY id_compra
) AS totales_compra;

-- 3. Lista compras por cliente con gasto total y un ranking global de gasto empleando funciones de ventana (`RANK() OVER (ORDER BY SUM(...) DESC)`), concatenación de texto y `COUNT(DISTINCT ...)`.

SELECT 
    c.nombre || ' ' || c.apellidos AS cliente_completo,
    COUNT(DISTINCT co.id_compra) AS num_compras,
    SUM(cp.total) AS gasto_total,
    RANK() OVER (ORDER BY SUM(cp.total) DESC) AS ranking_gasto
FROM clientes c
JOIN compras co USING (id_cliente)
JOIN compras_productos cp USING (id_compra)
WHERE cp.estado = 1
GROUP BY c.id, c.nombre, c.apellidos
ORDER BY gasto_total DESC;

-- 4. Calcula por día el número de compras, ticket promedio y total, usando un `CTE (WITH) o (Common Table Expression)“subconsulta con nombre”`, conversión de `fecha ::date`, y agregaciones (`COUNT, AVG, SUM`) con `ORDER BY`.

    WITH ventas_diarias AS (
        SELECT 
            co.fecha::date AS dia,
            co.id_compra,
            SUM(cp.total) AS total_compra
        FROM compras co
        JOIN compras_productos cp USING (id_compra)
        WHERE cp.estado = 1
        GROUP BY co.fecha::date, co.id_compra
    )
    SELECT 
        dia,
        COUNT(id_compra) AS num_compras,
        ROUND(AVG(total_compra), 2) AS ticket_promedio,
        SUM(total_compra) AS total_dia
    FROM ventas_diarias
    GROUP BY dia
    ORDER BY dia;

-- 5. Realiza una búsqueda estilo e-commerce de productos activos y con stock cuyo nombre empiece por “caf”, usando filtros en `WHERE`, comparación numérica y búsqueda case-insensitive con `ILIKE 'caf%'`.

    SELECT 
        nombre,
        precio_venta,
        cantidad_stock
    FROM productos
    WHERE estado = 1 
        AND cantidad_stock > 0
        AND nombre ILIKE 'caf%'
    ORDER BY precio_venta DESC;

-- 6. Devuelve los productos con el precio formateado como texto monetario usando concatenación `('||')` y `TO_CHAR(numeric, 'FM999G999G999D00')`, ordenando de mayor a menor precio.

    SELECT 
    nombre,
    '$' || TO_CHAR(precio_venta, 'FM999G999G999D00') AS precio_formateado
    FROM productos
    WHERE estado = 1
    ORDER BY precio_venta DESC;

-- 7. Arma el “resumen de canasta” por compra: subtotal, `IVA al 19%` y total con IVA, mediante `SUM()` y `ROUND()` sobre el total por ítem, agrupado por compra.

    SELECT 
        id_compra,
        SUM(total) AS subtotal,
        ROUND(SUM(total) * 0.19, 2) AS iva_19_porciento,
        ROUND(SUM(total) * 1.19, 2) AS total_con_iva
    FROM compras_productos
    WHERE estado = 1
    GROUP BY id_compra
    ORDER BY id_compra;
-- 7. Arma el “resumen de canasta” por compra: subtotal, `IVA al 19%` y total con IVA, mediante `SUM()` y `ROUND()` sobre el total por ítem, agrupado por compra.
    SELECT 
        id_compra,
        SUM(total) AS subtotal,
        ROUND(SUM(total) * 0.19, 2) AS iva_19_porciento,
        ROUND(SUM(total) * 1.19, 2) AS total_con_iva
... (280 líneas restantes)
Contraer
message.txt
15 KB
﻿
Juan David Jaimes Miranda
juanchuchu001
 
 
-- 1. Obtén el “Top 10” de productos por unidades vendidas y su ingreso total, usando `JOIN ... USING`, agregación con `SUM()`, agrupación con `GROUP BY`, ordenamiento descendente con `ORDER BY` y paginado con `LIMIT`.

SELECT 
    p.nombre,
    SUM(cp.cantidad) AS unidades_vendidas,
    SUM(cp.total) AS ingreso_total
FROM productos p
JOIN compras_productos cp USING (id_producto)
WHERE cp.estado = 1
GROUP BY p.id_producto, p.nombre
ORDER BY unidades_vendidas DESC
LIMIT 10;

-- 2. Calcula el total pagado promedio por compra y la mediana aproximada usando una subconsulta agregada y la función de ventana ordenada `PERCENTILE_CONT(...) WITHIN GROUP`, además de `AVG()` y `ROUND()` para formateo.

SELECT 
    ROUND(AVG(total_compra), 2) AS promedio_por_compra,
    ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_compra), 2) AS mediana_por_compra
FROM (
    SELECT 
        id_compra,
        SUM(total) AS total_compra
    FROM compras_productos
    WHERE estado = 1
    GROUP BY id_compra
) AS totales_compra;

-- 3. Lista compras por cliente con gasto total y un ranking global de gasto empleando funciones de ventana (`RANK() OVER (ORDER BY SUM(...) DESC)`), concatenación de texto y `COUNT(DISTINCT ...)`.

SELECT 
    c.nombre || ' ' || c.apellidos AS cliente_completo,
    COUNT(DISTINCT co.id_compra) AS num_compras,
    SUM(cp.total) AS gasto_total,
    RANK() OVER (ORDER BY SUM(cp.total) DESC) AS ranking_gasto
FROM clientes c
JOIN compras co USING (id_cliente)
JOIN compras_productos cp USING (id_compra)
WHERE cp.estado = 1
GROUP BY c.id, c.nombre, c.apellidos
ORDER BY gasto_total DESC;

-- 4. Calcula por día el número de compras, ticket promedio y total, usando un `CTE (WITH) o (Common Table Expression)“subconsulta con nombre”`, conversión de `fecha ::date`, y agregaciones (`COUNT, AVG, SUM`) con `ORDER BY`.

    WITH ventas_diarias AS (
        SELECT 
            co.fecha::date AS dia,
            co.id_compra,
            SUM(cp.total) AS total_compra
        FROM compras co
        JOIN compras_productos cp USING (id_compra)
        WHERE cp.estado = 1
        GROUP BY co.fecha::date, co.id_compra
    )
    SELECT 
        dia,
        COUNT(id_compra) AS num_compras,
        ROUND(AVG(total_compra), 2) AS ticket_promedio,
        SUM(total_compra) AS total_dia
    FROM ventas_diarias
    GROUP BY dia
    ORDER BY dia;

-- 5. Realiza una búsqueda estilo e-commerce de productos activos y con stock cuyo nombre empiece por “caf”, usando filtros en `WHERE`, comparación numérica y búsqueda case-insensitive con `ILIKE 'caf%'`.

    SELECT 
        nombre,
        precio_venta,
        cantidad_stock
    FROM productos
    WHERE estado = 1 
        AND cantidad_stock > 0
        AND nombre ILIKE 'caf%'
    ORDER BY precio_venta DESC;

-- 6. Devuelve los productos con el precio formateado como texto monetario usando concatenación `('||')` y `TO_CHAR(numeric, 'FM999G999G999D00')`, ordenando de mayor a menor precio.

    SELECT 
    nombre,
    '$' || TO_CHAR(precio_venta, 'FM999G999G999D00') AS precio_formateado
    FROM productos
    WHERE estado = 1
    ORDER BY precio_venta DESC;

-- 7. Arma el “resumen de canasta” por compra: subtotal, `IVA al 19%` y total con IVA, mediante `SUM()` y `ROUND()` sobre el total por ítem, agrupado por compra.

    SELECT 
        id_compra,
        SUM(total) AS subtotal,
        ROUND(SUM(total) * 0.19, 2) AS iva_19_porciento,
        ROUND(SUM(total) * 1.19, 2) AS total_con_iva
    FROM compras_productos
    WHERE estado = 1
    GROUP BY id_compra
    ORDER BY id_compra;
-- 7. Arma el “resumen de canasta” por compra: subtotal, `IVA al 19%` y total con IVA, mediante `SUM()` y `ROUND()` sobre el total por ítem, agrupado por compra.
    SELECT 
        id_compra,
        SUM(total) AS subtotal,
        ROUND(SUM(total) * 0.19, 2) AS iva_19_porciento,
        ROUND(SUM(total) * 1.19, 2) AS total_con_iva
    FROM compras_productos
    WHERE estado = 1
    GROUP BY id_compra
    ORDER BY id_compra;
-- 8. Calcula la participación (%) de cada categoría en las ventas usando agregaciones por categoría y una ventana sobre el total (`SUM(SUM(total)) OVER ()`), más `ROUND()` para el porcentaje.
    SELECT 
    cat.descripcion AS categoria,
    SUM(cp.total) AS ventas_categoria,
    ROUND(
        SUM(cp.total) * 100.0 / SUM(SUM(cp.total)) OVER (), 
        2
    ) AS participacion_porcentaje
FROM categorias cat
JOIN productos p USING (id_categoria)
JOIN compras_productos cp USING (id_producto)
WHERE cp.estado = 1
GROUP BY cat.id_categoria, cat.descripcion
ORDER BY ventas_categoria DESC;
-- 9. Clasifica el nivel de stock de productos activos (`CRÍTICO/BAJO/OK`) usando `CASE` sobre el campo `cantidad_stock` y ordena por el stock ascendente.
    SELECT 
    nombre,
    cantidad_stock,
    CASE 
        WHEN cantidad_stock <= 100 THEN 'CRÍTICO'
        WHEN cantidad_stock <= 300 THEN 'BAJO'
        ELSE 'OK'
    END AS nivel_stock
FROM productos
WHERE estado = 1
ORDER BY cantidad_stock ASC;
-- 10. Obtén la última compra por cliente utilizando`DISTINCT ON (id_cliente)` combinado con `ORDER BY ... fecha DESC` y una agregación del total de la compra.
SELECT DISTINCT ON (c.id_cliente)
    c.nombre || ' ' || c.apellidos AS cliente,
    co.fecha AS ultima_compra,
    SUM(cp.total) AS total_ultima_compra
FROM clientes c
JOIN compras co USING (id_cliente)
JOIN compras_productos cp USING (id_compra)
WHERE cp.estado = 1
GROUP BY c.id_cliente, c.nombre, c.apellidos, co.id_compra, co.fecha
ORDER BY c.id_cliente, co.fecha DESC;
-- 11. Devuelve los 2 productos más vendidos por categoría usando una subconsulta con `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY SUM(...) DESC)` y luego filtrando `ROW_NUMBER` <= 2.
    WITH productos_ranking AS (
    SELECT 
        cat.descripcion AS categoria,
        p.nombre,
        SUM(cp.cantidad) AS unidades_vendidas,
        ROW_NUMBER() OVER (PARTITION BY cat.id_categoria ORDER BY SUM(cp.cantidad) DESC) AS ranking
    FROM categorias cat
    JOIN productos p USING (id_categoria)
    JOIN compras_productos cp USING (id_producto)
    WHERE cp.estado = 1
    GROUP BY cat.id_categoria, cat.descripcion, p.id_producto, p.nombre
)
SELECT 
    categoria,
    nombre,
    unidades_vendidas,
    ranking
FROM productos_ranking
WHERE ranking <= 2
ORDER BY categoria, ranking;
-- 12. Calcula ventas mensuales: agrupa por mes truncando la fecha con `DATE_TRUNC('month', fecha)`, cuenta compras distintas (`COUNT(DISTINCT ...)`) y suma ventas, ordenando cronológicamente.
SELECT 
    DATE_TRUNC('month', co.fecha) AS mes,
    COUNT(DISTINCT co.id_compra) AS num_compras,
    SUM(cp.total) AS total_ventas
FROM compras co
JOIN compras_productos cp USING (id_compra)
WHERE cp.estado = 1
GROUP BY DATE_TRUNC('month', co.fecha)
ORDER BY mes;
-- 13. Lista productos que nunca se han vendido mediante un anti-join con `NOT EXISTS`, comparando por id_producto.

--     `WHERE  NOT EXISTS (
--       SELECT *
--       FROM   ..
--       WHERE  ..
--     );`
SELECT 
    p.nombre,
    p.precio_venta,
    p.cantidad_stock
FROM productos p
WHERE p.estado = 1
    AND NOT EXISTS (
        SELECT 1
        FROM compras_productos cp
        WHERE cp.id_producto = p.id_producto
            AND cp.estado = 1
    )
ORDER BY p.nombre;
-- 14. Identifica clientes que, al comprar “café”, también compran “pan” en la misma compra, usando un filtro con `ILIKE` y una subconsulta correlacionada con `EXISTS`.

--     `WHERE ...  EXISTS (
--       SELECT *
--       FROM   ..
--       WHERE  ..
--     );`
SELECT DISTINCT
    c.nombre || ' ' || c.apellidos AS cliente,
    co.id_compra,
    co.fecha
FROM clientes c
JOIN compras co USING (id_cliente)
JOIN compras_productos cp1 USING (id_compra)
JOIN productos p1 ON cp1.id_producto = p1.id_producto
WHERE p1.nombre ILIKE '%café%'
    AND cp1.estado = 1
    AND EXISTS (
        SELECT 1
        FROM compras_productos cp2
        JOIN productos p2 ON cp2.id_producto = p2.id_producto
        WHERE cp2.id_compra = co.id_compra
            AND p2.nombre ILIKE '%pan%'
            AND cp2.estado = 1
    )
ORDER BY co.fecha;
-- 15. Estima el margen porcentual “simulado” de un producto aplicando operadores aritméticos sobre precio_venta y formateo con `ROUND()` a un decimal.
SELECT 
    nombre,
    precio_venta,
    ROUND(precio_venta * 0.6, 2) AS costo_estimado,
    ROUND(((precio_venta - (precio_venta * 0.6)) / precio_venta) * 100, 1) AS margen_porcentual
FROM productos
WHERE estado = 1
ORDER BY margen_porcentual DESC;
-- 16. Filtra clientes de un dominio dado usando expresiones regulares con el operador `~*` (case-insensitive) y limpieza con `TRIM()` sobre el correo electrónico.
SELECT 
    nombre,
    apellidos,
    TRIM(correo_electronico) AS email
FROM clientes
WHERE TRIM(correo_electronico) ~* '.*@example\.com$'
ORDER BY apellidos, nombre;
-- 17. Normaliza nombres y apellidos de clientes con `TRIM()` e `INITCAP()` para capitalizar, retornando columnas formateadas.
SELECT 
    id,
    INITCAP(TRIM(nombre)) AS nombre_normalizado,
    INITCAP(TRIM(apellidos)) AS apellidos_normalizados,
    correo_electronico
FROM clientes
ORDER BY apellidos_normalizados, nombre_normalizado;
-- 18. Selecciona los productos cuyo `id_producto` es par usando el operador módulo `%` en la cláusula `WHERE`.
SELECT 
    id_producto,
    nombre,
    precio_venta
FROM productos
WHERE id_producto % 2 = 0
    AND estado = 1
ORDER BY id_producto;
-- 19. Crea una vista ventas_por_compra que consolide `id_compra`,` id_cliente`, `fecha` y el `SUM(total)` por compra, usando `CREATE OR REPLACE VIEW` y `JOIN ... USING`.
CREATE OR REPLACE VIEW ventas_por_compra AS
SELECT 
    co.id_compra,
    co.id_cliente,
    co.fecha,
    SUM(cp.total) AS total_compra
FROM compras co
JOIN compras_productos cp USING (id_compra)
WHERE cp.estado = 1
GROUP BY co.id_compra, co.id_cliente, co.fecha;

-- Para usar la vista:
SELECT * FROM ventas_por_compra ORDER BY fecha DESC;
-- 20. Crea una vista materializada mensual mv_ventas_mensuales que agregue ventas por `DATE_TRUNC('month', fecha);` recuerda refrescarla con `REFRESH MATERIALIZED VIEW` cuando corresponda.
CREATE MATERIALIZED VIEW mv_ventas_mensuales AS
SELECT 
    DATE_TRUNC('month', co.fecha) AS mes,
    COUNT(DISTINCT co.id_compra) AS num_compras,
    COUNT(DISTINCT co.id_cliente) AS clientes_unicos,
    SUM(cp.total) AS total_mes
FROM compras co
JOIN compras_productos cp USING (id_compra)
WHERE cp.estado = 1
GROUP BY DATE_TRUNC('month', co.fecha)
ORDER BY mes;

-- Para refrescar la vista:
-- REFRESH MATERIALIZED VIEW mv_ventas_mensuales;

-- Para consultar:
SELECT * FROM mv_ventas_mensuales;
-- 21. Realiza un “UPSERT” de un producto referenciado por codigo_barras usando `INSERT ... ON CONFLICT (...) DO UPDATE`, actualizando nombre y precio_venta cuando exista conflicto.
INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Café Premium Especial 500g', 
        (SELECT id_categoria FROM categorias WHERE descripcion = 'Café'), 
        '7701234567001', 
        32000.00, 
        100, 
        1)
ON CONFLICT (codigo_barras) 
DO UPDATE SET 
    nombre = EXCLUDED.nombre,
    precio_venta = EXCLUDED.precio_venta,
    cantidad_stock = productos.cantidad_stock + EXCLUDED.cantidad_stock;
-- 22. Recalcula el stock descontando lo vendido a partir de un `UPDATE ... FROM (SELECT ... GROUP BY ...)`, empleando `COALESCE()` y `GREATEST()` para evitar negativos.
UPDATE productos 
SET cantidad_stock = GREATEST(
    COALESCE(cantidad_stock, 0) - COALESCE(vendido.total_vendido, 0), 
    0
)
FROM (
    SELECT 
        id_producto,
        SUM(cantidad) AS total_vendido
    FROM compras_productos
    WHERE estado = 1
    GROUP BY id_producto
) AS vendido
WHERE productos.id_producto = vendido.id_producto;
-- 23. Implementa una función PL/pgSQL (`miscompras.fn_total_compra`) que reciba `p_id_compra` y retorne el `total` con `COALESCE(SUM(...), 0);` define el tipo de retorno `NUMERIC(16,2)`.
CREATE OR REPLACE FUNCTION miscompras.fn_total_compra(p_id_compra INT)
RETURNS NUMERIC(16,2)
LANGUAGE plpgsql
AS $$
DECLARE
    v_total NUMERIC(16,2);
BEGIN
    SELECT COALESCE(SUM(total), 0)
    INTO v_total
    FROM miscompras.compras_productos
    WHERE id_compra = p_id_compra 
        AND estado = 1;
    
    RETURN v_total;
END;
$$;

-- Para usar la función:
 SELECT miscompras.fn_total_compra(1);
-- 24. Define un trigger `AFTER INSERT` sobre `compras_productos` que descuente stock mediante una función `RETURNS TRIGGER` y el uso del registro `NEW`, protegiendo con `GREATEST()` para no quedar bajo cero.
CREATE OR REPLACE FUNCTION miscompras.fn_descontar_stock()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE miscompras.productos
    SET cantidad_stock = GREATEST(cantidad_stock - NEW.cantidad, 0)
    WHERE id_producto = NEW.id_producto;
    
    RETURN NEW;
END;
$$;

CREATE TRIGGER tr_descontar_stock
    AFTER INSERT ON miscompras.compras_productos
    FOR EACH ROW
    EXECUTE FUNCTION miscompras.fn_descontar_stock();
-- 25. Asigna la “posición por precio” de cada producto dentro de su categoría con `DENSE_RANK() OVER (PARTITION BY ... ORDER BY precio_venta DESC)` y presenta el ranking.
SELECT 
    cat.descripcion AS categoria,
    p.nombre,
    p.precio_venta,
    DENSE_RANK() OVER (PARTITION BY cat.id_categoria ORDER BY p.precio_venta DESC) AS posicion_precio
FROM productos p
JOIN categorias cat USING (id_categoria)
WHERE p.estado = 1
ORDER BY categoria, posicion_precio;
-- 26. Para cada cliente, muestra su gasto por compra, el gasto anterior y el delta entre compras usando `LAG(...) OVER (PARTITION BY id_cliente ORDER BY dia)` dentro de un `CTE` que agrega por día.
WITH gastos_diarios AS (
    SELECT 
        co.id_cliente,
        co.fecha::date AS dia,
        SUM(cp.total) AS gasto_dia
    FROM compras co
    JOIN compras_productos cp USING (id_compra)
    WHERE cp.estado = 1
    GROUP BY co.id_cliente, co.fecha::date
)
SELECT 
    c.nombre || ' ' || c.apellidos AS cliente,
    gd.dia,
    gd.gasto_dia,
    LAG(gd.gasto_dia) OVER (PARTITION BY gd.id_cliente ORDER BY gd.dia) AS gasto_anterior,
    gd.gasto_dia - LAG(gd.gasto_dia) OVER (PARTITION BY gd.id_cliente ORDER BY gd.dia) AS delta_gasto
FROM gastos_diarios gd
JOIN clientes c USING (id_cliente)
ORDER BY c.nombre, gd.dia;
message.txt
15 KB