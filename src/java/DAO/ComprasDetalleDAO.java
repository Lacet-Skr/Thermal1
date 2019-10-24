/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Clase.ComprasDetalle;
import java.util.ArrayList;
import java.sql.SQLException;

public interface ComprasDetalleDAO {
    
    public void insertarComprasDetalle(ComprasDetalle cd) throws SQLException;
    
    public void actualizarComprasDetalle (ComprasDetalle cd) throws SQLException;
    
    public ComprasDetalle buscarComprasDetalle (int id) throws SQLException;
    
    public ArrayList<ComprasDetalle> listarComprasDetalle(String descripcion) throws SQLException;
    
}
