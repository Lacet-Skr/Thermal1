
package Datos;

import Clase.Clientes;
import DAO.ClienteDAO;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BDCliente implements ClienteDAO{
    
    protected static String SQL_SELECT = "SELECT idcliente, nombrecliente, rfccliente, callecliente, numextcliente, numintcliente, coloniacliente, localidadcliente, referenciacliente, municipiocliente, estadocliente, paiscliente, cpcliente, emailcliente, creditocliente, observacionescliente, tipopagocliente, bancocliente, cuatrodigitoscliente, vendedor FROM clientes";
    
    protected static String SQL_INSERT = "INSERT INTO clientes(idcliente, nombrecliente, rfccliente, callecliente, numextcliente, numintcliente, coloniacliente, localidadcliente, referenciacliente, municipiocliente, estadocliente, paiscliente, cpcliente, emailcliente, creditocliente, observacionescliente, tipopagocliente, bancocliente, cuatrodigitoscliente, vendedor) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE clientes SET nombrecliente = ?, rfccliente = ?, callecliente = ?, numextcliente = ?, numintcliente = ?, coloniacliente = ?, localidadcliente = ?, referenciacliente = ?, municipiocliente = ?, estadocliente = ?, paiscliente = ?, cpcliente = ?, emailcliente = ?, creditocliente = ?, observacionescliente = ?, tipopagocliente = ?, bancocliente = ?, cuatrodigitoscliente = ?, vendedor = ? WHERE idcliente = ?";

    public void insertarCliente(Clientes c) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setInt(1, c.getIdcliente());
            stmt.setString(2, c.getNombrecliente());
            stmt.setString(3, c.getRfccliente());
            stmt.setString(4, c.getCallecliente());
            stmt.setString(5, c.getNumextcliente());
            stmt.setString(6, c.getNumintcliente());
            stmt.setString(7, c.getColoniacliente());
            stmt.setString(8, c.getLocalidadcliente());
            stmt.setString(9, c.getReferenciacliente());
            stmt.setString(10, c.getMunicipiocliente());
            stmt.setString(11, c.getEstadocliente());
            stmt.setString(12, c.getPaiscliente());
            stmt.setString(13, c.getCpcliente());
            stmt.setString(14, c.getEmailcliente());
            stmt.setInt(15, c.getCreditocliente());
            stmt.setString(16, c.getObservacionescliente());
            stmt.setString(17, c.getTipopagocliente());
            stmt.setString(18, c.getBancocliente());
            stmt.setString(19, c.getCuatrodigitoscliente());
            stmt.setInt(20, c.getVendedor());
            stmt.executeUpdate();
        }catch (SQLException ex){
            System.out.println("No inserto el Cliente" + ex.getMessage());
            System.out.println(ex);
        }finally{
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public void actualizarCliente(Clientes c) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = BD.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
                         
            stmt.setString(1, c.getNombrecliente());
            stmt.setString(2, c.getRfccliente());
            stmt.setString(3, c.getCallecliente());
            stmt.setString(4, c.getNumextcliente());
            stmt.setString(5, c.getNumintcliente());
            stmt.setString(6, c.getColoniacliente());
            stmt.setString(7, c.getLocalidadcliente());
            stmt.setString(8, c.getReferenciacliente());
            stmt.setString(9, c.getMunicipiocliente());
            stmt.setString(10, c.getEstadocliente());
            stmt.setString(11, c.getPaiscliente());
            stmt.setString(12, c.getCpcliente());
            stmt.setString(13, c.getEmailcliente());
            stmt.setInt(14, c.getCreditocliente());
            stmt.setString(15, c.getObservacionescliente());
            stmt.setString(16, c.getTipopagocliente());
            stmt.setString(17, c.getBancocliente());
            stmt.setString(18, c.getCuatrodigitoscliente());
            stmt.setInt(19, c.getVendedor());
            stmt.setInt(20, c.getIdcliente());
            stmt.executeUpdate();
        } catch(SQLException ex){
            System.out.println("No actualiza cliente: " + ex.getMessage());
        } finally {
            BD.close(conn);
            BD.close(stmt);
        }
    }

    public Clientes buscarCliente(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idcliente=" + id;
        Clientes c = new Clientes();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try{
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if(res.next()) {
                c.setIdcliente(id);
                c.setNombrecliente(res.getString("nombrecliente"));
                c.setRfccliente(res.getString("rfccliente"));
                c.setCallecliente(res.getString("callecliente"));
                c.setNumextcliente(res.getString("numextcliente"));
                c.setNumintcliente(res.getString("numintcliente"));
                c.setColoniacliente(res.getString("coloniacliente"));
                c.setLocalidadcliente(res.getString("localidadcliente"));
                c.setReferenciacliente(res.getString("referenciacliente"));
                c.setMunicipiocliente(res.getString("municipiocliente"));
                c.setEstadocliente(res.getString("estadocliente"));
                c.setPaiscliente(res.getString("paiscliente"));
                c.setCpcliente(res.getString("cpcliente"));
                c.setEmailcliente(res.getString("emailcliente"));
                c.setCreditocliente(res.getInt("creditocliente"));
                c.setObservacionescliente(res.getString("observacionescliente"));
                c.setTipopagocliente(res.getString("tipopagocliente"));
                c.setBancocliente(res.getString("bancocliente"));
                c.setCuatrodigitoscliente(res.getString("cuatrodigitoscliente"));
                c.setVendedor(res.getInt("vendedor")); 
            }
        }catch (SQLException ex){
            System.out.println("No busco cliente: " + ex.getMessage());
            return null;
        }finally {
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return c;
    }

    public ArrayList<Clientes> listarNombre(String nombre) throws SQLException {
        String sql = SQL_SELECT + " WHERE nombrecliente like '" + nombre + "%' ORDER BY nombrecliente";
        return consultarSQL(sql);
    }

    public ArrayList<Clientes> listar() throws SQLException {
        String sql = SQL_SELECT + " ORDER BY nombrecliente";
        return consultarSQL(sql);
    }

    private ArrayList<Clientes> consultarSQL(String sql) {
        ArrayList<Clientes> list = new ArrayList<Clientes>();
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            Clientes c;
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            while (res.next()){
                c = new Clientes();
                c.setIdcliente(res.getInt("idcliente"));
                c.setNombrecliente(res.getString("nombrecliente"));
                list.add(c);
            }
        }catch(SQLException ex){
            System.out.println("No listo cliente: " + ex.getMessage());
            return null;
        }finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return list;
    }
    
    public static int ulCliente() throws SQLException{
        String sql = "SELECT MAX(idcliente)+1 FROM clientes";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idcliente)+1");
        }catch (SQLException ex){
            System.out.println("No busco ULTIMO CLIENTE: " + ex.getMessage());
            return 0;
        }finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }
}
