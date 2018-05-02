create table pieza(
    codigo varchar(20) primary key,
    tipo varchar(20),
    denominacion varchar(20),
    stock boolean,
    precio int
);

create table p_simple(
    codigo references pieza(codigo),
    primary key(codigo)
);

create table p_compuesta(
    codigo references pieza(codigo),
    precio_total int,
    precio_montaje int,
    primary key(codigo)
);

create table formado(
    codigo_pieza_formante references pieza(codigo),
    codigo_pieza_compuesta references p_compuesta(codigo),
    primary key(codigo_pieza_formante);
);