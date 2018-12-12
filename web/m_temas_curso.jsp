<jsp:include page='views/header.jsp'></jsp:include>
<%--
  Created by IntelliJ IDEA.
  User: NAZARIO
  Date: 10/12/2018
  Time: 02:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="controller.controladorTemas_curso" %>
<%@page import="include.Temas_curso" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="include.Curso" %>
<%@ page import="controller.controladorCurso" %>

<%
    String id_TEMAS = request.getParameter("id_TEMAS");
    controladorTemas_curso cc = new controladorTemas_curso();
    ArrayList<Temas_curso> temasCursos = new ArrayList<Temas_curso>();
    temasCursos = cc.obtenerTemas_curso(id_TEMAS);
%>

<%
    controladorCurso ct = new controladorCurso();
    ArrayList<Curso> cursos = new ArrayList<Curso>();
    cursos = ct.obtenerCurso();


    String htmlselect = "";
    htmlselect += "<select name=\"id_CURSO\">\n" +
            "                <option value=\"\" selected disabled>Elige el curso" +
            "</option>\n";
    for(int a=0; a<cursos.size();a++){
        htmlselect += "<option value=\""+cursos.get(a).getId_curso()+"\">"+cursos.get(a).getNombre_curso()+"</option>\n";
    }
    htmlselect += "            </select>";

%>

<div class="container">
    <form class="col s12" action="/modificarTemasCurso" method="post">
        <div class="row">
            <div class="input-field col s12 center">
                <p class="center login-form-text">Modificar Temas Curso</p>
            </div>
        </div>
        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8 center">
                <input id="id_TEMAS" name="id_TEMAS" type="text" readonly="readonly" value="<% out.print(temasCursos.get(0).getId_temas()); %>">
                <label for="id_TEMAS" class="center-align">ID Temas Curso</label>
            </div>
            <div class="col s2">

            </div>
        </div>
        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8">
                <input id="nombre_TEMA" name="nombre_TEMA" type="text" value="<% out.print(temasCursos.get(0).getNombre_tema()); %>">
                <label for="nombre_TEMA" class="center-align">Nombre del tema</label>
            </div>
            <div class="col s2">

            </div>
        </div>
        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8">
                <%
                    out.print(htmlselect);
                %>
                <%--
                <input id="id_CURSO" name="id_CURSO" type="text" value="<% out.print(temasCursos.get(0).getId_curso()); %>">
                <label for="id_CURSO" class="center-align">Id Curso</label>
                --%>
            </div>
            <div class="col s2">

            </div>
        </div>

        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8">

            </div>
            <div class="col s2">

            </div>
        </div>
        <div class="row">
            <div class="col s4">

            </div>
            <div class="input-field col s4">
                <input type="submit" value="Actualizar" onclick='return(verif(this.form)); MM_validateForm()' class="btn col s6">
                <a class="btn col s6" href="temas_curso.jsp">Regresar</a>
            </div>
            <div class="col s4">

            </div>
        </div>
    </form>
</div>


<jsp:include page='views/footer.jsp'></jsp:include>