
package Procesos;

import Clase.Linea;
import java.util.ArrayList;

public interface LineaProcesos {
        
    public void nuevoLinea(Linea l);
    
    public ArrayList<Linea> listarLinea(String descripcion);
    
    public Linea buscarLinea(int id);
    
    public void editarLinea(Linea l);
    
    public ArrayList<Linea> listarLinea2();
    
}
