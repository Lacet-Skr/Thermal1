/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Clase.Permisos;
import DAO.PermisoDAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author LACET
 */
public class BDPermiso implements PermisoDAO{
    
    protected static String SQL_SELECT = "SELECT idpermiso, usuario, menu FROM permisos";
    
    protected static String SQL_INSERT = "INSERT INTO permisos(idpermiso, usuario, menu) VALUES (?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE permisos SET usuario = ?, menu = ? WHERE idpermiso = ?";
    
    protected static String SQL_DELETE = "DELETE FROM permisos WHERE idpermiso = ?";
    
    public void insertarPermisos(Permisos p) throws SQLException {
       Connection conn = null;
       PreparedStatement stmt = null;
       try{
           conn = BD.getConnection();//Viene de la clase BD que esta dentro de este mismo paquete por ello no se debe importar
           stmt =conn.prepareStatement(SQL_INSERT);
           
           stmt.setInt(1, p.getIdpermiso());
           stmt.setInt(2, p.getUsuario());
           stmt.setInt(3, p.getMenu());
           System.out.println("Executing " + SQL_INSERT);
           stmt.executeUpdate();
       }catch(SQLException ex){
           System.out.println("No se inserto el Permiso" + ex.getMessage());
           System.out.println(ex);
       }finally{
           BD.close(conn);
           BD.close(stmt);
       }
    }

    public void borrarPermisos (int permiso) throws SQLException { 
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, permiso);
            stmt.executeUpdate();
        }catch(SQLException ex){
            System.out.println("No elimino al Permiso: " + ex.getMessage());
        }finally {
            BD.close(conn);
            BD.close(stmt);
        }
    }
    
    public void actualizarPermisos(Permisos p) throws SQLException {
        Connection conn = null;
       PreparedStatement stmt = null;
       try{
           conn = BD.getConnection();//Viene de la clase BD que esta dentro de este mismo paquete por ello no se debe importar
           stmt =conn.prepareStatement(SQL_UPDATE);
           
           stmt.setInt(1, p.getUsuario());
           stmt.setInt(2, p.getMenu());
           stmt.setInt(3, p.getIdpermiso());
           System.out.println("Ejecutando: SQL_UPDATE con id: "+ p.getIdpermiso());
           stmt.executeUpdate();
       } catch (SQLException ex) {
            System.err.println("No actualiza el Permiso: " + ex.getMessage());
        } finally {
            BD.close(conn);
            BD.close(stmt);
        }
    }

    
    public Permisos buscarPermisos(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idpermiso=" + id;
        Permisos p = new Permisos();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try {
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if (res.next()) {
                p.setIdpermiso(id);
                p.setUsuario(res.getInt("usuario"));
                p.setMenu(res.getInt("menu"));
            }
        } catch (SQLException ex) {
            System.out.println("No busco al Permiso: " + ex.getMessage());
            return null;
        } finally {
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return p;
    }
    
    private ArrayList<Permisos> consultarSQL(String sql) throws SQLException {
        ArrayList<Permisos> list = new ArrayList<Permisos>();
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            Permisos p;
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            while (res.next()) {
                p = new Permisos();
                p.setIdpermiso(res.getInt("idpermiso"));
                p.setUsuario(res.getInt("usuario"));
                p.setMenu(res.getInt("menu"));
                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println("No listo al Permiso: " + ex.getMessage());
            return null;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return list;
    }
    
    public int ulPermisos() throws SQLException {
        String sql = "SELECT MAX(idpermiso)+1 FROM permisos";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idpermiso)+1");
        } catch (SQLException ex) {
            System.out.println("No busco el ULTIMO Permiso: " + ex.getMessage());
            return 0;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }

    
    public ArrayList<Permisos> listar() throws SQLException {
       String sql = SQL_SELECT + " ORDER BY usuario";
        return consultarSQL(sql);
    }

    
    public ArrayList<Permisos> listarUsuario(int usuario) throws SQLException {
       String sql = SQL_SELECT + " WHERE usuario like '" + usuario + "%' ORDER BY usuario";
        return consultarSQL(sql);
    }
    
}
