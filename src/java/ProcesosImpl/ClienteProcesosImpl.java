
package ProcesosImpl;

import Procesos.ClienteProcesos;
import DAO.ClienteDAO;
import Clase.Clientes;
import DAO.Factory.ClienteDaoFactory;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClienteProcesosImpl implements ClienteProcesos{
       
    private static ClienteProcesos clienteproceso;
    private ClienteDAO clienteDAO;
    
    public static ClienteProcesos getInstancia(){
        if (clienteproceso == null){
            clienteproceso = new ClienteProcesosImpl();
        }
        return clienteproceso;
    }    

    public void nuevoCliente(Clientes c) {
        try {
            this.clienteDAO = ClienteDaoFactory.crear();
            clienteDAO.insertarCliente(c);
        } catch (SQLException ex) {
            System.out.println("No inserta Cliente: " + ex.getMessage());
        }
            
    }

    public ArrayList<Clientes> listarCliente(String nombre) {
        ArrayList<Clientes> list = null;
        try {
            this.clienteDAO = ClienteDaoFactory.crear();
            list = clienteDAO.listarNombre(nombre);
        } catch (SQLException ex) {
            System.out.println("No lista CLIENTE: " + ex.getMessage());
            return null;
        }
        return list;
    }
    
    public Clientes buscarCliente(int id) {
        Clientes c = new Clientes();
        try {
            this.clienteDAO = ClienteDaoFactory.crear();
            c = clienteDAO.buscarCliente(id);
        } catch (SQLException ex){
            System.out.println("No busca CLIENTE: " + ex.getMessage());
            return null;
        }
        return c;
    }

    public void editarCliente(Clientes c) {
        try {
            this.clienteDAO = ClienteDaoFactory.crear();
            clienteDAO.actualizarCliente(c);
        } catch (SQLException ex) {
            System.out.println("No actualiza CLIENTE: " + ex.getMessage());
        }
    }    
}
