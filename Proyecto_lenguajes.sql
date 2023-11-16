CREATE TABLE camisas (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    talla VARCHAR2(10),
    color VARCHAR2(50),
    precio NUMBER(10, 2),
    cantidad_stock NUMBER
);

CREATE TABLE pantalones (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    talla VARCHAR2(10),
    color VARCHAR2(50),
    precio NUMBER(10, 2),
    cantidad_stock NUMBER
);

CREATE TABLE zapatos (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    talla VARCHAR2(10),
    color VARCHAR2(50),
    precio NUMBER(10, 2),
    cantidad_stock NUMBER
);


CREATE TABLE sueteres (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    talla VARCHAR2(10),
    color VARCHAR2(50),
    precio NUMBER(10, 2),
    cantidad_stock NUMBER
);

//camisas//
INSERT INTO camisas (id, nombre, talla, color, precio, cantidad_stock) VALUES
(1, 'Camisa Rayas Azules', 'M', 'Azul', 29.99, 50);
INSERT INTO camisas (id, nombre, talla, color, precio, cantidad_stock) VALUES
(2, 'Camisa Cuadros Roja', 'L', 'Rojo', 34.99, 30);
INSERT INTO camisas (id, nombre, talla, color, precio, cantidad_stock) VALUES
(3, 'Camisa Blanca Elegante', 'S', 'Blanco', 39.99, 20);
INSERT INTO camisas (id, nombre, talla, color, precio, cantidad_stock) VALUES
(4, 'Camisa Floral Verano', 'XL', 'Multicolor', 24.99, 40);

//pantalones//
INSERT INTO pantalones (id, nombre, talla, color, precio, cantidad_stock) VALUES
(1, 'Pantalón Vaquero Clásico', '32x34', 'Azul', 49.99, 60);
INSERT INTO pantalones (id, nombre, talla, color, precio, cantidad_stock) VALUES
(2, 'Pantalón Deportivo Negro', '30x32', 'Negro', 29.99, 45);
INSERT INTO pantalones (id, nombre, talla, color, precio, cantidad_stock) VALUES
(3, 'Pantalón Elegante Gris', '34x30', 'Gris', 54.99, 25);
INSERT INTO pantalones (id, nombre, talla, color, precio, cantidad_stock) VALUES
(4, 'Pantalón Corto Casual', 'M', 'Beige', 19.99, 70);

//zapatos//
INSERT INTO zapatos (id, nombre, talla, color, precio, cantidad_stock) VALUES
(1, 'Zapatos Deportivos Blancos', 'US 10', 'Blanco', 79.99, 35);
INSERT INTO zapatos (id, nombre, talla, color, precio, cantidad_stock) VALUES
(2, 'Zapatos Formales Negros', 'US 9', 'Negro', 89.99, 20);
INSERT INTO zapatos (id, nombre, talla, color, precio, cantidad_stock) VALUES
(3, 'Zapatos Casuales Marrones', 'US 11', 'Marrón', 59.99, 50);
INSERT INTO zapatos (id, nombre, talla, color, precio, cantidad_stock) VALUES
(4, 'Zapatos de Running Rojos', 'US 8', 'Rojo', 69.99, 40);

//sueteres//
INSERT INTO sueteres (id, nombre, talla, color, precio, cantidad_stock) VALUES
(1, 'Suéter Cuello V Gris', 'L', 'Gris', 44.99, 30);
INSERT INTO sueteres (id, nombre, talla, color, precio, cantidad_stock) VALUES
(2, 'Suéter Navideño Rojo', 'M', 'Rojo', 39.99, 25);
INSERT INTO sueteres (id, nombre, talla, color, precio, cantidad_stock) VALUES
(3, 'Suéter Casual Azul', 'XL', 'Azul', 49.99, 15);
INSERT INTO sueteres (id, nombre, talla, color, precio, cantidad_stock) VALUES
(4, 'Suéter Lana Invierno', 'S', 'Blanco', 54.99, 20);

Select * from zapatos;

GRANT SELECT ON camisas TO Proyecto;
GRANT SELECT ON zapatos TO Proyecto;
GRANT SELECT ON pantalones TO Proyecto;
GRANT SELECT ON sueteres TO Proyecto;

//APARTADO DE VISTAS//

