drop database if exists inmobiliaria;
create database inmobiliaria  character set utf8mb4;

use inmobiliaria;

create table propietarios (
    idpropietario int auto_increment primary key,
    nombre_completo varchar(100),
    direccion varchar(150),
    telefono varchar(15)
);

create table arrendatarios (
    idarrendatario int auto_increment primary key,
    nombre_completo varchar(100),
    correo varchar(100),
    telefono varchar(15)
);

create table casas (
    idcasa int auto_increment primary key,
    direccion varchar(150),
    estrato int,
    numero_habitaciones int,
    numero_banos int,
    area decimal(10, 2),
    valor_arriendo decimal(10, 2),
    idpropietario int,
    foreign key (idpropietario) references propietarios(idpropietario)
);

create table arriendos (
    idarriendo int auto_increment primary key,
    idcasa int,
    idarrendatario int,
    fecha_inicial_arriendo date,
    foreign key (idcasa) references casas(idcasa),
    foreign key (idarrendatario) references arrendatarios(idarrendatario)
);


# 1. 
insert into propietarios (nombre_completo, direccion, telefono)
values ('Carlos López', 'Calle 123', '3101234567'), ('Ana García', 'Carrera 45', '3207654321'), ('Luis Pérez', 'Avenida 78', '3009876543');

# 2. 
select * from propietarios;

# 3. 
insert into Casas (direccion, estrato, numero_habitaciones, numero_banos, area, valor_arriendo, idPropietario)
values ('Calle 123A', 2, 3, 2, 120.50, 1000000, 1), ('Carrera 45B', 3, 2, 1, 80.00, 800000, 2), ('Avenida 78C', 4, 4, 3, 150.75, 1500000, 3);

# 4. 
select * from casas;

# 5. 
insert into arrendatarios (nombre_completo, correo, telefono)
values ('Pedro Martínez', 'pedro@example.com', '3101112222'), ('Lucía Fernández', 'lucia@example.com', '3203334444'), 
('Juan Gómez', 'juan@example.com', '3005556666');

# 6.
select * from arrendatarios;

# 7.
# 8. 
insert into arriendos (idcasa, idarrendatario, fecha_inicial_arriendo)
values (1, 1, '2024-11-01'), (2, 2, '2024-11-15');

# 9 
select * from arriendos;

# 10. 
 update propietarios
set nombre_completo = 'Marcos Cepeda Rico'
where idpropietario = 1;


# 11 
select * from propietarios
where nombre_completo = 'Marcos Cepeda Rico';

# 12 
use inmobiliaria;

select idcasa 
from casas;

update casas
set estrato = 3
where idcasa > 0;


# 13 
select * from casas;

# 14.
-- desactivar modo seguro porque no encontre otra forma
set sql_safe_updates = 0;

update casas
set valor_arriendo = valor_arriendo * 1.10;

-- ejecutar el siguiente codigo al finalizar las consultas 
-- para activar modo seguro
set sql_safe_updates = 1;


# 15.
-- Consultar todas las casas con los siguientes datos: dirección, estrato, valor arriendo

select direccion, estrato, valor_arriendo
from casas;

# 16.
update arriendos
set fecha_inicial_arriendo = '2024-11-11'
where fecha_inicial_arriendo = '2024-11-01';

# 17.
select *
from arriendos
where fecha_inicial_arriendo >= '2024-11-01';

# 18. 
delete from arriendos
where fecha_inicial_arriendo = '2024-11-15';

# 19
select *
from arriendos;
