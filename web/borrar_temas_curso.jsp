<%--
  Created by IntelliJ IDEA.
  User: NAZARIO
  Date: 10/12/2018
  Time: 02:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="controller.controladorTemas_curso" %>
<<%
    String id_TEMAS = request.getParameter("id_TEMAS");
    controladorTemas_curso cc = new controladorTemas_curso();
    if (cc.eliminarTemas_curso(id_TEMAS)){
        response.sendRedirect("temas_curso.jsp");
    }else {
        response.sendRedirect("index.jsp");
    }
%>