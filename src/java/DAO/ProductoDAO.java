
package DAO;

import Clase.Producto;
import java.sql.SQLException;
import java.util.ArrayList;

public interface ProductoDAO {
        
    public void insertarProducto(Producto p) throws SQLException;
    
    public void actualizarProducto(Producto p) throws SQLException;
    
    public Producto buscarProducto(int id) throws SQLException;
    
    public ArrayList<Producto> listarProducto2() throws SQLException;
    
    public ArrayList<Producto> listarProducto(String descripcion) throws SQLException;
    
    public ArrayList<Producto> listarProducto3(String clave) throws SQLException;
    
    public ArrayList<Producto> listarProducto4(int sublinea) throws SQLException;
    
   
}
