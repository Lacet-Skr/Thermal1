/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Factory;

import Datos.BDProveedores;
import DAO.ProveedoresDAO;

public class ProveedoresDaoFactory {
    public static ProveedoresDAO crear(){
        return new BDProveedores(); 
    }
    
}
