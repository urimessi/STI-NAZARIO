<jsp:include page='views/header.jsp'></jsp:include>

<%@page import="controller.controladorCurso" %>
<%@page import="include.Curso" %>
<%@page import="java.util.ArrayList" %>

<%
    String id_CURSO = request.getParameter("id_CURSO");
    controladorCurso cc = new controladorCurso();
    ArrayList<Curso> cursos = new ArrayList<Curso>();
    cursos = cc.obtenerCurso(id_CURSO);
%>

<div class="container">
    <form class="col s12" action="/modificarCurso" method="post">
        <div class="row">
            <div class="input-field col s12 center">
                <p class="center login-form-text">Modificar Curso</p>
            </div>
        </div>
        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8 center">
                <input id="id_CURSO" name="id_CURSO" type="text" readonly="readonly" value="<% out.print(cursos.get(0).getId_curso()); %>">
                <label for="id_CURSO" class="center-align">Curso</label>
            </div>
            <div class="col s2">

            </div>
        </div>
        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8">
                <input id="nombre_CURSO" name="nombre_CURSO" type="text" value="<% out.print(cursos.get(0).getNombre_curso()); %>">
                <label for="nombre_CURSO" class="center-align">Nombre del curso</label>
            </div>
            <div class="col s2">

            </div>
        </div>
        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8">
                <input id="NIVEL" name="NIVEL" type="text" value="<% out.print(cursos.get(0).getNivel()); %>">
                <label for="NIVEL" class="center-align">Nivel</label>
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
                <input type="submit" value="Actualizar" onclick='return(verif(this.form)); MM_validateForm()' class="btn col s12">
                <a class="btn col s6" href="cursos.jsp">Regresar</a>
            </div>
            <div class="col s2">

            </div>
        </div>
    </form>
</div>


<jsp:include page='views/footer.jsp'></jsp:include><jsp:include page='views/footer.jsp'></jsp:include>