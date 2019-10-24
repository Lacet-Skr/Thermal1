/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Clase.Proveedores;
import java.util.ArrayList;
import java.sql.SQLException;

public interface ProveedoresDAO {
    
    public void insertarProveedor(Proveedores p)throws SQLException;
   
    public void actualizarProveedor(Proveedores p) throws SQLException;

     public Proveedores buscarProveedor(int id) throws SQLException;
     
    public ArrayList<Proveedores> listarNombre(String nombre) throws SQLException;
    
      public ArrayList<Proveedores> listar()throws SQLException;
}
