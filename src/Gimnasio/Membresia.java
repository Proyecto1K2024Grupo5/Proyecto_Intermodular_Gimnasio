package Gimnasio;

public class Membresia {

    private String tipo;
    private double precio;


    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<membresia>\n")
                .append("\t <tipo>: ").append(tipo).append("</tipo>\n")
                .append("\t <precio>: ").append(precio).append("</precio>\n")
                .append("</membresia>");

        return jsonBuilder.toString();

    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Membresia\": {\n")
                .append("\t \"Tipo\": ").append("\"" + tipo + "\"").append(",\n")
                .append("\t \"Precio\": ").append("\"" + precio + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }


}
