/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.util.ArrayList;
import Clase.Compras;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import DAO.ComprasDAO;
import java.sql.SQLException;

public class BDCompras implements ComprasDAO {
    
    protected static String SQL_SELECT = "SELECT idcompra, proveedorcompra, fechacompra, totalcompra, observacionescompra FROM compras";
    
    protected static String SQL_INSERT = "INSERT INTO compras(idcompra, proveedorcompra, fechacompra, totalcompra, observacionescompra) VALUES (?,?,?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE compras SET proveedorcompra = ?, fechacompra = ?, totalcompra = ?, observacionescompra = ? WHERE  idcompra = ?";

    
    public void insertarCompra(Compras c) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt  = null;
        try{
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setInt(1, c.getIdcompra());
            stmt.setInt(2, c.getProveedorcompra());
            stmt.setDate(3, new java.sql.Date(c.getFechacompra().getTime()));
            stmt.setInt(4, c.getTotalcompra());
            stmt.setString(5, c.getObservacionescompra());
            stmt.executeUpdate();
        }catch(SQLException ex){
            System.out.println("no inserto"+ex.getMessage());
        }finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public void actualizarCompra(Compras c) throws SQLException {
         Connection conn = null;
        PreparedStatement stmt  = null;
        try{
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            stmt.setInt(1, c.getProveedorcompra());
            stmt.setDate(2, new java.sql.Date(c.getFechacompra().getTime()));
            stmt.setInt(3, c.getTotalcompra());
            stmt.setString(4, c.getObservacionescompra());
            stmt.setInt(1, c.getIdcompra());
            stmt.executeUpdate();
        }catch(SQLException ex){
            System.out.println("no inserto"+ex.getMessage());
        }finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public Compras buscarCompra(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idcompra=" + id;
        Compras c = new Compras();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
        try{
            conn = BD.getConnection();
            stmt = conn.prepareStatement(sql);
            res = stmt.executeQuery();
            
            if(res.next()){
             c.setIdcompra(id);
             c.setProveedorcompra(res.getInt("proveedorcompra"));
             c.setFechacompra(res.getDate("fechacompra"));
             c.setTotalcompra(res.getInt("totalcompra"));
             c.setObservacionescompra(res.getString("observacionescompra"));
            }
        }catch(SQLException ex ){
           System.out.println("no encontro"+ ex.getMessage());
           return null;
        }finally{
            BD.close(conn);
            BD.close(stmt);
            BD.close(res);
        }
        return c;
    }

    public ArrayList<Compras> listarCompra(String descripcion) throws SQLException {
        String sql = SQL_SELECT + " WHERE proveedorcompra like '" + descripcion + "%' ORDER BY proveedorcompra";
        return consultarSQL(sql);
    }

    private ArrayList<Compras> consultarSQL(String sql) {
        ArrayList<Compras> list = new ArrayList<Compras>();
        Connection conn = null;
        Statement stat = null;
        ResultSet res = null;
        try{
            Compras c;
            conn = BD.getConnection();
            stat = conn.createStatement();
            res = stat.executeQuery(sql);
            
            while(res.next()){
             c = new Compras();
             c.setIdcompra(res.getInt("idcompra"));
             c.setProveedorcompra(res.getInt("proveedorcompra"));
             c.setFechacompra(res.getDate("fechacompra"));
             c.setTotalcompra(res.getInt("totalcompra"));
             c.setObservacionescompra(res.getString("observacionescompra"));
             list.add(c);
            }
        }catch(SQLException ex ){
            System.out.println("no listo"+ ex.getMessage());
            return null;
        }finally{
            BD.close(conn);
            BD.close(stat);
            BD.close(res);
        }
        return list;
    }
   public static int ulCompras() throws SQLException {
        String sql = "SELECT MAX(idcompra)+1 FROM compras";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idcompra)+1");
        } catch (SQLException ex) {
            System.out.println("No busco ULTIMO CLIENTES: " + ex.getMessage());
            return 0;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }
   

    
    
}
