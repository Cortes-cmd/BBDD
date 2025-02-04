--
CREATE OR REPLACE FUNCTION VentasPorCategoria(idcategoria INT) 
RETURNS INT AS 
$$
DECLARE 
    total INT := 0;
BEGIN
    -- Obtener la suma total de unidades vendidas para la categoría dada
    SELECT COALESCE(SUM(d.unidades), 0) 
    INTO total
    FROM detalle d
    INNER JOIN producto p ON d.idproducto = p.idproducto
	INNER JOIN categoria c on c.idcategoria = p.idcategoria
    WHERE p.idcategoria = c.idcategoria;

    RETURN total;
END;
$$ LANGUAGE plpgsql;
--
select VentasPorCategoria(2);

drop function VentasPorCategoria;

CREATE OR REPLACE FUNCTION TotalDescuentoCliente(p_idcliente VARCHAR(25)) 
RETURNS DECIMAL(10,2) AS 
$$
DECLARE 
    total_descuento DECIMAL(10,2) := 0;
BEGIN
    -- Calcular el total de descuento aplicado al cliente
    SELECT COALESCE(SUM(d.descuento * d.unidades), 0) 
    INTO total_descuento
    FROM pedido p
    INNER JOIN detalle d ON p.idpedido = d.idpedido
    WHERE p.idcliente = p_idcliente;	

    RETURN total_descuento;
END;
$$ LANGUAGE plpgsql;

select TotalDescuentoCliente('VICTE');

drop function TotalDescuentoCliente;
--

CREATE OR REPLACE FUNCTION DiasTranscurridos(fechapedido TIMESTAMP) 
RETURNS INT AS 
$$
BEGIN
    RETURN EXTRACT(DAY FROM (CURRENT_DATE - fechapedido));
END;
$$ LANGUAGE plpgsql;

select DiasTranscurridos('2019-04-30') as DiasTranscurridos;

drop function DiasTranscurridos;
--
CREATE OR REPLACE FUNCTION ClasificarStock(p_idproducto INT) 
RETURNS VARCHAR(250) AS 
$$
DECLARE 
    cantidad INT;
BEGIN
    -- Obtener el stock del producto con el ID proporcionado
    SELECT stock INTO cantidad
    FROM producto
    WHERE idproducto = p_idproducto
    LIMIT 1;  -- PostgreSQL permite LIMIT en SELECT INTO, pero es opcional aquí.

    -- Verificar si no se encontró el producto
    IF cantidad IS NULL THEN
        RETURN 'Producto no encontrado';
    END IF;

    -- Condiciones para clasificar el stock
    IF cantidad = 0 THEN
        RETURN 'Agotado';
    ELSIF cantidad <= 10 THEN  -- Se usa ELSIF en lugar de ELSEIF en PL/pgSQL
        RETURN 'Quedan pocos';
    ELSE
        RETURN 'Suficiente Stock';
    END IF;
END;
$$ LANGUAGE plpgsql;


select ClasificarStock(1);

drop function ClasificarStock;

-- 
CREATE OR REPLACE FUNCTION CalcularTotalPedido(p_idpedido INT) 
RETURNS FLOAT AS 
$$
DECLARE 
    total FLOAT := 0;
BEGIN
    -- Calcular el total del pedido
    SELECT COALESCE(SUM(precio * unidades * (1 - descuento)), 0) 
    INTO total
    FROM detalle
    WHERE idpedido = p_idpedido;

    RETURN total;
END;
$$ LANGUAGE plpgsql;

select CalcularTotalPedido(10800);

drop function CalcularTotalPedido;