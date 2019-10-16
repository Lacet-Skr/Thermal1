/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Clase.Menus;
import java.util.ArrayList;
/**
 *
 * @author LACET
 */
public interface MenuProcesos {
    
    public void nuevoMenu(Menus m);
    
    public ArrayList<Menus> listarMenu(String nombre);
    
    public ArrayList<Menus> listarMenu2();
    
    public Menus buscarMenu(int id);
    
    public void editarMenu(Menus m);
}
