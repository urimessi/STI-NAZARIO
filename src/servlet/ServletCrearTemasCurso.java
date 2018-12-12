package servlet;

import controller.controladorTemas_curso;
import include.Temas_curso;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletCrearTemasCurso", urlPatterns = {"/crearTemasCurso"})
public class ServletCrearTemasCurso extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_TEMAS = 0;

        String nombre_TEMA = request.getParameter("nombre_TEMA");

        int id_CURSO = 0;

        try {
            id_TEMAS = Integer.parseInt(request.getParameter("id_TEMAS"));
            id_CURSO = Integer.parseInt(request.getParameter("id_CURSO"));
        }catch (NumberFormatException e){

        }
        Temas_curso nuevoTemasCurso = new Temas_curso(id_TEMAS, nombre_TEMA, id_CURSO);

        controladorTemas_curso cc = new controladorTemas_curso();
        if (cc.insertTemas_curso(nuevoTemasCurso)){
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("a_temas_curso.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