//Vista de todas las prendas//
CREATE VIEW vista_todas_prendas AS
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM camisas
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM pantalones
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM zapatos
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM sueteres;

select * from vista_todas_prendas;

//Vista de Prendas con Precio Mayor a $50//
CREATE VIEW vista_prendas_precio_alto AS
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM camisas
WHERE precio > 50
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM pantalones
WHERE precio > 50
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM zapatos
WHERE precio > 50
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM sueteres
WHERE precio > 50;

select * from vista_prendas_precio_alto;

//Vista de Prendas con Bajo Stock//
CREATE VIEW vista_stock_bajo AS
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM camisas
WHERE cantidad_stock < 10
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM pantalones
WHERE cantidad_stock < 10
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM zapatos
WHERE cantidad_stock < 10
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM sueteres
WHERE cantidad_stock < 10;

select * from vista_stock_bajo;

//Vista de Prendas por Color//
CREATE VIEW vista_prendas_por_color AS
SELECT 'Camisas' AS tipo, nombre, talla, color, precio, cantidad_stock
FROM camisas
UNION ALL
SELECT 'Pantalones' AS tipo, nombre, talla, color, precio, cantidad_stock
FROM pantalones
UNION ALL
SELECT 'Zapatos' AS tipo, nombre, talla, color, precio, cantidad_stock
FROM zapatos
UNION ALL
SELECT 'Suéteres' AS tipo, nombre, talla, color, precio, cantidad_stock
FROM sueteres
ORDER BY color, tipo;

select * from vista_stock_bajo;

//Vista de Prendas Agotadas//
CREATE VIEW vista_prendas_agotadas AS
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM camisas
WHERE cantidad_stock = 0
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM pantalones
WHERE cantidad_stock = 0
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM zapatos
WHERE cantidad_stock = 0
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM sueteres
WHERE cantidad_stock = 0;

select * from vista_prendas_agotadas;

//Vista de Prendas por Talla//
CREATE VIEW vista_prendas_por_talla AS
SELECT 'Camisas' AS tipo, talla, COUNT(*) AS cantidad
FROM camisas
GROUP BY talla
UNION ALL
SELECT 'Pantalones' AS tipo, talla, COUNT(*) AS cantidad
FROM pantalones
GROUP BY talla
UNION ALL
SELECT 'Zapatos' AS tipo, talla, COUNT(*) AS cantidad
FROM zapatos
GROUP BY talla
UNION ALL
SELECT 'Suéteres' AS tipo, talla, COUNT(*) AS cantidad
FROM sueteres
GROUP BY talla
ORDER BY talla, tipo;

select * from vista_prendas_por_talla;

//Vista de Prendas con Descuento//
CREATE VIEW vista_prendas_descuento AS
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM camisas
WHERE precio < 0.9 * (SELECT AVG(precio) FROM camisas)
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM pantalones
WHERE precio < 0.9 * (SELECT AVG(precio) FROM pantalones)
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM zapatos
WHERE precio < 0.9 * (SELECT AVG(precio) FROM zapatos)
UNION ALL
SELECT id, nombre, talla, color, precio, cantidad_stock
FROM sueteres
WHERE precio < 0.9 * (SELECT AVG(precio) FROM sueteres);

select * from vista_prendas_descuento;

//Vista de Prendas Ordenadas por Precio Descendente//
CREATE VIEW vista_prendas_precio_desc AS
SELECT 'Camisas' AS tipo, id, nombre, talla, color, precio, cantidad_stock
FROM camisas
UNION ALL
SELECT 'Pantalones' AS tipo, id, nombre, talla, color, precio, cantidad_stock
FROM pantalones
UNION ALL
SELECT 'Zapatos' AS tipo, id, nombre, talla, color, precio, cantidad_stock
FROM zapatos
UNION ALL
SELECT 'Suéteres' AS tipo, id, nombre, talla, color, precio, cantidad_stock
FROM sueteres
ORDER BY precio DESC;

select * from vista_prendas_precio_desc;

//Vista de Prendas con Precio Promedio//
CREATE VIEW vista_precio_promedio AS
SELECT 'Camisas' AS tipo, AVG(precio) AS precio_promedio
FROM camisas
UNION ALL
SELECT 'Pantalones' AS tipo, AVG(precio) AS precio_promedio
FROM pantalones
UNION ALL
SELECT 'Zapatos' AS tipo, AVG(precio) AS precio_promedio
FROM zapatos
UNION ALL
SELECT 'Suéteres' AS tipo, AVG(precio) AS precio_promedio
FROM sueteres;

