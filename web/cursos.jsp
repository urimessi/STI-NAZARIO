<jsp:include page='views/header.jsp'></jsp:include>
<%@ page import="include.Curso" %>
<%@ page import="controller.controladorCurso" %>
<%@ page import="java.util.ArrayList" %>

<div class="container">
    <div class="row">
        <div class="input-field col s6 center">
            <h3>Cursos</h3>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s6">
            <a class="btn" href="a_curso.jsp">Nuevo</a>
        </div>
    </div>
    <div class="row margin">
        <div class="col s10 center">
            <table class="striped">
                <thead>
                <tr>
                    <th>id_curso</th>
                    <th>nombre_curso</th>
                    <th>nivel</th>
                </tr>
                </thead>
                <%
                    String htmlcode = "<tbody>";
                    controladorCurso cc = new controladorCurso();
                    int contador = 0;
                    ArrayList<Curso> cursos = new ArrayList<Curso>();
                    cursos = cc.obtenerCurso();
                    if (cursos.size()> 0){
                        for (int a= 0; a<cursos.size();a++){
                            htmlcode += "<tr><td>" + cursos.get(a).getId_curso()
                                    + "</td><td>" + cursos.get(a).getNombre_curso()
                                    + "</td><td>" + cursos.get(a).getNivel()
                                    + "</td><td><a class=\"btn\" href=\"#\"><i class=\"material-icons\">zoom_in</i></a>"
                                    + "<a class=\"btn blue\" href=\"m_curso.jsp?id_CURSO="+ cursos.get(a).getId_curso()+"\"><i class=\"material-icons\">create</i></a>"
                                    + "<a class=\"btn red\" onclick=\"delete_curso('"+ cursos.get(a).getId_curso()+"')\"><i class=\"material-icons\">delete</i></a>"
                                    + "</td></tr>";
                        }
                    }else {
                        htmlcode += "<tr><td colspan=\"10\">No existen cursos</td></tr>";
                    }
                    htmlcode += "</tbody>";

                    out.print(htmlcode);
                %>
            </table>
        </div>
    </div>
</div>

<jsp:include page='views/footer.jsp'></jsp:include>