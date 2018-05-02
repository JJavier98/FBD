create table producto(
    codigo int primary key,
    fabricante varchar(15),
    pvp int 
);

create table impresora(
    codigo references producto(codigo),
    color varchar(10),
    resolucion int,
    tipo varchar(10),
    primary key(codigo)
);

create table pc(
    codigo references producto(codigo),
    procesador varchar(20),
    velocidad int,
    ram int,
    primary key(codigo)
);

create table portatil(
    codigo references pc(codigo) primary key,
    tamaño_pantalla int
);    
