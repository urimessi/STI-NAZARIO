package include;

public class Curso {

    private int id_curso;
    private String nombre_curso;
    private String nivel;

    public Curso(int id_curso, String nombre_curso) {
        this.id_curso = id_curso;
        this.nombre_curso = nombre_curso;
    }

    public Curso(int id_curso, String nombre_curso, String nivel) {
        this.id_curso = id_curso;
        this.nombre_curso = nombre_curso;
        this.nivel = nivel;
    }

    public int getId_curso() {
        return id_curso;
    }

    public void setId_curso(int id_curso) {
        this.id_curso = id_curso;
    }

    public String getNombre_curso() {
        return nombre_curso;
    }

    public void setNombre_curso(String nombre_curso) {
        this.nombre_curso = nombre_curso;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }
}
