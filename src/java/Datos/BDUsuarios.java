package Datos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import Clase.Usuarios;
import DAO.UsuarioDAO;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Luis Maya
 */
public class BDUsuarios implements UsuarioDAO {

    protected static String SQL_SELECT = "SELECT idusuario,usuario,password FROM usuarios ";
    
    protected static String SQL_INSERT = "INSERT INTO usuarios(idusuario, usuario, password) VALUES (?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE usuarios SET usuario = ?, password = ? WHERE idusuario = ?";

    public Usuarios login(Usuarios u) throws SQLException {
        return realizarBusqueda(null, SQL_SELECT + " where usuario = '" + u.getUsuario() + "' AND password ='" + u.getPassword() + "'");
    }

    private Usuarios realizarBusqueda(Usuarios u, String sql) throws SQLException {
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            if (res.next()) {
                if (u == null) {
                    u = new Usuarios() {
                    };
                }
                u.setIdusuario1(Integer.parseInt(res.getString("idusuario")));
                u.setUsuario(res.getString("usuario"));
                u.setPassword(res.getString("password"));
            }
        }catch (SQLException ex) {
            System.out.println("No busco Usuario: " + ex.getMessage());
            return null;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return u;
    }

    public void insertarUsuarios(Usuarios u) throws SQLException {
       Connection conn = null;
       PreparedStatement stmt = null;
       try{
           conn = BD.getConnection();//Viene de la clase BD que esta dentro de este mismo paquete por ello no se debe importar
           stmt =conn.prepareStatement(SQL_INSERT);
           
           stmt.setInt(1, u.getIdusuario1());
           stmt.setString(2, u.getUsuario());
           stmt.setString(3, u.getPassword());
           System.out.println("Executing " + SQL_INSERT);
           stmt.executeUpdate();
       }catch(SQLException ex){
           System.out.println("No se inserto el Usuario" + ex.getMessage());
           System.out.println(ex);
       }finally{
           BD.close(conn);
           BD.close(stmt);
       }
    }

    public void actualizarUsuarios(Usuarios u) throws SQLException {
        Connection conn = null;
       PreparedStatement stmt = null;
       try{
           conn = BD.getConnection();//Viene de la clase BD que esta dentro de este mismo paquete por ello no se debe importar
           stmt =conn.prepareStatement(SQL_UPDATE);
           
           stmt.setString(1, u.getUsuario());
           stmt.setString(2, u.getPassword());
           stmt.setInt(3, u.getIdusuario1());
           System.out.println("Ejecutando: SQL_UPDATE con id: "+ u.getIdusuario1());
           stmt.executeUpdate();
       } catch (SQLException ex) {
            System.err.println("No actualiza el Usuario: " + ex.getMessage());
        } finally {
            BD.close(conn);
            BD.close(stmt);
        }
    }
    
    public Usuarios buscarUsuarios(int id) throws SQLException {
        String sql = SQL_SELECT + " WHERE idusuario=" + id;
        Usuarios u = new Usuarios();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        try{
            con = BD.getConnection();
            ps = con.prepareStatement(sql);
            res = ps.executeQuery();
            if(res.next()){
                u.setIdusuario1(id);
                u.setUsuario(res.getString("usuario"));
                u.setPassword(res.getString("password"));
            }
        }catch (SQLException ex) {
            System.out.println("No busco Usuario: " + ex.getMessage());
            return null;
        } finally {
            BD.close(con);
            BD.close(ps);
            BD.close(res);
        }
        return u;
    }
    
    public ArrayList<Usuarios> listarusuario(String usuario) throws SQLException {
        String sql = SQL_SELECT + " ORDER BY usuario";
        return consultarSQL(sql);
    }

    private ArrayList<Usuarios> consultarSQL(String sql) throws SQLException {
        ArrayList<Usuarios> list = new ArrayList<Usuarios>();
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        try {
            Usuarios u;
            con = BD.getConnection();
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            while (res.next()) {
                u = new Usuarios();
                u.setIdusuario1(res.getInt("idusuario"));
                u.setUsuario(res.getString("usuario"));
                u.setPassword(res.getString("password"));
                list.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("No listo al Usuarios: " + ex.getMessage());
            return null;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return list;
    }
    
    public static int ulTrabajadores() throws SQLException {
        String sql = "SELECT MAX(idusuario)+1 FROM usuarios";
        Connection con = BD.getConnection();
        Statement stat = null;
        ResultSet res = null;
        int id;
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
            res.next();
            id = res.getInt("MAX(idusuario)+1");
        } catch (SQLException ex) {
            System.out.println("No busco el ULTIMO Usuario: " + ex.getMessage());
            return 0;
        } finally {
            BD.close(con);
            BD.close(stat);
            BD.close(res);
        }
        return id;
    }
    
    public ArrayList<Usuarios> listar() throws SQLException {
        String sql = SQL_SELECT + " ORDER BY usuario";
        return consultarSQL(sql);
    }
}
