package models;

import include.Curso;
import include.Temas_curso;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class modeloTemas_curso extends conexion {

    public boolean insertTemas_curso(Temas_curso temas_curso){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String consulta = "INSERT INTO temas_curso (id_temas, nombre_tema, id_curso)VALUES (?,?,?)";
            pst = getConection().prepareStatement(consulta);
            pst.setInt(1,temas_curso.getId_temas());
            pst.setString(2,temas_curso.getNombre_tema());
            pst.setInt(3, temas_curso.getId_curso());

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

    public ArrayList<Temas_curso> obtenerTemas_curso(){
        ArrayList<Temas_curso> temas_cursos = new ArrayList<Temas_curso>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "SELECT id_temas, nombre_tema, id_curso FROM temas_curso";
            pst = getConection().prepareCall(consulta);
            rs = pst.executeQuery();
            while (rs.next()){
                temas_cursos.add(new Temas_curso(rs.getInt("id_temas"),
                        rs.getString("nombre_tema"),
                        rs.getInt("id_curso")));
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
        return temas_cursos;
    }

    public ArrayList<Curso> obtenerCursofk(){
        ArrayList<Curso>  cursos = new ArrayList<Curso>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta ="SELECT id_curso, nombre_curso FROM curso";
            pst = getConection().prepareCall(consulta);
            rs = pst.executeQuery();
            while (rs.next()){
                cursos.add(new Curso(rs.getInt("id_curso"),
                        rs.getString("nombre_curso")));
            }
        }catch (Exception e){

        }finally {
            try {
                if (getConection() !=null)getConection().close();
                if (pst != null)pst.close();
                if (rs !=null)rs.close();
            }catch (Exception e){

            }
        }
        return cursos;
    }
    public ArrayList<Temas_curso> obtenerTemas_curso(String id){
        ArrayList<Temas_curso> Temas_curso = new ArrayList<Temas_curso>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "SELECT id_temas, nombre_tema, id_curso FROM temas_curso WHERE id_temas = ?";
            pst = getConection().prepareCall(consulta);
            pst.setString(1, id);
            rs= pst.executeQuery();
            while (rs.next()){
                Temas_curso.add(new Temas_curso(rs.getInt("id_temas"),
                        rs.getString("nombre_tema"),
                        rs.getInt("id_curso")));
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
        return Temas_curso;
    }

    public boolean actualizarTemas_curso(Temas_curso Temas_curso){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String consulta = "UPDATE temas_curso SET id_temas = ?, nombre_tema = ?, id_curso = ? WHERE id_temas = ?";
            pst = getConection().prepareStatement(consulta);
            pst.setInt(1, Temas_curso.getId_temas());
            pst.setString(2, Temas_curso.getNombre_tema());
            pst.setInt(3, Temas_curso.getId_curso());
            pst.setInt(4, Temas_curso.getId_temas());

            if (pst.executeUpdate() == 1){
                flag = true;
            }
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }finally {
            try {
                if (getConection() != null) getConection().close();
                if (pst != null)pst.close();
            }catch (Exception a){
                System.out.println(a.getMessage());
            }
        }
        return flag;
    }

    public boolean eliminarTemas_curso(String id){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String consulta = "DELETE FROM temas_curso WHERE id_temas = ?";
            pst = getConection().prepareStatement(consulta);
            pst.setString(1, id);

            if (pst.executeUpdate() ==1){
                flag = true;
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