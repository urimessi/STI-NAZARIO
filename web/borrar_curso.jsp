<%@ page import="controller.controladorCurso" %>
<%
    String id_CURSO = request.getParameter("id_CURSO");
    controladorCurso cc = new controladorCurso();
    if (cc.eliminarCurso(id_CURSO)){
        response.sendRedirect("cursos.jsp");
    }else {
        response.sendRedirect("index.jsp");
    }
%>