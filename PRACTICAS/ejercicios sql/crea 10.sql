create table Ingredientes(
    codi varchar2(10) constraint codi_no_nulo not null,
    nombre varchar2(20) constraint nombre_no_nulo not null,
    precio number(5,2),
    tipo varchar2(10),
    constraint clave_primaria_ingredientes primary key(codi, nombre),
    constraint limite_precio check(precio >= 0 and precio < 999)
);

create table Receta(
    codr varchar2(10) constraint codr_no_nulo not null,
    numero_pasos int constraint numero_pasos_no_nulo not null,
    nombre varchar2(20),
    tipo varchar2(10),
    dificultad varchar2(7),
    constraint clave_primaria_receta primary key(codr, numero_pasos)
);

create table Usa(
    codi,
    nombre,
    codr,
    numero_pasos,
    cantidad number(5,2),
    constraint clave_primaria_usa primary key(codi, nombre, codr, numero_pasos),
    constraint claves_externas_ingredientes foreign key(codi, nombre) references Ingredientes(codi, nombre),
    constraint claves_externas_receta foreign key(codr, numero_pasos) references Receta(codr, numero_pasos)
);

create table Pasos_ejecucion(
    codr,
    numero_pasos,
    constraint claves_externas_pasos foreign key(codr, numero_pasos) references Receta(codr, numero_pasos)
);