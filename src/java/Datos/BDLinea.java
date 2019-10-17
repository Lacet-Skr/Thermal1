
package Datos;
import Clase.Linea;
import DAO.LineaDAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BDLinea implements LineaDAO{
    
    protected static String SQL_SELECT = "SELECT idlinea, clavelinea, descripcionlinea FROM lineas";
    
    protected static String SQL_INSERT = "INSERT INTO lineas (idlinea, clavelinea, descripcionlinea) VALUES (?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE lineas SET clavelinea = ?, descripcionlinea = ? WHERE idlinea = ?";

    public void insertarLinea(Linea l) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt= null;
        try{
        conn = BD.getConnection();
        stmt = conn.prepareStatement(SQL_INSERT);
        
        stmt.setInt(1, l.getIdlinea());
        stmt.setInt(2, l.getClavelinea());
        stmt.setString(3, l.getDescripcionlinea());
        stmt.executeUpdate();
        } catch (SQLException ex){
        System.out.println("No se inserto el linea"+ ex.getMessage());
        System.out.println(ex);
        }finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public void actualizarLinea(Linea l) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
    try{
        conn = BD.getConnection();
        stmt = conn.prepareStatement(SQL_UPDATE);    
        
        stmt.setInt(1, l.getClavelinea());
        stmt.setString(2, l.getDescripcionlinea());
    }catch(SQLException ex){
        System.out.println("No actualiza linea:"+ ex.getMessage());
    }finally{
        BD.close(conn);
        BD.close(stmt);
    }
    }

    public Linea buscarLinea(int id) throws SQLException {
                String sql = SQL_SELECT + " WHERE idlineas=" + id;
        Linea l = new Linea();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try{
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
        if(res.next()){
        l.getIdlinea();
        l.setDescripcionlinea(res.getString("descripcionlinea"));
        }
        }catch(SQLException ex){
        System.out.println("No busco linea: "+ ex.getMessage());
        return null;
        }finally{
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return l;
    }

    public ArrayList<Linea> listarLinea(String linea) throws SQLException {
        String sql = SQL_SELECT + " WHERE descripcionlinea like '"+ linea + "%' ORDER BY descripcionlinea";
        return consultaSQL(sql);
    }

    public ArrayList<Linea> listarlinea2() throws SQLException {
        String sql = SQL_SELECT + " ORDER BY descripcionlinea";
        return consultaSQL(sql);
    }
    
    private ArrayList<Linea> consultaSQL (String sql){
    ArrayList<Linea> list = new ArrayList<Linea>();
    Connection con = null;
    Statement stat = null;
    ResultSet res = null;
    try{
    Linea l;
        con = BD.getConnection();
        stat = con.createStatement();
        res = stat.executeQuery(sql);    
        while (res.next()){
        l = new Linea();
        l.setIdlinea(res.getInt("idlinea"));
        l.setClavelinea(res.getInt("clavelinea"));
        l.setDescripcionlinea(res.getString("descripcionlinea"));
        list.add(l);
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
        public static int ulLinea() throws SQLException{
    String sql = "SELECT MAX(idlinea)+1 FROM lineas";
    Connection con = BD.getConnection();
    Statement stat = null;
    ResultSet res = null;
    int id;
    try{
        stat = con.createStatement();
        res = stat.executeQuery(sql);
        res.next();
        id = res.getInt("MAX(idlinea)+1");
    }catch (SQLException ex){
        System.out.println("No busco ULTIMO linea: " + ex.getMessage());
        return 0;
    }finally{
        BD.close(con);
        BD.close(stat);
        BD.close(res);
    }
    return id;
    }
}

    

