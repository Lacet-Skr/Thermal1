
package DAOFactory;
import DAO.ProductoDAO;
import Datos.BDProducto;

public class ProductoDAOFactory {
    public static ProductoDAO crear(){
    return new BDProducto();
    }    
}