select * from vista_precio_promedio;

//Vista de Total de Stock por Tipo de Prenda//
CREATE VIEW vista_total_stock AS
SELECT 'Camisas' AS tipo, SUM(cantidad_stock) AS total_stock
FROM camisas
UNION ALL
SELECT 'Pantalones' AS tipo, SUM(cantidad_stock) AS total_stock
FROM pantalones
UNION ALL
SELECT 'Zapatos' AS tipo, SUM(cantidad_stock) AS total_stock
FROM zapatos
UNION ALL
SELECT 'Suéteres' AS tipo, SUM(cantidad_stock) AS total_stock
FROM sueteres;

select * from vista_total_stock;

//APARTADO DE FUNCIONES//

//Función para Obtener el Precio Total de un Tipo de Prenda//
CREATE OR REPLACE FUNCTION precio_total_tipo_prenda(p_tipo IN VARCHAR2)
RETURN NUMBER
IS
   v_precio_total NUMBER := 0;
BEGIN
   SELECT SUM(precio * cantidad_stock)
   INTO v_precio_total
   FROM camisas
   WHERE p_tipo = 'Camisas'
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM pantalones
   WHERE p_tipo = 'Pantalones'
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM zapatos
   WHERE p_tipo = 'Zapatos'
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM sueteres
   WHERE p_tipo = 'Suéteres';

   RETURN v_precio_total;
END;
/

//Función para Calcular el Precio Promedio de una Talla Específica//
CREATE OR REPLACE FUNCTION precio_promedio_por_talla(p_talla IN VARCHAR2)
RETURN NUMBER
IS
   v_precio_promedio NUMBER := 0;
BEGIN
   SELECT AVG(precio)
   INTO v_precio_promedio
   FROM camisas
   WHERE talla = p_talla
   UNION ALL
   SELECT AVG(precio)
   FROM pantalones
   WHERE talla = p_talla
   UNION ALL
   SELECT AVG(precio)
   FROM zapatos
   WHERE talla = p_talla
   UNION ALL
   SELECT AVG(precio)
   FROM sueteres
   WHERE talla = p_talla;

   RETURN v_precio_promedio;
END;
/

//Función para Actualizar el Precio de una Prenda//
CREATE OR REPLACE FUNCTION actualizar_precio_prenda(p_id IN NUMBER, p_nuevo_precio IN NUMBER)
RETURN NUMBER
IS
BEGIN
   UPDATE camisas
   SET precio = p_nuevo_precio
   WHERE id = p_id;

   UPDATE pantalones
   SET precio = p_nuevo_precio
   WHERE id = p_id;

   UPDATE zapatos
   SET precio = p_nuevo_precio
   WHERE id = p_id;

   UPDATE sueteres
   SET precio = p_nuevo_precio
   WHERE id = p_id;

   COMMIT;

   RETURN SQL%ROWCOUNT; -- Retorna la cantidad de filas afectadas
END;
/

//Función para Calcular el Stock Disponible de una Prenda//
CREATE OR REPLACE FUNCTION stock_disponible(p_id IN NUMBER)
RETURN NUMBER
IS
   v_stock_disponible NUMBER := 0;
BEGIN
   SELECT cantidad_stock
   INTO v_stock_disponible
   FROM camisas
   WHERE id = p_id
   UNION ALL
   SELECT cantidad_stock
   FROM pantalones
   WHERE id = p_id
   UNION ALL
   SELECT cantidad_stock
   FROM zapatos
   WHERE id = p_id
   UNION ALL
   SELECT cantidad_stock
   FROM sueteres
   WHERE id = p_id;

   RETURN v_stock_disponible;
END;
/

//Función para Eliminar una Prenda por ID//
CREATE OR REPLACE FUNCTION eliminar_prenda(p_id IN NUMBER)
RETURN NUMBER
IS
BEGIN
   DELETE FROM camisas WHERE id = p_id;
   DELETE FROM pantalones WHERE id = p_id;
   DELETE FROM zapatos WHERE id = p_id;
   DELETE FROM sueteres WHERE id = p_id;

   COMMIT;

   RETURN SQL%ROWCOUNT; -- Retorna la cantidad de filas afectadas
