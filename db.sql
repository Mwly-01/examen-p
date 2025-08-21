DROP SCHEMA IF EXISTS examen CASCADE;
/l

CREATE SCHEMA IF NOT EXISTS examen;
SET search_path TO examen;
CREATE DATABASE examen;

/c examen

DROP TABLE productos;

 CREATE TABLE "productos"(
    "id" VARCHAR(255) NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "categoria" VARCHAR(255) NOT NULL,
    "precio" NUMERIC(16, 2) NOT NULL,
    "stock_disponible" INT NOT NULL,
    "provedor" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "productos" ADD PRIMARY KEY("id");

CREATE TABLE "cliente"(
    "id_cliente" VARCHAR(255) NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "correo" VARCHAR(255) NOT NULL,
    "numero_telefono" NUMERIC(10,0) 
);
ALTER TABLE
    "cliente" ADD PRIMARY KEY("id_cliente");

CREATE TABLE "ventas"(
    "id_ventas" VARCHAR(255) NOT NULL,
    "vendido" BIGINT NOT NULL,
    "id_cliente" BIGINT NOT NULL
);
ALTER TABLE
    "ventas" ADD PRIMARY KEY("id_ventas");

ALTER TABLE "ventas" ADD CONSTRAINT "id_del_cliente" FOREIGN KEY ("id_cliente") REFERENCES "cliente"("id_cliente") ON UPDATE ON DELETE CASCADE;

CREATE TABLE "provedor"(
    "id_provedor" VARCHAR(255) NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "correo" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "provedor" ADD PRIMARY KEY("id_provedor");

INSERT INTO "productos" (nombre, categoria, precio, stock_disponible, provedor) VALUES
('Camila',   'laptops'   500000, 8, ),
('Andrés',   'teléfonos'  80000, 4, ),
('Valeria',  'laptops'   90000,  8,),
('Juan',     'teléfonos' 400000, ),
('Luisa',    'portatil'  900000,  ),
('Carlos',   'laptops'   1800000, 14, ),
('Diana',    'teléfonos' 2800000,  65, ),
('Miguel',   'portatil'  8800000,   20,);

INSERT INTO "cliente" (nombre, correo, numero_telefono) VALUES
('Camila',   'camila@gmail.com',  3153245165  ),
('Andrés',   'andres@gmail.com',  3183179090),
('Valeria',  'valeria@gmail.com',   3201547854),
('Juan',     'juan@gmail.com',  3254185445),
('Luisa',    'luisa@gmail.com',  3652147894),
('Carlos',   'carlos@gmail.com',   3541245789),
('Diana',    'diana@gmail.com', 3215421587),
('Miguel',   'miguel@gmail.com', 3562140845);