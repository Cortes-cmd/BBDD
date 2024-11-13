-- 1. Información de todos los clientes de Madrid:
SELECT * FROM CLIENTE WHERE CIUDAD = 'Madrid';

-- 2. Información de todos los clientes que no son de Madrid:
SELECT * FROM CLIENTE WHERE CIUDAD != 'Madrid';

-- 3. Información de todos los clientes cuyo nombre comience con una de las letras entre B y G:
SELECT * FROM CLIENTE WHERE NOMBRE BETWEEN "B" and "G";

-- 4. Información de todos los clientes cuyo nombre comience con la letra D:
SELECT * FROM CLIENTE WHERE NOMBRE LIKE 'R%';

-- 5. Información del producto con código BAB5:
SELECT * FROM PRODUCTO WHERE CODIGO = 'BAB5';

-- 6. Productos a reponer y dinero a invertir:
SELECT CODIGO,DESCRIPCION,STOCK,(MINIMO - STOCK) AS UNIDADES_A_REPONER,
(MINIMO - STOCK) * PRECIO AS DINERO_A_INVERTIR
FROM   PRODUCTO 
WHERE  STOCK < MINIMO;
   

-- 7. Líneas de detalle de todas las facturas incluyendo la descripción del artículo y el precio de la venta:
SELECT DETALLE.*, PRODUCTO.DESCRIPCION, (DETALLE.UNIDADES * DETALLE.PRECIO) AS PRECIO_VENTA
FROM DETALLE
INNER JOIN PRODUCTO ON DETALLE.CODIGO = PRODUCTO.CODIGO; 

-- 8. Líneas de detalle de la factura 5000:
SELECT DETALLE.*, PRODUCTO.DESCRIPCION, (DETALLE.UNIDADES * DETALLE.PRECIO) AS PRECIO_VENTA
FROM DETALLE
INNER JOIN PRODUCTO ON DETALLE.CODIGO = PRODUCTO.CODIGO
WHERE DETALLE.NUMERO = 5000;

-- 9. Ventas del artículo con código BAB5:
SELECT DETALLE.*, PRODUCTO.DESCRIPCION, (DETALLE.UNIDADES * DETALLE.PRECIO) AS PRECIO_VENTA
FROM DETALLE
INNER JOIN PRODUCTO ON DETALLE.CODIGO = PRODUCTO.CODIGO
WHERE DETALLE.CODIGO = 'BAB5';

-- 10. Todas las facturas incluyendo el nombre y teléfono del cliente:
SELECT FACTURA.*, CLIENTE.NOMBRE, CLIENTE.TLF
FROM FACTURA
INNER JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF;

-- 11. Todas las facturas incluyendo el nombre y teléfono del cliente, así como el importe total de la factura:
SELECT FACTURA.*, CLIENTE.NOMBRE, CLIENTE.TLF, 
       SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS IMPORTE
FROM FACTURA
INNER JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
GROUP BY FACTURA.NUMERO;

-- 12. Facturas del cliente DELGADO PEREZ MARISA:
SELECT FACTURA.*, CLIENTE.NOMBRE, CLIENTE.TLF, 
       SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS IMPORTE
FROM FACTURA
INNER JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE CLIENTE.NOMBRE = 'ROSA PEREZ DELGADO'
GROUP BY FACTURA.NUMERO;

-- 13. Facturas pagadas (No aparece nada porque todas están pagadas):
SELECT FACTURA.*, CLIENTE.NOMBRE, CLIENTE.TLF, 
       SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS IMPORTE
FROM FACTURA
INNER JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE FACTURA.PAGADO = "0"
GROUP BY FACTURA.NUMERO;

-- 14. Facturas pendientes de pago (No aparece nada porque todas están pagadas):
SELECT FACTURA.*, CLIENTE.NOMBRE, CLIENTE.TLF, 
       SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS IMPORTE
FROM FACTURA
INNER JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE FACTURA.PAGADO = "0"
GROUP BY FACTURA.NUMERO;

-- 15. Facturas de septiembre(No existe factura de septiembre, lo hago de Junio):
SELECT FACTURA.*, CLIENTE.NOMBRE, CLIENTE.TLF, 
       SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS IMPORTE
FROM FACTURA
INNER JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE FACTURA.FECHA between "2021-06-18" and "2021-07-20"
GROUP BY FACTURA.NUMERO;

-- 16. Facturas con importe entre 10 y 20 euros (Todos los importes exceden esa cantidad, así que :
SELECT FACTURA.*, CLIENTE.NOMBRE, CLIENTE.TLF, 
       SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS IMPORTE
FROM FACTURA
INNER JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
GROUP BY FACTURA.NUMERO
HAVING IMPORTE BETWEEN 10 AND 100;

-- 17. Importe total de todas las facturas pagadas:
SELECT SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS IMPORTE_DE_FACTURAS_PAGADAS
FROM FACTURA
INNER JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE FACTURA.PAGADO = TRUE;

-- 18. Importe total de todas las facturas de ROSA PEREZ DELGADO:
SELECT CLIENTE.NOMBRE, SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS IMPORTE_TOTAL
FROM FACTURA
INNER JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
INNER JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE CLIENTE.NOMBRE = 'ROSA PEREZ DELGADO';

-- 19 Relación de artículos junto a la suma de las unidades totales vendidas y el importe recaudado de dichas ventas:
SELECT PRODUCTO.CODIGO, PRODUCTO.DESCRIPCION, 
       SUM(DETALLE.UNIDADES) AS UNIDADES_VENDIDAS, 
       SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS IMPORTE_VENTAS
FROM PRODUCTO
INNER JOIN DETALLE ON PRODUCTO.CODIGO = DETALLE.CODIGO
GROUP BY PRODUCTO.CODIGO;

-- 20 Relación de clientes junto con el número total de facturas que tiene cada uno:
SELECT CLIENTE.NIF, CLIENTE.NOMBRE, COUNT(FACTURA.NUMERO) AS FACTURAS_CLIENTE
FROM CLIENTE
INNER JOIN FACTURA ON CLIENTE.NIF = FACTURA.NIF
GROUP BY CLIENTE.NIF;

-- 21 Importe total a invertir en la reposición de artículos:
SELECT SUM((MINIMO - STOCK) * PRECIO) AS IMPORTE_INVERSION
FROM PRODUCTO
WHERE STOCK < MINIMO;

-- 22 Aumentar un 3% el precio del artículo BAF4:
UPDATE PRODUCTO
SET PRECIO = PRECIO * 1.03
WHERE CODIGO = 'BAF4';

-- 23 Añadir la factura 5010 con fecha de hoy:
INSERT INTO FACTURA (NUMERO, FECHA, PAGADO, NIF) 
VALUES (5010, "2024-11-11", FALSE, '11111111A');

-- 24 Borrar la factura 5010:
DELETE FROM FACTURA WHERE NUMERO = 5010;

-- 25 Relación de productos junto al número de ventas:
SELECT PRODUCTO.CODIGO, PRODUCTO.DESCRIPCION, COUNT(DETALLE.ID) AS TOTAL_VENTAS
FROM PRODUCTO
INNER JOIN DETALLE ON PRODUCTO.CODIGO = DETALLE.CODIGO
GROUP BY PRODUCTO.CODIGO;