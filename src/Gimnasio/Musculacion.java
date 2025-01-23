package Gimnasio;

public class Musculacion extends Sala{

    public Musculacion(String nifCliente, int codGimnasio, int codigo, int clases, String horario) {
        super(nifCliente, codGimnasio, codigo, clases, horario);
    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Musculacion\": {\n")
                .append("\t \"Codigo Muscilacion\": ").append("\"" + codigo + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<musculacion>\n")
                .append("\t <codigo-musculacion>: ").append(codigo).append("</codigo-musculacion>\n")
                .append("</musculacion>");

        return jsonBuilder.toString();

    }

}
