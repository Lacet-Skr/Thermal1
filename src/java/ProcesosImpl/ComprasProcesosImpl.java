/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProcesosImpl;

import Clase.Compras;
import Procesos.ComprasProcesos;
import java.util.ArrayList;
import java.sql.SQLException;
import DAO.ComprasDAO;
import DAO.Factory.ComprasDaoFactory;
        
public class ComprasProcesosImpl implements ComprasProcesos{
   private static ComprasProcesos comprasprocesos;
   private ComprasDAO comprasDAO;
   
   public static ComprasProcesos getInstancia(){
       if(comprasprocesos == null){
         comprasprocesos = new ComprasProcesosImpl();
       }
       return comprasprocesos;
   }
    
    public void nuevaCompra(Compras c) {
       try{
           this.comprasDAO = ComprasDaoFactory.crear();
           comprasDAO.insertarCompra(c);
       }catch(SQLException ex){
           System.out.println("no inserto"+ex.getMessage());
       }
    }

    public void editarCompra(Compras c) {
         try{
           this.comprasDAO = ComprasDaoFactory.crear();
           comprasDAO.actualizarCompra(c);
       }catch(SQLException ex){
           System.out.println("no inserto"+ex.getMessage());
       }
    }

    public Compras buscarCompra(int id) {
      Compras c = new Compras();
       try{
           this.comprasDAO = ComprasDaoFactory.crear();
           c = comprasDAO.buscarCompra(id);
       }catch(SQLException ex){
           System.out.println("no inserto"+ex.getMessage());
       }
       return c;
    }

  
    public ArrayList<Compras> listarCompra(String descripcion) {
        ArrayList<Compras> list = null;
         try{
           this.comprasDAO = ComprasDaoFactory.crear();
           list = comprasDAO.listarCompra(descripcion);
       }catch(SQLException ex){
           System.out.println("no inserto"+ex.getMessage());
       }
         return list;
    }
    
}
