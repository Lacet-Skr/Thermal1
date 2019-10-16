package Procesos;

/**
 *
 * @author Luis Maya
 */
import Clase.Usuarios;
import java.util.ArrayList;

public interface UsuarioProcesos {
    
    public Usuarios usuarioExiste(Usuarios u);
    
    public void nuevoUsuarios(Usuarios u);
    
    public ArrayList<Usuarios> listarUsuarios(String usuario);
    
    public ArrayList<Usuarios> listarUsuarios2();
    
    public Usuarios buscarUsuarios(int id);
    
    public void editarUsuarios(Usuarios u);
    
}
