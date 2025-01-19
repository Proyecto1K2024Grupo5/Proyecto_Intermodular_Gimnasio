package Gimnasio;

public class Trabajador {

    private String nif;
    private String nombre;
    private String apellidos;
    private String fnac;
    private String email;


    public void dirigir(){

    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<trabajador>\n")
                .append("\t <nif>: ").append(nif).append("</nif>\n")
                .append("\t <nombre>: ").append(nombre).append("</nombre>\n")
                .append("\t <apellidos>: ").append(apellidos).append("</apellidos>\n")
                .append("\t <fecha-de-nacimiento>: ").append(fnac).append("</fecha-de-nacimiento>\n")
                .append("\t <email>: ").append(email).append("</email>\n")
                .append("</trabajador>");

        return jsonBuilder.toString();

    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Trabajador\": {\n")
                .append("\t \"Nif\": ").append("\"" + nif + "\"").append(",\n")
                .append("\t \"Nombre\": ").append("\"" + nombre + "\"").append(",\n")
                .append("\t \"Apellidos\": ").append("\"" + apellidos + "\"").append(",\n")
                .append("\t \"Fecha de nacimiento\": ").append("\"" + fnac + "\"").append(",\n")
                .append("\t \"Email\": ").append("\"" + email + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

}
