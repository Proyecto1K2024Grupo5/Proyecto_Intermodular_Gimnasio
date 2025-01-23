package Gimnasio;

public class Sala {

    protected String nifCliente;
    protected int codGimnasio;
    protected int codigo;
    protected int clases;
    protected String horario;


    public Sala(String nifCliente, int codGimnasio, int codigo, int clases, String horario) {
        this.nifCliente = nifCliente;
        this.codGimnasio = codGimnasio;
        this.codigo = codigo;
        this.clases = clases;
        this.horario = horario;
    }

    public String getNifCliente() {
        return nifCliente;
    }

    public void setNifCliente(String nifCliente) {
        this.nifCliente = nifCliente;
    }

    public int getCodGimnasio() {
        return codGimnasio;
    }

    public void setCodGimnasio(int codGimnasio) {
        this.codGimnasio = codGimnasio;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getClases() {
        return clases;
    }

    public void setClases(int clases) {
        this.clases = clases;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

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
