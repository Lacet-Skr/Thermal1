package DAO.Factory;

import DAO.CotizacionDAO;
import Datos.BDCotizacion;

public class CotizacionDaoFactory {
    
    public static CotizacionDAO crear(){
        
        return new BDCotizacion();
    }
}