END;
/

//Función para Obtener el Nombre de una Prenda por ID//
CREATE OR REPLACE FUNCTION obtener_nombre_prenda(p_id IN NUMBER)
RETURN VARCHAR2
IS
   v_nombre VARCHAR2(100);
BEGIN
   SELECT nombre
   INTO v_nombre
   FROM camisas
   WHERE id = p_id
   UNION ALL
   SELECT nombre
   FROM pantalones
   WHERE id = p_id
   UNION ALL
   SELECT nombre
   FROM zapatos
   WHERE id = p_id
   UNION ALL
   SELECT nombre
   FROM sueteres
   WHERE id = p_id;

   RETURN v_nombre;
END;
/

//Función para Calcular el Precio Total de Todas las Prendas//
CREATE OR REPLACE FUNCTION precio_total_todas_prendas
RETURN NUMBER
IS
   v_precio_total NUMBER := 0;
BEGIN
   SELECT SUM(precio * cantidad_stock)
   INTO v_precio_total
   FROM camisas
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM pantalones
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM zapatos
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM sueteres;

   RETURN v_precio_total;
END;
/

//Función para Obtener el Nombre de la Prenda con el Precio Máximo//
CREATE OR REPLACE FUNCTION obtener_prenda_precio_maximo
RETURN VARCHAR2
IS
   v_nombre_prenda VARCHAR2(100);
BEGIN
   SELECT nombre
   INTO v_nombre_prenda
   FROM (
      SELECT nombre, ROW_NUMBER() OVER (ORDER BY precio DESC) AS rn
      FROM (
         SELECT nombre, precio FROM camisas
         UNION ALL
         SELECT nombre, precio FROM pantalones
         UNION ALL
         SELECT nombre, precio FROM zapatos
         UNION ALL
         SELECT nombre, precio FROM sueteres
      )
   )
   WHERE rn = 1 AND ROWNUM = 1;

   RETURN v_nombre_prenda;
END;
/

//Función para Calcular el Promedio de Stock por Tipo de Prenda//
CREATE OR REPLACE FUNCTION stock_promedio_tipo_prenda(p_tipo IN VARCHAR2)
RETURN NUMBER
IS
   v_stock_promedio NUMBER := 0;
BEGIN
   SELECT AVG(cantidad_stock)
   INTO v_stock_promedio
   FROM camisas
   WHERE p_tipo = 'Camisas'
   UNION ALL
   SELECT AVG(cantidad_stock)
   FROM pantalones
   WHERE p_tipo = 'Pantalones'
   UNION ALL
   SELECT AVG(cantidad_stock)
   FROM zapatos
   WHERE p_tipo = 'Zapatos'
   UNION ALL
   SELECT AVG(cantidad_stock)
   FROM sueteres
   WHERE p_tipo = 'Suéteres';

   RETURN v_stock_promedio;
END;
/

//Función para Calcular el Promedio de Stock por Tipo de Prenda//
CREATE OR REPLACE FUNCTION stock_promedio_tipo_prenda(p_tipo IN VARCHAR2)
RETURN NUMBER
IS
   v_stock_promedio NUMBER := 0;
BEGIN
   SELECT AVG(cantidad_stock)
   INTO v_stock_promedio
   FROM camisas
   WHERE p_tipo = 'Camisas'
   UNION ALL
   SELECT AVG(cantidad_stock)
   FROM pantalones
   WHERE p_tipo = 'Pantalones'
   UNION ALL
   SELECT AVG(cantidad_stock)
   FROM zapatos
   WHERE p_tipo = 'Zapatos'
   UNION ALL
   SELECT AVG(cantidad_stock)
   FROM sueteres
   WHERE p_tipo = 'Suéteres';

   RETURN v_stock_promedio;
END;
/

//Función para Obtener el Tipo de Prenda Más Vendido//
CREATE OR REPLACE FUNCTION tipo_prenda_mas_vendido
RETURN VARCHAR2
IS
   v_tipo_mas_vendido VARCHAR2(50);
