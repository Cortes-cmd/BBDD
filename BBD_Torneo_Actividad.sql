
-- Eliminar base de datos existente (si existe) y crear una nueva
DROP DATABASE IF EXISTS Tournament;
CREATE DATABASE Tournament;
USE Tournament;

-- Tabla Equipo
CREATE TABLE equipo (
    nombre_equipo VARCHAR(50) PRIMARY KEY NOT NULL,
    fecha_creacion DATE,
    descripcion VARCHAR(300)
);

-- Tabla Jugador
CREATE TABLE jugador (
    apodo VARCHAR(50) PRIMARY KEY NOT NULL,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT CHECK (edad > 18),
    pais VARCHAR(30),
    nombre_equipo VARCHAR(50),
    FOREIGN KEY (nombre_equipo) REFERENCES equipo(nombre_equipo)
);

-- Tabla Organizador
CREATE TABLE organizador (
    id_organizador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_organizador VARCHAR(100) NOT NULL
);

-- Tabla Torneo
CREATE TABLE torneo (
    id_torneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_torneo VARCHAR(50) NOT NULL,
    fecha_inicio DATE,
    premio VARCHAR(50),
    id_organizador INT,
    FOREIGN KEY (id_organizador) REFERENCES organizador(id_organizador)
);

-- Tabla Participa (relación entre Torneo y Equipo)
CREATE TABLE participa (
    id_torneo INT,
    nombre_equipo VARCHAR(50),
    puntos tinyint,
    PRIMARY KEY (id_torneo, nombre_equipo),
    FOREIGN KEY (id_torneo) REFERENCES torneo(id_torneo),
    FOREIGN KEY (nombre_equipo) REFERENCES equipo(nombre_equipo)
);

-- Inserciones en la tabla Equipo
INSERT INTO equipo (nombre_equipo, fecha_creacion, descripcion) 
VALUES 
('T1', '2003-02-25', 'Equipo coreano de esports.'),
('G2', '2015-02-24', 'Equipo español de esports.'),
('KOI', '2021-01-10', 'Equipo español de esports.'),
('Fnatic', '2004-03-23', 'Equipo inglés de esports.');

-- Inserciones en la tabla Jugador
INSERT INTO jugador (apodo, nombre, apellido, edad, pais, nombre_equipo) 
VALUES 
-- Jugadores de T1
('Zeus', 'Woojeong', 'Choi', 20, 'Corea del Sur', 'T1'),
('Oner', 'Hyunjoon', 'Moon', 21, 'Corea del Sur', 'T1'),
('Faker', 'Sanghyeok', 'Lee', 28, 'Corea del Sur', 'T1'),
('Gumayusi', 'Minhyung', 'Lee', 22, 'Corea del Sur', 'T1'),
('Keria', 'Minseok', 'Ryu', 22, 'Corea del Sur', 'T1'),

-- Jugadores de G2
('Wunder', 'Martin', 'Hansen', 26, 'Dinamarca', 'G2'),
('Jankos', 'Marcin', 'Jankowski', 29, 'Polonia', 'G2'),
('Caps', 'Rasmus', 'Winther', 25, 'Dinamarca', 'G2'),
('Perks', 'Luka', 'Perković', 26, 'Croacia', 'G2'),
('Mikyx', 'Mihael', 'Mehle', 26, 'Eslovenia', 'G2'),

-- Jugadores de KOI
('Myrwn', 'Alex', 'Pastor', 21, 'España', 'KOI'),
('ElYoya', 'Javier', 'Prades', 24, 'España', 'KOI'),
('Jojopyun', 'Joseph', 'Pyun', 20, 'Canadá', 'KOI'),
('Supa', 'David', 'Martinez', 24, 'España', 'KOI'),
('Alvaro', 'Álvaro', 'Fernandez', 21, 'España', 'KOI'),

-- Jugadores de Fnatic
('Oscarinin', 'Óscar', 'Muñoz', 21, 'España', 'Fnatic'),
('Razork', 'Iván', 'Martín', 24, 'España', 'Fnatic'),
('Humanoid', 'Marek', 'Brázda', 24, 'República Checa', 'Fnatic'),
('Noah', 'Donggeun', 'Wang', 20, 'Corea del Sur', 'Fnatic'),
('Jun', 'Jihoon', 'Lee', 22, 'Corea del Sur', 'Fnatic');

-- Inserciones en la tabla Organizador
INSERT INTO organizador (nombre_organizador)
VALUES 
('Riot Games');

-- Inserciones en la tabla Torneo
INSERT INTO torneo (nombre_torneo, fecha_inicio, premio, id_organizador)
VALUES 
('Worlds 2024', '2024-10-01', '1,000,000 USD', 1),
('MSI 2024', '2024-05-10', '500,000 USD', 1),
('Last Stand 2025', '2025-03-15', '300,000 USD', 1);

-- Inserciones en la tabla Participa (relaciones entre torneos y equipos)
INSERT INTO participa (id_torneo, nombre_equipo, puntos)
VALUES
-- Worlds 2024 participantes
(1, 'T1',"4"),
(1, 'G2',"2"),
(1, 'KOI',"1"),
(1, 'Fnatic',"5"),

-- MSI 2024 participantes
(2, 'T1',"3"),
(2, 'G2',"2"),
(2, 'Fnatic',"1"),

-- Last Stand 2025 participantes
(3, 'T1',"3"),
(3, 'KOI',"5"),
(3, 'G2',"2");


