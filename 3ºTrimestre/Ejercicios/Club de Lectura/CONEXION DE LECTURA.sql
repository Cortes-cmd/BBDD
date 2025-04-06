CREATE OR REPLACE TYPE tLector AS OBJECT (
    nombre VARCHAR2(100),
    email VARCHAR2(150),
    MEMBER FUNCTION verLector RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY tLector AS
    MEMBER FUNCTION verLector RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Lector: ' || nombre || ' - Email: ' || email;
    END verLector;
END;
/

-- Creo array

CREATE OR REPLACE TYPE tLectores AS VARRAY(15) OF tLector;
/


-- Siguiente tipo

CREATE OR REPLACE TYPE tReunion AS OBJECT (
    idReunion INT,
    organizador VARCHAR2(100),
    fecha DATE,
    libro VARCHAR2(200),
    lectores tLectores,
    MEMBER FUNCTION resumenReunion RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY tReunion AS
    MEMBER FUNCTION resumenReunion RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Reunión del libro "' || libro || '" organizada por ' ||
               organizador || ' el ' || TO_CHAR(fecha, 'DD/MM/YYYY');
    END resumenReunion;
END;
/

-- Creo tabla Reunion

CREATE TABLE REUNION OF tReunion (
    PRIMARY KEY (idReunion)
);
/



-- Insert intos

INSERT INTO REUNION VALUES (
    1, 'Juan Pérez',
    TO_DATE('2025-04-10', 'YYYY-MM-DD'),
    '1984',
    tLectores (
        tLector('Ana Gómez', 'ana@example.com'),
        tLector('Luis Martínez', 'luis@example.com'),
        tLector('Sofía López', 'sofia@example.com')
    )
);

INSERT INTO REUNION VALUES (
    2, 'María González',
    TO_DATE('2025-05-15', 'YYYY-MM-DD'),
    'Cien años de soledad',
    tLectores (
        tLector('Carlos Fernández', 'carlos@example.com'),
        tLector('Elena Ramírez', 'elena@example.com'),
        tLector('Pedro Núñez', 'pedro@example.com')
    )
);
/

--Procedure

CREATE OR REPLACE PROCEDURE mostrarReunionesPorId(idReu NUMBER) IS
    v_reunion tReunion;
BEGIN
    -- Obtener la reunión
    SELECT VALUE(r) INTO v_reunion
    FROM REUNION r
    WHERE r.idReunion = idReu;

    -- Mostrar información de la reunión
    DBMS_OUTPUT.PUT_LINE(v_reunion.resumenReunion);

    -- Mostrar la lista de lectores
    DBMS_OUTPUT.PUT_LINE('Lectores:');
    FOR i IN 1 .. v_reunion.lectores.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('  - ' || v_reunion.lectores(i).verLector);
    END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe ninguna reunión con ID ' || idReu);
END;
/


-- Llamo a los procedimientos

SET SERVEROUTPUT ON;
CALL mostrarReunionesPorId(1);
CALL mostrarReunionesPorId(2);
