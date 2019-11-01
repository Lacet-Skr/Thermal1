/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Factory;

import DAO.ComprasDetalleDAO;
import Datos.BDComprasDetalle;

public class ComprasDetalleDaoFactory {
    
    public static ComprasDetalleDAO crear(){
        return new BDComprasDetalle();
    }
    
}
