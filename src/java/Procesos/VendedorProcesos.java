package Procesos;

import Clase.Vendedores;
import java.util.ArrayList;

public interface VendedorProcesos {
    
    public void nuevoVendedor(Vendedores v);
    
    public ArrayList<Vendedores> listarVendedor(String nombre);
    
    public ArrayList<Vendedores> listarVendedor2();
    
    public Vendedores buscarVendedor(int id);
    
    public void editarVendedor(Vendedores v);
    
}
