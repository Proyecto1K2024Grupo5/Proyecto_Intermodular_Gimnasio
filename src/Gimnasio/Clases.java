package Gimnasio;

public class Clases {

    private int codigoClases;

    public Clases(int codigo){
        this.codigoClases = codigo;

    }


    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t \"codigoClases\": ").append(codigoClases).append(",\n")
                .append("}");

        return jsonBuilder.toString();

    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<Acceso>\n")
                .append("\t <codigoClases>").append(codigoClases).append("</codigoClases>\n")
                .append("</Acceso>");

        return jsonBuilder.toString();

    }
}
