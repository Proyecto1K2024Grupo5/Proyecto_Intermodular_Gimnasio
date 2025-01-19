package Gimnasio;

public class Clases {

    private int codigoClases;

    public Clases(int codigo) {
        this.codigoClases = codigo;

    }


    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Clases\": {\n")
                .append("\t \"CodigoClases\": ").append("\"" + codigoClases + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<clases>\n")
                .append("\t <codigo-de-clases>: ").append(codigoClases).append("</codigo-de-gimnasio>\n")
                .append("</clases>");

        return jsonBuilder.toString();

    }
}
