<%@ page import="controller.controladorCurso" %>
<%@ page import="include.Curso" %>
<%@ page import="java.util.ArrayList" %>

<jsp:include page='views/header.jsp'></jsp:include>

<div class="container">
    <form class="col s12" action="/crearCurso" method="post">
        <div class="row">
            <div class="input-field col s12 center">
                <p class="center login-form-text">Insertar un nuevo Curso</p>
            </div>
        </div>
        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8 center">
                <input id="id_CURSO" name="id_CURSO" type="text" value="">
                <label for="id_CURSO" class="center-align">ID Curso</label>
            </div>
            <div class="col s2">

            </div>
        </div>
        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8">
                <input id="nombre_CURSO" name="nombre_CURSO" type="text" value="">
                <label for="nombre_CURSO" class="center-align">Nombre del curso</label>
            </div>
            <div class="col s2">

            </div>
        </div>
        <div class="row margin">
            <div class="col s2">

            </div>
            <div class="input-field col s8">
                <input id="NIVEL" name="NIVEL" type="text" value="">
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
                <input type="submit" value="Insertar" onclick='return(verif(this.form)); MM_validateForm()' class="btn col s12">
                <a class="btn col s6" href="cursos.jsp">Regresar</a>
            </div>
            <div class="col s4">

            </div>
        </div>
    </form>
</div>


<jsp:include page='views/footer.jsp'></jsp:include>