/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Factory;

import Datos.BDMenu;
import DAO.MenuDAO;
/**
 *
 * @author LACET
 */
public class MenuDaoFactory {
    
    public static MenuDAO crear(){
        return new BDMenu();
    }
}
