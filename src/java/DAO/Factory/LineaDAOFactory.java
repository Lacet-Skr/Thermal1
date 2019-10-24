
package DAO.Factory;

import Datos.BDLinea;
import DAO.LineaDAO;

public class LineaDAOFactory {
    public static LineaDAO crear(){
     return new BDLinea();
 }
}
