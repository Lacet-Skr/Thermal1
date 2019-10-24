/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import java.sql.SQLException;
import Clase.Compras;
public interface ComprasDAO {
    
    public void insertarCompra(Compras c) throws SQLException;
    
    public void actualizarCompra (Compras c) throws SQLException;
    
    public Compras buscarCompra(int id) throws SQLException;
    
    public ArrayList<Compras> listarCompra(String descripcion) throws SQLException;
    
}
