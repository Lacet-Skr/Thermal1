package Procesos;

import Clase.Cotizacion;
import java.util.ArrayList;

public interface CotizacionProcesos {
    
    public void nuevoCotizacion(Cotizacion c);
    
    public ArrayList<Cotizacion> listarCotizacion(String nombre);
    
    public ArrayList<Cotizacion> listarCotizacion1();
    
    public Cotizacion buscarCotizacion(int id);
    
    public void editarCotizacion(Cotizacion c);
    
}
