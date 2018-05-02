create table tarjeta(
    numero_tarjeta int primary key,
    tipo varchar(15)
);

create table titular(
    DNI varchar(9) primary key,
    domicilio varchar(20),
    telefono int
);

create table cuenta_corriente(
    codigo int primary key,
    saldo int,
    fecha_apertura date
);

create table titular(
    num_tarjeta references tarjeta(numero_tarjeta),
    id_titular references titular(DNI),
    primary key(num_tarjeta)
);

create table vinculada(
    id_cliente references titular(DNI),
    cod_cuenta references cuenta_corriente(codigo),
    primary key(cod_cuenta)
);
