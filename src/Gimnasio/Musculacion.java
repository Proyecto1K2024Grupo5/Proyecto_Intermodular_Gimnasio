package Gimnasio;

public class Musculacion {

    private int codigoMusculacion;

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Musculacion\": {\n")
                .append("\t \"Codigo Muscilacion\": ").append("\"" + codigoMusculacion + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<musculacion>\n")
                .append("\t <codigo-musculacion>: ").append(codigoMusculacion).append("</codigo-musculacion>\n")
                .append("</musculacion>");

        return jsonBuilder.toString();

    }

}
