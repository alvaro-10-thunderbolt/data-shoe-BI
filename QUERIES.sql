-- database: :memory:
-- =====================================
-- CONSULTA 1: INSERTA DATOS
-- =====================================
INSERT INTO PRODUCTS (id_producto, id_marca, id_modelo, id_modelo_interno, categoria, sub_categoria, temporada, genero, color, 
tallas, cantidad_disponible, precio, id_proveedor, clave_proveedor, fecha_entrada)

-- Producto 1: Tenis Deportivo
VALUES
(21,'Charly','50004',600004,'tenis deportivo','running','entrenamiento','niña','rosa','17.5-21.5',9,749.90,'prov-504','II089','03-11-2025'),
(23,'Court','50006',600006,'zapato formal','vestir','eventos formales','dama','negro','22.5-26',7,999.90,'prov-506','PO1098','04-11-2025'),
(45,'Dogi','50028',780028,'sandalia','casual','verano','dama','beige','22-26.5',10,499.90,'prov-507','J14811','15-11-2025'),
(53,'Nike','1107',600036,'tenis deportivo','gym','entrenamiento','dama','rosa','22-26.5',7,1599.90,'prov-501','TZAA1220','19-11-2025');


---VER TODO INVENTARIO

SELECT * FROM PRODUCTS;


-- =====================================
-- CONSULTA 2: Productos con bajo inventario
-- =====================================
SELECT 
    descripcion,
    categoria,
    cantidad_disponible
FROM PRODUCTS
WHERE cantidad_disponible < 5;

-- =====================================
-- CONSULTA 3: Productos por marca
-- =====================================
SELECT 
    id_marca,
    COUNT(*) AS total_productos
FROM PRODUCTS
GROUP BY id_marca;


-- =====================================
-- CONSULTA 4: Inventario por categoria
-- =====================================
SELECT 
    categoria,
    SUM(cantidad_disponible) AS total_stock
FROM PRODUCTS
GROUP BY categoria;


-- =====================================
-- CONSULTA 5: Inventario por genero
-- =====================================
SELECT 
    genero,
    SUM(cantidad_disponible) AS total_stock
FROM PRODUCTS
GROUP BY genero;


-- =====================================
-- CONSULTA 6: Productos mas caros
-- =====================================
SELECT 
    descripcion,
    precio
FROM PRODUCTS
ORDER BY precio DESC
LIMIT 10;


-- =====================================
-- CONSULTA 7: Valor por producto en inventario
-- =====================================
SELECT 
    descripcion,
    cantidad_disponible,
    precio,
    (cantidad_disponible * precio) AS valor_total
FROM PRODUCTS;


-- =====================================
-- CONSULTA 8: Valor total del inventario
-- =====================================
SELECT 
    PRINTF('$%.2f', SUM(cantidad_disponible * precio)) AS valor_total_inventario
FROM PRODUCTS;


-- =====================================
-- CONSULTA 9: Productos por proveedor
-- =====================================
SELECT 
    id_proveedor,
    COUNT(*) AS total_productos
FROM PRODUCTS
GROUP BY id_proveedor;


-- =====================================
-- CONSULTA 10: Productos ordenados por stock
-- =====================================
SELECT 
    descripcion, cantidad_disponible
FROM PRODUCTS
ORDER BY cantidad_disponible ASC;