BEGIN
   SELECT tipo
   INTO v_tipo_mas_vendido
   FROM (
      SELECT 'Camisas' AS tipo, SUM(cantidad_stock) AS total_vendido
      FROM camisas
      UNION ALL
      SELECT 'Pantalones' AS tipo, SUM(cantidad_stock) AS total_vendido
      FROM pantalones
      UNION ALL
      SELECT 'Zapatos' AS tipo, SUM(cantidad_stock) AS total_vendido
      FROM zapatos
      UNION ALL
      SELECT 'Suéteres' AS tipo, SUM(cantidad_stock) AS total_vendido
      FROM sueteres
   )
   ORDER BY total_vendido DESC
   FETCH FIRST 1 ROW ONLY;

   RETURN v_tipo_mas_vendido;
END;
/

//Función para Verificar si una Prenda Existe por ID//
CREATE OR REPLACE FUNCTION prenda_existe(p_id IN NUMBER)
RETURN BOOLEAN
IS
   v_existe NUMBER := 0;
BEGIN
   SELECT COUNT(*)
   INTO v_existe
   FROM dual
   WHERE EXISTS (
      SELECT 1 FROM camisas WHERE id = p_id
      UNION ALL
      SELECT 1 FROM pantalones WHERE id = p_id
      UNION ALL
      SELECT 1 FROM zapatos WHERE id = p_id
      UNION ALL
      SELECT 1 FROM sueteres WHERE id = p_id
   );

   RETURN v_existe = 1;
END;
/

//Función para Obtener el Número de Prendas con Stock Bajo//
CREATE OR REPLACE FUNCTION prendas_stock_bajo(p_stock_minimo IN NUMBER)
RETURN NUMBER
IS
   v_num_prendas_stock_bajo NUMBER := 0;
BEGIN
   SELECT COUNT(*)
   INTO v_num_prendas_stock_bajo
   FROM camisas
   WHERE cantidad_stock < p_stock_minimo
   UNION ALL
   SELECT COUNT(*)
   FROM pantalones
   WHERE cantidad_stock < p_stock_minimo
   UNION ALL
   SELECT COUNT(*)
   FROM zapatos
   WHERE cantidad_stock < p_stock_minimo
   UNION ALL
   SELECT COUNT(*)
   FROM sueteres
   WHERE cantidad_stock < p_stock_minimo;

   RETURN v_num_prendas_stock_bajo;
END;
/

//Función para Calcular el Valor Total de Inventario//
CREATE OR REPLACE FUNCTION valor_total_inventario
RETURN NUMBER
IS
   v_valor_total NUMBER := 0;
BEGIN
   SELECT SUM(precio * cantidad_stock)
   INTO v_valor_total
   FROM camisas
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM pantalones
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM zapatos
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM sueteres;

   RETURN v_valor_total;
END;
/

//Función para Calcular el Precio Total de una Prenda por Tipo y Talla//
CREATE OR REPLACE FUNCTION precio_total_prenda_tipo_talla(p_tipo IN VARCHAR2, p_talla IN VARCHAR2)
   RETURN NUMBER
IS
   v_precio_total NUMBER := 0;
BEGIN
   SELECT SUM(precio * cantidad_stock)
   INTO v_precio_total
   FROM camisas
   WHERE nombre = p_tipo AND talla = p_talla
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM pantalones
   WHERE nombre = p_tipo AND talla = p_talla
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM zapatos
   WHERE nombre = p_tipo AND talla = p_talla
   UNION ALL
   SELECT SUM(precio * cantidad_stock)
   FROM sueteres
   WHERE nombre = p_tipo AND talla = p_talla;

   RETURN v_precio_total;
END;
/

CREATE OR REPLACE FUNCTION stock_promedio_tipo_prenda(p_tipo IN VARCHAR2)
RETURN NUMBER
IS
   v_stock_promedio NUMBER := 0;
BEGIN
   SELECT NVL(SUM(cantidad_stock * precio) / NULLIF(SUM(cantidad_stock), 0), 0)
   INTO v_stock_promedio
   FROM (
      SELECT cantidad_stock, precio
      FROM camisas
      WHERE nombre = p_tipo
      UNION ALL
      SELECT cantidad_stock, precio
      FROM pantalones
      WHERE nombre = p_tipo
      UNION ALL
      SELECT cantidad_stock, precio
      FROM zapatos
      WHERE nombre = p_tipo
      UNION ALL
      SELECT cantidad_stock, precio
      FROM sueteres
      WHERE nombre = p_tipo
   );

   RETURN v_stock_promedio;
