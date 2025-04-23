-- Creamos las tablas: 

-- Crear tabla ALUMNO
CREATE TABLE ALUMNO (
    idAlumno NUMBER PRIMARY KEY,
    Nombre VARCHAR2(100) NOT NULL
);

-- Crear tabla CALIFICACION
CREATE TABLE CALIFICACION (
    idCalificacion NUMBER PRIMARY KEY,
    idAlumno NUMBER,
    Asignatura VARCHAR2(100) NOT NULL,
    Nota NUMBER(3, 2) NOT NULL,
    CONSTRAINT fk_alumno FOREIGN KEY (idAlumno) REFERENCES ALUMNO(idAlumno)
);

-- Creamos el paquete Gestion

CREATE OR REPLACE PACKAGE GESTION AS

    -- Función NotaTexto
    FUNCTION NotaTexto(pNota NUMBER) RETURN VARCHAR2;
    
    -- Procedimiento Expediente
    PROCEDURE Expediente(pIdAlumno NUMBER);

END GESTION;
/

-- Crear el cuerpo del paquete GESTION
CREATE OR REPLACE PACKAGE BODY GESTION AS

    -- Función NotaTexto
    FUNCTION NotaTexto(pNota NUMBER) RETURN VARCHAR2 IS
    BEGIN
        IF pNota < 5 THEN
            RETURN 'Muy Deficiente';
        ELSIF pNota >= 5 AND pNota < 6 THEN
            RETURN 'Insuficiente';
        ELSIF pNota >= 6 AND pNota < 7 THEN
            RETURN 'Suficiente';
        ELSIF pNota >= 7 AND pNota < 8 THEN
            RETURN 'Bien';
        ELSIF pNota >= 8 AND pNota < 9 THEN
            RETURN 'Notable';
        ELSIF pNota >= 9 AND pNota < 10 THEN
            RETURN 'Sobresaliente';
        ELSE
            RETURN 'Matrícula de Honor';
        END IF;
    END NotaTexto;

    -- Procedimiento Expediente
    PROCEDURE Expediente(pIdAlumno NUMBER) IS
        CURSOR cCalificaciones IS
            SELECT Asignatura, Nota FROM CALIFICACION
            WHERE idAlumno = pIdAlumno;
        vAsignatura VARCHAR2(100);
        vNota NUMBER(3, 2);
    BEGIN
        FOR rCalificacion IN cCalificaciones LOOP
            vAsignatura := rCalificacion.Asignatura;
            vNota := rCalificacion.Nota;
            DBMS_OUTPUT.PUT_LINE('Asignatura: ' || vAsignatura || 
                                 ', Nota: ' || NotaTexto(vNota) || 
                                 ' (' || vNota || ')');
        END LOOP;
    END Expediente;

END GESTION;
/


-- Insertar un alumno
INSERT INTO ALUMNO (idAlumno, Nombre) VALUES (1, 'Juan Pérez');
INSERT INTO ALUMNO (idAlumno, Nombre) VALUES (2, 'Ana García');

-- Insertar calificaciones
INSERT INTO CALIFICACION (idCalificacion, idAlumno, Asignatura, Nota) 
VALUES (1, 1, 'Matemáticas', 8.5);
INSERT INTO CALIFICACION (idCalificacion, idAlumno, Asignatura, Nota) 
VALUES (2, 1, 'Historia', 7.2);
INSERT INTO CALIFICACION (idCalificacion, idAlumno, Asignatura, Nota) 
VALUES (3, 2, 'Física', 5.0);


-- Probar la función NotaTexto
SELECT GESTION.NotaTexto(8.5) FROM DUAL;
SELECT GESTION.NotaTexto(4.5) FROM DUAL;  


-- Mostrar las calificaciones del alumno con id 1
call GESTION.Expediente(1);

