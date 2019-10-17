
package Datos;

import Clase.Sublinea;
import DAO.SublineaDAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BDSublinea implements SublineaDAO{
    
    protected static String SQL_SELECT = "SELECT idsublinea, clavesublinea, linea, descripcionsublinea FROM sublineas";
    
    protected static String SQL_INSERT = "INSERT INTO sublineas (idsublinea, clavesublinea, linea, descripcionsublinea) VALUES (?,?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE sublineas SET clavesublinea = ?, linea = ?, descripcionsublinea = ?, WHERE idsublinea = ?";

    public void insertarSublinea(Sublinea s) throws SQLException {
                Connection conn = null;
        PreparedStatement stmt = null;
        try{
        conn = BD.getConnection();
        stmt = conn.prepareStatement(SQL_INSERT);
        
        stmt.setInt(1, s.getIdsublinea());
        stmt.setInt(2, s.getClavesublinea());
        stmt.setInt(3, s.getLinea());
        stmt.setString(4, s.getDescripcionsublinea());
        stmt.executeUpdate();
        }catch(SQLException ex){
        System.out.println("No se inserto sublinea"+ ex.getMessage());
        System.out.println(ex);
        }finally{
            BD.close(conn);
            BD.close(stmt);
        }
        
    }

    @Override
    public void actualizarSublinea(Sublinea s) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
           conn = BD.getConnection();
           stmt = conn.prepareStatement(SQL_UPDATE);
           
           stmt.setString(1, s.getDescripcionsublinea());
           stmt.setInt(2, s.getIdsublinea());
           stmt.executeUpdate();
        } catch (SQLException ex){
            System.err.println("No actualiza sublinea: " + ex.getMessage());
        } finally {
            BD.close(conn);
            BD.close(stmt);
        }
    }

    @Override
    public Sublinea buscarSublinea(int id) throws SQLException {
                String sql = SQL_SELECT + " WHERE idsublinea=" + id;
        Sublinea s = new Sublinea();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try {
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if (res.next()) {
                s.setIdsublinea(id);
                s.setDescripcionsublinea(res.getString("descripcionsublinea"));
                s.setLinea(res.getInt("linea"));
            } 
        }catch (SQLException ex) {
                    System.out.println("No busco sublinea: " + ex.getMessage());
                    return null;
                    }finally {
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return s;
    }

    public ArrayList<Sublinea> listarSublinea(String sublinea) throws SQLException {
        String sql = SQL_SELECT + " WHERE descripcionsublinea like '"+ sublinea + "%' ORDER BY descripcionsublinea";
        return consultarSQL(sql);
    }

    public ArrayList<Sublinea> listarSublinea2() throws SQLException {
        String sql = SQL_SELECT + " ORDER BY descripcionsublinea";
        return consultarSQL(sql);
    }

    public ArrayList<Sublinea> listarSublinea3(int linea) throws SQLException {
    String sql = SQL_SELECT + " WHERE linea like '" + linea + "%' ORDER BY linea";
        return consultarSQL(sql);
    }
        private ArrayList<Sublinea> consultarSQL(String sql) {
        ArrayList<Sublinea> list = new ArrayList<Sublinea>();
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            Sublinea s;
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            while (res.next()){
                s = new Sublinea();
                s.setIdsublinea(res.getInt("idsublinea"));
                s.setDescripcionsublinea(res.getString("descripcionsublinea"));
                s.setLinea(res.getInt("linea"));
                list.add(s);
            }
        } catch (SQLException ex) {
            System.out.println("No listo sublinea: " + ex.getMessage());
            return null; 
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return list;
    }
    public static int ulSublineas() throws SQLException {
        String sql = "SELECT MAX(idsublinea)+1 FROM sublineas";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idsublinea)+1");
        } catch (SQLException ex) {
            System.out.println("No busco ULTIMO sublinea: " + ex.getMessage());
            return 0;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }    
}
