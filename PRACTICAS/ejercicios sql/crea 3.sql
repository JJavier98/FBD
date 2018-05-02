create table libro(
    titulo varchar2(15) CONSTRAINT clave_primaria primary key,
    paginas int,
    editorial varchar(15),
    descripcion references tema(descripcion)
);

create table tema(
    tipo varchar2(15) CHECK (tipo IN ('policiaca', 'romantica', 'juvenil', 'novela')),
    primary key (tipo)
);

create table ejemplar(
    titulo references libro(titulo),
    codejemplar int,
    primary key(titulo, codejemplar)
);

create table usuario(
    dni varchar2(9) CONSTRAINT clave_primaria primary key,
    nombre varchar2(20)
);

create table autor(
    nombre varchar2(20) CONSTRAINT clave_primaria primary key,
    nacionalidad varchar(20)
);

create table escrito(
    nombre references autor(nombre),
    titulo references libro(titulo),
    primary key(nombre, titulo)
);

create table prestamo(
    fecha date,
    titulo references libro(titulo),
    codejemplar references ejemplar(codejemplar),
    dni references usuario(dni),
    primary key (fecha, titulo, ejemplar)
);
