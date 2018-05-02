create table presentador(
    DNI varchar(9) primary key,
    nombre varchar(50),
    especialidad varchar(20)
);

create table programa(
    codigo varchar(15) primary key,
    nombre varchar(30),
    duracion int,
    tipo varchar(20)
);

create table canal(
    nombre varchar(20) primary key,
    empresa varchar(20),
    tipo varchar(15)
);

create table pelicula(
    codigo_programa references programa(codigo),
    titulo varchar(20),
    año int,
    tema varchar(20,
    primary (codigo_programa, keytitulo, año)
);

create table concurso(
    codigo_programa references programa(codigo),
    primary key(codigo_programa)
);

create table informativo(
    codigo_programa references programa(codigo),
    primary key(codigo_programa)
);

create table presenta_concurso(
    codigo_concurso references concurso(codigo_programa),
    primary key(codigo_concurso)
);

create table presenta_informativo(
    codigo_concurso references concurso(codigo_programa),
    codigo_informativo references informativo(codigo_programa),
    primary key(codigo_concurso, codigo_informativo)
);

create table emite(
    fecha date,
    hora int,
    codigo_programa references programa(codigo),
    nombre_canal references canl(nombre),
    primary key(codigo_programa),
    unique(nombre_canal)
);