package servlet;

import controller.controladorCurso;
import include.Curso;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletCrearCurso", urlPatterns = {"/crearCurso"})
public class ServletCrearCurso extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_CURSO = 0;
        try {
            id_CURSO = Integer.parseInt(request.getParameter("id_CURSO"));
        }catch (NumberFormatException e){

        }
        String nombre_CURSO= request.getParameter("nombre_CURSO");
        String NIVEL = request.getParameter("NIVEL");


        Curso nuevoCurso = new Curso(id_CURSO, nombre_CURSO, NIVEL);

        controladorCurso cc = new controladorCurso();
        if (cc.insertCurso(nuevoCurso)){
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("a_curso.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

