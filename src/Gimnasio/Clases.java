package Gimnasio;

public class Clases extends Sala {


    public Clases(String nifCliente, int codGimnasio, int codigo, int clases, String horario) {
        super(nifCliente, codGimnasio, codigo, clases, horario);
    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Clases\": {\n")
                .append("\t \"CodigoClases\": ").append("\"" + codigo + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<clases>\n")
                .append("\t <codigo-de-clases>: ").append(codigo).append("</codigo-de-gimnasio>\n")
                .append("</clases>");

        return jsonBuilder.toString();

    }
}
