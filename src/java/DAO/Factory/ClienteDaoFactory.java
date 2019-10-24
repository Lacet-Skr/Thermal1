package DAO.Factory;

import DAO.ClienteDAO;
import Datos.BDCliente;

public class ClienteDaoFactory {
    
    public static ClienteDAO crear(){
        
        return new BDCliente();
    }
}
