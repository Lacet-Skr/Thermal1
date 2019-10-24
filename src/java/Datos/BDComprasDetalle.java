/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;
import java.util.ArrayList;
import Clase.ComprasDetalle;
import DAO.ComprasDetalleDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

public class BDComprasDetalle implements ComprasDetalleDAO{
    
    protected static String SQL_SELECT = "SELECT idcomprasdetalle, compra, fechacomprasdetalle, productocompras, cantidadcompras, costocompras FROM comprasdetalle";
    
    protected static String SQL_INSERT = "INSERT INTO comprasdetalle(idcomprasdetalle, compra, fechacomprasdetalle, productocompras, cantidadcompras, costocompras) VALUES (?,?,?,?,?,?)";
    
    protected static String SQL_UPDATE = "UPDATE comprasdetalle SET compra = ?, fechacomprasdetalle = ?, productocompras = ?, cantidadcompras = ?, costocompras = ? WHERE idcomprasdetalle = ?";

    public void insertarComprasDetalle(ComprasDetalle cd) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actualizarComprasDetalle(ComprasDetalle cd) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ComprasDetalle buscarComprasDetalle(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<ComprasDetalle> listarComprasDetalle(String descripcion) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
