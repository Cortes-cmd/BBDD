--1

CREATE OR REPLACE TYPE tSocio AS OBJECT (
    NIF VARCHAR2(20),
    Nombre VARCHAR2(100),
    Tlf VARCHAR2(20),
    MEMBER FUNCTION getSocio RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tSocio AS 
    MEMBER FUNCTION getSocio RETURN VARCHAR2 IS
    BEGIN
        RETURN 'NIF: ' || NIF || ', Nombre: ' || Nombre || ', Teléfono: ' || Tlf;
    END;
END;
/

-- 2

CREATE TABLE Socio OF tSocio (
    NIF PRIMARY KEY
);

-- 3

INSERT INTO Socio VALUES (tSocio('12345678A', 'Juan Pérez', '600123456'));
INSERT INTO Socio VALUES (tSocio('87654321B', 'María López', '611654987'));

-- 4

CREATE OR REPLACE TYPE tLibro AS OBJECT (
    Referencia NUMBER,
    Titulo VARCHAR2(100),
    Autor VARCHAR2(100),
    Editorial VARCHAR2(100),
    FechaPrestamo DATE,
    NIFSocio VARCHAR2(20),
    MEMBER FUNCTION getLibro RETURN VARCHAR2,
    MEMBER FUNCTION diasPrestamo RETURN NUMBER,
    MEMBER FUNCTION diasMulta RETURN NUMBER
);
/
CREATE OR REPLACE TYPE BODY tLibro AS 
    MEMBER FUNCTION getLibro RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Referencia: ' || Referencia || ', Título: ' || Titulo || 
               ', Autor: ' || Autor || ', Editorial: ' || Editorial;
    END;

    MEMBER FUNCTION diasPrestamo RETURN NUMBER IS
    BEGIN
        RETURN TRUNC(SYSDATE - FechaPrestamo);
    END;

    MEMBER FUNCTION diasMulta RETURN NUMBER IS
    BEGIN
        RETURN GREATEST(0, TRUNC(SYSDATE - FechaPrestamo) - 7);
    END;
END;
/
-- 5

CREATE TABLE Libro OF tLibro (
    Referencia PRIMARY KEY,
    NIFSocio REFERENCES Socio(NIF)
);

-- 6

INSERT INTO Libro VALUES (tLibro(1, 'Cien años de soledad', 'Gabriel García Márquez', 'Sudamericana', TO_DATE('2024-03-25', 'YYYY-MM-DD'), '12345678A'));
INSERT INTO Libro VALUES (tLibro(2, '1984', 'George Orwell', 'Secker y Warburg', TO_DATE('2024-03-20', 'YYYY-MM-DD'), '87654321B'));
INSERT INTO Libro VALUES (tLibro(3, 'El principito', 'Antoine de Saint-Exupéry', 'Reynal y Hitchcock', TO_DATE('2024-03-30', 'YYYY-MM-DD'), '87654321B'));
INSERT INTO Libro VALUES (tLibro(4, 'Don Quijote', 'Miguel de Cervantes', 'Francisco de Robles', TO_DATE('2024-03-18', 'YYYY-MM-DD'), '12345678A'));


SELECT * FROM Socio ;

-- 7

-- La cantidad de socios que tienen libros, y cuántos
SELECT S.NIF, S.Nombre, COUNT(L.Referencia) AS cantidad_libros
FROM Socio S
LEFT JOIN Libro L ON S.NIF = L.NIFSocio
GROUP BY S.NIF, S.Nombre;


-- Muestra todos los libros que han sido prestados
SELECT L.getLibro() AS DetallesLibro
FROM Libro L;


-- Cuántos días llevan prestados los libros y cuántos días de multa llevan acumulados estos 
SELECT L.Titulo, L.diasPrestamo() AS Dias_Prestamo, L.diasMulta() AS Dias_Multa
FROM Libro L;


-- Uso 2 métodos para mostrar los detalles del socio con el libro solicitado
SELECT S.getSocio() AS DetallesSocio, L.getLibro() AS DetallesLibro
FROM Socio S
INNER JOIN Libro L ON S.NIF = L.NIFSocio;


-- Todos los libros que tienen al menos 1 día de multa (todos tienen por los datos del insert into)
SELECT L.Titulo, L.diasPrestamo() AS Dias_Prestamo, L.diasMulta() AS Dias_Multa
FROM Libro L
WHERE L.diasMulta() > 0;


-- Muestra los libros, su autor, y la fecha en la que fueron prestados
SELECT L.Titulo, L.Autor, L.FechaPrestamo
FROM Libro L
ORDER BY L.FechaPrestamo ASC;



-- Obtiene todos los días en total que han estado prestados los libros en su conjunto
SELECT SUM(L.diasPrestamo()) AS Total_Dias_Prestamo
FROM Libro L;


-- Muestra los libros que lleven dias de multa, junto con el nombre y NIF del cliente que posee dichos libros
SELECT S.NIF, S.Nombre, L.Titulo, L.diasMulta() AS DiasMulta
FROM Socio S
JOIN Libro L ON S.NIF = L.NIFSocio
WHERE L.diasMulta() > 0;



