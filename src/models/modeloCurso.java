package models;

import include.Curso;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class modeloCurso extends conexion {
    public boolean insertCurso (Curso curso){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String consulta = "INSERT INTO curso (id_curso, nombre_curso, nivel)VALUES (?,?,?)";
            pst = getConection().prepareStatement(consulta);
            pst.setInt(1,curso.getId_curso());
            pst.setString(2,curso.getNombre_curso());
            pst.setString(3, curso.getNivel());

            if (pst.executeUpdate()== 1){
                flag = true;
            }
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }finally {
            try {
                if (getConection() != null) getConection().close();
                if (pst != null) pst.close();
            }catch (Exception e){

            }
            return flag;
        }

    }
    public ArrayList<Curso> obtenerCurso(){
        ArrayList<Curso> cursos = new ArrayList<Curso>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "SELECT id_curso, nombre_curso, nivel FROM curso";
            pst = getConection().prepareCall(consulta);
            rs = pst.executeQuery();
            while (rs.next()){
                cursos.add(new Curso(rs.getInt("id_curso"),
                        rs.getString("nombre_curso"),
                        rs.getString("nivel")));
            }
        }catch (Exception e){

        }finally {
            try {
                if (getConection() != null)getConection().close();
                if (pst != null)pst.close();
                if (rs != null)rs.close();
            }catch (Exception e){

            }
        }
        return cursos;
    }
    public ArrayList<Curso> obtenerCurso(String id){
        ArrayList<Curso> Curso = new ArrayList<Curso>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "SELECT id_curso, nombre_curso, nivel FROM curso WHERE id_curso = ?";
            pst = getConection().prepareCall(consulta);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()){
                Curso.add(new Curso(rs.getInt("id_curso"),
                        rs.getString("nombre_curso"),
                        rs.getString("nivel")));
            }

        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            try {
                if (getConection() != null)getConection().close();
                if (pst != null)pst.close();
                if (rs != null)rs.close();
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
        return Curso;
    }

    public boolean actualizarCurso(Curso Curso){
        PreparedStatement pst= null;
        boolean flag = false;
        try {
            String consulta = "UPDATE curso SET id_curso = ?, nombre_curso = ?, nivel = ? WHERE id_curso = ?";
            pst = getConection().prepareStatement(consulta);
            pst.setInt(1, Curso.getId_curso());
            pst.setString(2, Curso.getNombre_curso());
            pst.setString(3, Curso.getNivel());
            pst.setInt(4,Curso.getId_curso());

            if (pst.executeUpdate()==1){
                flag = true;
            }
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }finally {
            try {
                if (getConection() != null) getConection().close();
                if (pst != null) pst.close();
            }catch (Exception a){
                System.out.println(a.getMessage());
            }
        }
        return flag;
    }

    public boolean eliminarCurso(String id){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String consulta = "DELETE FROM curso WHERE id_curso = ?";
            pst = getConection().prepareStatement(consulta);
            pst.setString(1, id);

            if (pst.executeUpdate()==1){
                flag=true;
            }
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }finally {
            try {
                if (getConection() != null) getConection().close();
                if (pst != null) pst.close();
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
        return flag;
    }
}