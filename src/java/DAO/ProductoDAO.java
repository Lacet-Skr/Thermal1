
package DAO;

import Clase.Producto;
import java.sql.SQLException;
import java.util.ArrayList;

public interface ProductoDAO {
    
    public void insertarProducto (Producto p) throws SQLException;
    
    public void actualizarProducto (Producto p) throws SQLException;
    
    public Producto buscarProducto (int id) throws SQLException;;
    
    public ArrayList<Producto>listarProducto(String producto)throws SQLException;
    
    public ArrayList<Producto>listarProducto2()throws SQLException;
    
}
