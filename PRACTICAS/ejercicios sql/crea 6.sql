create table personaempresa(
    dni varchar2(9) CONSTRAINT clave_primaria primary key,
    nombre varchar2(20),
    direccion varchar2(50)
);

create table factura(
    nfactura int CONSTRAINT clave_primaria primary key,
    fecha date
);

create table articulo(
    codart int primary key,
    precio int,
    iva int,
    importe int,
    descripcion varchar2(50)
);

create table emite(
    dni references personaempresa(dni),
    nfactura references factura(nempresa),
    primary key (dni, nfactura)
);

create table recibe(
    dni references personaempresa(dni),
    nfactura references factura(nempresa),
    primary key (dni, nfactura)
);

create table linea(
    cantidad int,
    nfactura references factura(nempresa),
    codart references articulo(codart),
    primary key (nfactura, codart)
);
