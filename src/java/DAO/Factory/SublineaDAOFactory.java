
package DAOFactory;
import DAO.SublineaDAO;
import Datos.BDSublinea;

public class SublineaDAOFactory {
    
    public static SublineaDAO crear(){
        return new BDSublinea();
    }
}
