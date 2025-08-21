DROP SCHEMA IF EXISTS examen CASCADE;
/l

CREATE SCHEMA IF NOT EXISTS examen;
SET search_path TO examen;
CREATE DATABASE examen;

/c examen

DROP TABLE productos;

CREATE TABLE clientes (
    id                 VARCHAR(20)  PRIMARY KEY,
    nombre             VARCHAR(40)  NOT NULL,
    apellidos          VARCHAR(100) NOT NULL,
    celular            NUMERIC(10,0),
    direccion          VARCHAR(80),
    correo_electronico VARCHAR(70)
);
CREATE TABLE examen.categorias (
    id_categoria  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descripcion   VARCHAR(45) NOT NULL,
    estado        SMALLINT     NOT NULL DEFAULT 1,
    CONSTRAINT categorias_estado_chk CHECK (estado IN (0,1))
);
CREATE TABLE examen.productos (
    id_producto    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre         VARCHAR(45)   NOT NULL,
    id_categoria   INT           NOT NULL,
    codigo_barras  VARCHAR(150),
    precio_venta   NUMERIC(16,2) NOT NULL,
    cantidad_stock INT           NOT NULL DEFAULT 0,
    estado         SMALLINT      NOT NULL DEFAULT 1,
    CONSTRAINT productos_precio_chk   CHECK (precio_venta >= 0),
    CONSTRAINT productos_stock_chk    CHECK (cantidad_stock >= 0),
    CONSTRAINT productos_estado_chk   CHECK (estado IN (0,1)),
    CONSTRAINT productos_fk_categoria FOREIGN KEY (id_categoria)
        REFERENCES examen.categorias(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
CREATE UNIQUE INDEX IF NOT EXISTS ux_productos_codigo_barras
    ON examen.productos (codigo_barras)
    WHERE codigo_barras IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_productos_id_categoria
    ON examen.productos (id_categoria);
CREATE TABLE examen.compras (
    id_compra    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente   VARCHAR(20)  NOT NULL,
    fecha        TIMESTAMP    NOT NULL DEFAULT NOW(),
    medio_pago   CHAR(1)      NOT NULL,
    comentario   VARCHAR(300),
    estado       CHAR(1)      NOT NULL,
    CONSTRAINT compras_fk_cliente FOREIGN KEY (id_cliente)
        REFERENCES examen.clientes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
CREATE INDEX IF NOT EXISTS idx_compras_id_cliente
    ON examen.compras (id_cliente);

CREATE TABLE examen.compras_productos (
    id_compra    INT           NOT NULL,
    id_producto  INT           NOT NULL,
    cantidad     INT           NOT NULL,
    total        NUMERIC(16,2) NOT NULL,
    estado       SMALLINT      NOT NULL DEFAULT 1,
    CONSTRAINT compras_productos_pk PRIMARY KEY (id_compra, id_producto),
    CONSTRAINT compras_productos_cantidad_chk CHECK (cantidad > 0),
    CONSTRAINT compras_productos_total_chk    CHECK (total >= 0),
    CONSTRAINT compras_productos_estado_chk   CHECK (estado IN (0,1)),
    CONSTRAINT compras_productos_fk_compra FOREIGN KEY (id_compra)
        REFERENCES examen.compras(id_compra)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT compras_productos_fk_producto FOREIGN KEY (id_producto)
        REFERENCES examen.productos(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
CREATE INDEX IF NOT EXISTS idx_cp_id_producto
    ON examen.compras_productos (id_producto);


INSERT INTO examen.clientes (id, nombre, apellidos, celular, direccion, correo_electronico) VALUES
('CC1001', 'Camila',   'Ramírez Gómez',     3004567890, 'Cra 12 #34-56, Bogotá',      'camila.ramirez@example.com'),
('CC1002', 'Andrés',   'Pardo Salinas',     3109876543, 'Cl 45 #67-12, Medellín',     'andres.pardo@example.com'),
('CC1003', 'Valeria',  'Gutiérrez Peña',    3012223344, 'Av 7 #120-15, Bogotá',       'valeria.gutierrez@example.com'),
('CC1004', 'Juan',     'Soto Cárdenas',     3155556677, 'Cl 9 #8-20, Cali',           'juan.soto@example.com'),
('CC1005', 'Luisa',    'Fernández Ortiz',   3028889911, 'Cra 50 #10-30, Bucaramanga', 'luisa.fernandez@example.com'),
('CC1006', 'Carlos',   'Muñoz Prieto',      3014567890, 'Cl 80 #20-10, Barranquilla', 'carlos.munoz@example.com'),
('CC1007', 'Diana',    'Rojas Castillo',    3126665544, 'Cra 15 #98-45, Bogotá',      'diana.rojas@example.com'),
('CC1008', 'Miguel',   'Vargas Rincón',     3201234567, 'Cl 33 #44-21, Cartagena',    'miguel.vargas@example.com');


INSERT INTO examen.categorias (descripcion, estado) VALUES
('laptops',       1),
('teléfonos',    1),
('celular',  1),
('portatil',       1),
('teclado',     1),
('maouse',    1);

INSERT INTO examen.productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
('laptops de Colombia 500g',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='laptops'),
 '7701234567001', 28000.00,  250, 1),
('las mejores laptops',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='laptops'),
 '7701234567002', 22000.00,  180, 1),
('las mejores laptops',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='teléfonos'),
 '7701234567003',  4200.00,  600, 1),
('los mejores telefonos',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='teléfonos'),
 '7701234567004',  6000.00,  400, 1),
('los mejores telefonos',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='portatil'),
 '7701234567005',  3500.00,  320, 1),
