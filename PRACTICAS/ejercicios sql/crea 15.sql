create table inmueble(
    registro int primary key,
    tipo varchar(10),
    metros2 int,
    direccion varchar(20)
);

create table cliente(
    dni char(8) primary key,
    nombre varchar(25),
    telefono char(9),
    num_cuenta int
);

create table un_local(
    registro references inmueble(registro) primary key,
    a_estrenar char(2),
    tipo_negocio varchar(15)
);

create table piso(
    registro references inmueble(registro) primary key,
    num_habitaciones int,
    num_baños int,
    planta int
);

create table habitacion(
    registro references piso(registro) primary key,
    tipo varchar(10),
    tamaño int 
);

create table alquiler(
    dni references cliente(dni),
    registro references inmueble(registro),
    fecha_inicio date,
    fecha_fin date,
    precio int,
    primary key(dni,registro,fecha_inicio,fecha_fin)
);    