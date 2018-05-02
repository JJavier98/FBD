create table libro2(
    codlibro int CONSTRAINT clave_primaria primary key,
    titulo varchar2(15)
);

create table tema2(
    tipo varchar2(15) CHECK (tipo IN ('policiaca', 'romantica', 'juvenil', 'novela')),
    primary key (tipo)
);

create table trata2(
    codlibro references libro2(codlibro),
    tipo references tema2(tipo),
    primary key (codlibro, tema2)
);

create table usuario2(
    nombre varchar2(15),
    dni varchar(9) CONSTRAINT clave_primaria primary key
);

create table prestamo2(
    dni references usuario2(dni),
    codlibro references libro2(codlibro),
    primary key (codlibro),
    unique (dni)
);

create table autor2(
    nombre varchar(20) CONSTRAINT clave_primaria primary key
);

create table escrito(
    codlibro references libro2(codlibro),
    nombre references autor2(nombre),
    primary key (codlibro, nombre)
);