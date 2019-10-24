package Procesos;

import Clase.Clientes;
import java.util.ArrayList;

public interface ClienteProcesos {
    
    public void nuevoCliente(Clientes c);
    
    public ArrayList<Clientes> listarCliente(String nombre);
    
    public Clientes buscarCliente(int id);
    
    public void editarCliente(Clientes c);
    
}
