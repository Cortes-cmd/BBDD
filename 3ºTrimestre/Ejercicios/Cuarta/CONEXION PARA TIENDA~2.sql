CREATE OR REPLACE TYPE tEmpleado AS OBJECT (
    id NUMBER,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    salario NUMBER(10,2),

    MEMBER FUNCTION salario_anual RETURN NUMBER
);


CREATE OR REPLACE TYPE BODY tEmpleado AS 
    MEMBER FUNCTION salario_anual RETURN NUMBER IS
    BEGIN
        RETURN salario * 12;
    END;
END;


CREATE TABLE EMPLEADO OF tEmpleado;



INSERT INTO EMPLEADO VALUES (1, 'Carlos', 'Pérez', 1800);
INSERT INTO EMPLEADO VALUES (2, 'Ana', 'López', 2200);
INSERT INTO EMPLEADO VALUES (3, 'Pedro', 'Gómez', 1950);
INSERT INTO EMPLEADO VALUES (4, 'Elena', 'Martín', 2500);
INSERT INTO EMPLEADO VALUES (5, 'Luis', 'Ramírez', 2100);


-- 1

SELECT e.id, e.nombre, e.apellido, e.salario, e.salario_anual() AS Salario_Anual
FROM EMPLEADO e;


-- 2

SELECT e.* FROM EMPLEADO e WHERE salario > 2000;

-- 3

SELECT nombre, apellido, salario 
FROM EMPLEADO 
ORDER BY salario DESC;

-- 4

SELECT COUNT(*) AS Empleados_Menor_2000
FROM EMPLEADO e 
WHERE salario < 2000;

-- 5

SELECT nombre, apellido, salario 
FROM EMPLEADO 
WHERE salario = (SELECT MAX(salario) FROM EMPLEADO e);
