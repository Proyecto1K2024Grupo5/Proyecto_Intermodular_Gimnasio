




-- Creamos la tabla para Cliente
-- Cliente tiene como clave primaria nif y como ajena el tipoMembresia.
-- El email se ha decidido poner en NOT NULL debido a que al correo de todos los
-- clientes del gimnasio se enviaran ofertas y actividades que se realizaran en el gimnasio.

CREATE TABLE CLIENTE (
    nif VARCHAR (9),
    nombre VARCHAR (32),
    apellidos VARCHAR (128),
    fnac DATE,
    email VARCHAR (128) NOT NULL,
    falta DATE DEFAULT CURRENT_DATE,
    contAcceso INT,
    tipoMembresia VARCHAR (12),
    CONSTRAINT PK_cliente PRIMARY KEY (nif),
    CONSTRAINT FK_membresia FOREIGN KEY (tipoMembresia) REFERENCES MEMBRESIA(tipo)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);


-- Creamos la tabla para Membresia
-- Membresia tiene como clave primaria tipo, donde especifica el nombre de la membresia.

CREATE TABLE MEMBRESIA (
    tipo VARCHAR (12),
    precio DECIMAL (4,2) NOT NULL,
    CONSTRAINT PK_membresia PRIMARY KEY (tipo)
);

-- Creamos la tabla para Gimnasio
-- Gimnasio tiene como clave primaria el codigo que sera la referencia para a que gimnasio nos referimos.

CREATE TABLE GIMNASIO (
    codigo INT,
    nombre VARCHAR (32),
    CONSTRAINT PK_gimnasio PRIMARY KEY (codigo)
);

-- Creamos la tabla para Acceso
-- La tabla de ACCESO tienen como claves primarias el nifCliente y el codGimnasio, los cuales nos diran que
-- cliente ha accedido a que gimnasio. Además se ha puesto los campos fEntrada y fSalida como 
-- NOT NULL ya que necesitaremos saber la fecha y la hora de la entrada y la salida.

CREATE TABLE ACCESO (
    fEntrada DATE NOT NULL,
    fSalida DATE NOT NULL,
    nifCliente VARCHAR (9),
    codGimnasio INT,
    CONSTRAINT PK_acceso PRIMARY KEY (nifCliente, codGimnasio),
    CONSTRAINT FK_acceso1 FOREIGN KEY (nifCliente) REFERENCES CLIENTE (nif)
        ON UPDATE CASCADE  
        ON DELETE NO ACTION,
    CONSTRAINT FK_acceso2 FOREIGN KEY (codGimnasio) REFERENCES GIMNASIO (codigo)
        ON UPDATE CASCADE  
        ON DELETE NO ACTION
);

-- Creamos la tabla para SALA
-- Sala tiene como clave primaria la Id de la sala, la cual ademas es AUTO_INCREMENT, ya que se ira asignando el 
-- siguiente numero de sala a la anterior, para llevar un control más adecuado en cada uno de los gimnasios.
-- Podran haber dos SALAS con el mismo codigo de id pero no seran del mismo gimnasio, ya que tiene como campo la 
-- clave ajena de codGimnasio, que apunta a GIMNASIO.

CREATE TABLE SALA (
    id INT AUTO_INCREMENT,
    plazas INT,
    horario DATE,
    nifCliente VARCHAR (9) NOT NULL,
    codGimnasio INT NOT NULL,
    CONSTRAINT PK_sala PRIMARY KEY (id),
    CONSTRAINT FK_sala FOREIGN KEY (nifCliente) REFERENCES CLIENTE (nif)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
        CONSTRAINT FK_sala2 FOREIGN KEY (codGimnasio) REFERENCES GIMNASIO (codigo)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT CK_sala CHECK (plazas <25)
);

-- Creamos las tablas para los hijos de SALA
-- Los hijos de SALA tendran como claves primarias la idClases e idMusculacion, las cuales hacen referencia
-- a la id de SALA.

