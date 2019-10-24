
package DAO.Factory;

import Datos.BDProducto;
import DAO.ProductoDAO;

public class ProductoDAOFactory {
    public static ProductoDAO crear(){
     return new BDProducto();
 }
}
