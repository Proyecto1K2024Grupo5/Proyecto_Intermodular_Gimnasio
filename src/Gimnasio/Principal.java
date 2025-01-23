package Gimnasio;

public class Principal {
    public static void main(String[] args) {

        Cliente cliente1 = new Cliente();

        Monitor monitor1 = new Monitor();

        Supervisor supervisor1 = new Supervisor();


        cliente1.pagar();
        cliente1.acceder();
        cliente1.reservar();

        monitor1.dirigir();
        supervisor1.dirigir();

        
    }
}
