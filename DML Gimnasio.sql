-- Insertar datos en CLIENTE
INSERT INTO CLIENTE (nif, nombre, apellidos, fnac, email, falta, contAcceso, tipoMembresia) VALUES
('12345678Y', 'Salomon', 'Leonidas', '1998-12-12', 'anonimo@gmail.com', '2024-10-09', 0, 'Gold'),
('28388487Z', 'Alejandro', 'Magno', '1588-02-05', 'elmismisimo@gmail.com', '2024-01-02', 0, 'Gold'),
('38848484P', 'Franco', 'Franquisimo', '1939-11-0', 'franco@gmail.com', '2024-02-28', 0, 'Silver'),
('29392934Y', 'Sofia', 'Panadera', '1945-03-12', 'quecosote@gmail.com', '2023-11-19', 0, 'Bronze'),
('12345678Y', 'Victor', 'Sullivan', '1982-04-13', 'saquenotro@gmail.com', '2024-10-09', 0, 'Gold'),
('28282773S', 'Natan', 'Drake', '1993-02-10', 'omgadabro@gmail.com', '2024-06-01', 0, 'Gold'),
('21938483O', 'Leon', 'Kennedy', '1995-02-09', 'queguapo@gmail.com', '2023-01-21', 0, 'Bronze'),
('48959433Y', 'Estan', 'Lin', '1982-01-16', 'muajaja@gmail.com', '2024-03-23', 0, 'Silver'),
('29293834K', 'Elver', 'Dulero', '1983-02-22', 'muyduro@gmail.com', '2023-05-12', 0, 'Silver'),
('37273663N', 'Van', 'Dolera', '1991-01-01', 'vandolera@gmail.com', '2024-08-19', 0, 'Gold');

-- Insertar datos en MEMBRESIA
INSERT INTO MEMBRESIA (tipo, precio) VALUES 
('Bronze', 20.00), 
('Gold', 40.00), 
('Silver', 60.00);

-- Insertar datos en GIMNASIO
INSERT INTO GIMNASIO (nombre) VALUES
('Gimnasio Centro Madrid'),
('Gimnasio Norte Albacete'),
('Gimnasio Sur Elche'),
('Gimnasio Este Almeria'),
('Gimnasio Oeste Castellon'),
('Gimnasio Premium Valencia'),
('Gimnasio Plus Toledo'),
('Gimnasio Max Barcelona'),
('Gimnasio Familia Alicante'),
('Gimnasio Urbano Los Palmerales');

-- Insertar datos en ACCESO
INSERT INTO ACCESO (fEntrada, fSalida) VALUES
('2023-12-01', '2023-12-01'),
('2023-11-30', '2023-11-30'),
('2023-11-29', '2023-11-29'),
('2023-11-28', '2023-11-28'),
('2023-11-27', '2023-11-27'),
('2023-11-26', '2023-11-26'),
('2023-11-25', '2023-11-25'),
('2023-11-24', '2023-11-24'),
('2023-11-23', '2023-11-23'),
('2023-11-22', '2023-11-22');

-- Insertar datos en SALA
INSERT INTO SALA (plazas, horario) VALUES
(20, '2023-12-01'),
(15, '2023-12-01'),
(18, '2023-12-01'),
(10, '2023-12-01'),
(22, '2023-12-01'),
(19, '2023-12-01'),
(24, '2023-12-01'),
(20, '2023-12-01'),
(23, '2023-12-01'),
(21, '2023-12-01');

-- Insertar datos en CLASES
INSERT INTO CLASES (idClases) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Insertar datos en MUSCULACION
INSERT INTO MUSCULACION (idMusculacion) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Insertar datos en RESERVA
INSERT INTO RESERVA (fecha) VALUES
('2023-12-01'),
('2023-11-30'),
('2023-11-29'),
('2023-11-28'),
('2023-11-27'),
('2023-11-26'),
('2023-11-25'),
('2023-11-24'),
('2023-11-23'),
('2023-11-22');

-- Insertar datos en TRABAJADOR
INSERT INTO TRABAJADOR (nif, nombre, apellidos, fnac, email) VALUES
('12345678X', 'Tomas', 'Lopez', '1980-01-10', 'tom@gmail.com'),
('87654321Y', 'Sandra', 'Rodriguez', '1990-02-20', 'sand@gmail.com'),
('13579246Z', 'David', 'Fernandez', '1985-03-15', 'davidfer@gmail.com'),
('24681357W', 'Lucia', 'Morales', '1995-04-25', 'luciamorales@gmail.com'),
('34567891V', 'Pablo', 'Ramos', '1975-05-30', 'pabramos@gmail.com'),
('98765432U', 'Marta', 'Nieto', '1988-06-05', 'marnieto@gmail.com'),
('19283746T', 'Sergio', 'Jimenez', '1992-07-10', 'sergio.jimenez@gmail.com'),
('12378945S', 'Raquel', 'Vega', '2000-08-15', 'raquelvega@gmail.com'),
('45632178R', 'Isabel', 'Lopez', '1998-09-20', 'isalopez@gmail.com'),
('78912365Q', 'Victor', 'Diaz', '1993-10-25', 'victodiaz@gmail.com');

-- Insertar datos en MONITOR
INSERT INTO MONITOR (nifMonitor) VALUES
('12345678X'), ('87654321Y'), ('13579246Z'), ('24681357W'), ('34567891V'),
('98765432U'), ('19283746T'), ('12378945S'), ('45632178R'), ('78912365Q');

-- Insertar datos en SUPERVISOR
INSERT INTO SUPERVISOR (nifSupervisor) VALUES
('12345678X'), ('87654321Y'), ('13579246Z'), ('24681357W'), ('34567891V'),
('98765432U'), ('19283746T'), ('12378945S'), ('45632178R'), ('78912365Q')

-- Insertar datos en SUPERVISAR
INSERT INTO SUPERVISAR (fecha, turno, nifSupervisor, idMusculacion)
VALUES
('2023-12-01', 'MAÑANA', '12345678X', 1),
('2023-12-01', 'TARDE', '12345678X', 2),
('2023-12-02', 'MAÑANA', '87654321Y', 3);

-- Insertar datos en DIRIGIR
INSERT INTO DIRIGIR (fecha, turno, nifMonitor, idClase)
VALUES
('2023-12-01', 'MAÑANA', '12345678X', 1),
('2023-12-01', 'TARDE', '12345678X', 2),
('2023-12-02', 'MAÑANA', '87654321Y', 3);

