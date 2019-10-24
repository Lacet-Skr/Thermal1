
package DAO;

import Clase.Creditos;
import java.sql.SQLException;
import java.util.ArrayList;

public interface CreditoDAO {
    
    public void insertarCredito(Creditos d) throws SQLException;
    
    public void actualizarCredito(Creditos d) throws SQLException;
    
    public Creditos buscarCredito(int id) throws SQLException;
    
    public ArrayList<Creditos> listarNombre(String nombre) throws SQLException;
    
    public ArrayList<Creditos> listar() throws SQLException;
    
}