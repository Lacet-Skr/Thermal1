/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import java.util.ArrayList;
import Clase.Compras;

public interface ComprasProcesos {
 
    public void nuevaCompra (Compras c);
    
    public void editarCompra (Compras c);
    
    public Compras buscarCompra(int id);
    
    public ArrayList<Compras> listarCompra(String descripcion);
    
    
    
    
    
    
    
}
