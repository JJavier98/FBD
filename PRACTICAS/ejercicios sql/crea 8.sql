create table sala(
    codsala int not null primary key,
    num_asientos int 
);

create table pelicula(
    codpelicula int not null primary key,
    titulo varchar(15),
    duracion int
);

create table asiento(
    codsala references sala(codsala),
    fila int not null,
    columna int not null,
    ocupado char(2) 
        check(ocupado in ('si' , 'no')),
    primary key(codsala,fila,columna)
);

create table copia(
    codpelicula references pelicula(codpelicula),
    num_copia int not null ,
    primary key(codpelicula,num_copia)
);

create table proyeccion(
    codsala references sala(codsala),
    codpelicula int ,
    num_copia int,
    fecha int,
    hora int,
    foreign key(codpelicula,num_copia) references copia(codpelicula,num_copia),
    primary key(codsala,fecha,hora)
);

create table entrada(
    fila int,
    columna int,
    codsala int,
    codpelicula int,
    fecha int,
    hora int,
    foreign key(fila,columna,codsala) references asiento(fila,columna,codsala),
    foreign key(codsala,fecha,hora) references proyeccion(codsala,fecha,hora),
    primary key(fila,columna,codsala,fecha,hora)
);