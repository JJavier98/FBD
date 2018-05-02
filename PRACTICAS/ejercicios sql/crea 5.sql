create table peliculas(
    nombre varchar2(20),
    año int,
    actores varchar2(100),
    tema varchar2(20),
    primary key (nombre, año)
);

create table cintas(
    nombre references peliculas(nombre),
    fecha references peliculas(fecha),
    codcinta int,
    sistreproduccion varchar2(20),
    primary key (nombre, fecha, codcina)
);

create table cliente5(
    dni varchar2(9) CONSTRAINT clave_primaria primary key,
    nombre varchar2(20)
);

create table prestamo5(
    codcinta references cintas(codcinta),
    fecha date,
    dni references cliente(dni),
    primary key(dni)
);