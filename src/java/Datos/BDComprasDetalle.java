/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;
import java.util.ArrayList;
import Clase.ComprasDetalle;
import DAO.ComprasDetalleDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;

public class BDComprasDetalle implements ComprasDetalleDAO{
    
    protected static String SQL_SELECT = "SELECT idcomprasdetalle, compra, producto, cantidad, precio, observaciones, proyecto, descuento  FROM comprasdetalle";
    
    protected static String SQL_INSERT = "INSERT INTO comprasdetalle(idcomprasdetalle, compra, producto, cantidad, precio, observaciones, proyecto, descuento) VALUES (?,?,?,?,?,?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE comprasdetalle SET compra = ?, producto= ?, cantidad = ?, precio = ?, observaciones = ?, proyecto = ?, descuento = ? WHERE idcomprasdetalle = ?";

    public void insertarComprasDetalle(ComprasDetalle cd) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setInt(1, cd.getIdcomprasdetalle());
            stmt.setInt(2, cd.getCompra());
            stmt.setInt(3, cd.getProducto());
            stmt.setInt(4, cd.getCantidad());
            stmt.setDouble(5, cd.getPrecio());
            stmt.setString(6, cd.getObservaciones());
            stmt.setString(7, cd.getProyecto());
            stmt.setInt(8, cd.getDescuento());
            stmt.executeUpdate();
        }catch(SQLException ex){
            System.out.println("no inserto"+ ex.getMessage());
        }finally{
            BD.close(conn);
            BD.close(stmt);
        }
        
    }

    public void actualizarComprasDetalle(ComprasDetalle cd) throws SQLException {
         Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            stmt.setInt(1, cd.getCompra());
            stmt.setInt(2, cd.getProducto());
            stmt.setInt(3, cd.getCantidad());
            stmt.setDouble(4, cd.getPrecio());
            stmt.setString(5, cd.getObservaciones());
            stmt.setString(6, cd.getProyecto());
            stmt.setInt(7, cd.getDescuento());
            stmt.setInt(8, cd.getIdcomprasdetalle());
            stmt.executeUpdate();
        }catch(SQLException ex){
            System.out.println("no actualiza"+ ex.getMessage());
        }finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public ComprasDetalle buscarComprasDetalle(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idcomprasdetalle="+ id;
        ComprasDetalle cd = new ComprasDetalle();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
        try{
            conn = BD.getConnection();
            stmt = conn.prepareStatement(sql);
            res = stmt.executeQuery();
            if(res.next()){
             cd.setIdcomprasdetalle(id);
             cd.setCompra(res.getInt("compras"));
             cd.setProducto(res.getInt("producto"));
             cd.setCantidad(res.getInt("cantidad"));
             cd.setPrecio(res.getDouble("precio"));
             cd.setObservaciones(res.getString("observaciones"));
             cd.setProyecto(res.getString("proyecto"));
             cd.setDescuento(res.getInt("descuento"));
            }
        }catch(SQLException ex ){
            System.out.println("no busco"+ ex.getMessage());
            return null;
        }finally{
            BD.close(conn);
            BD.close(stmt);
            BD.close(res);
        }
        return cd;
    }

    public ArrayList<ComprasDetalle> listarComprasDetalle(String descripcion) throws SQLException {
        String sql = SQL_SELECT + " WHERE compra like'"+descripcion+"%' ORDER BY compra";
        return consultarSQL(sql);
    }

    private ArrayList<ComprasDetalle> consultarSQL(String sql) {
       ArrayList<ComprasDetalle> list = new ArrayList<ComprasDetalle>();
       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       try{
           ComprasDetalle cd;
           conn = BD.getConnection();
           stat = conn.createStatement();
           res = stat.executeQuery(sql);
           while(res.next()){
             cd = new ComprasDetalle();
             cd.setIdcomprasdetalle(res.getInt("idcomprasdetalle"));
             cd.setCompra(res.getInt("compras"));
             cd.setProducto(res.getInt("producto"));
             cd.setCantidad(res.getInt("cantidad"));
             cd.setPrecio(res.getDouble("precio"));
             cd.setObservaciones(res.getString("observaciones"));
             cd.setProyecto(res.getString("proyecto"));
             cd.setDescuento(res.getInt("descuento"));
             list.add(cd);
           }
       }catch(SQLException ex){
           System.out.println("no listo"+ ex.getMessage());
           return null;
       }finally{
           BD.close(conn);
           BD.close(stat);
           BD.close(res);
       }
       return list;
    }
    public static int ulComprasDetalle() throws SQLException{
        String sql = "SELECT MAX(idcomprasdetalle)+1 FROM comprasdetalle";
        Connection conn = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try{
            stat = conn.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idcomprasdetalle)+1");
        }catch(SQLException ex){
            System.out.println("no consulto"+ ex.getMessage());
            return 0;
        }finally{
            BD.close(conn);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }
}
