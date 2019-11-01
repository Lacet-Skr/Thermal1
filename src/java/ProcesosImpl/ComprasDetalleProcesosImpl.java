/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProcesosImpl;

import Clase.ComprasDetalle;
import java.sql.SQLException;
import java.util.ArrayList;
import Procesos.ComprasDetalleProcesos;
import DAO.Factory.ComprasDetalleDaoFactory;
import DAO.ComprasDetalleDAO;

public class ComprasDetalleProcesosImpl implements ComprasDetalleProcesos{
    
    private static ComprasDetalleProcesos detalleproceso;
    private ComprasDetalleDAO detalleDAO;
    
    public static ComprasDetalleProcesos getInstancia(){
        if(detalleproceso == null){
            detalleproceso = new ComprasDetalleProcesosImpl();
        }
        return detalleproceso;
    }

    public void nuevaCompraDetalle(ComprasDetalle cd) {
        try{
            this.detalleDAO = ComprasDetalleDaoFactory.crear();
            detalleDAO.insertarComprasDetalle(cd);
        }catch(SQLException ex){
            System.out.println("no inserto"+ ex.getMessage());
        }
    }

    public void editarCompraDetalle(ComprasDetalle cd) {
        try{
            this.detalleDAO = ComprasDetalleDaoFactory.crear();
            detalleDAO.actualizarComprasDetalle(cd);
        }catch(SQLException ex){
            System.out.println("no actualizo"+ ex.getMessage());
        }
    }

    public ComprasDetalle buscarCompraDetalle(int id) {
        ComprasDetalle cd = new ComprasDetalle();
        try{
            this.detalleDAO = ComprasDetalleDaoFactory.crear();
            cd = detalleDAO.buscarComprasDetalle(id);
        }catch(SQLException ex){
            System.out.println("no busco"+ ex.getMessage());
        }
        return cd;
    }

    public ArrayList<ComprasDetalle> listarCompraDetalle(String descripcion) {
        ArrayList<ComprasDetalle> list = null;
        try{
            this.detalleDAO = ComprasDetalleDaoFactory.crear();
            list = detalleDAO.listarComprasDetalle(descripcion);
        }catch(SQLException ex){
            System.out.println("no listo"+ ex.getMessage());
        }
        return list;
    }
    
}
