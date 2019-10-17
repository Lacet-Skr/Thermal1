
package ProcesosImpl;

import Procesos.ProductoProcesos;
import DAO.ProductoDAO;
import Clase.Producto;
import DAOFactory.ProductoDAOFactory;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductoProcesosImpl implements ProductoProcesos{

    private static ProductoProcesos prodpro;
    private ProductoDAO prodDAO;
    
    public static ProductoProcesos getInstancia(){
    if(prodpro ==null){
        prodpro = new ProductoProcesosImpl();
        }
    return prodpro;
    }
    
    public void nuevoProducto(Producto p) {
        try{
            this.prodDAO = ProductoDAOFactory.crear();
            prodDAO.insertarProducto(p);
        }catch (SQLException ex){
            System.out.println("No iserto producto: " + ex.getMessage());
        }
    }

    public ArrayList<Producto> listarProducto(String producto) {
        ArrayList<Producto> list = null;
        try{
        this.prodDAO = ProductoDAOFactory.crear();
        list = prodDAO.listarProducto(producto);
        } catch (SQLException ex){
            System.out.println("No lista Producto: "+ ex.getMessage());
            return null;
        }
        return list;
    }

    public Producto buscarProducto(int id) {
        Producto p = new Producto();
        try{
        this.prodDAO = ProductoDAOFactory.crear();
        p = prodDAO.buscarProducto(id);
        }catch (SQLException ex){
        System.out.println("No busco Producto: "+ ex.getMessage());
        return null;
        }
        return p;
    }

    public void editarProducto(Producto p) {
        try{
        this.prodDAO = ProductoDAOFactory.crear();
        prodDAO.actualizarProducto(p);
        }catch (SQLException ex){
            System.out.println("No busco producto:"+ ex.getMessage());
        }
    }

    public ArrayList<Producto> listarProducto2() {
        ArrayList<Producto> list = null;
        try{
        this.prodDAO = ProductoDAOFactory.crear();
        list = prodDAO.listarProducto2();
        } catch (SQLException ex){
            System.out.println("No lista Producto: "+ ex.getMessage());
            return null;
        }
        return list;
    }
    
    
}
