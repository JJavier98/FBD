create table Avion(
    identificador_avion varchar2(10) constraint identificador_avion_no_nulo not null,
    capacidad int,
    constraint clave_primaria_avion primary key(identificador_avion)
);

create table Destino(
    identificador_destino varchar2(10) constraint identificador_destino_no_nulo not null,
    nombre varchar2(20),
    constraint clave_primaria_destino primary key(identificador_destino)
);

create table Pasajero(
    dni varchar2(9) constraint dni_no_nulo not null,
    nombre varchar2(30),
    constraint clave_primaria_pasajero primary key(dni)
);

create table Asiento(
    identificador_avion,
    fila int constraint fila_no_nulo not null, 
    numero int constraint numero_no_nulo not null,
    constraint clave_primaria_asiento primary key(identificador_avion, fila, numero),
    constraint clave_externa_avion foreign key(identificador_avion) references Avion(identificador_avion)
);

create table Trayecto(
    identificador_destino,
    ciudad_salida varchar2(20) constraint ciudad_salida_no_nulo not null,
    ciudad_llegada varchar(20) constraint ciudad_llegada_no_nulo not null,
    constraint clave_primaria_trayecto primary key(identificador_destino, ciudad_salida),
    constraint claves_candidatas_trayecto unique(identificador_destino, ciudad_llegada),
    constraint condicion_ciudades check(ciudad_salida != ciudad_llegada),
    constraint clave_externa_destino foreign key(identificador_destino) references Destino(identificador_destino)
);

create table Vuelo(
    identificador_avion,
    fecha_salida date constraint fecha_salida_no_nulo not null,
    hora_salida time,
    ciudad_salida,
    hora_llegada time,
    identificador_destino,
    constraint clave_primaria primary key(identificador_avion, fecha_salida, hora_salida),
    constraint clave_externa_asiento foreign key(identificador_avion) references Asiento(identificador_avion),
    constraint clave_externa_trayecto foreign key(ciudad_salida, identificador_destino) references Trayecto(ciudad_salida, identificador_destino)
);

create table Tarjeta_embarque(
    dni,
    fecha_salida,
    hora_salida,
    identificador_avion,
    fila, 
    numero,
    constraint clave_primaria primary key(dni, fecha_salida, hora_salida, identificador_avion),
    constraint clave_externa_pasajero foreign key(dni) references Pasajero(dni),
    constraint clave_externa_vuelo foreign key(fecha_salida, hora_salida, identificador_avion) references Vuelo(fecha_salida, hora_salida, identificador_avion),
    constraint clave_externa_asiento foreign key(fila, numero) references Asiento(fila, numero)
);