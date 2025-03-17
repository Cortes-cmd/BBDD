-- Creamos objeto. En Oracle, es necesario marcar que no es una clase final, es decir, que va a tener herencias, de lo contrario, será final por default

CREATE OR REPLACE TYPE tDomicilio AS OBJECT (
    calle varchar(50),
    numero int,
    piso int,
    escalera int,
    puerta char(2),
    MEMBER FUNCTION getDomicilio RETURN varchar
) NOT FINAL;

-- Create funcion

CREATE TYPE BODY tDomicilio AS
    MEMBER FUNCTION getDomicilio RETURN varchar IS
    BEGIN
        RETURN calle||' '||numero|| ' Piso: '||piso||' Escalera: '||escalera||
            ' Puerta: '||puerta;
    END;
END;

-- Create table cliente
CREATE TABLE CLIENTE (
    NIF char(9) PRIMARY KEY,
    NOMBRE varchar(50),
    DIRECCION TDIRECCION,
    TLF varchar(25)
);



-- Insertamos cliente
INSERT INTO CLIENTE VALUES (
    '11111111A', 
    'ROSA PEREZ DELGADO', 
    TDOMICILIO('Astro',25,3,1,'A'),
    '913678090', 
    'MADRID'); 
    
-- Mostramos cliente {AQUI LOS ALIAS SON OBLIGATORIOS}
    
SELECT c.NIF, c.NOMBRE, c.domicilio.getDomicilio()
FROM CLIENTE c;

SELECT c.NIF, c.NOMBRE, c.domicilio.getDomicilio()
FROM CLIENTE c;


-- Creamos tDireccion, que es como el inherits, indica de dónde hereda
CREATE OR REPLACE TYPE tDireccion UNDER tDomicilio (
    cp char(5),
    localidad varchar(25),
    provincia varchar(25),
    MEMBER FUNCTION getDireccion RETURN varchar
);


-- Función

CREATE TYPE BODY tDireccion AS
    MEMBER FUNCTION getDireccion RETURN varchar IS
    BEGIN
        RETURN SELF.getDomicilio||' '||cp||' '||localidad||' '||provincia;
    END;
END;


-- Añado insert intos a cliente

INSERT INTO CLIENTE VALUES (
    '11111111A', 
    'ROSA PEREZ DELGADO', 
    TDIRECCION('Astro',25,3,1,'A', '28003', 'Madrid', 'Madrid'),
    '913678090'
);


INSERT INTO CLIENTE VALUES (
    '22222222B', 
    'MARIANO RODOLFO DEL VALL', 
    TDIRECCION('Sol',7,3,2,'A', '41410', 'Carmona', 'Sevilla'),
    '616667788'
);


INSERT INTO CLIENTE VALUES (
    '33333333C', 
    'CARLOS MALDONADO PEREZ', 
    TDIRECCION('Luna',12,4,2,'A', '41200', 'Alcalá del Río', 'Sevilla'),
    '617771166'
);


INSERT INTO CLIENTE VALUES (
    '44444444C', 
    'PERICO DE LOS PALOTES LARGOS', 
    TDIRECCION('Oca',9,4,1,'A', '28025', 'Madrid', 'Madrid'),
    '67778877'
);

-- Realizo una consulta sobre las tablas con valores insertados

SELECT 
    cli.nombre, 
    cli.tlf, 
    cli.direccion.calle, 
    cli.direccion.numero
FROM cliente cli;


-- uso la funcion a parte que posee el objeto cliente 
SELECT 
    cli.nombre, 
    cli.tlf, 
    cli.direccion.getDireccion()
FROM cliente cli;	

-- COMIENZA EJERCICIO --


-- Creo la tabla tNombre --
CREATE OR REPLACE TYPE tNombre AS OBJECT (
    nombre VARCHAR(25),
    apellido1 VARCHAR(25),
    apellido2 VARCHAR(25),
    MEMBER FUNCTION getApellidosNombre RETURN VARCHAR,
    MEMBER FUNCTION getNombreApellidos RETURN VARCHAR
) NOT FINAL;


-- Creo los métodos de tNombre --

CREATE OR REPLACE TYPE BODY tNombre AS
    MEMBER FUNCTION getApellidosNombre RETURN VARCHAR IS
    BEGIN
        RETURN apellido1 || ' ' || apellido2 || ', ' || nombre;
    END;
    
    MEMBER FUNCTION getNombreApellidos RETURN VARCHAR IS
    BEGIN
        RETURN nombre || ' ' || apellido1 || ' ' || apellido2;
    END;
END;


-- Modifico la tabla Cliente --

ALTER TABLE CLIENTE ADD (NOMBRECOMPLETO tNombre);

-- Actualizo los datos de los clientes --

UPDATE CLIENTE 
SET NOMBRECOMPLETO = tNombre('ROSA', 'PEREZ', 'DELGADO')
WHERE NIF = '11111111A';

UPDATE CLIENTE 
SET NOMBRECOMPLETO = tNombre('MARIANO', 'RODOLFO', 'DEL VALL')
WHERE NIF = '22222222B';

UPDATE CLIENTE 
SET NOMBRECOMPLETO = tNombre('CARLOS', 'MALDONADO', 'PEREZ')
WHERE NIF = '33333333C';

UPDATE CLIENTE 
SET NOMBRECOMPLETO = tNombre('PERICO', 'DE LOS PALOTES', 'LARGOS')
WHERE NIF = '44444444C';


-- Elimino la columna Nombre --

ALTER TABLE CLIENTE DROP COLUMN NOMBRE;

-- Ejecuto consulta --

SELECT 
    c.NIF, 
    c.NOMBRECOMPLETO.getApellidosNombre() AS NOMBRE, 
    c.TLF 
FROM CLIENTE c;

