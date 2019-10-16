/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Clase.Menus;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author LACET
 */
public interface MenuDAO {
    public void insertarMenus(Menus m) throws SQLException;
    
    public void actualizarMenus(Menus m) throws SQLException;
    
    public Menus buscarMenus(int id) throws SQLException;
    
    public ArrayList<Menus> listarMenu(String menu) throws SQLException;
    
    public ArrayList<Menus> listar() throws SQLException;
}
