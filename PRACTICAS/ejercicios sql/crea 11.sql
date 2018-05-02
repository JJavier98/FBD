create table Autor(
    codigo varchar2(10) constraint codigo_no_nulo not null,
    nombre varchar(20),
    nacionalidad varchar(10),
    constraint clave_primaria_autor primary key(codigo)
);

create table Revista(
    issn varchar2(12) constraint issn_no_nulo not null,
    nombre varchar2(20),
    editorial varchar2(20),
    constraint clave_primaria_revista primary key(issn)
);

create table Numero(
    issn,
    año int,
    numero int,
    constraint clave_primaria_numero primary key(issn, año, numero),
    constraint clave_externa_numero foreign key(issn) references Revista(issn)
);

create table Articulo(
    titulo varchar2(50) constraint titulo_no_nulo not null,
    año,
    numero,
    issn,
    pagina_inicio int,
    pagina_fin int,
    constraint limite_pagina_inicio check(pagina_inicio > 0 and pagina_inicio < pagina_fin),
    constraint limite_pagina_fin check(pagina_fin > pagina_inicio),
    constraint claves_externas_articulo foreign key(año, numero, issn) references Numero(año, numero, issn),
    constraint clave_primaria_articulo primary key(titulo, año, numero, issn) 
);

create table Escribe(
    codigo,
    titulo,
    año,
    numero,
    issn,
    constraint clave_primaria_escribe primary key(codigo, titulo, año, numero, issn),
    constraint clave_externa_autor foreign key(codigo) references Autor(codigo),
    constraint clave_externa_articulo foreign key(titulo, año, numero, issn) references Articulo(titulo, año, numero, issn)
);

create table Referencia(
    issn_cita,
    año_cita,
    numero_cita,
    titulo_cita,
    issn_citado,
    año_citado,
    numero_citado,
    titulo_citado,
    constraint clave_primaria_referencia primary key(issn_cita, año_cita, numero_cita, titulo_cita, issn_citado, año_citado, numero_citado, titulo_citado),
    constraint clave_externa_articulo_cita foreign key(titulo_cita, año_cita, numero_cita, issn_cita) references Articulo(titulo, año, numero, issn),
    constraint clave_externa_articulo_citado foreign key(titulo_citado, año_citado, numero_citado, issn_citado) references Articulo(titulo, año, numero, issn)
);