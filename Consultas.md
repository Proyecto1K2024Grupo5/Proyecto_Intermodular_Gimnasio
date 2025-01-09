**Consultas**  
**Muestra el nombre de los clientes que pertenecen al gimnasio junto a su fecha de alta**

SELECT nombre, fAlta
FROM cliente;



| nombre | fAlta |  
|--------|-------|  
| Victor | 2024-10-09 |  
| Salomon | 2024-10-09 |  
| Leon | 2023-10-21 |  
| Natan | 2024-10-09 |
| Alejandro | 2024-10-09 |
| Elver | 2023-05-12 |
| Sofia | 2024-11-19 |
| Van | 2024-08-19 |
| Franco | 2024-02-28 |
| Estan | 2024-03-23 |




**Muestra el nombre de los clientes que tienen la membresia GOLD**

SELECT nombre, tipoMembresia
FROM cliente
WHERE tipoMembresia = 'GOLD'; 



| nombre    | tipoMembresia |  
|-----------|--------------|  
| Victor    | Gold |  
| Salomon   | Gold |  
| Natan     | Gold |  
| Alejandro | Gold |
| Van       | Gold |



**Muestra el nif del trabajador que dirige las clases dirigidas en horario de TARDE**

SELECT nifMonitor, turno
FROM dirigir
WHERE turno = 'TARDE';


| nifMonitor | turno |  
|------------|-------|  
| 12345678X  | Tarde |  

**Muestra el nif de los clientes que acceden al gimnasio con el codigo 3**

SELECT nifCliente, codGimnasio
FROM acceso
WHERE codGimnasio = 3;


| nifCliente | codGimnasio |  
|------------|-------------|  
| 38848484P  | 3           |  

**Muestra los clientes que accedieron al gimnasio 3 dentro del año 2024**

SELECT nifCliente, codGimnasio, fentrada
FROM acceso
WHERE codGimnasio = 3 AND YEAR(fentrada) < 2024;


| nifCliente | codGimnasio | fentrada   |  
|------------|-------------|------------|
| 38848484P  | 3           | 2023-11-29 |

**Muestra los nombres de los monitores y supervisores junto con el rol que desempeñan**

SELECT t.nombre, 'monitor' AS rol
FROM trabajador t
JOIN monitor m ON t.nif = m.nifmonitor
UNION
SELECT t.nombre, 'supervisor' AS rol
FROM trabajador t
JOIN supervisor s ON t.nif = s.nifsupervisor;


| nombre | rol        |  
|--------|------------|  
| Tomas  | monitor    | 
| Raquel | monitor    | 
| David  | monitor    | 
| Sergio | monitor    | 
| Lucia  | monitor    | 
| Pablo  | monitor    | 
| Isabel | monitor    | 
| Victor | monitor    |
| Sandra | monitor    | 
| Marta  | monitor    | 
| Tomas  | supervisor | 
| Raquel | supervisor |
| David  | supervisor |
| Sergio | supervisor |
| Lucia  | supervisor |
| Pablo  | supervisor |
| Isabel | supervisor |
| Victor | supervisor |
| Sandra | supervisor |
| Marta  | supervisor |

**Muestra el nombre y el email de los clientes que han reservado una sala con menos de 25 plazas**

SELECT c.nombre, c.email
FROM cliente c
JOIN reserva r ON c.nif = r.nifcliente
JOIN sala s ON r.idsala = s.id
WHERE s.plazas < 25;


| nombre    | email                 |  
|-----------|-----------------------|  
| Alejandro | elmismisimo@gmail.com | 
| Leon      | queguapo@gmail.com    | 
| Franco    | franco@gmail.com      | 
| Victor    | saquenotro@gmail.com  | 
| Sofia     | quecosote@gmail.com   | 
| Van       | vandolera@gmail.com   | 
| Elver     | muyduro@gmail.com     | 
| Salomon   | anonimo@gmail.com     |
| Estan     | muajaja@gmail.com     | 
| Natan     | omgadabro@gmail.com   | 

**Obtén los gimnasios que no tienen ninguna sala asignada**

SELECT g.codigo, g.nombre
FROM gimnasio g
JOIN sala s ON g.codigo = s.codgimnasio
WHERE s.id IS NULL;


| codigo | nombre                         |  
|--------|--------------------------------|  
| 1      | Gimnasio centro Madrid         | 
| 2      | Gimnasio norte Albacete        | 
| 3      | Gimnasio sur Elche             | 
| 4      | Gimnasio este Almeria          | 
| 5      | Gimnasio oeste Castellon       | 
| 6      | Gimnasio premium Valencia      | 
| 7      | Gimnasio plus Toledo           | 
| 8      | Gimnasio max Barcelona         |
| 9      | Gimnasio familia Alicante      | 
| 10     | Gimnasio urbano Los Palmerales | 

**Muestra el nombre de los clientes junto con el nombre del gimnasio al que accedieron**

SELECT c.nombre AS nombrecliente, g.nombre AS nombregimnasio
FROM cliente c
JOIN acceso a ON c.nif = a.nifCliente
JOIN gimnasio g ON a.codGimnasio = g.codigo;


| nombreCliente | nombreGimnasio                 |  
|---------------|--------------------------------|  
| Alejandro     | Gimnasio centro Madrid         | 
| Leon          | Gimnasio norte Albacete        | 
| Franco        | Gimnasio sur Elche             | 
| Victor        | Gimnasio este Almeria          | 
| Sofia         | Gimnasio oeste Castellon       | 
| Van           | Gimnasio premium Valencia      | 
| Elver         | Gimnasio plus Toledo           | 
| Salomon       | Gimnasio max Barcelona         |
| Estan         | Gimnasio familia Alicante      | 
| Natan         | Gimnasio urbano Los Palmerales | 

**Muestra el nombre de los monitores que dirigieron clases en 2024 y el número total de clases dirigidas por cada uno**



SELECT t.nombre AS nombremonitor,
COUNT(d.nifmonitor) AS totalclases
FROM MONITOR m
JOIN TRABAJADOR t ON m.nifmonitor = t.nif
JOIN DIRIGIR d ON d.nifmonitor = m.nifmonitor
WHERE YEAR(d.fecha) < 2024
GROUP BY t.nombre
HAVING COUNT(d.nifmonitor) > 0:


| nombreMonitor | totalClases |  
|---------------|-------------|  
| Sandra        | 1           | 
| Tomas         | 2           | 