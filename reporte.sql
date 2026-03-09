-- database: ../../d:/data_shoe/zapateria.db
-- REPORTE GENERAL DE INVENTARIO
SELECT * FROM PRODUCTS;

-- PRODUCTOS CON POCO INVENTARIO
SELECT descripcion, cantidad_disponible
FROM PRODUCTS
WHERE cantidad_disponible < 5;

-- PRODUCTOS POR MARCA
SELECT id_marca, COUNT(*) AS total_productos
FROM PRODUCTS
GROUP BY id_marca;

-- VALOR TOTAL DEL INVENTARIO
SELECT SUM(cantidad_disponible * precio) AS valor_inventario
FROM PRODUCTS;

-- STOCK POR CATEGORIA
SELECT categoria, SUM(cantidad_disponible) AS total_stock
FROM PRODUCTS
GROUP BY categoria;