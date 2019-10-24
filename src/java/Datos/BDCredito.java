
package Datos;

import Clase.Creditos;
import DAO.CreditoDAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BDCredito implements CreditoDAO {
    
    protected static String SQL_SELECT = "SELECT idcredito, descripcioncredito, diascredito FROM creditos";
    
    protected static String SQL_INSERT = "INSERT INTO creditos(idcredito, descripcioncredito, diascredito) VALUES (?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE creditos SET descripcioncredito = ?, diascredito = ? WHERE idcredito = ? ";

    public void insertarCredito(Creditos d) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setInt(1, d.getIdcredito());
            stmt.setString(2, d.getDescripcioncredito());
            stmt.setInt(3, d.getDiascredito());
            stmt.executeUpdate();
        } catch (SQLException ex){
            System.out.println("No inserto Credito" + ex.getMessage());
            System.out.println(ex);
        } finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }
    
    public void actualizarCredito(Creditos d) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            stmt.setString(1, d.getDescripcioncredito());
            stmt.setInt(2, d.getDiascredito());
            stmt.setInt(3, d.getIdcredito()); 
            stmt.executeUpdate();
        } catch(SQLException ex){
            System.out.println("No actualiza Credito: " + ex.getMessage());
        } finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public Creditos buscarCredito(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idcredito=" + id;
        Creditos d = new Creditos();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try {
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if(res.next()){
                d.setIdcredito(id);
                d.setDescripcioncredito(res.getString("descripcioncredito"));
                d.setDiascredito(res.getInt("diascredito"));
            }
        } catch (SQLException ex){
            System.out.println("No busco credito: " + ex.getMessage());
            return null;
        } finally {
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return d;
    }

    public ArrayList<Creditos> listarNombre(String nombre) throws SQLException {
        String sql = SQL_SELECT + " WHERE descripcioncredito like '" + nombre + "%' ORDER BY descripcioncredito";
        return consultarSQL(sql);
    }

    public ArrayList<Creditos> listar() throws SQLException {
        String sql = SQL_SELECT + " ORDER BY descripcioncredito";
        return consultarSQL(sql);
    }

    private ArrayList<Creditos> consultarSQL(String sql) {
        ArrayList<Creditos> list = new ArrayList<Creditos>();
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            Creditos d ;
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            while (res.next()){
                d = new Creditos();
                d.setIdcredito(res.getInt("idcredito"));
                d.setDescripcioncredito(res.getString("descripcioncredito"));
                d.setDiascredito(res.getInt("diascredito"));
                list.add(d);
            } 
        }catch (SQLException ex){
            System.out.println("No listo Credito: " + ex.getMessage());
            return null;
        } finally{
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return list;
    }
    public static int ulCredito()throws SQLException {
        String sql = "SELECT MAX(idcredito)+1 FROM idcredito";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idcredito)+1");            
        }catch (SQLException ex){ 
            System.out.println("No busco ULTIMO CREDITO: " + ex.getMessage());
            return 0;
    }finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }    
}
