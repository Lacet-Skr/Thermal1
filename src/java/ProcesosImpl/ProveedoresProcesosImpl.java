/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProcesosImpl;

import Clase.Proveedores;
import java.util.ArrayList;
import Procesos.ProveedoresProcesos;
import DAO.ProveedoresDAO;
import java.sql.SQLException;
import DAO.Factory.ProveedoresDaoFactory;

public class ProveedoresProcesosImpl implements ProveedoresProcesos{
    
    private static ProveedoresProcesos proveedorprocesos;
    private ProveedoresDAO proveedorDAO;
    
    public static ProveedoresProcesos getInstancia(){
        if(proveedorprocesos==null){
            proveedorprocesos = new ProveedoresProcesosImpl();
        }
        return proveedorprocesos;
    }

    public void nuevoProveedor(Proveedores p) {
        try{
            this.proveedorDAO = ProveedoresDaoFactory.crear();
            proveedorDAO.insertarProveedor(p);
        }catch(SQLException ex){
            System.out.println("no inserto el proveedor"+ ex.getMessage());
        }
    }

    public void editarProveedor(Proveedores p) {
        try{
            this.proveedorDAO = ProveedoresDaoFactory.crear();
            proveedorDAO.actualizarProveedor(p);
        }catch (SQLException ex){
            System.out.println("no qactualizo el proveedor"+ ex.getMessage());
        }
    }

    public Proveedores buscarProveedor(int id) {
      Proveedores p = new Proveedores();
      try{
          this.proveedorDAO = ProveedoresDaoFactory.crear();
          p = proveedorDAO.buscarProveedor(id);
      }catch (SQLException ex){
          System.out.println("no encontro el proveedor"+ ex.getMessage());
      }
      return p;
    }

    public ArrayList<Proveedores> listarProveedor(String nombre) {
        ArrayList<Proveedores> list = null;
        try{
            this.proveedorDAO = ProveedoresDaoFactory.crear();
            list = proveedorDAO.listarNombre(nombre);
        }catch (SQLException ex){
            System.out.println("no listo el proveedor");
        }
        return list;
    }

    public ArrayList<Proveedores> listarProveedor2() {
           ArrayList<Proveedores> list = null;
        try{
            this.proveedorDAO = ProveedoresDaoFactory.crear();
            list = proveedorDAO.listar();
        }catch (SQLException ex){
            System.out.println("no listo el proveedor");
        }
        return list;
    }
    
}
