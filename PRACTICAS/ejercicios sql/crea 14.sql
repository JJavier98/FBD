create table delincuente(
    DNI varchar(9) primary key,
    nombre_completo varchar(20),
    nacimiento date,
    domicilio varchar(20),
    nacionalidad varchar(20)
);

create table delito(
    codigo varchar(20) primary key,
    nombre varchar(20),
    tipo varchar(20),
    pena_maxima varchar(50),
    pena_minima varchar(20)
);

create table agente(
    numero_placa int primary key,
    DNI varchar(9),
    nombre_completo varchar(20),
    domicilio varchar(20),
    fecha_ingreso date
);

create table comisaria(
    nobre varchar(20) primary key,
    localizacion varchar(20)
);

create table policia(
    numero_placa int references agente(numero_placa),
    primary key(numero_placa)
);

create table oficial(
    numero_placa int references agente(numero_placa),
    especialidad varchar(20),
    experiencia varchar(20),
    primary key(numero_placa)
);

create table comete(
    DNI_delincuente varchar(9) references delincuente(DNI),
    codigo_delito varchar(20) references delito(codigo),
    lugar varchar(20),
    fecha date,
    hora int,
    primary key(DNI_delincuente, codigo_delito)
);

create table detencion(
    DNI_delincuente varchar(9) references delincuente(DNI),
    numero_placa int references agente(numero_placa),
    lugar varchar(20),
    fecha date,
    hora int,
    primary key(numero_placa)
);

create table responsable(
    numero_placa_policias int references policia(numero_placa),
    numero_placa_oficial int references policia(numero_placa),
    numero_policias int,
    primary key(numero_placa_policias)
);

create table dirige(
    nobre_comisaria varchar(20) references comisaria(nombre),
    numero_placa_oficial int references policia(numero_placa),
    primary key(nobre_comisaria)
);