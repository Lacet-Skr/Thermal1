
package DAO;

import Clase.Vendedores;
import java.sql.SQLException;
import java.util.ArrayList;

public interface VendedorDAO {
    
    public void insertarVendedor(Vendedores v) throws SQLException;
    
    public void actualizarVendedor(Vendedores v) throws SQLException;
    
    public Vendedores buscarVendedor(int id) throws SQLException;
    
    public ArrayList<Vendedores> listarNombre(String nombre) throws SQLException;
    
    public ArrayList<Vendedores> listar() throws SQLException;
    
}