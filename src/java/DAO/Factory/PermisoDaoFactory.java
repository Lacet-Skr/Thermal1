/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Factory;

import Datos.BDPermiso;
import DAO.PermisoDAO;
/**
 *
 * @author LACET
 */
public class PermisoDaoFactory {
    
    public static PermisoDAO crear(){
        return new BDPermiso();
    }
}
