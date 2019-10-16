/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProcesosImpl;

import Procesos.PermisoProcesos;
import DAO.PermisoDAO;
import Clase.Permisos;
import DAO.Factory.PermisoDaoFactory;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author LACET
 */
public class PermisoProcesosImpl implements PermisoProcesos{

    private static PermisoProcesos permisoproceso;
    private PermisoDAO permisoDAO;
    
    public static PermisoProcesos getInstancia(){
    if (permisoproceso == null){
            permisoproceso = new PermisoProcesosImpl();
        }
        return permisoproceso;  
    }
    
    public void nuevoPermisos(Permisos p) {
       try {
            this.permisoDAO = PermisoDaoFactory.crear();
            permisoDAO.insertarPermisos(p);
        } catch (SQLException ex) {
            System.out.println("No inserta el PERMISO: " + ex.getMessage());
        }
    }

    public ArrayList<Permisos> listarPermisos2() {
         ArrayList<Permisos> list = null;
        try {
            this.permisoDAO = PermisoDaoFactory.crear();
            list = permisoDAO.listar();
        } catch (SQLException ex) {
            System.out.println("No Lista el PERMISO: " + ex.getMessage());
            return null;
        }
        return list;
    }

    
    public Permisos buscarPermisos(int id) {
        Permisos p = new Permisos();
        try {
            this.permisoDAO = PermisoDaoFactory.crear();
            p = permisoDAO.buscarPermisos(id);
        } catch (SQLException ex) {
            System.out.println("No Busca el PERMISO: " + ex.getMessage());
            return null;
        }
        return p;
    }
    
    public void borrarPermisos(int permiso) {
        try {
        this.permisoDAO = PermisoDaoFactory.crear();
        permisoDAO.borrarPermisos(permiso);
    }catch (SQLException ex){
        System.out.println("No Borro el PERMISO: " + ex.getMessage());
    }
    }
    
    public void editarPermisos(Permisos p) {
        try {
            this.permisoDAO = PermisoDaoFactory.crear();
            permisoDAO.actualizarPermisos(p);
        } catch (SQLException ex) {
            System.out.println("No actualiza el PERMISO: " + ex.getMessage());
        }
    }

    
    public ArrayList<Permisos> listarPermisos(int usuario) {
      ArrayList<Permisos> list = null;
        try {
            this.permisoDAO = PermisoDaoFactory.crear();
            list = permisoDAO.listarUsuario(usuario);
        } catch (SQLException ex) {
            System.out.println("No Lista el PERMISO: " + ex.getMessage());
            return null;
        }
        return list;
    }

    public int ulPermiso() {
        int idper = 0;
       try{
           this.permisoDAO = PermisoDaoFactory.crear();
           idper = permisoDAO.ulPermisos();
       }catch (SQLException ex){
           System.out.println("No Tomo el ul el PERMISO: " + ex.getMessage());
       }
       return idper;
    }

   

    

    
    

    
}
