/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Clase.Usuarios;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author LACET
 */
public interface UsuarioDAO {
   
    public Usuarios login (Usuarios u) throws SQLException;
    
    public void insertarUsuarios(Usuarios u) throws SQLException;
    
    public void actualizarUsuarios(Usuarios u) throws SQLException;
    
    public Usuarios buscarUsuarios(int id) throws SQLException;
    
    public ArrayList<Usuarios> listarusuario(String usuario) throws SQLException;
    
    public ArrayList<Usuarios> listar() throws SQLException;
    
}
