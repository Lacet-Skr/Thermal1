/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProcesosImpl;

import Procesos.MenuProcesos;
import DAO.MenuDAO;
import Clase.Menus;
import DAO.Factory.MenuDaoFactory;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author LACET
 */
public class MenuProcesosImpl implements MenuProcesos{

    private static MenuProcesos menuproceso;
    private MenuDAO menuDAO;
    
    public static MenuProcesos getInstancia(){
    if (menuproceso == null){
            menuproceso = new MenuProcesosImpl();
        }
        return menuproceso;  
    }
    
    public void nuevoMenu(Menus m) {
         try {
            this.menuDAO = MenuDaoFactory.crear();
            menuDAO.insertarMenus(m);
        } catch (SQLException ex) {
            System.out.println("No inserta el MENU: " + ex.getMessage());
        }
    }

    
    public ArrayList<Menus> listarMenu(String menu) {
         ArrayList<Menus> list = null;
        try {
            this.menuDAO = MenuDaoFactory.crear();
            list = menuDAO.listarMenu(menu);
        } catch (SQLException ex) {
            System.out.println("No Lista el MENU: " + ex.getMessage());
            return null;
        }
        return list;
    }

    
    public ArrayList<Menus> listarMenu2() {
        ArrayList<Menus> list = null;
        try {
            this.menuDAO = MenuDaoFactory.crear();
            list = menuDAO.listar();
        } catch (SQLException ex) {
            System.out.println("No Lista el MENU: " + ex.getMessage());
            return null;
        }
        return list;
    }

    
    public Menus buscarMenu(int id) {
        Menus m = new Menus();
        try {
            this.menuDAO = MenuDaoFactory.crear();
            m = menuDAO.buscarMenus(id);
        } catch (SQLException ex) {
            System.out.println("No Busca el MENU: " + ex.getMessage());
            return null;
        }
        return m;
    }
    
    

    
    public void editarMenu(Menus m) {
        try {
            this.menuDAO = MenuDaoFactory.crear();
            menuDAO.actualizarMenus(m);
        } catch (SQLException ex) {
            System.out.println("No actualiza el MENU: " + ex.getMessage());
        }
    }
    
}
