# Documentación proyecto intermodular
## Miembros del grupo
1. Fernando Rodríguez
   - https://github.com/Fernan1590
2. Juan Sebastián Franco
   - https://github.com/ZianFranxes
4. Akram Allaoui
   - https://github.com/akram-allaoui
5. Cristian Sanchez
   - https://github.com/cristian11sm

# Indice de los puntos

### 1. - Sistema de información (SI)
### 2. - Modelo Entidad Relación Extendido (EER)
### 3. - Modelo Relacional (MR)
### 4. - Diccionario de datos (DD)



## 1 - SISTEMA DE INFORMACIÓN
Un gimnasio nos ha pedido que realicemos una gestión de su base de datos. De cada cliente se quiere conocer nombre, apellidos, NIF, correo electrónico y fecha de nacimiento. Los trabajadores se dividen en monitores y supervisores, de los cuales queremos conocer los mismos datos. 

El cliente debe pagar una de las tres membresías que tiene el gimnasio (Gold, Silver y Bronze), cada membresía contiene el número de veces que puede reservar una sala, cada vez que reserve una sala bajará el numero restante y cuando se acaben, deberá pagar de nuevo la membresía u otra (Bronze contiene 10, Silver contiene 20 y Gold contiene 30). Una vez apuntado a una membresía se le iran restando los accesos que realiza al gimnasio. 

El usuario, podrá hacer una reserva (la duración de cada sala reservada es de una hora), como tambien podrá reservar todas las salas que quiera durante la apertura del gimnasio (dependiendo de la membresía que haya pagado) pero nunca podrá dos salas a la misma hora. Se guardará la fecha de reserva y se asociará el código del cliente a la sala durante el tiempo reservado para que pueda entrar. 

Hay dos tipos de salas, de las que se encargan los trabajadores del gimnasio de los que se necesita (email, nif, fnac, id, nombre y apellidos) y tambien queremos saber de cada trabajador la fecha y el turno de trabajo, las de clases dirigidas por monitores en las que imparten zumba, yoga o pilates, y las de musculación, de las cuales queremos saber la cantidad de máquinas que hay, es un estilo de entrenamiento libre. Los supervisores deben de supervisar las máquinas para que se haga un uso correcto de ellas. De cada sala queremos saber el horario y el número de plazas que tiene.

## Modelo de la Entidad Relación

![IMG_7212.jpg](Imagenes/IMG_7212.jpg)

![1.jpg](Imagenes/1.jpg)

---

## Relacion y Restricciones del Diccionario de Datos

**CLIENTE**
- Clave primaria en CLIENTE: `Nif`

**MEMBRESIA**
- Clave primaria en MEMBRESIA: `Tipo`
- Clave ajena en MEMBRESIA: `Nif`, referencia a `Nif` en la tabla CLIENTE, indicando la relacion entre una membresia y su cliente.
- Restriccion de borrado: rechazar.
- Restriccion de modificacion: propagar.

**GIMNASIO**
- Clave primaria en GIMNASIO: `Codigo`
- Clave ajena en GIMNASIO: `Nif`, referencia a `Nif` en la tabla CLIENTE, indicando la relacion entre un gimnasio y su cliente.
- Restriccion de borrado: rechazar.
- Restriccion de modificacion: propagar.

**SALA**
- Clave primaria en SALA: `Id`
- Clave ajena en SALA: `Codigo`, referencia a `Codigo` en la tabla GIMNASIO, indicando la relacion entre una sala y su gimnasio.
- Clave ajena en SALA: `Nif`, referencia a `Nif` en la tabla CLIENTE, indicando la relacion entre una sala y el cliente.
- Restriccion de borrado: rechazar.
- Restriccion de modificacion: propagar.

**TRABAJADOR**
- Clave primaria en TRABAJADOR: `Nif`

**MONITOR**
- Clave primaria en MONITOR: `Nif`
- Clave ajena en MONITOR: `Nif`, referencia a `Nif` en la tabla TRABAJADOR, indicando la relacion entre un monitor y un trabajador.
- Restriccion de borrado: rechazar.
- Restriccion de modificacion: propagar.

**SUPERVISOR**
- Clave primaria en SUPERVISOR: `Nif`
- Clave ajena en SUPERVISOR: `Nif`, referencia a `Nif` en la tabla TRABAJADOR, indicando la relacion entre un supervisor y un trabajador.
- Restriccion de borrado: rechazar.
- Restriccion de modificacion: propagar.

**CLASES**
- Clave primaria en CLASES: `Id`
- Clave ajena en CLASES: `Id`, referencia a `Id` en la tabla SALA, indicando la relacion entre una clase y una sala.
- Clave ajena en CLASES: `Nif`, referencia a `Nif` en la tabla MONITOR, indicando la relacion entre una clase y un monitor.
- Restriccion de borrado: rechazar.
- Restriccion de modificacion: propagar.

**MUSCULACION**
- Clave primaria en MUSCULACION: `Id`
- Clave ajena en MUSCULACION: `Id`, referencia a `Id` en la tabla SALA, indicando la relacion entre musculacion y una sala.
- Clave ajena en MUSCULACION: `Nif`, referencia a `Nif` en la tabla SUPERVISOR, indicando la relacion entre musculacion y un supervisor.
- Restriccion de borrado: rechazar.
- Restriccion de modificacion: propagar.



