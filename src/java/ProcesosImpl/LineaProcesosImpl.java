
package ProcesosImpl;

import Procesos.LineaProcesos;
import DAO.LineaDAO;
import Clase.Linea;
import DAOFactory.LineaDAOFactory;
import java.sql.SQLException;
import java.util.ArrayList;

public class LineaProcesosImpl implements LineaProcesos {
        
    private static LineaProcesos lineaproceso;
    private LineaDAO lineaDAO;
    
    public static LineaProcesos getInstancia(){
            if(lineaproceso == null){
            lineaproceso = new LineaProcesosImpl();
        }
        return lineaproceso;
    }

    public void nuevoLinea(Linea l) {
        try{
            this.lineaDAO = LineaDAOFactory.crear();
            lineaDAO.insertarLinea(l);
        }catch(SQLException ex){
        System.out.println("No inserto linea: "+ ex.getMessage());
        }
    }

    public ArrayList<Linea> listarLinea(String descripcion) {
                ArrayList<Linea> list = null;
        try{
            this.lineaDAO = LineaDAOFactory.crear();
            list = lineaDAO.listarLinea(descripcion);
        } catch (SQLException ex){
            System.out.println("No listo linea: "+ ex.getMessage());
            return null;
        }
        return list;
    }

    public Linea buscarLinea(int id) {
        Linea l = new Linea();
        try{
        this.lineaDAO = LineaDAOFactory.crear();
            l = lineaDAO.buscarLinea(id);
        }catch (SQLException ex){
        return null;
        }
        return l;
    }

    public void editarLinea(Linea l) {
       try{
       this.lineaDAO = LineaDAOFactory.crear();
            lineaDAO.actualizarLinea(l);
        }catch (SQLException ex){
            System.out.println("No actualiza linea: "+ ex.getMessage());
        }
    }

    public ArrayList<Linea> listarLinea2() {
                ArrayList<Linea> list = null;
        try{
            this.lineaDAO = LineaDAOFactory.crear();
            list = lineaDAO.listarlinea2();
        } catch (SQLException ex){
            System.out.println("No listo linea: "+ ex.getMessage());
            return null;
        }
        return list;
    }
}

