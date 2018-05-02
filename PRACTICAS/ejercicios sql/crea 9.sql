create table Telefonos(
    numero number(9,0) constraint numero_no_nulo not null,
    tipo varchar2(5),
    constraint clave_primaria_telefonos primary key(numero)
);

create table Llamada(
    llamante,
    receptor,
    fecha date constraint fecha_no_nulo not null,
    hora_inicio time constraint hora_inicio_no_nulo not null,
    hora_fin time,
    constraint claves_candidatas unique(fecha, hora_inicio, receptor),
    constraint claves_primarias primary key(llamante, fecha, hora_inicio),
    constraint claves_externa_llamante foreign key(llamante) references Telefonos(numero),
    constraint claves_externa_receptor foreign key(receptor) references Telefonos(numero)
);
