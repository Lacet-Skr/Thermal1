
package DAO;

import Clase.Linea;
import java.sql.SQLException;
import java.util.ArrayList;

public interface LineaDAO {
    
    public void insertarLinea(Linea p) throws SQLException;
    
    public void actualizarLinea(Linea p) throws SQLException;
    
    public Linea buscarLinea(int id) throws SQLException;
    
    public ArrayList<Linea> listarLinea2() throws SQLException;
    
    public ArrayList<Linea> listarLinea(String descripcion) throws SQLException;
    
    
    
}
