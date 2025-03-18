-Ejercicio 1

CREATE OR REPLACE TYPE tVendedor AS OBJECT(

    nif char (9),
    nombreCompleto tNombre,
    direccion tDireccion,
    tlf varchar(25),
    antiguedad date,
    tipoContrato varchar(30),
    
    MEMBER FUNCTION getMeses RETURN int
);

CREATE TYPE BODY tVendedor AS
MEMBER FUNCTION getMeses RETURN int IS
    BEGIN
        RETURN (extract(year from current_date)- extract(year from antiguedad))*12;
    END;
END;

-- Ejercicio2
CREATE TABLE VENDEDOR OF tVendedor;
ALTER TABLE VENDEDOR ADD PRIMARY KEY (NIF);

-- Ejercicio 3
INSERT INTO VENDEDOR VALUES ('12121213A', tNombre('Rodolfo', 'Sanchez', 'Lopez')
, tDireccion('Oca', '25', '3','1','A','28017','Madrid','Madrid'), '617778899', TO_DATE('2021/05/15', 'yyyy/mm/dd'), 'Indefinido');

-- Ejercicio 4

SELECT V.NOMBRECOMPLETO.GETAPELIDONOMBRE(),
 V.getMeses() FROM VENDEDOR V;

