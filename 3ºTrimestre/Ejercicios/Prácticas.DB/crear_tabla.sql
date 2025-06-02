create database akihabara_db ;

GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON akihabara_db.producto TO 'userAkihabara '@'localhost';

GRANT CREATE ON akihabara_db.producto TO 'userAkihabara '@'localhost';

CREATE TABLE producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    categoria set('Figura', 'Manga', 'Póster', 'Llavero', 'Ropa'),
    precio DECIMAL(10,2),
    stock INT
);


INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Figura de Goku', 'Figura', 29.99, 15);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Tomo 1 de One Piece', 'Manga', 8.50, 50);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Póster de Naruto', 'Póster', 12.00, 30);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Llavero Dragon Ball', 'Llavero', 4.99, 100);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Camiseta Akihabara', 'Ropa', 19.95, 20);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Figura de Vegeta', 'Figura', 35.00, 10);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Tomo 2 de Naruto', 'Manga', 9.00, 45);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Póster Attack on Titan', 'Póster,Llavero', 15.50, 25);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Llavero Sailor Moon', 'Llavero', 5.50, 75);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Sudadera Naruto', 'Ropa', 29.99, 12);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Figura de Totoro', 'Figura', 22.00, 8);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Tomo 3 de One Piece', 'Manga', 8.75, 40);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Póster My Hero Academia', 'Póster', 13.00, 30);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Llavero Pokémon', 'Llavero,Ropa', 6.99, 90);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Camiseta Goku', 'Ropa', 18.50, 22);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Figura de Luffy', 'Figura', 28.50, 14);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Tomo 4 de Naruto', 'Manga', 9.25, 35);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Póster Tokyo Ghoul', 'Póster', 14.50, 27);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Llavero Dragon Ball', 'Llavero', 5.00, 95);
INSERT INTO producto (nombre, categoria, precio, stock) VALUES ('Sudadera One Piece', 'Ropa', 31.00, 11);