CREATE TABLE CLASES (
    idClases INT,
    CONSTRAINT PK_clases PRIMARY KEY (idClases),
    CONSTRAINT FK_clases FOREIGN KEY (idClases) REFERENCES SALA (id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

CREATE TABLE MUSCULACION (
    idMusculacion INT,
    CONSTRAINT PK_musculacion PRIMARY KEY (idMusculacion),
    CONSTRAINT FK_musculacion FOREIGN KEY (idMusculacion) REFERENCES SALA (id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

-- Creamos la tabla para RESERVA
-- RESERVA tiene como clave primaria el nif del CLIENTE y la id de la SALA, para saber que CLIENTE hace
-- una reserva en una SALA. Además hemos puesto fecha como NOT NULL porque necesitaremos saber la hora de la 
-- clase que este CLIENTE ha reservado.

CREATE TABLE RESERVA (
    fecha DATE DEFAULT CURRENT_DATE NOT NULL,
    nifCliente VARCHAR (9),
    idSala INT,
    CONSTRAINT PK_reserva PRIMARY KEY (nifCliente, idSala),
    CONSTRAINT FK_reserva1 FOREIGN KEY (nifCliente) REFERENCES CLIENTE (nif)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_reserva2 FOREIGN KEY (idSala) REFERENCES SALA (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

--Creamos la tabla para TRABAJADOR
-- Trabajador tiene como clave primaria el nif del trabajador.

CREATE TABLE TRABAJADOR (
    nif VARCHAR (9),
    nombre VARCHAR (32),
    apellidos VARCHAR (128),
    fnac DATE,
    email VARCHAR (128),
    CONSTRAINT PK_trabajador PRIMARY KEY (nif)
);

-- Creamos las tablas para los hijos de TRABAJADOR
-- Los hijos de trabajador tienen como clave primaria y ajena a la misma vez el nif del trabajador.
-- Lo hacemos porque necesitamos disgintuir que trabajador es MONITOR y quien SUPERVISOR.

CREATE TABLE MONITOR (
    nifMonitor VARCHAR (9),
    CONSTRAINT PK_monitor PRIMARY KEY (nifMonitor),
    CONSTRAINT FK_monitor FOREIGN KEY (nifMonitor) REFERENCES TRABAJADOR (nif)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

CREATE TABLE SUPERVISOR (
    nifSupervisor VARCHAR (9),
    CONSTRAINT PK_supervisor PRIMARY KEY (nifSupervisor),
    CONSTRAINT FK_supervisor FOREIGN KEY (nifSupervisor) REFERENCES TRABAJADOR (nif)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

-- Creamos la tabla de SUPERVISAR
-- SUPERVISAR tiene como claveprimaria el nif del supervisor y la id de la sala de musculación en la que estará.
-- Luego tenemos el campo de fecha, para que sepamos que fecha estuvo trabajando ese supervisor y el campo de 
-- turno, al cual le hemos asignado un tipo de dato ENUM, ya que solo hay dos posibilidades. M´añana o tarde.

CREATE TABLE SUPERVISAR (
    fecha DATE NOT NULL,
    turno ENUM ('MAÑANA', 'TARDE'),
    nifSupervisor VARCHAR (9),
    idMusculacion INT,
    CONSTRAINT PK_supervisar PRIMARY KEY (nifSupervisor, idMusculacion),
    CONSTRAINT FK_supervisar1 FOREIGN KEY (nifSupervisor) REFERENCES SUPERVISOR (nifSupervisor)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT FK_supervisar2 FOREIGN KEY (idMusculacion) REFERENCES MUSCULACION (idMusculacion)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

-- Creamos la tabla de DIRIGIR
-- Creamos la tabla de DIRIGIR
-- DIRIGIR tiene como claveprimaria el nif del monitor y la id de la clase en la que estará.
-- Luego tenemos el campo de fecha, para que sepamos que fecha estuvo trabajando ese monitor y el campo de 
-- turno, al cual le hemos asignado un tipo de dato ENUM, ya que solo hay dos posibilidades. M´añana o tarde.

CREATE TABLE DIRIGIR (
    fecha DATE NOT NULL,
    turno ENUM ('MAÑANA', 'TARDE'),
    nifMonitor VARCHAR (9),
    idClase INT,
    CONSTRAINT PK_dirigir PRIMARY KEY (nifMonitor, idClase),
    CONSTRAINT FK_dirigir1 FOREIGN KEY (nifMonitor) REFERENCES MONITOR (nifMonitor)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT FK_dirigir2 FOREIGN KEY (idClase) REFERENCES CLASES (idClases)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

