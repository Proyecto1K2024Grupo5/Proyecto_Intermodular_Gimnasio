package Gimnasio;

public class Monitor extends Trabajador{


    public void dirigir(){}


    public Monitor(String nif, String nombre, String apellidos, String fnac, String email) {
        super(nif, nombre, apellidos, fnac, email);
    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<monitor>\n")
                .append("\t <nif-monitor>: ").append(nif).append("</nif-monitor>\n")
                .append("</monitor>");

        return jsonBuilder.toString();

    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Monitor\": {\n")
                .append("\t \"Nif monitor\": ").append("\"" + nif + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

}
