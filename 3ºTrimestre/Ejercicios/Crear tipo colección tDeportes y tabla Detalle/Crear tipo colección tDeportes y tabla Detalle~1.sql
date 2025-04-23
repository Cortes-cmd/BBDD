create type tDeportes as VARRAY (15) OF VARCHAR (100);


alter table Cliente add (DEPORTES tDeportes);


update cliente set DEPORTES= tDeportes('Bicimad') where NIF= '11111111A';
update cliente set DEPORTES= tDeportes('Autobus') where NIF= '22222222B';
update cliente set DEPORTES= tDeportes('Patineta') where NIF= '33333333C';
update cliente set NIF='44444444D' where NIF= '44444444C';

drop type tDetalle CASCADE;
/

DROP TYPE BODY tDetalle;

DROP TABLE DETALLE;
/

-- Creamos la tabla de objetos

create or replace type tDetalle as object(

id_detalle NUMBER,
id_cliente CHAR,
descripcion VARCHAR2(100),
cantidad NUMBER,
precio_unitario NUMBER,

MEMBER FUNCTION GET_TOTAL RETURN NUMBER
);
/

-- Creamos el método "GET_TOTAL" 

CREATE OR REPLACE TYPE BODY tDetalle AS

    MEMBER FUNCTION GET_TOTAL RETURN NUMBER IS
    BEGIN
        RETURN cantidad*precio_unitario;
    END;
END;
/

-- Creamos tabla DETALLE

CREATE TABLE DETALLE OF tDetalle(
CONSTRAINT id_detalle PRIMARY KEY (id_detalle),
CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE (NIF)

);

-- Realizamos las inserciones en la tabla nueva


INSERT INTO DETALLE (id_detalle, id_cliente, descripcion, cantidad, precio_unitario)
VALUES (1, '11111111A', 'Zapatos deportivos', 2, 50);



INSERT INTO DETALLE (id_detalle, id_cliente, descripcion, cantidad, precio_unitario)
VALUES (2, '22222222B', 'Camiseta deportiva', 3, 20);
/

-- Seleccionamos datos

SELECT * FROM DETALLE;


-- Actualizamos valores de la tabla

-- Actualizar la cantidad de un detalle específico
UPDATE DETALLE
SET cantidad = 5
WHERE id_detalle = 1;
/

-- Actualizar el precio unitario de un detalle
UPDATE DETALLE
SET precio_unitario = 60
WHERE id_detalle = 2;
/


select *
from Cliente;