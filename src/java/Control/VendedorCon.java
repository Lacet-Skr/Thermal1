
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.Vendedores;
import Procesos.VendedorProcesos;
import ProcesosImpl.VendedorProcesosImpl;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;

public class VendedorCon {
    private static VendedorProcesos vendedorpro=VendedorProcesosImpl.getInstatncia();
    
    public  void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevoVendedor(request, response);
        }else if("editar".equals(evento)){
            this.editarVendedor(request, response);
        }else if("buscar".equals(evento)){
            this.buscarVendedor(request, response);
        }
    }

    private void nuevoVendedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Vendedores v = new Vendedores ();
        v.setIdvendedor(Integer.parseInt(request.getParameter("idvendedor")));
        v.setNombrevendedor(request.getParameter("nombre"));
        vendedorpro.nuevoVendedor(v);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void editarVendedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Vendedores v = new Vendedores ();
        v.setIdvendedor(Integer.parseInt(request.getParameter("idvendedor")));
        v.setNombrevendedor(request.getParameter("nombre"));
        vendedorpro.editarVendedor(v);
        response.sendRedirect("index.jsp");
    }

    private void buscarVendedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("par"));
        Vendedores v = vendedorpro.buscarVendedor(id);
        request.setAttribute("vendedor", v);
        request.setAttribute("evento", "editar");
        request.getRequestDispatcher("vendedores.jsp").forward(request, response);
    }
    public static ArrayList<Vendedores>listarVendedor(String nombre) throws ServletException, IOException{
        ArrayList<Vendedores>list = vendedorpro.listarVendedor(nombre);
        return list;
    }
    public static ArrayList<Vendedores>listarVendedor2() throws ServletException, IOException{
        ArrayList<Vendedores>list = vendedorpro.listarVendedor2();
        return list;
    }    
}
