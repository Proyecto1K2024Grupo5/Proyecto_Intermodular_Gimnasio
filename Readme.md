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

## Descripción de la Entidad Relación
Un gimnasio nos ha pedido que realicemos una gestión de su base de datos. De cada cliente se quiere conocer nombre, apellidos, NIF, correo electrónico y fecha de nacimiento. Los trabajadores se dividen en monitores y supervisores, de los cuales queremos conocer los mismos datos. 

El cliente debe pagar una de las tres membresías que tiene el gimnasio (Gold, Silver y Bronze), cada membresía contiene el número de veces que puede reservar una sala, cada vez que reserve una sala bajará el numero restante y cuando llegue a 0, deberá pagar de nuevo la membresía u otra (Bronze contiene 10, Silver 20 y Gold 30). Una vez apuntado a una membresía se le entregará una pulsera para poder acceder al gimnasio (se guardará la fecha de cada entrada al gimnasio), la cual contendrá el código de cliente, además del tipo de membresía pagada y, por lo tanto, el número de salas que le queda por reservar. 

El usuario, podrá hacer una reserva (la duración de cada sala reservada es de una hora), como tambien podrá reservar todas las salas que quiera durante la apertura del gimnasio (dependiendo de la membresía que haya pagado) pero nunca podrá dos salas a la misma hora. Se guardará la fecha de reserva y se asociará el código del cliente a la sala durante el tiempo reservado para que pueda entrar. 

Hay dos tipos de salas, las de clases dirigidas por monitores en las que imparten zumba, yoga o pilates, y las de musculación, de las cuales queremos saber la cantidad de máquinas que hay, es un estilo de entrenamiento libre. Los supervisores pueden estar supervisando las máquinas para que se haga un uso correcto de ellas. De cada sala queremos saber el horario y el número de plazas que tiene. 

## Modelo de la Entidad Relación
![image (1)](https://github.com/user-attachments/assets/65768fa5-d2b9-43d6-9122-457de9d97319)
