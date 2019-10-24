/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Factory;

import Datos.BDCompras;
import DAO.ComprasDAO;
public class ComprasDaoFactory {
    
    public static ComprasDAO crear(){
        return new BDCompras(); 
    }
    
}
