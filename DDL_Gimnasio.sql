-- Creamos la tabla para Cliente
-- Cliente tiene como clave primaria nif y como ajena el tipoMembresia.

CREATE TABLE CLIENTE (
    nif VARCHAR (9),
    nombre CHAR (32),
    apellidos CHAR (128),
    fnac DATE,
    email VARCHAR (128) NOT NULL,
    falta DATE DEFAULT CURRENT_DATE,
    contAcceso INT,
    tipoMembresia VARCHAR (12),
    CONSTRAINT PK_cliente PRIMARY KEY (nif),
    CONSTRAINT FK_membresia FOREIGN KEY (tipoMembresia) REFERENCES MEMBRESIA(tipo)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


-- Creamos la tabla para Membresia
CREATE TABLE MEMBRESIA (
    tipo VARCHAR (12),
    precio DECIMAL (4,2) NOT NULL,
    CONSTRAINT PK_membresia PRIMARY KEY (tipo)
);

-- Creamos la tabla para Gimnasio
CREATE TABLE GIMNASIO (
    codigo INT AUTO_INCREMENT,
    nombre VARCHAR (32),
    CONSTRAINT PK_gimnasio PRIMARY KEY (codigo)
);

-- Creamos la tabla para Acceso
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
CREATE TABLE TRABAJADOR (
    nif VARCHAR (9),
    nombre CHAR (32),
    apellidos CHAR (128),
    fnac DATE,
    email VARCHAR (128),
    CONSTRAINT PK_trabajador PRIMARY KEY (nif)
);

-- Creamos las tablas para los hijos de TRABAJADOR
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

