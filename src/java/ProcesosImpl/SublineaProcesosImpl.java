
package ProcesosImpl;

import Procesos.SublineaProcesos;
import DAO.SublineaDAO;
import Clase.Sublinea;
import DAOFactory.SublineaDAOFactory;
import java.sql.SQLException;
import java.util.ArrayList;

public class SublineaProcesosImpl implements SublineaProcesos{

    private static SublineaProcesos subproceso;
    private SublineaDAO subDAO;
    
               public static SublineaProcesos getInstancia(){
        if (subproceso == null){
            subproceso = new SublineaProcesosImpl();
        }
        return subproceso;
    }
    public void nuevoSublinea(Sublinea s) {
        try{
        this.subDAO = SublineaDAOFactory.crear();
        subDAO.insertarSublinea(s);
        }catch(SQLException ex){
            System.out.println("No inserto sublinea"+ ex.getMessage());
        }

    }
    public ArrayList<Sublinea> listarSublinea(String descripcion) {
        ArrayList<Sublinea> list = null;
        try{
            this.subDAO = SublineaDAOFactory.crear();
            list = subDAO.listarSublinea(descripcion);
        }catch (SQLException ex){
            System.out.println("No listo sublinea:"+ ex.getMessage());
            return null;
        }
        return list;
    }

    public Sublinea buscarSublinea(int id) {
        Sublinea s = new Sublinea();
        try{
            this.subDAO = SublineaDAOFactory.crear();
            s = subDAO.buscarSublinea(id);
        }catch (SQLException ex){
        return null;
        }
        return s;
    }

    public void editarSublinea(Sublinea s) {
        try{
        this.subDAO = SublineaDAOFactory.crear();
        subDAO.actualizarSublinea(s);
        }catch (SQLException ex){
        System.out.println("No actualiza sublinea: "+ ex.getMessage());
        }
    }

    public ArrayList<Sublinea> listarSublinea2() {
        ArrayList<Sublinea> list = null;
        try{
            this.subDAO = SublineaDAOFactory.crear();
            list = subDAO.listarSublinea2();
        }catch (SQLException ex){
            System.out.println("No actualiza Sublinea: "+ ex.getMessage());
            return null;
        }
        return list;
        }

    public ArrayList<Sublinea> listarSublineas3(int linea) {
                ArrayList<Sublinea> list = null;
        try{
            this.subDAO = SublineaDAOFactory.crear();
            list = subDAO.listarSublinea3(linea);
        }catch (SQLException ex){
            System.out.println("No actualiza Sublinea: "+ ex.getMessage());
            return null;
        }
        return list;
    }
}