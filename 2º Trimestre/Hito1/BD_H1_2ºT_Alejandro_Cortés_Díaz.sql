-- Tabla Cliente
CREATE TABLE Cliente (
    ID_Cliente SERIAL PRIMARY KEY,
    Nombre_Empresa VARCHAR(255),
    Contacto VARCHAR(255),
    CIF VARCHAR(50),
    Razon_Social VARCHAR(255),
    Domicilio_Fiscal VARCHAR(255),
    Tlf VARCHAR(20),
    Cuenta_Bancaria VARCHAR(50)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    ID_Pedido SERIAL PRIMARY KEY,
    ID_Cliente INT,
    Fecha_Registro DATE,
    Fecha_Est_Entrega DATE,
    Fecha_Entrega DATE,
    Fecha_Est_Devolucion DATE,
    Fecha_Devolucion DATE,
    Direccion_Envio VARCHAR(255),
    Estado VARCHAR(50),
    Total_Precio DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Tabla Producto
CREATE TABLE Producto (
    ID_Producto SERIAL PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion VARCHAR(255),
    Precio_Alquiler DECIMAL(10, 2),
    Categoria VARCHAR(50),
    Estado VARCHAR(50)
);

-- Tabla DetallePedido
CREATE TABLE DetallePedido (
    ID_Detalle_Pedido SERIAL PRIMARY KEY,
    ID_Pedido INT,
    ID_Producto INT,
    Cantidad_Alquilada INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Orden
CREATE TABLE Orden (
    ID_Orden SERIAL PRIMARY KEY,
    ID_Pedido INT,
    Tipo_Orden VARCHAR(50),
    Fecha_Programada DATE,
    Estado VARCHAR(50),
    Nombre_Trans VARCHAR(255),
    Tlf_Trans VARCHAR(20),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

INSERT INTO Cliente (Nombre_Empresa, Contacto, CIF, Razon_Social, Domicilio_Fiscal, Tlf, Cuenta_Bancaria) 
VALUES 
('Empresa A', 'Juan Pérez', 'CIF12345A', 'Empresa A S.A.', 'Calle Mayor 1', '600123456', 'ES1234567890123456789012'),
('Empresa B', 'María López', 'CIF67890B', 'Empresa B S.L.', 'Calle Menor 2', '600654321', 'ES9876543210987654321098'),
('Empresa C', 'Carlos Ruiz', 'CIF54321C', 'Empresa C S.A.', 'Calle Central 3', '600789123', 'ES3456789012345678901234'),
('Empresa D', 'Ana Martín', 'CIF98765D', 'Empresa D S.L.', 'Calle Norte 4', '600987654', 'ES4567890123456789012345'),
('Empresa E', 'Pedro Gómez', 'CIF45678E', 'Empresa E S.A.', 'Calle Este 5', '600456789', 'ES5678901234567890123456'),
('Empresa F', 'Laura Sánchez', 'CIF87654F', 'Empresa F S.L.', 'Calle Oeste 6', '600321987', 'ES6789012345678901234567'),
('Empresa G', 'Luis García', 'CIF23456G', 'Empresa G S.A.', 'Calle Sur 7', '600654123', 'ES7890123456789012345678'),
('Empresa H', 'Marta Díaz', 'CIF76543H', 'Empresa H S.L.', 'Calle Nueva 8', '600987321', 'ES8901234567890123456789'),
('Empresa I', 'Elena Rodríguez', 'CIF65432I', 'Empresa I S.A.', 'Calle Antigua 9', '600123654', 'ES9012345678901234567890'),
('Empresa J', 'Fernando Torres', 'CIF34567J', 'Empresa J S.L.', 'Calle Vieja 10', '600456123', 'ES0123456789012345678901'),
('Empresa K', 'Carlos Martínez', 'CIF99999K', 'Empresa K S.L.', 'Calle Ficticia 11', '600123789', 'ES9999999999999999999'),
('Empresa L', 'Lucía Gómez', 'CIF11111L', 'Empresa L S.A.', 'Calle Ficticia 12', '600234567', 'ES0123456789012345678901');


INSERT INTO Producto (Nombre, Descripcion, Precio_Alquiler, Categoria, Estado) 
VALUES 
('Cámara básica', 'Cámara fotográfica de baja calidad', 15.00, 'Categoría A', 'Disponible'),
('Cámara de bolsillo', 'Cámara pro de tamaño bolsillo', 20.00, 'Categoría B', 'Disponible'),
('Mueble victoriano', 'Mueble victoriano de pega', 10.00, 'Categoría C', 'Disponible'),
('Traje de gala', 'Traje de gala negro', 25.00, 'Categoría A', 'No Disponible'),
('Brújula pirata', 'Brújula pirata de pega', 30.00, 'Categoría B', 'Disponible'),
('Bastón grande', 'Bastón innecesariamente grande', 12.00, 'Categoría C', 'No Disponible'),
('Sombrero de copa', 'Sombrero de copa', 18.00, 'Categoría A', 'Disponible'),
('Copa aristocrática', 'Copa aristocrática con detalles dorados', 22.00, 'Categoría B', 'Disponible'),
('Roca de cartón', 'Roca de cartón - piedra', 16.00, 'Categoría C', 'Disponible'),
('Lianas de pega', 'Lianas de pega', 24.00, 'Categoría A', 'Disponible');


INSERT INTO DetallePedido (ID_Pedido, ID_Producto, Cantidad_Alquilada) 
VALUES 
(1, 1, 2),
(1, 2, 1),
(2, 3, 5),
(2, 4, 1),
(3, 5, 3),
(4, 6, 2),
(5, 7, 1),
(6, 8, 4),
(7, 9, 2),
(8, 10,1),
(9, 1, 2),
(10,4, 1),
(11,2, 2),
(12,5, 3);


INSERT INTO Orden (ID_Pedido, Tipo_Orden, Fecha_Programada, Estado, Nombre_Trans, Tlf_Trans) 
VALUES 
(1, 'Entrega', '2025-01-05', 'Pendiente', 'Manolo el del Bolo', '600111222'),
(2, 'Devolución', '2025-01-06', 'Pendiente', 'Pepita Rita', '600333444'),
(3, 'Entrega', '2025-01-07', 'Completada', 'Francisco Fiasco', '600555666'),
(4, 'Devolución', '2025-01-08', 'Completada', 'Benito Manito', '600777888'),
(5, 'Entrega', '2025-01-09', 'Pendiente', 'Ernesta Fiesta', '600999000'),
(6, 'Devolución', '2025-01-10', 'Pendiente', 'Lola Trola', '600123456'),
(7, 'Entrega', '2025-01-11', 'Pendiente', 'Paco Urraco', '600654321'),
(8, 'Entrega', '2025-01-12', 'Pendiente', 'Pablo Diablo', '600987654'),
(9, 'Devolución', '2025-01-13', 'Completada', 'Rubenico Pánico', '600321987'),
(10, 'Entrega', '2025-01-14', 'Pendiente', 'Ramón Jamón', '600654987'),
(11, 'Entrega', '2025-01-15', 'Pendiente', 'Carlos Fernández', '600321654'),
(12, 'Devolución', '2025-01-20', 'Pendiente', 'Luis García', '600987321');

INSERT INTO Pedido (ID_Cliente, Fecha_Registro, Fecha_Est_Entrega, Fecha_Entrega, Fecha_Est_Devolucion, Fecha_Devolucion, Direccion_Envio, Estado, Total_Precio) 
VALUES 
(1, '2025-01-01', '2025-01-05', '2025-01-05', '2025-01-10', NULL, 'Calle Mayor 1', 'Devuelto', 90.00), 
(2, '2025-01-02', '2025-01-06', '2025-01-06', '2025-01-11', NULL, 'Calle Menor 2', 'Devuelto', 160.00), 
(3, '2025-01-03', '2025-01-07', '2025-01-07', '2025-01-12', NULL, 'Calle Central 3', 'Entregado', 120.00), 
(4, '2025-01-04', '2025-01-08', '2025-01-08', '2025-01-13', '2025-01-13', 'Calle Norte 4', 'Devuelto', 24.00), 
(5, '2025-01-05', '2025-01-09', '2025-01-09', '2025-01-14', NULL, 'Calle Este 5', 'Devuelto', 72.00),
(6, '2025-01-06', '2025-01-10', '2025-01-10', '2025-01-15', '2025-01-15', 'Calle Oeste 6', 'Entregado', 144.00), 
(7, '2025-01-07', '2025-01-11', '2025-01-11', '2025-01-16', NULL, 'Calle Sur 7', 'Devuelto', 80.00), 
(8, '2025-01-08', '2025-01-12', '2025-01-12', '2025-01-17', NULL, 'Calle Nueva 8', 'Devuelto', 78.00), 
(9, '2025-01-09', '2025-01-13', '2025-01-13', '2025-01-18', '2025-01-18', 'Calle Antigua 9', 'Entregado', 90.00), 
(10, '2025-01-10', '2025-01-14', '2025-01-14', '2025-01-19', NULL, 'Calle Vieja 10', 'Devuelto', 24.00),
(11, '2025-01-11', '2025-01-15', '2025-01-15', '2025-01-20', '2025-01-20', 'Calle Este 11', 'Devuelto', 60.00), 
(12, '2025-01-12', '2025-01-16', '2025-01-16', '2025-01-21', '2025-01-21', 'Calle Oeste 12', 'Devuelto', 110.00); 

-- 1. Consultar los pedidos junto con los detalles de los productos alquilados -- Esto nos permite saber en general datos relativos a las ventas
-- realizadas con las cantidades obtenidas de los productos.
SELECT p.ID_Pedido, p.Fecha_Registro, dp.ID_Producto, pr.Nombre, dp.Cantidad_Alquilada
FROM Pedido p
INNER JOIN DetallePedido dp ON p.ID_Pedido = dp.ID_Pedido
INNER JOIN Producto pr ON dp.ID_Producto = pr.ID_Producto;

-- 2. Consultar el total de productos alquilados y su precio total por cliente -- Nos posibilita saber cuánto han gastado en nosotros las empresas
-- que figurancomo nuestros clientes.
SELECT c.Nombre_Empresa, SUM(dp.Cantidad_Alquilada * pr.Precio_Alquiler) AS Total_Precio
FROM Cliente c
INNER JOIN Pedido p ON c.ID_Cliente = p.ID_Cliente
INNER JOIN DetallePedido dp ON p.ID_Pedido = dp.ID_Pedido
INNER JOIN Producto pr ON dp.ID_Producto = pr.ID_Producto
GROUP BY c.ID_Cliente;

-- 3. Consultar los clientes que tienen pedidos con productos en estado 'No Disponible' -- De esta manera vemos cuál es el estado de nuestro stock
-- en relación a los productos deseados.
SELECT DISTINCT c.Nombre_Empresa, p.ID_Pedido
FROM Cliente c
INNER JOIN Pedido p ON c.ID_Cliente = p.ID_Cliente
INNER JOIN DetallePedido dp ON p.ID_Pedido = dp.ID_Pedido
INNER JOIN Producto pr ON dp.ID_Producto = pr.ID_Producto
WHERE pr.Estado = 'No Disponible';

-- 4. Consultar todos los productos alquilados en pedidos que  están entregados -- Para ver el índice de pedidos que hemos entregados
SELECT pr.Nombre, dp.Cantidad_Alquilada, p.Estado
FROM Producto pr
INNER JOIN DetallePedido dp ON pr.ID_Producto = dp.ID_Producto
INNER JOIN Pedido p ON dp.ID_Pedido = p.ID_Pedido
WHERE p.Estado = 'Entregado';

-- 5. Consultar todos los pedidos con la información de la orden de entrega -- Vemos el tipo de orden de entrega, y por otro lado,la fecha en la que están programadas.
SELECT p.ID_Pedido, o.Tipo_Orden, o.Fecha_Programada
FROM Pedido p
INNER JOIN Orden o ON p.ID_Pedido = o.ID_Pedido
WHERE o.Tipo_Orden = 'Entrega';

-- 6. Consultar las órdenes que están asociadas a pedidos con una fecha de entrega mayor al 10 de enero. Así podemos ver el incremento o detrimento de
-- los pedidos a partir de esta fecha
SELECT o.ID_Orden, p.ID_Pedido, o.Fecha_Programada
FROM Orden o
INNER JOIN Pedido p ON o.ID_Pedido = p.ID_Pedido
WHERE p.Fecha_Entrega > '2025-01-10';

-- 7. Consultar los productos alquilados junto con su categoría y estado. Una forma de ver los productos junto con sus categorías y cantidades
--, además de si se encuentran disponibles o no, en este momento.
SELECT pr.Nombre, pr.Categoria, pr.Estado, dp.Cantidad_Alquilada
FROM Producto pr
INNER JOIN DetallePedido dp ON pr.ID_Producto = dp.ID_Producto;

-- 8. Consultar el total de precios por pedido, incluyendo el nombre del cliente. Nos permite saber qué clientes gastaron qué dinero, junto con el id
-- de su pedido
SELECT p.ID_Pedido, c.Nombre_Empresa, SUM(dp.Cantidad_Alquilada * pr.Precio_Alquiler) AS Total_Precio
FROM Pedido p
INNER JOIN Cliente c ON p.ID_Cliente = c.ID_Cliente
INNER JOIN DetallePedido dp ON p.ID_Pedido = dp.ID_Pedido
INNER JOIN Producto pr ON dp.ID_Producto = pr.ID_Producto
GROUP BY p.ID_Pedido, c.Nombre_Empresa;

-- 9. Consultar los pedidos que incluyen productos de una categoría específica. Observamos todos los productos y su categoría, junto con 
-- el id que los pidió
SELECT p.ID_Pedido, pr.Nombre, pr.Categoria
FROM Pedido p
INNER JOIN DetallePedido dp ON p.ID_Pedido = dp.ID_Pedido
INNER JOIN Producto pr ON dp.ID_Producto = pr.ID_Producto
WHERE pr.Categoria = 'Categoría A';

-- 10. Consultar los productos que han sido alquilados más de 3 veces. En este caso 4 productos destacan de nuestro stock, sobre otros
SELECT pr.Nombre, SUM(dp.Cantidad_Alquilada) AS Total_Alquilado
FROM Producto pr
INNER JOIN DetallePedido dp ON pr.ID_Producto = dp.ID_Producto
GROUP BY pr.ID_Producto, pr.Nombre
HAVING SUM(dp.Cantidad_Alquilada) > 3;


-- 11. Consultar las órdenes y los detalles del cliente que la solicitó. De esta manera vemos los pedidos que realizaron nuestros clientes,
-- en este caso realizó cada uno, un pedido.
SELECT o.ID_Orden, p.ID_Pedido, c.Nombre_Empresa
FROM Orden o
INNER JOIN Pedido p ON o.ID_Pedido = p.ID_Pedido
INNER JOIN Cliente c ON p.ID_Cliente = c.ID_Cliente;

-- 12. Consultar los productos alquilados con su precio de alquiler y cantidad, solo los que están disponibles. Vemos el precio de cada producto alquilado
-- que además, está disponible, cámara básica, cámara de bolsillo, y brújula pirata, fueron alquilados 2 veces.
SELECT pr.Nombre, pr.Precio_Alquiler, dp.Cantidad_Alquilada
FROM Producto pr
INNER JOIN DetallePedido dp ON pr.ID_Producto = dp.ID_Producto
WHERE pr.Estado = 'Disponible';

-- 13. Consultar los clientes y la cantidad total de productos que han alquilado. Observamos cúantas veces han alquilado algún producto nuestros clientes.
SELECT c.Nombre_Empresa, SUM(dp.Cantidad_Alquilada) AS Total_Alquilado
FROM Cliente c
INNER JOIN Pedido p ON c.ID_Cliente = p.ID_Cliente
INNER JOIN DetallePedido dp ON p.ID_Pedido = dp.ID_Pedido
GROUP BY c.ID_Cliente;

-- 14. Consultar los pedidos con sus productos, fechas de entrega y devolución. Observamos cómo nuestros productos han sido solicitados en cada producto.
-- Aparecen también aquellos que aún no han sido devueltos, y por tanto aparece null, así como unificados, los productos que fueron pedidos
-- en un mismo id pedido
SELECT 
    p.ID_Pedido, 
    STRING_AGG(pr.Nombre, ', ') AS Productos, 
    p.Fecha_Entrega, 
    p.Fecha_Devolucion
FROM Pedido p
INNER JOIN DetallePedido dp ON p.ID_Pedido = dp.ID_Pedido
INNER JOIN Producto pr ON dp.ID_Producto = pr.ID_Producto
GROUP BY p.ID_Pedido, p.Fecha_Entrega, p.Fecha_Devolucion
ORDER BY p.ID_Pedido; 


-- 15. Consultar el estado de las órdenes junto con el nombre del transportista. Vemos el estado de las órdenes junto con el estaod del mismo pedido,
-- el nombre del tranportista, su contacto, y en general detalles de interés sobre la clase de pedido y orden ante la que estamos.
SELECT o.Estado, o.Nombre_Trans, o.Tlf_Trans, p.Estado AS Estado_Pedido, c.Nombre_Empresa
FROM Orden o
INNER JOIN Pedido p ON o.ID_Pedido = p.ID_Pedido
INNER JOIN Cliente c ON p.ID_Cliente = c.ID_Cliente;
-- 16. Consultar los pedidos de un cliente específico y sus detalles. Empresa A, al haber realizado dos pedidos diferentes, tenemos 2 productos por su cuenta asociados al mismo id.
SELECT p.ID_Pedido, p.Fecha_Entrega, dp.Cantidad_Alquilada, pr.Nombre,c.Nombre_Empresa
FROM Cliente c
INNER JOIN Pedido p ON c.ID_Cliente = p.ID_Cliente
INNER JOIN DetallePedido dp ON p.ID_Pedido = dp.ID_Pedido
INNER JOIN Producto pr ON dp.ID_Producto = pr.ID_Producto
WHERE c.Nombre_Empresa = 'Empresa A';

-- 17. Consultar las órdenes de entrega y devolución, con su respectivo cliente. Observamos a nuestros clientes con sus ordenes y el tipo de la misma, en relación a los pedidos
-- realizados
SELECT o.ID_Orden, p.ID_Pedido, c.Nombre_Empresa, o.Tipo_Orden
FROM Orden o
INNER JOIN Pedido p ON o.ID_Pedido = p.ID_Pedido
INNER JOIN Cliente c ON p.ID_Cliente = c.ID_Cliente;

-- 18. Consultar los productos y su cantidad total alquilada por todos los clientes. Podemos ver cuáles son los productos más populares en los hábitos de consumo de nuestra
-- clientela
SELECT pr.Nombre, SUM(dp.Cantidad_Alquilada) AS Total_Alquilado
FROM Producto pr
INNER JOIN DetallePedido dp ON pr.ID_Producto = dp.ID_Producto
GROUP BY pr.ID_Producto;

-- 19. Consultar las órdenes con la fecha de entrega y la cantidad de productos alquilados. Podemos ver el total de productos alquilados en cada orden junto con su fecha.
SELECT o.ID_Orden, o.Fecha_Programada, SUM(dp.Cantidad_Alquilada) AS Total_Productos
FROM Orden o
INNER JOIN Pedido p ON o.ID_Pedido = p.ID_Pedido
INNER JOIN DetallePedido dp ON p.ID_Pedido = dp.ID_Pedido
GROUP BY o.ID_Orden, o.Fecha_Programada;

-- 20. Consultar las órdenes asociadas a pedidos que no han sido devueltos. Podemos ver las ordenes donde la fecha de devolución, aún no ha sido registrada.
SELECT o.ID_Orden, p.ID_Pedido, p.Fecha_Devolucion
FROM Orden o
INNER JOIN Pedido p ON o.ID_Pedido = p.ID_Pedido
WHERE p.Fecha_Devolucion IS NULL;




CREATE OR REPLACE PROCEDURE actualizar_total_pedido(p_id_pedido INT)
LANGUAGE plpgsql 
AS $$
DECLARE 
    v_total NUMERIC(10,2);
BEGIN
    -- Calcular el total del pedido usando la función calcular_total_pedido
    SELECT calcular_total_pedido(p_id_pedido) INTO v_total;

    -- Actualizar el total en la tabla Pedido
    UPDATE Pedido 
    SET Total_Precio = v_total
    WHERE ID_Pedido = p_id_pedido;
END;
$$;



call actualizar_total_pedido(12)

select calcular_total_pedido(11)

select * from pedido

CREATE OR REPLACE FUNCTION actualizar_estado_pedido()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$
BEGIN 
    -- Si la fecha de entrega es NULL y ya pasó la fecha estimada, marcar como "Entregado"
    IF NEW.Fecha_Entrega IS NULL AND NEW.Fecha_Est_Entrega <= CURRENT_DATE THEN
        NEW.Fecha_Entrega := CURRENT_DATE;
        NEW.Estado := 'Entregado';
    END IF;

    -- Si la fecha de devolución es NULL y ya pasó la fecha estimada, marcar como "Devuelto"
    IF NEW.Fecha_Devolucion IS NULL AND NEW.Fecha_Est_Devolucion <= CURRENT_DATE THEN
        NEW.Fecha_Devolucion := CURRENT_DATE;
        NEW.Estado := 'Devuelto';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_actualizar_estado_pedido
BEFORE INSERT OR UPDATE ON Pedido
FOR EACH ROW
EXECUTE FUNCTION actualizar_estado_pedido();



CREATE OR REPLACE FUNCTION calcular_total_pedido(p_id_pedido INT)
RETURNS NUMERIC(10,2) 
LANGUAGE plpgsql 
AS $$
DECLARE
    v_total NUMERIC(10,2);
BEGIN
    -- Calcular el total sumando (cantidad * precio) de cada producto en el pedido
    SELECT COALESCE(SUM(dp.Cantidad_Alquilada * p.Precio_Alquiler), 0)
    INTO v_total
    FROM DetallePedido dp
    JOIN Producto p ON dp.ID_Producto = p.ID_Producto
    WHERE dp.ID_Pedido = p_id_pedido;

    RETURN v_total;
END;
$$;

s

select * from cliente

select * from detallepedido

select * from orden

select * from pedido

select * from producto

SELECT id_pedido, id_producto, COUNT(*) AS repeticiones
FROM DetallePedido
GROUP BY id_pedido, id_producto
HAVING COUNT(*) > 1;

DELETE FROM DetallePedido
WHERE id_detalle_pedido NOT IN (
    SELECT MIN(id_detalle_pedido)
    FROM DetallePedido
    GROUP BY id_pedido, id_producto
);

INSERT INTO Pedido (ID_Cliente, Fecha_Registro, Fecha_Est_Entrega, Estado)
VALUES (1, '2025-01-01', '2025-01-10', 'Pendiente');