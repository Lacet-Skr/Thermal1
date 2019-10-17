
package DAO;


import Clase.Sublinea;
import java.sql.SQLException;
import java.util.ArrayList;

public interface SublineaDAO {
    
public void insertarSublinea(Sublinea s) throws SQLException;

public void actualizarSublinea(Sublinea s)throws SQLException;

public Sublinea buscarSublinea(int id)throws SQLException;

public ArrayList<Sublinea>listarSublinea(String sublinea) throws SQLException;

public ArrayList<Sublinea>listarSublinea2() throws SQLException;

public ArrayList<Sublinea>listarSublinea3(int linea) throws SQLException;

}
