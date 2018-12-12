package include;

public class Temas_curso {
    private int id_temas;
    private String nombre_tema;
    private int id_curso;

    public Temas_curso(int id_temas, String nombre_tema, int id_curso) {
        this.id_temas = id_temas;
        this.nombre_tema = nombre_tema;
        this.id_curso = id_curso;
    }

    public int getId_temas() {
        return id_temas;
    }

    public void setId_temas(int id_temas) {
        this.id_temas = id_temas;
    }

    public String getNombre_tema() {
        return nombre_tema;
    }

    public void setNombre_tema(String nombre_tema) {
        this.nombre_tema = nombre_tema;
    }

    public int getId_curso() {
        return id_curso;
    }

    public void setId_curso(int id_curso) {
        this.id_curso = id_curso;
    }
}
