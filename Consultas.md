**Consultas**  
**Muestra el nombre de los clientes que pertenecen al gimnasio junto a su fecha de alta**

SELECT nombre, fAlta
FROM cliente;

![1.png](/Imagenes%2F1.png)

**Muestra el nombre de los clientes que tienen la membresia GOLD**

SELECT nombre, tipoMembresia
FROM cliente
WHERE tipoMembresia = 'GOLD'; 

![2.png](/Imagenes%2F2.png)

**Muestra el nif del trabajador que dirige las clases dirigidas en horario de TARDE**

SELECT nifMonitor, turno
FROM dirigir
WHERE turno = 'TARDE';

![3.png](/Imagenes%2F3.png)

**Muestra el nif de los clientes que acceden al gimnasio con el codigo 3**

SELECT nifCliente, codGimnasio
FROM acceso
WHERE codGimnasio = 3;

![4.png](/Imagenes%2F4.png)

**Muestra los clientes que accedieron al gimnasio 3 dentro del año 2024**

SELECT nifCliente, codGimnasio, fentrada
FROM acceso
WHERE codGimnasio = 3 AND YEAR(fentrada) < 2024;

![5.png](/Imagenes%2F5.png)

**Muestra los nombres de los monitores y supervisores junto con el rol que desempeñan**

SELECT t.nombre, 'monitor' AS rol
FROM trabajador t
JOIN monitor m ON t.nif = m.nifmonitor
UNION
SELECT t.nombre, 'supervisor' AS rol
FROM trabajador t
JOIN supervisor s ON t.nif = s.nifsupervisor;

![6.png](/Imagenes%2F6.png)

**Muestra el nombre y el email de los clientes que han reservado una sala con menos de 25 plazas**

SELECT c.nombre, c.email
FROM cliente c
JOIN reserva r ON c.nif = r.nifcliente
JOIN sala s ON r.idsala = s.id
WHERE s.plazas < 25;

![7.png](/Imagenes%2F7.png)

**Obtén los gimnasios que no tienen ninguna sala asignada**

SELECT g.codigo, g.nombre
FROM gimnasio g
JOIN sala s ON g.codigo = s.codgimnasio
WHERE s.id IS NULL;

![8.png](/Imagenes%2F8.png)

**Muestra el nombre de los clientes junto con el nombre del gimnasio al que accedieron**

SELECT c.nombre AS nombrecliente, g.nombre AS nombregimnasio
FROM cliente c
JOIN acceso a ON c.nif = a.nifCliente
JOIN gimnasio g ON a.codGimnasio = g.codigo;

![9.png](/Imagenes%2F9.png)

**Muestra el nombre de los monitores que dirigieron clases en 2024 y el número total de clases dirigidas por cada uno**

![10.png](/Imagenes%2F10.png)

SELECT t.nombre AS nombremonitor,
COUNT(d.nifmonitor) AS totalclases
FROM MONITOR m
JOIN TRABAJADOR t ON m.nifmonitor = t.nif
JOIN DIRIGIR d ON d.nifmonitor = m.nifmonitor
WHERE YEAR(d.fecha) < 2024
GROUP BY t.nombre
HAVING COUNT(d.nifmonitor) > 0: