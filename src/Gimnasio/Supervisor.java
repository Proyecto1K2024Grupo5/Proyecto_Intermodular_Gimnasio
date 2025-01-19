package Gimnasio;

public class Supervisor {

    private String nifSupervisor;

    public void dirigir(){

    }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<supervisor>\n")
                .append("\t <nif-supervisor>: ").append(nifSupervisor).append("</nif-supervisor>\n")
                .append("</supervisor>");

        return jsonBuilder.toString();

    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Supervisor\": {\n")
                .append("\t \"Nif supervisor\": ").append("\"" + nifSupervisor + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

}
