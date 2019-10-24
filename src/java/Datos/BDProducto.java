
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
    
        
    protected static String SQL_SELECT = "SELECT idproducto, costoproducto, descripcionproducto, linea, sublinea FROM productos";
    
    protected static String SQL_INSERT = "INSERT INTO productos (idproducto, costoproducto, descripcionproducto, linea, sublinea) VALUES (?,?,?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE productos SET costoproducto = ?, descripcionproducto = ?, linea = ?, sublinea = ? WHERE idproducto = ?";

    public void insertarProducto(Producto p) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt= null;
        try{
        conn = BD.getConnection();
        stmt = conn.prepareStatement(SQL_INSERT);
        
        stmt.setInt(1, p.getIdproducto());
        stmt.setString(2, p.getCostoproducto());
        stmt.setString(3, p.getDescripcionproducto());
        stmt.setInt(4, p.getLinea());
        stmt.setInt(5, p.getSublinea());
        stmt.executeUpdate();
        } catch (SQLException ex){
        System.out.println("No se inserto el producto"+ ex.getMessage());
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
        stmt.setInt(3, p.getLinea());
        stmt.setInt(4, p.getSublinea());
        stmt.setInt(5, p.getIdproducto());
        System.out.println("Ejecutando: SQL_UPDATE con id: "+ p.getIdproducto());
        stmt.executeUpdate();
    }catch(SQLException ex){
        System.out.println("No actualiza producto:"+ ex.getMessage());
    }finally{
        BD.close(conn);
        BD.close(stmt);
    }
    }

    public Producto buscarProducto(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idproducto=" + id;
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
        p.setCostoproducto(res.getString("costoproducto"));
        p.setDescripcionproducto(res.getString("descripcionproducto"));
        p.setLinea(res.getInt("linea"));
        p.setSublinea(res.getInt("sublinea"));
        }
        }catch(SQLException ex){
        System.out.println("No busco producto: "+ ex.getMessage());
        return null;
        }finally{
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return p;
    }

    public ArrayList<Producto> listarProducto2() throws SQLException {
        String sql = SQL_SELECT + " ORDER BY descripcionproducto";
        return consultaSQL(sql);
    }
        private ArrayList<Producto> consultaSQL (String sql){
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
        p.setCostoproducto(res.getString("costoproducto"));
        p.setDescripcionproducto(res.getString("descripcionproducto"));
        p.setLinea(res.getInt("linea"));
        p.setSublinea(res.getInt("sublinea"));
        list.add(p);
        }
    }catch (SQLException ex){
    System.out.println("No listo linea"+ ex.getMessage());
    return null;
    }finally{
        BD.close(con);
        BD.close(stat);
        BD.close(res);
    }
    return list;
    }

    public ArrayList<Producto> listarProducto(String descripcion) throws SQLException {
        String sql = SQL_SELECT + " WHERE descripcionproducto like '"+ descripcion + "%' ORDER BY descripcionproducto";
        return consultaSQL(sql);
    }
    
        public static int ulProducto() throws SQLException{
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
    }catch (SQLException ex){
        System.out.println("No busco ULTIMO producto: " + ex.getMessage());
        return 0;
    }finally{
        BD.close(con);
        BD.close(stat);
        BD.close(res);
    }
    return id;
    }

    
}
