package Gimnasio;

public class Gimnasio {

    private int codigo;
    private String nombre;



    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Gimnasio\": {\n")
                .append("\t \"Codigo\": ").append("\"" + codigo + "\"").append(",\n")
                .append("\t \"Nombre\": ").append("\"" + nombre + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<gimnasio>\n")
                .append("\t <codigo>: ").append(codigo).append("</codigo>\n")
                .append("\t <nombre>: ").append(nombre).append("</nombre>\n")
                .append("</gimnasio>");

        return jsonBuilder.toString();

    }


}
