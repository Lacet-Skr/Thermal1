package DAO.Factory;

import DAO.CreditoDAO;
import Datos.BDCredito;

public class CreditoDaoFactory {
    
    public static CreditoDAO crear(){
        
        return new BDCredito();
    }
    
}
