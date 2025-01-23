package Gimnasio;

public class Supervisor extends Trabajador{


    public void dirigir(){

    }

    public Supervisor(String nif, String nombre, String apellidos, String fnac, String email) {
        super(nif, nombre, apellidos, fnac, email);
    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<supervisor>\n")
                .append("\t <nif-supervisor>: ").append(nif).append("</nif-supervisor>\n")
                .append("</supervisor>");

        return jsonBuilder.toString();

    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Supervisor\": {\n")
                .append("\t \"Nif supervisor\": ").append("\"" + nif + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

}
