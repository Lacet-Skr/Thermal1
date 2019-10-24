package Procesos;

import Clase.Creditos;
import java.util.ArrayList;

public interface CreditoProcesos {
    
    public void nuevoCredito(Creditos d);
    
    public ArrayList<Creditos> listarCredito(String nombre);
    
    public ArrayList<Creditos> listarCredito2();
    
    public Creditos buscarCredito(int id);
    
    public void editarCredito(Creditos d);
    
}
