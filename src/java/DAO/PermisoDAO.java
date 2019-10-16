/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Clase.Permisos;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author LACET
 */
public interface PermisoDAO {
    public void insertarPermisos(Permisos p) throws SQLException;
    
    public void actualizarPermisos(Permisos p) throws SQLException;
    
     public void borrarPermisos(int permiso) throws SQLException;
    
    public Permisos buscarPermisos(int id) throws SQLException;
    
    public ArrayList<Permisos> listar() throws SQLException;
    
    public ArrayList<Permisos> listarUsuario(int usuario) throws SQLException;
    
    public int ulPermisos() throws SQLException;
}