('los mejores portatiles',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='portatil'),
 '7701234567006',  2500.00,  500, 1),
('los mejores portatiles',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='celular'),
 '7701234567007', 12000.00,  260, 1),
('los mejores celulares',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='celular'),
 '7701234567008',  8000.00,  300, 1),
('los mejores celulares',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='teclado'),
 '7701234567009',  5500.00,  700, 1),
('los mejores teclados',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='teclado'),
 '7701234567010',  7000.00,  420, 1),
('los mejores teclados',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='maouse'),
 '7701234567011',  6500.00,  800, 1),
('los mejores moouses',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='maouse'),
 '7701234567012',  2200.00, 1200, 1),
('los mejores moouses',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='maouse'),
 '7701234567013',  3800.00,  650, 1),
('los mejores moouses',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='portatil'),
 '7701234567014',  9000.00,  240, 1),
('los mejores portatiles',
 (SELECT id_categoria FROM examen.categorias WHERE descripcion='portatil'),
 '7701234567015',  7500.00,  260, 1);

INSERT INTO examen.compras (id_cliente, fecha, medio_pago, comentario, estado) VALUES
('CC1001', '2025-07-02 10:15:23', 'T', 'Compra semanal',            'A'),
('CC1002', '2025-07-03 18:45:10', 'E', 'Para oficina',              'A'),
('CC1003', '2025-07-05 09:05:00', 'C', NULL,                        'A'),
('CC1001', '2025-07-10 14:22:40', 'T', 'Reabastecimiento ',     'A'),
('CC1004', '2025-07-12 11:11:11', 'E', 'compra',    'A'),
('CC1005', '2025-07-15 19:35:05', 'T', 'Compras del mes',           'A'),
('CC1006', '2025-07-18 08:55:30', 'C', 'portatil',        'A'),
('CC1007', '2025-07-20 16:01:00', 'T', 'portatil',       'A'),
('CC1008', '2025-07-25 12:20:45', 'E', 'Reabastecimiento',        'A'),
('CC1002', '2025-08-01 17:05:12', 'T', 'Compras para semana',       'A'),
('CC1003', '2025-08-02 10:40:33', 'T', 'Reabastecimiento',          'A'),
('CC1004', '2025-08-05 13:50:00', 'C', 'portatil',        'A');

-- CC1001
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1001' AND fecha='2025-07-02 10:15:23'),
 (SELECT id_producto FROM examen.productos WHERE nombre='laptops de Colombia 500g'), 2, 56000.00, 1)
;

-- CC1002
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1002' AND fecha='2025-07-03 18:45:10'),
 (SELECT id_producto FROM examen.productos WHERE nombre='los mejores teclados'), 4, 26000.00, 1);

-- CC1003
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1003' AND fecha='2025-07-05 09:05:00'),
 (SELECT id_producto FROM examen.productos WHERE nombre='los mejores portatiles'), 1, 12000.00, 1);

-- CC1001
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1001' AND fecha='2025-07-10 14:22:40'),
 (SELECT id_producto FROM examen.productos WHERE nombre='las mejores laptops'), 1, 22000.00, 1);

-- CC1004
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1004' AND fecha='2025-07-12 11:11:11'),
 (SELECT id_producto FROM examen.productos WHERE nombre='los mejores telefonos'), 2, 12000.00, 1);

-- CC1005
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1005' AND fecha='2025-07-15 19:35:05'),
 (SELECT id_producto FROM examen.productos WHERE nombre='laptops de Colombia 500g'), 1, 28000.00, 1);

-- CC1006
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1006' AND fecha='2025-07-18 08:55:30'),
 (SELECT id_producto FROM examen.productos WHERE nombre='los mejores portatiles'), 2, 24000.00, 1);

-- CC1007
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1007' AND fecha='2025-07-20 16:01:00'),
 (SELECT id_producto FROM examen.productos WHERE nombre='los mejores portatiles'), 6, 15000.00, 1);

-- CC1008
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1008' AND fecha='2025-07-25 12:20:45'),
 (SELECT id_producto FROM examen.productos WHERE nombre='los mejores celulares'), 10, 55000.00, 1);

-- CC1002
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1002' AND fecha='2025-08-01 17:05:12'),
 (SELECT id_producto FROM examen.productos WHERE nombre='las mejores laptops'), 8, 33600.00, 1);

-- CC1003
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1003' AND fecha='2025-08-02 10:40:33'),
 (SELECT id_producto FROM examen.productos WHERE nombre='los mejores'), 5, 19000.00, 1);

-- CC1004
INSERT INTO examen.compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
((SELECT id_compra FROM examen.compras WHERE id_cliente='CC1004' AND fecha='2025-08-05 13:50:00'),
 (SELECT id_producto FROM examen.productos WHERE nombre='Chocolate de mesa 250g'), 2, 18000.00, 1);

