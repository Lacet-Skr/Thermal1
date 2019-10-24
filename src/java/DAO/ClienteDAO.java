
package DAO;
import Clase.Clientes;
import java.sql.SQLException;
import java.util.ArrayList;

public interface ClienteDAO {
    
    public void insertarCliente(Clientes c) throws SQLException;
    
    public void actualizarCliente(Clientes c) throws SQLException;
    
    public Clientes buscarCliente(int id) throws SQLException;
    
    public ArrayList<Clientes> listarNombre(String nombre) throws SQLException;
    
    public ArrayList<Clientes> listar() throws SQLException;
    
}
