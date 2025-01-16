package Gimnasio;

public class Acceso {

    private int codigoGimnasio;
    private String nifCliente;
    private String fechaEntrada;
    private String fechaSalida;



    public Acceso(int codigo, String nif, String feEn, String fecSa) {

        this.codigoGimnasio = codigo;
        this.nifCliente = nif;
        this.fechaEntrada = feEn;
        this.fechaSalida = fecSa;
    }




        public String toJson() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("{\n")
            .append("\t \"CodigoGimnasio\": ").append(codigoGimnasio).append(",\n")
            .append("\t \"nifCliente\": ").append(nifCliente).append(",\n")
            .append("\t \"fechaEntrada\": ").append(fechaEntrada).append(",\n")
            .append("\t \"fechaSalida\": ").append(fechaSalida).append(",\n")
                .append("}");

        return jsonBuilder.toString();

        }

    public String toXml() {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.append("<Acceso>\n")
                .append("\t <CodigoGimnasio>: ").append(codigoGimnasio).append("</CodigoGimnasio>\n")
                .append("\t <nifCliente>: ").append(nifCliente).append("</nifCliente>\n")
                .append("\t <fechaEntrada>: ").append(fechaEntrada).append("</fechaEntrada>\n")
                .append("\t <fechaSalida>: ").append(fechaSalida).append("</fechaSalida>\n")
                .append("</Acceso>");

        return jsonBuilder.toString();




    }






}
