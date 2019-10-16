package ProcesosImpl;

/**
 *
 * @author Luis Maya
 */

import Procesos.UsuarioProcesos;
import DAO.UsuarioDAO;
import Clase.Usuarios;
import DAO.Factory.UsuarioDaoFactory;
import java.sql.SQLException;
import java.util.ArrayList;


public class UsuarioProcesosImpl implements UsuarioProcesos{
    
    private static UsuarioProcesos usuarioproceso;
    private UsuarioDAO usuarioDao;
    
    public static UsuarioProcesos getInstancia(){
        if(usuarioproceso == null){
            usuarioproceso = new UsuarioProcesosImpl(); 
        }
        return usuarioproceso;
    }
    
    public Usuarios usuarioExiste(Usuarios usuario){
        Usuarios usu;
        try{
            this.usuarioDao = UsuarioDaoFactory.crear();
            usu = usuarioDao.login(usuario);
        }catch(SQLException ex){
            System.out.println("no busca usuarios: "+ex.getMessage());
            return null;
        }
        return usu;
    }

    public void nuevoUsuarios(Usuarios u) {
        try {
            this.usuarioDao = UsuarioDaoFactory.crear();
            usuarioDao.insertarUsuarios(u);
        } catch (SQLException ex) {
            System.out.println("No inserta el usuarios: " + ex.getMessage());
        }
    }

    public ArrayList<Usuarios> listarUsuarios(String usuario) {
        ArrayList<Usuarios> list = null;
        try {
            this.usuarioDao = UsuarioDaoFactory.crear();
            list = usuarioDao.listarusuario(usuario);
        } catch (SQLException ex) {
            System.out.println("No Lista el usuarios: " + ex.getMessage());
            return null;
        }
        return list;
    }

    public ArrayList<Usuarios> listarUsuarios2() {
        ArrayList<Usuarios> list = null;
        try {
            this.usuarioDao = UsuarioDaoFactory.crear();
            list = usuarioDao.listar();
        } catch (SQLException ex) {
            System.out.println("No Lista el usuarios: " + ex.getMessage());
            return null;
        }
        return list;
    }

    public Usuarios buscarUsuarios(int id) {
        Usuarios u = new Usuarios();
        try {
            this.usuarioDao = UsuarioDaoFactory.crear();
            u = usuarioDao.buscarUsuarios(id);
        } catch (SQLException ex) {
            System.out.println("No Busca el usuarios: " + ex.getMessage());
            return null;
        }
        return u;
    }

    public void editarUsuarios(Usuarios u) {
        try {
            this.usuarioDao = UsuarioDaoFactory.crear();
            usuarioDao.actualizarUsuarios(u);
        } catch (SQLException ex) {
            System.out.println("No actualiza el usuarios: " + ex.getMessage());
        }
    }
    
    
}