END;
/

//Ejecucion de funciones//
SELECT stock_promedio_tipo_prenda('Camisas') AS promedio_camisas,
       stock_promedio_tipo_prenda('Pantalones') AS promedio_pantalones,
       stock_promedio_tipo_prenda('Zapatos') AS promedio_zapatos,
       stock_promedio_tipo_prenda('Suéteres') AS promedio_sweaters
FROM dual;

SELECT precio_total_tipo_prenda('Camisas') AS precio_total_camisas,
       precio_total_tipo_prenda('Pantalones') AS precio_total_pantalones,
       precio_total_tipo_prenda('Zapatos') AS precio_total_zapatos,
       precio_total_tipo_prenda('Suéteres') AS precio_total_sweaters
FROM dual;

CREATE OR REPLACE FUNCTION precio_total_tipo_prenda(p_tipo IN VARCHAR2)
RETURN NUMBER
IS
   v_total NUMBER := 0;
BEGIN
   FOR rec IN (
      SELECT TO_NUMBER(precio * cantidad_stock) AS subtotal
      FROM camisas
      WHERE nombre = p_tipo
      UNION ALL
      SELECT TO_NUMBER(precio * cantidad_stock)
      FROM pantalones
      WHERE nombre = p_tipo
      UNION ALL
      SELECT TO_NUMBER(precio * cantidad_stock)
      FROM zapatos
      WHERE nombre = p_tipo
      UNION ALL
      SELECT TO_NUMBER(precio * cantidad_stock)
      FROM sueteres
      WHERE nombre = p_tipo
   ) LOOP
      v_total := v_total + rec.subtotal;
   END LOOP;

   RETURN v_total;
END;
/



//APARTADO DE CURSORES//

//Recorrer todos los registros de una tabla//
DECLARE
   CURSOR c_camisas IS
      SELECT * FROM camisas;
BEGIN
   FOR camisa_rec IN c_camisas
   LOOP
      -- Hacer algo con cada registro de camisas_rec
      DBMS_OUTPUT.PUT_LINE('ID: ' || camisa_rec.id || ', Nombre: ' || camisa_rec.nombre);
   END LOOP;
END;
/

DECLARE
   CURSOR c_camisas IS
      SELECT * FROM camisas;
   v_id NUMBER;
   v_nombre VARCHAR2(100);
   v_talla VARCHAR2(10);
   v_color VARCHAR2(50);
   v_precio NUMBER(10, 2);
   v_cantidad_stock NUMBER;
BEGIN
   OPEN c_camisas;
   LOOP
      FETCH c_camisas INTO v_id, v_nombre, v_talla, v_color, v_precio, v_cantidad_stock;
      EXIT WHEN c_camisas%NOTFOUND;
      
      -- Hacer algo con los valores recuperados
      DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Nombre: ' || v_nombre || ', Talla: ' || v_talla);
   END LOOP;
   CLOSE c_camisas;
END;
/

//Utilizar un cursor FOR UPDATE para actualizaciones//
DECLARE
   CURSOR c_actualizacion IS
      SELECT * FROM pantalones FOR UPDATE;
BEGIN
   FOR pantalon_rec IN c_actualizacion
   LOOP
      -- Hacer algo con cada registro de pantalon_rec
      UPDATE pantalones SET precio = precio * 1.1 WHERE CURRENT OF c_actualizacion;
   END LOOP;
   COMMIT;
END;
/

//Cursor con manejo de excepciones//
DECLARE
   CURSOR c_error IS
      SELECT * FROM sueteres WHERE precio < 0;
BEGIN
   FOR sueter_rec IN c_error
   LOOP
      -- Hacer algo con cada registro de sueter_rec
      NULL;
   END LOOP;
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

//Cursor con parámetro de entrada y salida (REF CURSOR)//
CREATE OR REPLACE PROCEDURE obtener_prendas_por_talla(p_talla IN VARCHAR2, p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN p_cursor FOR
      SELECT * FROM camisas WHERE talla = p_talla
      UNION ALL
      SELECT * FROM pantalones WHERE talla = p_talla
      UNION ALL
      SELECT * FROM zapatos WHERE talla = p_talla
      UNION ALL
      SELECT * FROM sueteres WHERE talla = p_talla;
END obtener_prendas_por_talla;
/

