create table objeto_astronomico(
    codigo int primary key,
    fecha date,
    observatorio varchar(20)
);

create table constelacion(
    cod_constelacion int primary key,
    nombre varchar(20)
);

create table estrella(
    codigo references objeto_astronomico(codigo) primary key,
    tipo varchar(10)
);

create table forman(
    cod_estrella references estrella(codigo),
    cod_constelacion references constelacion(cod_constelacion),
    primary key(cod_estrella,cod_constelacion)
);

create table planeta(
    codigo references objeto_astronomico(codigo) primary key,
    tipo varchar(10),
    cod_estrella references estrella(codigo),
    años_luz int
);
create table satelite(
    codigo references objeto_astronomico(codigo) primary key,
    tipo varchar(10),
    cod_planeta references planeta(codigo),
    años_luz int
);