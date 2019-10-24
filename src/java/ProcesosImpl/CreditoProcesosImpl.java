
package ProcesosImpl;

import Procesos.CreditoProcesos;
import DAO.CreditoDAO;
import Clase.Creditos;
import DAO.Factory.ClienteDaoFactory;
import DAO.Factory.CreditoDaoFactory;
import java.sql.SQLException;
import java.util.ArrayList;

public class CreditoProcesosImpl implements CreditoProcesos {
    
    private static CreditoProcesos creditoproceso;
    private CreditoDAO creditoDAO;
    
    public static CreditoProcesos getInstancia(){
        if(creditoproceso == null){
            creditoproceso = new CreditoProcesosImpl();            
        }
        return creditoproceso;
    }

    public void nuevoCredito(Creditos d) {
        try{
            this.creditoDAO = CreditoDaoFactory.crear();
            creditoDAO.insertarCredito(d);
        } catch (SQLException ex){
            System.out.println("No inserta Credito: " + ex.getMessage());
        }
    }

    public ArrayList<Creditos> listarCredito(String nombre) {
        ArrayList<Creditos> list = null;
        try {
            this.creditoDAO = CreditoDaoFactory.crear();
            list = creditoDAO.listarNombre(nombre);
        } catch (SQLException ex) {
            System.out.println("No lista Credito: " + ex.getMessage());
            return null;
        }
        return list;
    }

    public Creditos buscarCredito(int id) {
        Creditos d = new Creditos();
        try {
            this.creditoDAO = CreditoDaoFactory.crear();
            d = creditoDAO.buscarCredito(id);
        } catch(SQLException ex) {
            System.out.println("No busca Credito: " + ex.getMessage());
            return null;
        }
        return d;
    }

    public void editarCredito(Creditos d) {
        try {
            this.creditoDAO = CreditoDaoFactory.crear();
            creditoDAO.actualizarCredito(d);
        } catch(SQLException ex){
            System.out.println("No actualiza Credito: " + ex.getMessage());
        }
    }

    public ArrayList<Creditos> listarCredito2() {
       ArrayList<Creditos> list = null;
       try {
           this.creditoDAO= CreditoDaoFactory.crear();
           list = creditoDAO.listar();
       } catch (SQLException ex){
           System.out.println("No lista Vendedor: " + ex.getMessage());
           return null;
       }
       return list;
    }         
    
}
