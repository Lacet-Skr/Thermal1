package DAO.Factory;

import DAO.VendedorDAO;
import Datos.BDVendedor;

public class VendedorDaoFactory {
    
    public static VendedorDAO crear(){
        
        return new BDVendedor();
    }
    
}
