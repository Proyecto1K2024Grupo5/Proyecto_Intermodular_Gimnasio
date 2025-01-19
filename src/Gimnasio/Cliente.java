package Gimnasio;

public class Cliente {

    private String nif;
    private String nombre;
    private String apellidos;
    private String fnac;
    private String fAlta;
    private int contAcceso;
    private String tipoMembresia;

    public void pagar(){
        System.out.println("Acabas de pagar una mensualidad");
    }
    public void reservar(){
        System.out.println("Acabas de reservar al gimnasio");

    }
    public void acceder(){

    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<cliente>\n")
                .append("\t <nif>: ").append(nif).append("</nif>\n")
                .append("\t <nombre>: ").append(nombre).append("</nombre>\n")
                .append("\t <apellidos>: ").append(apellidos).append("</apellidos>\n")
                .append("\t <fecha-de-nacimiento>: ").append(fnac).append("</fecha-de-nacimiento>\n")
                .append("\t <fecha-de-alta>: ").append(fAlta).append("</fecha-de-alta>\n")
                .append("\t <contador-de-acceso>: ").append(contAcceso).append("</contador-de-acceso>\n")
                .append("\t <tipo-de-membresia>: ").append(tipoMembresia).append("</tipo-de-membresia>\n")
                .append("</cliente>");

        return jsonBuilder.toString();

    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Cliente\": {\n")
                .append("\t \"Nif\": ").append("\"" + nif + "\"").append(",\n")
                .append("\t \"Nombre\": ").append("\"" + nombre + "\"").append(",\n")
                .append("\t \"Apellidos\": ").append("\"" + apellidos + "\"").append(",\n")
                .append("\t \"Fecha de nacimiento\": ").append("\"" + fnac + "\"").append(",\n")
                .append("\t \"Fecha de alta\": ").append("\"" + fAlta + "\"").append(",\n")
                .append("\t \"Contador de acceso\": ").append("\"" + contAcceso + "\"").append(",\n")
                .append("\t \"Tipo de membresia\": ").append("\"" + tipoMembresia + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }




}
