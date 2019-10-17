
package Datos;

import Clase.Producto;
import DAO.ProductoDAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BDProducto implements ProductoDAO{
    
    protected static String SQL_SELECT = "SELECT idproducto, costoproducto, descripcionproducto, existenciaproducto FROM productos";
    
    protected static String SQL_INSERT = "INSERT INTO productos (idproducto, costoproducto, descripcionproducto, existenciaproducto) VALUES(?,?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE productos SET costoproducto= ?, descripcionproducto= ?, existenciaproducto = ? WHERE idproducto";

    public void insertarProducto(Producto p) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
        conn = BD.getConnection();
        stmt = conn.prepareStatement(SQL_INSERT);
        
        stmt.setInt(1, p.getIdproducto());
        stmt.setString(2, p.getCostoproducto());
        stmt.setString(3, p.getDescripcionproducto());
        stmt.setString(4, p.getExistenciaproducto());
        stmt.executeUpdate();
        }catch(SQLException ex){
           System.out.println("No se inserto la Producto" + ex.getMessage());
           System.out.println(ex);
       }finally{
           BD.close(conn);
           BD.close(stmt);
       }
    }

    public void actualizarProducto(Producto p) throws SQLException {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
        conn = BD.getConnection();
        stmt = conn.prepareStatement(SQL_UPDATE);
        
        stmt.setString(1, p.getCostoproducto());
        stmt.setString(2, p.getDescripcionproducto());
        stmt.setString(3, p.getExistenciaproducto());
        stmt.setInt(4, p.getIdproducto());
        stmt.executeUpdate();
        } catch (SQLException ex){
            System.out.println("No actualiza producto: " + ex.getMessage());
        } finally {
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public Producto buscarProducto(int id) throws SQLException {
        String sql = SQL_SELECT + "WHERE idproducto"+ id;
        
        Producto p = new Producto();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try{
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if(res.next()){
            p.setIdproducto(id);
            p.setDescripcionproducto(res.getString("descripcionproducto"));
            }
        }catch (SQLException ex){
        System.out.println("No busco producto: "+ ex.getMessage());
        return null;
        }finally {
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
    return p;
    }

    public ArrayList<Producto> listarProducto(String producto) throws SQLException {
        String sql = SQL_SELECT + "WHERE descripcionproducto like '" + producto + "' ORDER BY descripcionproducto";
        return consultaSQL(sql);
    }
    
    private ArrayList<Producto> consultaSQL(String sql){
    ArrayList<Producto> list = new ArrayList<Producto>();
    Connection con = null;
    Statement stat = null;
    ResultSet res = null;
    try{
    Producto p;
    con = BD.getConnection();
    stat = con.createStatement();
    res = stat.executeQuery(sql);
    while (res.next()){
        p = new Producto();
        p.setIdproducto(res.getInt("idproducto"));
        p.setCostoproducto(res.getString("nombreproducto"));
        p.setDescripcionproducto(res.getString("descripcionproducto"));
        p.setExistenciaproducto(res.getString("existenciaproducto"));
        list.add(p);
        }
    }catch (SQLException ex){
        System.out.println("No listo producto" + ex.getMessage());
        return null;
    }finally{
        BD.close(con);
        BD.close(stat);
        BD.close(res);
    }
    return list;
}
    public static int ulProducto() throws SQLException {
    String sql = "SELECT MAX(idproducto)+1 FROM productos";
    Connection con = BD.getConnection();
    Statement stat = null;
    ResultSet res = null;
    int id;
    try{
    stat = con.createStatement();
    res = stat.executeQuery(sql);
    res.next();
    id = res.getInt("MAX(idproducto)+1");
    }catch (SQLException ex) {
            System.out.println("No busco ULTIMO PRODUCTO: " + ex.getMessage());
            return 0;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }

    public ArrayList<Producto> listarProducto2() throws SQLException {
        String sql = SQL_SELECT + "WHERE descripcionproducto like '" + "' ORDER BY descripcionproducto";
        return consultaSQL(sql);
    }

}
