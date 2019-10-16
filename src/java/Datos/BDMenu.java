/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package Datos;

import Clase.Menus;
import DAO.MenuDAO;
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
public class BDMenu implements MenuDAO{
    
    protected static String SQL_SELECT = "SELECT idmenu, menu FROM menus";
    
    protected static String SQL_INSERT = "INSERT INTO menus(idmenu, menu) VALUES (?,?)";
    
    protected static String SQL_UPDATE = "UPDATE menus SET menu = ? WHERE idmenu = ?";
    
    public void insertarMenus(Menus m) throws SQLException {
        Connection conn = null;
       PreparedStatement stmt = null;
       try{
           conn = BD.getConnection();//Viene de la clase BD que esta dentro de este mismo paquete por ello no se debe importar
           stmt =conn.prepareStatement(SQL_INSERT);
           
           stmt.setInt(1, m.getIdmenu());
           stmt.setString(2, m.getMenu());
           System.out.println("Executing " + SQL_INSERT);
           stmt.executeUpdate();
       }catch(SQLException ex){
           System.out.println("No se inserto el Menu" + ex.getMessage());
           System.out.println(ex);
       }finally{
           BD.close(conn);
           BD.close(stmt);
       }
    }

    
    public void actualizarMenus(Menus m) throws SQLException {
       Connection conn = null;
       PreparedStatement stmt = null;
       try{
           conn = BD.getConnection();//Viene de la clase BD que esta dentro de este mismo paquete por ello no se debe importar
           stmt =conn.prepareStatement(SQL_UPDATE);
           
           stmt.setString(1, m.getMenu());
           stmt.setInt(2, m.getIdmenu());
           System.out.println("Ejecutando: SQL_UPDATE con id: "+ m.getIdmenu());
           stmt.executeUpdate();
       } catch (SQLException ex) {
            System.err.println("No actualiza el Menu: " + ex.getMessage());
        } finally {
            BD.close(conn);
            BD.close(stmt);
        }
    }

    
    public Menus buscarMenus(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idmenu=" + id;
        Menus m = new Menus();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try {
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if (res.next()) {
                m.setIdmenu(id);
                m.setMenu(res.getString("menu"));
            }
        } catch (SQLException ex) {
            System.out.println("No busco al Menu: " + ex.getMessage());
            return null;
        } finally {
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return m;
    }

    
    public ArrayList<Menus> listarMenu(String menu) throws SQLException {
        String sql = SQL_SELECT + " WHERE menu like '" + menu + "%' ORDER BY menu";
        return consultarSQL(sql);
    }

    private ArrayList<Menus> consultarSQL(String sql) throws SQLException {
        ArrayList<Menus> list = new ArrayList<Menus>();
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            Menus m;
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            while (res.next()) {
                m = new Menus();
                m.setIdmenu(res.getInt("idmenu"));
                m.setMenu(res.getString("menu"));
                list.add(m);
            }
        } catch (SQLException ex) {
            System.out.println("No listo al Menu: " + ex.getMessage());
            return null;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return list;
    }
    
    public static int ulMenus() throws SQLException {
        String sql = "SELECT MAX(idmenu)+1 FROM menus";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idmenu)+1");
        } catch (SQLException ex) {
            System.out.println("No busco el ULTIMO Menu: " + ex.getMessage());
            return 0;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }
    
    public ArrayList<Menus> listar() throws SQLException {
        String sql = SQL_SELECT + " ORDER BY menu";
        return consultarSQL(sql);
    }
    
}
