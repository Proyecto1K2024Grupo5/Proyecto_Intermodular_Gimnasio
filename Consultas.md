[Volver](https://github.com/Proyecto1K2024Grupo5/Proyecto_Intermodular_Gimnasio/tree/326bca4a21ab946af9a24b925959a0f83c4838b1)



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
COUNT(d.nifmonitor) > 0:


| nombreMonitor | totalClases |  
|---------------|-------------|  
| Sandra        | 1           | 
| Tomas         | 2           |







Definición de 5 consultas que utilicen subconsultas, tanto escalares, como fila y de tabla.  

Definición de 2 consultas que utilicen CTE  

Creación de una tabla a partir del resultado de una consulta compleja. 

**Descripción de la consulta:**
Queremos analizar el numero de veces que han utilizado nuestros gimnasios el pasado año 2024 los clientes nacidos en 1990.
Para ello queremos recuperar el nombre del cliente, su nif, su fecha de nacimiento, el tipo de membresia que tiene contratada
y el numero de entradas al gimnasio. Ademas queremos dejarlo registrado en una tabla con todos los datos encontrados.

Create table Registro_entradas_clientes_2024 as
select c.nombre, c.nif, c.fcac, m.tipo as Membresia, count(a.fEntrada) as Entradas_gimnasio from cliente c
join membresia m on c.tipoMembresia = m.tipo
join acceso a on c.nif = a.nifCliente
where c.fnac = year(c.fnac) = 1990
and year(a.fEntrada) = 2024
group by c.nif, c.nombre, m.tipo
order by count(a.fEntrada) desc;

**Resolución de la consulta en SQL**
| Nombre          | NIF         | Fecha de Nacimiento | Membresía | Entradas al Gimnasio |
|-----------------|-------------|---------------------|-----------|----------------------|
| Juan Pérez      | 12345678A   | 1990-05-12          | Gold      | 15                   |
| Laura García    | 23456789B   | 1990-07-22          | Silver    | 12                   |
| Miguel Sánchez  | 34567890C   | 1990-01-08          | Bronze    | 10                   |
| Marta Rodríguez | 45678901D   | 1990-11-30          | Gold      | 8                    |
| Antonio López   | 56789012E   | 1990-03-15          | Bronze    | 6                    |
| Ana Martínez    | 67890123F   | 1990-04-05          | Silver    | 4                    |
| Carlos Fernández| 78901234G   | 1990-10-19          | Gold      | 2                    |
| Beatriz Torres  | 89012345H   | 1990-06-23          | Silver    | 1                    |
| Laura López     | 23456789I   | 1990-12-15          | Bronze    | 9                    |
| José García     | 12345678J   | 1990-02-22          | Gold      | 13                   |
| Pablo Pérez     | 34567890K   | 1990-08-01          | Silver    | 7                    |
| Claudia Ruiz    | 45678901L   | 1990-09-10          | Bronze    | 5                    |
| Francisco Gómez | 56789012M   | 1990-05-30          | Gold      | 11                   |
| Sergio Díaz     | 67890123N   | 1990-04-18          | Silver    | 3                    |
| Sandra Martín   | 78901234O   | 1990-11-02          | Bronze    | 14                   |
| Carmen López    | 89012345P   | 1990-03-07          | Gold      | 16                   |
| Luis Rodríguez  | 12345678Q   | 1990-01-21          | Silver    | 4                    |
| Inés Torres     | 23456789R   | 1990-07-13          | Bronze    | 6                    |
| Marcos González | 34567890S   | 1990-08-27          | Gold      | 10                   |
| Teresa Martínez | 45678901T   | 1990-04-30          | Silver    | 12                   |
| Álvaro Fernández| 56789012U   | 1990-09-05          | Bronze    | 8                    |
| Natalia Pérez   | 67890123V   | 1990-06-20          | Gold      | 5                    |
| Javier García   | 78901234W   | 1990-10-03          | Silver    | 14                   |
| Marta Sánchez   | 89012345X   | 1990-02-10          | Bronze    | 3                    |
| Raúl González   | 12345678Y   | 1990-03-23          | Gold      | 2                    |
| Carmen Ruiz     | 23456789Z   | 1990-04-28          | Silver    | 1                    |



Definición de dos índices que mejoren el rendimiento de las consultas ya definidas  

Planes de ejecución, antes y después de la creación de los índices, comprobando su uso  

Resolución mediante SQL de cada una de las consultas.  

Resultados de su ejecución sobre el modelo físico.  

Se utilizará una rúbrica para su evaluación en base a la siguiente lista de cotejo:  

Limpieza y calidad de las consultas.  

Variedad de consultas, desde consultas sencilla a más complejas.  

Documentación de las consultas.  



[Volver](https://github.com/Proyecto1K2024Grupo5/Proyecto_Intermodular_Gimnasio/tree/326bca4a21ab946af9a24b925959a0f83c4838b1)
