/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Clase.Permisos;
import java.util.ArrayList;
/**
 *
 * @author LACET
 */
public interface PermisoProcesos {
    
    public void nuevoPermisos(Permisos p);
    
    public void borrarPermisos(int permiso);
    
    public ArrayList<Permisos> listarPermisos(int usuario);
    
    public ArrayList<Permisos> listarPermisos2();
    
    public Permisos buscarPermisos(int id);
    
    public void editarPermisos(Permisos p);
    
    public int ulPermiso();
}
