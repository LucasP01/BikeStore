
-- Ejercicio 1: Mostrar todas las tiendas registradas en la tabla "stores".

SELECT DISTINCT(store_name)
FROM stores;

-- Ejercicio 2: Seleccionar los clientes que pertenecen a una ciudad específica (por ejemplo, 'CiudadX').

SELECT * FROM customers
Where city = "Buffalo";

-- Ejercicio 3: Contar el número total de órdenes registradas en la tabla "orders".

SELECT COUNT(*) 
FROM orders;

-- Ejercicio 4: Listar la cantidad de órdenes realizadas en cada tienda, agrupando los resultados por "store_id". 
-- Le sumo un join para tener el nombre de la tienda además del id

SELECT O.store_id, S.store_name, COUNT(O.order_id)
FROM orders as O
JOIN stores as S
ON O.store_id = S.store_id
GROUP BY store_id;

-- Ejercicio 5: Mostrar el id de la orden, la fecha y el nombre completo del cliente (concatenando "first_name" y "last_name") utilizando un JOIN entre "orders" y "customers".

SELECT O.order_id, O.order_date, concat(C.first_name, " ", C.last_name)
FROM orders as O
JOIN customers as C
ON O.customer_id = C.customer_id;

-- Ejercicio 6: Mostrar el id de la orden, la fecha y el nombre completo del empleado que atendió la orden, usando un JOIN entre "orders" y "staffs".

SELECT o.order_id AS id,
       o.order_date AS fecha,
       concat(s.first_name, " ", s.last_name) AS nombre_completo
FROM orders AS o
JOIN staffs AS s ON o.staff_id = s.staff_id;

-- Ejercicio 7: Encontrar y mostrar el producto con el precio de lista ("list_price") más alto en la tabla "products".

SELECT product_name, list_price
FROM products
ORDER BY list_price DESC
LIMIT 1;

-- Ejercicio 8: Calcular y mostrar el precio promedio de los productos por cada categoría, agrupando los resultados por "category_id".

SELECT C.category_name as Categoria, AVG(P.list_price) as Precio_promedio
FROM products as P
JOIN categories as C
ON P.category_id = C.category_id
GROUP BY 1;

-- Ejercicio 9: Listar las marcas cuyo precio promedio de sus productos es mayor a 100.00, realizando un JOIN entre "products" y "brands" y utilizando la cláusula HAVING.

 SELECT
	B.brand_name as marca, 
    AVG(P.list_price) as precio_promedio
 FROM brands  as B
 JOIN products as P 
 ON B.brand_id = P.brand_id
 GROUP BY marca
 HAVING precio_promedio > 100;

-- Ejercicio 10: Mostrar el id del empleado, su nombre completo y el nombre completo de su gerente, realizando una auto-unión en la tabla "staffs".

SELECT 
    s.staff_id AS employee_id,
    CONCAT(s.first_name, ' ', s.last_name) AS employee_name,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM staffs s
LEFT JOIN staffs m ON s.manager_id = m.staff_id;

-- Ejercicio 11: Listar los productos disponibles en una tienda específica (por ejemplo, con store_id = 1), mostrando el nombre del producto y la cantidad disponible mediante un JOIN entre "stocks" y "products".

SELECT P.product_name AS Nombre, SUM(S.quantity) AS Cantidad
FROM products as P
JOIN stocks as S
ON P.product_id = S.product_id
GROUP BY Nombre;

-- Ejercicio 12: Calcular el monto total de cada orden sumando el producto de (quantity * list_price * (1 - discount)) para cada ítem, agrupado por "order_id".

SELECT order_id, SUM((quantity * list_price * (1 - discount))) as Producto
FROM order_items
GROUP BY order_id;

-- Ejercicio 13: Listar los clientes que han realizado al menos una orden en los últimos 30 días utilizando una subconsulta con CURDATE() y DATE_SUB().

 SELECT 
	C.customer_id, 
    CONCAT(C.first_name, ' ', C.last_name) AS Nombre_cliente,
	COUNT(O.order_id) AS total_orders
 FROM customers AS C
 JOIN orders AS O
	ON C.customer_id = O.customer_id
 WHERE O.order_date >= DATE_SUB(CURDATE(), INTERVAL 3600 DAY)  
 GROUP BY 1, 2;

-- Ejercicio 14: Utilizar funciones de ventana (ROW_NUMBER()) para asignar un número secuencial a cada orden por tienda, ordenando los resultados por "store_id" y "order_date".

 SELECT
	store_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY store_id, order_date) AS order_number
FROM orders;

 
-- Ejercicio 15: Actualizar el precio de lista ("list_price") de los productos de una marca específica (por ejemplo, brand_id = 2), incrementándolo en un 10%.

UPDATE products SET list_price = list_price * 1.10 WHERE brand_id = 2;

-- Ejercicio 16: Eliminar los registros de "order_items" asociados a las órdenes que tienen el estado 'cancelled', utilizando un JOIN entre "order_items" y "orders".

DELETE OI
FROM order_items as OI
JOIN orders as O
ON OI.order_id = O.order_id
WHERE O.order_status = 2;
-- Ejercicio 17: Generar un reporte detallado de órdenes que incluya: id de la orden, fecha
-- , nombre completo del cliente, nombre completo del empleado y el nombre de la tienda, usando JOIN entre "orders", "customers", "staffs" y "stores".

SELECT 
	O.order_id AS id_orden,
    O.order_date AS Fecha_orden,
    CONCAT(C.first_name, ' ', C.last_name) AS Nombre_cliente,
    CONCAT(S.first_name, ' ', S.last_name) AS Nombre_empleado,
    ST.store_name AS Nombre_tienda
FROM orders as O
JOIN customers as C
	ON O.customer_id = C.customer_id
JOIN stores as ST
	ON O.store_id = ST.store_id
JOIN staffs as S
	ON O.staff_id = S.staff_id;
    

-- Ejercicio 18: Listar los productos que están agotados en todas las tiendas, es decir, aquellos productos cuya suma total de "quantity" en la tabla "stocks" es igual a 0 o no existe stock disponible.

 SELECT 
	P.product_name
 FROM products as P
 JOIN stocks as S
	ON P.product_id = S.product_id
WHERE S.quantity = 0;

-- Ejercicio 19: Crear una vista llamada "orders_summary" que resuma las órdenes, mostrando el id de la orden, la fecha, el id del cliente, el número total de ítems y el monto total de la orden.
 
CREATE VIEW orders_sumary
AS
SELECT 
	O.order_id AS id_orden,
    O.order_date AS fecha_orden,
    O.customer_id AS id_cliente,
    SUM(OI.quantity) AS total_items,
    SUM(OI.list_price) AS monto_orden
FROM orders as O
JOIN order_items as OI
	ON O.order_id = OI.order_id
GROUP BY O.order_id;


