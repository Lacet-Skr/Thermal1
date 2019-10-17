
package Procesos;

import Clase.Producto;
import java.util.ArrayList;

public interface ProductoProcesos {
    
    public void nuevoProducto(Producto p);
    
    public ArrayList<Producto> listarProducto(String producto);
    
    public Producto buscarProducto(int id);
    
    public void editarProducto (Producto p);
    
    public ArrayList<Producto> listarProducto2();
}
