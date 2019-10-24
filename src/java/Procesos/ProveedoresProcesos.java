/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;
import Clase.Proveedores;
import java.util.ArrayList;

public interface ProveedoresProcesos {
    
    public void nuevoProveedor(Proveedores p);
    
    public void editarProveedor(Proveedores p);
    
    public Proveedores buscarProveedor(int id);
    
    public ArrayList<Proveedores> listarProveedor(String nombre);
    
    public ArrayList<Proveedores> listarProveedor2();
    
    
}
