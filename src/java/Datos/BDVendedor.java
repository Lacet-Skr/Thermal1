
package Datos;

import Clase.Vendedores;
import DAO.VendedorDAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BDVendedor implements VendedorDAO {
    
    protected static String SQL_SELECT = "SELECT idvendedor, nombrevendedor FROM vendedores";
    
    protected static String SQL_INSERT = "INSERT INTO vendedores(idvendedor, nombrevendedor) VALUES(?,?)";
    
    protected static String SQL_UPDATE = "UPDATE vendedores SET nombrevendedor = ? WHERE idvendedor = ?";

    public void insertarVendedor(Vendedores v) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setInt(1, v.getIdvendedor());
            stmt.setString(2, v.getNombrevendedor());
            stmt.executeUpdate();
        }catch (SQLException ex) {
            System.out.println("No inserto el Vendedor" + ex.getMessage());
            System.out.println(ex);
        }finally {
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public void actualizarVendedor(Vendedores v) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
                                    
            stmt.setString(1, v.getNombrevendedor());
            stmt.setInt(2, v.getIdvendedor());
            stmt.executeUpdate();
        } catch (SQLException ex){
            System.out.println("No actualiza Vendedor: " + ex.getMessage());
        } finally {
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public Vendedores buscarVendedor(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idvendedor=" + id;
        Vendedores v = new Vendedores();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try {
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if(res.next()){
                v.setIdvendedor(id);
                v.setNombrevendedor(res.getString("nombrevendedor"));                
            }
        }catch (SQLException ex) {
            System.out.println("No busco vendedor: " + ex.getMessage());
            return null;
        }finally {
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return v;
    }

    public ArrayList<Vendedores> listarNombre(String nombre) throws SQLException {
        String sql = SQL_SELECT + " WHERE nombrevendedor like '" + nombre + "%' ORDER BY nombrevendedor";
        return consultarSQL(sql);
    }
    
    public ArrayList<Vendedores> listar() throws SQLException {
        String sql = SQL_SELECT + " ORDER BY nombrevendedor";
        return consultarSQL(sql);
    }

    private ArrayList<Vendedores> consultarSQL(String sql) {
        ArrayList<Vendedores> list = new ArrayList<Vendedores>();
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            Vendedores v;
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            while (res.next()){
                v = new Vendedores();
                v.setIdvendedor(res.getInt("idvendedor"));
                v.setNombrevendedor(res.getString("nombrevendedor"));
                list.add(v);
            }
        }catch(SQLException ex){
            System.out.println("No listo vendedor: " + ex.getMessage());
            return null;
        }finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return list;
    }
    
    public static int ulVendedor() throws SQLException{
        String sql = "SELECT MAX(idvendedor)+1 FROM vendedores";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idvendedor)+1");
        }catch (SQLException ex){
            System.out.println("No busco ULTIMO VENDEDOR: " + ex.getMessage());
            return 0;
        }finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }
    
}
