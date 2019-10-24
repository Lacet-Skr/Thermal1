package ProcesosImpl;

import Procesos.CotizacionProcesos;
import DAO.CotizacionDAO;
import Clase.Cotizacion;
import DAO.Factory.CotizacionDaoFactory;
import java.sql.SQLException;
import java.util.ArrayList;

public class CotizacionProcesosImpl implements CotizacionProcesos{
    
    private static CotizacionProcesos cotizacionproceso;
    private CotizacionDAO cotizacionDAO;

    public static CotizacionProcesos getInstancia(){
        if(cotizacionproceso == null){
            cotizacionproceso = new CotizacionProcesosImpl();
        }
        return cotizacionproceso;
    }

    public void nuevoCotizacion(Cotizacion c) {
        try{
            this.cotizacionDAO = CotizacionDaoFactory.crear();
            cotizacionDAO.insertarCotizacion(c);
        } catch(SQLException ex){
            System.out.println("No inserta Cotizacion: " + ex.getMessage());
        }
    }

    public ArrayList<Cotizacion> listarCotizacion(String nombre) {
        ArrayList<Cotizacion> list = null;
        try{
            this.cotizacionDAO = CotizacionDaoFactory.crear();
            list = cotizacionDAO.listarNombre(nombre);
        } catch (SQLException ex){
            System.out.println("No lista Cotizacion: " + ex.getMessage());
            return null;
        }
        return list;
    }

    public ArrayList<Cotizacion> listarCotizacion1() {
        ArrayList<Cotizacion> list = null;
        try{
            this.cotizacionDAO = CotizacionDaoFactory.crear();
            list = cotizacionDAO.listar();
        } catch (SQLException ex){
            System.out.println("No lista Cotizacion: " + ex.getMessage());
            return null;
        }
        return list;
    }

    public Cotizacion buscarCotizacion(int id) {
        Cotizacion c = new Cotizacion();
        try {
            this.cotizacionDAO = CotizacionDaoFactory.crear();
            c = cotizacionDAO.buscarCotizacion(id);
        } catch (SQLException ex){
            System.out.println("No busca Cotizacion: " + ex.getMessage());
            return null;
        }
        return c;
    }

    public void editarCotizacion(Cotizacion c) {
        try {
            this.cotizacionDAO = CotizacionDaoFactory.crear();
            cotizacionDAO.actualizarCotizacion(c);
        } catch(SQLException ex){
            System.out.println("No actualiza Cotizacion: " + ex.getMessage());
        }
    }
    
}
