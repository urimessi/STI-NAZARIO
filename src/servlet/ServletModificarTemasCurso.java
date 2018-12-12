package servlet;

import controller.controladorTemas_curso;
import include.Temas_curso;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletModificarTemasCurso", urlPatterns ={"/modificarTemasCurso"})
public class ServletModificarTemasCurso extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_TEMAS=0;
        try {
            id_TEMAS = Integer.parseInt(request.getParameter("id_TEMAS"));
        } catch (NumberFormatException e){

        }

        String nombre_TEMA =  request.getParameter("nombre_TEMA");
        int id_CURSO=0;
        try {
            id_CURSO = Integer.parseInt(request.getParameter("id_CURSO"));
        }catch (NumberFormatException e){

        }

        Temas_curso nuevoTemaCurso = new Temas_curso(id_TEMAS, nombre_TEMA, id_CURSO);

        controladorTemas_curso cc = new controladorTemas_curso();
        if (cc.actualizarTemas_curso(nuevoTemaCurso)){
            response.sendRedirect("temas_curso.jsp");
        }else {
            response.sendRedirect("m_temas_curso.jsp?id="+ id_CURSO);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
