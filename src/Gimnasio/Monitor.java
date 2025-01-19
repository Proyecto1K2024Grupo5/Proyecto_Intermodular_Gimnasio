package Gimnasio;

public class Monitor {

    private String nifMonitor;

    public void dirigir(){}

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<monitor>\n")
                .append("\t <nif-monitor>: ").append(nifMonitor).append("</nif-monitor>\n")
                .append("</monitor>");

        return jsonBuilder.toString();

    }

    public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
                .append("\t\"Monitor\": {\n")
                .append("\t \"Nif monitor\": ").append("\"" + nifMonitor + "\"").append(",\n")
                .append("\t}\n")
                .append("}");

        return jsonBuilder.toString();

    }

}
