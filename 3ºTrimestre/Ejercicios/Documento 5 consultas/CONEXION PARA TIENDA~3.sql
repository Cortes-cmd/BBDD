CREATE TYPE tColores AS VARRAY (10) OF VARCHAR(20);

create or replace TYPE tProducto AS OBJECT (
    codigo char(4),
    descripcion varchar(100),
    colores tColores,
    precio float,
    stock integer,
    minimo integer,
    MEMBER FUNCTION getReponer RETURN integer,
    MEMBER FUNCTION getRecaudacion RETURN float,
    MEMBER FUNCTION getColores RETURN varchar,
    MEMBER FUNCTION getColoresCount RETURN integer,
    MEMBER FUNCTION getColoresFirst RETURN varchar
);

CREATE OR REPLACE TYPE BODY tProducto AS
    MEMBER FUNCTION getReponer RETURN integer IS
    BEGIN
        IF stock<minimo THEN
            RETURN minimo-stock;
        ELSE 
            RETURN 0;
        END IF;
    END;
    MEMBER FUNCTION getRecaudacion RETURN float IS
    BEGIN
        RETURN precio*stock;
    END;
    MEMBER FUNCTION getColores RETURN varchar IS
        cadena varchar(100);
        i int;
    BEGIN
        cadena := 'Disponible en ';
        i := 0;
        LOOP
            i:=i+1;
            cadena:=cadena||colores(i)||' ';
            exit when i=colores.count;
        END LOOP;
        RETURN cadena;
    END;
    MEMBER FUNCTION getColoresCount RETURN integer IS
    BEGIN
        RETURN colores.count;
    END;   
    MEMBER FUNCTION getColoresFirst RETURN varchar IS
    BEGIN
        RETURN colores(1);
    END;
END;


CREATE TABLE PRODUCTO OF tProducto;

ALTER TABLE PRODUCTO ADD PRIMARY KEY (CODIGO);


INSERT INTO PRODUCTO VALUES ('CHA9', 'CHANDAL DE NIÑO 9-10 AÑOS', 
    tColores('Rojo', 'Verde', 'Azul'), 25.50, 7, 10);
INSERT INTO PRODUCTO VALUES ('CH11', 'CHANDAL DE NIÑO 11-12 AÑOS', 
    tColores('Rojo', 'Rosa', 'Azul'), 25.50, 8, 10);
INSERT INTO PRODUCTO VALUES ('CORH', 'CORTA VIENTOS HOMBRE', 
    tColores('Negro', 'Gris'), 15, 3, 5);
INSERT INTO PRODUCTO VALUES ('CORM', 'CORTA VIENTOS MUJER', 
    tColores('Negro', 'Rojo'), 15, 5, 7);
INSERT INTO PRODUCTO VALUES ('PA10', 'PANTALÓN CORTO 10-11 AÑOS', 
    tColores('Rojo', 'Verde', 'Amarillo', 'Azul'), 10, 8, 10);
INSERT INTO PRODUCTO VALUES ('PA12', 'PANTALÓN CORTO 12-13 AÑOS', 
    tColores('Rojo', 'Verde', 'Amarillo', 'Azul'), 10, 4, 10);
INSERT INTO PRODUCTO VALUES ('BAF5', 'BALÓN DE FUTBOL Nº 5', 
    tColores('Amarillo/verde', 'Blanco/negro'), 7, 5, 8);
INSERT INTO PRODUCTO VALUES ('BAF4', 'BALÓN DE FUTBOL Nº 4', 
   tColores('Amarillo/verde', 'Blanco/negro'), 6, 4, 8);
INSERT INTO PRODUCTO VALUES ('BAB5', 'BALÓN DE BALONCESTO Nº 5', 
    tColores('Rojo/negro', 'Blanco/azul'), 7, 5, 8);
INSERT INTO PRODUCTO VALUES ('BAB4', 'BALÓN DE BALONCESTO Nº 4', 
    tColores('Rojo/negro', 'Blanco/azul'), 6, 3, 8);
INSERT INTO PRODUCTO VALUES ('BI20', 'BICICLETA 20 PULGADAS', 
    tColores('Rojo/blanco', 'Azul/blanco'), 150, 2, 4);
    
    
    
CREATE OR REPLACE PROCEDURE verColores IS
    misColores tColores;
    i integer;
BEGIN
    misColores := new TColores('Verde','Rojo','Azul','Amarillo','Rosa');
    i := 0;
    dbms_output.put_line('Te voy a mostrar mis colores favoritos');
    LOOP
        i := i+1;
        dbms_output.put_line(misColores(i));
        EXIT WHEN i=misColores.count;
    END LOOP;
END;

set serveroutput on;

call vercolores();

CREATE OR REPLACE TYPE tFactura AS OBJECT (
    NUMERO INT, 
    FECHA DATE, 
    NIF CHAR(9),
    MEMBER FUNCTION getFactura RETURN varchar
);


CREATE OR REPLACE TYPE BODY tFactura AS
    MEMBER FUNCTION getFactura RETURN varchar IS
    BEGIN
        RETURN 'Factura nº '||numero||' - '||fecha||' - '||nif;
    END;
END;



CREATE TABLE FACTURA OF tFactura;
ALTER TABLE FACTURA ADD PRIMARY KEY (NUMERO);
ALTER TABLE FACTURA ADD 
FOREIGN KEY (NIF) REFERENCES CLIENTE(NIF);




INSERT INTO FACTURA VALUES 
(5000, TO_DATE('2021/05/15', 'yyyy/mm/dd'), '11111111A');
INSERT INTO FACTURA VALUES 
(5001, TO_DATE('2021/05/16', 'yyyy/mm/dd'), '11111111A');
INSERT INTO FACTURA VALUES
(5002, TO_DATE('2021/06/18', 'yyyy/mm/dd'), '22222222B');
INSERT INTO FACTURA VALUES 
(5003, TO_DATE('2021/06/18', 'yyyy/mm/dd'), '22222222B');
INSERT INTO FACTURA VALUES 
(5004, TO_DATE('2021/07/19', 'yyyy/mm/dd'), '33333333C');
INSERT INTO FACTURA VALUES 
(5005, TO_DATE('2021/07/20', 'yyyy/mm/dd'), '33333333C');



SELECT c.nombrecompleto.getNombreApellidos(), f.numero, f.fecha
FROM CLIENTE c INNER JOIN FACTURA f
ON c.NIF = f.NIF;
