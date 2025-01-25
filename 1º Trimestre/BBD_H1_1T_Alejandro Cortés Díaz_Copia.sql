drop database if exists SUPERMERCADOPython;
CREATE DATABASE SUPERMERCADOPython;
USE SUPERMERCADOPython;



CREATE TABLE producto (
    idproducto int primary key ,
    nombre varchar(150),
    precio int
);

CREATE TABLE cliente (
    idcliente int auto_increment  primary key ,
    Nombre varchar(100),
    ciudad varchar(50),
    tlf int
);

CREATE TABLE pedido (
    idpedido int auto_increment primary key ,
    idcliente int,
    foreign key (idcliente) references cliente(idcliente)
);

CREATE TABLE detalle (
    idpedido int auto_increment,
    idproducto int,
    precio float,
    unidades int,
    foreign key (idpedido) references pedido(idpedido),
    foreign key (idproducto) references producto(idproducto)
);

START TRANSACTION;
insert into cliente (Nombre,ciudad,tlf) values ("Juan","asd","5346");
INSERT INTO producto VALUES (1, 'Té Dharamsala', 18);
INSERT INTO producto VALUES (2, 'Cerveza tibetana Barley', 19);
INSERT INTO producto VALUES (3, 'Sirope de regaliz', 10);
INSERT INTO producto VALUES (4, 'Especias Cajun del chef Anton', 22);
INSERT INTO producto VALUES (5, 'Mezcla Gumbo del chef Anton', 21.35);
INSERT INTO producto VALUES (6, 'Mermelada de grosellas de la abuela', 25);
INSERT INTO producto VALUES (7, 'Peras secas orgánicas del tío Bob', 30);
INSERT INTO producto VALUES (8, 'Salsa de arándanos Northwoods', 40);
INSERT INTO producto VALUES (9, 'Buey Mishi Kobe', 97);
INSERT INTO producto VALUES (10, 'Pez espada', 31);
INSERT INTO producto VALUES (11, 'Queso Cabrales', 21);
INSERT INTO producto VALUES (12, 'Queso Manchego La Pastora', 38);
INSERT INTO producto VALUES (13, 'Algas Konbu', 6);
INSERT INTO producto VALUES (14, 'Cuajada de judías', 23.25);
INSERT INTO producto VALUES (15, 'Salsa de soja baja en sodio', 15.5);
INSERT INTO producto VALUES (16, 'Postre de merengue Pavlova', 17.45);
INSERT INTO producto VALUES (17, 'Cordero Alice Springs', 39);
INSERT INTO producto VALUES (18, 'Langostinos tigre Carnarvon', 62.5);
INSERT INTO producto VALUES (19, 'Pastas de té de chocolate', 9.2);
INSERT INTO producto VALUES (20, 'Mermelada de Sir Rodney''s', 81);
INSERT INTO producto VALUES (21, 'Bollos de Sir Rodney''s', 10);
INSERT INTO producto VALUES (22, 'Pan de centeno crujiente estilo Gustaf''s', 21);
INSERT INTO producto VALUES (23, 'Pan fino', 9);
INSERT INTO producto VALUES (24, 'Refresco Guaraná Fantástica', 4.5);
INSERT INTO producto VALUES (25, 'Crema de chocolate y nueces NuNuCa', 14);
INSERT INTO producto VALUES (26, 'Ositos de goma Gumbär', 31.23);
INSERT INTO producto VALUES (27, 'Chocolate Schoggi', 43.9);
INSERT INTO producto VALUES (28, 'Col fermentada Rössle', 45.6);
INSERT INTO producto VALUES (29, 'Salchicha Thüringer', 123.79);
INSERT INTO producto VALUES (30, 'Arenque blanco del noroeste', 25.89);
INSERT INTO producto VALUES (31, 'Queso gorgonzola Telino', 12.5);
INSERT INTO producto VALUES (32, 'Queso Mascarpone Fabioli', 32);
INSERT INTO producto VALUES (33, 'Queso de cabra', 2.5);
INSERT INTO producto VALUES (34, 'Cerveza Sasquatch', 14);
INSERT INTO producto VALUES (35, 'Cerveza negra Steeleye', 18);
INSERT INTO producto VALUES (36, 'Escabeche de arenque', 19);
INSERT INTO producto VALUES (37, 'Salmón ahumado Gravad', 26);
INSERT INTO producto VALUES (38, 'Vino Côte de Blaye', 263.5);
INSERT INTO producto VALUES (39, 'Licor verde Chartreuse', 18);
INSERT INTO producto VALUES (40, 'Carne de cangrejo de Boston', 18.4);
INSERT INTO producto VALUES (41, 'Crema de almejas estilo Nueva Inglaterra', 9.65);
INSERT INTO producto VALUES (42, 'Tallarines de Singapur', 14);
INSERT INTO producto VALUES (43, 'Café de Malasia', 46);
INSERT INTO producto VALUES (44, 'Azúcar negra Malacca', 19.45);
INSERT INTO producto VALUES (45, 'Arenque ahumado', 9.5);
INSERT INTO producto VALUES (46, 'Arenque salado', 12);
INSERT INTO producto VALUES (47, 'Galletas Zaanse', 9.5);
INSERT INTO producto VALUES (48, 'Chocolate holandés', 12.75);
INSERT INTO producto VALUES (49, 'Regaliz', 20);
INSERT INTO producto VALUES (50, 'Chocolate blanco', 16.25);
INSERT INTO producto VALUES (51, 'Manzanas secas Manjimup', 53);
INSERT INTO producto VALUES (52, 'Cereales para Filo', 7);
INSERT INTO producto VALUES (53, 'Empanada de carne', 32.8);
INSERT INTO producto VALUES (54, 'Empanada de cerdo', 7.45);
INSERT INTO producto VALUES (55, 'Paté chino', 24);
INSERT INTO producto VALUES (56, 'Gnocchi de la abuela Alicia', 38);
INSERT INTO producto VALUES (57, 'Raviolis Angelo', 19.5);
INSERT INTO producto VALUES (58, 'Caracoles de Borgoña', 13.25);
INSERT INTO producto VALUES (59, 'Raclet de queso Courdavault', 55);
INSERT INTO producto VALUES (60, 'Camembert Pierrot', 34);
INSERT INTO producto VALUES (61, 'Sirope de arce', 28.5);
INSERT INTO producto VALUES (62, 'Tarta de azúcar', 49.3);
INSERT INTO producto VALUES (63, 'Sandwich de vegetales', 43.9);
INSERT INTO producto VALUES (64, 'Bollos de pan de Wimmer', 33.25);
INSERT INTO producto VALUES (65, 'Salsa de pimiento picante de Luisiana', 21.05);
INSERT INTO producto VALUES (66, 'Especias picantes de Luisiana', 17);
INSERT INTO producto VALUES (67, 'Cerveza Laughing Lumberjack', 14);
INSERT INTO producto VALUES (68, 'Barras de pan de Escocia', 12.5);
INSERT INTO producto VALUES (69, 'Queso Gudbrandsdals', 36);
INSERT INTO producto VALUES (70, 'Cerveza Outback', 15);
INSERT INTO producto VALUES (71, 'Crema de queso Fløtemys', 21.5);
INSERT INTO producto VALUES (72, 'Queso Mozzarella Giovanni', 34.8);
INSERT INTO producto VALUES (73, 'Caviar rojo', 15);
INSERT INTO producto VALUES (74, 'Queso de soja Longlife', 10);
INSERT INTO producto VALUES (75, 'Cerveza Klosterbier Rhönbräu', 7.75);
INSERT INTO producto VALUES (76, 'Licor Cloudberry', 18);
INSERT INTO producto VALUES (77, 'Salsa verde original Frankfurter', 13);

COMMIT;
