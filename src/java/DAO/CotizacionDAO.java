package DAO;

import Clase.Cotizacion;
import java.sql.SQLException;
import java.util.ArrayList;

public interface CotizacionDAO {
        
    public void insertarCotizacion(Cotizacion c) throws SQLException;
    
    public void actualizarCotizacion(Cotizacion c) throws SQLException;
    
    public Cotizacion buscarCotizacion(int id) throws SQLException;
    
    public ArrayList<Cotizacion> listarNombre(String nombre) throws SQLException;
    
    public ArrayList<Cotizacion> listar() throws SQLException;
}
