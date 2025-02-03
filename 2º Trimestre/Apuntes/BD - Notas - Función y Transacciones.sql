create table alumnos (

idalumno int auto_increment primary key,
nombre varchar(15)

);

create table asignatura (

idasignatura int auto_increment primary key,
nombre varchar(55)

);

insert into alumnos (nombre) values ("Mordekaiser");
insert into alumnos (nombre) values ("Latón");
insert into alumnos (nombre) values ("Aluminio");
insert into alumnos (nombre) values ("Hierro");
insert into alumnos (nombre) values ("Cobre");



insert into asignatura (nombre) values ("Bases de datos");
insert into asignatura (nombre) values ("Programación");
insert into asignatura (nombre) values ("Lenguaje de Marcas");
insert into asignatura (nombre) values ("Entornos de Desarrollo");
insert into asignatura (nombre) values ("IPE");

select * from asignatura;

call CrearNotas();

select round(rand()*10, 2);

call CrearNotas();

select a.nombre ,g.nombre,n.nota,
Calificacion(n.nota)
from nota n inner join alumnos a
on n.idAlumno = a.idalumno
inner join asignatura g
on n.idAsignatura = g.idasignatura;

select * from nota