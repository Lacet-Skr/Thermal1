
package Datos;

import Clase.Cotizacion;
import DAO.CotizacionDAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class BDCotizacion implements CotizacionDAO{
    
    protected static String SQL_SELECT = "SELECT idcotizacion , clientecotizacion , fechacotizacion , totalcotizacion , observacionescotizacion FROM cotizaciones";
    
    protected static String SQL_INSERT = "INSERT INTO cotizaciones(idcotizacion , clientecotizacion , fechacotizacion , totalcotizacion , observacionescotizacion) VALUES (?,?,?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE cotizaciones SET clientecotizacion = ?, fechacotizacion = ?, totalcotizacion = ?, observacionescotizacion = ? WHERE idcotizacion = ?";

    public void insertarCotizacion(Cotizacion c) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setInt(1, c.getIdcotizacion());
            stmt.setString(2, c.getClientecotizacion());
            stmt.setDate(3, new java.sql.Date(c.getFechacotizacion().getTime()));
            stmt.setInt(4, c.getTotalcotizacion());
            stmt.setString(5, c.getObservacionescotizacion());
            stmt.executeUpdate();
        }catch (SQLException ex){
            System.out.println("No inserto Cotizacion: " + ex.getMessage());
            System.out.println(ex);
        } finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public void actualizarCotizacion(Cotizacion c) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
            stmt.setString(1, c.getClientecotizacion());
            stmt.setDate(2, new java.sql.Date(c.getFechacotizacion().getTime()));
            stmt.setInt(3, c.getTotalcotizacion());
            stmt.setString(4, c.getObservacionescotizacion());
            stmt.setInt(5, c.getIdcotizacion());
            stmt.executeUpdate();
        } catch(SQLException ex){
            System.out.println("No actualiza Cotizacion: " + ex.getMessage());
        } finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public Cotizacion buscarCotizacion(int id) throws SQLException {
        String sql = SQL_SELECT  + " WHERE idcotizacion=" + id;
        Cotizacion c = new Cotizacion();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try{
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if(res.next()){
                c.setIdcotizacion(id);
                c.setClientecotizacion(res.getString("clientecotizacion"));
                c.setFechacotizacion(res.getDate("fechacotizacion"));
                c.setTotalcotizacion(res.getInt("totalcotizacion"));
                c.setObservacionescotizacion(res.getString("observacionescotizacion"));
            }
        }catch(SQLException ex){
            System.out.println("No busco Cotizacion: " + ex.getMessage());
            return null;
        }finally{
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return c;
    }

    public ArrayList<Cotizacion> listarNombre(String nombre) throws SQLException {
        String sql = SQL_SELECT + " WHERE clientecotizacion like '" + nombre + "%' ORDER BY clientecotizacion";
        return consultarSQL(sql);
    }
   
    public ArrayList<Cotizacion> listar() throws SQLException {
        String sql = SQL_SELECT + " ORDER BY clientecotizacion";
        return consultarSQL(sql);
    }

    private ArrayList<Cotizacion> consultarSQL(String sql) {
        ArrayList<Cotizacion> list = new ArrayList<Cotizacion>();
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            Cotizacion c;
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            while(res.next()){
                c = new Cotizacion();
                c.setIdcotizacion(res.getInt("idcotizacion"));
                c.setClientecotizacion(res.getString("clientecotizacion"));
                c.setFechacotizacion(res.getDate("fechacotizacion"));
                c.setTotalcotizacion(res.getInt("totalcotizacion"));
                c.setObservacionescotizacion(res.getString("observacionescotizacion"));
                list.add(c);
            }
        }catch (SQLException ex){
            System.out.println("No listo Cotizacion: " + ex.getMessage());
            return null;
        } finally{
            BD.close(con);
            BD.close(stat);
            BD.close(res);                   
        }
        return list;        
    }
    public static int ulCotizacion() throws SQLException {
        String sql = "SELECT MAX(idcotizacion)+1 FROM idcotizacion";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idcotizacion)+1");            
        }catch (SQLException ex){ 
            System.out.println("No busco ULTIMO Cotizacion: " + ex.getMessage());
            return 0;
    }finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }    
    
}
