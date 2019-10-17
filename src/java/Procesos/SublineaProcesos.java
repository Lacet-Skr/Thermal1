
package Procesos;

import Clase.Sublinea;
import java.util.ArrayList;

public interface SublineaProcesos {
    
    public void nuevoSublinea(Sublinea s);
       
    public ArrayList<Sublinea> listarSublinea(String descripcion);
    
    public Sublinea buscarSublinea(int id);
    
    public void editarSublinea(Sublinea s);
    
    public ArrayList<Sublinea>listarSublinea2();
    
    public ArrayList<Sublinea>listarSublineas3(int linea);
    
}
