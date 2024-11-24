-- crear base de datos bliblioteca

create database biblioteca charset utf8mb4;
use biblioteca;

create table autor (
idautor int auto_increment primary key,
nombres varchar (50) not null,
apellidos varchar (50) not null,
nacionalidad varchar (50) not null
);

create table editorial (
ideditorial int auto_increment primary key,
nombre varchar (50) not null
);

create table libro (
idlibro int auto_increment primary key,
titulo varchar (50) not null,
categoria varchar (50) not null,
fechapublicacion date not null,
idioma varchar (50) not null,
idautor int not null,
ideditorial int not null,
foreign key (idautor) references autor(idautor),
foreign key (ideditorial) references editorial(ideditorial)

);

# Insertar 3 editoriales como: Norma,Aguilar, Alfaguairaonsu

insert into editorial 
values 
(null, "Norma"),
(null, "Aguilar"),
(null, "Alfaguairaonsu");



# Consulta donde muestre todas las editoriales existentes
select * from editorial;


# Insertar 2 autores de nacionalidad colombiano
insert into autor
values
(null, "German", "Castro Caicedo", "colombiano"),
(null, "Gabriel", "Garcia Marquez", "colombiano");

select * from autor;

# Insertar 2 autores de nacionalidad Peruano
insert into autor
values
(null, "Pablo", "Perez Porras", "Peruano"),
(null, "santiago", "saenz soto", "peruano");

select * from autor;

# Insertar un autor de nacionalidad mexicano
insert into autor
values
(null, "carlos", "cortez copete", "Mexicano"),
(null, "julio", "jota jazz", "Mexicano");

select * from autor;


# Consulta donde muestre todos los autores registrados
select * from autor;

# Insertar un libro para cada autor. En cada inserción trate de cambiar la editorial.

insert into libro 
values 
(null, "El Karma", "Narrativa", "1985-01-01", "Español", 1, 1), 
(null, "Cien Años de Soledad", "Ficcion", "1967-05-30", "Español", 2, 2),
(null, "La Tierra Roja", "Historia", "1990-06-15", "Español", 3, 3), 
(null, "El Viaje Infinito", "Fantasia", "2010-03-22", "Español", 4, 1), 
(null, "Los Ojos de la Selva", "Aventura", "2005-09-10", "Español", 5, 2),
(null, "Melodias del Alma", "Poesia", "2020-12-01", "Español", 6, 3); 

select * from libro;

# Consulta donde muestre los libros registrados incluyendo los datos del autor
select 
    l.idlibro as ID_Libro,
    l.titulo as Titulo,
    l.categoria as Categoria,
    l.fechapublicacion as Fecha_Publicacion,
    l.idioma as Idioma,
    a.nombres as Nombre_Autor,
    a.apellidos as Apellido_Autor,
    a.nacionalidad as Nacionalidad_Autor
from 
    libro l
inner join 
    autor a
on 
    l.idautor = a.idautor;
    
    
# Actualice el nombre de la editorial Alfaguaira por Alfaguara

select * from editorial;
select * from Editorial where nombre = 'Alfaguaira';

update Editorial 
set nombre = 'Alfaguara' 
where 
idEditorial = (select idEditorial from (select * from Editorial) as temporal 
where nombre = 'Alfaguaira');

use biblioteca;
# Consulta donde muestre la editorial de nombre Alfaguara
select *
from editorial
where nombre = 'Alfaguara';

# Actualice el nombre de autor mexicano por Vicente y también los apellidos por Fernández.
select idAutor from Autor where nacionalidad = 'Mexicano' limit 1;

update Autor
set nombres = 'Vicente', apellidos = 'Fernández'
where idAutor = 5;


# Consulta donde muestre el autor de nacionalidad “Mexicano”
select * 
from Autor 
where nacionalidad = 'Mexicano';


# Consulta donde muestre el libro del autor mexicano
select
    l.titulo as libro,
    l.categoria as categoria,
    l.fechaPublicacion as fecha,
    l.idioma as idioma
from Libro l
inner join Autor a on l.idAutor = a.idAutor
where a.nacionalidad = 'Mexicano';

# Actualice el idioma del libro del autor mexicano a “MANDARIN”
update Libro l
inner join Autor a on l.idAutor = a.idAutor
set l.idioma = 'MANDARIN'
where a.nacionalidad = 'Mexicano';

# Consulta donde muestre el libro del autor mexicano

select
    l.titulo as libro,
    l.categoria as categoria,
    l.fechaPublicacion as fecha,
    l.idioma as idioma,
    concat(a.nombres, ' ', a.apellidos) as autor
from Libro l
inner join Autor a
on l.idAutor = a.idAutor
where a.nacionalidad = 'Mexicano';

# Elimine el libro de uno de los autores colombianos
delete from Libro
where idLibro = (
    select idLibro
    from (select l.idLibro 
          from Libro l
          inner join Autor a 
          on l.idAutor = a.idAutor
          where a.nacionalidad = 'Colombiano'
          limit 1) AS temporal
);


# Consulta de todos los libros
select * 
from Libro;

# Elimine todos los libros del idioma “MANDARIN”
delete from Libro
where idLibro in (5, 6, 11, 12, 17, 18);

-- verificamos
select * 
from Libro
where idLibro in (5, 6, 11, 12, 17, 18);

# Consulta de todos los libros
select * 
from Libro;




# ejemplo
update fabricante 
set nombre = "xyz"
where id = 10;

select * from fabricante;
