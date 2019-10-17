
package DAOFactory;

import DAO.LineaDAO;
import Datos.BDLinea;

public class LineaDAOFactory {
        
    public static LineaDAO crear(){
        
    return new BDLinea();
    }
    
}

