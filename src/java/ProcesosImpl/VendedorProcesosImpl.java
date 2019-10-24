package ProcesosImpl;

import Procesos.VendedorProcesos;
import DAO.VendedorDAO;
import Clase.Vendedores;
import DAO.Factory.ClienteDaoFactory;
import DAO.Factory.VendedorDaoFactory;
import java.sql.SQLException;
import java.util.ArrayList;

public class VendedorProcesosImpl implements VendedorProcesos{
    
    private static VendedorProcesos vendedorproceso;
    private VendedorDAO vendedorDAO;
    
    public static VendedorProcesos getInstatncia(){
        if (vendedorproceso == null){
            vendedorproceso = new VendedorProcesosImpl();
        }
        return vendedorproceso;
    }

    public void nuevoVendedor(Vendedores v) {
        try {
            this.vendedorDAO = VendedorDaoFactory.crear();
            vendedorDAO.insertarVendedor(v);            
        } catch (SQLException ex) {
            System.out.println("No inserta Vendedor: " + ex.getMessage());
        }
    }

    public ArrayList<Vendedores> listarVendedor(String nombre) {
        ArrayList<Vendedores> list = null;
        try {
            this.vendedorDAO = VendedorDaoFactory.crear();
            list = vendedorDAO.listarNombre(nombre);
        } catch (SQLException ex) {
            System.out.println("No lista Vendedor: " + ex.getMessage());
            return null;
        }
        return list;
    }

    public Vendedores buscarVendedor(int id) {
        Vendedores v = new Vendedores();
        try {
            this.vendedorDAO = VendedorDaoFactory.crear();
            v = vendedorDAO.buscarVendedor(id);
        } catch (SQLException ex) {
            System.out.println("No busca Vendedor: " + ex.getMessage());
            return null;
        }
        return v;
    }

    public void editarVendedor(Vendedores v) {
        try {
            this.vendedorDAO = VendedorDaoFactory.crear();
            vendedorDAO.actualizarVendedor(v);
        } catch (SQLException ex){
            System.out.println("No actualiza Vendedor: " + ex.getMessage());
        }
    }

    public ArrayList<Vendedores> listarVendedor2() {
       ArrayList<Vendedores> list = null;
       try {
           this.vendedorDAO = VendedorDaoFactory.crear();
           list = vendedorDAO.listar();
       } catch (SQLException ex){
           System.out.println("No lista Vendedor: " + ex.getMessage());
           return null;
       }
       return list;
    }      
}
