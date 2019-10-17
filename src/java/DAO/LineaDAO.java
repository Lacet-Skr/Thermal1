
package DAO;

import Clase.Linea;
import java.sql.SQLException;
import java.util.ArrayList;

public interface LineaDAO {
        
    public void insertarLinea(Linea l)throws SQLException;
    
    public void actualizarLinea(Linea l)throws SQLException;
    
    public Linea buscarLinea(int id) throws SQLException;
    
    public ArrayList<Linea> listarLinea(String linea)throws SQLException;
    
    public ArrayList<Linea> listarlinea2() throws SQLException;
}
