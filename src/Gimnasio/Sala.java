package Gimnasio;

public class Sala {

    private String nifCliente;
    private int codGimnasio;
    private int codigo;
    private int clases;
    private String horario;

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<sala>\n")
                .append("\t <nif-cliente>: ").append(nifCliente).append("</nif-cliente>\n")
                .append("\t <codigo-gimnasio>: ").append(codGimnasio).append("</codigo-gimnasio>\n")
                .append("\t <codigo>: ").append(codigo).append("</codigo>\n")
                .append("\t <clases>: ").append(clases).append("</clases>\n")
                .append("\t <horario>: ").append(horario).append("</horario>\n")
                .append("</sala>");

        return jsonBuilder.toString();

    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Sala\": {\n")
                .append("\t \"Nif cliente\": ").append("\"" + nifCliente + "\"").append(",\n")
                .append("\t \"Codigo de gimnasio\": ").append("\"" + codGimnasio + "\"").append(",\n")
                .append("\t \"Codigo\": ").append("\"" + codigo + "\"").append(",\n")
                .append("\t \"Clases\": ").append("\"" + clases + "\"").append(",\n")
                .append("\t \"Horario\": ").append("\"" + horario + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }



}
