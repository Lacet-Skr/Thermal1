/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Clase.Proveedores;
import DAO.ProveedoresDAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BDProveedores implements ProveedoresDAO {
    
    protected static String SQL_SELECT = "SELECT idproveedor, nombreproveedor, rfcproveedor, direccionproveedor, telefonoproveedor, "
            + "contactoproveedor, observacionesproveedor FROM proveedores ";
    
    protected static String SQL_INSERT = "INSERT INTO proveedores(idproveedor, nombreproveedor, rfcproveedor, direccionproveedor, telefonoproveedor, "
            + "contactoproveedor, observacionesproveedor) VALUES (?,?,?,?,?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE proveedores SET nombreproveedor = ?, rfcproveedor = ?, direccionproveedor = ?, telefonoproveedor = ?, "
            + "contactoproveedor = ?, observacionesproveedor = ?  WHERE  idproveedor = ?";

    public void insertarProveedor(Proveedores p) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt  = null;
        try{
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setInt(1, p.getIdproveedor());
            stmt.setString(2, p.getNombreproveedor());
            stmt.setString(3, p.getRfcproveedor());
            stmt.setString(4, p.getDireccionproveedor());
            stmt.setInt(5, p.getTelefonoproveedor());
            stmt.setString(6, p.getContactoproveedor());
            stmt.setString(7, p.getObservacionesproveedor());
            System.out.println("Executing " + SQL_INSERT);
           stmt.executeUpdate();
        }catch (SQLException ex){
            System.out.println("no inserto el proveedor"+ ex.getMessage());
        }finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public void actualizarProveedor(Proveedores p) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            stmt.setString(1, p.getNombreproveedor());
            stmt.setString(2, p.getRfcproveedor());
            stmt.setString(3, p.getDireccionproveedor());
            stmt.setInt(4, p.getTelefonoproveedor());
            stmt.setString(5, p.getContactoproveedor());
            stmt.setString(6, p.getObservacionesproveedor());
            stmt.setInt(7, p.getIdproveedor());
            System.out.println("Ejecutando: SQL_UPDATE con id: "+ p.getIdproveedor());
           stmt.executeUpdate();
        }catch (SQLException ex){
            System.out.println("no actualizo el proveedor"+ ex.getMessage());
        }finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public Proveedores buscarProveedor(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idproveedor=" + id;
        Proveedores p = new Proveedores();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try{
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if(res.next()){
             p.setIdproveedor(id);
             p.setNombreproveedor(res.getString("nombreproveedor"));
             p.setRfcproveedor(res.getString("rfcproveedor"));
             p.setDireccionproveedor(res.getString("direccionproveedor"));
             p.setTelefonoproveedor(res.getInt("telefonoproveedor"));
             p.setContactoproveedor(res.getString("contactoproveedor"));
             p.setObservacionesproveedor(res.getString("observacionesproveedor"));
            }
        }catch(SQLException ex){
            System.out.println("no encodntro proveedor"+ ex.getMessage());
            return null;
        }finally{
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return p;
    }

    public ArrayList<Proveedores> listarNombre(String nombre) throws SQLException {
        String sql = SQL_SELECT + " WHERE nombreproveedor like '" + nombre + "%' ORDER BY nombreproveedor";
        return consultarSQL(sql);
    }
    private ArrayList<Proveedores> consultarSQL(String sql) {
           ArrayList<Proveedores> list = new ArrayList<Proveedores>();
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            Proveedores p;
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            while (res.next()) {
             p = new Proveedores();
             p.setIdproveedor(res.getInt("idproveedor"));
             p.setNombreproveedor(res.getString("nombreproveedor"));
             p.setRfcproveedor(res.getString("rfcproveedor"));
             p.setDireccionproveedor(res.getString("direccionproveedor"));
             p.setTelefonoproveedor(res.getInt("telefonoproveedor"));
             p.setContactoproveedor(res.getString("contactoproveedor"));
             p.setObservacionesproveedor(res.getString("observacionesproveedor"));
             list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println("No listo el proveedor : " + ex.getMessage());
            return null;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return list;
    }
     public static int ulProveedor() throws SQLException {
        String sql = "SELECT MAX(idproveedor)+1 FROM proveedor";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idproveedor)+1");
        } catch (SQLException ex) {
            System.out.println("No busco ULTIMO PROVEEDOR: " + ex.getMessage());
            return 0;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }
    public ArrayList<Proveedores> listar() throws SQLException {
        String sql = SQL_SELECT + "ORDER BY nombreproveedor";
        return consultarSQL(sql);
        
    }

    
    
}
