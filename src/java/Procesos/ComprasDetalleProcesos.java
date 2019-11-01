/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Clase.ComprasDetalle;
import java.util.ArrayList;

public interface ComprasDetalleProcesos {
    
    public void nuevaCompraDetalle(ComprasDetalle cd);
    
    public void editarCompraDetalle(ComprasDetalle cd);
    
    public ComprasDetalle buscarCompraDetalle(int id);
    
    public ArrayList<ComprasDetalle> listarCompraDetalle(String descripcion);
    
}
